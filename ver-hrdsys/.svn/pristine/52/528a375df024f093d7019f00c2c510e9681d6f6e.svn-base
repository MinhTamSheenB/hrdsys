{*************************************************************************
Name：med14
Author: anil
Create date:2005-10-25
Modify date:2005-10-25
Commentate:員工賬單統計
*************************************************************************}
unit UnitMed14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils;

type
  TFormMed14 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Panel5: TPanel;
    Panel6: TPanel;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    Panel2: TPanel;
    BtnQuery: TTntButton;
    BtnPrint: TTntButton;
    emp_id_b: TTntEdit;
    emp_id_e: TTntEdit;
    DBGrid1: TTntDBGrid;
    TntGroupBox2: TTntGroupBox;
    TntLabel3: TTntLabel;
    EditMonth: TMaskEdit;
    TntLabel1: TTntLabel;
    use_money_b: TTntEdit;
    use_money_e: TTntEdit;
    TntLabel2: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    ADOQuery1department: TTntWideStringField;
    ADOQuery1month: TWideStringField;
    ADOQuery1emp_id: TWideStringField;
    ADOQuery1first_sal: TFloatField;
    ADOQuery1use_sal: TFloatField;
    ADOQuery1end_sal: TFloatField;
    ADOQuery1kindemp: TWideStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1name_vim: TWideStringField;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BtnPrintClick(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMed14: TFormMed14;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  TransingFlag:boolean;
  Month:string;
  MonthADate:TDatetime;
{$R *.dfm}

procedure TFormMed14.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'med14');
  InitForm;// Init Form
end;

procedure TFormMed14.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='med14_titl,just_doing,not_find_data,total,current_location,finish,'
  +'msg_error_month,msg_finish_month_trans,msg_this_month_finished,'
  +'msg_last_month_not_finish,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormMed14.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str:string;
begin
  EditMonth.Text:=FormatDateTime('yyyymm',date);
  sql_str:='select dept_code+'' ''+abbr_titl as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,CobDeptBegin);
  SetComboxList(sql_str,CobDeptEnd);
end;

procedure TFormMed14.BtnQueryClick(Sender: TObject);
var
  sql_str:string;
begin
  month:=EditMonth.Text;
  if not TryEncodeDate(StrToInt(LeftStr(month,4)),StrToInt(MidStr(month,5,2)),01,monthAdate) then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_error_month'));
    exit;
  end;
  sql_str:='select * from hrd_med_sal as A,hrd_emp as B where'
    +' A.emp_id=B.emp_id and A.month='''+FormatDatetime('yyyymm',monthAdate)+'''';
  if trim(emp_id_b.Text)<>'' then
    sql_str:=sql_str+' and A.emp_id>='''+Trim(emp_id_b.Text)+'''';
  if trim(emp_id_e.Text)<>'' then
    sql_str:=sql_str+' and A.emp_id<='''+Trim(emp_id_e.Text)+'''';
  if trim(CobDeptBegin.Text)<>'' then
    sql_str:=sql_str+' and B.dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if trim(CobDeptEnd.Text)<>'' then
    sql_str:=sql_str+' and B.dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  if trim(use_money_b.Text)<>'' then
    sql_str:=sql_str+' and A.use_sal>='+Trim(use_money_b.Text);
  if trim(use_money_e.Text)<>'' then
    sql_str:=sql_str+' and A.use_sal<='+Trim(use_money_e.Text);
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
end;

procedure TFormMed14.BtnPrintClick(Sender: TObject);
begin
  ShowPrint(ADOQuery1,formatdatetime('yyyy"年"mm"月"',MonthADate)+GetLangName(LangStr,'med14_titl'));
end;

procedure TFormMed14.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormMed14.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示
begin
if not TransingFlag then
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(DataSet.RecNo)
    +' '+GetLangName(LangStr,'total')+':'+inttostr(DataSet.RecordCount));
end;

procedure TFormMed14.ADOQuery1CalcFields(DataSet: TDataSet);
//計算欄位(工號信息)
var
  emp_id:string;
  Flds:TFields;
begin
  emp_id:=DataSet.FieldByName('emp_id').AsString;
  Flds:=GetEmpInfo(emp_id);
  with DataSet do
  begin
    FieldByName('department').Value:=Flds.FieldByName('abbr_titl').AsString+'/'+Flds.FieldByName('vim_titl').Value;
  end;
end;

end.
