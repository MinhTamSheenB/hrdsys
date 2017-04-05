unit UnitSal37;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils,
  ComObj, ExcelXP, DBClient, Math;
type
  //
  TFormSal37 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    PanelQuery: TPanel;
    PanelGrid: TPanel;
    dbgLabor: TTntDBGrid;
    DataSource1: TDataSource;
    TntGroupBox1: TTntGroupBox;
    Btn_Search: TTntBitBtn;
    btnExcel: TTntBitBtn;
    cdsLabor: TClientDataSet;
    cdsLaborPPH_Detail: TStringField;
    cdsLaborHeadcount: TIntegerField;
    cdsLaborWorking_Hours: TFloatField;
    cdsLaborOvertime_Hours: TFloatField;
    TntLabel1: TTntLabel;
    EditMonth: TTntEdit;
    cdsLaborSALARY: TFloatField;
    cdsLaborOVER_TIME: TFloatField;
    cdsLaborBONUS: TFloatField;
    mmoSQL: TMemo;
    cdsLaborBENEFITS: TFloatField;
    cdsLaborINSURANCE: TFloatField;
    cdsLaborMONTH: TStringField;
    cdsLaborCURRENCY: TStringField;
    cdsLaborCos_ID: TStringField;
    cdsLaborNZJ: TFloatField;
    cdsLaborEFFT_AWD: TFloatField;
    cdsLaborFactory22: TFloatField;
    cdsLaborunion2: TFloatField;
    cdsLaborLEAV_PAY: TFloatField;
    cdsLaborTAXES_GR: TFloatField;
    cdsLaborPICC105: TFloatField;
    cdsLaborYICARD_DEDU: TFloatField;
    cdsLaborDUOXIU_KOUKUAN: TFloatField;
    cdsLaborBKBX: TFloatField;
    cdsLaborLAUN_PAY: TFloatField;
    cdsLaborAXJJ: TFloatField;
    cdsLaborACTU_PAY: TFloatField;
    cdsLaborDEAL_PAY: TFloatField;
    cdsLaborLAST_ADDITION: TFloatField;
    cdsLaborPICC_BACK: TFloatField;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure InitLang;
    procedure Btn_SearchClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure cdsLaborCalcFields(DataSet: TDataSet);
  private
    //轉Excel
    procedure ExportDataToExcel;
    //
    procedure DealData;
    //正常工時
    function GetNormalHours(PayMonth, DeptCode, PstCode: string): Double;
    //成本代號
    function GetCosID(DeptCode: string): string;
    //
    function GetLaborType(DeptCode, PstCode: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal37: TFormSal37;

implementation
uses
  UnitHrdUtils, UnitHrdMain, UnitDMHrdsys;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  dFlag :string ;
{$R *.dfm}
procedure TFormSal37.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'sal37');//Get privilege
  dFlag := '0' ;
  //
  EditMonth.Text := FormatDateTime('YYYYMM', Date - 10);
end;
procedure TFormSal37.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
  //
  SetComponentLang(self);//set component language text
  keys:='vietnam_chingluh_company,hrd67_titl,total,current_location,'
    +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
    +'not_find_data,with_star_cannot_empty,msg_post_record_on_close,'
    +'sex_man,sex_woman,all_emp,undirect_emp,direct_emp,hrd66_1,hrd66_2,'
    +'hrd66_3,hrd66_4,hrd66_5,hrd66_6,hrd66_7,hrd66_8,hrd66_9,hrd66_10,hrd66_11,hrd66_12,hrd66_13,hrd66_14';
  LangC:=GetLangWideStrs(keys,'C');
  LangE:=GetLangWideStrs(keys,'E');
  LangV:=GetLangWideStrs(keys,'V');
  if userlang='V' then
    LangStr:=LangV
  else if userlang='E' then
    LangStr:=LangE
  else
    LangStr:=LangC;
end;

procedure TFormSal37.Btn_SearchClick(Sender: TObject);
begin
  dbgLabor.Enabled := False;
  try
    DealData;
  finally
    dbgLabor.Enabled := True;
  end;
end;

//轉Excel
procedure TFormSal37.ExportDataToExcel;
var
  MyExcel       : Variant;
  //
  iRow, I, iCol : Integer;
