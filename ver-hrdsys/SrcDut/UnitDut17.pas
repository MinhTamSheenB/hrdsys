{*************************************************************************
Name：Dut16(員工薪資調動考核表)
Author: anil
Create date:2005-09-06
Modify date:2005-09-08
Commentate:員工薪資調動考核表
*************************************************************************}
unit UnitDut17;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils;

type
  TRunThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure execute;override;
  public
    { Public declarations }
  end;

type
  TFormDut17 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PrintDialog1: TPrintDialog;
    Panel5: TPanel;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    Panel2: TPanel;
    BtnQuery: TTntButton;
    BtnPrint: TTntBitBtn;
    DTPickDate: TTntDateTimePicker;
    TntLabel1: TTntLabel;
    RbNormal: TTntRadioButton;
    RbAbnormal: TTntRadioButton;
    RbNone: TTntRadioButton;
    ADOQuery1emp_id: TStringField;
    ADOQuery1seg_code: TStringField;
    ADOQuery1clas_code: TStringField;
    ADOQuery1s_start: TStringField;
    ADOQuery1s_end: TStringField;
    ADOQuery1real_start: TStringField;
    ADOQuery1real_end: TStringField;
    ADOQuery1late: TStringField;
    ADOQuery1early: TStringField;
    ADOQuery1department: TWideStringField;
    ADOQuery1clas_chs: TStringField;
    ADOQuery1left_time: TStringField;
    ADOQuery1wrk_sts: TStringField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1spc_id: TStringField;
    ADOQuery1name_vim: TWideStringField;
    RbLocal: TTntRadioButton;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure SetPrintDataset;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure CobDeptBeginChange(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut17: TFormDut17;
  RunThread:TRunThread;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  emp_id:string;
  wrk_date:Tdatetime;
{$R *.dfm}

procedure TFormDut17.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'dut17');
  InitForm;// Init Form
end;

procedure TFormDut17.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='vietnam_chingluh_company,dut17_titl,date,fld_year,fld_smonth,fld_day,'
   +'not_find_data,total,current_location,print_finish,just_doing_empid,finish';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormDut17.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  DTPickDate.Date:=date;
  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
end;

procedure TFormDut17.SetPrintDataset;
//設置打印數據集
var
  sql_str:string;
begin
  sql_str:='select C.dept_code+''---''+C.abbr_titl as department,* '
    +' from hrd_dut_day A,hrd_emp B,hrd_dept C where '
    +' A.emp_id=B.emp_id and B.dept_code=C.dept_code '
    +' and A.wrk_date='''+FormatDatetime('yyyy/mm/dd',wrk_date)+'''';
    if   RbLocal.Checked = false then//正常上班
      sql_str := sql_str + ' and (A.real_start='''' or A.real_start is null or A.real_end='''' or A.real_end is null or [late]=''04'' or early=''05'')';
    if RbNormal.Checked then//正常上班
      sql_str:=sql_str+' and (A.clas_code in (''61'',''62'',''63'') or A.clas_code<=''07'') ';
   // if RbAbnormal.Checked then//異常加班
   //   sql_str:=sql_str+' and A.wrk_sts=''02'' and (A.clas_code<=''07'' or A.clas_code>=''61'')';
   // if RbNone.Checked then//加班未刷
   //   sql_str:=sql_str+' and A.wrk_sts<>''02'' and A.clas_code>=''65''';
  if RbAbnormal.Checked then//異常加班
      sql_str:=sql_str+' and A.clas_code>=''65''';
      //sql_str:=sql_str+' and (A.clas_code<=''07'' or A.clas_code>=''61'')';
  if RbNone.Checked then//加班未刷
      sql_str:=sql_str+' and A.wrk_sts<>''02'' and A.clas_code>=''65''';

  if RbLocal.Checked then//正常上班
      sql_str:=sql_str+' and A.wrk_sts=''36''' ; //and (A.clas_code in (''61'',''62'',''63'')) ';

  if Trim(CobDeptBegin.Text)<>'' then
    sql_str:=sql_str+' and B.dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if Trim(CobDeptEnd.Text)<>'' then
    sql_str:=sql_str+' and B.dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  //GetEmp();
