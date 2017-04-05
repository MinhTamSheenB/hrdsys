{*************************************************************************
Name：Sal19
Author: hyt
Create date:2006-09-12
Modify date:2006-09-12
Commentate:離職補助金
*************************************************************************}
unit UnitSal18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils,math, ComObj, ExcelXP;
type
  TFormSal18 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PanelGrid: TPanel;
    TntDBGrid1: TTntDBGrid;
    ADOQuery1EMP_ID: TStringField;
    ADOQuery1NAME_VIM: TWideStringField;
    ADOQuery1DEPT_CODE: TStringField;
    ADOQuery1DEPT_TITL: TWideStringField;
    ADOQuery1VIM_TITL: TWideStringField;
    ADOQuery1EPID_NO: TStringField;
    ADOQuery1EPINDT: TDateTimeField;
    ADOQuery1EPLEDT: TDateTimeField;
    ADOQuery1MONTH_COUNT: TIntegerField;
    ADOQuery1MONTH_COUNT_NEW: TIntegerField;
    ADOQuery1TOT_AMT: TFloatField;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    EditMonth: TMaskEdit;
    RbEmp: TTntRadioButton;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    RbDept: TTntRadioButton;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    BtnQuery: TTntButton;
    TntButton1: TTntButton;
    ADOQuery1INFO_CODE: TStringField;
    ADOQuery1INFO_NAME: TWideStringField;
    ADOQuery1TOT_COUNT: TFloatField;
    ADOQuery1AVG_AMT_2016: TFloatField;
    cbChange: TTntCheckBox;
    ADOQuery1CARD_NO: TStringField;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure SetPrintDataset;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure TntButton1Click(Sender: TObject);
  private
    //得到2009年以前的補助月數
    function GetMonthCountOld(AEmpID, AMonth: string; AEpInDt: TDateTime): Integer;
    //得到2009年以後的補助月數
    function GetMonthCount(AEmpID, AMonth: string): Integer;
    //得到2009年以前的六個月平均薪資
    function GetAvgBaseAmtOld(AEmpID, AMonth: string): Double;
    //得到2009年以前的六個月平均薪資
    function GetAvgBaseAmt(AEmpID, AMonth: string): Double;
    //2015.09.04 轉Excel
    procedure ExportDataToExcel;
    //2016.05.23 得到賠償比率
    function GetRate(ACount: Integer): Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal18: TFormSal18;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal19_fac, UnitPrtSal19_rub;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
{$R *.dfm}

procedure TFormSal18.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'sal18');
  InitForm;// Init Form
end;

procedure TFormSal18.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='sal19_titl,not_find_data,total,current_location,'
  +'unit_wan,unit_qian,unit_bai,unit_zhang,unit_currency_num,'
  +'total,sal09_count_num,fld_salary,fld_full_sal,'
  +'while_printing,print_finish,print_muti_page_pre';
LangStr:=GetLangWideStrs(keys);
PanelTitle.Caption:=GetLangName(LangStr,'sal19_titl');

end;

procedure TFormSal18.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  //
  EditMonth.Text := FormatDateTime('YYYYMM', Date - 10);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql+' ',CobDeptBegin);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql+' ',CobDeptEnd);
end;

procedure TFormSal18.SetPrintDataset;
var
  sSQL: string;
  //
  dBegin, dEnd: TDateTime;
