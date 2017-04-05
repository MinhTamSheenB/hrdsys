{*************************************************************************
Name：dut30
Author: anil
Create date:2005-11-10
Modify date:2005-11-10
Commentate:考勤月檔查詢
*************************************************************************}
unit uFhrd404;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils;

type
  TFormFhrd404 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    ADOQuery1: TADOQuery;
    TntLabel2: TTntLabel;
    DTPick1: TTntDateTimePicker;
    TntLabel10: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    Btn_Search: TTntBitBtn;
    BtnPrint: TTntBitBtn;
    TntLabel6: TTntLabel;
    edit_begin: TTntEdit;
    edit_end: TTntEdit;
    ADOQuery1dept_code: TStringField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1emp_name: TWideStringField;
    ADOQuery1emp_etdt: TDateTimeField;
    ADOQuery1date_41: TDateTimeField;
    ADOQuery1date_37: TDateTimeField;
    ADOQuery1date_33: TDateTimeField;
    ADOQuery1date_28: TDateTimeField;
    ADOQuery1date_22: TDateTimeField;
    ADOQuery1date_19: TDateTimeField;
    ADOQuery1date_18: TDateTimeField;
    ADOQuery1date_14: TDateField;
    ADOQuery1date_12: TDateField;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure Btn_SearchClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure BtnPrintClick(Sender: TObject);
    procedure CobDeptBeginChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFhrd404: TFormFhrd404;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  can_post:boolean;
  SalBaseLvl:TStrings;
  valid_date:string;
const
  TMP_DB='[tempdbf].[dbo].';
  TMP_TABLE='tmp_saltran_qry';
{$R *.dfm}

procedure TFormFhrd404.FormCreate(Sender: TObject);
//初始化
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'fhrd404');//Get privilege
  InitForm;// Init Form
end;

procedure TFormFhrd404.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='vietnam_chingluh_company,hrd15_titl,total,current_location,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
  +'not_find_data,with_star_cannot_empty,msg_post_record_on_close,while_open,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;

procedure TFormFhrd404.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  SqlStr:string;
  i:integer;
begin
  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
  DTPick1.Date:=date();
end;

procedure TFormFhrd404.Btn_SearchClick(Sender: TObject);
//查詢數據
var
  sql_str,mon_str,seq,SDate,EDate,TheDate:string;
  ADate:TDateTime;
  i:integer;
begin
  ADate:=DTPick1.Date;
  valid_date:=FormatDateTime('yyyy/mm/dd',ADate);
  Adoquery1.Active:=false;
  SetStatusText(GetLangName(LangStr,'while_open'));
  sql_str:='SELECT A.dept_code,A.emp_id,A.emp_name,A.emp_etdt,'
    +'(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id and pst_code in(''41'',''42'' )) as date_41,'
    +'(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id and pst_code in(''37'',''38'' )) as date_37,'
    +'(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id and pst_code in(''33'',''34'' )) as date_33,'
    +'(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id and pst_code in(''28'',''29'' )) as date_28,'
    +'(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id and pst_code in(''22'',''23'' )) as date_22,'
    +'(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id and pst_code=''19'') as date_19,'
    +'(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id and pst_code=''18'') as date_18,'
    +'(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id and pst_code=''14'') as date_14,'
    +'(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id and pst_code=''12'') as date_12'
    +' FROM fhrd_emp A WHERE A.emp_etdt<'''+valid_date+''''
    +' and (A.emp_ledt is null or A.emp_ledt>'''+valid_date+''')';
  if edit_Begin.Text<>'' then
    sql_str:=sql_str+' and A.emp_id>='''+trim(edit_Begin.Text)+'''';
  if edit_End.Text<>'' then
    sql_str:=sql_str+' and A.emp_id<='''+trim(edit_end.Text)+'''';
  if CobDeptBegin.Text<>'' then
    sql_str:=sql_str+' and A.dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if CobDeptEnd.Text<>'' then
    sql_str:=sql_str+' and A.dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  sql_str:=sql_str+' order by emp_id';
  with Adoquery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  if Adoquery1.Active then
    if Adoquery1.Eof then
    begin
      SetStatusText(GetLangName(LangStr,'not_find_data'));
      BtnPrint.Enabled:=false;
    end
    else
      BtnPrint.Enabled:=true;
end;

procedure TFormFhrd404.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示,及改變編輯區一些欄位
begin
with DataSet do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

procedure TFormFhrd404.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormFhrd404.ADOQuery1CalcFields(DataSet: TDataSet);
var
  SqlStr,emp_id,pst_code,edu_code,dept_code,key:string;
begin
  key:=DataSet.FieldByName('dept_code').AsString;
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_dept where dept_code='''+key+'''');
    open;
    if not Eof then
    begin
      DataSet.FieldByName('department').AsString:=FieldByName('abbr_titl').AsString;
    end;
  end;
  key:=DataSet.FieldByName('dept_code').AsString;
  sqlstr:='select count(emp_id) from hrd_emp where dept_code='''+key+''''
    +' and epindt<='''+valid_date+''' and (epledt is null or epledt>='''+valid_date+''')';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    Open;
    if not Eof then
      DataSet.FieldByName('act_num').AsInteger:=Fields[0].AsInteger
    else
      DataSet.FieldByName('act_num').AsInteger:=0;
  end;
end;

procedure TFormFhrd404.BtnPrintClick(Sender: TObject);
begin
  if Adoquery1.Active then
    ShowPrint(ADOQuery1,'每天遲到早退人數統計');
end;

procedure TFormFhrd404.CobDeptBeginChange(Sender: TObject);
begin
  CobDeptEnd.Text := CobDeptBegin.Text ;
end;

end.