end;

procedure TFormDut17.BtnPrintClick(Sender: TObject);
//打印內容設置
var
prt_title,datefmt,flds:widestring;
begin
  datefmt:=IntToStr(YearOf(wrk_date))+GetLangName(LangC,'fld_year')+'('+GetLangName(LangV,'fld_year')+')'
    +IntToStr(MonthOf(wrk_date))+GetLangName(LangC,'fld_smonth')+'('+GetLangName(LangV,'fld_smonth')+')'
    +IntToStr(DayOf(wrk_date))+GetLangName(LangC,'fld_day')+'('+GetLangName(LangV,'fld_day')+')';
  prt_title:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
      +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
      +GetLangName(LangC,'dut17_titl')+'<br>'
      +GetLangName(LangV,'dut17_titl')+'<br>'
      +'<left>'+GetLangName(LangC,'date')+'('+GetLangName(LangV,'date')+'):'+datefmt;
  flds:='spc_id,emp_id,emp_chs,name_vim,clas_chs,seg_code,s_start,s_end,real_start,real_end,early,late,left_time';
  showPrint(ADOQuery1,prt_title,'Ma mau bieu:RS S 05-07A',flds);
  //showPrint(ADOQuery1,prt_title);
end;

procedure TFormDut17.BtnQueryClick(Sender: TObject);
begin
  wrk_date:=DTPickDate.Date;
  //SetPrintDataset;
  RunThread := TRunThread.Create(false);
  BtnPrint.Enabled:=true;
end;

procedure TFormDut17.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormDut17.CobDeptBeginChange(Sender: TObject);
begin
  CobDeptEnd.text:=CobDeptBegin.text;
end;

procedure TRunThread.execute;
{*************************************************************************
TO DO:在線程中讀取實際數據
*************************************************************************}
var
  FormDut17:TFormDut17;
begin
  FreeOnTerminate := true;
  FormDut17:=TFormDut17(Application.FindComponent('FormDut17'));
  with FormDut17 do
  begin
    BtnPrint.Enabled:=false;
    PanelGrid.Enabled:=false;
    DBGrid1.DataSource:=nil;
    SetPrintDataset;
    //Synchronize(SetPrintDataset);
    DBGrid1.DataSource:=DataSource1;
    PanelGrid.Enabled:=true;
    BtnPrint.Enabled:=true;
  end;
end;

procedure TFormDut17.ADOQuery1CalcFields(DataSet: TDataSet);
var
  sql_str,key,clas_chs:string;
  Flds:TFields;
  left_time:double;
  std_start,std_end:TDatetime;
begin
  //key:=Dataset.FieldByName('emp_id').AsString;
  //Flds:=GetEmpInfo(key);
  key:=Dataset.FieldByName('clas_code').AsString;
  sql_str:='select * from hrd_dut_class where clas_code='''+key+'''';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      clas_chs:=FieldByName('clas_chs').AsString;
  end;
  with DataSet do
  begin
    //FieldByName('department').AsString:=Flds.FieldByName('abbr_titl').AsString;
    //FieldByName('spc_id').AsString:=Flds.FieldByName('spc_id').AsString;
    //FieldByName('emp_chs').AsString:=Flds.FieldByName('emp_chs').AsString;
    //FieldByName('name_vim').Value:=Flds.FieldByName('name_vim').Value;
    FieldByName('clas_chs').AsString:=clas_chs;
    std_start:=ShortStrToTime(FieldByName('s_start').AsString);
    std_end:=ShortStrToTime(FieldByName('s_end').AsString);
    if FieldByName('wrk_sts').AsString='06' then
      left_time:=std_end-std_start
    else
      left_time:=0;
    if left_time<>0 then
      FieldByName('left_time').AsString:=FormatDatetime('hh:nn',left_time)
    else
      FieldByName('left_time').AsString:='';
  end;
end;

procedure TFormDut17.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
with ADOQuery1 do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

end.
