{*************************************************************************
Name：dut28
Author: anil
Create date:2005-11-10
Modify date:2005-11-10
Commentate:考勤月檔查詢
*************************************************************************}
unit Unitdut28;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils;

type
  TFormDut28 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel6: TTntLabel;
    edit_begin: TTntEdit;
    edit_end: TTntEdit;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    ADOQuery1: TADOQuery;
    Btn_Search: TTntBitBtn;
    TntLabel10: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    RbInWork: TTntRadioButton;
    RbLeftWork: TTntRadioButton;
    BtnPrint: TTntBitBtn;
    TntLabel2: TTntLabel;
    EditMon: TTntEdit;
    Rball: TTntRadioButton;
    ADOQuery1emp_chs: TStringField;
    ADOQuery1name_vim: TStringField;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1dut_mon: TStringField;
    ADOQuery1clas_code: TStringField;
    ADOQuery1day01: TStringField;
    ADOQuery1day02: TStringField;
    ADOQuery1day03: TStringField;
    ADOQuery1day04: TStringField;
    ADOQuery1day05: TStringField;
    ADOQuery1day06: TStringField;
    ADOQuery1day07: TStringField;
    ADOQuery1day08: TStringField;
    ADOQuery1day09: TStringField;
    ADOQuery1day10: TStringField;
    ADOQuery1day11: TStringField;
    ADOQuery1day12: TStringField;
    ADOQuery1day13: TStringField;
    ADOQuery1day14: TStringField;
    ADOQuery1day15: TStringField;
    ADOQuery1day16: TStringField;
    ADOQuery1day17: TStringField;
    ADOQuery1day18: TStringField;
    ADOQuery1day19: TStringField;
    ADOQuery1day20: TStringField;
    ADOQuery1day21: TStringField;
    ADOQuery1day22: TStringField;
    ADOQuery1day23: TStringField;
    ADOQuery1day24: TStringField;
    ADOQuery1day25: TStringField;
    ADOQuery1day26: TStringField;
    ADOQuery1day27: TStringField;
    ADOQuery1day28: TStringField;
    ADOQuery1day29: TStringField;
    ADOQuery1day30: TStringField;
    ADOQuery1day31: TStringField;
    ADOQuery1clas_name: TWideStringField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1department: TWideStringField;
    TntPanel1: TTntPanel;
    ChkAbnormal: TTntCheckBox;
    ChkNoDut: TTntCheckBox;
    ADOQuery2: TADOQuery;
    ADOQuery2emp_id: TStringField;
    ADOQuery2emp_chs: TWideStringField;
    ADOQuery2dept_code: TStringField;
    ADOQuery2epindt: TDateTimeField;
    ADOQuery2epledt: TDateTimeField;
    ADOQuery2spc_id: TStringField;
    ADOQuery2name_vim: TWideStringField;
    DBGrid2: TTntDBGrid;
    DataSource2: TDataSource;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure Btn_ResetClick(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure BtnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut28: TFormDut28;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  can_post:boolean;
  SalBaseLvl:TStrings;
const
  TMP_DB='[tempdbf].[dbo].';
  TMP_TABLE='tmp_saltran_qry';
{$R *.dfm}

procedure TFormDut28.FormCreate(Sender: TObject);
//初始化
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'dut28');//Get privilege
  InitForm;// Init Form
end;

procedure TFormDut28.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='vietnam_chingluh_company,hrd15_titl,total,current_location,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
  +'not_find_data,with_star_cannot_empty,msg_post_record_on_close,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;

procedure TFormDut28.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  SqlStr:string;
begin
  {SqlStr:='select dept_code+'' ''+abbr_titl from hrd_dept';
  SetComboxList(sqlStr,CobDeptBegin);
  SetComboxList(sqlStr,CobDeptEnd);}
  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
  {SqlStr:='select pst_code+'' ''+pst_chs from hrd_prof where pst_code>=''18''';
  SetComboxList(sqlStr,CobPstBegin);
  SetComboxList(sqlStr,CobPstEnd);}
  EditMon.Text:=formatDateTime('yyyymm',date-5);
  SalBaseLvl:=GetAllBaseLvl;
end;

procedure TFormDut28.Btn_SearchClick(Sender: TObject);
//查詢數據
var
  sql_str,mon_str,seq,SDate,EDate:string;
  ADate:TDateTime;
  i:integer;
