unit uFhrd206;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,tntDialogs, ExtCtrls,StrUtils, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, TntExtCtrls, TntDBGrids, TntDbCtrls, TntStdCtrls, TntButtons,
  DB, ADODB, DBClient, Provider,DateUtils,WSDLIntf, TntComCtrls, CheckLst,
  TntCheckLst, Menus, TntMenus, ImgList, TntForms,math, TntDB;
type
  TFormfhrd206 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    PanelPre: TPanel;
    PanelQuery: TTntPanel;
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
    TntStaticText1: TTntStaticText;
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
    TntLabel1: TTntLabel;
    EditTot: TEdit;
    PanelFlow: TTntPanel;
    TntLabel3: TTntLabel;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    TntGroupBox5: TTntGroupBox;
    Label_emp_chs: TTntLabel;
    Label_department: TTntLabel;
    Label_over_date: TTntLabel;
    Label_hour_start: TTntLabel;
    Label_emp_id: TTntLabel;
    Label_class_code: TTntLabel;
    sb_FindEmp: TTntSpeedButton;
    edit_name: TTntDBEdit;
    edit_dept: TTntDBEdit;
    DTPickOverdate: TTntDateTimePicker;
    seg_code: TTntDBEdit;
    edit_emp_id: TTntDBEdit;
    CobClass: TTntComboBox;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    bbtn_add: TTntBitBtn;
    bbtn_ok: TTntBitBtn;
    ADOQuery1: TADOQuery;
    ADOQuery1updator: TWideStringField;
    ADOQuery1update_time: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1emp_chs: TTntWideStringField;
    ADOQuery1department: TTntWideStringField;
    ADOQuery1class_code: TStringField;
    ADOQuery1clas_name: TTntWideStringField;
    ADOQuery1over_date: TDateTimeField;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    DataSource2: TDataSource;
    TntGroupBox2: TTntGroupBox;
    TntDBGrid1: TTntDBGrid;
    ADOQuery1seg_code: TStringField;
    ADOQuery1hour_s: TStringField;
    ADOQuery1hour_e: TStringField;
    ADOQuery1tot_hour: TFloatField;
    TntLabel4: TTntLabel;
    start_s: TTntDBEdit;
    TntLabel5: TTntLabel;
    end_s: TTntDBEdit;
    TntLabel8: TTntLabel;
    tot_hour: TTntDBEdit;
    procedure FormCreate(Sender: TObject);
     procedure InitLang;
    procedure InitForm;
    procedure SetActEnabled(modify_Flag:boolean=true);
    procedure Btn_SearchClick(Sender: TObject);
    procedure Btn_ResetClick(Sender: TObject);
    procedure sb_PrintClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure bbtn_addClick(Sender: TObject);
    procedure bbtn_okClick(Sender: TObject);
     function CheckInputValid:boolean;
     procedure ChangeFlowFlds;
     function CheckOvertime(empid,DeptCode:String;Adate:TDate):boolean;
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1BeforeClose(DataSet: TDataSet);
    procedure ADOQuery1BeforeDelete(DataSet: TDataSet);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure CobDeptBeginChange(Sender: TObject);
    procedure CobDeptBeginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CobClassChange(Sender: TObject);
    procedure TntDBGrid1CellClick(Column: TColumn);
    procedure ImageCloseClick(Sender: TObject);
    procedure EditEmpBeginChange(Sender: TObject);
    procedure PanelFlowTitleMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd206: TFormfhrd206;

implementation
uses
  UnitDMHrdsys,UnitHrdUtils;
{$R *.dfm}
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  single_modify_flag,all_modify_flag:boolean;


 procedure TFormfhrd206.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='not_find_data,total,current_location,dut06_print,msg_begin_end_time,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
  +'error_date,error_empid,dut02_choose_clas,error_hour,error_input_hour,'
  +'fld_over_date,fld_emp_id,fld_dept_code,msg_post_record_on_close,'
  +'save_success,save_fail,msg_month_data_locked,';
