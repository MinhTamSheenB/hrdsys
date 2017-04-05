{*************************************************************************
Name：med11
Author: anil
Create date:2005-10-20
Modify date:2005-10-20
Commentate:藥品領用
*************************************************************************}
unit UnitMed11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB, QuickRpt,
  DBClient, Provider,DateUtils,Printers;

type
  TFormMed11 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_Print: TTntSpeedButton;
    ADOQuery1: TADOQuery;
    PanelDetail: TPanel;
    PanelInput: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntGroupBox4: TTntGroupBox;
    DBGrid1: TTntDBGrid;
    PanelMast: TTntPanel;
    TntLabel45: TTntLabel;
    TntLabel42: TTntLabel;
    PickerDate: TTntDateTimePicker;
    PanelInputTitl: TPanel;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    EditMdpCode: TTntEdit;
    EditUser: TTntEdit;
    DataSource2: TDataSource;
    ADOQuery1upd_user: TWideStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1MDP_CODE: TWideStringField;
    ADOQuery1MDP_DATE: TDateTimeField;
    ADOQuery1DEPT_CODE: TWideStringField;
    ADOQueryDetl: TADOQuery;
    ADOQueryDetlupd_user: TWideStringField;
    ADOQueryDetlupd_date: TDateTimeField;
    ADOQueryDetlMDP_CODE: TWideStringField;
    ADOQueryDetlDRU_CODE: TWideStringField;
    ADOQueryDetlMED_QTY: TFloatField;
    ADOQueryDetlDRU_PRICE: TFloatField;
    ADOQueryDetldru_name: TTntWideStringField;
    ADOQueryDetlunit_name: TTntWideStringField;
    ADOQueryDetlend_inv: TFloatField;
    EditDept: TTntEdit;
    CobDept: TTntComboBox;
    PrintDialog1: TPrintDialog;
    ADOQueryDetlmoney: TCurrencyField;
    PanelSum: TTntPanel;
    TntLabel3: TTntLabel;
    EditTotal: TTntEdit;
    //my define
    procedure InitLang;
    procedure InitForm;
    function GetSeqCode():string;
    procedure SetPrintObject(PreFlag:boolean);
    function SaveData:boolean;
    procedure OverListDetl(AddFlag:boolean);
    function CheckInputValid():boolean;
    procedure SetActEnabled(modify_Flag:boolean=true);
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure sb_PrintClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure EditMdpCodeChange(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure CobDeptChange(Sender: TObject);
    procedure PickerDateChange(Sender: TObject);
    procedure ADOQueryDetlBeforePost(DataSet: TDataSet);
    procedure ADOQueryDetlCalcFields(DataSet: TDataSet);
    procedure ADOQueryDetlDRU_CODEChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMed11: TFormMed11;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  TransingFlag:boolean;
  Month,AMonth,mdp_code:string;
  ADate:TDatetime;
{$R *.dfm}

procedure TFormMed11.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'med11');//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;

procedure TFormMed11.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='med05_titl,not_find_data,total,current_location,finish,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_from_db,'
  +'msg_inv_lower_zero,msg_save_mdp_code,'
  +'hrd08_dept_null,msg_this_month_finished,msg_last_month_not_finish,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormMed11.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str:string;
begin
  PickerDate.Date:=date;
  sql_str:='select dept_code+'' ''+abbr_titl as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,CobDept);
  EditUser.Text:=username;
  //sb_Add.OnClick(self);
end;

function TFormMed11.GetSeqCode():string;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str,next_code,the_code:string;
  next_no:integer;
begin
  with DMHrdsys.SQLQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT dept_no as MaxCode FROM hrd_med_glid where month = '''+month+'''');
    open;
    the_code:=FieldByName('MaxCode').AsString;
    if not TryStrToInt(the_code,next_no) then//序號
      next_no:=0;
    next_no:= next_no + 1;
    next_code :=  Format('%.4d', [next_no]);
  end;
result:=next_code;
end;

procedure TFormMed11.BtnQueryClick(Sender: TObject);
var
  sql_str:string;
