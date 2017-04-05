{*************************************************************************
Name：med06
Author: anil
Create date:2005-10-19
Modify date:2005-10-19
Commentate:庫存月結
*************************************************************************}
unit UnitMed06;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils;

type
  TFormMed06 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PrintDialog1: TPrintDialog;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid1: TTntDBGrid;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    Panel2: TPanel;
    BtnQuery: TTntButton;
    BtnTrans: TTntButton;
    EditMonth: TMaskEdit;
    ADOQuery1dru_code: TStringField;
    ADOQuery1first_inv: TIntegerField;
    ADOQuery1in_inv: TIntegerField;
    ADOQuery1out_inv: TIntegerField;
    ADOQuery1tun_inv: TIntegerField;
    ADOQuery1dis_inv: TIntegerField;
    ADOQuery1end_inv: TIntegerField;
    ADOQuery1rea_code: TStringField;
    ADOQuery1old_price: TBCDField;
    ADOQuery1new_price: TBCDField;
    ADOQuery1dru_name: TTntWideStringField;
    ADOQuery1unit_name: TTntWideStringField;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1month: TStringField;
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
    //my define
    procedure InitLang;
    procedure InitForm;
    function IfMonthTrans(ADate:Tdatetime):boolean;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BtnTransClick(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMed06: TFormMed06;

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

procedure TFormMed06.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'med06');
  InitForm;// Init Form
end;

procedure TFormMed06.InitLang;
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

procedure TFormMed06.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  EditMonth.Text:=FormatDateTime('yyyymm',date);
end;

procedure TFormMed06.BtnQueryClick(Sender: TObject);
var
  sql_str:string;
begin
  month:=EditMonth.Text;
  if not TryEncodeDate(StrToInt(LeftStr(month,4)),StrToInt(MidStr(month,5,2)),01,monthAdate) then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_error_month'));
    exit;
  end;
  sql_str:='select * from hrd_med_mon where month='''+month+'''';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
end;

function TFormMed06.IfMonthTrans(ADate:Tdatetime):boolean;
var
  sql_str,Month,NextMonth:string;
begin
  Month:=FormatDatetime('yyyymm',ADate);
  NextMonth:=FormatDatetime('yyyymm',IncMonth(ADate));
  sql_str:='select * from hrd_med_glid where month='''+Month+'''';
  if not CheckRecordExist(sql_str) then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_last_month_not_finish'));
    result:=false;
    exit;
  end;
  sql_str:='select * from hrd_med_glid where month='''+NextMonth+'''';
  if CheckRecordExist(sql_str) then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_this_month_finished'));
    result:=false;
    exit;
  end;
  result:=true;
end;

procedure TFormMed06.BtnTransClick(Sender: TObject);
var
  ServerDate:Tdatetime;
  NextMonth,sql_str,dru_code:string;
  end_inv,new_price:double;
begin
  ServerDate:=GetServerDatetime;
  NextMonth:=FormatDatetime('yyyymm',IncMonth(MonthADate));
  if not IfMonthTrans(MonthADate) then
    exit;
  TransingFlag:=true;
  ADOQuery1.First;
  SetProcessBar(true,1,ADOQuery1.RecordCount);
  ADOQuery2.Open;
  while not ADOQuery1.Eof do //Copy 月檔
  begin
    with ADOQuery1 do
    begin                                 
      dru_code:=FieldByName('dru_code').Value;
      end_inv:=FieldByName('end_inv').AsFloat;
      new_price:=FieldByName('new_price').AsFloat;
      SetProcessBar(false,1);
      SetStatusText(GetLangName(LangStr,'just_doing')+':'+dru_code);
    end;
    with ADOQuery2 do
    begin
      Append;
      FieldByName('upd_date').AsDateTime:=ServerDate;
      FieldByName('upd_user').AsString:=username;
      FieldByName('month').AsString:=NextMonth;
      FieldByName('dru_code').AsString:=dru_code;
      FieldByName('first_inv').AsFloat:=end_inv;
      FieldByName('end_inv').AsFloat:=end_inv;
      FieldByName('old_price').AsFloat:=new_price;
      FieldByName('new_price').AsFloat:=new_price;
    end;
  ADOQuery1.next;
  end;//end while
  ADOQuery2.UpdateBatch;
  with DMHrdsys.ADOCommand1 do//hrd_med_glid(寫結轉檔)
  begin
    CommandText:='update hrd_med_glid set if_end=''T'','
      +'upd_date='''+datetimetostr(ServerDate)+''',upd_user='''+username+''''
      +' where month='''+month+'''';
    Execute;
    CommandText:='insert into hrd_med_glid values('''+username+''','''
      +datetimetostr(ServerDate)+''','''+NextMonth+''','''',''00000'',''0000'')';
    Execute;
  end;
  SetStatusText('OK');
  SetProcessBar;
  WideShowMessage(GetLangName(LangStr,'msg_finish_month_trans'));
  TransingFlag:=false;
end;

procedure TFormMed06.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormMed06.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示
begin
if not TransingFlag then
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(DataSet.RecNo)
    +' '+GetLangName(LangStr,'total')+':'+inttostr(DataSet.RecordCount));
end;

procedure TFormMed06.ADOQuery1CalcFields(DataSet: TDataSet);
//計算欄位(藥品單位)
var
  dru_code:string;
  unit_str,rea_str,dru_name:widestring;
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
  end;
end;

end.
