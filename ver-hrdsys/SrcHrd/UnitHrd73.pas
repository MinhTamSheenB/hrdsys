unit UnitHrd73;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,tntDialogs, ExtCtrls,StrUtils, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, TntExtCtrls, TntDBGrids, TntDbCtrls, TntStdCtrls, TntButtons,
  DB, ADODB, DBClient, Provider,DateUtils,WSDLIntf, TntComCtrls, TntDB,
  ComObj, ExcelXP;

type
  Tformhrd73 = class(TForm)
    TntPanel1: TTntPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    TntPanel2: TTntPanel;
    pnlSearch: TTntPanel;
    GbCond: TTntGroupBox;
    EditEmp_B: TTntEdit;
    EditEmp_E: TTntEdit;
    cbEmp: TTntCheckBox;
    cbDept: TTntCheckBox;
    CbbDept_B: TTntComboBox;
    CbbDept_E: TTntComboBox;
    DBGrid1: TTntDBGrid;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1insur_month: TStringField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1base_pay: TBCDField;
    ADOQuery1insur_money: TBCDField;
    ADOQuery1insur_days: TIntegerField;
    ADOQuery1insur_class: TStringField;
    ADOQuery1print_date: TDateTimeField;
    ADOQuery1print_user: TStringField;
    ADOQuery1remark: TWideStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1epid_no: TStringField;
    ADOQuery1epindt: TDateField;
    ADOQuery1date_b: TDateTimeField;
    ADOQuery1date_e: TDateTimeField;
    ADOQuery1department: TWideStringField;
    TntPanel3: TTntPanel;
    RbAll: TTntRadioButton;
    RbYes: TTntRadioButton;
    RbNo: TTntRadioButton;
    cbMonth: TTntCheckBox;
    cbDate: TTntCheckBox;
    EditMonth: TTntEdit;
    dtpDate_B: TTntDateTimePicker;
    dtpDate_E: TTntDateTimePicker;
    bbtn_search: TTntBitBtn;
    mmTitle: TTntMemo;
    mmTitle2: TTntMemo;
    BtnPrint: TTntBitBtn;
    ADOQuery1card_no: TStringField;
    TntPanel4: TTntPanel;
    Cb_All: TTntRadioButton;
    Rb_Direct: TTntRadioButton;
    Rb_Bank: TTntRadioButton;
    mmo3: TTntMemo;
    ADOQuery1pst_name: TWideStringField;
    ADOQuery1insur_rate: TStringField;
    procedure InitLangInfo;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure CbbDept_EChange(Sender: TObject);
    procedure bbtn_searchClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure EditEmp_BChange(Sender: TObject);
    procedure ADOQuery1insur_classGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cbEmpClick(Sender: TObject);
    procedure cbDeptClick(Sender: TObject);
    procedure cbMonthClick(Sender: TObject);
    procedure cbDateClick(Sender: TObject);
    procedure RbNoClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
  private
    //
    procedure ExportDataToExcel;
    //2015.03.18 �o��Ȧ�d��
    function GetBankCard(AEmpID: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formhrd73: Tformhrd73;
  ws_Words:TWideStrings;
  SalBaseLvl:TStrings;
implementation

uses
  UnitDMHrdsys,UnitHrdUtils, UnitPrtHrd73;

var
  prvArr:TPrvArr;
{$R *.dfm}

var
  iSelect : Integer = 0;

procedure Tformhrd73.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  //�w�q�n�Ψ쪺�y��
  ThisFormUsedWords:='hrd09_error1,hrd09_error2,hrd09_error3,hrd09_error4,'+
      'hrd09_error5,hrd09_error6';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
  //
  SetComponentLang(self);
end;

procedure Tformhrd73.FormCreate(Sender: TObject);
var
  sSQL: string;
begin
  prvArr:=GetPrvArr(userName,'hrd73');
  //
  BtnPrint.Enabled:=PrvArr[PRT];
  //���o�����N��
  CbbDept_B.Clear;
  CbbDept_E.Clear;
  //����
  if UserLang ='E' then
    sSQL := 'select dept_code+'' ''+eng_titl from hrd_dept where '+G_sFactorySql
  else if UserLang= 'V' then
    sSQL := 'select dept_code+'' ''+vim_titl from hrd_dept where '+G_sFactorySql
  else
    sSQL := 'select dept_code+'' ''+abbr_titl from hrd_dept where '+G_sFactorySql;
  //
  SetComboxList(sSQL, CbbDept_B);
  SetComboxList(sSQL, CbbDept_E);
  //
  CbbDept_B.ItemIndex:=0;
  CbbDept_E.ItemIndex:=CbbDept_E.Items.Count-1;
  InitLangInfo;
  SalBaseLvl:=GetAllBaseLvl;
  //
  EditMonth.Text := FormatDateTime('YYYYMM', Date);
  //
  dtpDate_B.Date := GetServerDateTime;
  dtpDate_E.Date := GetServerDateTime;
  //
  Application.CreateForm(TFormPrtHrd73, FormPrtHrd73);
end;

procedure Tformhrd73.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//�I��������Y���ܱƧǤ覡
end;

procedure Tformhrd73.CbbDept_EChange(Sender: TObject);
begin
  if CbbDept_B.ItemIndex>CbbDept_E.ItemIndex then
    CbbDept_E.ItemIndex := CbbDept_B.ItemIndex;
end;

procedure Tformhrd73.bbtn_searchClick(Sender: TObject);
var
  sSQL: string;
begin
  //
  sSQL := 'SELECT * FROM HRD_EMP_INSURANCE A WHERE 1=1';
  //
  if cbEmp.Checked then
  begin
    sSQL := sSQL + ' AND A.EMP_ID >= '+QuotedStr(EditEmp_B.Text);
    sSQL := sSQL + ' AND A.EMP_ID <= '+QuotedStr(EditEmp_E.Text);
  end;
  //
  if RbYes.Checked then
    sSQL := sSQL + ' AND A.PRINT_DATE IS NOT NULL';
  //
  if RbNo.Checked then
    sSQL := sSQL + ' AND A.PRINT_DATE IS NULL';
  //
  if cbDate.Checked then
  begin
    sSQL := sSQL + ' AND CONVERT(VARCHAR(8), A.UPD_DATE, 112) >= '+QuotedStr(FormatDateTime('YYYYMMDD', dtpDate_B.Date));
    sSQL := sSQL + ' AND CONVERT(VARCHAR(8), A.UPD_DATE, 112) <= '+QuotedStr(FormatDateTime('YYYYMMDD', dtpDate_E.Date));
  end;
  //
  if cbMonth.Checked then
    sSQL := sSQL + ' AND A.INSUR_MONTH = '+QuotedStr(EditMonth.Text);
  //����
  if cbDept.Checked then
  begin
    sSQL := sSQL + ' AND EXISTS(SELECT * FROM HRD_EMP B WHERE A.EMP_ID = B.EMP_ID AND B.DEPT_CODE >= '+QuotedStr(Copy(CbbDept_B.Text, 1, 6))+')';
    sSQL := sSQL + ' AND EXISTS(SELECT * FROM HRD_EMP B WHERE A.EMP_ID = B.EMP_ID AND B.DEPT_CODE <= '+QuotedStr(Copy(CbbDept_E.Text, 1, 6))+')';
  end;
  //
  if Rb_Direct.Checked then
    sSQL := sSQL + ' AND NOT EXISTS(SELECT * FROM HRD_SAL_BANKCARD C WHERE A.EMP_ID = C.EMP_ID)';
  //
  if Rb_Bank.Checked then
    sSQL := sSQL + ' AND EXISTS(SELECT * FROM HRD_SAL_BANKCARD C WHERE A.EMP_ID = C.EMP_ID)';
  //
  sSQL := sSQL + ' ORDER BY A.EMP_ID';
  //
  with Adoquery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
  end;
end;

procedure Tformhrd73.ADOQuery1CalcFields(DataSet: TDataSet);
var
  sSQL: string;
  //
  iRate : Integer;
begin
  //
  sSQL := 'SELECT A.EMP_ID,'
        + '       A.EMP_CHS,'
        + '       A.NAME_VIM,'
        + '       A.NAME_ENG,'
        + '       A.EPID_NO,'
        + '       A.EPINDT,'
        + '       A.DEPT_CODE,'
        + '       B.ABBR_TITL,'
        + '       B.VIM_TITL,'
        + '       B.ENG_TITL,'
        + '       C.PST_VIM'
        + '  FROM HRD_EMP A, HRD_DEPT B, HRD_PROF C'
        + ' WHERE A.DEPT_CODE = B.DEPT_CODE'
        + '   AND A.PST_CODE = C.PST_CODE'
        + '   AND A.EMP_ID = '+QuotedStr(DataSet.FieldByName('emp_id').AsString);
  //
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    if not IsEmpty then
    begin
      //�m�W
      DataSet.FieldByName('name_vim').Value := FieldByName('name_vim').Value;
      //����
      if not FieldByName('vim_titl').IsNull then
        DataSet.FieldByName('department').Value := FieldByName('dept_code').value+' '+ widestring(FieldByName('vim_titl').value);
      //�i�t���
      DataSet.FieldByName('epindt').Value := FieldByName('epindt').Value;
      //�����Ҹ��X
      DataSet.FieldByName('epid_no').Value := FieldByName('epid_no').Value;
      //¾��
      DataSet.FieldByName('pst_name').Value := FieldByName('PST_VIM').Value;
    end;
    //
    Close;
  end;
  //
  iRate := 0;
  //�p���v
  sSQL := 'SELECT CLAS_RATE, CLAS_SPC'
        + '  FROM HRD_EMP_INSURANCE_CLASS'
        + ' WHERE CLAS_CODE = '+QuotedStr(DataSet.FieldByName('insur_class').AsString);
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    if not IsEmpty then
    begin
      //�����v
      iRate := FieldByName('CLAS_RATE').AsInteger;
    end;
    Close;
  end;
  //
  DataSet.FieldByName('insur_rate').AsString := IntToStr(iRate)+'%';
  //2015.03.18 �o��Ȧ�d��
  DataSet.FieldByName('card_no').AsString := GetBankCard(DataSet.FieldByName('emp_id').AsString);
end;

procedure Tformhrd73.EditEmp_BChange(Sender: TObject);
begin
  //
  EditEmp_E.Text := EditEmp_B.Text;
end;

procedure Tformhrd73.ADOQuery1insur_classGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  sSQL: string;
begin
  //
  if UserLang = 'E' then
    sSQL := 'SELECT CLAS_CODE + '' ''+ CLAS_ENG AS CLAS_NAME'
          + '  FROM HRD_EMP_INSURANCE_CLASS'
          + ' WHERE CLAS_CODE = '+QuotedStr(Sender.AsString)
  else if UserLang = 'V' then
    sSQL := 'SELECT CLAS_CODE + '' ''+ CLAS_VIM AS CLAS_NAME'
          + '  FROM HRD_EMP_INSURANCE_CLASS'
          + ' WHERE CLAS_CODE = '+QuotedStr(Sender.AsString)
  else
    sSQL := 'SELECT CLAS_CODE + '' ''+ CLAS_CHS AS CLAS_NAME'
      + '  FROM HRD_EMP_INSURANCE_CLASS'
      + ' WHERE CLAS_CODE = '+QuotedStr(Sender.AsString);
  //
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    if not IsEmpty then
      Text := FieldByName('CLAS_NAME').Value;
    //
    Close;
  end;
end;

procedure Tformhrd73.cbEmpClick(Sender: TObject);
begin
  EditEmp_B.Enabled := cbEmp.Checked;
  EditEmp_E.Enabled := cbEmp.Checked;
end;

procedure Tformhrd73.cbDeptClick(Sender: TObject);
begin
  CbbDept_B.Enabled := cbDept.Checked;
  CbbDept_E.Enabled := cbDept.Checked;
end;

procedure Tformhrd73.cbMonthClick(Sender: TObject);
begin
  EditMonth.Enabled := cbMonth.Checked;
end;

procedure Tformhrd73.cbDateClick(Sender: TObject);
begin
  dtpDate_B.Enabled := cbDate.Checked;
  dtpDate_E.Enabled := cbDate.Checked;
end;

procedure Tformhrd73.RbNoClick(Sender: TObject);
begin
  if RbNo.Checked and (cbDate.Checked) then
    cbDate.Checked := False;
end;

//
procedure Tformhrd73.ExportDataToExcel;
var
  MyExcel: Variant;
  //
  iRow, I, J, iIndex : Integer;
  //
  cTotal: Currency;
  //
  boUpdate: Boolean;
begin
  try
    MyExcel := CreateOleObject('Excel.Application');
    MyExcel.WorkBooks.Add;
  except
    ShowMessage('Error');
    Exit;
  end;
  //
  MyExcel.Visible := False;
  try
    MyExcel.Cells.Font.Name := 'Times New Roman';
    MyExcel.Cells.Font.Size := 10;

    iRow := 1;
    MyExcel.Cells[iRow, 1] := mmTitle.Lines.Strings[0];
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 12]].MergeCells := True;
    iRow := 2;
    MyExcel.Cells[iRow, 2] := mmTitle.Lines.Strings[1];
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 12]].MergeCells := True;
    //
    MyExcel.Columns[7].NumberFormatLocal := '#,##0_ ';
    //
    MyExcel.Columns[5].NumberFormatLocal := '@';
    MyExcel.Columns[8].NumberFormatLocal := '@';
    //
    iRow := 3;
    //
    J := 2;
    for I := 1 to 12 do
    begin
      MyExcel.Cells[iRow, I] := mmTitle.Lines.Strings[J]+#13#10+mmTitle.Lines.Strings[J+1];
      //
      Inc(J, 2);;
    end;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[3, 12]].HorizontalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[3, 12]].VerticalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[3, 12]].Font.Bold := True;
    //
    iRow := 3;
    iIndex := 0;
    cTotal := 0;
    boUpdate := False;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
      {������C�L����
      //�u���\��@��
      if not ADOQuery1print_date.IsNull then
      begin
        ADOQuery1.Next;
        Continue;
      end;
      }
      //
      Inc(iIndex);
      Inc(iRow);
      //��
      MyExcel.Cells[iRow, 1] := IntToStr(iIndex);
      //�u��
      MyExcel.Cells[iRow, 2] := ADOQuery1emp_id.AsString;
      //����
      MyExcel.Cells[iRow, 3] := ADOQuery1department.Value;
      //�m�W
      MyExcel.Cells[iRow, 4] := ADOQuery1name_vim.Value;
      //�����Ҹ��X
      MyExcel.Cells[iRow, 5] := ADOQuery1epid_no.Value;
      //���O�Ѽ�
      MyExcel.Cells[iRow, 6] := ADOQuery1insur_days.Value;
      //���P���B
      MyExcel.Cells[iRow, 7] := ADOQuery1insur_money.Value;
      //�d��
      MyExcel.Cells[iRow, 8] := ADOQuery1card_no.Value;
      //�Ƶ�
      MyExcel.Cells[iRow, 10] := ADOQuery1remark.Value;
      //�̫�ק���
      MyExcel.Cells[iRow, 11] := ADOQuery1upd_date.Value;
      //�̫�ק�H�u��
      MyExcel.Cells[iRow, 12] := ADOQuery1upd_user.Value;
      //
      cTotal := cTotal + ADOQuery1insur_money.AsCurrency;
      //
      if ADOQuery1print_date.IsNull then
      begin
        //
        boUpdate := True;
        //
        ADOQuery1.Edit;
        ADOQuery1print_date.AsDateTime := GetServerDatetime;
        ADOQuery1print_user.AsString   := UserName;
        ADOQuery1.Post;
      end;
      //
      ADOQuery1.Next;
    end;
    //�O�s
    if boUpdate then
      ADOQuery1.UpdateBatch(arAll);
    //
    Inc(iRow);
    //
    MyExcel.Cells[iRow, 1] := 'TOTAL';
    //
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 6]].MergeCells := True;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 6]].HorizontalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 6]].VerticalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 6]].Font.Bold := True;
    //
    MyExcel.Cells[iRow, 7] := cTotal;
    MyExcel.Cells[iRow, 7].Font.Bold := True;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[iRow, 12]].Borders.LineStyle := xlContinuous;
    //
    Inc(iRow);
    //
    MyExcel.Cells[iRow, 7] := FormatDateTime(WideString(mmTitle2.Lines.Strings[0]), Date);
    MyExcel.Cells[iRow, 7].Font.Bold := True;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 7], MyExcel.Cells.Item[iRow, 12]].MergeCells := True;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 7], MyExcel.Cells.Item[iRow, 12]].HorizontalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 7], MyExcel.Cells.Item[iRow, 12]].VerticalAlignment := xlCenter;
    //
    Inc(iRow);
    MyExcel.Cells[iRow, 3] := mmTitle2.Lines.Strings[1]+#13#10+mmTitle2.Lines.Strings[2];
    MyExcel.Cells[iRow, 3].Font.Bold := True;
    MyExcel.Cells[iRow, 7] := mmTitle2.Lines.Strings[3]+#13#10+mmTitle2.Lines.Strings[4];
    MyExcel.Cells[iRow, 7].Font.Bold := True;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 7], MyExcel.Cells.Item[iRow, 12]].MergeCells := True;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 7], MyExcel.Cells.Item[iRow, 12]].HorizontalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 7], MyExcel.Cells.Item[iRow, 12]].VerticalAlignment := xlCenter;
    //
    MyExcel.Cells.EntireColumn.AutoFit;
  finally
    MyExcel.Visible := True;
  end;
