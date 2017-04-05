unit UnitHrd65;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ADODB, DB, Grids, DBGrids,strutils,
  ComCtrls, TntComCtrls, TntDialogs, Buttons,WSDLIntf, TntExtCtrls,
  TntStdCtrls, DBCtrls, Mask, TntDbCtrls, TntButtons, TntDBGrids,
  TntDB, ComObj, ExcelXP, DBClient, DateUtils;


type
  //胎檢
  aryTaijian= array[1..5] of TDateTime;
  //產假
  aryChanjia= array[0..1] of TDateTime;
  //12個月小孩
  ary12Month= array[0..1] of TDateTime;

  //
  TFormHrd65 = class(TForm)
    Panel3: TPanel;
    StatusBar1: TTntStatusBar;
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel6: TTntLabel;
    TntLabel10: TTntLabel;
    edit_begin: TTntEdit;
    edit_end: TTntEdit;
    Btn_Search: TTntBitBtn;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    BtnExcel: TTntButton;
    cdsMain: TClientDataSet;
    cdsMainEMP_ID: TStringField;
    cdsMainEMP_CHS: TWideStringField;
    cdsMainNAME_VIM: TWideStringField;
    cdsMainDEPT_CHS: TWideStringField;
    cdsMainDEPT_VIM: TWideStringField;
    cdsMainEPINDT: TDateField;
    cdsMainPREGNANT_DATE: TDateField;
    cdsMainDATE_1: TDateField;
    cdsMainDATE_2: TDateField;
    cdsMainDATE_3: TDateField;
    cdsMainDATE_4: TDateField;
    cdsMainDATE_5: TDateField;
    cdsMainSEVEN_B: TDateField;
    cdsMainSEVEN_E: TDateField;
    cdsMainSEVEN_COUNT: TIntegerField;
    cdsMainMATERNITY_LEAVE_B: TDateField;
    cdsMainMATERNITY_LEAVE_E: TDateField;
    cdsMainMATERNITY_LEAVE_COUNT: TIntegerField;
    cdsMainBABY_BIRTHDAY: TDateField;
    cdsMainTWELVE_B: TDateField;
    cdsMainTWELVE_E: TDateField;
    cdsMainTWELVE_COUNT: TIntegerField;
    cdsMainEPBIRTH: TDateField;
    SaveDialog1: TSaveDialog;
    cdsMainREMARKS: TWideStringField;
    cdsMainR_DATE_B: TDateField;
    cdsMainR_DATE_E: TDateField;
    cdsMainR_DATE_COUNT: TIntegerField;
    cdsMainEDUCODE: TStringField;
    cdsMainPST_CODE: TWideStringField;
    cdsMainEXPECTED_DATE: TDateField;
    cdsMainIS_VACATION: TBooleanField;
    cdsMainIS_RAISING: TBooleanField;
    cdsMainAGE: TFloatField;
    cdsMainEXPECTED_WEEKS: TIntegerField;
    BtnExcel_CI: TTntButton;
    cdsMainNUM_1: TStringField;
    cdsMainNUM_2: TStringField;
    cdsMainNUM_3: TStringField;
   
    procedure InitForm;
    procedure InitLang;
    procedure FormCreate(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure edit_beginChange(Sender: TObject);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure BtnExcelClick(Sender: TObject);
    procedure BtnExcel_CIClick(Sender: TObject);
  
  private
    //胎檢時間
    function GetTaijian(EmpID: string; PregnantDate: TDateTime): aryTaijian;
    //產假
    function GetChanjia(EmpID: string; PregnantDate: TDateTime): aryChanjia;      
    //12個月
    function Get12Month(EmpID: string; PregnantDate: TDateTime): ary12Month;
    //得到小孩出生日期
    function GetBabyBirthDay(const EmpID: string; dSeven: TDateTime): TDateTime;
    //是否在休產檢
    function IsChanjia(const EmpID: string): Boolean;
    //是否在撫養兒童
    function IsHaveBaby(const EmpID: string): Boolean;
    //Excel For CI
    procedure ExportDataToExcel_CI;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd65: TFormHrd65;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  pri_arr:TPrvArr;//權限數組
  Langstr,LangC,LangE,LangV :TWideStrings;//語言字符串
{$R *.dfm}

procedure TFormHrd65.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'hrd20');//Get privilege
  SetComponentLang(self);//set component language text
  InitForm;// Init Form
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql+' and is_del= ''0''',CobDeptBegin);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql+' and is_del= ''0''',CobDeptEnd);
  //
  BtnExcel.Enabled:= False;
  BtnExcel_CI.Enabled := False;
