{*************************************************************************
Name：med05
Author: anil
Create date:2005-10-19
Modify date:2005-10-19
Commentate:藥品庫存盤點
*************************************************************************}
unit UnitMed05;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB, QuickRpt,
  DBClient, Provider,DateUtils;

type
  TFormMed05 = class(TForm)
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
    BtnQuery: TTntButton;
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
    ADOQuery1rea_code: TStringField;
    ADOQuery1old_price: TBCDField;
    ADOQuery1new_price: TBCDField;
    ADOQuery1dru_name: TTntWideStringField;
    ADOQuery1unit_name: TTntWideStringField;
    ADOQuery1rea_name: TTntWideStringField;
    //my define
    procedure InitLang;
    procedure InitForm;
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
    procedure sb_PrintClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure ADOQuery1end_invChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMed05: TFormMed05;

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

procedure TFormMed05.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'med05');//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;

procedure TFormMed05.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='med05_titl,not_find_data,total,current_location,finish,'
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

procedure TFormMed05.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
 EditMonth.Text:=FormatDateTime('yyyymm',date);
end;

function TFormMed05.IfMonthTrans(ADate:Tdatetime):boolean;
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

procedure TFormMed05.BtnQueryClick(Sender: TObject);
var
  sql_str:string;
begin
  month:=EditMonth.Text;
  if not TryEncodeDate(StrToInt(LeftStr(month,4)),StrToInt(MidStr(month,5,2)),01,monthAdate) then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_error_month'));
    exit;
  end;
  with DBGrid1 do
  begin
    if not IfMonthTrans(MonthADate) then
    begin//如果已經月結則只讀
      Columns[5].Color:=DBGrid1.Color;
      Columns[5].ReadOnly:=true;
      Columns[6].Color:=DBGrid1.Color;
      Columns[6].ReadOnly:=true;
    end
    else
    begin
      Columns[5].Color:=clWhite;
      Columns[5].ReadOnly:=false;
      Columns[6].Color:=clWhite;
      Columns[6].ReadOnly:=false;
    end;
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

procedure TFormMed05.ADOQuery1CalcFields(DataSet: TDataSet);
//計算欄位
var
  dru_code,item_no,rea_code:string;
  unit_str,rea_str,dru_name:widestring;
  dru_price:double;
begin
  dru_code:=DataSet.FieldByName('dru_code').AsString;
  rea_code:=DataSet.FieldByName('rea_code').AsString;
  if rea_code<>'' then
    with DMHrdsys.SQLQuery2 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from hrd_dru_rea where rea_code='''+rea_code+'''');
      open;
      rea_str:=FieldByName('rea_name').Value+'/'+FieldByName('rea_vim').Value;
      DataSet.FieldByName('rea_name').Value:=rea_str;
    end;
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
        item_no:=FieldByName('rul_code').AsString;
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

procedure TFormMed05.ADOQuery1AfterOpen(DataSet: TDataSet);
//打開數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
end;

procedure TFormMed05.ADOQuery1AfterClose(DataSet: TDataSet);
//關閉數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
end;

procedure TFormMed05.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
//改變數據集時設置功能按鈕是否可用
begin
  SetActEnabled(true);
end;

procedure TFormMed05.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示
begin
if not TransingFlag then
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(DataSet.RecNo)
    +' '+GetLangName(LangStr,'total')+':'+inttostr(DataSet.RecordCount));
end;

procedure TFormMed05.ADOQuery1BeforePost(DataSet: TDataSet);
//數據集Post時,自動追加修改者,修改日期欄位
begin
  with DataSet do
    begin
      FieldByName('upd_user').AsString:=UserName;
      FieldByName('upd_date').AsDateTime:=GetServerDatetime;
    end;
end;

procedure TFormMed05.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormMed05.sb_PrintClick(Sender: TObject);
//print dataset
begin
  showPrint(ADOQuery1,Month+GetLangName(LangStr,'med05_titl'));
end;

procedure TFormMed05.sb_RecoverClick(Sender: TObject);
//cancel all dataset modify
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormMed05.sb_SaveClick(Sender: TObject);
//save all dataset
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.UpdateBatch;
SetActEnabled(false);
end;

procedure TFormMed05.SetActEnabled(Modify_Flag:boolean=true);
//設置功能按鈕是否可用
var
  status:boolean;
begin
  status:=AdoQuery1.Active;
  sb_Print.Enabled:=status and Pri_Arr[Prt];
  sb_Add.Enabled:=Pri_Arr[ADD];
  sb_Del.Enabled:=status and Pri_Arr[DEL];
  sb_edit.Enabled:=status and Pri_Arr[UPD];
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;

procedure TFormMed05.ADOQuery1end_invChange(Sender: TField);
var
  old_dis,chg_num:double;
begin
  if Sender.Value<0 then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_inv_lower_zero'));
    Sender.Value:=Sender.OldValue;
    Abort;
    exit;
  end;
  with ADOQuery1 do
  begin
    if FieldByName('dis_inv').OldValue<>null then
      old_dis:=FieldByName('dis_inv').OldValue
    else
      old_dis:=0;
    chg_num:=FieldByName('end_inv').Value-FieldByName('end_inv').OldValue;
    FieldByName('dis_inv').AsFloat:=old_dis+chg_num;
  end;
end;

end.