begin
  if Trim(EditMonth.Text)= '' then Exit;
  //
  dBegin:= StartOfAMonth(StrToInt(LeftStr(EditMonth.Text, 4)), StrToInt(RightStr(EditMonth.Text, 2)));
  //
  dEnd := EndOfTheMonth(dBegin);
  //換廠區
  if cbChange.Checked then
  begin
    if EditMonth.Text= '201606' then
    begin
      sSQL := 'SELECT A.EMP_ID,'
            + '       A.NAME_VIM,'
            + '       A.DEPT_CODE,'
            + '       B.DEPT_TITL,'
            + '       B.VIM_TITL,'
            + '       A.EPID_NO,'
            + '       A.EPINDT,'
            + '       A.EPLEDT,'
            + '       A.INFO_CODE'
            + '  FROM HRD_EMP A, HRD_DEPT B'
            + ' WHERE A.DEPT_CODE = B.DEPT_CODE'
            + '   AND EXISTS(SELECT * FROM HRD_EMP_CHANGE C WHERE A.EMP_ID=C.EMP_ID AND C.CHANGE_MONTH = '+QuotedStr(EditMonth.Text)+')';
      //    
      sSQL := sSQL + ' AND A.EMP_ID NOT IN (''070180'',''078907'',''065618'',''065539'',''072703'')';
    end
    else begin
      sSQL := 'SELECT A.EMP_ID,'
            + '       A.NAME_VIM,'
            + '       A.DEPT_CODE,'
            + '       B.DEPT_TITL,'
            + '       B.VIM_TITL,'
            + '       A.EPID_NO,'
            + '       A.EPINDT,'
            + '       A.EPLEDT,'
            + '       A.INFO_CODE'
            + '  FROM HRD_EMP A, HRD_DEPT B'
            + ' WHERE A.DEPT_CODE = B.DEPT_CODE'
            + '   AND A.INFO_CODE = ''0'''
            + '   AND NOT EXISTS(SELECT * FROM HRD_EMP_CHANGE C WHERE A.EMP_ID=C.EMP_ID)';
      //2016.07.27
      sSQL := sSQL + ' AND A.EMP_ID NOT IN(''065521'', ''069552'', ''065608'', ''066396'', ''066397'', ''066627'', ''066629'', ''066630'', ''066632'', ''066939'', ''069769'', ''070940'', ''075923'',''078182'',''079696'')';
    end;
  end
  else begin
    sSQL := 'SELECT A.EMP_ID,'
          + '       A.NAME_VIM,'
          + '       A.DEPT_CODE,'
          + '       B.DEPT_TITL,'
          + '       B.VIM_TITL,'
          + '       A.EPID_NO,'
          + '       A.EPINDT,'
          + '       A.EPLEDT,'
          + '       A.INFO_CODE'
          + '  FROM HRD_EMP A, HRD_DEPT B'
          + ' WHERE A.DEPT_CODE = B.DEPT_CODE'
          + '   AND A.INFO_CODE<> ''0'''
          + '   AND CONVERT(VARCHAR(8), A.EPLEDT, 112) >= '+QuotedStr(FormatDateTime('YYYYMMDD', dBegin))
          + '   AND CONVERT(VARCHAR(8), A.EPLEDT, 112) <= '+QuotedStr(FormatDateTime('YYYYMMDD', dEnd));  
  end;
  //
  if RbEmp.Checked then
  begin
    if EditEmpBegin.Text <> '' then
      sSQL := sSQL + ' AND A.EMP_ID >= '+QuotedStr(EditEmpBegin.Text);
    if EditEmpEnd.Text <> '' then
      sSQL := sSQL + ' AND A.EMP_ID <= '+QuotedStr(EditEmpEnd.Text);
  end;
  //
  if RbDept.Checked then
  begin
    if CobDeptBegin.Text <> '' then
      sSQL := sSQL + ' AND A.DEPT_CODE >= '+QuotedStr(Copy(CobDeptBegin.Text, 1, 6));
    if CobDeptEnd.Text <> '' then
      sSQL := sSQL + ' AND A.DEPT_CODE <= '+QuotedStr(Copy(CobDeptEnd.Text, 1, 6));
  end;
  //
  sSQL := sSQL + ' ORDER BY A.EMP_ID';
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
  end;
end;

procedure TFormSal18.BtnQueryClick(Sender: TObject);
begin
  SetPrintDataset;
end;

procedure TFormSal18.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示,及改變編輯區一些欄位
var
  AText:string;
begin
with ADOQuery1 do
  AText:=GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+'; '
    +GetLangName(LangStr,'total')+':'+inttostr(RecordCount)+'; '
    +GetLangName(LangStr,'cur_emp_id')+':'+FieldByName('emp_id').AsString;
  setStatusText(AText);
end;

function TFormSal18.GetAvgBaseAmt(AEmpID, AMonth: string): Double;
var
  //
  sMonth, sSQL: string;
  //
  I, iYear, iMonth: Integer;
  //
  cTotal: Currency;