end;

procedure TFormHrd65.InitForm;
begin
  //
  if not DirectoryExists('.\Report') then
    CreateDir('.\Report');
  //
  if not DirectoryExists('.\Report\hrd65') then
    CreateDir('.\Report\hrd65');
  //
  {
  if FileExists('.\Report\hrd65\hrd65PrintTemplate.xls') then
    DeleteFile('.\Report\hrd65\hrd65PrintTemplate.xls');
  //
  CopyFile('.\hrd65PrintTemplate.xls', '.\Report\hrd65\hrd65PrintTemplate.xls', False);
  }
end;

//查詢數據
procedure TFormHrd65.Btn_SearchClick(Sender: TObject);
var
  //
  sSQL: string;
  //
  aTaijian: aryTaijian;
  //
  aChanjia: aryChanjia;
  //
  a12Month: ary12Month;
  //
  dBaby   : TDateTime;
begin
  //
  BtnExcel.Enabled := False;
  //
  if not cdsMain.Active then
    cdsMain.CreateDataSet
  else
    cdsMain.EmptyDataSet;  
  //
  if edit_begin.Text <> '' then
    sSQL := sSQL + ' AND A.EMP_ID >= '+QuotedStr(edit_begin.Text);
  //
  if edit_end.Text <> '' then
    sSQL := sSQL + ' AND A.EMP_ID <= '+QuotedStr(edit_end.Text);
  //
  if CobDeptBegin.Text <> '' then
    sSQL := sSQL + ' AND B.DEPT_CODE >= '+QuotedStr(Copy(CobDeptBegin.Text, 1, 6));
  //
  if CobDeptEnd.Text <> '' then
    sSQL := sSQL + ' AND B.DEPT_CODE <= '+QuotedStr(Copy(CobDeptEnd.Text, 1, 6));
  //
  sSQL:= 'SELECT A.*,'
       + '       B.EMP_CHS,'
       + '       B.NAME_VIM,'
       + '       B.EPINDT,'
       + '       B.EPBIRTH,'
       + '       C.DEPT_CODE,'
       + '       C.DEPT_TITL,'
       + '       C.VIM_TITL,'
       + '       D.PST_CHS,'
       + '       D.PST_VIM,'
       + '       B.EDU_CODE'
       + '  FROM HRD_EMP_CHAN A, HRD_EMP B, HRD_DEPT C, HRD_PROF D'
       + ' WHERE A.EMP_ID = B.EMP_ID'
       + '   AND A.EMP_CATE = ''1'''
       + '   AND B.DEPT_CODE = C.DEPT_CODE'
       + '   AND B.PST_CODE = D.PST_CODE'+sSQL;
  //
  sSQL := sSQL + ' ORDER BY A.EMP_ID, A.DATE_S';
  //
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    if IsEmpty then
    begin
      SetStatusText(GetLangName(LangStr,'not_find_data'));
      Close;
      Exit;
    end;
    //
    while not Eof do
    begin
      cdsMain.Append;
      cdsMainEMP_ID.AsString          := FieldByName('EMP_ID').AsString;
      cdsMainEMP_CHS.Value            := FieldByName('EMP_CHS').Value;
      cdsMainNAME_VIM.Value           := FieldByName('NAME_VIM').Value;
      cdsMainEPINDT.AsString          := FieldByName('EPINDT').AsString;
      cdsMainEPBIRTH.AsString         := FieldByName('EPBIRTH').AsString;
      cdsMainDEPT_CHS.Value           := FieldByName('DEPT_TITL').Value;
      cdsMainDEPT_VIM.Value           := FieldByName('VIM_TITL').Value;
      cdsMainEDUCODE.AsString         := FieldByName('EDU_CODE').AsString;
      cdsMainPST_CODE.Value           := FieldByName('PST_CHS').Value;
      //
      dBaby := GetBabyBirthDay(FieldByName('EMP_ID').AsString, FieldByName('DATE_S').AsDateTime);
      //小孩出生日期
      if dBaby <> 0 then
        cdsMainBABY_BIRTHDAY.AsDateTime := dBaby;
      //
      if FieldByName('DATE_2').AsDateTime<> 0 then
        CDSMAINPREGNANT_DATE.AsDateTime := FieldByName('DATE_2').AsDateTime;
      //
      if cdsMainPREGNANT_DATE.AsDateTime = 0 then
        aTaijian := GetTaijian(cdsMainEMP_ID.AsString, IncMonth(FieldByName('DATE_S').AsDateTime, -7))
      else
        aTaijian := GetTaijian(cdsMainEMP_ID.AsString, cdsMainPREGNANT_DATE.AsDateTime);
      //
      if aTaijian[1]<> 0 then
        cdsMainDATE_1.AsDateTime := aTaijian[1];
      //
      if aTaijian[2]<> 0 then
        cdsMainDATE_2.AsDateTime := aTaijian[2];
      //
      if aTaijian[3]<> 0 then
        cdsMainDATE_3.AsDateTime := aTaijian[3];
      //
      if aTaijian[4]<> 0 then
        cdsMainDATE_4.AsDateTime := aTaijian[4];
      //
      if aTaijian[5]<> 0 then
        cdsMainDATE_5.AsDateTime := aTaijian[5];
      //
      if FieldByName('DATE_S').AsDateTime<> 0 then
        cdsMainSEVEN_B.AsDateTime := FieldByName('DATE_S').AsDateTime;
      //
      if FieldByName('DATE_E').AsDateTime<> 0 then
      cdsMainSEVEN_E.AsDateTime := FieldByName('DATE_E').AsDateTime;
      //
      aChanjia := GetChanjia(cdsMainEMP_ID.AsString, FieldByName('DATE_S').AsDateTime);
      //
      if aChanjia[0]<> 0 then
        cdsMainMATERNITY_LEAVE_B.AsDateTime := aChanjia[0];
      //
      if aChanjia[1]<> 0 then
        cdsMainMATERNITY_LEAVE_E.AsDateTime := aChanjia[1];
      {
      //
      a12Month := Get12Month(cdsMainEMP_ID.AsString, cdsMainPREGNANT_DATE.AsDateTime);
      //
      if a12Month[0] <> 0 then
        cdsMainTWELVE_B.AsDateTime := a12Month[0];
      //
      if a12Month[1] <> 0 then
        cdsMainTWELVE_E.AsDateTime := a12Month[1];
      }
      if cdsMainBABY_BIRTHDAY.AsDateTime <> 0 then
        cdsMainTWELVE_B.AsDateTime := cdsMainBABY_BIRTHDAY.AsDateTime;
      //
      if cdsMainTWELVE_B.AsDateTime <> 0 then
        cdsMainTWELVE_E.AsDateTime := IncMonth(cdsMainTWELVE_B.AsDateTime, 12);

      //備註 2014.07.29
      if not FieldByName('remarks').IsNull then
        cdsMainREMARKS.Value := FieldByName('remarks').Value;

      //是否產檢中
      cdsMainIS_VACATION.AsBoolean := IsChanjia(FieldByName('EMP_ID').AsString);
      //是否撫養小孩
      cdsMainIS_RAISING.AsBoolean  := IsHaveBaby(FieldByName('EMP_ID').AsString);
      //預產期
      cdsMainEXPECTED_DATE.AsDateTime := FieldByName('DATE_E').AsDateTime;

      //2014.09.11  增加孕婦服裝號碼
      cdsMainNUM_1.AsString := FieldByName('NUM_1').AsString;
      cdsMainNUM_2.AsString := FieldByName('NUM_2').AsString;
      cdsMainNUM_3.AsString := FieldByName('NUM_3').AsString;

      //
      cdsMain.Post;
      //
      Next;
    end;
  end;
  //
  cdsMain.First;
  //
  StatusBar1.SimpleText := ' Total : ' + inttostr( adoQuery1.RecordCount )  + ' 人 ';
  //
  BtnExcel.Enabled    := Pri_Arr[PRT] and (cdsMain.RecordCount > 0);
  //
  BtnExcel_CI.Enabled := Pri_Arr[PRT] and (cdsMain.RecordCount > 0);
