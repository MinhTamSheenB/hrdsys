unit UnitSal24;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB;
type
  TFormSal24 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    Btn_Search: TTntBitBtn;
    Btn_Reset: TTntBitBtn;
    Chk_Emp: TTntCheckBox;
    Chk_Dept: TTntCheckBox;
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
    sb_FindEmp: TTntSpeedButton;
    Label_wrk_pay: TTntLabel;
    Label_emp_chs: TTntLabel;
    Label_dept: TTntLabel;
    EditEmpId: TTntDBEdit;
    Edit_supp_pay: TTntDBEdit;
    edit_name: TTntDBEdit;
    edit_dept: TTntDBEdit;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    bbtn_add: TTntBitBtn;
    bbtn_ok: TTntBitBtn;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1emp_chs: TTntWideStringField;
    ADOQuery1dept: TTntWideStringField;
    ADOQuery1wrk_pay: TBCDField;
    Label1: TLabel;
    Edit1: TEdit;
    ADOQuery1tr_month: TStringField;
    procedure InitLang;
    procedure InitForm;
    function CheckInputValid():boolean;
    procedure ChangeFlowFlds;

    //auto general
    procedure Btn_SearchClick(Sender: TObject);
    procedure Btn_ResetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetActEnabled(modify_Flag:boolean=true);
    procedure sb_AddClick(Sender: TObject);
    procedure sb_PrintClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure bbtn_addClick(Sender: TObject);
    procedure bbtn_okClick(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure CobDeptBeginChange(Sender: TObject);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure EditEmpIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
     procedure ADOQuery1AfterClose(DataSet: TDataSet);

    procedure sb_FindEmpClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal24: TFormSal24;

implementation
uses
 UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
{$R *.dfm}
procedure TFormSal24.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='sal24_titl,not_find_data,total,current_location,error_date,error_empid,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
  +'dut02_choose_clas,error_hour,error_input_hour,msg_post_record_on_close';
LangStr:=GetLangWideStrs(keys);
end;
procedure TFormSal24.InitForm;
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
procedure TFormSal24.Btn_SearchClick(Sender: TObject);
var
  sql_str:string;
begin
  sql_str:='select * from hrd_sal_award_supp where  tr_month=''' + edit1.text + ''' and 2>1 ';
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

procedure TFormSal24.Btn_ResetClick(Sender: TObject);
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

procedure TFormSal24.FormCreate(Sender: TObject);
begin
   InitLang;// Init language
  pri_arr:=GetPrvArr(username,'sal24');//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;
procedure TFormSal24.SetActEnabled(Modify_Flag:boolean=true);
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
procedure TFormSal24.sb_AddClick(Sender: TObject);
begin
  if ( edit1.Text <> '' )  and ( length( edit1.Text ) = 6  ) then
     begin

  with ADOQuery1 do
  begin
    if Active=false then
    begin
      SQL.Clear;
      SQL.Add('select * from hrd_sal_award_supp where 2=1 ');
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
  end
  else
    showmessage('請輸入月份');
end;

procedure TFormSal24.sb_PrintClick(Sender: TObject);
begin
  showPrint(ADOQuery1,'員工多工獎金列印');
end;

procedure TFormSal24.sb_DelClick(Sender: TObject);
begin
with ADOQuery1 do
if (RecordCount<>0) or ( not Eof) then
  if wideMessageDlg(GetLangName(LangStr,'msg_del_alert'),mtConfirmation,[mbyes,mbno],0)=mryes then
     begin
      Delete;
      post ;
     end;
end;


procedure TFormSal24.sb_editClick(Sender: TObject);
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

procedure TFormSal24.sb_RecoverClick(Sender: TObject);
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormSal24.sb_SaveClick(Sender: TObject);
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.UpdateBatch;
SetActEnabled(false);
end;

procedure TFormSal24.bbtn_addClick(Sender: TObject);
//繼續新增
begin
  ADOQuery1.Append;
  ChangeFlowFlds;
  EditEmpId.SetFocus;
end;
procedure TFormSal24.bbtn_okClick(Sender: TObject);
begin
  if ADOQuery1.State in [dsedit,dsinsert] then
    ADOQuery1.post;
  ImageClose.OnClick(Sender);
 // if not CheckInputValid then
 //   abort;
 // with ADOQuery1 do
 //   begin
 //     FieldByName('tr_month').AsString := edit1.Text ;
 //     FieldByName('upd_user').AsString:=UserName;
 //     FieldByName('upd_date').AsDateTime:=GetServerDatetime;
 //   end;
//  if ADOQuery1.State in [dsedit,dsinsert] then
//  begin
//    if wideMessageDlg(GetLangName(LangStr,'msg_post_record_on_close'),mtConfirmation,[mbyes,mbno],0)=mryes then
//      ADOQuery1.Post
//    else
//      ADOQuery1.Cancel;
//  end;
 sb_save.Enabled := true ;
//  PanelFlow.Visible:=false;
//  PanelMain.Enabled:=true;
//  PanelQuery.Enabled:=true;
//  PanelGrid.Enabled:=true;
//  PanelAct.Enabled:=true;
end;
procedure TFormSal24.ADOQuery1AfterClose(DataSet: TDataSet);
begin
  SetActEnabled(false);
end;
procedure TFormSal24.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
begin
  SetActEnabled(true);
end;
function TFormSal24.CheckInputValid():boolean;
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
procedure TFormSal24.ADOQuery1BeforePost(DataSet: TDataSet);
begin
  if not CheckInputValid then
    abort;
  with ADOQuery1 do
    begin
      FieldByName('tr_month').AsString := edit1.Text ;
      FieldByName('upd_user').AsString:=UserName;
      FieldByName('upd_date').AsDateTime:=GetServerDatetime;
    end;
end;

procedure TFormSal24.EditEmpIdKeyDown(Sender: TObject; var Key: Word;
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




procedure TFormSal24.ChangeFlowFlds;
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
procedure TFormSal24.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
  SetActEnabled(false);
end;
procedure TFormSal24.CobDeptBeginChange(Sender: TObject);
begin
  CobDeptEnd.Text:=CobDeptBegin.Text;
end;

procedure TFormSal24.sb_FindEmpClick(Sender: TObject);
begin
  editempid.Text:=FindEmpId('emp_id');
end;

procedure TFormSal24.ImageCloseClick(Sender: TObject);
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
end.
