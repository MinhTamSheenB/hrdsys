{*************************************************************************
Name：Dut23
Author: anil
Create date:2006-03-06
Modify date:2006-03-06
Commentate:考勤異常衝銷查詢
*************************************************************************}
unit UnitDut23;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils;

type
  TFormDut23 = class(TForm)
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
    DTBegin: TTntDateTimePicker;
    TntLabel1: TTntLabel;
    ADOQuery1clas_chs: TStringField;
    DTEnd: TTntDateTimePicker;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1seg_code: TStringField;
    ADOQuery1clas_code: TStringField;
    ADOQuery1s_start: TStringField;
    ADOQuery1s_end: TStringField;
    ADOQuery1er_date: TDateTimeField;
    ADOQuery1er_time: TStringField;
    ADOQuery1ps_time: TStringField;
    ADOQuery1late: TStringField;
    ADOQuery1early: TStringField;
    ADOQuery1status: TStringField;
    ADOQuery1er_reason: TStringField;
    ADOQuery1err_chs: TWideStringField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1spc_id: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    //my define
    procedure InitLang;
    procedure InitForm;
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
  FormDut23: TFormDut23;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  emp_id:string;
  wrk_date:Tdatetime;
{$R *.dfm}

procedure TFormDut23.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'dut23');
  InitForm;// Init Form
end;

procedure TFormDut23.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='vietnam_chingluh_company,dut23_titl,date,fld_year,fld_smonth,fld_day,'
   +'not_find_data,total,current_location,print_finish,just_doing_empid,finish';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
PanelTitle.Caption:=GetLangName(LangStr,'dut23_titl');
end;

procedure TFormDut23.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  DTBegin.Date:=date-7;
  DTEnd.Date:=date;
  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
end;

procedure TFormDut23.BtnPrintClick(Sender: TObject);
//打印內容設置
var
prt_title,datefmt,flds:widestring;
begin
  datefmt:=IntToStr(YearOf(wrk_date))+GetLangName(LangC,'fld_year')+'('+GetLangName(LangV,'fld_year')+')'
    +IntToStr(MonthOf(wrk_date))+GetLangName(LangC,'fld_smonth')+'('+GetLangName(LangV,'fld_smonth')+')'
    +IntToStr(DayOf(wrk_date))+GetLangName(LangC,'fld_day')+'('+GetLangName(LangV,'fld_day')+')';
  prt_title:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
      +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
      +GetLangName(LangC,'dut23_titl')+'<br>'
      +GetLangName(LangV,'dut23_titl')+'<br>'
      +'<left>'+GetLangName(LangC,'date')+'('+GetLangName(LangV,'date')+'):'+datefmt;
  flds:='emp_id,emp_chs,spc_id,er_date,clas_chs,seg_code,s_start,s_end,er_time,ps_time,early,late,status,err_chs,upd_user,upd_date';
  showPrint(ADOQuery1,prt_title,'',flds);
  //showPrint(ADOQuery1,prt_title);
end;

procedure TFormDut23.BtnQueryClick(Sender: TObject);
var
  sql_str:string;
begin
  sql_str:='select * from hrd_dut_erhist A,hrd_emp B where A.emp_id=B.emp_id';
  sql_str:=sql_str+' and er_date>='''+formatdatetime('yyyy/mm/dd',DTBegin.date)+'''';
  sql_str:=sql_str+' and er_date<='''+formatdatetime('yyyy/mm/dd',DTEnd.date)+'''';
  if trim(CobDeptBegin.Text)<>'' then
    sql_str:=sql_str+' and B.dept_code>=''' +leftstr(CobDeptBegin.Text,6)+'''';
  if trim(CobDeptEnd.Text)<>'' then
    sql_str:=sql_str+' and B.dept_code<=''' +leftstr(CobDeptEnd.Text,6)+'''';
  with ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.add(sql_str);
    open;
  end;
  BtnPrint.Enabled:=true;
end;

procedure TFormDut23.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormDut23.CobDeptBeginChange(Sender: TObject);
begin
  CobDeptEnd.text:=CobDeptBegin.text;
end;


procedure TFormDut23.ADOQuery1CalcFields(DataSet: TDataSet);
var
  sql_str,key,clas_chs,err_chs:string;
  Flds:TFields;
  left_time:double;
  std_start,std_end:TDatetime;
begin
  key:=Dataset.FieldByName('emp_id').AsString;
//  Flds:=GetEmpInfo(key);
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
  key:=Dataset.FieldByName('er_reason').AsString;
  sql_str:='select * from hrd_ereason where err_code='''+key+'''';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      err_chs:=FieldByName('err_chs').AsString;
  end;
  with DataSet do
  begin
 //   FieldByName('spc_id').AsString:=Flds.FieldByName('spc_id').AsString;
 //   FieldByName('emp_chs').AsString:=Flds.FieldByName('emp_chs').AsString;
    FieldByName('clas_chs').AsString:=clas_chs;
    FieldByName('err_chs').AsString:=err_chs;
  end;
end;

procedure TFormDut23.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
with ADOQuery1 do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

end.
