{*************************************************************************
Name：med13
Author: anil
Create date:2005-10-25
Modify date:2005-10-25
Commentate:領藥查詢
*************************************************************************}
unit UnitMed13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils;

type
  TFormMed13 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PrintDialog1: TPrintDialog;
    Panel5: TPanel;
    Panel6: TPanel;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    Panel2: TPanel;
    BtnQuery: TTntButton;
    BtnPrint: TTntButton;
    ADOQuery2: TADOQuery;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField2: TStringField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    TntWideStringField1: TTntWideStringField;
    TntWideStringField2: TTntWideStringField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    StringField4: TStringField;
    DatePickerBegin: TTntDateTimePicker;
    DatePickerEnd: TTntDateTimePicker;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    dru_code_begin: TTntEdit;
    dru_code_end: TTntEdit;
    DBGrid1: TTntDBGrid;
    DBGrid2: TTntDBGrid;
    ADODataSetDetl: TADODataSet;
    DataSource2: TDataSource;
    ADOQuery1upd_user: TWideStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1mdp_code: TWideStringField;
    ADOQuery1mdp_date: TDateTimeField;
    ADOQuery1dept_code: TWideStringField;
    ADODataSetDetlupd_user: TWideStringField;
    ADODataSetDetlupd_date: TDateTimeField;
    ADODataSetDetlmdp_code: TWideStringField;
    ADODataSetDetldru_code: TWideStringField;
    ADODataSetDetldru_price: TFloatField;
    TntGroupBox2: TTntGroupBox;
    TntGroupBox3: TTntGroupBox;
    ADODataSetDetlmed_qty: TFloatField;
    ADOQuery1department: TTntWideStringField;
    ADODataSetDetldru_name: TTntWideStringField;
    ADODataSetDetlunit_name: TTntWideStringField;
    ADODataSetDetlmoney: TFloatField;
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
    procedure ADODataSetDetlCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMed13: TFormMed13;

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

procedure TFormMed13.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'med13');
  InitForm;// Init Form
end;

procedure TFormMed13.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='just_doing,not_find_data,total,current_location,finish,'
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

procedure TFormMed13.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str:string;
begin
  DatePickerBegin.Date:=StartOfTheMonth(date);
  DatePickerEnd.Date:=EndOfTheMonth(date);
  sql_str:='select dept_code+'' ''+abbr_titl as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,CobDeptBegin);
  SetComboxList(sql_str,CobDeptEnd);
end;

procedure TFormMed13.BtnQueryClick(Sender: TObject);
var
  sql_str:string;
begin
  sql_str:='select * from hrd_mdp_mast where '
    +' mdp_date>='''+DatetimeToStr(DatePickerBegin.date)+''''
    +' and mdp_date<='''+DatetimeToStr(DatePickerEnd.date)+'''';
  if trim(CobDeptBegin.Text)<>'' then
    sql_str:=sql_str+' and dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if trim(CobDeptEnd.Text)<>'' then
    sql_str:=sql_str+' and dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  if (trim(dru_code_begin.Text)<>'') or (trim(dru_code_end.Text)<>'') then
  begin//藥品代號
    sql_str:=sql_str+' and mdp_code in(select mdp_code from hrd_mdp_detl where 2=2';
    if (trim(dru_code_begin.Text)<>'') then
      sql_str:=sql_str+' and dru_code>='''+dru_code_begin.Text+'''';
    if (trim(dru_code_end.Text)<>'') then
      sql_str:=sql_str+' and dru_code<='''+dru_code_end.Text+'''';
    sql_str:=sql_str+')';
  end;
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  ADODataSetDetl.Open;
end;

procedure TFormMed13.BtnPrintClick(Sender: TObject);
var
  ServerDate:Tdatetime;
  NextMonth,sql_str,dru_code:string;
  end_inv,new_price:double;
begin

end;

procedure TFormMed13.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormMed13.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示
begin
if not TransingFlag then
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(DataSet.RecNo)
    +' '+GetLangName(LangStr,'total')+':'+inttostr(DataSet.RecordCount));
end;

procedure TFormMed13.ADOQuery1CalcFields(DataSet: TDataSet);
//計算欄位(部門名稱)
var
  dept_code:string;
  dept_str:widestring;
begin
  dept_code:=DataSet.FieldByName('dept_code').AsString;
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
      sql.Add('select * from hrd_dept where dept_code='''+dept_code+'''');
    open;
    if not Eof then
      dept_str:=FieldByName('abbr_titl').Value+'/'+FieldByName('vim_titl').Value;
  end;
  DataSet.FieldByName('department').Value:=dept_str;
end;

procedure TFormMed13.ADODataSetDetlCalcFields(DataSet: TDataSet);
//計算欄位(藥品單位,藥品名,藥品庫存)
var
  dru_code:string;
  unit_str,dru_name:widestring;
  total_money:double;
begin
  dru_code:=DataSet.FieldByName('dru_code').AsString;
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
      sql.Add('select * from hrd_dru_mast as A,hrd_med_unit as B where '
        +' A.unit_code=B.unit_code and A.dru_code='''+dru_code+'''');
    open;
    if not Eof then
    begin
      dru_name:=FieldByName('dru_name').Value;
      unit_str:=FieldByName('unit_name').Value+'/'+FieldByName('unit_vim').Value;
    end;
  end;
  with DataSet do
  begin
    FieldByName('dru_name').Value:=dru_name;
    FieldByName('unit_name').Value:=unit_str;
    FieldByName('money').AsCurrency:=FieldByName('med_qty').AsFloat*FieldByName('dru_price').AsFloat;
  end;
end;

end.
