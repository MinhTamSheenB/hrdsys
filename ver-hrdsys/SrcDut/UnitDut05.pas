unit UnitDut05;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,tntDialogs, ExtCtrls,StrUtils, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, TntExtCtrls, TntDBGrids, TntDbCtrls, TntStdCtrls, TntButtons,
  DB, ADODB, DBClient, Provider,DateUtils,WSDLIntf, TntComCtrls, CheckLst,
  TntCheckLst, Menus, TntMenus, ImgList, TntForms;

type
  TformDut05 = class(TForm)
    PanelTitle: TTntPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery2trip_seg: TLargeintField;
    ADOQuery2emp_id: TStringField;
    ADOQuery2s_trip_d: TDateTimeField;
    ADOQuery2s_trip_h: TStringField;
    ADOQuery2s_trip_m: TStringField;
    ADOQuery2e_trip_d: TDateTimeField;
    ADOQuery2e_trip_h: TStringField;
    ADOQuery2e_trip_m: TStringField;
    ADOQuery4: TADOQuery;
    ADOQuery2emp_chs: TStringField;
    ADOQuery2dept_code: TStringField;
    PanelMain: TTntPanel;
    TntGroupBox2: TTntGroupBox;
    DEPT_B: TTntComboBox;
    tbb_search: TTntBitBtn;
    tbb_reset: TTntBitBtn;
    date_s1: TTntDateTimePicker;
    date_e1: TTntDateTimePicker;
    DEPT_E: TTntComboBox;
    id_s1: TTntEdit;
    id_e1: TTntEdit;
    tcb_date: TTntCheckBox;
    tcb_id: TTntCheckBox;
    tcb_dept: TTntCheckBox;
    TntStaticText2: TTntStaticText;
    TntPanel6: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    TntGroupBox3: TTntGroupBox;
    TntDBGrid2: TTntDBGrid;
    sb_Print: TTntSpeedButton;
    Panel1: TTntPanel;
    ADOQuery2upd_user: TStringField;
    ADOQuery2upd_date: TDateTimeField;
    ADOQuery2s_datetime: TStringField;
    ADOQuery2e_datetime: TStringField;
    PanelFlow: TTntPanel;
    TntLabel10: TTntLabel;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    TntGroupBox1: TTntGroupBox;
    TntLabel11: TTntLabel;
    sb_FindEmp: TTntSpeedButton;
    Label_s_ask_d: TTntLabel;
    Label_s_ask_h: TTntLabel;
    TntLabel13: TTntLabel;
    TntLabel14: TTntLabel;
    TntLabel15: TTntLabel;
    TntLabel16: TTntLabel;
    TntLabel17: TTntLabel;
    TntLabel18: TTntLabel;
    dtp_DateBeg: TTntDateTimePicker;
    dtp_DateEnd: TTntDateTimePicker;
    TEDT_ID: TTntDBEdit;
    s_hour: TTntDBEdit;
    s_minute: TTntDBEdit;
    e_hour: TTntDBEdit;
    e_minute: TTntDBEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    DBNavigator2: TDBNavigator;
    bbtn_add: TTntBitBtn;
    bbtn_OK: TTntBitBtn;
    Panel8: TPanel;
    Panel9: TPanel;
    name: TTntEdit;
    dept: TTntEdit;
    ADOQuery2tot_hour: TStringField;
    TntLabel1: TTntLabel;
    TntDBEdit1: TTntDBEdit;
    ADOQuery2reason: TWideStringField;
    procedure InitLangInfo;
    procedure FormCreate(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure tbb_searchClick(Sender: TObject);
    procedure tbb_resetClick(Sender: TObject);
    procedure rb_addClick(Sender: TObject);
    procedure FormInit;
    procedure tcb_dateClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    function checkData:boolean;
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure bbtn_OK1Click(Sender: TObject);
    procedure TntPanel5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageClose1Click(Sender: TObject);
    procedure bbtn_CancelClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure EnableControl(Value:Boolean;Flag:Integer);
    procedure SaveData;
    procedure ADOQuery2BeforeClose(DataSet: TDataSet);
    procedure ADOQuery2AfterOpen(DataSet: TDataSet);
    procedure ADOQuery2AfterDelete(DataSet: TDataSet);
    procedure ADOQuery2AfterPost(DataSet: TDataSet);
    procedure TntSpeedButton1Click(Sender: TObject);
    function  GetEmpName(EmpId:String):String;
    function  GetEmpDept(EmpId:String):String;
    procedure ADOQuery2user_nameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQuery2user_deptGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure bb_resetClick(Sender: TObject);
    procedure sb_PrintClick(Sender: TObject);
    procedure ADOQuery2CalcFields(DataSet: TDataSet);
    procedure s_minute1Change(Sender: TObject);
    procedure e_hour1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADOQuery2AfterScroll(DataSet: TDataSet);
    procedure s_hour1Change(Sender: TObject);
    procedure sb_FindEmpClick(Sender: TObject);
    procedure bbtn_addClick(Sender: TObject);
    procedure bbtn_OKClick(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure PanelFlowTitleMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TEDT_IDChange(Sender: TObject);
    procedure ADOQuery2BeforePost(DataSet: TDataSet);
    procedure s_hourChange(Sender: TObject);
    procedure TEDT_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADOQuery2BeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formDut05: TformDut05;
  ws_Words:TWideStrings;
  PanelX,PanelY :integer;
implementation

uses
  UnitDMHrdsys,UnitHrdUtils;
var
  PrvArr:TPrvArr;
{$R *.dfm}
{===============================================================================
  取員工工號与部門
===============================================================================}
function TFormDut05.GetEmpName(EmpId:String):String;
begin
  //
  with ADOQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT emp_chs FROM hrd_emp WHERE emp_id='''+EmpId+'''');
    Open;
    if not Eof then
      Result:=FieldByName('emp_chs').AsString;
    Close;
  end;
end;
function TFormDut05.GetEmpDept(EmpId:String):String;
begin
  //
  with ADOQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT a.dept_code+''-''+b.abbr_titl AS emp_dept FROM hrd_emp a,hrd_dept b'+
      ' WHERE a.dept_code=b.dept_code and a.emp_id='''+EmpId+'''');
    Open;
    if not Eof then
      Result:=FieldByName('emp_dept').AsString;
    Close;
  end;
end;
{===============================================================================
  檢查資料是否正確
================================================================================}
function TFormDut05.CheckData:Boolean;
var
  h1,h2,m1,m2:Integer;
begin
  //工號為六位，並且檢查工號是否存在
  if Length(Trim(tedt_id.Text))<>6 then
  begin
    Result := false;
    Exit;
  end;
 { with DMhrdsys.sqlquery2 do   //2010.05.14<<
  begin
    sql.clear;
    sql.add('select * from hrd_emp where emp_id='''+tedt_id.Text+''' and '+UserDeptStr);
    open;
    if eof then
    begin
      wideshowmessage('你無權操作該工號！');
      close;
      abort;
    end;
    close;
  end;  }
  try         //2010.05.14 >>
    h1:=strtoint(s_hour.Text);
    h2:=strtoint(e_hour.Text);
    m1:=strtoint(s_minute.Text);
    m2:=strtoint(e_minute.Text);
  except
    result := false;
    Exit;
  end;
  if (h1>23) or (h1<0) or (h2>23) or (h2<0) or (m1>59) or (m1<0) or (m2>59) or (m2<0) then
  begin
    Result:= false;
    Exit;
  end;
  Result:=true;
end;
{===============================================================================
  Form創建時的初始化
===============================================================================}
procedure TformDut05.FormCreate(Sender: TObject);
begin
  InitLangInfo;  //初始化語言
  FormInit;      //初始化其他基本信息
end;
{===============================================================================
  初始化語言
===============================================================================}
procedure TformDut05.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  SetComponentLang(self);//set component language text
  //定義要用到的語言
  ThisFormUsedWords:='save_fail,save_success,not_find_data,dut05_dateerror,'+
    'dut05_depterror,msg_save_modify_data,dut05_error1,hrd09_error4,dut05_error2,dut05_error3,'+
    'trip_print,current_location,msg_post_record_on_close,msg_month_data_locked,';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
  
end;
{===============================================================================
  基本信息初始化
===============================================================================}
procedure TformDut05.FormInit;
begin
  //初始化,取用戶對該畫面擁有的權限
  PrvArr:=GetPrvArr(UserName,'dut05');
  if PrvArr[ADD] then
    sb_Add.Enabled:=true
  else
    sb_Add.Enabled:=false;
{  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept',dept_B);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept',dept_E);}
  GetDeptRange(dept_B);
  GetDeptRange(dept_E);
  dtp_DateBeg.Date:=DateOf(now);
  dtp_DateEnd.Date:=DateOf(now);
  date_s1.Date:=DateOf(now)-30;
  date_e1.Date:=DateOf(now);
end;

procedure TformDut05.TntDBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;

procedure TformDut05.tbb_searchClick(Sender: TObject);
var
  SqlStr:String;
begin
  sqlstr:='SELECT * '+
    ' FROM hrd_dut_trip WHERE emp_id in(select emp_id from hrd_emp where '+UserDeptStr+') ';
  //公出日期
  if tcb_date.Checked then
  begin
    if date_s1.date-date_e1.Date>0 then
    begin
      wideshowmessage(GetLangName(ws_Words,'dut05_dateerror'));
      exit;
    end;
    sqlstr := sqlstr + ' AND e_trip_d>='''+FormatDateTime('yyyy/mm/dd',date_s1.date)+
      ''' AND s_trip_d<='''+FormatDateTime('yyyy/mm/dd',date_e1.date)+'''';
  end;
  //員工工號
  if tcb_id.Checked then
  begin
    if trim(id_s1.Text) <> '' then
      sqlstr := sqlstr + ' and emp_id>='''+trim(id_s1.Text)+''' ';
    if trim(id_e1.Text) <> '' then
      sqlstr := sqlstr + ' and emp_id<='''+trim(id_e1.Text)+''' ';

    //2012-09-07 hyt add
    SqlStr:=SqlStr+' and emp_id IN( select emp_id from fhrd_emp where '+G_sFactorySql+') ';  
  end;
  //員工部門
  if tcb_dept.Checked then
  begin
    if (trim(dept_b.Text)<>'') and (trim(dept_e.Text)<>'') and (dept_b.Text>dept_e.Text)  then
    begin
      wideshowmessage(GetLangName(ws_Words,'dut05_depterror'));
      exit;
    end;
    sqlStr:=sqlstr+'AND emp_id in(select emp_id from hrd_emp WHERE 1>0 ' ;
    if trim(dept_b.Text) <> '' then
      sqlstr := sqlstr + ' AND dept_code>='''+leftstr(dept_b.Text,6)+''' ';
    if trim(dept_e.Text) <> '' then
      sqlstr := sqlstr + ' AND dept_code<='''+leftstr(dept_e.Text,6)+''' ';
    sqlstr:=sqlstr+')';
  end;
  with AdoQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(SqlStr);
    Open;
    if Eof then
    begin
      WideShowMessage(GetLangName(ws_Words,'not_find_data'));
      Close;
      Abort;
      //WideShowMessage(GetLangName(ws_Words,''));
    end;
  end;
  EnableControl(false,1);
  tntDbGrid2.SetFocus;
  SetStatusText(GetLangName(ws_words,'current_location')+' '+inttostr(adoquery2.RecNo)+'/'+inttostr(adoquery2.RecordCount));
end;
{===============================================================================
  Enable Control
===============================================================================}
procedure TFormDut05.EnableControl(Value:Boolean;Flag:Integer);
begin
  if Flag=1 then        //維護
  begin
    tcb_date.Enabled:=Value;
    tcb_id.Enabled:=Value;
    tcb_dept.Enabled:=Value;
    date_s1.Enabled:=Value;
    date_e1.Enabled:=Value;
    id_s1.Enabled:=Value;
    id_e1.Enabled:=Value;
    dept_b.Enabled:=Value;
    dept_e.Enabled:=Value;
    tbb_Search.Enabled:=Value;
    tbb_Reset.Enabled:=not Value;
    sb_Print.Enabled:=not Value;
  end;
end;

procedure TformDut05.tbb_resetClick(Sender: TObject);
begin
  ADOQuery2.Close;
  EnableControl(true,1);
  SetStatusText('');
end;

procedure TformDut05.rb_addClick(Sender: TObject);
begin
  tntgroupbox2.Enabled := false;
  tcb_date.Enabled := false;
  tcb_id.Enabled := false;
  tcb_dept.Enabled := false;
  tbb_search.Enabled:= false;
  tedt_id.Enabled := true;

  s_hour.Enabled := true;
  e_hour.Enabled := true;
  s_minute.Enabled := true;
  e_minute.Enabled := true;

  with adoquery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select * from hrd_dut_trip where 1<0');
    open;
    append;
    fieldbyname('upd_user').Value := UserName;
  end;
  sb_add.Enabled := true;
  datasource1.OnUpdateData := nil;
end;

procedure TformDut05.tcb_dateClick(Sender: TObject);
begin
  if tcb_date.Checked then
  begin
    date_s1.Enabled := true;
    date_e1.Enabled := true;
  end
  else
  begin
    date_s1.Enabled := false;
    date_e1.Enabled := false;
  end;
  if tcb_id.Checked then
  begin
    id_s1.Enabled := true;
    id_e1.Enabled := true;
  end
  else
  begin
    id_s1.Enabled := false;
    id_e1.Enabled := false;
  end;
  if tcb_dept.Checked then
  begin
    dept_b.Enabled := true;
    dept_e.Enabled := true;
  end
  else
  begin
    dept_b.Enabled := false;
    dept_e.Enabled := false;
  end;

end;

procedure TformDut05.sb_SaveClick(Sender: TObject);
begin
  SaveData;
  SetStatusText(GetLangName(ws_words,'current_location')+' '+inttostr(adoquery2.RecNo)+'/'+inttostr(adoquery2.RecordCount));
end;
procedure TFormDut05.SaveData;
begin
  DMHrdsys.conn.BeginTrans;
  try
    adoquery2.UpdateBatch(arall);
    DMHrdsys.conn.CommitTrans;
    WideShowMessage(GetLangName(ws_Words,'save_success'));
    sb_save.Enabled := false;
    sb_recover.Enabled := false;
  except
    DMHrdsys.conn.RollbackTrans;
    WideShowMessage(GetLangName(ws_Words,'save_fail'));
    Abort;
  end;

end;
procedure TformDut05.sb_RecoverClick(Sender: TObject);
begin
  adoquery2.CancelBatch;
  if (ADOQuery2.RecordCount>0) and PrvArr[DEL] then
    sb_Del.Enabled:=true
  else
    sb_Del.Enabled:=false;
  if (not ADOQuery2.Eof) and PrvArr[UPD] then
    sb_Edit.Enabled:=true
  else
    sb_Edit.Enabled:=false;
  sb_Recover.Enabled:=false;
  sb_Save.Enabled:=false;
end;

procedure TformDut05.sb_AddClick(Sender: TObject);
var
  CurDateTime:TDateTime;
begin
  CurDateTime:=GetServerDateTime;
  with ADOQuery2 do
  begin
    if Active=false then
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM hrd_dut_trip WHERE emp_id=''000000''');
      Open;
    end;
    Append;
    dtp_DateBeg.Date:=DateOf(CurDateTime);
    dtp_DateEnd.Date:=DateOf(CurDateTime);
    PanelFlow.Visible:=true;
    DBNavigator2.Visible:=false;
    bbtn_add.Visible:=true;
  end;
end;

procedure TformDut05.bbtn_OK1Click(Sender: TObject);
var
  CurDateTime:TDateTime;
begin
  if not CheckData then
  begin
    WideShowMessage(GetLangName(ws_Words,'dut05_error1'));
    Abort;
  end;
  CurDateTime:=GetServerDateTime;
  try
    with ADOQuery2 do
    begin
      FieldByName('upd_user').AsString:=UserName;
      FieldByName('upd_date').AsDateTime:=CurDateTime;
      FieldByName('s_trip_d').AsString:=FormatDateTime('yyyy/mm/dd',DateOf(dtp_DateBeg.Date));
      FieldByName('e_trip_d').AsString:=FormatDateTime('yyyy/mm/dd',DateOf(dtp_DateEnd.Date));
      Post;
      PanelFlow.Visible:=false;
    end;
  except
    Abort;
  end;

end;

procedure TformDut05.TntPanel5MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);
end;

