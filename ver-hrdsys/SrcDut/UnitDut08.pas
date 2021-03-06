unit UnitDut08;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,tntDialogs, ExtCtrls,StrUtils, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, TntExtCtrls, TntDBGrids, TntDbCtrls, TntStdCtrls, TntButtons,
  DB, ADODB, DBClient, Provider,DateUtils,WSDLIntf, TntComCtrls, CheckLst,
  TntCheckLst, Menus, TntMenus, ImgList, TntForms;
type
  Tarr=array of array[1..15] of widestring;
type
  TformDut08 = class(TForm)
    TntPanel1: TTntPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    TntPanel2: TTntPanel;
    TntPanel4: TTntPanel;
    TntPanel5: TTntPanel;
    TntPanel8: TTntPanel;
    ADOCommand1: TADOCommand;
    TntPanel3: TTntPanel;
    TntPanel7: TTntPanel;
    TntLabel2: TTntLabel;
    rb_id: TTntRadioButton;
    rb_dept: TTntRadioButton;
    cb_trt: TTntCheckBox;
    dept_s: TTntComboBox;
    dept_e: TTntComboBox;
    s_date: TTntDateTimePicker;
    e_date: TTntDateTimePicker;
    e_time: TMaskEdit;
    TntPanel10: TTntPanel;
    bb_tran: TTntBitBtn;
    TntPanel11: TTntPanel;
    TntDBGrid1: TTntDBGrid;
    TntLabel4: TTntLabel;
    TntLabel5: TTntLabel;
    id_s: TTntEdit;
    id_e: TTntEdit;
    ADOQuery2: TADOQuery;
    s_time: TMaskEdit;
    ADOQuery3: TADOQuery;
    ProgressBar1: TProgressBar;
    ADOQuery4: TADOQuery;
    sb_emp: TTntStatusBar;
    sb_hint: TTntStatusBar;
    sb_recno: TTntStatusBar;
    TntLabel3: TTntLabel;
    att_date: TTntDateTimePicker;
    Tbb_reset: TTntBitBtn;
    BtnQuery: TTntBitBtn;
    ADOQueryInq: TADOQuery;
    ADOQuery1wrk_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1seg_code: TStringField;
    ADOQuery1clas_code: TStringField;
    ADOQuery1s_start: TStringField;
    ADOQuery1s_end: TStringField;
    ADOQuery1real_start: TStringField;
    ADOQuery1real_end: TStringField;
    ADOQuery1wrk_sts: TStringField;
    ADOQuery1late: TStringField;
    ADOQuery1early: TStringField;
    ADOQuery1over_flag: TStringField;
    ADOQuery1notify: TStringField;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQueryInqupd_user: TStringField;
    ADOQueryInqupd_date: TDateTimeField;
    ADOQueryInqwrk_date: TDateTimeField;
    ADOQueryInqemp_id: TStringField;
    ADOQueryInqseg_code: TStringField;
    ADOQueryInqclas_code: TStringField;
    ADOQueryInqs_start: TStringField;
    ADOQueryInqs_end: TStringField;
    ADOQueryInqreal_start: TStringField;
    ADOQueryInqreal_end: TStringField;
    ADOQueryInqwrk_sts: TStringField;
    ADOQueryInqlate: TStringField;
    ADOQueryInqearly: TStringField;
    ADOQueryInqover_flag: TStringField;
    ADOQueryInqnotify: TStringField;
    ADOQueryInqclas_name: TStringField;
    att_date_end: TTntDateTimePicker;
    MemoLog: TMemo;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    BtnClear: TBitBtn;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    chk_ask: TTntCheckBox;
    chk_over: TTntCheckBox;
    chk_stop: TTntCheckBox;
    chk_trip: TTntCheckBox;
    CobDutSts: TTntComboBox;
    procedure InitLangInfo; //語言初始化
    procedure FormInit;     //界面初始化
    function GetEmpSql:string;     //取得sql語句
    procedure FormCreate(Sender: TObject);
    procedure rb_deptClick(Sender: TObject);
    procedure cb_trtClick(Sender: TObject);
    procedure bb_okClick(Sender: TObject);
    procedure Tbb_resetClick(Sender: TObject);
    procedure bb_tranClick(Sender: TObject);
   // procedure DealInformation;
    //提示信息
    procedure hint1;
    //清除該工號改日的考勤信息
    procedure DelAttInfo(const emp:widestring);
    // 從加班檔中讀出該員工的加班時段組成
    procedure GetOvrMst;
    // 從停工檔中讀出該員工的停工時段組成
    procedure GetStpWrk;
    // 尋找請假資料
    procedure GetLeavInfor;
    // 整理出實際排班表
    procedure ReDealData;
    // 檢查時段是否重疊
    function checkperiod(arr:Tarr):boolean;
    //重新整理時段信息 去掉為空的時段
    function retrim(var arr:Tarr):Tarr;
    //得到排班信息
    procedure GetArrangeInfo;
    //查詢刷卡檔
    procedure SrchTrt;
    //查詢公出檔
    function SrchTrp(Adate,Atime:string):boolean;
    //檢查是否刷卡机故障
    function IsTrtConk(Adate,Atime:string):boolean;
    function CheckTrtStation(AEmpId,Station:string):boolean;
    //寫檔
    procedure WrtToDB;
    procedure att_dateChange(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure BtnQueryClick(Sender: TObject);
    procedure ADOQueryInqCalcFields(DataSet: TDataSet);
    procedure BtnClearClick(Sender: TObject);
    procedure id_sChange(Sender: TObject);
    procedure dept_sChange(Sender: TObject);
    //刪除離職日及以後的考勤資料 2015.03.04 Sanjin ADD
    procedure DeleteLeaveUser(AEmpID: string; ADate: TDateTime);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
  //線程
  TRunThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure execute;override;

  public
    { Public declarations }
  end;


const
  TimeHeader = ':00';
  TimeFooter = ':59';
{ seg_code = 0;    // 時段
  clas_code = 1;   // 班別
  s_start = 2;     // 標准上班時間
  s_end =3 ;       // 標准下班時間
  real_start = 4;  // 上班刷卡
  real_end = 5;    // 下班刷卡
  wrk_sts = 6;     // 處理狀態
  late = 7;        // 遲到
  early = 8;       // 早退
  over_flag = 9;   // 超時加班標志
  notify = 10;      // 不處理標志
  start_b = 11;    // 上班刷卡起時
  start_e = 12;    // 上班刷卡止時
  end_b = 13;      // 下班刷卡起時
  end_e =14;       // 下班刷卡止時
 }
var
  formDut08: TformDut08;
  RunThread :TRunThread;

implementation

uses
  UnitDMHrdsys,UnitHrdUtils;
{$R *.dfm}
var
  PrvArr:TPrvArr;
  ws_Words:TWideStrings;
  emp_id:widestring; //工號
  DateStr,TheDate,NextDate:string;
  TheDay,NextDay,B_day,E_day:TDateTime;
  spc_id:widestring; //識別卡號
  dept_code:string;//部門代號
  factory:string;//考勤廠區
  stat:integer;
  mess:widestring;
  SegCount :integer; //時段數
  dataset,ArrangeDs,OvrDs,SpcDs,StpDs,AskDs,tmpDs:Tarr;
  TitleArr : array[1..15] of string;
  AbCount :integer;  //異常紀錄數

{ *********************************
 提示信息函數
 emp : 工號
 state： 處理狀態
*************************************}
procedure SetArrayToNull(Arr:Tarr);
var
  i,j:integer;
begin
  for i:=0 to length(arr)-1 do
  begin
    for j:=1 to 15 do
    begin
      Arr[i,j]:=#0;
    end;
  end;
end;
procedure TformDut08.hint1;
begin
  sb_emp.SimpleText := emp_id;
  case stat of
    0 : sb_hint.SimpleText := mess;
  else
    sb_hint.SimpleText := GetLangName(ws_Words,'dut08_hint'+inttostr(stat));
  end;
end;

procedure TformDut08.InitLangInfo;
var
  ThisFormUsedWords:String;
  i:integer;
begin
  //定義要用到的語言
 ThisFormUsedWords:='save_fail,save_success,'+
    'dut08_titl,dut08_error1,dut08_error2,dut08_tran,'+
    'dut08_error3,dut08_error4,dut08_error5,dut08_error6,'+
    'dut08_hint1,dut08_hint2,dut08_hint3,dut08_hint4,dut08_hint5,'+
    'dut08_success,dut08_abcount,current_location,total,'+
    'dut08_fail,is_confirm_quit,msg_trt_not_finish,msg_month_data_locked,'
    +'dut08_tran_con1,dut08_tran_con2,dut08_tran_con3,dut08_tran_con4,';
 ws_Words:=GetLangWideStrs(ThisFormUsedWords);
 SetComponentLang(self);
end;

procedure TformDut08.FormInit;
begin
  //初始化,取用戶對該畫面擁有的權限
  PrvArr:=GetPrvArr(UserName,'dut08');
  if HaveSpcPrv(UserName,'dut08') then//卡機故障需要特殊權限
    cb_trt.Enabled:=true
  else
    cb_trt.Enabled:=false;
  if not PrvArr[TRAN] then
    bb_tran.Enabled := false;
  GetDeptRange(dept_s);
  GetDeptRange(dept_e);
  dept_e.ItemIndex:=dept_e.Items.Count-1;
  CobDutSts.Items.Clear;
  if LowerCase(UserName)=LowerCase(DebugUser) then
  begin
    CobDutSts.Visible:=true;
    GroupBox2.Visible:=true;
    CobDutSts.Items.Add('1-'+GetLangName(ws_Words,'dut08_tran_con1'));
    CobDutSts.Items.Add('2-'+GetLangName(ws_Words,'dut08_tran_con2'));
    CobDutSts.Items.Add('3-'+GetLangName(ws_Words,'dut08_tran_con3'));
    CobDutSts.Items.Add('4-'+GetLangName(ws_Words,'dut08_tran_con4'));
  end
  else
  begin
    CobDutSts.Items.Add('1-'+GetLangName(ws_Words,'dut08_tran_con1'));
    CobDutSts.Items.Add('2-'+GetLangName(ws_Words,'dut08_tran_con2'));
  end;
  CobDutSts.ItemIndex:=0;
end;

procedure TformDut08.FormCreate(Sender: TObject);
begin
  InitLangInfo;
  FormInit;
  TitleArr[1] := 'seg_code';
  TitleArr[2] := 'clas_code';
  TitleArr[3] := 's_start';
  TitleArr[4] := 's_end';
  TitleArr[5] := 'real_start';
  TitleArr[6] := 'real_end';
  TitleArr[7] := 'wrk_sts';
  TitleArr[8] := 'late';
  TitleArr[9] := 'early';
  TitleArr[10]:= 'over_flag';
  TitleArr[11]:= 'notify';
  TitleArr[12]:= 'start_b';
  TitleArr[13]:= 'start_e';
  TitleArr[14]:= 'end_b';
  TitleArr[15]:= 'end_e';
  att_date.Date := DateOf(date)-2;
  att_date_end.Date := att_date.Date;
end;

procedure TformDut08.rb_deptClick(Sender: TObject);
begin
  if rb_id.Checked then
  begin
    id_s.Enabled := true;
    id_e.Enabled := true;
  end
  else
  begin
    id_s.Enabled := false;
    id_e.Enabled := false;
  end;
  if rb_dept.Checked then
  begin
    dept_s.Enabled := true;
    dept_e.Enabled := true;
    dept_s.ItemIndex :=0;
    dept_e.ItemIndex := dept_e.Items.Count-1;
  end
  else
  begin
    dept_s.Enabled := false;
    dept_e.Enabled := false;
  end;
end;

procedure TformDut08.cb_trtClick(Sender: TObject);
begin
  if cb_trt.Checked then
  begin
    s_date.Enabled := true;
    e_date.Enabled := true;
    s_time.Enabled := true;
    e_time.Enabled := true;
  end
  else
  begin
    s_date.Enabled := false;
    e_date.Enabled := false;
    s_time.Enabled := false;
    e_time.Enabled := false;
  end;
end;

procedure TformDut08.bb_okClick(Sender: TObject);
begin
 { bb_ok.Enabled := false;
  bb_tran.Enabled := true;
  att_date.Enabled := false;
  tntpanel7.Enabled := true;
  rb_id.Enabled := true;
  rb_dept.Enabled := true;
  cb_trt.Enabled := true;  }
end;

procedure TformDut08.Tbb_resetClick(Sender: TObject);
begin
  if (RunThread<>nil) and (not RunThread.Terminated) then
  begin
    try
    RunThread.Suspend;
    except
    end;
    if MessageDlg('您確定要取消?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      try
      RunThread.Resume;
      RunThread.Terminate;
      except
      end;
    end
    else
      try
      RunThread.Resume;
      except
      end;
  end;  
  //adoquery1.Close;   
  adoquery3.Close;
  bb_tran.Enabled:=true;
  if not PrvArr[TRAN] then
    bb_tran.Enabled := false;
  BtnQuery.Enabled:=true;
  att_date.Enabled := true;
 // bb_ok.Enabled := true;
 // bb_tran.Enabled:=false;
  tntpanel7.Enabled := true;
  sb_emp.SimpleText := '';
  sb_hint.SimpleText := '';
  sb_recno.SimpleText :='';
  progressbar1.Position := 0;
  {rb_id.Enabled := false;
  rb_dept.Enabled := false;
  cb_trt.Enabled := false; }
  setStatusText('');
end;

procedure TformDut08.bb_tranClick(Sender: TObject);
var
  sqlstr,B_Dates,E_Dates:string;
  i:integer;
  flag:boolean;
begin
  B_Day:=DateOf(att_date.date);
  E_Day:=DateOf(att_date_end.date);
  TheDay:=DateOf(att_date.date);
  NextDay:=TheDay+1;
  TheDate:=FormatDateTime('yyyy/mm/dd',TheDay);
  NextDate:=FormatDateTime('yyyy/mm/dd',NextDay);
  B_dates:=FormatDateTime('yyyy/mm/dd',B_Day);
  E_dates:=FormatDateTime('yyyy/mm/dd',E_Day);
  //該月資料已經鎖定
  if ((FormatDateTime('yyyymm',B_Day))<=LockMonthPart) and (UserName<>DebugUser) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
    exit;
  end;
  AbCount := 0;
  {sqlstr:='select  top 1 * from hrd_dut_trt where trt_date='''+E_Dates+''' and trt_time>''17:00:00''';
  if not CheckRecordExist(sqlstr) then
  begin//檢查刷卡資料是否存在
    WideShowMessage(GetLangName(ws_Words,'msg_trt_not_finish'));
    Exit;
  end;}
  { 已經刪除
  sqlstr := 'select * from hrd_emp where epindt<='''+E_Dates+''' and (epledt is null or epledt >'''+B_Dates+''')';
  if CobDutSts.ItemIndex=0 then
  begin//已異常沖銷忽略
    if B_Dates=E_Dates then
      sqlstr := sqlstr + ' and emp_id not in (select emp_id from hrd_dut_day where wrk_date>='''+B_Dates+''' and wrk_date<='''+E_Dates+''' and (real_start=''%%%%'' or real_end=''%%%%''))';
  end;
  if CobDutSts.ItemIndex=1 then
  begin//已轉忽略
    if B_Dates=E_Dates then
      sqlstr := sqlstr + ' and emp_id not in (select emp_id from hrd_dut_day where wrk_date>='''+B_Dates+''' and wrk_date<='''+E_Dates+''')';
  end;
  if CobDutSts.ItemIndex=2 then
  begin//只轉異常
    sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_day where wrk_date>='''+B_Dates+''' and wrk_date<='''+E_Dates+''' and wrk_sts=''06'')';
  end;
  if chk_ask.Checked then
  begin//轉請假
    sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_ask where s_ask_d<='''+E_Dates+''' and e_ask_d>='''+B_Dates+''')';
  end;
  if chk_over.Checked then
  begin//轉加班
    sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_ovrmst A,hrd_dut_ovrdtl B where A.batch_no=B.batch_no and over_date<='''+E_Dates+''' and over_date>='''+B_Dates+''')';
  end;
  if chk_stop.Checked then
  begin//轉停工
    sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_stpwrk where stp_date<='''+E_Dates+''' and stp_date>='''+B_Dates+''')';
  end;
  if chk_trip.Checked then
  begin//轉公出
    sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_trip where s_trip_d<='''+E_Dates+''' and e_trip_d>='''+B_Dates+''')';
  end;}
  if rb_id.Checked then
  begin
    if id_s.Text>id_e.Text then
    begin
      widemessagedlg(GetLangName(ws_Words,'dut08_error2'),mtError,[mbOk],0);
      exit;
    end;
    //sqlstr := sqlstr + ' and emp_id>='''+id_s.Text+''' and emp_id<='''+id_e.text+''' and '+UserDeptStr+'';
  end;
  if rb_dept.Checked then
  begin
    if dept_s.Text>dept_e.Text then
    begin
      widemessagedlg(GetLangName(ws_Words,'dut08_error3'),mtError,[mbOk],0);
      exit;
    end;
    //sqlstr := sqlstr + ' and dept_code>='''+leftstr(dept_s.Text,6)+''' and dept_code<='''+leftstr(dept_e.Text,6)+''' ';
  end;
  if cb_trt.Checked then
  begin
    if s_date.Date-e_date.Date >0 then
    begin
      widemessagedlg(GetLangName(ws_Words,'dut08_error4'),mtError,[mbOk],0);
      exit;
    end
    else if s_date.Date=e_date.Date then
    begin
      try
        if strtotime(s_time.Text)-strtotime(e_time.Text)>0 then
        begin
          widemessagedlg(GetLangName(ws_Words,'dut08_error4'),mtError,[mbOk],0);
          exit;
        end
      except
        widemessagedlg(GetLangName(ws_Words,'dut08_error5'),mtError,[mbOk],0);
        exit;
      end;
    end
    else
    begin
      try
        strtotime(s_time.Text);
        strtotime(e_time.Text);
      except
        widemessagedlg(GetLangName(ws_Words,'dut08_error5'),mtError,[mbOk],0);
        exit;
      end;
    end;
  end;
  with adoquery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_dut_day where 1<0');
    open;
  end;
  DataSource1.DataSet:=adoquery1;
  {with adoquery4 do
  begin//hrd_emp
    sql.Clear;
    sql.Add(sqlstr);
  end;}
  tntpanel7.Enabled := false;
  bb_tran.Enabled:=false;
  BtnQuery.Enabled:=false;
  runthread := Trunthread.create(false);

 { bb_tran.Enabled := false;
  rb_id.Enabled := false;
  rb_dept.Enabled := false;
  cb_trt.Enabled := false; }
end;

function TformDut08.GetEmpSql:string;
//返回工號範圍的sql語句
var
  SqlStr:string;
begin
  sqlstr := 'select * from hrd_emp where epindt<='''+TheDate+''' and (epledt is null or epledt >'''+TheDate+''')';
  //按條件轉暫時去掉
  if CobDutSts.Visible then
  begin
    if CobDutSts.ItemIndex=0 then
    begin//已異常沖銷忽略
      //sqlstr := sqlstr + ' and emp_id not in (select emp_id from hrd_dut_day where wrk_date='''+TheDate+''' and (real_start=''%%%%'' or real_end=''%%%%''))';
    end;
    if CobDutSts.ItemIndex=2 then
    begin//已轉忽略
      sqlstr := sqlstr + ' and emp_id not in (select emp_id from hrd_dut_day where wrk_date='''+TheDate+''')';
    end;
    if CobDutSts.ItemIndex=3 then
    begin//只轉異常
      sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_day where wrk_date='''+TheDate+''' and (wrk_sts=''06'' or wrk_sts=''36''))';
    end;
  end;
  if GroupBox2.Visible then
  begin
    if chk_ask.Checked then
    begin//轉請假
      sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_ask where s_ask_d<='''+TheDate+''' and e_ask_d>='''+TheDate+''')';
    end;
    if chk_over.Checked then
    begin//轉加班
      sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_ovrmst A,hrd_dut_ovrdtl B where A.batch_no=B.batch_no and over_date='''+TheDate+''')';
    end;
    if chk_stop.Checked then
    begin//轉停工
      sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_stpwrk where stp_date='''+TheDate+''')';
    end;
    if chk_trip.Checked then
    begin//轉公出
      sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_trip where s_trip_d<='''+TheDate+''' and e_trip_d>='''+TheDate+''')';
    end;
  end;
  if rb_id.Checked then
  begin//按工號
    sqlstr := sqlstr + ' and emp_id>='''+id_s.Text+''' and emp_id<='''+id_e.text+'''  and '+UserDeptStr;
  end;
  if rb_dept.Checked then
  begin//按部門
    sqlstr := sqlstr + ' and dept_code>='''+leftstr(dept_s.Text,6)+''' and dept_code<='''+leftstr(dept_e.Text,6)+''' ';
  end;

  sqlstr := sqlstr + ' and '+G_sFactorySql ; //2012-09-07 hyt add

  result:=sqlstr;
end;

{ *********************************
 清除該工號的考勤信息函數
 emp : 工號
*************************************}
procedure TformDut08.DelAttInfo(const emp:widestring);
var
  atext:TextFile;
  Asql:string;
  i:integer;
  ab_flag:boolean;
begin
  Asql:='delete from hrd_dut_day where wrk_date='''+TheDate+''' and emp_id='''+emp+'''';
  //if CobDutSts.ItemIndex=0 then//沖銷過的忽略
  if CobDutSts.Visible then
    if CobDutSts.ItemIndex=0 then//沖銷過的忽略
    begin
    ab_flag:=false;
    for i:=0 to length(Dataset)-1 do
      if Dataset[i,7]='06' then
      begin//有異常才判斷
        ab_flag:=true;
        break;
      end;
    if ab_flag then
      Asql:=Asql+' and (real_start is null or real_end is null or (real_start<>''%%%%'' and real_end<>''%%%%''))';
    end;
  adoCommand1.commandtext := Asql;
  stat := 1;
  mess :='';
  hint1; //提示信息
  adoCommand1.execute;
end;
{ ***********************************************
整理出實際排班表,取得上班時段總數SegCount
emp : 工號
attdate:日期
寫資料 WrkSeg SegCount      (const emp:widestring;const attdate:string)
*************************************************}
procedure TformDut08.GetArrangeInfo;
var
  sqlstr:string;
  i,j,k:integer;
  SegCode:string;
  tmsStr:string;
  IsHoliday:boolean;
  emp:string;
  attdate:string;
begin
  emp:=emp_id;
  attdate:=datestr;
  stat := 2 ;
  hint1; //提示信息
  with adoquery3 do
  begin
    sql.clear;
    sqlstr := 'select * from hrd_dut_tms where emp_id='''+emp+
      ''' and tms_mon='''+leftstr(attdate,6)+''' and day'+rightstr(attdate,2)+'_tms<>''''';
    sql.Add(sqlstr);
    open;
    if eof then
    begin
      IsHoliday:=false;
      if DayOfWeek(TheDay)=1 then
        IsHoliday:=True
      else
      begin
        adoquery2.SQL.Clear;
        adoquery2.SQL.Add('select * from hrd_dut_holiday where hol_date='''+TheDate+'''');
        adoquery2.Open;
        if not adoquery2.Eof then
          IsHoliday:=True;
        adoquery2.Close;
      end;

      if IsHoliday then
        SqlStr:='select tms_holiday from hrd_dut_tms_tpl where dept_code='''+GetEmpInfo(Emp).FieldByName('dept_code').AsString+''''
      else
        SqlStr:='select tms_work_day from hrd_dut_tms_tpl where dept_code='''+GetEmpInfo(Emp).FieldByName('dept_code').AsString+'''';
      adoquery2.SQL.Clear;
      adoquery2.SQL.Add(SqlStr);
      adoquery2.Open;
      if adoquery2.eof then
      tmsStr:=''
      else
      tmsStr:=Trim(Adoquery2.Fields[0].AsString);
      {result := 1;
      exit;}
    end
    else
      tmsStr:=trim(fieldbyname('day'+rightstr(attdate,2)+'_tms').AsString);

    {SetArrayToNull(dataset);
    SetArrayToNull(ArrangeDs);
    SetArrayToNull(ovrDs);
    SetArrayToNull(SpcDs);
    SetArrayToNull(StpDs);
    SetArrayToNull(tmpDs); }
    setlength(dataset,0);
    setlength(ArrangeDs,0);
    setlength(ovrDs,0);
    setlength(SpcDs,0);
    setlength(StpDs,0);
    setlength(tmpDs,0);

    SegCount := length(tmsStr) div 2;
    setlength(ArrangeDs,segCount);
    for i:=0 to SegCount-1 do
    begin
       SegCode := midstr(tmsStr,i*2+1,2);
       adoquery2.SQL.Clear;
       adoquery2.SQL.Add('select seg_code,clas_code,s_start,s_end,start_b,start_e,end_b,end_e '+
         ' from hrd_dut_seg where seg_code='''+SegCode+'''');
       adoquery2.open;
       for j:= 1 to 15 do
       begin
         if  adoquery2.FindField(TitleArr[j])<>nil then
         begin
           ArrangeDs[i,j] := adoquery2.FieldByName(TitleArr[j]).AsString;
           if (i>0) and (j=2) and AnsiContainsStr('61|62|63',ArrangeDs[i,j]) then
           begin//61|62|63班別只能有一個
             for k:=0 to i do
             begin
               if AnsiContainsStr('61|62|63',ArrangeDs[k,j]) then
               begin
                 ArrangeDs[i,j]:=ArrangeDs[k,j];
                 break;
               end;//end if
             end;//end for
           end;//end if 61|62|63班別只能有一個
         end;//end if
       end;//end for
       adoquery2.close;
    end;
    // 檢查該員工排班的時段是否重疊
    if not checkperiod(ArrangeDs) then
    begin
     // result := 1;
      exit;
    end;
    // 從加班檔中讀出該員工的加班時段組成
    GetOvrMst;

    //2014.12.02
    //if tmsStr<>'90' then
    begin//公休無停工請假(2006/10/03 anil modify )
      // 從停工檔中讀出該員工的停工時段組成
      GetStpWrk;
      // 尋找請假資料
      GetLeavInfor;
    end;
    
    // 整理出實際時段表
    ReDealData;

  end;
  //result := 0;
end;

// 檢查時段是否重疊
function TformDut08.checkperiod(arr:Tarr):boolean;
var
  i,j:integer;
begin
 { for i:=0 to length(arr)-2 do
  begin
    for j:=i+1 to length(arr)-1 do
    begin
      if AnsiContainsStr('08|09|10|11|12|13|14|15|16|20|21|25|44|54|60|64',Arr[j,2]) or AnsiContainsStr('08|09|10|11|12|13|14|15|16|20|21|25|44|54|60|64',Arr[i,2]) then
        continue;
      if (Arr[j,3]>Arr[i,3]) and (Arr[j,3]<Arr[i,4]) then
      begin
        result := false;
        exit;
      end;
      if (Arr[j,4]>Arr[i,3]) and (Arr[j,4]<Arr[i,4]) then
      begin
        result := false;
        exit;
      end;
    end;
  end;    }
  result := true;
end;

// 從加班檔中讀出該員工的加班時段組成
procedure TformDut08.GetOvrMst;
var
  i,j:integer;
  sqlstr:string;
begin
  with adoquery2 do
  begin
    sql.Clear;
    sqlstr:='select a.*,d.* '+
      'from hrd_dut_ovrmst a,hrd_dut_ovrdtl c,hrd_dut_seg d where'+
//      ' c.emp_id='''+emp_id+''' and a.dept_code='''+dept_code+''' and '+
      ' c.emp_id='''+emp_id+''' and '+
      'a.over_date='''+TheDate+
      ''' and a.batch_no=c.batch_no and  a.seg_code=d.seg_code ';
    sql.Add(sqlstr);
    open;
    setlength(ovrDs,recordcount);
    if eof then
      exit;
    i:=0;
    while not eof do
    begin
      for j:= 1 to 15 do
      begin
        if adoquery2.FindField(TitleArr[j])<>nil then
          OvrDs[i,j] := adoquery2.FieldByName(TitleArr[j]).Asstring
      end;
      next;
      i := i+1;
    end;

    {超時加班處理,修改班別,標准上班時間,上班刷卡,下班刷卡時間}

    // 檢查該員工加班与排班的時段是否重疊
    if adoquery2.RecordCount>0 then
    begin
      for i := 0  to adoquery2.RecordCount-1 do
      begin
        for j := 0 to length(ArrangeDs)-1 do
        begin
          if ArrangeDs[j,1]='90' then
            continue;
          if (OvrDs[i,3]>ArrangeDs[j,3]) and (OvrDs[i,3]<ArrangeDs[j,4]) then
          begin
             OvrDs[i,1] := '';
             break;
          end;
          if (OvrDs[i,4]>ArrangeDs[j,3]) and (OvrDs[i,4]<ArrangeDs[j,4]) then
          begin
             OvrDs[i,1] := '';
             break;
          end;
        end;
      end;
      retrim(OvrDs);
    end;
  end;
end;

// 從停工檔中讀出該員工的停工時段組成
procedure TformDut08.GetStpWrk;
var
  sqlstr,WrkSegs: string;
  i,j,k,ADsLen:integer;
begin
  with adoquery2 do
  begin
    sqlstr := 'select wrk_segs from hrd_dut_stpwrk where emp_id='''+emp_id+
      ''' and stp_date='''+TheDate+''' ';
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if eof then
      exit
    else
    begin
      WrkSegs := trim(fieldbyname('wrk_segs').AsString);
      close;
      setLength(stpDs,length(WrkSegs) div 2);
      for i:=0 to (length(wrkSegs) div 2)-1 do
      begin
        sqlstr:='select * from hrd_dut_seg where seg_code='''+midstr(WrkSegs,i*2+1,2)+'''';
        sql.Clear;
        sql.Add(sqlstr);
        open;
        for j:= 1 to 15 do
        begin
          if adoquery2.FindField(TitleArr[j])<>nil then
            StpDs[i,j] := adoquery2.FieldByName(TitleArr[j]).AsString;
        end;
      end;
      ADsLen:=length(ArrangeDs);
      for i:=0 to length(stpDs)-1 do
      begin
        for j:=0 to ADsLen-1 do
        begin
          //上班時段在停工時段�� 修改上班時段
          if (StpDs[i,3]<=ArrangeDs[j,3]) and (StpDs[i,4]>=ArrangeDs[j,4]) then
          begin
            ArrangeDs[j,7] := ArrangeDs[j,2];
            ArrangeDs[j,2]:= StpDs[i,2];
            ArrangeDs[j,12]:= '****';
            ArrangeDs[j,13]:= '****';
            ArrangeDs[j,14]:= '****';
            ArrangeDs[j,15]:= '****';
          end  //停工時段起在上班時段�� 停工時段止在上班時段外 修改下班標準時閒,新增停工時段
          else if (StpDs[i,3]>ArrangeDs[j,3]) and (StpDs[i,3]<ArrangeDs[j,4]) and  (StpDs[i,4]>=ArrangeDs[j,4])  then
          begin
            //新增停工時段
            setlength(ArrangeDs,length(ArrangeDs)+1);
            ArrangeDs[length(ArrangeDs)-1]:=StpDs[i];
            if ArrangeDs[length(ArrangeDs)-1,4]>ArrangeDs[j,4] then
              ArrangeDs[length(ArrangeDs)-1,4]:=ArrangeDs[j,4];
            //修改下班時間
            ArrangeDs[j,4]:=StpDs[i,3];
            ArrangeDs[j,14]:= '****';
            ArrangeDs[j,15]:= '****';
          end  //停工時段起在上班時段外 停工時段止在上班時段��  修改上班標準時閒,新增停工時段
          else if (StpDs[i,3]<=ArrangeDs[j,3]) and (StpDs[i,4]>ArrangeDs[j,3]) and  (StpDs[i,4]<ArrangeDs[j,4])  then
          begin
            //新增停工時段
            setlength(ArrangeDs,length(ArrangeDs)+1);
            ArrangeDs[length(ArrangeDs)-1]:=StpDs[i];
            if ArrangeDs[length(ArrangeDs)-1,3]>ArrangeDs[j,3] then
              ArrangeDs[length(ArrangeDs)-1,3]:=ArrangeDs[j,3];
            //修改上班時間
            ArrangeDs[j,3]:=StpDs[i,4];
            ArrangeDs[j,12]:= '****';
            ArrangeDs[j,13]:= '****';
          end //停工時段在上班時段�� 增加停工，上班時段，修改下班時間
          else if (StpDs[i,3]>ArrangeDs[j,3]) and (StpDs[i,4]<ArrangeDs[j,4]) then
          begin
            setlength(ArrangeDs,length(ArrangeDs)+2);
            k:=length(ArrangeDs)-2;//新增停工時段
            ArrangeDs[k]:=StpDs[i];
            k:=length(ArrangeDs)-1;//新增上班時段
            ArrangeDs[k,1]:= '@@';
            ArrangeDs[k,2]:= ArrangeDs[j,2];
            ArrangeDs[k,3]:= ArrangeDs[k-1,4];
            ArrangeDs[k,4]:= ArrangeDs[j,4];
            ArrangeDs[k,12]:= '****';
            ArrangeDs[k,13]:= '****';
            ArrangeDs[k,14]:= ArrangeDs[j,14];
            ArrangeDs[k,15]:= ArrangeDs[j,15];
            //修改下班時間
            ArrangeDs[j,4]:=StpDs[i,3];
            ArrangeDs[j,14]:= '****';
            ArrangeDs[j,15]:= '****';
            {tmpds := StpDs;
            setlength(ArrangeDs,length(tmpDs)+1);
            for k:=0 to length(tmpDs)-1 do
            begin
              ArrangeDs[k]:=tmpDs[k];
            end;
            ArrangeDs[k]:=tmpDs[j];
            ArrangeDs[j,4]:= StpDs[i,3];
            ArrangeDs[j,14]:= '****';
            ArrangeDs[j,15]:= '****';
            ArrangeDs[k,3]:= StpDs[i,4];
            ArrangeDs[k,12]:= '****';
            ArrangeDs[k,13]:= '****';}
          end;
        end;
      end;
    end;
  end;
end;

// 尋找請假資料
procedure TformDut08.GetLeavInfor;
var
  sqlstr,MinSHour,MaxEHour: string;
  i,j,k,ADsLen:integer;
begin
  with adoquery2 do
  begin
    sqlstr:='select * from hrd_dut_ask '+
      'where emp_id='''+emp_id+''' and s_ask_d-'''+TheDate+
      '''<=0 and e_ask_d-'''+TheDate+'''>=0 ';
    sql.Clear;
    sql.Add(sqlstr);
    open;
    setlength(askDs,RecordCount);
    i:=0;
    while not eof do
    begin
      askDs[i,1] := '@@';
      askDs[i,2] := fieldbyname('clas_code').AsString;
      if fieldbyname('s_ask_d').Value-TheDay<0 then
      begin
        askDs[i,3]:='0000';
      end
      else
      begin
        askDs[i,3]:=format('%.2d%.2d',[strtoint(fieldbyname('s_ask_h').value),strtoint(fieldbyname('s_ask_t').value)]);
      end;
      if fieldbyname('e_ask_d').Value-TheDay>1 then
      begin
        askDs[i,4]:='3600';
      end
      else if fieldbyname('e_ask_d').Value-TheDay=1 then
      begin
        askDs[i,4]:=format('%.2d%.2d',[strtoint(fieldbyname('e_ask_h').value)+24,strtoint(fieldbyname('e_ask_t').value)]);
      end
      else
      begin
        askDs[i,4]:=format('%.2d%.2d',[strtoint(fieldbyname('e_ask_h').value),strtoint(fieldbyname('e_ask_t').value)]);
      end;
      i := i + 1 ;
      next;
    end;
  end;
  ADsLen:=length(ArrangeDs);
  //修正請假時間起止在上班時間範圍內(2006/10/03 anil modify )
  MinSHour:='3600';
  MaxEHour:='0000';
  for j:=0 to ADsLen-1 do
  begin
    if MinSHour>ArrangeDs[j,3] then
      MinSHour:=ArrangeDs[j,3];
    if MaxEHour<ArrangeDs[j,4] then
      MaxEHour:=ArrangeDs[j,4];
  end;
  for i:=0 to length(AskDs)-1 do
  begin
    if (MinSHour>AskDs[i,3]) and (MinSHour<>'3600') then
      AskDs[i,3]:=MinSHour;//上班起始時間
    if (MaxEHour<AskDs[i,4]) and (MaxEHour<>'0000') then
      AskDs[i,4]:=MaxEHour;//下班終止時間
  end;
  //修正排班資料
  for i:=0 to length(AskDs)-1 do
  begin
    for j:=0 to ADsLen-1 do
    begin
      //上班時段在請假時段�� 修改上班時段(刷卡時間及班別),排除公休
      if (AskDs[i,3]<=ArrangeDs[j,3]) and (AskDs[i,4]>=ArrangeDs[j,4]) then
      begin
        if ArrangeDs[j,2] <> '60' then
        begin
          ArrangeDs[j,2]:= AskDs[i,2];
          ArrangeDs[j,12]:= '****';
          ArrangeDs[j,13]:= '****';
          ArrangeDs[j,14]:= '****';
          ArrangeDs[j,15]:= '****';
        end;
      end  //請假時段起在上班時段�� 請假時段止在上班時段外 修改下班標準時閒，新增請假時段
      else if (AskDs[i,3]>ArrangeDs[j,3]) and (AskDs[i,3]<ArrangeDs[j,4]) and  (AskDs[i,4]>=ArrangeDs[j,4])  then
      begin
        //新增請假時段
        setlength(ArrangeDs,length(ArrangeDs)+1);
        ArrangeDs[length(ArrangeDs)-1]:=AskDs[i];
        if ArrangeDs[length(ArrangeDs)-1,4]>ArrangeDs[j,4] then
          ArrangeDs[length(ArrangeDs)-1,4]:=ArrangeDs[j,4];
        //修改下班時間
        ArrangeDs[j,4]:=AskDs[i,3];
        ArrangeDs[j,14]:= '****';
        ArrangeDs[j,15]:= '****';
      end  //請假時段起在上班時段外 請假時段止在上班時段��  修改上班標準時閒，新增請假時段
      else if (AskDs[i,3]<=ArrangeDs[j,3]) and (AskDs[i,4]>ArrangeDs[j,3]) and  (AskDs[i,4]<ArrangeDs[j,4])  then
      begin
        //新增請假時段
        //ArrangeDs[j,3]:=AskDs[i,4];
        setlength(ArrangeDs,length(ArrangeDs)+1);
        ArrangeDs[length(ArrangeDs)-1]:=AskDs[i];
        if ArrangeDs[length(ArrangeDs)-1,3]<ArrangeDs[j,3] then
          ArrangeDs[length(ArrangeDs)-1,3]:=ArrangeDs[j,3];//修改請假起時間
        //修改上班時間
        ArrangeDs[j,3]:=AskDs[i,4];
        ArrangeDs[j,12]:= '****';
        ArrangeDs[j,13]:= '****';
      end //請假時段在上班時段�� 增加請假，上班時段，修改下班時間
      else if (AskDs[i,3]>ArrangeDs[j,3]) and (AskDs[i,4]<ArrangeDs[j,4]) then
      begin
        //tmpds := AskDs;
        setlength(ArrangeDs,length(ArrangeDs)+2);
        k:=length(ArrangeDs)-2;//新增請假時段
        ArrangeDs[k]:=AskDs[i];
        k:=length(ArrangeDs)-1;//新增上班時段
        ArrangeDs[k,1]:= '@@';
        ArrangeDs[k,2]:= ArrangeDs[j,2];
        ArrangeDs[k,3]:= ArrangeDs[k-1,4];
        ArrangeDs[k,4]:= ArrangeDs[j,4];
        ArrangeDs[k,12]:= '****';
        ArrangeDs[k,13]:= '****';
        ArrangeDs[k,14]:= ArrangeDs[j,14];
        ArrangeDs[k,15]:= ArrangeDs[j,15];
        //修改上班時間
        ArrangeDs[j,4]:=AskDs[i,3];
        ArrangeDs[j,14]:= '****';
        ArrangeDs[j,15]:= '****';
      end;
    end;
  end;
end;

// 整理出實際排班表
procedure TformDut08.ReDealData;
var
  i:integer;
begin
  retrim(ArrangeDs);
  retrim(OvrDs);
  setLength(Dataset,length(ArrangeDs)+length(OvrDs));
  for i:=0 to length(ArrangeDs)+length(OvrDs)-1 do
  begin
    if i< length(ArrangeDs) then
      Dataset[i] := ArrangeDs[i]
    else
      Dataset[i] := OvrDs[i-length(ArrangeDs)];
  end;
  retrim(dataset);
  for i:=0 to length(Dataset)-2 do //上個時段刷卡止 〉= 下個時段刷卡起  就不刷卡了
  begin
    if   ((trim(Dataset[i+1,12])='') or (Dataset[i,15]>=Dataset[i+1,12]))  then
    begin
      Dataset[i,14] :='****';
      Dataset[i,14] :='****';
      Dataset[i+1,12] :='****';
      Dataset[i+1,13] :='****';
    end;
  end;
end;

//重新整理時段信息 去掉為空的時段
function Tformdut08.retrim(var arr:Tarr):Tarr;
var
  tmparray:Tarr;
  arrcount,i,j,k,m:integer;
begin
  m:=length(arr);
  setlength(tmparray,m);
  tmparray := arr;
  arrcount := 0;
  for i:= 0 to m-1 do
  begin
    if (trim(tmparray[i,1])<>'') and (tmparray[i,3]<tmparray[i,4])  then
      arrcount := arrcount+1;
  end;
  if arrcount<>m then
  begin
    arr := nil;
    setlength(arr,arrcount);
    j:=0;
    for i:= 0 to length(tmparray)-1 do
    begin
      if (tmparray[i,1]<>'') and (tmparray[i,3]<tmparray[i,4]) then
      begin
        arr[j]:=tmparray[i];
        j:=j+1;
      end;
    end;
  end;
  for i:=0 to m-2 do
  begin
    k:= m-i-2;
    for j:= 0 to k do
    begin
      if arr[j,3]>arr[j+1,3] then
      begin
        setLength(tmpDs,1);
        tmpDs[0] := arr[j];
        arr[j]:= arr[j+1];
        arr[j+1] := tmpDs[0];
      end;
    end;
  end;
  result := arr;
end;

procedure Tformdut08.SrchTrt;
var
  sqlstr,sql_pre:string;
  i:integer;
begin
  sql_pre:='select * from hrd_dut_trt where spc_id='''+spc_id+'''';
  {  //鎖定刷卡机位置
  sqlstr:='select * from hrd_dut_trt_station A,hrd_dut_trt_dept B where A.location=B.location'
    +' and (B.dept_code='''+dept_code+''' or B.dept_code='''+emp_id+''')';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if not Eof then//已經存在刷卡機位置資料
      sql_pre:=sql_pre+' and trt_station in (select machine from hrd_dut_trt_station'
        +' where location='''+FieldByName('location').AsString+''') ';
  end;}
    {//+' and trt_station in (select machine from hrd_dut_trt_station A,hrd_dut_trt_dept B,hrd_emp C'
    //+' where C.spc_id='''+spc_id+''' and A.location=B.location and B.dept_code=C.dept_code) ';}
  with adoquery2 do
  begin
    for i:= 0 to length(Dataset)-1 do
    begin
      //上班刷卡
      if (trim(Dataset[i,12])<>'') and (trim(Dataset[i,12])<>'****') then
      begin
        if Dataset[i,12]>='2400' then
        begin//24點后刷卡
          sqlstr:=sql_pre+' and trt_date='''+NextDate+''' and trt_time>='''+
            format('%.2d',[strtoint(leftstr(Dataset[i,12],2))-24])+':'+rightstr(Dataset[i,12],2)+TimeHeader+''' and trt_time<='''+
            format('%.2d',[strtoint(leftstr(Dataset[i,13],2))-24])+':'+rightstr(Dataset[i,13],2)+TimeFooter+''' ';
          sql.Clear;
          sql.Add(sqlstr);
          open;
          if not eof then
          begin//正常刷卡
            last;
            if not CheckTrtStation(emp_id,FieldByName('trt_station').AsString) then
            begin
              Dataset[i,7]:= '36';//未按機台刷卡
              AbCount := AbCount + 1;
            end;
            Dataset[i,5]:=inttostr(strtoint(formatdatetime('hh',fieldbyname('trt_time').AsDateTime))+24)+formatdatetime('nn',fieldbyname('trt_time').AsDateTime);
          end
          else
          begin
            sqlstr:=sql_pre+' and trt_date='''+NextDate+''' and trt_time>='''+
              format('%.2d',[strtoint(leftstr(Dataset[i,12],2))-24])+':'+rightstr(Dataset[i,12],2)+TimeHeader+''' and trt_time<='''+
              format('%.2d:%.2d',[strtoint(leftstr(Dataset[i,13],2))-23,strtoint(rightstr(Dataset[i,13],2))])+TimeFooter+''' ';
            sql.Clear;
            sql.Add(sqlstr);
            open;
            if eof then
            begin
              {若無刷卡資料則尋找公出資料}
              if SrchTrp(datetostr(NextDay),inttostr(strtoint(Dataset[i,3])-2400)) then
              begin
                Dataset[i,5]:='####';
              end {察看是否刷卡机故障}
              else if IsTrtConk(datetostr(NextDay),inttostr(strtoint(Dataset[i,3])-2400)) then
              begin
                Dataset[i,5]:='%%%%';
              end
              else
              begin
                Dataset[i,7]:= '06'; //未刷卡
                AbCount := AbCount + 1;
              end;
            end
            else
            begin
              last;
              Dataset[i,8]:= '04'; //遲到
              Dataset[i,5]:= inttostr(strtoint(formatdatetime('hh',fieldbyname('trt_time').AsDateTime))+24)+formatdatetime('nn',fieldbyname('trt_time').AsDateTime);
            end;
          end;
        end
        else
        begin//24點前上班刷卡
          sqlstr:=sql_pre+' and trt_date='''+TheDate+''' and trt_time>='''+
            leftstr(Dataset[i,12],2)+':'+rightstr(Dataset[i,12],2)+TimeHeader+''' and trt_time<='''+
            format('%.2d:%.2d',[strtoint(leftstr(Dataset[i,13],2)),strtoint(rightstr(Dataset[i,13],2))])+TimeFooter+''' ';
          sql.Clear;
          sql.Add(sqlstr);
          open;
          if not eof then
          begin//正常刷卡
            last;
          //////////////////////
            if not CheckTrtStation(emp_id,FieldByName('trt_station').AsString) then
            begin
              Dataset[i,7]:= '36';//未按機台刷卡
              AbCount := AbCount + 1;
            end;
            ///////////////
            Dataset[i,5]:=formatdatetime('hhnn',fieldbyname('trt_time').AsDateTime);
          end
          else
          begin
              sqlstr:=sql_pre+' and trt_date='''+TheDate+''' and trt_time>='''+
              leftstr(Dataset[i,12],2)+':'+rightstr(Dataset[i,12],2)+TimeHeader+''' and trt_time<='''+
              format('%.2d:%.2d',[strtoint(leftstr(Dataset[i,13],2))+1,strtoint(rightstr(Dataset[i,13],2))])+TimeFooter+''' ';
            sql.Clear;
            sql.Add(sqlstr);
            open;
            if eof then
            begin
              {若無刷卡資料則尋找公出資料}
              if SrchTrp(datetostr(TheDay),Dataset[i,3]) then
              begin
                Dataset[i,5]:='####';
              end {察看是否刷卡机故障}
              else if IsTrtConk(datetostr(TheDay),Dataset[i,3]) then
              begin
                Dataset[i,5]:='%%%%';
              end
              else
              begin
                Dataset[i,7]:= '06'; //未刷卡
                AbCount := AbCount + 1;
              end;
            end
            else
            begin
              last;
              Dataset[i,8]:= '04'; //遲到
              Dataset[i,5]:= formatdatetime('hhnn',fieldbyname('trt_time').AsDateTime);
            end;
          end;
        end;
      end
      else
      begin
        Dataset[i,5]:='****';//不用刷卡
      end;

      //下班刷卡
      if (trim(Dataset[i,14])<>'') and (trim(Dataset[i,14])<>'****') then
      begin
        if Dataset[i,14]>='2400' then
        begin//24點后下班刷卡
          sqlstr:=sql_pre+' and trt_date='''+NextDate+''' and trt_time>='''+
            format('%.2d',[(strtoint(leftstr(Dataset[i,14],2))-24)])+':'+rightstr(Dataset[i,14],2)+TimeHeader+''' and trt_time<='''+
            format('%.2d',[(strtoint(leftstr(Dataset[i,15],2))-24)])+':'+rightstr(Dataset[i,15],2)+TimeFooter+'''';
          sql.Clear;
          sql.Add(sqlstr);
          open;
          if eof then
          begin
            sqlstr:=sql_pre+' and trt_date='''+NextDate+''' and trt_time>='''+
              format('%.2d:%.2d',[strtoint(leftstr(Dataset[i,14],2))-25,strtoint(rightstr(Dataset[i,14],2))])+TimeHeader+''' and trt_time<='''+
              format('%.2d',[strtoint(leftstr(Dataset[i,15],2))-24])+':'+rightstr(Dataset[i,15],2)+TimeFooter+''' ';
            sql.Clear;
            sql.Add(sqlstr);
            open;
            if eof then//無刷卡資料
            begin
              {若無刷卡資料則尋找公出資料}
              if SrchTrp(datetostr(NextDay),inttostr(strtoint(Dataset[i,4])-2400)) then
              begin
                Dataset[i,6]:='####';
              end {察看是否刷卡机故障}
              else if IsTrtConk(datetostr(NextDay),inttostr(strtoint(Dataset[i,4])-2400)) then
              begin
                Dataset[i,6]:='%%%%';
              end
              else
              begin
                Dataset[i,7]:= '06'; //未刷卡
                AbCount := AbCount + 1;
              end;
            end
            else
            begin
              last;
              Dataset[i,9]:= '05'; //早退
              Dataset[i,6]:= inttostr(strtoint(formatdatetime('hh',fieldbyname('trt_time').AsDateTime))+24)+formatdatetime('nn',fieldbyname('trt_time').AsDateTime);
            end;
          end
          else
          begin//正常刷卡
            last;
            if not CheckTrtStation(emp_id,FieldByName('trt_station').AsString) then
            begin
              Dataset[i,7]:= '36';//未按機台刷卡
              AbCount := AbCount + 1;
            end;
            Dataset[i,6]:= inttostr(strtoint(formatdatetime('hh',fieldbyname('trt_time').AsDateTime))+24)+formatdatetime('nn',fieldbyname('trt_time').AsDateTime);
          end;
        end
        else  //在當天刷卡
        begin//24點前下班刷卡
          sqlstr:=sql_pre+' and trt_date='''+TheDate+''' and trt_time>='''+
            leftstr(Dataset[i,14],2)+':'+rightstr(Dataset[i,14],2)+TimeHeader+''' and trt_time<='''+
            leftstr(Dataset[i,15],2)+':'+rightstr(Dataset[i,15],2)+TimeFooter+''' ';
          sql.Clear;
          sql.Add(sqlstr);
          open;
          if not eof then
          begin//正常刷卡
             last;
             // 2011.06.09 <<
             if not CheckTrtStation(emp_id,FieldByName('trt_station').AsString) then
             begin
               Dataset[i,7]:= '36';//未按機台刷卡
               AbCount := AbCount + 1;
             end;
            //2011.06.09 >>
            Dataset[i,6] := formatdatetime('hhnn',fieldbyname('trt_time').AsDateTime);
          end
          else
          begin
            sqlstr:=sql_pre+' and trt_date='''+TheDate+''' and trt_time>='''+
              format('%.2d:%.2d',[strtoint(leftstr(Dataset[i,14],2))-1,strtoint(rightstr(Dataset[i,14],2))])+TimeHeader+''' and trt_time<='''+
              leftstr(Dataset[i,15],2)+':'+rightstr(Dataset[i,15],2)+TimeFooter+''' ';
            sql.Clear;
            sql.Add(sqlstr);
            open;
            if eof then
            begin
              {若無刷卡資料則尋找公出資料}
              if SrchTrp(datetostr(TheDay),Dataset[i,4]) then
              begin
                Dataset[i,6]:='####';
              end {察看是否刷卡机故障}
              else if IsTrtConk(datetostr(TheDay),Dataset[i,4]) then
              begin
                Dataset[i,6]:='%%%%';
              end
              else
              begin
                Dataset[i,7]:= '06'; //未刷卡
                AbCount := AbCount + 1;
              end;
            end
            else
            begin
              last;
              Dataset[i,9] := '05'; //早退
              Dataset[i,6] := formatdatetime('hhnn',fieldbyname('trt_time').AsDateTime);
            end;
          end;
        end;
      end
      else
      begin
        Dataset[i,6]:='****';//不用刷卡
      end;
    end;
  end;
end;


{檢查是否刷卡机故障}
function Tformdut08.IsTrtConk(Adate,Atime:string):boolean;
var
  s_t,e_t:string;
begin
  if not cb_trt.Checked then
  begin
    result := false;
    exit;
  end;
  if DateOf(s_date.Date)-DateOf(strtodate(Adate))<0 then
    s_t := '0000'
  else
    s_t := formatdatetime('hhnn',strtotime(s_time.Text));
  if DateOf(e_date.Date)-DateOf(strtodate(Adate))>0 then
        e_t := '2400'
  else
    e_t := formatdatetime('hhnn',strtotime(e_time.Text));
  if (Atime>=s_t) and (Atime<=e_t) then
    result := true
  else
    result := false;
end;

//檢查是否公出（可一天多次）
function Tformdut08.SrchTrp(Adate,Atime:string):boolean;
var
  sqlstr:string;
  s_t,e_t,DateStr:string;
begin
  DateStr:=formatdatetime('yyyy/mm/dd',strtodate(Adate));
  with adoquery3 do
  begin
    sqlstr := 'select * from hrd_dut_trip where emp_id='''+emp_id+''''
      +' and e_trip_d>='''+DateStr+''' and s_trip_d<='''+DateStr+'''';
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if eof then
    begin
      result := false;
      exit;
    end;
    while not eof do
    begin
      if fieldbyname('s_trip_d').value-strtodate(Adate)<0 then
        s_t := '0000'
      else
        s_t := format('%.2d%.2d',[strtoint(fieldbyname('s_trip_h').Value),strtoint(fieldbyname('s_trip_m').Value)]);
      if fieldbyname('e_trip_d').value-strtodate(Adate)>0 then
        e_t := '2400'
      else
        e_t := format('%.2d%.2d',[strtoint(fieldbyname('e_trip_h').Value),strtoint(fieldbyname('e_trip_m').Value)]);
      if (Atime>=s_t) and (Atime<=e_t) then
      begin
        result := true;
        exit;
      end
      else
      begin
        result := false;
        Next;
      end;
    end;
  end;
end;

procedure Tformdut08.WrtToDB;
var
  i:integer;
begin
  DelAttInfo(emp_id);
  retrim(Dataset);
  //沒有排班資料
  if length(Dataset)=0 then
  begin
    with adoquery1 do
    begin
      append;
      fieldbyname('wrk_date').Value := TheDay;
      fieldbyname('emp_id').Value := emp_id;
      fieldbyname('upd_user').Value := UserName;
      fieldbyname('upd_date').Value := GetServerDateTime;
      fieldbyname('seg_code').Value := 'NO';
      fieldbyname('clas_code').Value := '@@';
      fieldbyname('s_start').Value := '????';
      fieldbyname('s_end').Value := '????';
      fieldbyname('real_start').Value := 'zzzz';
      fieldbyname('real_end').Value := 'zzzz';
      fieldbyname('wrk_sts').Value := '06';
      try
        post;
        MemoLog.Lines.Add('Note:emp_id'+emp_id+'沒有排班');
      except
        Cancel;
        MemoLog.Lines.Add('Error:When post emp_id'+emp_id+';seg_code:NO');
      end;
    end;
  end;
  
  for i := 0 to length(Dataset)-1 do
  begin
    with adoquery1 do
    begin
      if trim(Dataset[i,1])='' then
        continue;
      append;
      fieldbyname('wrk_date').Value := TheDay;
      fieldbyname('emp_id').Value := emp_id;
      fieldbyname('upd_user').Value := UserName;
      fieldbyname('upd_date').Value := GetServerDateTime;
      fieldbyname('seg_code').Value := trim(Dataset[i,1]);
      fieldbyname('clas_code').Value := trim(Dataset[i,2]);
      fieldbyname('s_start').Value := trim(Dataset[i,3]);
      fieldbyname('s_end').Value := trim(Dataset[i,4]);
      if trim(Dataset[i,5])<> '' then
        fieldbyname('real_start').Value := trim(Dataset[i,5]);
      if trim(Dataset[i,6])<> '' then
        fieldbyname('real_end').Value := trim(Dataset[i,6]);
      if trim(Dataset[i,7])<> '' then
        fieldbyname('wrk_sts').Value := trim(Dataset[i,7]);
      if trim(Dataset[i,8])<> '' then
        fieldbyname('late').Value := trim(Dataset[i,8]);
      if trim(Dataset[i,9])<> '' then
        fieldbyname('early').Value := trim(Dataset[i,9]);
      if trim(Dataset[i,10])<> '' then
        fieldbyname('over_flag').Value := trim(Dataset[i,10]);
      if trim(Dataset[i,11])<> '' then
        fieldbyname('notify').Value := trim(Dataset[i,11]);
      try
        post;
      except
        Cancel;
        MemoLog.Lines.Add('Error:When post emp_id'+emp_id+';seg_code'+Dataset[i,1]);
      end;
    end;
  end;
{  for i := 0 to length(AskDS)-1 do
  begin
    with adoquery1 do
    begin
      if trim(AskDS[i,2])='' then
        continue;
      append;
      fieldbyname('wrk_date').Value := TheDay;
      fieldbyname('emp_id').Value := emp_id;
      fieldbyname('upd_user').Value := UserName;
      fieldbyname('upd_date').Value := GetServerDateTime;
      fieldbyname('seg_code').Value := '假';
      fieldbyname('clas_code').Value := trim(AskDS[i,2]);
      fieldbyname('s_start').Value := trim(AskDS[i,3]);
      fieldbyname('s_end').Value := trim(AskDS[i,4]);
      if trim(AskDS[i,5])<> '' then
        fieldbyname('real_start').Value := trim(AskDS[i,5]);
      if trim(AskDS[i,6])<> '' then
        fieldbyname('real_end').Value := trim(AskDS[i,6]);
      if trim(AskDS[i,7])<> '' then
        fieldbyname('wrk_sts').Value := trim(AskDS[i,7]);
      post;
    end;
  end;}
  stat := 3;
  hint1; //提示信息
end;


procedure TformDut08.att_dateChange(Sender: TObject);
begin
  att_date_end.Date:=att_date.Date;
  s_date.Date := att_date.Date;
  e_date.Date := att_date.Date;
end;

procedure TformDut08.TntDBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;

procedure TRunThread.execute;
var
  formdut08:Tformdut08;
  i:integer;
  flag:boolean;
begin
  FreeOnTerminate := true;
  formdut08:=Tformdut08(application.FindComponent('formdut08'));
  flag:=false;
//  try
  with Formdut08 do
  begin
    TheDay:=B_day-1;
    while (TheDay<E_day) do
    begin//日期範圍內循環
      TheDay:=TheDay+1;
      NextDay:=TheDay+1;
      TheDate:=FormatDateTime('yyyy/mm/dd',TheDay);
      NextDate:=FormatDateTime('yyyy/mm/dd',NextDay);
      if not CheckRecordExist('select  top 1 * from hrd_dut_trt where trt_date='''+TheDate+''' and trt_time>''17:00:00''') then
      begin//檢查刷卡資料是否存在
        MeMoLog.Lines.Add('Error:'+TheDate+GetLangName(ws_Words,'msg_trt_not_finish'));
        Next;
      end;
      with ADOQuery4 do
      begin
        close;
        sql.Clear;
        sql.Add(GetEmpSql);
        open;
        progressbar1.Max := RecordCount;
        progressbar1.Position := 0;
        i:=0;
        while not eof do
        begin//repeat emp_id
        try
        if not DMHrdsys.conn.Connected then
          begin//數據庫連接斷開
            MemoLog.Lines.Add('net cannot connected');
            RunThread.Terminate;
          end;
          if RunThread.Terminated then
          begin
            //dmhrdsys.conn.RollbackTrans;
            exit;
          end;
          emp_id := fieldbyname('emp_id').AsString;
          spc_id := fieldbyname('spc_id').AsString;
          dept_code := UpperCase(fieldbyname('dept_code').AsString);
          factory := fieldbyname('factory').AsString;
          if (dept_code>='V00320') and (dept_code<'V00360') then
            factory :='N';//化工考勤
          if UpperCase(fieldbyname('info_code').AsString)='B' then
            factory :='N';//化工考勤
          progressbar1.StepBy(1);//進度條
          inc(i);
          sb_recno.SimpleText := inttostr(i)+'/'+inttostr(RecordCount);
          //刪除離職日及以後的考勤資料 2015.03.04 Sanjin ADD
          if not FieldByName('epledt').IsNull then
          begin
            //
            DeleteLeaveUser(emp_id, FieldByName('epledt').AsDateTime);
          end;
          //
          if (fieldbyname('epindt').AsDateTime > TheDay) or ((fieldbyname('epledt').AsString <> '') and (fieldbyname('epledt').AsDateTime<= TheDay)) then
          begin{離職日期 <= 考勤日期 .OR. 就職日期 >= 考勤日期 , 清除考勤資料}
            DelAttInfo(emp_id);//清除該工號該日的考勤信息；
            next;
            continue;
          end;
          if (fieldbyname('spc_id').AsString = '9999999999') then
          begin{化工新進員工忽略, 清除考勤資料}
            DelAttInfo(emp_id);
            next;
            continue;
          end;
          {if (B_day<>E_day) and (1=2) then
          begin
            case cobDutSts.ItemIndex of
              0://已異常沖銷忽略
              if checkRecordExist('select * from hrd_dut_day where emp_id='''+emp_id+''' and wrk_date='''+TheDate+''' and (real_start=''%%%%'' or real_end=''%%%%'')') then
                continue;
              1://已轉工號忽略
              if checkRecordExist('select * from hrd_dut_day where emp_id='''+emp_id+''' and wrk_date='''+TheDate+'''') then
                continue;
              2://異常的重轉
              if not checkRecordExist('select * from hrd_dut_day where emp_id='''+emp_id+''' and wrk_date='''+TheDate+''' and wrk_sts=''06''') then
                continue;
             end;
             if chk_ask.Checked then
             begin//轉請假
               if not checkRecordExist('select * from hrd_dut_ask where emp_id='''+emp_id+''' and s_ask_d<='''+TheDate+''' and e_ask_d>='''+TheDate+'''') then
                 continue;
             end;
             if chk_over.Checked then
             begin//轉加班
               if not checkRecordExist('select * from hrd_dut_ovrmst A,hrd_dut_ovrdtl B where emp_id='''+emp_id+''' and A.batch_no=B.batch_no and over_date='''+TheDate+'''') then
                 continue;
             end;
             if chk_stop.Checked then
             begin//轉停工
               if not checkRecordExist('select emp_id from hrd_dut_stpwrk where stp_date='''+TheDate+''' and emp_id='''+emp_id+'''') then
                 continue;
             end;
             if chk_trip.Checked then
             begin//轉公出
               if not checkRecordExist('select * from hrd_dut_trip where emp_id='''+emp_id+''' and s_trip_d<='''+TheDate+''' and e_trip_d>='''+TheDate+'''') then
                 continue;
             end;
          end; }
          { 整理出實際排班表}
          DateStr:=formatdatetime('yyyymmdd',TheDay);
          synchronize(GetArrangeInfo);
          {查找該員工的刷卡資料}
          synchronize(SrchTrt);
          {寫考勤日檔}
          synchronize(WrtTODB);
          if RunThread.Terminated then
          begin
            exit;
          end;
        except
          MeMoLog.Lines.Add('Error:emp_id-'+emp_id+';date-'+TheDate);
        end;//end try
        next;
        end;//end while
      end;//end with ADOQuery4
    end;//end while day
  stat := 4;
  hint1;
  stat := 5;
  hint1;
  SetStatusText(GetLangName(ws_Words,'dut08_abcount')+inttostr(AbCount));
  MeMoLog.Lines.Add(GetLangName(ws_Words,'total')+inttostr(ADOQuery4.RecordCount)+'/'+inttostr(ADOQuery1.RecordCount));
  MeMoLog.Lines.Add(GetLangName(ws_Words,'dut08_abcount')+inttostr(AbCount));
  sb_emp.SimpleText := '';
  sb_hint.SimpleText := GetLangName(ws_Words,'dut08_success');
  progressbar1.Position := 0;
  end;//with form08
  Terminate;
end;

procedure TformDut08.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
with DataSet do
  setStatusText(GetLangName(ws_Words,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(ws_Words,'total')+':'+inttostr(RecordCount));
end;


procedure TformDut08.BtnQueryClick(Sender: TObject);
var
  sqlstr:string;
begin
  TheDay:=DateOf(att_date.date);
  NextDay:=TheDay+1;
  TheDate:=FormatDateTime('yyyy/mm/dd',TheDay);
  NextDate:=FormatDateTime('yyyy/mm/dd',NextDay);
  sqlstr := 'select * from hrd_dut_day A,hrd_emp B where A.emp_id=B.emp_id '
  +' and wrk_date>='''+FormatDateTime('yyyy/mm/dd',att_date.Date)+''''
  +' and wrk_date<='''+FormatDateTime('yyyy/mm/dd',att_date_end.Date)+'''';
  if rb_id.Checked then
  begin
    if id_s.Text>id_e.Text then
    begin
      widemessagedlg(GetLangName(ws_Words,'dut08_error2'),mtError,[mbOk],0);
      exit;
    end;
    sqlstr := sqlstr + ' and A.emp_id>='''+id_s.Text+''' and A.emp_id<='''+id_e.text+''' and '+UserDeptStr+'';
  end;
  if rb_dept.Checked then
  begin
    if dept_s.Text>dept_e.Text then
    begin
      widemessagedlg(GetLangName(ws_Words,'dut08_error3'),mtError,[mbOk],0);
      exit;
    end;
    sqlstr := sqlstr + ' and dept_code>='''+leftstr(dept_s.Text,6)+''' and dept_code<='''+leftstr(dept_e.Text,6)+''' ';
  end;

  sqlstr := sqlstr + ' and '+G_sFactorySql ; //2012-09-07 hyt add

  with ADOQueryInq do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
  end;
  DataSource1.DataSet:=ADOQueryInq;
  tntpanel7.Enabled := false;
  bb_tran.Enabled:=false;
end;

procedure TformDut08.ADOQueryInqCalcFields(DataSet: TDataSet);
var
  sql_str,clas_code:string;
begin
  clas_code:=DataSet.FieldByName('clas_code').AsString;
  sql_str:='select * from hrd_dut_class where clas_code='''+clas_code+'''';
  with DMHrdsys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    DataSet.FieldByName('clas_name').AsString:=FieldByName('clas_chs').AsString;
  end;
end;

procedure TformDut08.BtnClearClick(Sender: TObject);
begin
  MemoLog.Clear;
end;

function TformDut08.CheckTrtStation(AEmpId,Station:string):boolean;
//檢查刷卡位置是否正確
var
  SqlStr:string;
begin
  Result:=true;
  //SqlStr:='SELECT * FROM hrd_emp where emp_id='''+AEmpId+''' and factory=''N''';
  if (UpperCase(LeftStr(dept_code,1))='S') then// 鞋面廠不限制 非鞋廠不限制刷卡位置
     exit;
  //if (UpperCase(factory)<>'V') then//非鞋廠不限制刷卡位置
  //  exit;
  {if (UpperCase(LeftStr(dept_code,1))='F') or (UpperCase(factory)='F') then
  begin//福祿不需限制刷卡
    Result:=true;
    exit;
  end;
  if (UpperCase(LeftStr(dept_code,1))='N') or (UpperCase(factory)='N') then
  begin//化工不需限制刷卡
    Result:=true;
    exit;
  end;}
 // SqlStr:='SELECT * FROM hrd_dut_dept_local2 A where '
 //  +'  A.emp_id='''+AEmpId+'''';
 // if CheckRecordExist(SqlStr) then
//  begin
//    Result:=true;
//  end
 // else
//  begin
   { SqlStr:='SELECT * FROM hrd_dut_dept_local A,hrd_emp C'
     +' where   A.dept_code=C.dept_code'
     +' and C.emp_id='''+AEmpId+''' ';
  //  SqlStr:='SELECT * FROM hrd_dut_dept_local2 where emp_id='''+AEmpId+'''';

    if CheckRecordExist(SqlStr) then   // 2008.10.13 れ起福祿調往清祿人員設置固定刷卡位置
    begin
       Result:=false; //Result:=true;
    end
    else
    begin
      if Station = 'L'  then
         Result:=false
      else
        Result:=true;  //Result:=false;
    end;
 // end; }
  SqlStr:='SELECT * FROM hrd_dut_dept_local2 A,hrd_dut_trt_station B where '
   +' A.new_local=B.location and A.emp_id='''+AEmpId+''' and B.machine='''+Station+'''';
  if CheckRecordExist(SqlStr) then
  begin
    Result:=true;
  end
  else
  begin
    SqlStr:='SELECT * FROM hrd_dut_dept_local A,hrd_dut_trt_station B,hrd_emp C'
     +' where A.new_local=B.location and A.dept_code=C.dept_code'
     +' and C.emp_id='''+AEmpId+''' and B.machine='''+Station+'''';
   if CheckRecordExist(SqlStr) then
    begin
       Result:=true;
    end
    else
    begin
      Result:=false;
    end;
  end;
end;

procedure TformDut08.id_sChange(Sender: TObject);
begin
   id_e.Text :=id_s.Text;
end;

procedure TformDut08.dept_sChange(Sender: TObject);
begin
  dept_e.Text :=dept_s.Text ;
end;

//刪除離職日及以後的考勤資料 2015.03.04 Sanjin ADD
procedure TformDut08.DeleteLeaveUser(AEmpID: string; ADate: TDateTime);
var
  sSQL: string;
begin
  //
  sSQL:= 'DELETE FROM HRD_DUT_DAY'
       + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
       + '   AND WRK_DATE >= '+QuotedStr(FormatDateTime('YYYY/MM/DD', ADate));

  ADOCommand1.CommandText:= sSQL;
  ADOCommand1.Execute;
end;

end.
