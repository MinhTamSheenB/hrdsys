{*************************************************************************
Name：sal14
Author: anil
Create date:2005-11-10
Modify date:2005-11-10
Commentate:薪資結構查詢
*************************************************************************}
unit UnitSal14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils;

type
  TFormSal14 = class(TForm)
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
    TntLabel1: TTntLabel;
    CobPstBegin: TTntComboBox;
    CobPstEnd: TTntComboBox;
    ADOQuery1emp_id: TStringField;
    ADOQuery1valid_date: TDateTimeField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1pst_code: TStringField;
    ADOQuery1sal_grade: TStringField;
    ADOQuery1sal_base: TBCDField;
    ADOQuery1sal_mgmt: TBCDField;
    ADOQuery1sal_tech: TBCDField;
    ADOQuery1pst_pay: TBCDField;
    ADOQuery1envir_pay: TBCDField;
    ADOQuery1grade_pay: TBCDField;
    ADOQuery1sal_spec: TBCDField;
    ADOQuery1sal_achi: TBCDField;
    ADOQuery1other_pay: TBCDField;
    ADOQuery1total: TFloatField;
    RbInWork: TTntRadioButton;
    RbLeftWork: TTntRadioButton;
    RbAllWork: TTntRadioButton;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1name_vim: TWideStringField;
    BtnPrint: TTntBitBtn;
    ADOQuery1edu_code: TStringField;
    ADOQuery1epindt: TDateTimeField;
    TntLabel2: TTntLabel;
    dt_valid_s: TTntDateTimePicker;
    TntLabel10: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    dt_valid_e: TTntDateTimePicker;
    ADOQuery1full_awd: TFloatField;
    ADOQuery1gong_pay: TFloatField;
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
  FormSal14: TFormSal14;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  can_post:boolean;
  SalBaseLvl:TStrings;
const
  TMP_DB='[dbo].';
  TMP_TABLE='tmp_saltran_qry';
{$R *.dfm}

procedure TFormSal14.FormCreate(Sender: TObject);
//初始化
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'sal14');//Get privilege
  InitForm;// Init Form
end;

procedure TFormSal14.InitLang;
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

procedure TFormSal14.InitForm;
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
  SqlStr:='select pst_code+'' ''+pst_chs from hrd_prof where pst_code>=''12''';
  SetComboxList(sqlStr,CobPstBegin);
  SetComboxList(sqlStr,CobPstEnd);
  Dt_valid_e.Date:=date;
  SalBaseLvl:=GetAllBaseLvl;
end;

procedure TFormSal14.Btn_SearchClick(Sender: TObject);
//查詢數據
var
  sql_str:string;