procedure TformDut05.ImageClose1Click(Sender: TObject);
begin
  PanelFlow.Visible:=false;
end;

procedure TformDut05.bbtn_CancelClick(Sender: TObject);
begin
  ADOQuery2.Cancel;
  PanelFlow.Visible:=false;
end;

procedure TformDut05.sb_DelClick(Sender: TObject);
begin
  if ADOQuery2.RecordCount>0 then
    ADOQuery2.Delete;
end;

procedure TformDut05.sb_editClick(Sender: TObject);
begin
  if not ADOQuery2.Eof then
  begin
    ADOQuery2.Edit;
    dtp_DateBeg.Date:=ADOQuery2.FieldByName('s_trip_d').AsDateTime;
    dtp_DateEnd.Date:=ADOQuery2.FieldByName('e_trip_d').AsDateTime;
    PanelFlow.Visible:=true;
    DBNavigator2.Visible:=true;
    bbtn_add.Visible:=false;
  end;
end;

procedure TformDut05.ADOQuery2BeforeClose(DataSet: TDataSet);
begin
  if sb_Save.Enabled then
    if WideMessageDlg(GetLangName(ws_Words,'msg_save_modify_data'),mtConfirmation,[mbYes,mbNo],0)=mrYes then
      SaveData;
  sb_Del.Enabled:=false;
  sb_Edit.Enabled:=false;
  sb_Recover.Enabled:=false;
  sb_Save.Enabled:=false;