begin
  //
  try
    MyExcel:= CreateOleObject('Excel.Application');
    MyExcel.WorkBooks.Add;
  except
    ShowMessage('Unable to create the excel file');
    Exit;
  end;
  //
  MyExcel.Visible:= False;
  //
  try
    //
    iRow:= 1;
    //
    iCol := dbgLabor.FieldCount;
    //
    MyExcel.Cells[iRow, 1]:= 'Labor type V2-'+EditMonth.Text;
    //
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, iCol]].MergeCells:= True;
    //
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, iCol]].Font.Size:= 16;
    //
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow+ 1, iCol]].Font.Bold:= True;
    //
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow+ 1, iCol]].HorizontalAlignment:= xlCenter;
    //
    MyExcel.Range[MyExcel.Cells.Item[iRow , 1], MyExcel.Cells.Item[iRow+ 1, iCol]].VerticalAlignment:= xlCenter;
    //
    Inc(iRow);
    //
    for I:= 0 to cdsLabor.FieldCount- 1 do
    begin
      MyExcel.Cells[iRow, I + 1]:= cdsLabor.Fields[I].DisplayLabel;
    end;
    //
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, iCol]].Font.Size:= 10;
    //
    cdsLabor.First;
    while not cdsLabor.Eof do
    begin
      //
      Inc(iRow);
      //
      for I:= 0 to dbgLabor.Columns.Count- 1 do
        MyExcel.Cells[iRow, I + 1]:= cdsLabor.Fields[I].Value;
      //
      cdsLabor.Next;
    end;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[iRow, iCol]].Borders.LineStyle:= xlContinuous;
    MyExcel.Range[MyExcel.Cells.Item[3, 9], MyExcel.Cells.Item[iRow, iCol]].NumberFormatLocal := '_-* #,##0_-;-* #,##0_-;_-* ""-""??_-;_-@_-';
    //
    MyExcel.Range[MyExcel.Cells.Item[3, 1], MyExcel.Cells.Item[iRow, iCol]].Font.Size:= 9;
    //
    MyExcel.Cells.EntireColumn.AutoFit;
  finally
    MyExcel.Visible:= True;
  end;
end;

procedure TFormSal37.BtnExcelClick(Sender: TObject);
begin
  //
  ExportDataToExcel;
end;

procedure TFormSal37.DealData;
var
  sSQL, sDept, sPst, sCosID, sLaborType: string;
  //
  DeptList: TStringList;
  //
  fSum: Double;