end;

procedure Tformhrd73.BtnPrintClick(Sender: TObject);
var
  boUpdate : Boolean;
  //
  OldBookmark: TBookmark;
begin
  //
  if not ADOQuery1.Active then Exit;
  //
  if ADOQuery1.IsEmpty then Exit;
  //�����o�e
  if Rb_Direct.Checked then
  begin
    with FormPrtHrd73 do
    begin
      qrlblTitle.Caption := mmo3.Lines[13];
      qrlblEmp.Caption := mmo3.Lines[0];
      qrlblName.Caption := mmo3.Lines[1];
      qrlblJob.Caption := mmo3.Lines[14];
      qrlblDept.Caption := mmo3.Lines[3];
      qrlblPrintDate.Caption := mmo3.Lines[4];
      qrlblEntryDate.Caption := mmo3.Lines[5];
      //6-8
      qrlblCate.Caption := mmo3.Lines[6] + mmo3.Lines[7];
      //���O�򥻤u��
      QrLblBasePay.Caption := mmo3.Lines[8];
      //�Ѽ�
      QrLblDays.Caption    := mmo3.Lines[9];
      //
      QrLblRate.Caption    := mmo3.Lines[10];
      //
      QrLblMoney.Caption   := mmo3.Lines[11];
      //
      QrLblSign.Caption    := mmo3.Lines[12];
      //
      QuickRep1.Preview;
    end;
    //
    boUpdate := False;
    //
    OldBookmark := ADOQuery1.GetBookmark;
    ADOQuery1.DisableControls;
    //
    try
      //
      ADOQuery1.First;
      while not ADOQuery1.Eof do
      begin
        //
        if ADOQuery1print_date.IsNull then
        begin
          //
          boUpdate := True;
          //
          ADOQuery1.Edit;
          ADOQuery1print_date.AsDateTime := GetServerDatetime;
          ADOQuery1print_user.AsString   := UserName;
          ADOQuery1.Post;
        end;
        //
        ADOQuery1.Next;
      end;
      //�O�s
      if boUpdate then
        ADOQuery1.UpdateBatch(arAll);
      //
      if (OldBookmark<> nil) and (ADOQuery1.BookmarkValid(OldBookmark)) then
        ADOQuery1.GotoBookmark(OldBookmark);  
    finally
      ADOQuery1.FreeBookmark(OldBookmark);
      ADOQuery1.EnableControls;
    end;    
  end
  else
    ExportDataToExcel;
end;

//2015.03.18 �o��Ȧ�d��
function Tformhrd73.GetBankCard(AEmpID: string): string;
var
  sSQL: string;
begin
  //
  Result := '';
  //
  sSQL := 'SELECT CARD_NO FROM HRD_SAL_BANKCARD WHERE EMP_ID = '+QuotedStr(AEmpID);
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    Result := FieldByName('CARD_NO').AsString;
    Close;
  end;
end;

procedure Tformhrd73.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  //
  setStatusText(IntToStr(DataSet.RecNo)+' / '+IntToStr(DataSet.RecordCount));
end;

end.