unit UnitSal15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, TntDBGrids, ExtCtrls, TntExtCtrls, StdCtrls,
  TntStdCtrls, Buttons, TntButtons, DB, ADODB, ComObj, ExcelXP;

type
  TFormSal15 = class(TForm)
    TntPanel1: TTntPanel;
    TntDBGrid1: TTntDBGrid;
    TntLabel1: TTntLabel;
    EditMonth: TTntEdit;
    BtnSearch: TTntBitBtn;
    QrySearch: TADOQuery;
    DataSource1: TDataSource;
    btnCalc: TTntBitBtn;
    QrySearchDEPT_CODE: TStringField;
    QrySearchABBR_TITL: TWideStringField;
    QrySearchVIM_TITL: TWideStringField;
    QrySearchEMP_ID: TStringField;
    QrySearchEMP_CHS: TWideStringField;
    QrySearchNAME_VIM: TWideStringField;
    QrySearchEPINDT: TDateTimeField;
    QrySearchEPLEDT: TDateTimeField;
    QrySearchPST_CODE: TStringField;
    QrySearchPST_CHS: TWideStringField;
    QrySearchPST_VIM: TWideStringField;
    QrySearchPAY_MON: TWideStringField;
    QrySearchBASE_PAY: TBCDField;
    QrySearchCARD_NO: TStringField;
    QrySearchDAYS: TFloatField;
    QrySave: TADOQuery;
    btnExcel: TTntBitBtn;
    lblInfo: TTntLabel;
    ADOQuery1: TADOQuery;
    cb2017: TTntCheckBox;
    mmInfo: TTntMemo;
    TntBitBtn1: TTntBitBtn;
    rbAll: TTntRadioButton;
    rbXianjin: TTntRadioButton;
    rbBank: TTntRadioButton;
    procedure BtnSearchClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TntBitBtn1Click(Sender: TObject);
  private
    //
    procedure DealPay(const AMonth: string);
    //
    procedure ExportDataToExcel;
    //
    function GetEpindt(AEmpID: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal15: TFormSal15;

implementation

uses UnitDMHrdsys, UnitHrdUtils, prtSal15;

{$R *.dfm}

procedure TFormSal15.BtnSearchClick(Sender: TObject);
var
  sSQL: string;
begin
  btnExcel.Enabled := False;
  //
  sSQL := 'SELECT B.DEPT_CODE,'
        + '       C.ABBR_TITL,'
        + '       C.VIM_TITL,'
        + '       B.EMP_ID,'
        + '       B.EMP_CHS,'
        + '       B.NAME_VIM,'
        + '       B.EPINDT,'
        + '       B.EPLEDT,'
        + '       B.PST_CODE,'
        + '       D.PST_CHS,'
        + '       D.PST_VIM,'
        + '       A.PAY_MON,'
        + '       A.DAYS,'  
        + '       A.BASE_PAY,'
        + '       (SELECT E.CARD_NO FROM HRD_SAL_BANKCARD E WHERE A.EMP_ID = E.EMP_ID) AS CARD_NO'
        + '  FROM HRD_SAL_PAYMT_HALF A, HRD_EMP B, HRD_DEPT C, HRD_PROF D'
        + ' WHERE A.EMP_ID = B.EMP_ID'
        + '   AND B.DEPT_CODE = C.DEPT_CODE'
        + '   AND B.PST_CODE = D.PST_CODE'
        + '   AND A.PAY_MON = '+QuotedStr(EditMonth.Text);
  //
  if cb2017.Checked then
     sSQL := sSQL + ' AND NOT EXISTS(SELECT * FROM hrd_year_end_bonus E WHERE E.R_YEAR=''2016'' AND A.EMP_ID=E.EMP_ID)';

//
  if rbXianjin.Checked then
    sSQL := sSQL + ' AND NOT EXISTS(SELECT * FROM HRD_SAL_BANKCARD F WHERE A.EMP_ID = F.EMP_ID)'
  else if rbBank.Checked then
    sSQL := sSQL + ' AND EXISTS(SELECT * FROM HRD_SAL_BANKCARD F WHERE A.EMP_ID = F.EMP_ID)';
  //                                               
  sSQL := sSQL + ' ORDER BY B.DEPT_CODE, B.EMP_ID';
  //
  with QrySearch do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    if IsEmpty then
    begin
      ShowMessage('沒有符合條件的資料！');
      Close;
    end
    else begin
      btnExcel.Enabled := True;
      lblInfo.Caption := '共 '+ IntToStr(RecordCount)+' 筆';
    end;
  end;
end;

procedure TFormSal15.DealPay(const AMonth: string);
var
  sSQL, sEmpID, sFieldName: string;
  //
  I: Integer;
  //
  EMPList: TStringList;
  //
  dHours, dMoney: Double;
begin
  //
  EMPList:= TStringList.Create;
  try 
    //
    sSQL := 'SELECT *'
          + '  FROM HRD_DUT_MON A'
          + ' WHERE A.DUT_MON = '+QuotedStr(AMonth)
          + '   AND A.CLAS_CODE IN (''61'', ''62'', ''63'')'
          + '   AND EXISTS(SELECT * FROM HRD_EMP B WHERE A.EMP_ID = B.EMP_ID AND (B.EPLEDT IS NULL OR B.EPLEDT > ''2017/01/11''))'
          + ' ORDER BY A.EMP_ID, A.CLAS_CODE';
    with DMHrdsys.SQLQuery4 do
    begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Open;
      //
      while not Eof do
      begin
        sEmpID := FieldByName('emp_id').AsString;
        if sEmpID= '080106' then
        begin
          Next;
          Continue;
        end;

        dHours := 0;
        for I:= 1 to 10 do
        begin
          sFieldName := Format('day%.2d', [I]);
          if not FieldByName(sFieldName).IsNull then
          begin
            dHours := dHours + StrToIntDef(Copy(FieldByName(sFieldName).AsString, 1, 2), 0) + StrToIntDef(Copy(FieldByName(sFieldName).AsString, 3, 2), 0)/60;
          end;
        end;
        //
        if dHours > 0 then
        begin
          if EMPList.IndexOfName(sEmpID)= -1 then
            EMPList.Append(sEmpID+'='+FloatToStr(dHours))
          else
            EMPList.Values[sEmpID] := FloatToStr(StrToFloatDef(EMPList.Values[sEmpID], 0)+ dHours);
        end;
        //
        Next;
      end;
      //
      Close;
    end;    
    //刪除已有的資料，重新計算
    QrySave.Close;
    QrySave.SQL.Clear;
    QrySave.SQL.Add('delete from hrd_sal_paymt_half where pay_mon = '+QuotedStr(AMonth));
    QrySave.ExecSQL; 
    //
    QrySave.Close;
    QrySave.SQL.Clear;
    QrySave.SQL.Add('select * from hrd_sal_paymt_half where 1=2');
    QrySave.Open;
    //
    SetProcessBar(True, 1, EMPList.Count, 0);
    for I:= 0 to EMPList.Count -  1 do
    begin
      dHours := StrToFloatDef(EMPList.ValueFromIndex[I], 0);
      //
      sEmpID := EMPList.Names[I];
      //
      dHours := dHours/8;
      //2017.01.10  1號元旦，統一增加一天
      if GetEpindt(sEmpID)<= '2017/01/01' then
        dHours := dHours + 1;
      //
      if dHours <= 0 then Continue;
      //
      if dHours <= 0 then
        dMoney := 0
      else if dHours < 3 then
        dMoney := 1000000
      else if dHours < 5 then
        dMoney := 1500000
      else dMoney := 2000000;
      //
      QrySave.Append;
      QrySave.FieldByName('upd_user').AsString := UserName;
      QrySave.FieldByName('upd_date').AsDateTime := GetServerDateTime;
      QrySave.FieldByName('emp_id').AsString := sEmpID;
      QrySave.FieldByName('pay_mon').AsString := AMonth;
      QrySave.FieldByName('days').AsFloat := dHours;
      QrySave.FieldByName('base_pay').AsFloat := dMoney;
      QrySave.Post;
      //
      SetProcessBar(False, 1, EMPList.Count, 0);
    end;
    //
    QrySave.UpdateBatch();
  finally
    EMPList.Free;
  end;
end;

procedure TFormSal15.btnCalcClick(Sender: TObject);
begin
  if EditMonth.Text<> '201701' then Exit;
  //
  if MessageBox(Handle, '確定要重新計算嗎？', '提示信息', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2)= IDNO then Exit;
  //
  DealPay(EditMonth.Text); 
end;

procedure TFormSal15.btnExcelClick(Sender: TObject);
begin
  //
  if (not QrySearch.Active) or (QrySearch.IsEmpty) then Exit;
  //
  ExportDataToExcel;
end;

//
procedure TFormSal15.ExportDataToExcel;
var
  MyExcel: Variant;
  I, iCol, iRow: Integer;
begin
  try
    MyExcel := CreateOleObject('Excel.Application');
    MyExcel.WorkBooks.Add;
  except
    ShowMessage('創建Excel文件失敗！');
    Exit;
  end;
  //
  MyExcel.Visible := False;
  try
    iRow := 1;
    MyExcel.Cells[iRow, 1] := '2017年01月 預計薪資明細表';
    Inc(iRow);
    for I := 0 to QrySearch.FieldCount- 1 do
    begin
      MyExcel.Cells[iRow, I + 1] := QrySearch.Fields[I].DisplayLabel;
    end;

    MyExcel.Columns[15].NumberFormatLocal:= '@ ';
    //
    iCol := QrySearch.FieldCount;
    //
    QrySearch.First;
    while not QrySearch.Eof do
    begin
      Inc(iRow);
      for I := 0 to QrySearch.FieldCount- 1 do
      begin
        MyExcel.Cells[iRow, I + 1] := QrySearch.Fields[I].Value;
      end;
      //
      QrySearch.Next;
    end;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[1, iCol]].MergeCells:= True;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[1, iCol]].Font.Size:= 18;
    MyExcel.Range[MyExcel.Cells.Item[2, 1], MyExcel.Cells.Item[2, iCol]].Font.Size:= 12;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, iCol]].Font.Bold:= True;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, iCol]].HorizontalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, iCol]].VerticalAlignment := xlCenter;
    //
    MyExcel.Range[MyExcel.Cells.Item[3, 1], MyExcel.Cells.Item[iRow, iCol]].Font.Size:= 9;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[iRow, iCol]].Borders.LineStyle:= xlContinuous;
    MyExcel.Cells.EntireColumn.AutoFit;

  finally
    MyExcel.Visible := True;
  end;
