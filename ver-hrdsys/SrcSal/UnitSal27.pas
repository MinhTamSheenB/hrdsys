unit UnitSal27;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,DateUtils,
  TntDB, DB, ADODB,TntComCtrls,WSDLIntf,TntDialogs,strutils, Qt;


type
  TFormsal27 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel6: TTntLabel;
    TntLabel10: TTntLabel;
    TntLabel7: TTntLabel;
    edit_begin: TTntEdit;
    edit_end: TTntEdit;
    Btn_Search: TTntBitBtn;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    EditMon: TTntEdit;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_Print: TTntSpeedButton;
    PanelFlow: TTntPanel;
    TntLabel3: TTntLabel;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    TntGroupBox5: TTntGroupBox;
    Label_emp_id: TTntLabel;
    Label_s_ask_h: TTntLabel;
    Label_e_ask_h: TTntLabel;
    TntLabel8: TTntLabel;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    TntLabel5: TTntLabel;
    EditFlow0: TTntDBEdit;
    EditFlow1: TTntDBEdit;
    EditFlow2: TTntDBEdit;
    TntDBEdit1: TTntDBEdit;
    TntDBEdit2: TTntDBEdit;
    TntDBEdit4: TTntDBEdit;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    bbtn_add: TTntBitBtn;
    bbtn_ok: TTntBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1department: TStringField;
    ADOQuery1emp_chs: TStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1pay_mon: TStringField;
    ADOQuery1money: TFloatField;
    ADOQuery1remark: TTntWideStringField;
    EditFlow3: TTntDBEdit;
    TntLabel4: TTntLabel;
    function CheckInputValid():boolean;
    procedure InitLang;
    procedure InitForm;
    procedure ChangeFlowFlds;
    procedure Btn_SearchClick(Sender: TObject);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure bbtn_addClick(Sender: TObject);
    procedure bbtn_okClick(Sender: TObject);
    procedure sb_PrintClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure EditFlow0KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditFlow1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
      procedure SetActEnabled(modify_Flag:boolean=true);
    procedure FormCreate(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formsal27: TFormsal27;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
Const
  FORM_KEY = 'sal27';
{$R *.dfm}

procedure TFormsal27.Btn_SearchClick(Sender: TObject);
//查詢數據
var
  sql_str,where_str:string;
begin
//  sql_str:='select * from hrd_sal_yicard A,hrd_emp B where A.emp_id=B.emp_id ';

  sql_str:='select a.upd_user, a.upd_date, a.pay_mon, a.emp_id, a.money, a.remark  from hrd_sal_jiangli A  where 1=1 '; //, hrd_emp as b
  if trim(EditMon.Text)<>'' then//月份
    sql_str:=sql_str+' and a.pay_mon='''+EditMon.Text+'''';
  if trim(edit_begin.text)<>'' then
    sql_str:=sql_str+' and a.emp_id>=''' +trim(edit_begin.text)+'''';
  if trim(edit_end.text)<>'' then
    sql_str:=sql_str+' and a.emp_id<=''' +trim(edit_end.text)+'''';
//***<<<2010-12-02 hyt upd
  if (trim(CobDeptBegin.text)<>'') or (trim(CobDeptEnd.text)<>'') then
  begin
    sql_str:=sql_str+' and exists(select emp_id from hrd_emp as b where a.emp_id = b.emp_id  ';
    if trim(CobDeptBegin.text)<>'' then
      sql_str:=sql_str+' and b.dept_code>=''' +trim(copy( CobDeptBegin.text, 1,6 ))+'''';
    if trim(CobDeptEnd.text)<>'' then
      sql_str:=sql_str+' and b.dept_code<=''' +trim(copy( CobDeptEnd.text, 1, 6 ))+'''';

    sql_str:=sql_str+') ';
  end
  else
  begin
    sql_str:=sql_str+' and exists(select emp_id '+
                                 'from hrd_emp as b where a.emp_id = b.emp_id and '+G_sFactorySql+') ';
  end;
  //***>>>
  //sql_str:=sql_str + ' and a.emp_id = b.emp_id ' ;

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

procedure TFormsal27.ADOQuery1AfterClose(DataSet: TDataSet);
//關閉數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
end;

procedure TFormsal27.ADOQuery1AfterOpen(DataSet: TDataSet);
//打開數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
end;

procedure TFormsal27.ADOQuery1AfterScroll(DataSet: TDataSet);
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

procedure TFormsal27.ADOQuery1BeforePost(DataSet: TDataSet);
//數據集Post時,自動追加修改者,修改日期欄位
begin
 // if not CheckInputValid then
 //   abort;
  with ADOQuery1 do
  begin
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=GetServerDatetime;
  end;
end;


procedure TFormsal27.ADOQuery1CalcFields(DataSet: TDataSet);
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
    //  DataSet.FieldByName('epledt').AsString:=FieldByName('epledt').AsString;
    end;
  end;
end;

procedure TFormsal27.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
begin
    SetActEnabled(true);
end;

procedure TFormsal27.bbtn_addClick(Sender: TObject);
//繼續新增
begin
  if AnalysisEmpFactory(EditFlow0.Text)=false then
    exit ;   //2012-09-07 hyt add

  ADOQuery1.Append;
  ChangeFlowFlds;
  EditFlow0.SetFocus;
end;
procedure TFormsal27.bbtn_okClick(Sender: TObject);
begin
   if AnalysisEmpFactory(EditFlow0.Text)=false then
    exit ;   //2012-09-07 hyt add

   if ADOQuery1.State in [dsedit,dsinsert] then
    ADOQuery1.post;
  //ImageClose.OnClick(Sender);
  PanelFlow.Visible := false;
  PanelMain.Enabled:=true;
  sb_save.Enabled :=true ;
  PanelAct.Enabled := true ;
end;

procedure TFormsal27.sb_PrintClick(Sender: TObject);
var
  titl:widestring;
begin
  titl:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangC,FORM_KEY+'_titl')+'<br>';
  showPrint(ADOQuery1,titl);
end;

procedure TFormsal27.sb_AddClick(Sender: TObject);
//add record
begin
  with ADOQuery1 do
  begin
    if Active=false then//如果沒有打開數據集， 則重新打開
    begin
      SQL.Clear;
      SQL.Add('select * from hrd_sal_jiangli where 2=1 ');
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
  EditFlow1.Text := editmon.Text  ;
  PanelMain.Enabled:=false;
end;

procedure TFormsal27.sb_DelClick(Sender: TObject);
begin
 with ADOQuery1 do
if (RecordCount<>0) or ( not Eof) then
  if wideMessageDlg(GetLangName(LangStr,'msg_del_alert'),mtConfirmation,[mbyes,mbno],0)=mryes then
    Delete;
end;

procedure TFormsal27.sb_editClick(Sender: TObject);
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

procedure TFormsal27.sb_RecoverClick(Sender: TObject);
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormsal27.sb_SaveClick(Sender: TObject);
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

procedure TFormsal27.EditFlow0KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
procedure TFormsal27.EditFlow1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
procedure TFormSal27.SetActEnabled(Modify_Flag:boolean=true);
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
function TFormSal27.CheckInputValid():boolean;
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
procedure TFormSal27.ChangeFlowFlds;
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
procedure TFormsal27.FormCreate(Sender: TObject);
begin
   InitLang;// Init language
  pri_arr:=GetPrvArr(username,FORM_KEY);//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;
procedure TFormSal27.InitLang;
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

procedure TFormSal27.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  SqlStr:string;
begin
  SqlStr:='select dept_code+'' ''+abbr_titl from hrd_dept where is_del=''0'' and '+G_sFactorySql;
  SetComboxList(sqlStr,CobDeptBegin);
  SetComboxList(sqlStr,CobDeptEnd);
  EditMon.Text:=formatDateTime('yyyymm',date-6);
end;

procedure TFormsal27.ImageCloseClick(Sender: TObject);
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

end.