end;

procedure TformDut05.ADOQuery2AfterOpen(DataSet: TDataSet);
begin
  if (ADOQuery2.RecordCount>0) and PrvArr[DEL] then
    sb_Del.Enabled:=true
  else
    sb_Del.Enabled:=false;
  if (not ADOQuery2.Eof) and PrvArr[UPD] then
    sb_Edit.Enabled:=true
  else
    sb_Edit.Enabled:=false;
  sb_Recover.Enabled:=false;
  sb_Save.Enabled:=false;
end;

procedure TformDut05.ADOQuery2AfterDelete(DataSet: TDataSet);
begin
  if (ADOQuery2.RecordCount>0) and PrvArr[DEL] then
    sb_Del.Enabled:=true
  else
    sb_Del.Enabled:=false;
  if (not ADOQuery2.Eof) and PrvArr[UPD] then
    sb_Edit.Enabled:=true
  else
    sb_Edit.Enabled:=false;
  sb_Recover.Enabled:=true;
  sb_Save.Enabled:=true;
end;

procedure TformDut05.ADOQuery2AfterPost(DataSet: TDataSet);
begin
  if (ADOQuery2.RecordCount>0) and PrvArr[DEL] then
    sb_Del.Enabled:=true
  else
    sb_Del.Enabled:=false;
  if (not ADOQuery2.Eof) and PrvArr[UPD] then
    sb_Edit.Enabled:=true
  else
    sb_Edit.Enabled:=false;
  sb_Recover.Enabled:=true;
  sb_Save.Enabled:=true;
