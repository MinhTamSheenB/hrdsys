{*************************************************************************
Name：sal21
Author: anil
Create date:2005-11-10
Modify date:2005-11-10
Commentate:毉保卡未交回扣款作業
*************************************************************************}
unit UnitSal21;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils;

type
  TFormSal21 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelFlow: TTntPanel;
    TntLabel3: TTntLabel;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    TntGroupBox5: TTntGroupBox;
    Label_emp_id: TTntLabel;
    Label_s_ask_h: TTntLabel;
    Label_e_ask_h: TTntLabel;
    EditFlow0: TTntDBEdit;
    EditFlow1: TTntDBEdit;
    EditFlow2: TTntDBEdit;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel6: TTntLabel;
    edit_begin: TTntEdit;
    edit_end: TTntEdit;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_Print: TTntSpeedButton;
    ADOQuery1: TADOQuery;
    Btn_Search: TTntBitBtn;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    bbtn_add: TTntBitBtn;
    bbtn_ok: TTntBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    TntLabel8: TTntLabel;
    TntLabel1: TTntLabel;
    TntDBEdit1: TTntDBEdit;
    TntLabel2: TTntLabel;
    TntDBEdit2: TTntDBEdit;
    TntLabel4: TTntLabel;
    TntDBEdit3: TTntDBEdit;
    TntLabel10: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    TntLabel5: TTntLabel;
    TntDBEdit4: TTntDBEdit;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1pay_mon: TStringField;
    ADOQuery1money: TBCDField;
    ADOQuery1emp_chs: TStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1epledt: TDateField;
    ADOQuery1department: TStringField;
    TntLabel7: TTntLabel;
    EditMon: TTntEdit;
    DBcb_type: TTntDBComboBox;
    Label_s_ask_t: TTntLabel;
    Edt_reason: TTntDBEdit;
    Label_e_ask_t: TTntLabel;
    ADOQuery1al_type: TStringField;
    ADOQuery1al_reason: TTntWideStringField;
    //my define
    procedure InitLang;
    procedure InitForm;
    function CheckInputValid():boolean;
    procedure ChangeFlowFlds;
    procedure SetActEnabled(modify_Flag:boolean=true);
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure sb_editClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure PanelFlowTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure sb_PrintClick(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure EditFlow0KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_SearchClick(Sender: TObject);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure bbtn_okClick(Sender: TObject);
    procedure bbtn_addClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADOQuery1emp_idChange(Sender: TField);
    procedure ADOQuery1al_typeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQuery1al_typeSetText(Sender: TField; const Text: String);
    procedure DBcb_typeChange(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal21: TFormSal21;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
Const
  FORM_KEY = 'sal21';

{$R *.dfm}

procedure TFormSal21.FormCreate(Sender: TObject);
//初始化
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,FORM_KEY);//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;

procedure TFormSal21.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:=FORM_KEY+'_titl,vietnam_chingluh_company,total,current_location,'
  +'save_success,save_fail,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
  +'not_find_data,with_star_cannot_empty,msg_post_record_on_close,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;

procedure TFormSal21.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  SqlStr:string;
begin
  SqlStr:='select dept_code+'' ''+abbr_titl from hrd_dept where is_del=''0''';
  SetComboxList(sqlStr,CobDeptBegin);
  SetComboxList(sqlStr,CobDeptEnd);
  EditMon.Text:=formatDateTime('yyyymm',date-6);
  DBcb_type.Items.Add('1- 醫保卡');
  DBcb_type.Items.Add('2- 社保,醫保卡');
end;

procedure TFormSal21.Btn_SearchClick(Sender: TObject);
//查詢數據
var
  sql_str,where_str:string;
begin
//  sql_str:='select * from hrd_sal_yicard A,hrd_emp B where A.emp_id=B.emp_id ';
  sql_str:='select * from hrd_sal_yicard A where 1=1 ';
  if trim(EditMon.Text)<>'' then//月份
    sql_str:=sql_str+' and pay_mon='''+EditMon.Text+'''';
  if trim(edit_begin.text)<>'' then
    sql_str:=sql_str+' and emp_id>=''' +trim(edit_begin.text)+'''';
  if trim(edit_end.text)<>'' then
    sql_str:=sql_str+' and emp_id<=''' +trim(edit_end.text)+'''';

  //2012-09-07 hyt add
  sql_str:=sql_str+' and emp_id COLLATE Chinese_PRC_CI_AS in(select emp_id from hrd_emp where '+G_sFactorySql+') ';

  //if (CobDeptBegin.Text<>'') or (CobDeptEnd.Text<>'') then
  //begin
  //sql_str:=sql_str+' and emp_id in (select emp_id from hrd_emp where 1=1';
  {if CobDeptBegin.Text<>'' then
    where_str:=where_str+' and dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if CobDeptEnd.Text<>'' then
    where_str:=where_str+' and dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';}
 // sql_str:=sql_str+where_str+')';
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
    DBGrid1.Enabled:=false;
  end
  else
  begin
    DBGrid1.Enabled:=true;
  end;
end;

procedure TFormSal21.ADOQuery1AfterOpen(DataSet: TDataSet);
//打開數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
end;

procedure TFormSal21.ADOQuery1AfterClose(DataSet: TDataSet);
//關閉數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
end;

procedure TFormSal21.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
//改變數據集時設置功能按鈕是否可用
begin
  SetActEnabled(true);
end;

procedure TFormSal21.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示,及改變編輯區一些欄位
var
  AStr:string;
begin
//  ChangeFlowFlds;
  with DataSet do
  begin
    AStr:=GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '
      +GetLangName(LangStr,'total')+':'+inttostr(RecordCount);
    setStatusText(AStr);
  end;
end;

procedure TFormSal21.ADOQuery1BeforePost(DataSet: TDataSet);
//數據集Post時,自動追加修改者,修改日期欄位
begin
  if not CheckInputValid then
    abort;
  with ADOQuery1 do
  begin
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=GetServerDatetime;
  end;
end;

procedure TFormSal21.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

function TFormSal21.CheckInputValid():boolean;
{*************************************************************************
TO DO:提交前檢查輸入的有效性
*************************************************************************}
begin
  if trim(EditFlow0.Text)='' then
  begin
    WideMessageDlg(GetLangName(LangStr,'with_star_cannot_empty'),mterror,[mbOK],0);
    EditFlow0.SetFocus;
    result:=false;
    exit;
  end;
  result:=true;
end;

procedure TFormSal21.sb_PrintClick(Sender: TObject);
//print dataset
var
  titl:widestring;
begin
  titl:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangC,FORM_KEY+'_titl')+'<br>';
  showPrint(ADOQuery1,titl);
end;

procedure TFormSal21.sb_AddClick(Sender: TObject);
//add record
begin
  with ADOQuery1 do
  begin
    if Active=false then//如果沒有打開數據集， 則重新打開
    begin
      SQL.Clear;
      SQL.Add('select * from hrd_sal_yicard where 2=1 ');
      Active:=true;
    end;
    Last;
    Append;
  end;
  ChangeFlowFlds;
  DBNavigator1.Hide;
  bbtn_add.Show;
  PanelFlow.Visible:=true;
  EditFlow0.SetFocus;
  PanelMain.Enabled:=false;
end;

procedure TFormSal21.sb_editClick(Sender: TObject);
//modify record
begin
  ChangeFlowFlds;
  DBNavigator1.Show;
  bbtn_add.Hide;
  PanelFlow.Visible:=true;
  EditFlow0.SetFocus;
  PanelGrid.Enabled:=true;
  PanelAct.Enabled:=false;
  PanelQuery.Enabled:=false;
end;

procedure TFormSal21.sb_DelClick(Sender: TObject);
//delete record
begin
with ADOQuery1 do
if (RecordCount<>0) or ( not Eof) then
  if wideMessageDlg(GetLangName(LangStr,'msg_del_alert'),mtConfirmation,[mbyes,mbno],0)=mryes then
    Delete;
end;

procedure TFormSal21.sb_RecoverClick(Sender: TObject);
//cancel all dataset modify
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormSal21.sb_SaveClick(Sender: TObject);
//save all dataset
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
try
  ADOQuery1.UpdateBatch;
  wideShowMessage(GetLangName(LangStr,'save_success'));
except
  wideShowMessage(GetLangName(LangStr,'save_fail'));
end;
SetActEnabled(false);
end;

procedure TFormSal21.bbtn_addClick(Sender: TObject);
//繼續新增
begin
  ADOQuery1.Append;
  ChangeFlowFlds;
  EditFlow0.SetFocus;
end;

procedure TFormSal21.bbtn_okClick(Sender: TObject);
//單筆資料修改后post，並關閉編輯區
begin
  if ADOQuery1.State in [dsedit,dsinsert] then
    ADOQuery1.post;
  ImageClose.OnClick(Sender);
end;

procedure TFormSal21.ImageCloseClick(Sender: TObject);
//關閉浮動窗口,其他panel可用
begin
  if ADOQuery1.State in [dsedit,dsinsert] then
  begin
    if wideMessageDlg(GetLangName(LangStr,'msg_post_record_on_close'),mtConfirmation,[mbyes,mbno],0)=mryes then
      ADOQuery1.Post
    else
      ADOQuery1.Cancel;
  end;
  PanelFlow.Visible:=false;
  PanelMain.Enabled:=true;
  PanelQuery.Enabled:=true;
  PanelGrid.Enabled:=true;
  PanelAct.Enabled:=true;
end;

procedure TFormSal21.PanelFlowTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//拖動浮動窗口
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);
end;

procedure TFormSal21.ChangeFlowFlds;
//給浮動窗口中某些欄位賦默認值
begin
  with ADOQuery1 do
  begin
    if State=dsInsert then//是否修改
    begin
      EditFlow0.ReadOnly:=false;
      EditFlow0.Color:=clwhite;
    end
    else
    begin
      EditFlow0.ReadOnly:=true;
      EditFlow0.Color:=clBtnface;
    end;
  end;
end;

procedure TFormSal21.SetActEnabled(Modify_Flag:boolean=true);
//設置功能按鈕是否可用
var
  status:boolean;
begin
  status:=AdoQuery1.Active;
  sb_print.Enabled:=status and Pri_Arr[PRT];
  sb_Add.Enabled:=Pri_Arr[ADD];
  sb_Del.Enabled:=status and Pri_Arr[DEL];
  sb_edit.Enabled:=status and Pri_Arr[UPD];
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;

procedure TFormSal21.EditFlow0KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//浮動Panel的輸入框中快捷移動設置
begin
  if (key=13) then// key_enter
    self.FindNextControl(TwinControl(Sender),true,true,false).SetFocus;
  if (Sender.ClassType = TtntcomboBox) or (Sender.ClassType =TTntDatetimePicker) then
    exit;//while key up and down on comboBox or DatetimePicker,not continue;
  if (key=40) then//key_down
    self.FindNextControl(TwinControl(Sender),true,true,false).SetFocus;
  if (key=38) and (TwinControl(Sender).TabOrder>0) then//key_up
    self.FindNextControl(TwinControl(Sender),false,true,false).SetFocus;
end;

procedure TFormSal21.ADOQuery1CalcFields(DataSet: TDataSet);
//計算字段
var
  SqlStr,emp_id:string;
begin
  emp_id:=dataset.FieldByName('emp_id').AsString;
  SqlStr:='select * from hrd_emp where emp_id='''+emp_id+'''';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(SqlStr);
    open;
    if not Eof then
    begin
      DataSet.FieldByName('emp_chs').AsString:=FieldByName('emp_chs').AsString;
      DataSet.FieldByName('name_vim').AsString:=FieldByName('name_vim').AsString;
      DataSet.FieldByName('department').AsString:=FieldByName('dept_code').AsString;
      DataSet.FieldByName('epledt').AsString:=FieldByName('epledt').AsString;
    end;
  end;
end;

procedure TFormSal21.ADOQuery1emp_idChange(Sender: TField);
//檢查輸入工號
var
  SqlStr,emp_id:string;
begin
  if Length(trim(EditFlow0.Text))<6 then
    exit;
  SqlStr:='select * from hrd_emp where emp_id='''+EditFlow0.Text+'''';
  With DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(SqlStr);
    Open;
    if Eof then//不存在
    begin
      WideShowMessage('工號不存在');
      EditFlow0.SetFocus;
      abort;
    end
  //  else if FieldByName('epledt').AsString='' then
 //   begin
 //     WideShowMessage('該工號還在職');
  //    EditFlow0.SetFocus;
 //     abort;
 //   end
    else if CheckRecordExist('select * from hrd_sal_yicard where emp_id='''+EditFlow0.Text+'''') then
    begin
      {WideShowMessage('該工號已經輸入');
      EditFlow0.SetFocus;
      abort;} //2010-10-04 hyt del
    end;
  end;
  with ADOQuery1 do
  begin
    Edit;
    FieldByName('pay_mon').AsString:=FormatDateTime('yyyymm',FieldByName('epledt').AsDateTime-1);
  end;
end;

procedure TFormSal21.ADOQuery1al_typeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if sender.Value=1 then
    text:='醫保卡' ; //GetLangName(LangStr,'supply_again');
  if sender.Value=2 then
    text:='社保,醫保卡' ;// GetLangName(LangStr,'deduct_money');
end;

procedure TFormSal21.ADOQuery1al_typeSetText(Sender: TField;
  const Text: String);
begin
  if text='醫保卡'  then  //GetLangName(LangStr,'supply_again') then
    sender.Value:=1;
  if text= '社保,醫保卡' then    //GetLangName(LangStr,'deduct_money') then
    sender.Value:=2;
end;

procedure TFormSal21.DBcb_typeChange(Sender: TObject);
begin
   with adoquery1 do
  begin
    edit;
    FieldByName('al_type').asstring:=Leftstr(DBcb_type.Text,1);
  end;
end;



end.
