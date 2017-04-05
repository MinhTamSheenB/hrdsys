{*************************************************************************
Name：hrd15
Author: anil
Create date:2005-11-10
Modify date:2005-11-10
Commentate:工團作業
*************************************************************************}
unit UnitHrd15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils;

type
  TFormHrd15 = class(TForm)
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
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1if_card: TStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1department: TWideStringField;
    TntLabel1: TTntLabel;
    TntDBEdit1: TTntDBEdit;
    TntLabel2: TTntLabel;
    TntDBEdit2: TTntDBEdit;
    TntLabel4: TTntLabel;
    TntDBEdit3: TTntDBEdit;
    TntLabel10: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    CobInfo: TTntComboBox;
    ADOQuery1epsexd: TStringField;
    TntLabel5: TTntLabel;
    TntDBEdit4: TTntDBEdit;
    ADOQuery1lanu_date: TStringField;
    TntLabel7: TTntLabel;
    EditMon: TTntEdit;
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
    procedure Btn_ResetClick(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure bbtn_okClick(Sender: TObject);
    procedure bbtn_addClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADOQuery1emp_idChange(Sender: TField);
    procedure EditFlow0Exit(Sender: TObject);
    procedure ADOQuery1epsexdGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQuery1AfterInsert(DataSet: TDataSet);
    procedure ADOQuery1AfterDelete(DataSet: TDataSet);
    procedure ADOQuery1BeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd15: TFormHrd15;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  can_post:boolean;
  Num_M,Num_W:integer;
  AGender:String;
{$R *.dfm}

procedure TFormHrd15.FormCreate(Sender: TObject);
//初始化
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'hrd15');//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;

procedure TFormHrd15.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='vietnam_chingluh_company,hrd15_titl,total,current_location,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
  +'not_find_data,with_star_cannot_empty,msg_post_record_on_close,'
  +'sex_man,sex_woman';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;

procedure TFormHrd15.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  SqlStr:string;
begin
  SqlStr:='select dept_code+'' ''+abbr_titl from hrd_dept where '+G_sFactorySql;
  SetComboxList(sqlStr,CobDeptBegin);
  SetComboxList(sqlStr,CobDeptEnd);
  CobInfo.Items.Add('0-在職');
  CobInfo.Items.Add('1-離職');
  CobInfo.ItemIndex:=0;
end;

procedure TFormHrd15.Btn_SearchClick(Sender: TObject);
//查詢數據
var
  sql_str,where_str:string;
begin
  where_str := '' ;
//  sql_str:='select * from hrd_lanu A,hrd_emp B where A.emp_id=B.emp_id ';
  sql_str:='select * from hrd_lanu A where 1=1 ' ; // and lanu_date=''' +trim(editmon.text)+'''';
  //if (CobDeptBegin.Text<>'') or (CobDeptEnd.Text<>'') then
  //begin
  if trim(editmon.text)<>'' then
     where_str:=where_str+' and lanu_date=''' +trim(editmon.text)+'''';
  sql_str:=sql_str+' and emp_id in (select emp_id from hrd_emp where 1=1';
  //2012-09-07 hyt add
  sql_str:=sql_str+' and '+G_sFactorySql+' ';

  if trim(edit_begin.text)<>'' then
    where_str:=where_str+' and emp_id>=''' +trim(edit_begin.text)+'''';
  if trim(edit_end.text)<>'' then
    where_str:=where_str+' and emp_id<=''' +trim(edit_end.text)+'''';
  if CobDeptBegin.Text<>'' then
    where_str:=where_str+' and dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if CobDeptEnd.Text<>'' then
    where_str:=where_str+' and dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  if CobInfo.ItemIndex=0 then//在職
    where_str:=where_str+' and epledt is null';
  if CobInfo.ItemIndex=1 then//離職
    where_str:=where_str+' and epledt is not null';
  sql_str:=sql_str+where_str+')';
  with Adoquery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  with DMHrdsys.SQLQuery3 do
  begin
    where_str:='';
    if trim(edit_begin.text)<>'' then
       where_str:=where_str+' and emp_id>=''' +trim(edit_begin.text)+'''';
    if trim(edit_end.text)<>'' then
       where_str:=where_str+' and emp_id<=''' +trim(edit_end.text)+'''';
    if CobDeptBegin.Text<>'' then
      where_str:=where_str+' and dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
    if  CobDeptEnd.Text<>'' then
       where_str:=where_str+' and dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
    if CobInfo.ItemIndex=0 then//在職
       where_str:=where_str+' and epledt is null';
    if CobInfo.ItemIndex=1 then//離職
       where_str:=where_str+' and epledt is not null';
    if trim(editmon.text)<>'' then
       sql_str:='select count(*) from hrd_emp where epsexd=''M'''
                 +' and emp_id in (select emp_id from hrd_lanu where lanu_date=''' +trim(editmon.text)+''')'+where_str
    else
       sql_str:='select count(*) from hrd_emp where epsexd=''M'''
                 +' and emp_id in (select emp_id from hrd_lanu)'+where_str;
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    Num_M:=Fields[0].AsInteger;
    if trim(editmon.text)<>'' then
       sql_str:='select count(*) from hrd_emp where epsexd=''W'''
                +' and emp_id in (select emp_id from hrd_lanu where lanu_date=''' +trim(editmon.text)+''')'+where_str
   else
      sql_str:='select count(*) from hrd_emp where epsexd=''W'''
                +' and emp_id in (select emp_id from hrd_lanu)'+where_str;
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    Num_W:=Fields[0].AsInteger;
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
  {with ADOQuery1 do
  begin
    Filtered:=false;
    Filter:='epsexd=''M''';
    Filtered:=true;
    Num_M:=RecordCount;
    Filtered:=false;
    Filter:='epsexd=''W''';
    Filtered:=true;
    Num_W:=RecordCount;
    Filtered:=false;
  end;}