end;

procedure TFormHrd65.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
  SetComponentLang(self);//set component language text
  keys:='vietnam_chingluh_company,hrd15_titl,total,current_location,'
    +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
    +'not_find_data,with_star_cannot_empty,msg_post_record_on_close,'
    +'sex_man,sex_woman,hrd20_date_1,hrd20_date_2,hrd20_date_3,hrd20_date_4,hrd20_date_5,hrd20_date_6,hrd20_date_7';
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

procedure TFormHrd65.edit_beginChange(Sender: TObject);
begin
  edit_end.Text:= edit_begin.Text;
end;

//胎檢時間
function TFormHrd65.GetTaijian(EmpID: string;
  PregnantDate: TDateTime): aryTaijian;
var
  sSQL: string;
  //
  iCount: Integer;
begin
  //
  Result[1] := 0;
  //
  Result[2] := 0;
  //
  Result[3] := 0;
  //
  Result[4] := 0;
  //
  Result[5] := 0;
  //
  iCount := 0;
  //
  sSQL := 'SELECT *'
        + '  FROM HRD_DUT_ASK'
        + ' WHERE CLAS_CODE = ''11'''
        + '   AND EMP_ID = '+QuotedStr(EmpID)
        + '   AND S_ASK_D >= '+QuotedStr(FormatDateTime('YYYY/MM/DD', PregnantDate))
        + '   AND S_ASK_D <= '+QuotedStr(FormatDateTime('YYYY/MM/DD', IncMonth(PregnantDate, 20)))
        + ' ORDER BY S_ASK_D';
  //
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    while not Eof do
    begin
      //
      Inc(iCount);
      //
      if iCount > 5 then Break;
      //
      Result[iCount] := FieldByName('S_ASK_D').AsDateTime;
      //
      Next;
    end;
    //
    Close;
  end;