end;

procedure TformDut05.TntSpeedButton1Click(Sender: TObject);
var
  emp_id:string;
begin
   emp_id := FindEmpId('emp_id');
   if emp_id<>'' then
     tedt_id.Text:= emp_id;
end;

procedure TformDut05.ADOQuery2user_nameGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:=GetEmpName(ADOQuery2.FieldByName('emp_id').AsString);
end;

procedure TformDut05.ADOQuery2user_deptGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:=GetEmpDept(ADOQuery2.FieldByName('emp_id').AsString);
end;
procedure TformDut05.bb_resetClick(Sender: TObject);
begin
  try
    AdoQuery1.Close;
    EnableControl(true,2);
  except
    Abort;
  end;
end;

procedure TformDut05.sb_PrintClick(Sender: TObject);
var
  aStr:String;
begin
  aStr:='';
  if tcb_date.Checked then
    aStr:=GetLangName(ws_Words,'trip_date')+':'+FormatDateTime('yyyy/mm/dd',date_s1.DateTime)+
    '--'+FormatDateTime('yyyy/mm/dd',date_e1.DateTime)+'  ';
  if tcb_id.Checked then
    aStr:=aStr+GetLangName(ws_Words,'fld_emp_id')+':'+id_s1.Text+'--'+id_e1.Text+'  ';
  if tcb_dept.Checked then
    aStr:=aStr+'   '+GetLangName(ws_Words,'fld_dept_code')+':'+dept_b.Text+'--'+dept_e.Text;
  showPrint(ADOQuery2,GetLangName(ws_Words,'trip_print')+';;<left>'+aStr);