begin
  ADate:=EnCodeDate(StrToInt(LeftStr(editMon.Text,4)),StrToInt(RightStr(editMon.Text,2)),1);
  SDate:=FormatDateTime('yyyy/mm/dd',ADate);
  ADate:=EndOfTheMonth(ADate);
  EDate:=FormatDateTime('yyyy/mm/dd',ADate);
  mon_str:=LeftStr(EditMon.Text,4)+'/'+RightStr(EditMon.Text,2);
  sql_str:='select C.dept_code+'' ''+C.abbr_titl as department,* '
    +' from hrd_dut_mon A,hrd_emp B,hrd_dept C '
    +' where A.emp_id=B.emp_id and B.dept_code=C.dept_code '
    +' and dut_mon='''+EditMon.Text+'''';
  if ChkAbnormal.Checked then
   sql_str:=sql_str+' and (day01>900 or day02>900 or day03>900 or day04>900 or day05>900'
    +' or day06>900 or day07>900 or day08>900 or day09>900 or day10>900'
    +' or day11>900 or day12>900 or day13>900 or day14>900 or day15>900'
    +' or day16>900 or day17>900 or day18>900 or day19>900 or day20>900'
    +' or day21>900 or day22>900 or day23>900 or day24>900 or day25>900'
    +' or day26>900 or day27>900 or day28>900 or day29>900 or day30>900 or day31>900)';
  {if ChkNoDut.Checked then
  begin
    sql_str:=sql_str+' and A.emp_id in(select A.emp_id from hrd_dut_mon A,hrd_emp B'
      +'where dut_mon='''+EditMon.Text+''' and A.emp_id=B.emp_id '
      +' group by A.emp_id having 1=2 ';
    for i=1 to 31 do
    begin
      sql_str:=sql_str+' or (sum( isnull(cast (day01 as integer),0))=0 and min(epindt)<'2006/09/01' and (min(epledt) is null or min(epledt)>'2006/09/01'))';
    end;
  end;  }
  if edit_begin.Text<>'' then
    sql_str:=sql_str+' and A.emp_id>='''+edit_begin.Text+'''';
  if edit_end.Text<>'' then
    sql_str:=sql_str+' and A.emp_id<='''+edit_end.Text+'''';
  if (CobDeptBegin.Text<>'') or (CobDeptEnd.Text<>'') or (RbInWork.Checked) or (RbLeftWork.Checked) then
  begin//查詢工號檔
    //sql_str:=sql_str+' and emp_id in (select emp_id from hrd_emp where 1=1';
    if CobDeptBegin.Text<>'' then
      sql_str:=sql_str+' and B.dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
    if CobDeptEnd.Text<>'' then
      sql_str:=sql_str+' and B.dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
    if RbInWork.Checked then//在職
      sql_str:=sql_str+' and (epledt is null or epledt>'''+EDate+''')';
    if RbLeftWork.Checked then//離職
      sql_str:=sql_str+'  and epledt<='''+EDate+'''';
    //sql_str:=sql_str+')';
  end;
  sql_str:=sql_str+' order by B.dept_code,A.emp_id,clas_code';
  with Adoquery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  if ChkNoDut.Checked then //無月考勤
  begin
    sql_str:='select * from hrd_emp where epindt<'''+EDate+''''
      +' and (epledt is null or (epledt>'''+SDate+''' and epledt>epindt))'
      +' and emp_id not in (select emp_id from hrd_dut_mon where dut_mon='''+editMon.Text+''')';
    if CobDeptBegin.Text<>'' then
      sql_str:=sql_str+' and dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
    if CobDeptEnd.Text<>'' then
      sql_str:=sql_str+' and dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
    sql_str:=sql_str+' order by emp_id';
    with Adoquery2 do
    begin
      close;
      sql.Clear;
      sql.Add(sql_str);
      open;
    end;
    DBGrid2.Align:=alClient;
    DBGrid2.Visible:=true;
  end
  else //有月考勤
  begin
    with Adoquery1 do
    begin
      close;
      sql.Clear;
      sql.Add(sql_str);
      open;
    end;
    DBGrid2.Visible:=false;
  end;
  if Adoquery1.Eof then
  begin
    SetStatusText(GetLangName(LangStr,'not_find_data'));
    BtnPrint.Enabled:=false;
  end
  else
    BtnPrint.Enabled:=true;
end;

procedure TFormDut28.Btn_ResetClick(Sender: TObject);
//重置查詢條件
var
  status:boolean;
begin
if TtntBitBtn(Sender).Name='Btn_Reset' then
  status:=true
else
  status:=false;
edit_begin.Enabled:=status;
edit_end.Enabled:=status;
Btn_search.Enabled:=status;
//if status=true then
ADOQuery1.Active:= not status;
end;

procedure TFormDut28.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示,及改變編輯區一些欄位
begin
with ADOQuery1 do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

procedure TFormDut28.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormDut28.ADOQuery1CalcFields(DataSet: TDataSet);
var
  SqlStr,emp_id,pst_code,edu_code,dept_code,key:string;
begin
{  key:=DataSet.FieldByName('emp_id').AsString;
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_emp where emp_id='''+key+'''');
    open;
    if not Eof then
    begin
      DataSet.FieldByName('emp_chs').AsString:=FieldByName('emp_chs').AsString;
      DataSet.FieldByName('name_vim').AsString:=FieldByName('name_vim').AsString;
    end;
  end;}
  key:=DataSet.FieldByName('clas_code').AsString;
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_dut_class where clas_code='''+key+'''');
    open;
    if not Eof then
    begin
      DataSet.FieldByName('clas_name').AsString:=FieldByName('clas_chs').AsString;
    end;
  end;
end;

procedure TFormDut28.BtnPrintClick(Sender: TObject);
begin
  ShowPrint(ADOQuery1,'員工薪資查詢');
end;

end.