end;

procedure TFormHrd65.cdsMainCalcFields(DataSet: TDataSet);
begin
  //
  if (cdsMainSEVEN_B.AsDateTime<> 0) and (cdsMainSEVEN_E.AsDateTime<> 0) then
    cdsMainSEVEN_COUNT.AsInteger := DaysBetween(cdsMainSEVEN_E.AsDateTime, cdsMainSEVEN_B.AsDateTime);
  //
  if (cdsMainMATERNITY_LEAVE_B.AsDateTime<> 0) and (cdsMainMATERNITY_LEAVE_E.AsDateTime<> 0) then
    cdsMainMATERNITY_LEAVE_COUNT.AsInteger := DaysBetween(cdsMainMATERNITY_LEAVE_B.AsDateTime, cdsMainMATERNITY_LEAVE_E.AsDateTime);
  //
  if (cdsMainTWELVE_B.AsDateTime<> 0) and (cdsMainTWELVE_E.AsDateTime<> 0) then
    cdsMainTWELVE_COUNT.AsInteger := DaysBetween(cdsMainTWELVE_B.AsDateTime, cdsMainTWELVE_E.AsDateTime);
  //
  if not (cdsMainR_DATE_B.IsNull or cdsMainR_DATE_E.IsNull) then
    cdsMainR_DATE_COUNT.AsInteger := DaysBetween(cdsMainR_DATE_B.AsDateTime, cdsMainR_DATE_E.AsDateTime);
  //
  if cdsMainEXPECTED_DATE.AsDateTime > Date then
    cdsMainEXPECTED_WEEKS.AsInteger := WeeksBetween(cdsMainEXPECTED_DATE.AsDateTime, Date);  