end;

procedure TformDut05.ADOQuery2CalcFields(DataSet: TDataSet);
var 
  s_trip_d,e_trip_d,Adate:Tdate;
  s_time,e_time,t_time,CurDays:TDateTime;
begin
  with adoquery2 do
  begin
    //Adate:=Fieldbyname('s_trip_d').AsDateTime;
    fieldbyname('s_datetime').AsString:=//formatdatetime('yyyy/mm/dd',Adate)+' '+
                  Fieldbyname('s_trip_h').AsString+':'+Fieldbyname('s_trip_m').AsString;    
    //Adate:=Fieldbyname('e_trip_d').AsDateTime;
    fieldbyname('e_datetime').AsString:=//formatdatetime('yyyy/mm/dd',Adate)+' '+
                  Fieldbyname('e_trip_h').AsString+':'+Fieldbyname('e_trip_m').AsString;
    s_trip_d:=DateOf(FieldByName('s_trip_d').AsDateTime);
    e_trip_d:=DateOf(FieldByName('e_trip_d').AsDateTime);
    s_time:=ShortstrToTime(FieldByName('s_trip_h').AsString+FieldByName('s_trip_m').AsString);
    e_time:=ShortstrToTime(FieldByName('e_trip_h').AsString+FieldByName('e_trip_m').AsString);
    t_time:=e_time-s_time;
    if (s_time<=12/24) and (e_time>=13/24) then
      t_time:=t_time-1/24;
    CurDays:=t_time*3;
    CurDays:=CurDays+e_trip_d-s_trip_d;
    if (DayOfWeek(e_trip_d)<DayOfWeek(s_trip_d)) then
      CurDays:=CurDays-1;
    fieldbyname('tot_hour').AsFloat:=CurDays;
    fieldbyname('tot_hour').AsFloat:=fieldbyname('tot_hour').AsFloat*8;
  end;
