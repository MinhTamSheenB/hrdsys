{*************************************************************************
Name：med08
Author: anil
Create date:2005-11-4
Modify date:2005-11-5
Commentate:庫存重整
  (從庫存月檔中讀取輸入月份的庫存數據;
  入庫檔,處方檔,領藥檔,報廢檔中讀取實際數據寫入庫存月檔相應欄位;
  可手動修改)
*************************************************************************}
unit UnitMed08;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB, QuickRpt,
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
  TFormMed08 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelQuery: TPanel;
    DBGrid1: TTntDBGrid;
    PanelGrid: TPanel;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_Print: TTntSpeedButton;
    ADOQuery1: TADOQuery;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    Panel2: TPanel;
    EditMonth: TMaskEdit;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1month: TStringField;
    ADOQuery1dru_code: TStringField;
    ADOQuery1first_inv: TIntegerField;
    ADOQuery1in_inv: TIntegerField;
    ADOQuery1out_inv: TIntegerField;
    ADOQuery1tun_inv: TIntegerField;
    ADOQuery1dis_inv: TIntegerField;
    ADOQuery1end_inv: TIntegerField;
    ADOQuery1dru_name: TTntWideStringField;
    ADOQuery1unit_name: TTntWideStringField;
    ADOQuery1new_price: TBCDField;
    ADOQuery1inv_out1: TIntegerField;
    ADOQuery1inv_out2: TIntegerField;
    ADOQuery2: TADOQuery;
    BtnQuery: TTntBitBtn;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure GetActQty;
    procedure SetActEnabled(modify_Flag:boolean=true);
    function IfMonthTrans(ADate:Tdatetime):boolean;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  FormMed08: TFormMed08;
  RunThread :TRunThread;
  
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

procedure TFormMed08.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'med08');//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;

procedure TFormMed08.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='med08_titl,not_find_data,total,current_location,finish,reading_data,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
  +'msg_inv_lower_zero,msg_choose_tun_reason,msg_month_over_readonly,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormMed08.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
 EditMonth.Text:=FormatDateTime('yyyymm',date);
end;

function TFormMed08.IfMonthTrans(ADate:Tdatetime):boolean;
var
  sql_str,Month,NextMonth:string;