begin
  //
  cTotal:= 0;
  //
  iYear := StrToInt(Copy(AMonth, 1, 4));
  iMonth:= StrToInt(Copy(AMonth, 5, 2));
  for I:= 1 to 6 do
  begin
    iMonth := iMonth - 1;
    //
    if iMonth = 0 then
    begin
      iMonth := 12;
      iYear  := iYear - 1;
    end;
    //
    sMonth := Format('%.4d', [iYear])+Format('%.2d', [iMonth]);
    //
    {
    sSQL := 'SELECT BASE_PAY'
          + '  FROM HRD_SAL_PAYMT'
          + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
          + '   AND PAY_MON = '+QuotedStr(sMonth);
    }

    //
    if AMonth< '201601' then
      sSQL := 'SELECT BASE_PAY'
            + '  FROM HRD_SAL_PAYMT'
            + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
            + '   AND PAY_MON = '+QuotedStr(sMonth)
    else
      sSQL := 'SELECT SUM(ISNULL(BASE_PAY,0) + ISNULL(MGMT_OFR,0) + ISNULL(TECH_OFR,0) + ISNULL(DUTY_OFR,0) + ISNULL(GRAD_OFR,0) + ISNULL(TE_PAY,0)) AS BASE_PAY'
            + '  FROM HRD_SAL_PAYMT'
            + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
            + '   AND PAY_MON = '+QuotedStr(sMonth);
    //
    with DMHrdsys.SQLQuery4 do
    begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Open;
      //
      cTotal := cTotal + FieldByName('BASE_PAY').AsCurrency;
      //
      Close;
    end;
  end;
  //
  Result := StrToCurr(FormatFloat('0', cTotal/6));
end;

function TFormSal18.GetAvgBaseAmtOld(AEmpID, AMonth: string): Double;
var
  //
  sMonth, sSQL: string;
  //
  I, iYear, iMonth: Integer;
  //
  cTotal: Currency;
begin
  //
  cTotal:= 0;
  //
  iYear := StrToInt(Copy(AMonth, 1, 4));
  iMonth:= StrToInt(Copy(AMonth, 5, 2));
  for I:= 1 to 6 do
  begin
    iMonth := iMonth - 1;
    //
    if iMonth = 0 then
    begin
      iMonth := 12;
      iYear  := iYear - 1;
    end;
    //
    sMonth := Format('%.4d', [iYear])+Format('%.2d', [iMonth]);
    //
    sSQL := 'SELECT (ISNULL(BASE_PAY, 0) + ISNULL(MGMT_OFR, 0) + ISNULL(TECH_OFR, 0) +'
          + '       ISNULL(DUTY_OFR, 0) + ISNULL(ENVR_OFR, 0) + ISNULL(GRAD_OFR, 0)) AS SUM_AMT'
          + '  FROM HRD_SAL_PAYMT'
          + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
          + '   AND PAY_MON = '+QuotedStr(sMonth);
    with DMHrdsys.SQLQuery4 do
    begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Open;
      //
      cTotal := cTotal + FieldByName('SUM_AMT').AsCurrency;
      //
      Close;
    end;
  end;
  //
  Result := StrToCurr(FormatFloat('0', cTotal/6));
end;

function TFormSal18.GetMonthCount(AEmpID, AMonth: string): Integer;
var
  sSQL: string;  
begin
  Result := 0;
  //既沒買保險，又沒返還的月數   2009以後
  if AMonth<= '201607' then
    sSQL := 'SELECT COUNT(EMP_ID) AS MONTH_COUNT'
          + '  FROM HRD_SAL_PAYMT'
          + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
          + '   AND (PICC_SHIYE = 0 OR PICC_SHIYE IS NULL)'
          + '   AND (PICC_BACK = 0 OR PICC_BACK IS NULL)'
          //
          + '   AND PAY_MON >=''200901'''
          //
          + '   AND PAY_MON <''201607'''

          //不包含離職當月
          + '   AND PAY_MON <> '+QuotedStr(AMonth)
  else
    sSQL := 'SELECT COUNT(EMP_ID) AS MONTH_COUNT'
          + '  FROM HRD_SAL_PAYMT'
          + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
          + '   AND (PICC_SHIYE = 0 OR PICC_SHIYE IS NULL)'
          + '   AND (PICC_BACK = 0 OR PICC_BACK IS NULL)'
          //
          + '   AND PAY_MON >=''201607'''
          //不包含離職當月
          + '   AND PAY_MON <> '+QuotedStr(AMonth);
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    Result := FieldByName('MONTH_COUNT').AsInteger;
    Close;
  end;