end;

//產假
function TFormHrd65.GetChanjia(EmpID: string;
  PregnantDate: TDateTime): aryChanjia;
var
  //
  sSQL: string;
  //
  dBegin, dEnd: TDateTime;
begin
  //
  Result[0] := 0;
  //
  Result[1] := 0;
  //
  sSQL := 'SELECT *'
        + '  FROM HRD_DUT_ASK'
        + ' WHERE CLAS_CODE = ''21'''
        + '   AND EMP_ID = '+QuotedStr(EmpID)
        + '   AND S_ASK_D >= '+QuotedStr(FormatDateTime('YYYY/MM/DD', PregnantDate))
        + '   AND S_ASK_D <= '+QuotedStr(FormatDateTime('YYYY/MM/DD', IncMonth(PregnantDate, 12)))
        + ' ORDER BY S_ASK_D';
  //
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    dBegin := FieldByName('S_ASK_D').AsDateTime;
    dEnd   := FieldByName('E_ASK_D').AsDateTime;
    //
    while not Eof do
    begin
      //
      if dBegin > FieldByName('S_ASK_D').AsDateTime then
        dBegin := FieldByName('S_ASK_D').AsDateTime;
      //
      if dEnd < FieldByName('E_ASK_D').AsDateTime then
        dEnd := FieldByName('E_ASK_D').AsDateTime;
      //
      Next;
    end;
    //
    Close;
  end;
  //
  Result[0] := dBegin;
  Result[1] := dEnd;
end;

//12個月
function TFormHrd65.Get12Month(EmpID: string;
  PregnantDate: TDateTime): ary12Month;
var
  sSQL: string;  
begin
  //
  Result[0] := 0;
  Result[1] := 0;
  //
  sSQL := 'SELECT DATE_S, DATE_E'
        + '  FROM HRD_EMP_CHAN'
        + ' WHERE EMP_CATE = ''2'''
        + '   AND EMP_ID = '+QuotedStr(EmpID)
        + '   AND DATE_S >= '+QuotedStr(FormatDateTime('YYYY/MM/DD', PregnantDate))
        + '   AND DATE_S <= '+QuotedStr(FormatDateTime('YYYY/MM/DD', IncMonth(PregnantDate, 12)));
  //
  with DMHrdsys.SQLQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    Result[0] := FieldByName('DATE_S').AsDateTime;
    Result[1] := FieldByName('DATE_E').AsDateTime;
    //
    Close;
  end;
end;

procedure TFormHrd65.BtnExcelClick(Sender: TObject);
var
  sFileName, sNewFileName : string;
  //
  MyExcel: Variant;
  //
  I, iRow: Integer;
begin
  //
  sFileName := ExtractFilePath(ParamStr(0))+'Report\hrd65\hrd65PrintTemplate.xls';
  //
  if not FileExists(sFileName) then Exit;
  //
  if not SaveDialog1.Execute then Exit;
  //
  sNewFileName := SaveDialog1.FileName;
  //
  if FileExists(sNewFileName) and
     (MessageBox(Handle, 'File already Exists, do you want to replace it', 'Question', MB_YESNO + MB_ICONQUESTION) = IDNo) then Exit;
  //
  try
    MyExcel:= CreateOleObject('Excel.Application');
    //
    MyExcel.WorkBooks.Open(sFileName);
  except
    ShowMessage('Can''t create Excel');
    Exit;
  end;
  //
  MyExcel.Visible:= False;
  try
    //
    iRow := 3;
    //
    cdsMain.First;
    while not cdsMain.Eof do
    begin
      //
      Inc(iRow);
      MyExcel.Cells[iRow, 1] := cdsMain.RecNo;
      //
      for I:= 0 to cdsMain.FieldByName('REMARKS').Index do
        MyExcel.Cells[iRow, I + 2] := cdsMain.Fields[I].Value;
      //
      cdsMain.Next;
    end;
    //
    MyExcel.Range[MyExcel.Cells.Item[4, 1], MyExcel.Cells.Item[iRow, 31]].Borders.LineStyle := xlContinuous;
    //
    MyExcel.Cells.EntireColumn.AutoFit;
    //
    //MyExcel.ActiveWorkbook.Save;
    MyExcel.DisplayAlerts := False;
    MyExcel.ActiveWorkbook.SaveAs(sNewFileName);
  finally
    MyExcel.Visible:= True;
  end;