//  Btn_Reset.OnClick(Sender);
end;

procedure TFormHrd15.Btn_ResetClick(Sender: TObject);
//重置查詢條件
var
  status:boolean;
begin
if TtntBitBtn(Sender).Name='Btn_Reset' then
  status:=true
else
  status:=false;
edit_begin.Enabled:=status;
edit_end.Enabled:=status;
Btn_search.Enabled:=status;
//if status=true then
ADOQuery1.Active:= not status;
end;

procedure TFormHrd15.ADOQuery1AfterOpen(DataSet: TDataSet);
//打開數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
end;

procedure TFormHrd15.ADOQuery1AfterClose(DataSet: TDataSet);
//關閉數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
end;

procedure TFormHrd15.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
//改變數據集時設置功能按鈕是否可用
begin
  SetActEnabled(true);
end;

procedure TFormHrd15.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示,及改變編輯區一些欄位
var
  sex_m,sex_w,AStr:string;
begin
  ChangeFlowFlds;
  with ADOQuery1 do
  begin
    AStr:=GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '
      +GetLangName(LangStr,'total')+':'+inttostr(RecordCount)+' '
      +' Man:'+IntToStr(Num_M)+' Woman:'+IntToStr(Num_W);
    setStatusText(AStr);
  end;
end;

procedure TFormHrd15.ADOQuery1BeforePost(DataSet: TDataSet);
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

procedure TFormHrd15.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

function TFormHrd15.CheckInputValid():boolean;
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

procedure TFormHrd15.sb_PrintClick(Sender: TObject);
//print dataset
var
  titl:widestring;
begin
  titl:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangC,'obas05_titl')+'<br>';
  showPrint(ADOQuery1,titl);
end;

procedure TFormHrd15.sb_AddClick(Sender: TObject);
//add record
begin
  with ADOQuery1 do
  begin
    if Active=false then//如果沒有打開數據集， 則重新打開
    begin
      SQL.Clear;
      SQL.Add('select * from hrd_lanu where 2=1 ');
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

procedure TFormHrd15.sb_editClick(Sender: TObject);
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

procedure TFormHrd15.sb_DelClick(Sender: TObject);
//delete record
begin
with ADOQuery1 do
if (RecordCount<>0) or ( not Eof) then
  if wideMessageDlg(GetLangName(LangStr,'msg_del_alert'),mtConfirmation,[mbyes,mbno],0)=mryes then
    Delete;
end;

procedure TFormHrd15.sb_RecoverClick(Sender: TObject);
//cancel all dataset modify
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormHrd15.sb_SaveClick(Sender: TObject);
//save all dataset
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.UpdateBatch;
SetActEnabled(false);
end;

procedure TFormHrd15.bbtn_addClick(Sender: TObject);
//繼續新增
begin
  ADOQuery1.Append;
  ChangeFlowFlds;
  EditFlow0.SetFocus;
end;

procedure TFormHrd15.bbtn_okClick(Sender: TObject);
//單筆資料修改后post，並關閉編輯區
begin
  if ADOQuery1.State in [dsedit,dsinsert] then
    ADOQuery1.post;
  ImageClose.OnClick(Sender);
end;

procedure TFormHrd15.ImageCloseClick(Sender: TObject);
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

procedure TFormHrd15.PanelFlowTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//拖動浮動窗口
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);
end;

procedure TFormHrd15.ChangeFlowFlds;
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

procedure TFormHrd15.SetActEnabled(Modify_Flag:boolean=true);
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

procedure TFormHrd15.EditFlow0KeyDown(Sender: TObject; var Key: Word;
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

procedure TFormHrd15.ADOQuery1CalcFields(DataSet: TDataSet);
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
      DataSet.FieldByName('epsexd').AsString:=FieldByName('epsexd').AsString;
    end;
  end;
end;

procedure TFormHrd15.ADOQuery1emp_idChange(Sender: TField);
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
      Exit;
    end
    else if FieldByName('epledt').AsString<>'' then
    begin
      WideShowMessage('該工號已經離職');
      EditFlow0.SetFocus;
      Exit;
    end
    else if CheckRecordExist('select * from hrd_lanu where emp_id='''+EditFlow0.Text+'''') then
    begin
      WideShowMessage('該工號已經加入工團');
      EditFlow0.SetFocus;
      Exit;
    end;
  end;
  with ADOQuery1 do
  begin
    Edit;
    FieldByName('lanu_date').AsString:=FormatDateTime('yyyy/mm',Date);
  end;
end;

procedure TFormHrd15.EditFlow0Exit(Sender: TObject);
begin
//  ADOQuery1emp_id.OnChange(ADOQuery1.FieldByName('emp_id'));
end;

procedure TFormHrd15.ADOQuery1epsexdGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.Value='M' then
    text:=Sender.AsString+'-'+GetLangName(LangStr,'sex_man')
  else if Sender.Value='W' then
    text:=Sender.AsString+'-'+GetLangName(LangStr,'sex_woman');
end;

procedure TFormHrd15.ADOQuery1AfterInsert(DataSet: TDataSet);
begin
  if DataSet.FieldByName('epsexd').AsString='M' then
    inc(Num_M)
  else
    inc(Num_W);
end;

procedure TFormHrd15.ADOQuery1AfterDelete(DataSet: TDataSet);
begin
  if AGender='M' then
    Num_M:=Num_M-1
  else
    Num_W:=Num_W-1;
end;

procedure TFormHrd15.ADOQuery1BeforeDelete(DataSet: TDataSet);
begin
  AGender:=DataSet.FieldByName('epsexd').AsString;
end;

end.