LangStr:=GetLangWideStrs(keys);
end;

procedure TFormfhrd206.InitForm;
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
  sql_str:='select '+fld_name+' as clas_name,clas_code from hrd_dut_class where clas_code>=''65'' and clas_code<=''LA''';
  SetComboxList(sql_str,CobClass,'66');
  DTPickBegin.Date:=dateOf(now)-30;
  DTPickEnd.Date:=dateOf(now);
  DTPickOverdate.Date:=dateOf(now);
end;


procedure TFormfhrd206.FormCreate(Sender: TObject);
begin
   InitLang;// Init language
  pri_arr:=GetPrvArr(username,'fhrd206');//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;
procedure TFormfhrd206.SetActEnabled(modify_Flag:boolean=true);
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
procedure TFormfhrd206.Btn_SearchClick(Sender: TObject);
var
  sql_str:string;
begin
  sql_str:='select * from fhrd_dut_over where 1=1 ';
    sql_str:=sql_str+' and over_date>=''' +formatdatetime('yyyy/mm/dd',DTPickBegin.date)+'''';
    sql_str:=sql_str+' and over_date<=''' +formatdatetime('yyyy/mm/dd',DTPickEnd.date)+'''';
  if rbEmp.Checked then
    begin
      if trim(EditEmpBegin.Text)<>'' then
        sql_str:=sql_str+' and emp_id>=''' +trim(EditEmpBegin.text)+'''';
      if trim(EditEmpEnd.Text)<>'' then
        sql_str:=sql_str+' and emp_id<=''' +trim(EditEmpEnd.text)+'''';
    end;
  if (rbDept.Checked) and ((trim(CobDeptBegin.Text)<>'') or (trim(CobDeptEnd.Text)<>'')) then
    begin
    //  sql_str:=sql_str+' and emp_id IN( select emp_id from hrd_emp where 1=1';
      if trim(CobDeptBegin.Text)<>'' then
        sql_str:=sql_str+' and dept_code>=''' +leftstr(CobDeptBegin.Text,6)+'''';
      if trim(CobDeptEnd.Text)<>'' then
        sql_str:=sql_str+' and dept_code<=''' +leftstr(CobDeptEnd.Text,6)+'''';
    //  sql_str:=sql_str+')';
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
        end;
    end;
  //合計時間
  sql_str:=StringReplace(sql_str,' * ',' sum(tot_hour) ',[]);
  with DMHrdsys.SQLQuery3 do
    begin
      close;
      sql.Clear;
      sql.Add(sql_str);
      open;
      if not Eof then
        EditTot.Text:=FloatToStr(Fields[0].AsFloat)
      else
        EditTot.Text:='';
    end;
  Btn_Reset.OnClick(Sender);
end;

procedure TFormfhrd206.Btn_ResetClick(Sender: TObject);
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
ADOQuery1.Active:= not status;
end;
procedure TFormfhrd206.sb_PrintClick(Sender: TObject);
var
  aStr:String;
begin
  aStr:=GetLangName(LangStr,'dut06_print')+';;<left>';
  aStr:=aStr+GetLangName(LangStr,'fld_over_date')+':'+FormatDateTime('yyyy/mm/dd',DTPickBegin.DateTime)
    +' -- '+FormatDateTime('yyyy/mm/dd',DTPickEnd.DateTime)+'  ';
  if rbEmp.Checked then
    aStr:=aStr+GetLangName(LangStr,'fld_emp_id')+':'+EditEmpBegin.Text+' -- '+EditEmpEnd.Text
  else if rbDept.Checked then
    aStr:=aStr+GetLangName(LangStr,'fld_dept_code')+':'+CobDeptBegin.Text+' -- '+CobDeptEnd.Text;
  showPrint(ADOQuery1,aStr);
end;

procedure TFormfhrd206.sb_AddClick(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    if Active=false then
    begin
      SQL.Clear;
      SQL.Add('select * from fhrd_dut_over where emp_id=-1');
      Active:=true;
    end;
    Append;
  end;
  ChangeFlowFlds;
  DBNavigator1.Hide;
  bbtn_add.Show;
  PanelFlow.Visible:=true;
  Edit_Emp_Id.SetFocus;
  PanelMain.Enabled:=false;
end;



procedure TFormfhrd206.sb_DelClick(Sender: TObject);
begin
with ADOQuery1 do
if (RecordCount<>0) or ( not Eof) then
  if wideMessageDlg(GetLangName(LangStr,'msg_del_alert'),mtConfirmation,[mbyes,mbno],0)=mryes then
    Delete;
end;

procedure TFormfhrd206.sb_editClick(Sender: TObject);
begin
  ChangeFlowFlds;
  DBNavigator1.Show;
  bbtn_add.Hide;
  PanelFlow.Visible:=true;
  Edit_Emp_Id.SetFocus;
  PanelGrid.Enabled:=true;
  PanelAct.Enabled:=false;
  PanelQuery.Enabled:=false;
end;
procedure TFormfhrd206.sb_RecoverClick(Sender: TObject);
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormfhrd206.sb_SaveClick(Sender: TObject);
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
procedure TFormfhrd206.bbtn_addClick(Sender: TObject);
//繼續新增
begin
  ADOQuery1.Append;
  ChangeFlowFlds;
  Edit_Emp_Id.SetFocus;
end;

procedure TFormfhrd206.bbtn_okClick(Sender: TObject);
var
   sql:string ;
begin
 sql := 'select emp_id from fhrd_emp where emp_info=''0''  and emp_id='''+edit_emp_id.Text+'''';
 dmhrdsys.SQLQuery1.SQL.Clear ;
 dmhrdsys.SQLQuery1.SQL.Add( sql );
 dmhrdsys.SQLQuery1.Open ;
 if dmhrdsys.SQLQuery1.Eof then
     begin
      showmessage(edit_emp_id.Text+', 已經離職, 不可以輸入加班 ');
      exit ;
    end;
 if not CheckOvertime(edit_emp_id.Text , copy( edit_dept.Text ,1, 6 ),DTPickOverdate.Date ) then
    begin
      showmessage(edit_emp_id.Text+', 加班已經超過規定的最大時數 ');
      exit ;
    end;
  with ADOQuery1 do
  begin
    if State in [dsedit,dsinsert] then
    begin
      FieldByName('class_code').Value:=leftstr(CobClass.Text,2);
      FieldByName('over_date').AsDateTime:=DTPickOverdate.Date;
      post;
    end;
  end;
  SetActEnabled(true);
  PanelFlow.Visible:=false;
 // ImageClose.OnClick(Sender)
// sb_save.Enabled := true ;
  PanelMain.Enabled:=true;
end;
function TFormfhrd206.CheckInputValid():boolean;
{*************************************************************************
TO DO:提交前檢查輸入的有效性
*************************************************************************}
begin
  if length(Edit_Emp_Id.Text)<>6 then
    begin
      WideMessageDlg(GetLangName(LangStr,'error_empid'),mterror,[mbOK],0);
      Edit_Emp_Id.SetFocus;
      result:=false;
      exit;
    end;
  if Cobclass.ItemIndex=-1 then
    begin
      WideMessageDlg(GetLangName(LangStr,'dut02_choose_clas'),mtConfirmation,[mbOK],0);
      Cobclass.SetFocus;
      result:=false;
      exit;
    end;
 
  result:=true;
end;
procedure TFormfhrd206.ChangeFlowFlds;
var
  DefDate,CurDate:Tdatetime;
begin
  with ADOQuery1 do
    begin
      if State=dsInsert then//工號是否可編輯
        begin
          Edit_Emp_Id.ReadOnly:=false;
          Edit_Emp_Id.Color:=clwhite;
          sb_FindEmp.Enabled:=true;
        end
      else
        begin
          Edit_Emp_Id.ReadOnly:=true;
          Edit_Emp_Id.Color:=clBtnface;
          sb_FindEmp.Enabled:=false;
        end;
      //默認日期
      CurDate:=GetServerDatetime;
      if FieldByName('over_date').AsString<>'' then
        DefDate:=FieldByName('over_date').AsDateTime
      else
        DefDate:=CurDate;
      DTPickOverdate.Date:=DefDate;
      //默認班別代號
      if FieldByName('class_code').AsString<>'' then
        SetComboxIndex(CobClass,FieldByName('class_code').AsString)
      else
        SetComboxIndex(CobClass,'66'); 
    end;
end;
function Tformfhrd206.CheckOvertime(empid,DeptCode:String;Adate:TDate):boolean;
//檢查加班是否超時
var
  StartDate,EndDate:TDate;
  SqlStr:WideString;
  OvrHours,MaxHour,ShowHour:double;
  timeBegin,timeEnd,sql:string;
begin
  //***<<<2012-01-06 hyt add 不控制鞋面廠的加班限制同福祿廠一樣
  //result:=true;
  //exit ;

  if UpperCase(LeftStr(DeptCode,1))<>'V' then //F,S 2012-09-15 hyt upd
  begin//fuluh不限制加班時間
    result:=true;
    exit;
  end;
  
  OvrHours:=0.0;

    StartDate:=StartOfTheYear(Adate);
    EndDate:=EndOfTheYear(Adate);
    MaxHour:=300.0; //250 2010-12-06 hyt upd
    sql:=' select emp_id , sum(tot_hour ) as tot_hour from fhrd_dut_over where  over_date >='''+ FormatDateTime('yyyy/',StartDate)+'01/01' +''' and over_date <='''+ FormatDateTime('yyyy/',StartDate) + '12/31' +'''   and   emp_id='''+empid +'''    group by emp_id ';
    dmhrdsys.SQLQuery1.SQL.Clear ;
    dmhrdsys.SQLQuery1.SQL.Add(sql);
    dmhrdsys.SQLQuery1.Open ;
     with dmhrdsys.SQLQuery1    do
      begin
        close;
        open;
        if not Eof then
          OvrHours:=OvrHours+FieldByName('tot_hour').AsFloat;
      end;
      StartDate:=StartOfAMonth(YearOf(Adate),MonthOf(Adate));


    if RunMode='2' then//檢查模式
      ShowHour:=min(OvrHours,MaxHour);
  //  SetStatusText(GetLangName(ws_Words,'emp_id')+empid+GetLangName(ws_Words,'msg_year_over')+floattostr(ShowHour));
    if OvrHours>MaxHour then//超時
    begin
      result:=false;
    end
    else//未超
    begin
      result:=true;
    end;
end;
procedure TFormfhrd206.ADOQuery1AfterClose(DataSet: TDataSet);
begin
  SetActEnabled(false);
end;

procedure TFormfhrd206.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
 SetActEnabled(false);
end;

procedure TFormfhrd206.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
with ADOQuery1 do
  begin
    setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
  end;    
end;


procedure TFormfhrd206.ADOQuery1BeforeClose(DataSet: TDataSet);
begin
  if all_modify_flag then
    if wideMessageDlg(GetLangName(LangStr,'msg_save_modify_data'),mtError,[mbyes,mbno],0)=mryes then
      ADOQuery1.UpdateBatch;
end;
procedure TFormfhrd206.ADOQuery1BeforeDelete(DataSet: TDataSet);
var
  AMonth:string;
begin
  //該月資料已經鎖定
  AMonth:=FormatDateTime('yyyymm',DataSet.FieldByName('over_date').AsDateTime);
 // if (AMonth<=LockMonthPart) and (UserName<>DebugUser) then
 // begin
 //   WideMessageDlg(GetLangName(LangStr,'msg_month_data_locked'),mtError,[mbYes],0);
 //   abort;
 // end;
end;
procedure TFormfhrd206.ADOQuery1BeforePost(DataSet: TDataSet);
{*************************************************************************
TO DO:移動前錯誤檢查,改變一些欄位值
*************************************************************************}
var
  stime,etime:real;
begin
  if not CheckInputValid then
    abort;
  //該月資料已經鎖定
//  if ((FormatDateTime('yyyymm',DTPickOverdate.Date))<=LockMonthPart) and (UserName<>DebugUser) then
//  begin
//    WideMessageDlg(GetLangName(LangStr,'msg_month_data_locked'),mtError,[mbYes],0);
//    abort;
//  end;
  with ADOQuery1 do
  begin
   {if length(trim(fieldbyname('emp_id').AsString))<>6 then
    begin
      wideMessageDlg(GetLangName(LangStr,'error_empid'),mtError,[mbok],0);
      edit_emp_id.SetFocus;
      abort;
    end;
    }
   // stime:=fieldbyname('hour_start').value+strtoint(fieldbyname('time_start').value)/60;
    //etime:=fieldbyname('hour_end').value+strtoint(fieldbyname('time_end').value)/60;
    FieldByName('dept_code').AsString:=leftstr(edit_dept.Text,6);
    FieldByName('class_code').AsString:=leftstr(CobClass.Text,2);
    FieldByName('over_date').AsDateTime:=DTPickOverdate.Date;
    Fieldbyname('tot_hour').value:=tot_hour.Text ;
    Fieldbyname('hour_s').value:=start_s.Text ;
    Fieldbyname('hour_e').value:=end_s.Text ;
    Fieldbyname('seg_code').value:=seg_code.Text ;
    FieldByName('updator').Value:=username;
    FieldByName('update_time').Value:=GetServerDateTime;
  end;
  single_modify_flag:=false;
end;
procedure TFormfhrd206.ADOQuery1WillChangeRecord(
  DataSet: TCustomADODataSet; const Reason: TEventReason;
  const RecordCount: Integer; var EventStatus: TEventStatus);
begin
  SetActEnabled(true);
end;

procedure TFormfhrd206.CobDeptBeginChange(Sender: TObject);
begin
   CobDeptEnd.Text := CobDeptBegin.Text ;
end;

procedure TFormfhrd206.CobDeptBeginKeyDown(Sender: TObject; var Key: Word;
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

procedure TFormfhrd206.CobClassChange(Sender: TObject);
var
  sql :string ;
begin
  sql := 'select *from hrd_dut_seg where clas_code='''+ copy( cobclass.Text ,1,2 ) +'''';
  adoQuery4.SQL.Clear ;
  adoQuery4.SQL.Add(sql);
  adoQuery4.Open ;
   
end;

procedure TFormfhrd206.TntDBGrid1CellClick(Column: TColumn);
var
  hour :real ;
begin
   seg_code.Text := adoQuery4.fieldbyname('seg_code').AsString ;
   start_s.Text :=  adoQuery4.fieldbyname('s_start').AsString ;
   end_s.Text :=  adoQuery4.fieldbyname('s_end').AsString ;
   hour := strtoint( copy(adoQuery4.fieldbyname('s_end').AsString,1,2 ) ) - strtoint( copy(adoQuery4.fieldbyname('s_start').AsString,1,2 ) ) + 
           ( strtoint( copy(adoQuery4.fieldbyname('s_end').AsString,3,2 ) ) - strtoint( copy(adoQuery4.fieldbyname('s_start').AsString,3,2 ) ) )/60 ;
   tot_hour.Text := floattostr( hour )  ;
end;

procedure TFormfhrd206.ImageCloseClick(Sender: TObject);
begin
  panelflow.Visible := false ;
end;

procedure TFormfhrd206.EditEmpBeginChange(Sender: TObject);
begin
  EditEmpEnd.Text:=EditEmpBegin.Text;
end;

procedure TFormfhrd206.PanelFlowTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//拖動浮動窗口
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);

end;

end.
