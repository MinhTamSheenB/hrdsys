unit ufhrd210;

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
  TFormfhrd210 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    Panel5: TPanel;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    TntLabel1: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    Panel2: TPanel;
    BtnQuery: TTntButton;
    BtnPrint: TTntBitBtn;
    DTPickDate: TTntDateTimePicker;
    RbNormal: TTntRadioButton;
    RbAbnormal: TTntRadioButton;
    RbNone: TTntRadioButton;
    RbLocal: TTntRadioButton;
    RBAll: TTntRadioButton;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1dept_code: TStringField;
    ADOQuery1department: TWideStringField;
    ADOQuery1spc_id: TStringField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1clas_chs: TStringField;
    ADOQuery1clas_code: TStringField;
    ADOQuery1seg_code: TStringField;
    ADOQuery1s_start: TStringField;
    ADOQuery1s_end: TStringField;
    ADOQuery1real_start: TStringField;
    ADOQuery1real_end: TStringField;
    ADOQuery1wrk_sts: TStringField;
    ADOQuery1abs_cate: TStringField;
    ADOQuery1late: TStringField;
    ADOQuery1early: TStringField;
    ADOQuery1left_time: TStringField;
    PrintDialog1: TPrintDialog;
    procedure BtnQueryClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
     procedure InitLang;
    procedure InitForm;
    procedure SetPrintDataset;
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd210: TFormfhrd210;
    RunThread:TRunThread;
implementation
 uses
  UnitHrdUtils,unitDMHrdsys;
 var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  emp_id:string;
  wrk_date:Tdatetime;
{$R *.dfm}

procedure TFormfhrd210.BtnQueryClick(Sender: TObject);
begin
  wrk_date:=DTPickDate.Date;
  //SetPrintDataset;
  RunThread := TRunThread.Create(false);
  BtnPrint.Enabled:=true;
end;

procedure TFormfhrd210.BtnPrintClick(Sender: TObject);
var
prt_title,datefmt,flds,prt_footer:widestring;
begin
  datefmt:=IntToStr(YearOf(wrk_date))+GetLangName(LangC,'fld_year')+'('+GetLangName(LangV,'fld_year')+')'
    +IntToStr(MonthOf(wrk_date))+GetLangName(LangC,'fld_smonth')+'('+GetLangName(LangV,'fld_smonth')+')'
    +IntToStr(DayOf(wrk_date))+GetLangName(LangC,'fld_day')+'('+GetLangName(LangV,'fld_day')+')';
  prt_title:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
      +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
      +GetLangName(LangC,'dut17_titl')+'<br>'
      +GetLangName(LangV,'dut17_titl')+'<br>'
      +'<left><size=14>'+GetLangName(LangC,'date')+'('+GetLangName(LangV,'date')+'):'+datefmt;
  prt_footer:='制表日期:'+FormatDateTime('yyyy/mm/dd',date)+'                                                            '
    +'合計數量@RecNumber                                                            '
    +'主管簽字:';
  flds:='spc_id,emp_id,emp_name, clas_chs,s_start,s_end,real_start,real_end,wrk_sts,abs_cate,early,late,left_time';
  showPrint(ADOQuery1,prt_title,prt_footer,flds);
  //showPrint(ADOQuery1,prt_title);
end;
procedure TRunThread.execute;
{*************************************************************************
TO DO:在線程中讀取實際數據
*************************************************************************}
var
  Formfhrd210:TFormfhrd210;
begin
  FreeOnTerminate := true;
  Formfhrd210:=TFormfhrd210(Application.FindComponent('Formfhrd210'));
  with Formfhrd210 do
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


procedure TFormfhrd210.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'dut17');
  InitForm;// Init Form
end;
procedure TFormfhrd210.InitLang;
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

procedure TFormfhrd210.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  DTPickDate.Date:=date;
  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
end;

procedure TFormfhrd210.SetPrintDataset;
//設置打印數據集
var
  sql_str, sql_temp:string;
begin
  sql_str:='select C.dept_code+''---''+C.abbr_titl as department,* '
    +' from fhrd_dut_day A,fhrd_emp B,hrd_dept C where '
    +' A.emp_id=B.emp_id and B.dept_code=C.dept_code '
    +' and A.wrk_date='''+FormatDatetime('yyyy/mm/dd',wrk_date)+'''' ;
//    +' and (A.real_start='''' or A.real_start is null or A.real_end='''' or A.real_end is null or wrk_sts=''36'' or [late]=''04'' or early=''05'')';
    sql_temp :=' and (A.real_start='''' or A.real_start is null or A.real_end='''''
                  +' or A.real_end is null or [late]=''04'' or early=''05''  )';
    if RBAll.Checked then
       begin
         sql_str:=sql_str+' and ( ( (A.clas_code in (''61'',''62'',''63'') or A.clas_code<=''07'') ) ';
         sql_str:=sql_str+' or  ( (A.clas_code in (''61'',''62'',''63'') ) and (  local_sts=''36'' ))  ';
         sql_str:=sql_str+' or ( A.clas_code>=''65'' )';
         sql_str:=sql_str+' or ( A.wrk_sts<>''02'' and A.clas_code>=''65'' ) )';
       end;
    if RbNormal.Checked or  RbAbnormal.Checked or  RbNone.Checked then
        sql_str:=sql_str + sql_temp ;
    if RbNormal.Checked then//正常上班
      sql_str:=sql_str+' and (A.clas_code in (''61'',''62'',''63'') or A.clas_code<=''07'') ';
    if RbLocal.Checked then//正常上班
      sql_str:=sql_str+' and (A.clas_code in (''61'',''62'',''63'') ) and (  local_sts=''36'' ) ';
{    if RbAbnormal.Checked then//異常加班
      sql_str:=sql_str+' and A.wrk_sts=''02'' and (A.clas_code<=''07'' or A.clas_code>=''61'')';
    if RbNone.Checked then//加班未刷
      sql_str:=sql_str+' and A.wrk_sts<>''02'' and A.clas_code>=''65''';}
    if RbAbnormal.Checked then//異常加班
      sql_str:=sql_str+' and A.clas_code>=''65''';
      //sql_str:=sql_str+' and (A.clas_code<=''07'' or A.clas_code>=''61'')';
    if RbNone.Checked then//加班未刷
      sql_str:=sql_str+' and A.wrk_sts<>''02'' and A.clas_code>=''65''';
  if Trim(CobDeptBegin.Text)<>'' then
    sql_str:=sql_str+' and B.dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if Trim(CobDeptEnd.Text)<>'' then
    sql_str:=sql_str+' and B.dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  if Checktempuser(username)  = false  then
     begin
       sql_str:=sql_str + ' and  not exists( select *from hrd_deny_emp where emp_id=a.emp_id ) '
     end;
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  //GetEmp();
end;
procedure TFormfhrd210.ADOQuery1CalcFields(DataSet: TDataSet);
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
    if FieldByName('wrk_sts').AsString='06' then
       FieldByName('abs_cate').AsString := '刷卡異常' ;
    if FieldByName('wrk_sts').AsString='36' then
       FieldByName('abs_cate').AsString := '未按位置刷卡' ;

  end;
 // showmessage( adoQuery1.FieldByName('abs_cate').AsString )  ;
end;

end.