end;

function TFormSal18.GetMonthCountOld(AEmpID, AMonth: string;
  AEpInDt: TDateTime): Integer;
var
  sSQL: string;  
begin
  Result := 0;
  //既沒買保險，又沒返還的月數   2009以前
  sSQL := 'SELECT COUNT(EMP_ID) AS MONTH_COUNT'
        + '  FROM HRD_SAL_PAYMT'
        + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
        //2009年以前
        + '   AND PAY_MON <=''200812'''
        //不包含離職當月
        + '   AND PAY_MON <> '+QuotedStr(AMonth);
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    Result := FieldByName('MONTH_COUNT').AsInteger;
    Close;
  end;

  //計算2008年12月份及之前的進廠月數
  Result := (2008-YearOf(AEpIndt))*12+(12-MonthOf(AEpIndt) + 1);

  //10號以後進廠的，算次月
  if DayOf(AEpInDt)> 10 then
    Result := Result -1;
  //
  if Result< 0 then
    Result := 0;
end;

procedure TFormSal18.ADOQuery1CalcFields(DataSet: TDataSet);
var
  iCount: Integer;
  //
  dRate: Double;
  //
  sSQL, sEmpID: string;
begin
  //2009年以前的補助月數
  DataSet.FieldByName('MONTH_COUNT').AsInteger := GetMonthCountOld(DataSet.FieldByName('EMP_ID').AsString,
                                                                   EditMonth.Text,
                                                                   DataSet.FieldByName('EPINDT').AsDateTime);
  //2009年以後的補助月數
  DataSet.FieldByName('MONTH_COUNT_NEW').AsInteger := GetMonthCount(DataSet.FieldByName('EMP_ID').AsString,
                                                                    EditMonth.Text);
  //全部補貼月份
  DataSet.FieldByName('TOT_COUNT').AsInteger := DataSet.FieldByName('MONTH_COUNT').AsInteger + DataSet.FieldByName('MONTH_COUNT_NEW').AsInteger;
  //
  DataSet.FieldByName('AVG_AMT_2016').AsFloat := GetAvgBaseAmt(DataSet.FieldByName('EMP_ID').AsString,
                                                               EditMonth.Text);

  {
  //2009年以前的六個月平均薪資              //2016.05.23 使用新制的基本工資  GetAvgBaseAmtOld -> GetAvgBaseAmt
  DataSet.FieldByName('AVG_AMT').AsFloat := GetAvgBaseAmt(DataSet.FieldByName('EMP_ID').AsString,
                                                             EditMonth.Text);
  //2009年以後的六個月平均薪資
  DataSet.FieldByName('AVG_AMT_NEW').AsFloat := GetAvgBaseAmt(DataSet.FieldByName('EMP_ID').AsString,
                                                              EditMonth.Text);
  iCount := DataSet.FieldByName('MONTH_COUNT').AsInteger;
  //
  dRate := 0;
  //
  dRate := GetRate(iCount);
  //
  DataSet.FieldByName('LV_SUPP_AMT').AsFloat := DataSet.FieldByName('AVG_AMT').AsFloat/2*0.5*dRate;
  //
  iCount := DataSet.FieldByName('MONTH_COUNT_NEW').AsInteger;
  if iCount > 0 then
  begin
    //
    dRate := GetRate(iCount);
    DataSet.FieldByName('LV_SUPP_AMT_NEW').AsFloat := DataSet.FieldByName('AVG_AMT_NEW').AsFloat/2*0.5*dRate;
  end;
  }
  iCount := DataSet.FieldByName('TOT_COUNT').AsInteger;
  dRate := GetRate(iCount);

  DataSet.FieldByName('TOT_AMT').AsFloat := DataSet.FieldByName('AVG_AMT_2016').AsFloat/2*0.5*dRate;




  //
  sSQL := 'SELECT INFO_CHS, INFO_ENG, INFO_VIM'
        + '  FROM HRD_INWORK'
        + ' WHERE INFO_CODE = '+QuotedStr(DataSet.FieldByName('INFO_CODE').AsString);
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    if UserLang= 'E' then
      DataSet.FieldByName('INFO_NAME').Value := FieldByName('INFO_ENG').Value
    else if UserLang= 'V' then
      DataSet.FieldByName('INFO_NAME').Value := FieldByName('INFO_VIM').Value
    else
      DataSet.FieldByName('INFO_NAME').Value := FieldByName('INFO_CHS').Value;
    Close;
  end;

  //
  sSQL := 'SELECT CARD_NO FROM HRD_SAL_BANKCARD WHERE EMP_ID = '+QuotedStr(DataSet.FieldByName('EMP_ID').AsString);
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    DataSet.FieldByName('CARD_NO').Value := FieldByName('CARD_NO').Value;
    Close;
  end;

