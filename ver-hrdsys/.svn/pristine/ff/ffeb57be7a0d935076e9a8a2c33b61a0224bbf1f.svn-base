{*************************************************************************
Name：med02(藥品進倉)
Author: anil
Create date:2005-10-17
Modify date:2005-10-18
Commentate:藥品進倉
*************************************************************************}
unit UnitMed02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils;

type
  TFormMed02 = class(TForm)
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
    DTPickBegin: TTntDateTimePicker;
    DTPickEnd: TTntDateTimePicker;
    BtnTrans: TTntButton;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    DBGrid2: TTntDBGrid;
    DataSource2: TDataSource;
    TntGroupBox2: TTntGroupBox;
    TntGroupBox3: TTntGroupBox;
    ADOQuery1dru_code: TWideStringField;
    ADOQuery1dru_name: TWideStringField;
    ADOQuery1dru_price: TFloatField;
    ADOQuery1unit_code: TWideStringField;
    ADOQuery1rul_code: TWideStringField;
    ADOQuery1pro_code: TFloatField;
    ADOQuery1ACPT_DATE: TDateTimeField;
    ADOQuery1DEPARTMENT: TWideStringField;
    ADOQuery1ACPT_QTY: TFloatField;
    ADOQuery1ACPT_NO: TWideStringField;
    ADOQuery1ACPT_PRCE: TFloatField;
    ADOQuery2into_date: TDateTimeField;
    ADOQuery2dru_code: TStringField;
    ADOQuery2into_qty: TIntegerField;
    ADOQuery2dru_price: TBCDField;
    ADOQuery2acpt_no: TStringField;
    ADOQuery1unit_name: TTntWideStringField;
    ADOQuery1PROC_DATE: TDateTimeField;
    ADOQuery2upd_user: TStringField;
    ADOQuery2upd_date: TDateTimeField;
    //my define
    procedure InitLang;
    procedure InitForm;
    function GetPrice(ck_no:string):double;
    function GetExchRate(curr_src,curr_obj:string;cnt_date:Tdatetime):double;
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
  FormMed02: TFormMed02;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  TransingFlag:boolean;
{$R *.dfm}

procedure TFormMed02.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'med02');
  InitForm;// Init Form
end;

procedure TFormMed02.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='just_doing_acptno,not_find_data,total,current_location,finish';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormMed02.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  DTPickBegin.Date:=StartOfTheMonth(date);
  DTPickEnd.Date:=EndOfTheMonth(date);
end;

procedure TFormMed02.BtnQueryClick(Sender: TObject);
var
  sql_str:string;