begin
  Sql_Str:='if exists (select * from '+TMP_DB+'sysobjects where name='''+TMP_TABLE+''')'
    +'drop table '+TMP_DB+TMP_TABLE+';';
  //有調薪紀錄
  Sql_Str:=Sql_Str+'select A.emp_id,A.pst_code,A.dept_code,A.emp_chs,A.name_vim,'
    +'a.edu_code,A.epindt,B.valid_date into '+TMP_DB+TMP_TABLE
    +' from hrd_emp A,hrd_saltran B where A.emp_id=B.emp_id '
    +' and id in (select max(id) from hrd_saltran where 1=1';
  if edit_begin.Text<>'' then
    sql_str:=sql_str+' and emp_id>='''+edit_begin.Text+'''';
  if edit_end.Text<>'' then
    sql_str:=sql_str+' and emp_id<='''+edit_end.Text+'''';
  sql_str:=sql_str+' and valid_date>='''+FormatDateTime('yyyy/mm/dd',dt_valid_s.Date)+'''';
  sql_str:=sql_str+' and valid_date<='''+FormatDateTime('yyyy/mm/dd',dt_valid_e.Date)+'''';
  sql_str:=sql_str+' group by emp_id)';
  if CobDeptBegin.Text<>'' then
    sql_str:=sql_str+' and A.dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if CobDeptEnd.Text<>'' then
    sql_str:=sql_str+' and A.dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  if CobPstBegin.Text<>'' then
    sql_str:=sql_str+' and A.pst_code>='''+LeftStr(CobPstBegin.Text,2)+'''';
  if CobPstEnd.Text<>'' then
    sql_str:=sql_str+' and A.pst_code<='''+LeftStr(CobPstEnd.Text,2)+'''';
  if RbInWork.Checked then//在職
    sql_str:=sql_str+' and epledt is null';
  if RbLeftWork.Checked then//離職
    sql_str:=sql_str+' and epledt is not null';
  sql_str:=sql_str+';';
  //無調薪紀錄
  sql_str:=sql_str+'insert into '+TMP_DB+TMP_TABLE
    +'(emp_id,pst_code,dept_code,emp_chs,name_vim,edu_code,epindt,valid_date)'
    +' select emp_id,pst_code,dept_code,emp_chs,name_vim,edu_code,epindt,epindt'
    +' from hrd_emp where emp_id not in (select emp_id from hrd_saltran)';
  if edit_begin.Text<>'' then
    sql_str:=sql_str+' and emp_id>='''+edit_begin.Text+'''';
  if edit_end.Text<>'' then
    sql_str:=sql_str+' and emp_id<='''+edit_end.Text+'''';
  if CobDeptBegin.Text<>'' then
    sql_str:=sql_str+' and dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if CobDeptEnd.Text<>'' then
    sql_str:=sql_str+' and dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  if CobPstBegin.Text<>'' then
    sql_str:=sql_str+' and pst_code>='''+LeftStr(CobPstBegin.Text,2)+'''';
  if CobPstEnd.Text<>'' then
    sql_str:=sql_str+' and pst_code<='''+LeftStr(CobPstEnd.Text,2)+'''';
  if RbInWork.Checked then//在職
    sql_str:=sql_str+' and epledt is null';
  if RbLeftWork.Checked then//離職
    sql_str:=sql_str+' and epledt is not null';
  sql_str:=sql_str+' and epindt>='''+FormatDateTime('yyyy/mm/dd',dt_valid_s.Date)+'''';
  sql_str:=sql_str+' and epindt<='''+FormatDateTime('yyyy/mm/dd',dt_valid_e.Date)+'''';
  with DMHrdsys.ADOCommand1 do
  begin
    CommandText:=sql_str;
    Execute;
  end;
  {sql_str:='select * from hrd_emp where 1=1 ';
//    +' and id in (select max(id) from hrd_saltran where 1=1 ';
  if edit_begin.Text<>'' then
    sql_str:=sql_str+' and emp_id>='''+edit_begin.Text+'''';
  if edit_end.Text<>'' then
    sql_str:=sql_str+' and emp_id<='''+edit_end.Text+'''';
//  sql_str:=sql_str+' group by emp_id)';
  if CobDeptBegin.Text<>'' then
    sql_str:=sql_str+' and dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if CobDeptEnd.Text<>'' then
    sql_str:=sql_str+' and dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  if CobPstBegin.Text<>'' then
    sql_str:=sql_str+' and pst_code>='''+LeftStr(CobPstBegin.Text,2)+'''';
  if CobPstEnd.Text<>'' then
    sql_str:=sql_str+' and pst_code<='''+LeftStr(CobPstEnd.Text,2)+'''';
  if RbInWork.Checked then//在職
    sql_str:=sql_str+' and epledt is null';
  if RbLeftWork.Checked then//離職
    sql_str:=sql_str+' and epledt is not null';
  sql_str:=sql_str+' order by emp_id';}
  sql_str:='select * from '+TMP_DB+TMP_TABLE+' order by emp_id';
  with Adoquery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  if Adoquery1.Eof then
  begin
    SetStatusText(GetLangName(LangStr,'not_find_data'));
    BtnPrint.Enabled:=false;
  end
  else
    BtnPrint.Enabled:=true;
end;

procedure TFormSal14.Btn_ResetClick(Sender: TObject);
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

procedure TFormSal14.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示,及改變編輯區一些欄位
begin
with ADOQuery1 do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

procedure TFormSal14.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormSal14.ADOQuery1CalcFields(DataSet: TDataSet);
var
  SqlStr,emp_id,pst_code,edu_code,dept_code, clmon:string;
  epindt,valid_date:TDatetime;
  total:double;
begin
  with dataset do
  begin
    emp_id:=FieldByName('emp_id').AsString;
    dept_code:=FieldByName('dept_code').AsString;
    pst_code:=FieldByName('pst_code').AsString;
    edu_code:=FieldByName('edu_code').AsString;
    epindt:=FieldByName('epindt').AsDateTime;
    valid_date:=FieldByName('valid_date').AsDateTime;
    clmon := copy( datetimetostr(valid_date), 1,4)+ copy( datetimetostr(valid_date), 6,2) ;
   // if ( copy( datetimetostr(valid_date), 1,4)+ copy( datetimetostr(valid_date), 6,2) ) < '200801'  then
       FieldByName('sal_base').AsFloat:=GetNormalBase( Emp_id,clmon,Pst_Code,Edu_Code,EpInDt,SalBaseLvl,true)
  //  else
   //     FieldByName('sal_base').AsFloat:=GetNormalBase(clmon, Pst_Code,Edu_Code,EpInDt,SalBaseLvl,true)+ 92300;
  end;
  SqlStr:='select * from hrd_saltran where emp_id='''+emp_id+''''
    +' and valid_date='''+FormatDateTime('yyyy/mm/dd',valid_date)+'''';
    //(select max(valid_date) from hrd_saltran where emp_id='''+emp_id+''')';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(SqlStr);
    open;
    if not Eof then
    begin
      DataSet.FieldByName('grade_pay').AsFloat:=FieldByName('grade_pay').AsFloat;
      DataSet.FieldByName('sal_mgmt').AsFloat:=FieldByName('sal_mgmt').AsFloat;
      DataSet.FieldByName('sal_tech').AsFloat:=FieldByName('sal_tech').AsFloat;
      DataSet.FieldByName('pst_pay').AsFloat:=FieldByName('pst_pay').AsFloat;
      DataSet.FieldByName('envir_pay').AsFloat:=FieldByName('envir_pay').AsFloat;
      DataSet.FieldByName('sal_spec').AsFloat:=FieldByName('sal_spec').AsFloat;
      //DataSet.FieldByName('ton_pay').AsFloat:=FieldByName('ton_pay').AsFloat;
      //DataSet.FieldByName('prd_grade').AsString:=FieldByName('prd_grade').AsString;
      //DataSet.FieldByName('prd_pay').AsFloat:=FieldByName('prd_pay').AsFloat;
      //DataSet.FieldByName('valid_date').AsDateTime:=FieldByName('valid_date').AsDateTime;
    end
    else
    begin//職員默認20000
      if (pst_code='50') then
        DataSet.FieldByName('grade_pay').AsFloat:=20000
      else
        DataSet.FieldByName('grade_pay').AsFloat:=0;
    end;
  end;
  total:=0;
 DataSet.FieldByName('full_awd').AsFloat:= 200000;
 DataSet.FieldByName('gong_pay').AsFloat:= 400000;
  with DataSet do
  begin
//    GetNormalBase
    total:=total+FieldByName('sal_base').AsFloat;
    total:=total+FieldByName('grade_pay').AsFloat;
    total:=total+FieldByName('sal_mgmt').AsFloat;
    total:=total+FieldByName('sal_tech').AsFloat;
    total:=total+FieldByName('pst_pay').AsFloat;
    total:=total+FieldByName('envir_pay').AsFloat;
    total:=total+FieldByName('sal_spec').AsFloat;
    //total:=total+FieldByName('ton_pay').AsFloat;
    //total:=total+FieldByName('prd_pay').AsFloat;
    FieldByName('total').AsFloat:=total+600000;
  end;

end;

procedure TFormSal14.BtnPrintClick(Sender: TObject);
begin
  ShowPrint(ADOQuery1,'薪資結構表');
end;

end.