end;

procedure TFormSal15.FormCreate(Sender: TObject);
begin
  btnExcel.Enabled := False;
  btnCalc.Enabled := False;// UserName = 'B498077';

  //
  Application.CreateForm(TFormPrtSal15, FormPrtSal15);
end;

function TFormSal15.GetEpindt(AEmpID: string): string;
var
  sSQL: string;
begin
  Result := '';
  //
  sSQL := 'SELECT EPINDT FROM HRD_EMP WHERE EMP_ID = '+QuotedStr(AEmpID);
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    Result := FormatDateTime('YYYY/MM/DD', FieldByName('EPINDT').AsDateTime);
    Close;
  end;
end;

procedure TFormSal15.TntBitBtn1Click(Sender: TObject);
begin
  with FormPrtSal15 do
  begin
    qrlblEmpID.Caption := mmInfo.Lines.Strings[0];
    qrlblEmpName.Caption := mmInfo.Lines.Strings[1];
    qrlblDept.Caption := mmInfo.Lines.Strings[2];
    qrlblEpindt.Caption := mmInfo.Lines.Strings[3];
    qrlblYuzhi.Caption := mmInfo.Lines.Strings[4];
    qrlblTitle.Caption := mmInfo.Lines.Strings[5];
    QuickRep1.Preview;
  end;
end;

end.
