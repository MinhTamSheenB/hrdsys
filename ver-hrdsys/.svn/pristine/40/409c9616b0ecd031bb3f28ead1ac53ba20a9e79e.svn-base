{*************************************************************************
Name：Sal04(員工多工獎金作業)
Author: anil
Create date:2005-08-05
Modify date:2005-08-08
Commentate:員工多工獎金作業
*************************************************************************}
unit UnitSal04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB;

type
  TFormSal04 = class(TForm)
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
    sb_FindEmp: TTntSpeedButton;
    Label_wrk_pay: TTntLabel;
    Label_Valid_Date: TTntLabel;
    EditEmpId: TTntDBEdit;
    Edit_wrk_pay: TTntDBEdit;
    Edit_Valid_Date: TTntDBEdit;
    Label_emp_chs: TTntLabel;
    Label_dept: TTntLabel;
    ADOQuery2: TADOQuery;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    edit_name: TTntDBEdit;
    edit_dept: TTntDBEdit;
    ADOQuery1: TADOQuery;
    Btn_Search: TTntBitBtn;
    Btn_Reset: TTntBitBtn;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1wrk_pay: TBCDField;
    ADOQuery1valid_date: TDateTimeField;
    ADOQuery1emp_chs: TTntWideStringField;
    ADOQuery1dept: TTntWideStringField;
    Chk_Emp: TTntCheckBox;
    Chk_Dept: TTntCheckBox;
    sb_choose_date: TTntSpeedButton;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_Print: TTntSpeedButton;
    Calendar1: TTntMonthCalendar;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    bbtn_add: TTntBitBtn;
    bbtn_ok: TTntBitBtn;
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
    procedure rbDeptClick(Sender: TObject);
    procedure rbEmpClick(Sender: TObject);
    procedure sb_FindEmpClick(Sender: TObject);
    procedure EditEmpBeginDblClick(Sender: TObject);
    procedure EditShourClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure PanelFlowTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure bbtn_OKClick(Sender: TObject);
    procedure bbtn_CancelClick(Sender: TObject);
    procedure sb_PrintClick(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure CobDeptBeginChange(Sender: TObject);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure EditEmpIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_ResetClick(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure sb_choose_dateClick(Sender: TObject);
    procedure Calendar1DblClick(Sender: TObject);
    procedure bbtn_addClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal04: TFormSal04;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
{$R *.dfm}

procedure TFormSal04.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='sal04_titl,not_find_data,total,current_location,error_date,error_empid,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
  +'dut02_choose_clas,error_hour,error_input_hour,msg_post_record_on_close';
LangStr:=GetLangWideStrs(keys);
end;

procedure TFormSal04.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str:string;
begin
  sql_str:='select dept_code+'' ''+abbr_titl as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,CobDeptBegin);
  SetComboxList(sql_str,CobDeptEnd);
end;

procedure TFormSal04.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'dut02');//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;

procedure TFormSal04.Btn_SearchClick(Sender: TObject);
var
  sql_str:string;
begin
  sql_str:='select * from hrd_sal_mult where 2>1 ';
  if Chk_Emp.Checked then
    begin
      if trim(EditEmpBegin.Text)<>'' then
        sql_str:=sql_str+' and emp_id>=''' +trim(EditEmpBegin.text)+'''';
      if trim(EditEmpEnd.Text)<>'' then
        sql_str:=sql_str+' and emp_id<=''' +trim(EditEmpEnd.text)+'''';
    end;
  if (Chk_Dept.Checked) and ((trim(CobDeptBegin.Text)<>'') or (trim(CobDeptEnd.Text)<>'')) then
    begin
      sql_str:=sql_str+' and emp_id IN( select emp_id from hrd_emp where 1=1';
        if trim(CobDeptBegin.Text)<>'' then
          sql_str:=sql_str+' and dept_code>=''' +leftstr(CobDeptBegin.Text,6)+'''';
        if trim(CobDeptEnd.Text)<>'' then
          sql_str:=sql_str+' and dept_code<=''' +leftstr(CobDeptEnd.Text,6)+'''';
      sql_str:=sql_str+')';
    end;
  with Adoquery1 do
    begin
      close;
      sql.Clear;
      sql.Add(sql_str);
      open;
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
  Btn_Reset.OnClick(Sender);
end;

procedure TFormSal04.Btn_ResetClick(Sender: TObject);
var
  status:boolean;
begin
if TtntBitBtn(Sender).Name='Btn_Reset' then
  status:=true
else
  status:=false;
Chk_Emp.Enabled:=status;
Chk_Dept.Enabled:=status;
EditEmpBegin.Enabled:=status;
EditEmpEnd.Enabled:=status;
CobDeptBegin.Enabled:=status;
CobDeptEnd.Enabled:=status;
Btn_search.Enabled:=status;
Btn_Reset.Enabled:=not status;
//if status=true then
ADOQuery1.Active:= not status;
end;

procedure TFormSal04.CobDeptBeginChange(Sender: TObject);
begin
  CobDeptEnd.Text:=CobDeptBegin.Text;
end;

procedure TFormSal04.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormSal04.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
ChangeFlowFlds;
with ADOQuery1 do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

function TFormSal04.CheckInputValid():boolean;
{*************************************************************************
TO DO:提交前檢查輸入的有效性
*************************************************************************}
begin
  if length(EditEmpId.Text)<>6 then
    begin
      WideMessageDlg(GetLangName(LangStr,'error_empid'),mterror,[mbOK],0);
      EditEmpId.SetFocus;
      result:=false;
      exit;
    end;
  result:=true;
end;

procedure TFormSal04.rbDeptClick(Sender: TObject);
begin
  EditEmpBegin.Enabled:=false;
  EditEmpEnd.Enabled:=false;
  EditEmpBegin.Color:=clBtnface;
  EditEmpEnd.Color:=clBtnface;
  CobDeptBegin.Enabled:=true;
  CobDeptEnd.Enabled:=true;
  CobDeptBegin.Color:=clwhite;
  CobDeptEnd.Color:=clwhite;
  CobDeptBegin.SetFocus;
end;

procedure TFormSal04.rbEmpClick(Sender: TObject);
begin
  CobDeptBegin.Enabled:=false;
  CobDeptEnd.Enabled:=false;
  CobDeptBegin.Color:=clBtnface;
  CobDeptEnd.Color:=clBtnface;
  EditEmpBegin.Enabled:=true;
  EditEmpEnd.Enabled:=true;
  EditEmpBegin.Color:=clwhite;
  EditEmpEnd.Color:=clwhite;
  EditEmpBegin.SetFocus;
end;

procedure TFormSal04.sb_FindEmpClick(Sender: TObject);
begin
  editempid.Text:=FindEmpId('emp_id');
end;

procedure TFormSal04.EditEmpBeginDblClick(Sender: TObject);
begin
  TtntEdit(Sender).Text:=FindEmpId('emp_id');
end;

procedure TFormSal04.EditShourClick(Sender: TObject);
//進入時選中全部
begin
  TMaskEdit(Sender).SelStart:=0;
  TMaskEdit(Sender).SelLength:=2;
end;

procedure TFormSal04.sb_PrintClick(Sender: TObject);
begin
  showPrint(ADOQuery1,'員工多工獎金列印');
end;

procedure TFormSal04.sb_AddClick(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    if Active=false then
    begin
      SQL.Clear;
      SQL.Add('select * from hrd_sal_mult where 2=1 ');
      Active:=true;
    end;
    Append;
  end;
  ChangeFlowFlds;
  DBNavigator1.Hide;
  bbtn_add.Show;
  PanelFlow.Visible:=true;
  EditEmpId.SetFocus;
  PanelMain.Enabled:=false;
end;

procedure TFormSal04.sb_editClick(Sender: TObject);
begin
  ChangeFlowFlds;
  DBNavigator1.Show;
  bbtn_add.Hide;
  PanelFlow.Visible:=true;
  EditEmpId.SetFocus;
  PanelGrid.Enabled:=true;
  PanelAct.Enabled:=false;
  PanelQuery.Enabled:=false;
end;

procedure TFormSal04.sb_DelClick(Sender: TObject);
begin
with ADOQuery1 do
if (RecordCount<>0) or ( not Eof) then
  if wideMessageDlg(GetLangName(LangStr,'msg_del_alert'),mtConfirmation,[mbyes,mbno],0)=mryes then
    Delete;
end;

procedure TFormSal04.sb_RecoverClick(Sender: TObject);
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormSal04.sb_SaveClick(Sender: TObject);
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.UpdateBatch;
SetActEnabled(false);
end;

procedure TFormSal04.ChangeFlowFlds;
begin
  with ADOQuery1 do
    begin
      if State=dsInsert then//工號是否可編輯
        begin
          EditEmpId.ReadOnly:=false;
          EditEmpId.Color:=clwhite;
          sb_FindEmp.Enabled:=true;
        end
      else
        begin
          EditEmpId.ReadOnly:=true;
          EditEmpId.Color:=clBtnface;
          sb_FindEmp.Enabled:=false;
        end;
    end;
end;

procedure TFormSal04.ImageCloseClick(Sender: TObject);
//關閉浮動窗口,其他panel可用
begin
  if ADOQuery1.State in [dsedit,dsinsert] then
  begin
    if wideMessageDlg(GetLangName(LangStr,'msg_post_record_on_close'),mtConfirmation,[mbyes,mbno],0)=mryes then
      ADOQuery1.Post
    else
      ADOQuery1.Cancel;
  end;
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

procedure TFormSal04.PanelFlowTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//拖動浮動窗口
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);
end;

procedure TFormSal04.bbtn_addClick(Sender: TObject);
//繼續新增
begin
  ADOQuery1.Append;
  ChangeFlowFlds;
  EditEmpId.SetFocus;
end;

procedure TFormSal04.bbtn_OKClick(Sender: TObject);
begin
  if ADOQuery1.State in [dsedit,dsinsert] then
    ADOQuery1.post;
  ImageClose.OnClick(Sender);
end;

procedure TFormSal04.bbtn_CancelClick(Sender: TObject);
begin
  ADOQuery1.Cancel;
  PanelFlow.Visible:=false;
end;

procedure TFormSal04.SetActEnabled(Modify_Flag:boolean=true);
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

procedure TFormSal04.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
  SetActEnabled(false);
end;

procedure TFormSal04.ADOQuery1AfterClose(DataSet: TDataSet);
begin
  SetActEnabled(false);
end;

procedure TFormSal04.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
begin
  SetActEnabled(true);
end;

procedure TFormSal04.ADOQuery1BeforePost(DataSet: TDataSet);
begin
  if not CheckInputValid then
    abort;
  with ADOQuery1 do
    begin
      FieldByName('upd_user').AsString:=UserName;
      FieldByName('upd_date').AsDateTime:=GetServerDatetime;
    end;
end;

procedure TFormSal04.EditEmpIdKeyDown(Sender: TObject; var Key: Word;
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

procedure TFormSal04.sb_choose_dateClick(Sender: TObject);
begin
  Calendar1.Visible:=true;
end;

procedure TFormSal04.Calendar1DblClick(Sender: TObject);
begin
  Calendar1.Visible:=false;
  ADOQuery1.Edit;
  ADOQuery1.FieldByName('valid_date').AsDateTime:=Calendar1.Date;
end;

end.