end;

//得到小孩出生日期
function TFormHrd65.GetBabyBirthDay(const EmpID: string;
  dSeven: TDateTime): TDateTime;
var
  sSQL: string;  
begin
  //
  Result := 0;
  //
  if dSeven= 0 then Exit;
  //
  sSQL := 'SELECT DATE_6'
        + '  FROM HRD_EMP_CHAN'
        + ' WHERE EMP_ID = '+QuotedStr(EmpID)
        + '   AND DATE_S = '+QuotedStr(FormatDateTime('YYYY/MM/DD', dSeven));
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    Result := FieldByName('DATE_6').AsDateTime;
    Close;
  end;
  //
  if Result<> 0 then Exit;
  //
  sSQL := 'SELECT KID_BORN_DATE'
        + '  FROM HRD_SAL_FOSTER'
        + ' WHERE EMP_ID = '+QuotedStr(EmpID)
        + '   AND KID_BORN_DATE >= '+QuotedStr(FormatDateTime('YYYY/MM/DD', dSeven))
        + '   AND KID_BORN_DATE <= '+QuotedStr(FormatDateTime('YYYY/MM/DD', IncMonth(dSeven, 5)));
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    Result := FieldByName('KID_BORN_DATE').AsDateTime;
    Close;
  end;
end;

//是否在休產檢
function TFormHrd65.IsChanjia(const EmpID: string): Boolean;
var
  sSQL: string;
begin
  sSQL := 'SELECT *'
        + '  FROM HRD_DUT_ASK'
        + ' WHERE CLAS_CODE = ''21'''
        + '   AND EMP_ID  = '+QuotedStr(EmpID)
        + '   AND S_ASK_D <= '+QuotedStr(FormatDateTime('YYYY/MM/DD', Date))
        + '   AND E_ASK_D >= '+QuotedStr(FormatDateTime('YYYY/MM/DD', Date));
  //
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    Result := not IsEmpty;
    //
    Close;
  end;
end;

//是否在撫養兒童
function TFormHrd65.IsHaveBaby(const EmpID: string): Boolean;
var
  sSQL: string;
begin
  //2014.10.29 因Mizuno沒有育兒津貼，故取消
  Result := False;
  Exit;
  //
  sSQL := 'SELECT *'
        + '  FROM HRD_SAL_FOSTER'
        + ' WHERE EMP_ID = '+QuotedStr(EmpID)
        + '   AND EXPIRE_DATE >= '+QuotedStr(FormatDateTime('YYYY/MM/DD', Date));
  //
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    Result := not IsEmpty;
    //
    Close;
  end;
end;

//Excel For CI
procedure TFormHrd65.ExportDataToExcel_CI;
var
  MyExcel: Variant;
  //
  iRow, iMonths, iYear, iMonth, I: Integer;
  //
  sAge : string;