begin
  sql_str:='select distinct * from hrd_dru_mast as A,inv_acpt as B'
    +' where A.rul_code=B.item_no'
    +' and A.rul_code like ''XR%'' and B.department=''V10303'' '
    +' and B.acpt_no not in (select acpt_no from hrd_med_into)';
  sql_str:=sql_str+' and B.acpt_date>='''+datetimetostr(DTPickBegin.date)+'''';
  sql_str:=sql_str+' and B.acpt_date<='''+datetimetostr(DTPickEnd.date)+'''';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  ADOQuery2.Open;
end;

procedure TFormMed02.BtnTransClick(Sender: TObject);
var
  ServerDate,into_date:Tdatetime;
  sql_str,month,dru_code,unit_code,acpt_no,item_no,currency:string;
  dru_name:widestring;
  into_qty,into_price,old_price,new_price,nlPrice,nlCoe,exch_rate:double;
begin
  TransingFlag:=true;
  ServerDate:=GetServerDatetime;
  SetProcessBar(true,1,ADOQuery1.RecordCount);
  ADOQuery1.First;
  while not ADOQuery1.Eof do
  begin
    with ADOQuery1 do//從轉檔前數據集中取欄位
    begin
      acpt_no:=FieldByName('acpt_no').Value;//領料批號
      SetProcessBar(false,1);
      SetStatusText(GetLangName(LangStr,'just_doing_acptno')+':'+acpt_no);
      dru_code:=FieldByName('dru_code').Value;
      dru_name:=FieldByName('dru_name').Value;
      unit_code:=FieldByName('unit_code').Value;
      item_no:=FieldByName('rul_code').Value;//物料編號
      nlCoe:=FieldByName('pro_code').Value;//系數
      into_date:=FieldByName('proc_date').AsDateTime;//進倉日期
      month:=formatdatetime('yyyymm',into_date);//月份
      into_qty:=FieldByName('acpt_qty').AsFloat*nlCoe;//進倉數量
      old_price:=FieldByName('dru_price').Value;//舊單價
      with DMHrdsys.SQLQuery3 do
      begin//平均單價
        sql_str:='select * from pur_unit where item_no='''+item_no+'''';
        close;
        sql.Clear;
        sql.Add(sql_str);
        open;
        if RecordCount>1 then
        begin
          continue;
        end
        else
        begin
          nlPrice:=FieldByName('deal_price').AsCurrency;
          currency:=FieldByName('currency').AsString;
        end;
      end;
      exch_rate:=GetExchRate(currency,'VND',into_date);//計算匯率
      nlPrice:=nlPrice*exch_rate;//轉成越盾后的單價
      into_price:=nlPrice/nlCoe;//進倉單價
    end;//end ADOQuery1
    with ADOQuery2 do//hrd_med_into(寫藥品進倉檔)
    begin
      append;
      FieldByname('upd_user').Value:=username;
      FieldByname('upd_date').Value:=ServerDate;
      FieldByname('into_date').AsDateTime:=into_date;
      FieldByname('dru_code').Value:=dru_code;
      FieldByname('into_qty').Value:=into_qty;
      FieldByname('dru_price').AsCurrency:=nlPrice;
      FieldByname('acpt_no').Value:=acpt_no;
      post;
    end;//end ADOQuery2
    with ADOQuery3 do//hrd_med_mon(寫藥品月檔)
    begin
      sql_str:='select * from hrd_med_mon where dru_code='''+dru_code+''' and month='''+month+'''';
      close;
      sql.Clear;
      sql.Add(sql_str);
      open;
      if not Eof then//存在時修改
      begin
        new_price:=(old_price*FieldByname('end_inv').AsFloat+nlPrice*into_qty )/(FieldByname('end_inv').AsFloat+into_Qty );
        Edit;
        FieldByname('upd_user').Value:=username;
        FieldByname('upd_date').Value:=ServerDate;
        FieldByname('in_inv').Value:=FieldByname('in_inv').Value+into_qty;
        FieldByname('end_inv').Value:=FieldByname('end_inv').Value+into_qty;
        FieldByname('new_price').AsFloat:=new_price;
        if FieldByname('old_price').AsString ='' then
          FieldByname('old_price').AsFloat:= new_price;
      end//end exist
      else//不存在時新增
      begin
        append;
        new_price:=into_price;
        FieldByname('upd_user').Value:=username;
        FieldByname('upd_date').Value:=ServerDate;
        FieldByname('month').Value:=month;
        FieldByname('dru_code').Value:=dru_code;
        FieldByname('in_inv').Value:=into_qty;
        FieldByname('end_inv').Value:=into_qty;
        FieldByname('old_price').AsFloat:=new_price;     
        FieldByname('new_price').AsFloat:=new_price;
      end;//end not exist
      post;
    end;//end ADOQuery3
    with DMHrdsys.ADOCommand1 do//hrd_dru_mast(寫藥品編號檔)
    begin
      CommandText:='update hrd_dru_mast set upd_user='''+username+''','
        +'upd_date='''+datetimetostr(ServerDate)+''',dru_price='+floattostr(new_price)
        +' where dru_code='''+dru_code+'''';
      Execute;
    end;//end ADOQuery4
    ADOQuery1.next;
  end;
  ADOQuery2.UpdateBatch;
  SetStatusText('OK');
  SetProcessBar;
  TransingFlag:=false;
end;

function TFormMed02.GetPrice(ck_no:string):double;
{*************************************************************************
TO DO:計算單價
*************************************************************************}
var
  sql_str,currency:string;
  exch_rate:double;
  in_date:Tdatetime;
begin
  sql_str:='select * from inv_insp where cr_tikt_no='''+ck_no+'''';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
    begin
      currency:=FieldByName('currency').AsString;
      in_date:=FieldByName('proc_date').AsDatetime;
      exch_rate:=GetExchRate(currency,'VND',in_date);//計算匯率
      result:=exch_rate*FieldByName('oi_price').AsFloat;
    end
    else
      result:=0;
  end;
end;


function TFormMed02.GetExchRate(curr_src,curr_obj:string;cnt_date:Tdatetime):double;
{*************************************************************************
TO DO:計算匯率
*************************************************************************}
var
  datestr,sql_str:string;
  rate1,rate2:double;
begin
  if curr_src=curr_obj then
  begin
    result:=1;
    exit;
  end;
  datestr:=formatdatetime('yyyymmdd',cnt_date);
  sql_str:='select * from cos_exch where currency1='''+curr_src+''' and cnt_date='''+datestr+'''';
  with DMHrdsys.SQLQuery3 do
  begin//平均單價
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      rate1:=FieldByName('exchg_rate').AsFloat
    else
      rate1:=1;
    sql_str:='select * from cos_exch where currency1='''+curr_obj+''' and cnt_date='''+datestr+'''';
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      rate2:=FieldByName('exchg_rate').AsFloat
    else
      rate2:=1;
  end;
  result:=rate2/rate1;
end;

procedure TFormMed02.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormMed02.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示
begin
if not TransingFlag then
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(DataSet.RecNo)
    +' '+GetLangName(LangStr,'total')+':'+inttostr(DataSet.RecordCount));
end;

procedure TFormMed02.ADOQuery1CalcFields(DataSet: TDataSet);
//計算欄位(藥品單位)
begin
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_med_unit where unit_code='''+ADOQuery1.FieldByName('unit_code').AsString+'''');
    open;
    if not Eof then
      ADOQuery1.FieldByName('unit_name').AsString:=FieldByName('unit_name').AsString;
  end;
end;

end.