begin
  sql_str:='select * from hrd_mdp_mast where mdp_code='''+Amonth+'''';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
end;

procedure TFormMed11.ADOQuery1AfterOpen(DataSet: TDataSet);
//打開數據集時設置功能按鈕是否可用
var
  sql_str:string;
begin
  SetActEnabled(false);
  with DataSet do
  if not Eof then
  begin
    mdp_code:=FieldByName('mdp_code').AsString;
    SetComboxIndex(CobDept,FieldByName('dept_code').AsString);
    PickerDate.Date:=FieldByName('mdp_date').AsDateTime;
  end;
  sql_str:='select * from hrd_mdp_detl where mdp_code='''+mdp_code+'''';
  with ADOQueryDetl do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
//    CommandText:=sql_str;
    open;
  end;
end;

procedure TFormMed11.ADOQuery1AfterClose(DataSet: TDataSet);
//關閉數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
end;

procedure TFormMed11.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
//改變數據集時設置功能按鈕是否可用
begin
  SetActEnabled(true);
end;

procedure TFormMed11.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示
begin
if not TransingFlag then
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(DataSet.RecNo)
    +' '+GetLangName(LangStr,'total')+':'+inttostr(DataSet.RecordCount));
end;

procedure TFormMed11.ADOQuery1BeforePost(DataSet: TDataSet);
//數據集Post時,自動追加修改者,修改日期欄位
begin
  with DataSet do
    begin
      FieldByName('upd_user').AsString:=UserName;
      FieldByName('upd_date').AsDateTime:=GetServerDatetime;
    end;
end;

procedure TFormMed11.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormMed11.SetPrintObject(PreFlag:boolean);
//設置打印的元件
begin
  PanelAct.Visible:=not PreFlag;
  CobDept.Visible:=not PreFlag;
  EditDept.Text:=CobDept.Text;
  EditDept.Visible:=PreFlag;
  PickerDate.Enabled:=PreFlag;
end;

procedure TFormMed11.sb_PrintClick(Sender: TObject);
//print dataset
begin
  if ADOQuery1.Eof then
    exit;
  if not PrintDialog1.Execute then
    exit;
  SetPrintObject(true);
  self.PrintScale:=poPrintToFit;
  self.Print;
  SetPrintObject(false);
//  showPrint(ADOQuery1,AMonth+GetLangName(LangStr,'med11_titl'));
end;

procedure TFormMed11.sb_RecoverClick(Sender: TObject);
//cancel all dataset modify
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormMed11.sb_SaveClick(Sender: TObject);
//save all dataset
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  if not CheckInputValid then
    exit;
  if not SaveData then//保存數據
    exit;
  SetActEnabled(false);
  WideShowMessage(GetLangName(LangStr,'msg_save_mdp_code')+mdp_code);
  EditMdpCode.Text:=mdp_code;//顯示該筆資料
  //sb_Add.OnClick(self);//新增新的一筆空資料
end;

function TFormMed11.CheckInputValid():boolean;
//檢查輸入是否合法
begin
  if trim(CobDept.Text)='' then
  begin
    WideShowMessage(GetLangName(LangStr,'hrd08_dept_null'));
    CobDept.SetFocus;
    result:=false;
    exit;
  end;
  result:=true;
end;

procedure TFormMed11.OverListDetl(AddFlag:boolean);
//遍歷明細表,修改庫存月檔
var
  dru_code:string;
  med_qty:double;
  ServerTime:Tdatetime;
begin
  Month:=FormatDatetime('yyyymm',ADate);
  ServerTime:=GetServerDatetime;
  ADOQueryDetl.First;
  while not ADOQueryDetl.Eof do
  begin
    with ADOQueryDetl do
    begin
      Edit;
      dru_code:=FieldByName('dru_code').AsString;
      med_qty:=FieldByName('med_qty').AsFloat;
      if not AddFlag then//刪除時變為負數
      begin
        med_qty:=0-med_qty;
        Delete;
      end
      else
        Post;//新增時給明細檔mdp_code重賦值
    end;
    with DMHrdsys.SQLQuery4 do//保存到庫存月檔(hrd_med_mon)
    begin
      close;
      sql.Clear;
      sql.Add('select * from hrd_med_mon where dru_code='''+dru_code+''' and month='''+month+'''');
      open;
      if not Eof then
      begin
        Edit;
        FieldByName('upd_date').AsDateTime:=ServerTime;
        FieldByName('upd_user').AsString:=username;
        FieldByName('end_inv').AsFloat:=FieldByName('end_inv').AsFloat-med_qty;
        FieldByName('out_inv').AsFloat:=FieldByName('out_inv').AsFloat+med_qty;
        Post;
      end;
    end;
    if AddFlag then//新增時往下移動
      ADOQueryDetl.Next;
  end;
end;

function TFormMed11.SaveData:boolean;
//保存數據
var
  seq_no:string;
  ServerTime:Tdatetime;
begin
  ADate:=PickerDate.Date;
  AMonth:=FormatDatetime('yymm',ADate);
  Month:=FormatDatetime('yyyymm',ADate);
  ServerTime:=GetServerDatetime;
  if length(trim(EditMdpCode.Text))<9 then
  begin
    seq_no:=GetSeqCode;//產生領藥批號
    mdp_code:='V'+AMonth+seq_no;
  end;
  with DMHrdsys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM hrd_med_glid where month= '''+month+'''');
    open;
    if Eof then//上月資料未月結
    begin
      WideShowMessage(GetLangName(LangStr,'msg_last_month_not_finish'));
      result:=false;
      exit;
    end
    else if FieldByName('if_end').AsString='T' then//該月資料已月結
    begin
      WideShowMessage(GetLangName(LangStr,'msg_this_month_finished'));
      result:=false;
      exit;
    end
    else//保存到月結檔(hrd_med_glid)
    begin
      Edit;
      FieldByName('upd_date').AsDateTime:=ServerTime;
      FieldByName('upd_user').AsString:=username;
      FieldByName('dept_no').AsString:=seq_no;
      Post;
    end;
  end;
  OverListDetl(true);//遍歷明細檔,保存到月檔
  with ADOQuery1 do//保存到領藥主檔(hrd_mdp_mast)
  begin
    Edit;
    FieldByName('mdp_code').AsString:=mdp_code;
    FieldByName('dept_code').AsString:=LeftStr(CobDept.Text,6);
    FieldByName('mdp_date').AsDateTime:=PickerDate.Date;
    UpdateBatch;
  end;
  ADOQueryDetl.UpdateBatch;//保存到領藥明細檔(hrd_mdp_detl)
  result:=true;
end;

procedure TFormMed11.SetActEnabled(Modify_Flag:boolean=true);
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

procedure TFormMed11.sb_AddClick(Sender: TObject);
var
  sql_str:string;
begin
  ADate:=PickerDate.Date;
  AMonth:=FormatDatetime('yymm',ADate);
  mdp_code:='AAAA';
  sql_str:='select * from hrd_mdp_mast where 1=2';
  with ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.Add(sql_str);
    open;
    Append;
    FieldByName('mdp_code').AsString:=mdp_code;
  end;
  if trim(EditMdpCode.Text)<>'' then
    EditMdpCode.Text:='';
  CobDept.SetFocus;
  SetActEnabled(true);
end;

procedure TFormMed11.EditMdpCodeChange(Sender: TObject);
//輸入mdp_code則查詢
var
  sql_str:string;
begin
  ADate:=PickerDate.Date;
  AMonth:=FormatDatetime('yymm',ADate);
  mdp_code:=trim(EditMdpCode.Text);
  if length(mdp_code)<9 then
  begin
    if mdp_code='' then
    begin
      CobDept.Enabled:=true;
      PickerDate.Enabled:=true;
      with DBGrid1 do
      begin
        Columns[0].Color:=clWhite;
        Columns[4].Color:=clWhite;
        Columns[0].ReadOnly:=false;
        Columns[4].ReadOnly:=false;
      end;
    end;  
    exit;
  end;
  sql_str:='select * from hrd_mdp_mast where mdp_code='''+mdp_code+'''';
  with ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.Add(sql_str);
    open;
  end;
  CobDept.Enabled:=false;
  PickerDate.Enabled:=false;
  with DBGrid1 do
  begin
    Columns[0].Color:=cl3DLight;
    Columns[4].Color:=cl3DLight;
    Columns[0].ReadOnly:=true;
    Columns[4].ReadOnly:=true;
  end;  
  SetActEnabled(false);
end;

procedure TFormMed11.sb_DelClick(Sender: TObject);
//刪除
begin
  if ADOQuery1.Eof then
    exit;
  if wideMessageDlg(GetLangName(LangStr,'msg_del_from_db'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  ADate:=PickerDate.Date;
  OverListDetl(false);//遍歷明細檔,保存到月檔
  ADOQueryDetl.UpdateBatch;
  ADOQuery1.Delete;
  ADOQuery1.UpdateBatch;
  EditMdpCode.Text:='';
  SetActEnabled(false);
end;

procedure TFormMed11.CobDeptChange(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Edit;
    FieldByName('dept_code').AsString:=LeftStr(CobDept.Text,6);
    Post;
  end;
end;

procedure TFormMed11.PickerDateChange(Sender: TObject);
begin
  ADate:=PickerDate.Date;
  AMonth:=FormatDatetime('yymm',ADate);
  Month:=FormatDatetime('yyyymm',ADate);
  with ADOQuery1 do
  begin
    Edit;
    FieldByName('mdp_date').AsDateTime:=ADate;
    Post;
  end;
end;

procedure TFormMed11.ADOQueryDetlBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    Edit;
    FieldByName('mdp_code').AsString:=mdp_code;
    FieldByName('upd_user').AsString:=username;
    FieldByName('upd_date').AsDateTime:=GetServerDatetime;
  end;
end;

procedure TFormMed11.ADOQueryDetlCalcFields(DataSet: TDataSet);
//計算欄位(藥品單位,藥品名,藥品庫存)
var
  dru_code:string;
  unit_str,dru_name:widestring;
  total_money:double;
begin
  ADate:=PickerDate.Date;
  AMonth:=FormatDatetime('yymm',ADate);
  Month:=FormatDatetime('yyyymm',ADate);
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
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_med_mon where dru_code='''+dru_code+''' and month='''+month+'''');
    open;
    if not Eof then
      DataSet.FieldByName('end_inv').AsFloat:=FieldByName('end_inv').AsFloat;
  end;
  with DataSet do
  begin
    FieldByName('dru_name').Value:=dru_name;
    FieldByName('unit_name').Value:=unit_str;
    FieldByName('money').AsCurrency:=FieldByName('med_qty').AsFloat*FieldByName('dru_price').AsFloat;
    //total_money:=total_money+FieldByName('money').AsCurrency;
  end;
end;

procedure TFormMed11.ADOQueryDetlDRU_CODEChange(Sender: TField);
//藥品單價
begin
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_dru_mast where dru_code='''+Sender.AsString+'''');
    open;
    if not Eof then
      ADOQueryDetl.FieldByName('dru_price').AsFloat:=FieldByname('dru_price').AsFloat;
  end;
end;

end.