begin
  Month:=FormatDatetime('yyyymm',ADate);
  NextMonth:=FormatDatetime('yyyymm',IncMonth(ADate));
  sql_str:='select * from hrd_med_glid where month='''+NextMonth+'''';
  if CheckRecordExist(sql_str) then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_month_over_readonly'));
    result:=false;
    exit;
  end;
  result:=true;
end;

procedure TFormMed08.BtnQueryClick(Sender: TObject);
var
  sql_str,TmpTable:string;
begin
  month:=EditMonth.Text;
  if not TryEncodeDate(StrToInt(LeftStr(month,4)),StrToInt(MidStr(month,5,2)),01,monthAdate) then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_error_month'));
    exit;
  end;
  TmpTable:='Tmp'+FormatDatetime('yymmdd',date)+'Med08';
  if not CheckRecordExist('select * from sysobjects where name='''+TmpTable+'''') then
  begin//如果臨時表不存在則建臨時表
    sql_str:='create table '+TmpTable+'(dru_code varchar(10) PRIMARY KEY,inv_out1 int,inv_out2 int);'
      +'insert into '+TmpTable+' select dru_code,0,0 from hrd_med_mon where month='''+month+''';';
    with DMHrdsys.ADOCommand1 do
    begin
      CommandText:=sql_str;
      Execute;
    end;
  end;
  sql_str:='select * from hrd_med_mon as A,'+TmpTable+' as B'
    +' where month='''+month+''' and A.dru_code=B.dru_code';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  ADOQuery2.Clone(ADOQuery1);
  //在線程中處理庫存數量
  RunThread := TRunThread.Create(false);
end;

procedure TFormmed08.GetActQty;
//讀取實際數量
var
  sql_str,dru_code:string;
  in_inv,inv_out1,inv_out2,tun_inv:double;
begin
  dru_code:=ADOQuery2.FieldByName('dru_code').AsString;
  //診斷開方數
  sql_str:='select sum(med_qty) as qty from hrd_med_mast as A,'
    +' hrd_med_detl as B where A.med_code=B.med_code and dru_code='''+dru_code+''''
    +' and DATEDIFF(Month,med_date,'''+DatetimeToStr(monthADate)+''')=0 ';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      inv_out1:=FieldByName('qty').AsFloat;
  end;
  //部門領葯數
  sql_str:='select sum(med_qty) as qty from hrd_mdp_mast as A,'
    +' hrd_mdp_detl as B where A.mdp_code=B.mdp_code and dru_code='''+dru_code+''''
    +' and DATEDIFF(Month,mdp_date,'''+DatetimeToStr(monthADate)+''')=0 ';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      inv_out2:=FieldByName('qty').AsFloat;
  end;
  //進倉數
  sql_str:='select sum(into_qty) as qty from hrd_med_into where'
    +' DATEDIFF(Month,into_date,'''+DatetimeToStr(monthADate)+''')=0 and dru_code='''+dru_code+'''';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      in_inv:=FieldByName('qty').AsFloat;
  end;
  //報廢數
  sql_str:='select sum(tun_qty) as qty from hrd_med_tun where'
    +' DATEDIFF(Month,tun_date,'''+DatetimeToStr(monthADate)+''')=0 and dru_code='''+dru_code+'''';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      tun_inv:=FieldByName('qty').AsFloat;
  end;
  with ADOQuery2 do
  begin
    Edit;
    FieldByName('in_inv').AsFloat:=in_inv;
    FieldByName('inv_out1').AsFloat:=inv_out1;
    FieldByName('inv_out2').AsFloat:=inv_out2;
    FieldByName('out_inv').AsFloat:=inv_out1+inv_out2;
    FieldByName('tun_inv').AsFloat:=tun_inv;
    FieldByName('end_inv').AsFloat:=FieldByName('first_inv').AsFloat
      +in_inv+FieldByName('dis_inv').AsFloat-(inv_out1+inv_out2+tun_inv);
  end;
end;

procedure TFormMed08.ADOQuery1CalcFields(DataSet: TDataSet);
//計算欄位
var
  dru_code,sql_str:string;
  unit_str,dru_name:widestring;
  dru_price:double;
begin
  dru_code:=DataSet.FieldByName('dru_code').AsString;
  if dru_code<>'' then
  begin
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
      FieldByName('unit_name').Value:=unit_str;
      FieldByName('dru_name').Value:=dru_name;
    end;
  end;
end;

procedure TFormMed08.ADOQuery1AfterOpen(DataSet: TDataSet);
//打開數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
end;

procedure TFormMed08.ADOQuery1AfterClose(DataSet: TDataSet);
//關閉數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
end;

procedure TFormMed08.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
//改變數據集時設置功能按鈕是否可用
begin
//  SetActEnabled(true);
end;

procedure TFormMed08.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示
begin
if not TransingFlag then
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(DataSet.RecNo)
    +' '+GetLangName(LangStr,'total')+':'+inttostr(DataSet.RecordCount));
end;

procedure TFormMed08.ADOQuery1BeforePost(DataSet: TDataSet);
//數據集Post時,自動追加修改者,修改日期欄位;庫存數調整
begin
  with DataSet do
  begin
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=GetServerDatetime;
    FieldByName('out_inv').AsFloat:=FieldByName('inv_out1').AsFloat+FieldByName('inv_out2').AsFloat;
    FieldByName('end_inv').AsFloat:=FieldByName('first_inv').AsFloat
      +FieldByName('in_inv').AsFloat+FieldByName('dis_inv').AsFloat
      -FieldByName('out_inv').AsFloat-FieldByName('tun_inv').AsFloat;
  end;
end;

procedure TFormMed08.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormMed08.sb_RecoverClick(Sender: TObject);
//cancel all dataset modify
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormMed08.sb_SaveClick(Sender: TObject);
//save all dataset
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
try
  ADOQuery1.UpdateBatch;
except
  ;
end;
SetActEnabled(false);
end;

procedure TFormMed08.SetActEnabled(Modify_Flag:boolean=true);
//設置功能按鈕是否可用
var
  status:boolean;
begin
  status:=AdoQuery1.Active;
  sb_Print.Enabled:=status and Pri_Arr[Prt];
  sb_Recover.Enabled:=status and Modify_Flag and (Pri_Arr[Tran] or Pri_Arr[Upd]);
  sb_Save.Enabled:=status and Modify_Flag and (Pri_Arr[Tran] or Pri_Arr[Upd]);
end;

procedure TRunThread.execute;
{*************************************************************************
TO DO:在線程中讀取實際數據
*************************************************************************}
var
  FormMed08:TFormMed08;
begin
  FreeOnTerminate := true;
  FormMed08:=TFormmed08(Application.FindComponent('Formmed08'));
  with FormMed08 do
  begin
    SetActEnabled(false);
    PanelGrid.Enabled:=false;
    with ADOQuery2 do
    begin
      SetProcessBar(true,1,RecordCount,0);
      while not Eof do
      begin
        SetStatusText(GetLangName(LangStr,'reading_data')+inttostr(RecNo)
          +' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
        SetProcessBar(false,1);
        Synchronize(GetActQty);
        next;
      end;
      SetProcessBar(true,1);
    end;
    ADOQuery1.Clone(ADOQuery2);
    SetActEnabled(true);
    PanelGrid.Enabled:=true;
  end;
end;

end.