begin
  DeptList:= TStringList.Create;
  try
    sSQL := 'SELECT DEPT_CODE, DEPT_TITL, VIM_TITL, ENG_TITL'
          + '  FROM HRD_DEPT A'
          + ' WHERE (A.PPH_TYPE IS NULL OR A.PROD_LINE IS NULL)'
          + '   AND EXISTS (SELECT *'
          + '          FROM HRD_SAL_PAYMT B'
          + '         WHERE B.PAY_MON = '+QuotedStr(EditMonth.Text)
          + '           AND A.DEPT_CODE = B.DEPT_CODE)';
    with DMHrdsys.SQLQuery4 do
    begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Open;
      while not Eof do
      begin
        DeptList.Append(FieldByName('DEPT_CODE').Value);
        Next;
      end;
      //
      Close;
    end;
    //
    if DeptList.Count > 0 then
    begin
      ShowMessage('以下部門沒有設置，請聯繫HR'+#13#10+DeptList.Text);
      Exit;
    end;
  finally
    DeptList.Free;
  end;
  //
  sSQL := Format(mmoSQL.Text, [EditMonth.Text]);
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    if IsEmpty then
    begin
      ShowMessage('沒有符合條件的資料！');
      Close;
      Exit;
    end;
    cdsLabor.IndexFieldNames := '';
    //
    if not cdsLabor.Active then
      cdsLabor.CreateDataSet
    else
      cdsLabor.EmptyDataSet;
    //
    SetProcessBar(True , 1, RecordCount);
    //    
    First;
    while not Eof do
    begin
      SetProcessBar(False);
      //
      Application.ProcessMessages;
      //
      sDept := FieldByName('DEPT_CODE').AsString;
      sPst  := FieldByName('POSITION_CODE').AsString;
      sCosID:= GetCosID(sDept);
      sLaborType := GetLaborType(sDept, sPst);
      //
      if cdsLabor.Locate('Cos_ID;PPH_Detail', VarArrayOf([sCosID, sLaborType]), []) then
        cdsLabor.Edit
      else begin
        //
        cdsLabor.Append;
        cdsLabor.FieldByName('MONTH').AsString := EditMonth.Text;
        cdsLabor.FieldByName('CURRENCY').AsString := 'VND';
        cdsLabor.FieldByName('Cos_ID').AsString := sCosID;
        cdsLabor.FieldByName('PPH_Detail').AsString := sLaborType;
      end;
      cdsLabor.FieldByName('Headcount').AsFloat       := cdsLabor.FieldByName('Headcount').AsFloat + FieldByName('HEADCOUNT').AsFloat;
      cdsLabor.FieldByName('Working_Hours').AsFloat   := cdsLabor.FieldByName('Working_Hours').AsFloat + GetNormalHours(EditMonth.Text, sDept, sPst);
      cdsLabor.FieldByName('Overtime_Hours').AsFloat  := cdsLabor.FieldByName('Overtime_Hours').AsFloat + FieldByName('OVERTIME_HOURS').AsFloat;
      cdsLabor.FieldByName('BASE_SALARY').AsFloat     := cdsLabor.FieldByName('BASE_SALARY').AsFloat + FieldByName('BASE_SALARY').AsFloat;
      cdsLabor.FieldByName('OVERTIME_SALARY').AsFloat := cdsLabor.FieldByName('OVERTIME_SALARY').AsFloat + FieldByName('OVERTIME_SALARY').AsFloat;
      cdsLabor.FieldByName('BENEFITS').AsFloat        := cdsLabor.FieldByName('BENEFITS').AsFloat + FieldByName('BENEFITS').AsFloat;
      cdsLabor.FieldByName('BONUS').AsFloat           := cdsLabor.FieldByName('BONUS').AsFloat + FieldByName('Bonuses').AsFloat;
      cdsLabor.FieldByName('NZJ').AsFloat             := cdsLabor.FieldByName('NZJ').AsFloat + FieldByName('NZJJ').AsFloat;
      cdsLabor.FieldByName('EFFT_AWD').AsFloat        := cdsLabor.FieldByName('EFFT_AWD').AsFloat + FieldByName('EFFT_AWD').AsFloat;
      cdsLabor.FieldByName('INSURANCE').AsFloat       := cdsLabor.FieldByName('INSURANCE').AsFloat + FieldByName('INSURANCE').AsFloat;
      cdsLabor.FieldByName('Factory22').AsFloat       := cdsLabor.FieldByName('Factory22').AsFloat + FieldByName('FACTORY22').AsFloat;
      cdsLabor.FieldByName('union2').AsFloat          := cdsLabor.FieldByName('union2').AsFloat + FieldByName('UNION2').AsFloat;
      //2016.07.13
      cdsLabor.FieldByName('PICC_BACK').AsFloat       := cdsLabor.FieldByName('PICC_BACK').AsFloat + FieldByName('PICC_BACK').AsFloat;
      //
      cdsLabor.FieldByName('LEAV_PAY').AsFloat        := cdsLabor.FieldByName('LEAV_PAY').AsFloat + FieldByName('LEAV_PAY').AsFloat;
      cdsLabor.FieldByName('TAXES_GR').AsFloat        := cdsLabor.FieldByName('TAXES_GR').AsFloat + FieldByName('TAX_PAY').AsFloat;
      cdsLabor.FieldByName('PICC105').AsFloat         := cdsLabor.FieldByName('PICC105').AsFloat + FieldByName('PICC10').AsFloat;
      cdsLabor.FieldByName('YICARD_DEDU').AsFloat     := cdsLabor.FieldByName('YICARD_DEDU').AsFloat + FieldByName('YICARD_DEDU').AsFloat;
      cdsLabor.FieldByName('DUOXIU_KOUKUAN').AsFloat  := cdsLabor.FieldByName('DUOXIU_KOUKUAN').AsFloat + FieldByName('DUOXIU_KOUKUAN').AsFloat;
      cdsLabor.FieldByName('LAUN_PAY').AsFloat        := cdsLabor.FieldByName('LAUN_PAY').AsFloat + FieldByName('LAUN_PAY').AsFloat;
      cdsLabor.FieldByName('DEAL_PAY').AsFloat        := cdsLabor.FieldByName('DEAL_PAY').AsFloat + FieldByName('DEAL_PAY').AsFloat;
      cdsLabor.FieldByName('ACTU_PAY').AsFloat        := cdsLabor.FieldByName('ACTU_PAY').AsFloat + FieldByName('ACTU_PAY').AsFloat;
      cdsLabor.FieldByName('LAST_ADDITION').AsFloat   := cdsLabor.FieldByName('LAST_ADDITION').AsFloat + FieldByName('LAST_ADDITION').AsFloat;

      cdsLabor.FieldByName('BKBX').AsFloat   := cdsLabor.FieldByName('BKBX').AsFloat + FieldByName('BUKOUBAOXIAN').AsFloat;


      //
      fSum := 0;
      fSum := FieldByName('BASE_SALARY').AsFloat +
              FieldByName('OVERTIME_SALARY').AsFloat +
              FieldByName('BENEFITS').AsFloat +
              FieldByName('EFFT_AWD').AsFloat +
              FieldByName('PICC_BACK').AsFloat +
              FieldByName('LEAV_PAY').AsFloat -
              FieldByName('BUKOUBAOXIAN').AsFloat -
              FieldByName('TAX_PAY').AsFloat -
              FieldByName('PICC10').AsFloat -
              FieldByName('YICARD_DEDU').AsFloat -
              FieldByName('LAUN_PAY').AsFloat;
      fSum := FieldByName('ACTU_PAY').AsFloat - fSum;

      //
      if EditMonth.Text >= '201607' then
      begin
        if fSum > FieldByName('DUOXIU_KOUKUAN').AsFloat then
          fSum := FieldByName('DUOXIU_KOUKUAN').AsFloat;
      end;
      //

      if fSum > 0 then
      begin
        // ShowMessage('hELLO');
        Memo1.Lines.Append(sDept+'  '+sPst+' '+FloatToStr(fSum));
      end;

      //
      cdsLabor.FieldByName('BASE_SALARY').AsFloat := cdsLabor.FieldByName('BASE_SALARY').AsFloat + fSum;
      cdsLabor.FieldByName('DUOXIU_KOUKUAN').AsFloat := cdsLabor.FieldByName('DUOXIU_KOUKUAN').AsFloat - fSum;

      cdsLabor.Post;
      Next;
    end;
    Close;
  end;
  //
  cdsLabor.IndexFieldNames := 'Cos_ID;PPH_Detail';
  cdsLabor.First;
end;

function TFormSal37.GetNormalHours(PayMonth, DeptCode, PstCode: string): Double;
var
  sSQL, sFieldName, sHour: string;
  //
  I : Integer;
begin
  //
  Result := 0;
  //
  sSQL := 'SELECT *'
        + '  FROM HRD_DUT_MON A'
        + ' WHERE EXISTS (SELECT *'
        + '          FROM HRD_SAL_PAYMT B'
        + '         WHERE A.DUT_MON = B.PAY_MON'
        + '           AND A.EMP_ID = B.EMP_ID'
        + '           AND B.PAY_MON = '+QuotedStr(PayMonth)
        + '           AND B.DEPT_CODE = '+QuotedStr(DeptCode)
        + '           AND EXISTS (SELECT *'
        + '                  FROM HRD_PROF C'
        + '                 WHERE B.PST_CODE = C.PST_CODE'
        + '                   AND C.POSITION_CODE = '+QuotedStr(PstCode)+'))'
        + '   AND A.DUT_MON = '+QuotedStr(PayMonth)
        + '   AND (CLAS_CODE = ''61'' OR CLAS_CODE = ''62'' OR CLAS_CODE = ''63'' OR'
        + '       CLAS_CODE = ''6C'' OR CLAS_CODE = ''6D'' OR CLAS_CODE = ''6A'' OR'
        + '       CLAS_CODE = ''6B'')';
  //
  with DMHrdsys.SQLQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    while not Eof do
    begin
      //
      for I := 1 to 31 do
      begin
        sFieldName := 'day'+Format('%.2d', [I]);
        //
        if (not FieldByName(sFieldName).IsNull) and (FieldByName(sFieldName).AsString<> '') then
        begin
          sHour := FieldByName(sFieldName).AsString;
          Result := Result + StrToInt(Copy(sHour, 1 , 2))+StrToInt(Copy(sHour, 3 , 2))/60;
        end;
      end;
      Next;
    end;
    Close;
  end;
  //
  Result := SimpleRoundTo(Result, -1);
end;

procedure TFormSal37.cdsLaborCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('TTL_EXPS').AsFloat := DataSet.FieldByName('BASE_SALARY').AsFloat +
                                             DataSet.FieldByName('OVERTIME_SALARY').AsFloat +
                                             DataSet.FieldByName('BENEFITS').AsFloat +
                                             DataSet.FieldByName('BONUS').AsFloat +
                                             DataSet.FieldByName('INSURANCE').AsFloat +
                                             DataSet.FieldByName('TAXES').AsFloat;
end;

function TFormSal37.GetCosID(DeptCode: string): string;
var
  sSQL: string;
begin
  sSQL := 'SELECT COS_ID FROM COS_DEPT WHERE DEPT_NO = '+QuotedStr(DeptCode);
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    Result := FieldByName('COS_ID').AsString;
    Close;
  end;
end;

function TFormSal37.GetLaborType(DeptCode, PstCode: string): string;
var
  sSQL: string;
begin
  sSQL := 'SELECT PPH_TYPE, PROD_LINE'
        + '  FROM HRD_DEPT'
        + ' WHERE DEPT_CODE = '+QuotedStr(DeptCode);
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //NON-PPH
    if FieldByName('PPH_TYPE').AsString= '0' then
    begin
      //Others
      if FieldByName('PROD_LINE').AsString= '0' then
      begin
        //OverHead
        Result := 'OVERHEAD';
      end
      else begin
        //InDirect
        Result := 'INDIRECT';
      end;
    end
    //PPH
    else begin
      if FieldByName('PROD_LINE').AsString= '0' then
        //InDirect
        Result := 'INDIRECT'
      else begin
        //Worker
        if PstCode= '5' then
          //Direct
          Result := 'DIRECT'
        else
          //InDirect
          Result := 'INDIRECT';
      end;  
    end;
    //
    Close;
  end;
end;

end.