end;

procedure TformDut05.s_minute1Change(Sender: TObject);
begin
  if panelflow.Visible and (length(s_minute.Text)=2) then
    e_hour.SetFocus;
end;

procedure TformDut05.e_hour1Change(Sender: TObject);
begin
  if panelflow.Visible and (length(e_hour.Text)=2) then
    e_minute.SetFocus;
end;

procedure TformDut05.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetStatusText('');
end;

procedure TformDut05.ADOQuery2AfterScroll(DataSet: TDataSet);
begin
  SetStatusText(GetLangName(ws_words,'current_location')+' '+inttostr(adoquery2.RecNo)+'/'+inttostr(adoquery2.RecordCount));
end;

procedure TformDut05.s_hour1Change(Sender: TObject);
begin
  if panelflow.Visible and (length(s_hour.Text)=2) then
    s_minute.SetFocus;
end;

procedure TformDut05.sb_FindEmpClick(Sender: TObject);
var
  emp_id:string;
begin
   emp_id := FindEmpId('emp_id');
   if emp_id<>'' then
     tedt_id.Text:= emp_id;
end;

procedure TformDut05.bbtn_addClick(Sender: TObject);
begin
  ADOQuery2.Append;
//  ChangeFlowFlds;
  TEDT_ID.SetFocus;