end;

procedure TFormSal18.ExportDataToExcel;
var
  MyExcel: Variant;
  //
  I, iRow, iCol, iIndex : Integer;
begin
  try
    MyExcel := CreateOleObject('Excel.Application');
    MyExcel.WorkBooks.Add;
  except
    WideShowMessage('創建Excel文件失敗');
    Exit;
  end;
  //
  MyExcel.Visible := False;
  try
    iRow := 1;
    //
    MyExcel.Cells[iRow, 1] := Copy(EditMonth.Text, 1, 4)+'年'+Copy(EditMonth.Text, 5, 2)+'月離職補助金明細';
    //
    Inc(iRow);
    iCol := TntDBGrid1.Columns.Count;
    for I:= 0 to TntDBGrid1.Columns.Count- 1 do
    begin
      MyExcel.Cells[iRow, I + 1] := TntDBGrid1.Columns[I].Title.Caption;
      if (TntDBGrid1.DataSource.DataSet.Fields[I].DataType = ftString) or
         (TntDBGrid1.DataSource.DataSet.Fields[I].DataType = ftWideString) then
        MyExcel.Columns[I + 1].NumberFormatLocal := '@';
    end;
    //
    TntDBGrid1.DataSource.DataSet.First;
    while not TntDBGrid1.DataSource.DataSet.Eof do
    begin
      //
      Inc(iRow);
      for I := 0 to TntDBGrid1.DataSource.DataSet.FieldCount- 1 do
        MyExcel.Cells[iRow, I + 1] := TntDBGrid1.DataSource.DataSet.Fields[I].Value;

      TntDBGrid1.DataSource.DataSet.Next;
    end;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[1, iCol]].MergeCells := True;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[1, iCol]].Font.Size := 16;
    MyExcel.Range[MyExcel.Cells.Item[2, 1], MyExcel.Cells.Item[2, iCol]].Font.Size := 12;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, iCol]].Font.Bold := True;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, iCol]].HorizontalAlignment:= xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, iCol]].VerticalAlignment:= xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[3, 1], MyExcel.Cells.Item[iRow, iCol]].Font.Size := 9;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[iRow, iCol]].Borders.LineStyle := xlContinuous;
    MyExcel.Cells.EntireColumn.AutoFit;
  finally
    MyExcel.Visible := True;
  end;
end;

procedure TFormSal18.TntButton1Click(Sender: TObject);
begin
  ExportDataToExcel;
end;

//2016.05.23 得到賠償比率
function TFormSal18.GetRate(ACount: Integer): Double;
var
  iCount : Integer;
  dRate : Double;
begin
  iCount := ACount;
  //
  Result := 0;
  //
  if (iCount>= 1) and (iCount<= 5) then
    dRate := 1
  else if (iCount>= 6) and (iCount<= 12) then
    dRate := 2
  else if (iCount>= 13) and (iCount<= 17) then
    dRate := 3
  else if (iCount>= 18) and (iCount<= 24) then
    dRate := 4
  else if (iCount>= 25) and (iCount<= 29) then
    dRate := 5
  else if (iCount>= 30) and (iCount<= 36) then
    dRate := 6
  else if (iCount>= 37) and (iCount<= 41) then
    dRate := 7
  else if (iCount>= 42) and (iCount<= 48) then
    dRate := 8
  else if (iCount>= 49) and (iCount<= 54) then
    dRate := 9
  else if (iCount>= 55) and (iCount<= 60) then
    dRate := 10;
  //
  Result := dRate;
end;

end.
