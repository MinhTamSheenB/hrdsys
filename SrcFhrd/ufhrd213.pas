unit ufhrd213;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,math,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils;

type
  TFormFhrd213 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel6: TTntLabel;
    TntLabel7: TTntLabel;
    TntLabel9: TTntLabel;
    TntLabel2: TTntLabel;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    rbEmp: TTntRadioButton;
    rbDept: TTntRadioButton;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    DTPickBegin: TTntDateTimePicker;
    DTPickEnd: TTntDateTimePicker;
    Btn_Search: TTntBitBtn;
    Btn_Reset: TTntBitBtn;
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
    Label_s_ask_d: TTntLabel;
    Label_s_ask_h: TTntLabel;
    Label_clas_code: TTntLabel;
    TntLabel4: TTntLabel;
    TntLabel1: TTntLabel;
    CobClass: TTntComboBox;
    EditEmpId: TTntDBEdit;
    EditShour: TTntDBEdit;
    edit_name: TTntDBEdit;
    edit_dept: TTntDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    bbtn_add: TTntBitBtn;
    bbtn_ok: TTntBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1department: TWideStringField;
    ADOQuery1clas_name: TWideStringField;
    ADOQuery1upd_user: TWideStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TWideStringField;
    ADOQuery1cls_id: TWideStringField;
    ADOQuery1up_time: TWideStringField;
    ADOQuery4: TADOQuery;
    TntDBEdit1: TTntDBEdit;
    TntLabel5: TTntLabel;
    ADOQuery1arr_date: TDateTimeField;
    ADOQuery1money: TFloatField;
    ADOQuery2: TADOQuery;
    DTPickSdate: TTntDateTimePicker;
    procedure InitLang;
    procedure InitForm;
    procedure sb_AddClick(Sender: TObject);
    procedure sb_PrintClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure bbtn_okClick(Sender: TObject);
    procedure bbtn_addClick(Sender: TObject);
    procedure EditEmpIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CobClassChange(Sender: TObject);
    procedure CobClassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CobClassExit(Sender: TObject);
    procedure DTPickSdateChange(Sender: TObject);
    procedure DTPickSdateExit(Sender: TObject);
    procedure DTPickSdateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_SearchClick(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure Btn_ResetClick(Sender: TObject);
    procedure CobDeptBeginChange(Sender: TObject);
    procedure CobDeptBeginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ChangeFlowFlds;
    procedure SetActEnabled(modify_Flag:boolean=true);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
  //  procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure TntDBEdit1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFhrd213: TFormFhrd213;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
{$R *.dfm}

procedure TFormFhrd213.sb_AddClick(Sender: TObject);
begin
with ADOQuery1 do
  begin
    if Active=false then//如果沒有打開數據集， 則重新打開
    begin
      SQL.Clear;
      SQL.Add('select * from fhrd_arr where 2=1 ');
      Active:=true;
    end;
//    Last;
    Append;
  end;
  ChangeFlowFlds;
  DBNavigator1.Hide;
  bbtn_add.Show;
  PanelFlow.Visible:=true;
  EditEmpId.SetFocus;
  PanelMain.Enabled:=false;
 end ;
procedure TFormFhrd213.sb_PrintClick(Sender: TObject);
begin
 // showPrint(ADOQuery1,'員工請假情況列印');
end;

procedure TFormFhrd213.sb_DelClick(Sender: TObject);
var
  sql,sql_str :string ;
begin
 // with ADOQuery1 do
//if (RecordCount<>0) or ( not Eof) then
  if wideMessageDlg(GetLangName(LangStr,'msg_del_alert'),mtConfirmation,[mbyes,mbno],0)=mryes then
     begin
       sql :='delete from fhrd_arr where emp_id=''' + adoQuery1.fieldbyname('emp_id').asstring + ''' and arr_date=''' +formatdatetime('yyyy/mm/dd',adoQuery1.fieldbyname('arr_date').AsDateTime)  + '''' ;
       adoQuery2.SQL.Clear ;
       adoQuery2.SQL.Add(sql);
       adoQuery2.ExecSQL ;

     end;
   // Delete;
    adoQuery1.Close ; 
    sql_str:='select a.* from fhrd_arr as a, fhrd_emp as b where a.emp_id=b.emp_id ';
    sql_str:=sql_str+' and a.arr_date>=''' +formatdatetime('yyyy/mm/dd',DTPickBegin.date)+'''';
    sql_str:=sql_str+' and a.arr_date<=''' +formatdatetime('yyyy/mm/dd',DTPickEnd.date)+'''';
  if rbEmp.Checked then
    begin
      if trim(EditEmpBegin.Text)<>'' then
        sql_str:=sql_str+' and a.emp_id>=''' +trim(EditEmpBegin.text)+'''';
      if trim(EditEmpEnd.Text)<>'' then
        sql_str:=sql_str+' and a.emp_id<=''' +trim(EditEmpEnd.text)+'''';
      //sql_str:=sql_str+' and emp_id IN( select emp_id from fhrd_emp where '+UserDeptStr+')';
    end;
  if (rbDept.Checked) and ((trim(CobDeptBegin.Text)<>'') or (trim(CobDeptEnd.Text)<>'')) then
    begin
       if trim(CobDeptBegin.Text)<>'' then
          sql_str:=sql_str+' and b.dept_code>=''' +leftstr(CobDeptBegin.Text,6)+'''';
        if trim(CobDeptEnd.Text)<>'' then
          sql_str:=sql_str+' and b.dept_code<=''' +leftstr(CobDeptEnd.Text,6)+'''';
      sql_str:=sql_str+')';
    end;
  with Adoquery1 do
    begin
      close;
      sql.Clear;
      sql.Add(sql_str);
      //SetOtherFields;//set other fields value
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

procedure TFormFhrd213.sb_editClick(Sender: TObject);
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

procedure TFormFhrd213.sb_RecoverClick(Sender: TObject);
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormFhrd213.sb_SaveClick(Sender: TObject);
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
try
  ADOQuery1.UpdateBatch;
  SetActEnabled(false);
  WideShowMessage(GetLangName(LangStr,'save_success'));
except
  WideShowMessage(GetLangName(LangStr,'save_fail'));
end;
end;

procedure TFormFhrd213.bbtn_okClick(Sender: TObject);
var
  sql_str :string ;
begin

   sql_str:='select * from fhrd_arr A where emp_id =''' + EditEmpId.text + ''' and seg_id=''' + TntDBEdit1.Text + ''' and arr_date='''+ formatdatetime('yyyy/mm/dd',DTPickSdate.Date)   + '''';

    Adoquery2.close;
    Adoquery2.sql.Clear;
    Adoquery2.sql.Add(sql_str);
    Adoquery2.open;
    if not Adoquery2.eof then
       showmessage( '該員工夜班資料已存在' )
    else
      begin
        if ADOQuery1.State in [dsedit,dsinsert] then
           ADOQuery1.post;
      end;
  ImageClose.OnClick(Sender);
end;

procedure TFormFhrd213.bbtn_addClick(Sender: TObject);
begin
   ADOQuery1.Append;
  ChangeFlowFlds;
  EditEmpId.SetFocus;
end;

procedure TFormFhrd213.EditEmpIdKeyDown(Sender: TObject; var Key: Word;
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

procedure TFormFhrd213.CobClassChange(Sender: TObject);
begin
    ADOQuery1.Edit;
  ADOQuery1.FieldByName('cls_id').AsString:=leftstr(CobClass.Text,2);
end;

procedure TFormFhrd213.CobClassKeyDown(Sender: TObject; var Key: Word;
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

procedure TFormFhrd213.CobClassExit(Sender: TObject);
begin
    ADOQuery1.Edit;
  ADOQuery1.FieldByName('cls_id').AsString:=leftstr(CobClass.Text,2);
end;

procedure TFormFhrd213.DTPickSdateChange(Sender: TObject);
begin
   ADOQuery1.Edit;
  ADOQuery1.FieldByName('arr_date').AsDateTime:=DateOf(DTPickSdate.Date);
end;

procedure TFormFhrd213.DTPickSdateExit(Sender: TObject);
begin
   ADOQuery1.Edit;
  ADOQuery1.FieldByName('arr_date').AsDateTime:=DateOf(DTPickSdate.Date);
end;

procedure TFormFhrd213.DTPickSdateKeyDown(Sender: TObject; var Key: Word;
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

procedure TFormFhrd213.Btn_SearchClick(Sender: TObject);
var
  sql_str:string;
begin
  sql_str:='select a.* from fhrd_arr as a, fhrd_emp as b where a.emp_id=b.emp_id ';
    sql_str:=sql_str+' and a.arr_date>=''' +formatdatetime('yyyy/mm/dd',DTPickBegin.date)+'''';
    sql_str:=sql_str+' and a.arr_date<=''' +formatdatetime('yyyy/mm/dd',DTPickEnd.date)+'''';
  if rbEmp.Checked then
    begin
      if trim(EditEmpBegin.Text)<>'' then
        sql_str:=sql_str+' and a.emp_id>=''' +trim(EditEmpBegin.text)+'''';
      if trim(EditEmpEnd.Text)<>'' then
        sql_str:=sql_str+' and a.emp_id<=''' +trim(EditEmpEnd.text)+'''';
      //sql_str:=sql_str+' and emp_id IN( select emp_id from fhrd_emp where '+UserDeptStr+')';
    end;
  if (rbDept.Checked) and ((trim(CobDeptBegin.Text)<>'') or (trim(CobDeptEnd.Text)<>'')) then
    begin
       if trim(CobDeptBegin.Text)<>'' then
          sql_str:=sql_str+' and b.dept_code>=''' +leftstr(CobDeptBegin.Text,6)+'''';
        if trim(CobDeptEnd.Text)<>'' then
          sql_str:=sql_str+' and b.dept_code<=''' +leftstr(CobDeptEnd.Text,6)+'''';
      sql_str:=sql_str+')';
    end;
  with Adoquery1 do
    begin
      close;
      sql.Clear;
      sql.Add(sql_str);
      //SetOtherFields;//set other fields value
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


procedure TFormFhrd213.ImageCloseClick(Sender: TObject);
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

procedure TFormFhrd213.Btn_ResetClick(Sender: TObject);
var
  status:boolean;
begin
if TtntBitBtn(Sender).Name='Btn_Reset' then
  status:=true
else
  status:=false;
DTPickBegin.Enabled:=status;
DTPickEnd.Enabled:=status;
RBEmp.Enabled:=status;
RBDept.Enabled:=status;
EditEmpBegin.Enabled:=status;
EditEmpEnd.Enabled:=status;
CobDeptBegin.Enabled:=status;
CobDeptEnd.Enabled:=status;
Btn_search.Enabled:=status;
Btn_Reset.Enabled:=not status;
//if status=true then
ADOQuery1.Active:= not status;
end;

procedure TFormFhrd213.CobDeptBeginChange(Sender: TObject);
begin
  CobDeptEnd.Text:=CobDeptBegin.Text;
end;

procedure TFormFhrd213.CobDeptBeginKeyDown(Sender: TObject; var Key: Word;
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
procedure TFormFhrd213.ChangeFlowFlds;
//給浮動窗口中某些欄位賦默認值
var
  DefDate,CurDate:Tdatetime;
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
      //默認起止日期
      CurDate:=GetServerDatetime;
      if FieldByName('arr_date').AsString<>'' then
        DefDate:=FieldByName('arr_date').AsDateTime
      else
        DefDate:=CurDate;
      DTPickSdate.Date:=DefDate;

    //  DTPickEdate.Date:=DefDate;
      //默認班別代號
      if FieldByName('cls_id').AsString<>'' then
        SetComboxIndex(CobClass,FieldByName('cls_id').AsString)
      else
        SetComboxIndex(CobClass,'03');
    end;
end;

procedure TFormFhrd213.SetActEnabled(Modify_Flag:boolean=true);
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

procedure TFormFhrd213.FormCreate(Sender: TObject);
begin
   InitLang;// Init language
  pri_arr:=GetPrvArr(username,'fhrd202');//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;
procedure TFormFhrd213.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;             
begin
SetComponentLang(self);//set component language text
keys:='dut02_titl,not_find_data,total,current_location,save_success,'
  +'msg_confirm_save,msg_confirm_cancel,msg_del_alert,dut02_exist_excuse,'
  +'error_date,error_empid,dut02_choose_clas,error_hour,error_input_hour,'
  +'msg_ask_over_days,msg_ask_over_days_60,msg_post_record_on_close,'
  +'save_success,save_fail';
LangStr:=GetLangWideStrs(keys);
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;

procedure TFormFhrd213.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str,fld_name:string;
begin
  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
  CobDeptBegin.Enabled:=false;
  CobDeptEnd.Enabled:=false;
  CobDeptBegin.Color:=clBtnface;
  CobDeptEnd.Color:=clBtnface;
  if userLang='E' then
    fld_name:='clas_code+'' ''+clas_eng'
  else if userLang='V' then
    fld_name:='clas_code+'' ''+clas_vim'
  else
    fld_name:='clas_code+'' ''+clas_chs';
  sql_str:='select '+fld_name+' as clas_name,clas_code from hrd_dut_class where clas_code>=''62'' and clas_code<=''63''';
  SetComboxList(sql_str,CobClass,'12');
  DTPickBegin.Date:=dateOf(now)-7;
  DTPickEnd.Date:=dateOf(now)+1;
  DTPickSdate.Date:=dateOf(now);
 // DTPickEdate.Date:=dateOf(now);
end;

procedure TFormFhrd213.ADOQuery1CalcFields(DataSet: TDataSet);
var
  s_ask_d,e_ask_d,s_time,e_time,t_time,CurDays,t_date:Tdatetime;
  i:integer;
  emp_id,clas_code,sql_str:string;
  emp_chs,department,clas_name:WideString;
  flds:TFields;
  DayRest:double;
//計算本次請假時長
begin
  with Dataset do
  begin
    emp_id:=FieldByName('emp_id').AsString;
    clas_code:=FieldByName('cls_id').AsString;
    s_ask_d:=FieldByName('arr_date').AsDateTime;

  end;

  sql_str:='select * from fhrd_emp A left join hrd_dept B '
    +'on A.dept_code=B.dept_code where emp_id='''+emp_id+'''';
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    emp_chs:=FieldByName('emp_name').AsString;
    department:=FieldByName('dept_code').AsString+' '+FieldByName('abbr_titl').AsString;
  end;
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_dut_class where clas_code='''+clas_code+'''');
    open;
    clas_name:=FieldByName('clas_chs').AsString;
  end;
 // with Dataset do
 // begin
 //   Dataset.FieldByName('upd_user').Value:=username;
    Dataset.FieldByName('clas_name').Value:=clas_name;
    Dataset.FieldByName('emp_chs').AsString:=emp_chs;
    Dataset.FieldByName('department').AsString:=department;
  //end;
end;

procedure TFormFhrd213.ADOQuery1AfterClose(DataSet: TDataSet);
begin
   SetActEnabled(false);
end;

procedure TFormFhrd213.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
   SetActEnabled(false);
end;

procedure TFormFhrd213.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  ChangeFlowFlds;
with ADOQuery1 do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;



procedure TFormFhrd213.ADOQuery1WillChangeRecord(
  DataSet: TCustomADODataSet; const Reason: TEventReason;
  const RecordCount: Integer; var EventStatus: TEventStatus);
begin
   SetActEnabled(true);
end;

procedure TFormFhrd213.TntDBEdit1Change(Sender: TObject);
begin
  EditShour.Text := '0' ;
  if  TntDBEdit1.text = '02' then
      EditShour.Text := '1.5' ;  //'0.8' ; //2010.11.06 upd
  if  TntDBEdit1.text = '03' then
      EditShour.Text := '2.5' ; //'1.6' ;    //2010.11.06 upd
  if  TntDBEdit1.text = '04' then
      EditShour.Text := '2.4' ;
end;

end.