end;

procedure TformDut05.bbtn_OKClick(Sender: TObject);
begin
  if ADOQuery2.State in [dsedit,dsinsert] then
    ADOQuery2.post;
  ImageClose.OnClick(Sender);
end;

procedure TformDut05.ImageCloseClick(Sender: TObject);
begin
  if ADOQuery2.State in [dsedit,dsinsert] then
  begin
    if wideMessageDlg(GetLangName(ws_Words,'msg_post_record_on_close'),mtConfirmation,[mbyes,mbno],0)=mryes then
    begin
      ADOQuery2.Post;
    end
    else
    begin
      ADOQuery2.Cancel;
    end;
  end;
  PanelFlow.Visible:=false;
end;

procedure TformDut05.PanelFlowTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);
end;

procedure TformDut05.TEDT_IDChange(Sender: TObject);
begin
  if length(Tedt_id.Text)=6 then
  begin
    name.Text:=GetEmpName(Tedt_id.Text);
    dept.Text:=GetEmpDept(Tedt_id.Text);
  end
  else begin
    name.Text:='';
    dept.Text:='';
  end;
end;

procedure TformDut05.ADOQuery2BeforePost(DataSet: TDataSet);
var
  CurDateTime:TDateTime;
  AMonth:string;
begin
  if not CheckData then
  begin
    WideShowMessage(GetLangName(ws_Words,'dut05_error1'));
    Abort;
  end;
  CurDateTime:=GetServerDateTime;
  with ADOQuery2 do
  begin
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=CurDateTime;
    FieldByName('s_trip_d').AsDateTime:=dtp_DateBeg.Date;
    FieldByName('e_trip_d').AsDateTime:=dtp_DateEnd.Date;
 end;
  //該月資料已經鎖定
  AMonth:=FormatDateTime('yyyymm',DataSet.FieldByName('s_trip_d').AsDateTime);
  if (AMonth<=LockMonthPart) and (UserName<>DebugUser) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
    abort;
  end;
end;

procedure TformDut05.s_hourChange(Sender: TObject);
//浮動Panel的輸入框中快捷移動設置(到最大長度時移動)
begin
  if panelflow.Visible and (length(TtntDBEdit(Sender).Text)=2) then
    self.FindNextControl(TwinControl(Sender),true,true,false).SetFocus;
end;

procedure TformDut05.TEDT_IDKeyDown(Sender: TObject; var Key: Word;
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

procedure TformDut05.ADOQuery2BeforeDelete(DataSet: TDataSet);
var
  AMonth:string;
begin
  //該月資料已經鎖定
  AMonth:=FormatDateTime('yyyymm',DataSet.FieldByName('s_trip_d').AsDateTime);
  if (AMonth<=LockMonthPart) and (UserName<>DebugUser) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
    abort;
  end;
end;

end.
