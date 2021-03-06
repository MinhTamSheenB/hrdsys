{*************************************************************************
Name：sal06(員工)
Author: Leo
Create date:2005-0-
Modify date:2005-0-
Commentate:員工
*************************************************************************}
unit UnitSal06;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,DateUtils,
  TntDB, DB, ADODB,TntComCtrls,WSDLIntf,TntDialogs,strutils, Qt;

type
  TFormSal06 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PanelAct: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel6: TTntLabel;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    BtnQuery: TTntBitBtn;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    DBGrid1: TTntDBGrid;
    TntStaticText1: TTntStaticText;
    ADOQuery2: TADOQuery;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1serial_no: TLargeintField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1al_mon: TStringField;
    ADOQuery1al_type: TStringField;
    ADOQuery1al_money: TBCDField;
    ADOQuery1al_reason: TWideStringField;
    ADOQuery1emp_chs: TTntWideStringField;
    ADOQuery1dept_code: TTntWideStringField;
    cb_Emp: TTntCheckBox;
    cbDept: TTntCheckBox;
    sb_Save: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_Add: TTntSpeedButton;
    PanelFlow: TTntPanel;
    TntLabel3: TTntLabel;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    TntGroupBox5: TTntGroupBox;
    Label_emp_id: TTntLabel;
    sb_FindEmp: TTntSpeedButton;
    Label_s_ask_h: TTntLabel;
    Label_s_ask_t: TTntLabel;
    Label_e_ask_h: TTntLabel;
    Label_e_ask_t: TTntLabel;
    TntLabel4: TTntLabel;
    TntLabel1: TTntLabel;
    Edt_emp_id: TTntDBEdit;
    Edt_month: TTntDBEdit;
    Edt_money: TTntDBEdit;
    Edt_reason: TTntDBEdit;
    edit_name: TTntDBEdit;
    edit_dept: TTntDBEdit;
    EditMonth: TMaskEdit;
    DBcb_type: TTntDBComboBox;
    DBNavigator1: TDBNavigator;
    sbtn_add: TTntSpeedButton;
    TntLabel2: TTntLabel;
    bbtn_finish: TTntSpeedButton;
    sb_print: TTntSpeedButton;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure PanelFlowTitleMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sb_FindEmpClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure SetActEnabled(Modify_Flag:boolean=true);
    procedure bbtn_CancelClick(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure EditEmpEndDblClick(Sender: TObject);
    procedure cb_EmpClick(Sender: TObject);
    procedure cbDeptClick(Sender: TObject);
    procedure bbtn_OKClick(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure sbtn_addClick(Sender: TObject);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure ADOQuery1al_typeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQuery1al_typeSetText(Sender: TField; const Text: String);
    procedure EditMonthEnter(Sender: TObject);
    function checkmonth:boolean;
    procedure sb_printClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal06: TFormSal06;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
{$R *.dfm}

procedure TFormSal06.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
  i:integer;
  GetCpt:TComponent;
begin
keys:='supply_again,deduct_money,zhuishuo_BHXH,date,month,fld_department,not_find_data,'
  +'query,print,update,save,cancel,search_condition,hrd09_error1,msg_month_error'
  +'total,current_location,is_valid,choose_all,choose_none,'
  +'msg_confirm_save,msg_confirm_cancel,msg_save_modify_data';
LangStr:=GetLangWideStrs(keys);
SetComponentLang(self);

end;

procedure TFormSal06.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str,fld_name:string;
begin
  SetComboxList('select dept_code+'' ''+abbr_titl from hrd_dept where '+G_sFactorySql+' order by dept_code',CobDeptBegin);
  SetComboxList('select dept_code+'' ''+abbr_titl from hrd_dept where '+G_sFactorySql+' order by dept_code',CobDeptEnd);
  DBcb_type.Items.Add(GetLangName(LangStr,'supply_again'));
  DBcb_type.Items.Add(GetLangName(LangStr,'deduct_money'));
  DBcb_type.Items.Add(GetLangName(LangStr,'zhuishuo_BHXH'));
end;

procedure TFormSal06.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(username,'sal06');
  SetActEnabled(false);
  InitLang;// Init language
  InitForm;// Init Form
end;

procedure TFormSal06.sb_AddClick(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    if Active=false then
    begin
      SQL.Clear;
      SQL.Add('select * from hrd_sal_allowance where 2=1 ');
      Active:=true;
    end;
    Append;
    edt_month.ReadOnly := false;
    edt_month.Color := clWindow;
  end;
  PanelMain.Enabled := false;
  PanelFlow.Visible:=true;
  sbtn_add.Show;
  Edt_Emp_Id.SetFocus;
  //SetActEnabled;
end;

procedure TFormSal06.PanelFlowTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);
end;

procedure TFormSal06.sb_FindEmpClick(Sender: TObject);
var
  EmpId :string;
begin
  EmpId := FindEmpId('emp_id');
  if EmpId<>'' then
  begin
    Edt_emp_id.Text := EmpId;
  end;
end;

procedure TFormSal06.sb_DelClick(Sender: TObject);
begin
  if not adoquery1.Eof then
  begin
    adoquery1.Delete;
  end;
end;

procedure TFormSal06.sb_RecoverClick(Sender: TObject);
begin
  adoquery1.CancelUpdates;
  SetActEnabled(false);
end;

procedure TFormSal06.sb_SaveClick(Sender: TObject);
begin
  adoquery1.UpdateBatch(arAll);
  SetActEnabled(false);
end;

procedure TFormSal06.sb_editClick(Sender: TObject);
begin
  PanelAct.Enabled := false;
  TntGroupBox1.Enabled := false;
  PanelFlow.Visible:=true;
  edt_month.ReadOnly := true;
  edt_month.Color := ClSkyBlue;
  Edt_Emp_Id.SetFocus;
  DBNavigator1.Show;
end;

procedure TFormSal06.SetActEnabled(Modify_Flag:boolean=true);
var
  status:boolean;
begin
  status:=AdoQuery1.Active;
  sb_Add.Enabled:=Pri_Arr[ADD];
  sb_Del.Enabled:=status and Pri_Arr[DEL];
  sb_edit.Enabled:=status and Pri_Arr[UPD];
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled  :=status and modify_flag;
end;

procedure TFormSal06.bbtn_CancelClick(Sender: TObject);
var
  flag:boolean;
  i:integer;
begin
  //2012-09-07 hyt add
  if AnalysisEmpFactory(Edt_emp_id.Text)=false then
    exit ;

  if not checkmonth then
  begin
    wideshowmessage(GetLangName(LangStr,'msg_month_error'));
    exit;
  end;  
  PanelMain.Enabled := true;
  PanelAct.Enabled := true;
  TntGroupBox1.Enabled := true;
  DBnavigator1.Hide;
  sbtn_add.Hide;
  PanelFlow.Hide;
  if adoquery1.State in [dsEdit,dsInsert] then
  begin
    if adoquery1.State = dsInsert then
    begin
      flag:=false;
      for i:=3 to 6 do
      begin
        if adoquery1.Fields[i].AsString<>'' then
          flag:= true;
      end;
      if not flag then
        adoquery1.Cancel
      else
        adoquery1.Post;
    end    
    else
      adoquery1.Post;
  end;
end;

procedure TFormSal06.BtnQueryClick(Sender: TObject);
var
  SqlStr,CondStr:String;
begin
  if length(EditMonth.Text)<>6 then
  begin
    wideshowmessage(GetLangName(LangStr,'hrd09_error1'));
    exit;
  end;
  SqlStr := 'select * from hrd_sal_allowance where al_mon='''+EditMonth.Text+''' ';
  if cb_Emp.Checked then
  begin
    if trim(EditEmpBegin.Text)<>'' then
      SqlStr := SqlStr + ' and emp_id>='''+trim(EditEmpBegin.Text)+''' ';
    if trim(EditEmpEnd.Text)<>'' then
      SqlStr := SqlStr + ' and emp_id<='''+trim(EditEmpEnd.Text)+''' ';
  end;

  //CondStr :='';
  //2012-09-07 hyt add
  CondStr:=' and '+G_sFactorySql+' ';

  if cbDept.Checked then
  begin
    if trim(EditEmpBegin.Text)<>'' then
      CondStr := CondStr + ' and dept_code>='''+leftstr(CobDeptBegin.Text,6)+''' ';
    if trim(EditEmpEnd.Text)<>'' then
      CondStr := CondStr + ' and dept_code<='''+leftstr(CobDeptEnd.Text,6)+''' ';
  end;
  if CondStr<>'' then
    CondStr := ' and emp_id in (select emp_id from hrd_emp where 1>0 '+CondStr+')';
  SqlStr := SqlStr+CondStr;
  with adoquery1 do
  begin
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;
    if not Eof then
    begin
      sb_Del.Enabled := true;
      sb_Edit.Enabled := true;
    end;  
  end;
  //
  sb_print.Enabled := (not ADOQuery1.IsEmpty) and (pri_arr[PRT]);
end;

procedure TFormSal06.EditEmpEndDblClick(Sender: TObject);
var
  EmpId :string;
begin
  EmpId := FindEmpId('emp_id');
  if EmpId<>'' then
  begin
    TTntEdit(Sender).Text := EmpId;
  end;
end;

procedure TFormSal06.cb_EmpClick(Sender: TObject);
begin
  if cb_Emp.Checked then
  begin
    EditEmpBegin.Enabled := true;
    EditEmpEnd.Enabled := true;
    EditEmpBegin.Color := ClWindow;
    EditEmpEnd.Color := ClWindow;
  end
  else
  begin
    EditEmpBegin.Enabled := false;
    EditEmpEnd.Enabled := false;
    EditEmpBegin.Color := ClBtnFace;
    EditEmpEnd.Color := ClBtnFace;
  end;
end;

procedure TFormSal06.cbDeptClick(Sender: TObject);
begin
  if cbDept.Checked then
  begin
    CobDeptBegin.Enabled := true;
    CobDeptEnd.Enabled := true;
    CobDeptBegin.Color := ClWindow;
    CobDeptEnd.Color := ClWindow;
  end
  else
  begin
    CobDeptBegin.Enabled := false;
    CobDeptEnd.Enabled := false;
    CobDeptBegin.Color := ClBtnFace;
    CobDeptEnd.Color := ClBtnFace;
  end;
end;

procedure TFormSal06.bbtn_OKClick(Sender: TObject);
begin
  adoquery1.Post;
  SetActEnabled;
end;

procedure TFormSal06.ImageCloseClick(Sender: TObject);
begin
  PanelMain.Enabled := true;
  PanelAct.Enabled := true;
  TntGroupBox1.Enabled := true;
  DBnavigator1.Hide;
  sbtn_add.Hide;
  PanelFlow.Hide;
end;

procedure TFormSal06.sbtn_addClick(Sender: TObject);
begin
  //2012-09-07 hyt add
  if AnalysisEmpFactory(Edt_emp_id.Text)=false then
    exit ;
    
  if edt_month.Text<>'' then
  checkmonth;
  adoquery1.Append;
end;

procedure TFormSal06.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
begin
  SetActEnabled;
end;

procedure TFormSal06.ADOQuery1al_typeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if sender.Value=1 then
    text:=GetLangName(LangStr,'supply_again');
  if sender.Value=2 then
    text:=GetLangName(LangStr,'deduct_money');
  //
  if Sender.Value = 3 then
    Text := GetLangName(LangStr,'zhuishuo_BHXH');
end;

procedure TFormSal06.ADOQuery1al_typeSetText(Sender: TField;
  const Text: String);
begin
  if text=GetLangName(LangStr,'supply_again') then
    sender.Value:=1;
  if text=GetLangName(LangStr,'deduct_money') then
    sender.Value:=2;
  //
  if Text = GetLangName(LangStr,'zhuishuo_BHXH') then
    Sender.Value := 3;
end;

procedure TFormSal06.EditMonthEnter(Sender: TObject);
begin
  if EditMonth.Text='' then
    EditMonth.Text:=formatdatetime('yyyymm',IncMonth(date,-1));
end;
function TformSal06.checkmonth:boolean;
var
  Ayear,Amonth:integer;
begin
  try 
    ayear:=strtoint(leftstr(edt_month.Text,4));
    amonth:=strtoint(rightstr(edt_month.Text,2));
    if (ayear>=2000) and (ayear<=Yearof(GetServerDateTime)) and (Amonth>=1) and (Amonth<=12) then
      result:=true
    else
      result:=false;  
  except
    result:=false;
  end;  
end;

procedure TFormSal06.sb_printClick(Sender: TObject);
var
  sFields: string;
begin
  //
  sFields := 'emp_id,al_mon,al_type,al_money,al_reason,emp_chs,dept_code';

  showPrint(ADOQuery1,'上月補發扣款明細', '', sFields);
end;

end.