begin
  //
  try
    MyExcel := CreateOleObject('Excel.Application');
    MyExcel.WorkBooks.Add;
  except
    WideShowMessage('Failed to create Excel file');
    Exit;
  end;
  //
  MyExcel.Visible := False;
  //
  iRow := 1;
  //
  MyExcel.Cells[iRow, 1] := '集中班人員編製一覽表';
  MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 14]].MergeCells := True;
  MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 14]].Font.Size := 16;
  MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 14]].Font.Bold := True;
  MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 14]].HorizontalAlignment := xlCenter;
  MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 14]].VerticalAlignment := xlCenter;

  //
  Inc(iRow);
  MyExcel.Cells[iRow, 1] := '列印時間：'+FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
  MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 14]].MergeCells := True;
  MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 14]].Font.Size := 12;
  MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 14]].HorizontalAlignment := xlRight;
  MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 14]].VerticalAlignment := xlCenter;
  //
  Inc(iRow);
  MyExcel.Cells[iRow, 1] := '廠區';
  MyExcel.Cells[iRow, 2] := '工號';
  MyExcel.Cells[iRow, 3] := '姓名';
  MyExcel.Cells[iRow, 4] := '出生日期';
  MyExcel.Cells[iRow, 5] := '學歷';
  MyExcel.Cells[iRow, 6] := '單位';
  MyExcel.Cells[iRow, 7] := '進廠日期';
  MyExcel.Cells[iRow, 8] := '職務';
  MyExcel.Cells[iRow, 9] := '預產期';
  MyExcel.Cells[iRow, 10] := '距預產期周數';
  MyExcel.Cells[iRow, 11] := '休產假中';
  MyExcel.Cells[iRow, 12] := '撫養小孩';
  MyExcel.Cells[iRow, 13] := '小孩出生日期';
  MyExcel.Cells[iRow, 14] := '年齡';
  //
  MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 14]].Font.Size := 12;
  MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 14]].Font.Bold := True;
  MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 14]].HorizontalAlignment := xlCenter;
  MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 14]].VerticalAlignment := xlCenter;
  //
  for I := 1 to 14 do
    MyExcel.Columns[I].NumberFormatLocal := '@';
  try
    cdsMain.First;
    while not cdsMain.Eof do
    begin
      //
      Inc(iRow);
      //
      if Copy(cdsMainDEPT_CHS.Value, 1, 1)= 'A' then
      begin
        if Pos('A11', cdsMainDEPT_CHS.Value) > 0 then
          MyExcel.Cells[iRow, 1] := 'A11'
        else
          MyExcel.Cells[iRow, 1] := Copy(cdsMainDEPT_CHS.Value, 1, 2);
      end;
      MyExcel.Cells[iRow, 2] := cdsMainEMP_ID.AsString;
      MyExcel.Cells[iRow, 3] := cdsMainEMP_CHS.Value;
      MyExcel.Cells[iRow, 4] := cdsMainEPBIRTH.AsString;
      MyExcel.Cells[iRow, 5] := cdsMainEDUCODE.Value;
      MyExcel.Cells[iRow, 6] := cdsMainDEPT_CHS.Value;
      MyExcel.Cells[iRow, 7] := cdsMainEPINDT.AsString;
      MyExcel.Cells[iRow, 8] := cdsMainPST_CODE.Value;
      MyExcel.Cells[iRow, 9] := cdsMainEXPECTED_DATE.AsString;
      MyExcel.Cells[iRow, 10] := cdsMainEXPECTED_WEEKS.AsString;
      if cdsMainIS_VACATION.AsBoolean then
        MyExcel.Cells[iRow, 11] := '√';
      if cdsMainIS_RAISING.AsBoolean then
        MyExcel.Cells[iRow, 12] := '√';
      MyExcel.Cells[iRow, 13] := cdsMainBABY_BIRTHDAY.AsString;
      //
      iMonths := 0;
      //
      if cdsMainBABY_BIRTHDAY.AsDateTime <> 0 then
        iMonths := MonthsBetween(Now, cdsMainBABY_BIRTHDAY.AsDateTime);
      //
      iYear := iMonths div 12;
      //
      iMonth:= iMonths mod 12;
      //
      sAge := '';
      //
      if iYear > 0 then
        sAge := IntToStr(iYear) + '年';
      if iMonth > 0 then
        sAge := sAge + IntToStr(iMonth)+' 個月';
      //
      MyExcel.Cells[iRow, 14] := sAge;
      //
      cdsMain.Next;
    end;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[iRow, 14]].Borders.LineStyle := xlContinuous;
    MyExcel.Cells.Columns.AutoFit;
  finally
    MyExcel.Visible := True;
  end;
end;

procedure TFormHrd65.BtnExcel_CIClick(Sender: TObject);
begin
  ExportDataToExcel_CI;
end;

end.
