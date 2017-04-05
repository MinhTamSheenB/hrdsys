{*************************************************************************
Name：med09
Author: anil
Create date:2005-11-01
Modify date:2005-11-01
Commentate:出庫匯總
*************************************************************************}
unit UnitMed09;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils;

type
  TFormMed09 = class(TForm)
    Panel1: TPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PrintDialog1: TPrintDialog;
    Panel5: TPanel;
    Panel6: TPanel;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    Panel2: TPanel;
    DatePickerBegin: TTntDateTimePicker;
    DatePickerEnd: TTntDateTimePicker;
    TntLabel2: TTntLabel;
    dru_code_begin: TTntEdit;
    dru_code_end: TTntEdit;
    DBGrid1: TTntDBGrid;
    DBGrid2: TTntDBGrid;
    ADODataSetDetl: TADODataSet;
    DataSource2: TDataSource;
    TntGroupBox2: TTntGroupBox;
    TntGroupBox3: TTntGroupBox;
    TntLabel1: TTntLabel;
    med_code_begin: TTntEdit;
    med_code_end: TTntEdit;
    ADOQuery1dru_code: TWideStringField;
    ADOQuery1med_qty: TFloatField;
    ADODataSetDetlmed_code: TWideStringField;
    ADODataSetDetlmed_qty: TFloatField;
    ADOQuery1dru_name: TTntWideStringField;
    ADOQuery1unit_name: TTntWideStringField;
    ADOQuery1dru_price: TFloatField;
    Btn_Search: TTntBitBtn;
    Btn_Reset: TTntBitBtn;
    Btn_Print: TTntBitBtn;
    PanelTitle: TTntPanel;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure SetDetailData;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure Btn_ResetClick(Sender: TObject);
    procedure Btn_PrintClick(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMed09: TFormMed09;

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

procedure TFormMed09.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'med09');
  InitForm;// Init Form
end;

procedure TFormMed09.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='just_doing,not_find_data,total,current_location,finish,'
  +'msg_error_month,msg_finish_month_trans,msg_this_month_finished,'
  +'msg_last_month_not_finish,med09_prt_titl,vietnam_chingluh_company,'
  +'date_range,med_code_range,dru_code_range,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormMed09.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str:string;
begin
  DatePickerBegin.Date:=StartOfTheMonth(date);
  DatePickerEnd.Date:=EndOfTheMonth(date);
end;

procedure TFormMed09.Btn_SearchClick(Sender: TObject);
var
  sql_str,fld_str,where_str:string;
begin
  sql_str:='select B.dru_code,sum(med_qty) as med_qty'
    +' from hrd_med_mast as A,hrd_med_detl as B where A.med_code=B.med_code '
    +' and A.med_date>='''+DatetimeToStr(dateof(DatePickerBegin.date))+''''
    +' and A.med_date<='''+DatetimeToStr(dateof(DatePickerEnd.date))+'''';
  //處方單號
  if (trim(med_code_begin.Text)<>'') then
    sql_str:=sql_str+' and B.med_code>='''+med_code_begin.Text+'''';
  if (trim(med_code_end.Text)<>'') then
    sql_str:=sql_str+' and B.med_code<='''+med_code_end.Text+'''';
  //藥品代號
  if (trim(dru_code_begin.Text)<>'') then
    sql_str:=sql_str+' and B.dru_code>='''+dru_code_begin.Text+'''';
  if (trim(dru_code_end.Text)<>'') then
    sql_str:=sql_str+' and B.dru_code<='''+dru_code_end.Text+'''';
  fld_str:='';
  sql_str:= sql_str+' group by dru_code';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  Btn_Reset.OnClick(Sender);
end;

procedure TFormMed09.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormMed09.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示
begin
if not TransingFlag then
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(DataSet.RecNo)
    +' '+GetLangName(LangStr,'total')+':'+inttostr(DataSet.RecordCount));
SetDetailData;
end;

procedure TFormMed09.SetDetailData;
var
  sql_str,dru_code:string;
begin
  dru_code:=ADOQuery1.FieldByName('dru_code').AsString;
  sql_str:='select B.med_code,B.med_qty from hrd_med_mast as A,hrd_med_detl as B '
    +' where A.med_code=B.med_code and B.dru_code='''+dru_code+''''
    +' and A.med_date>='''+DatetimeToStr(DatePickerBegin.date)+''''
    +' and A.med_date<='''+DatetimeToStr(DatePickerEnd.date)+'''';
  //處方單號
  if (trim(med_code_begin.Text)<>'') then
    sql_str:=sql_str+' and B.med_code>='''+med_code_begin.Text+'''';
  if (trim(med_code_end.Text)<>'') then
    sql_str:=sql_str+' and B.med_code<='''+med_code_end.Text+'''';
  with ADODataSetDetl do
  begin
    close;
    CommandText:=sql_str;
    open;
  end;
end;

procedure TFormMed09.ADOQuery1CalcFields(DataSet: TDataSet);
//計算欄位(藥品單位,藥品名,藥品庫存)
var
  dru_code:string;
  unit_str,dru_name:widestring;
  dru_price:double;
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
      dru_price:=FieldByName('dru_price').AsFloat;
    end;
  end;
  with DataSet do
  begin
    FieldByName('dru_name').Value:=dru_name;
    FieldByName('unit_name').Value:=unit_str;
    FieldByName('dru_price').AsFloat:=dru_price;
  end;
end;

procedure TFormMed09.Btn_ResetClick(Sender: TObject);
var
  status:boolean;
begin
if TtntBitBtn(Sender).Name='Btn_Reset' then
  status:=true
else
  status:=false;
DatePickerBegin.Enabled:=status;
DatePickerEnd.Enabled:=status;
med_code_begin.Enabled:=status;
med_code_end.Enabled:=status;
dru_code_begin.Enabled:=status;
dru_code_end.Enabled:=status;
Btn_Search.Enabled:=status;
Btn_Reset.Enabled:=not status;
Btn_Print.Enabled:=not status;
ADODatasetDetl.Active:= not status;
ADOQuery1.Active:= not status;
end;

procedure TFormMed09.Btn_PrintClick(Sender: TObject);
var
  titl:widestring;
begin
  titl:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangC,'med09_prt_titl')+'<br>';
  titl:=titl+'<left>'+GetLangName(LangC,'date_range')+':'
    +formatdatetime('yyyy/mm/dd',datepickerBegin.Date)
    +'--'+formatdatetime('yyyy/mm/dd',datepickerEnd.Date);
  if (med_code_begin.Text<>'') or (med_code_end.Text<>'') then
    titl:=titl+'         '+GetLangName(LangC,'med_code_range')+':'
    +med_code_begin.Text+'--'+med_code_end.Text;
  if (dru_code_begin.Text<>'') or (dru_code_end.Text<>'') then
    titl:=titl+'         '+GetLangName(LangC,'dru_code_range')+':'
    +dru_code_begin.Text+'--'+dru_code_end.Text;
  showPrint(ADOQuery1,titl);
end;

procedure TFormMed09.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
  SetDetailData;
end;

end.
