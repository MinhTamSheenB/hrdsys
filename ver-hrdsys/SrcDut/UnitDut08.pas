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
    procedure InitLangInfo; //�y����l��
    procedure FormInit;     //�ɭ���l��
    function GetEmpSql:string;     //���osql�y�y
    procedure FormCreate(Sender: TObject);
    procedure rb_deptClick(Sender: TObject);
    procedure cb_trtClick(Sender: TObject);
    procedure bb_okClick(Sender: TObject);
    procedure Tbb_resetClick(Sender: TObject);
    procedure bb_tranClick(Sender: TObject);
   // procedure DealInformation;
    //���ܫH��
    procedure hint1;
    //�M���Ӥu����骺�ҶԫH��
    procedure DelAttInfo(const emp:widestring);
    // �q�[�Z�ɤ�Ū�X�ӭ��u���[�Z�ɬq�զ�
    procedure GetOvrMst;
    // �q���u�ɤ�Ū�X�ӭ��u�����u�ɬq�զ�
    procedure GetStpWrk;
    // �M��а����
    procedure GetLeavInfor;
    // ��z�X��ڱƯZ��
    procedure ReDealData;
    // �ˬd�ɬq�O�_���|
    function checkperiod(arr:Tarr):boolean;
    //���s��z�ɬq�H�� �h�����Ū��ɬq
    function retrim(var arr:Tarr):Tarr;
    //�o��ƯZ�H��
    procedure GetArrangeInfo;
    //�d�ߨ�d��
    procedure SrchTrt;
    //�d�ߤ��X��
    function SrchTrp(Adate,Atime:string):boolean;
    //�ˬd�O�_��d��G��
    function IsTrtConk(Adate,Atime:string):boolean;
    function CheckTrtStation(AEmpId,Station:string):boolean;
    //�g��
    procedure WrtToDB;
    procedure att_dateChange(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure BtnQueryClick(Sender: TObject);
    procedure ADOQueryInqCalcFields(DataSet: TDataSet);
    procedure BtnClearClick(Sender: TObject);
    procedure id_sChange(Sender: TObject);
    procedure dept_sChange(Sender: TObject);
    //�R����¾��ΥH�᪺�ҶԸ�� 2015.03.04 Sanjin ADD
    procedure DeleteLeaveUser(AEmpID: string; ADate: TDateTime);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
  //�u�{
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
{ seg_code = 0;    // �ɬq
  clas_code = 1;   // �Z�O
  s_start = 2;     // �Э�W�Z�ɶ�
  s_end =3 ;       // �Э�U�Z�ɶ�
  real_start = 4;  // �W�Z��d
  real_end = 5;    // �U�Z��d
  wrk_sts = 6;     // �B�z���A
  late = 7;        // ���
  early = 8;       // ���h
  over_flag = 9;   // �W�ɥ[�Z�Ч�
  notify = 10;      // ���B�z�Ч�
  start_b = 11;    // �W�Z��d�_��
  start_e = 12;    // �W�Z��d���
  end_b = 13;      // �U�Z��d�_��
  end_e =14;       // �U�Z��d���
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
  emp_id:widestring; //�u��
  DateStr,TheDate,NextDate:string;
  TheDay,NextDay,B_day,E_day:TDateTime;
  spc_id:widestring; //�ѧO�d��
  dept_code:string;//�����N��
  factory:string;//�ҶԼt��
  stat:integer;
  mess:widestring;
  SegCount :integer; //�ɬq��
  dataset,ArrangeDs,OvrDs,SpcDs,StpDs,AskDs,tmpDs:Tarr;
  TitleArr : array[1..15] of string;
  AbCount :integer;  //���`������

{ *********************************
 ���ܫH�����
 emp : �u��
 state�G �B�z���A
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
  //�w�q�n�Ψ쪺�y��
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
  //��l��,���Τ��ӵe���֦����v��
  PrvArr:=GetPrvArr(UserName,'dut08');
  if HaveSpcPrv(UserName,'dut08') then//�d���G�ٻݭn�S���v��
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
    if MessageDlg('�z�T�w�n����?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
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
  //�Ӥ��Ƥw�g��w
  if ((FormatDateTime('yyyymm',B_Day))<=LockMonthPart) and (UserName<>DebugUser) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
    exit;
  end;
  AbCount := 0;
  {sqlstr:='select  top 1 * from hrd_dut_trt where trt_date='''+E_Dates+''' and trt_time>''17:00:00''';
  if not CheckRecordExist(sqlstr) then
  begin//�ˬd��d��ƬO�_�s�b
    WideShowMessage(GetLangName(ws_Words,'msg_trt_not_finish'));
    Exit;
  end;}
  { �w�g�R��
  sqlstr := 'select * from hrd_emp where epindt<='''+E_Dates+''' and (epledt is null or epledt >'''+B_Dates+''')';
  if CobDutSts.ItemIndex=0 then
  begin//�w���`�R�P����
    if B_Dates=E_Dates then
      sqlstr := sqlstr + ' and emp_id not in (select emp_id from hrd_dut_day where wrk_date>='''+B_Dates+''' and wrk_date<='''+E_Dates+''' and (real_start=''%%%%'' or real_end=''%%%%''))';
  end;
  if CobDutSts.ItemIndex=1 then
  begin//�w�੿��
    if B_Dates=E_Dates then
      sqlstr := sqlstr + ' and emp_id not in (select emp_id from hrd_dut_day where wrk_date>='''+B_Dates+''' and wrk_date<='''+E_Dates+''')';
  end;
  if CobDutSts.ItemIndex=2 then
  begin//�u�ಧ�`
    sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_day where wrk_date>='''+B_Dates+''' and wrk_date<='''+E_Dates+''' and wrk_sts=''06'')';
  end;
  if chk_ask.Checked then
  begin//��а�
    sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_ask where s_ask_d<='''+E_Dates+''' and e_ask_d>='''+B_Dates+''')';
  end;
  if chk_over.Checked then
  begin//��[�Z
    sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_ovrmst A,hrd_dut_ovrdtl B where A.batch_no=B.batch_no and over_date<='''+E_Dates+''' and over_date>='''+B_Dates+''')';
  end;
  if chk_stop.Checked then
  begin//�ఱ�u
    sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_stpwrk where stp_date<='''+E_Dates+''' and stp_date>='''+B_Dates+''')';
  end;
  if chk_trip.Checked then
  begin//�ऽ�X
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
//��^�u���d��sql�y�y
var
  SqlStr:string;
begin
  sqlstr := 'select * from hrd_emp where epindt<='''+TheDate+''' and (epledt is null or epledt >'''+TheDate+''')';
  //��������Ȯɥh��
  if CobDutSts.Visible then
  begin
    if CobDutSts.ItemIndex=0 then
    begin//�w���`�R�P����
      //sqlstr := sqlstr + ' and emp_id not in (select emp_id from hrd_dut_day where wrk_date='''+TheDate+''' and (real_start=''%%%%'' or real_end=''%%%%''))';
    end;
    if CobDutSts.ItemIndex=2 then
    begin//�w�੿��
      sqlstr := sqlstr + ' and emp_id not in (select emp_id from hrd_dut_day where wrk_date='''+TheDate+''')';
    end;
    if CobDutSts.ItemIndex=3 then
    begin//�u�ಧ�`
      sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_day where wrk_date='''+TheDate+''' and (wrk_sts=''06'' or wrk_sts=''36''))';
    end;
  end;
  if GroupBox2.Visible then
  begin
    if chk_ask.Checked then
    begin//��а�
      sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_ask where s_ask_d<='''+TheDate+''' and e_ask_d>='''+TheDate+''')';
    end;
    if chk_over.Checked then
    begin//��[�Z
      sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_ovrmst A,hrd_dut_ovrdtl B where A.batch_no=B.batch_no and over_date='''+TheDate+''')';
    end;
    if chk_stop.Checked then
    begin//�ఱ�u
      sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_stpwrk where stp_date='''+TheDate+''')';
    end;
    if chk_trip.Checked then
    begin//�ऽ�X
      sqlstr := sqlstr + ' and emp_id in (select emp_id from hrd_dut_trip where s_trip_d<='''+TheDate+''' and e_trip_d>='''+TheDate+''')';
    end;
  end;
  if rb_id.Checked then
  begin//���u��
    sqlstr := sqlstr + ' and emp_id>='''+id_s.Text+''' and emp_id<='''+id_e.text+'''  and '+UserDeptStr;
  end;
  if rb_dept.Checked then
  begin//������
    sqlstr := sqlstr + ' and dept_code>='''+leftstr(dept_s.Text,6)+''' and dept_code<='''+leftstr(dept_e.Text,6)+''' ';
  end;

  sqlstr := sqlstr + ' and '+G_sFactorySql ; //2012-09-07 hyt add

  result:=sqlstr;
end;

{ *********************************
 �M���Ӥu�����ҶԫH�����
 emp : �u��
*************************************}
procedure TformDut08.DelAttInfo(const emp:widestring);
var
  atext:TextFile;
  Asql:string;
  i:integer;
  ab_flag:boolean;
begin
  Asql:='delete from hrd_dut_day where wrk_date='''+TheDate+''' and emp_id='''+emp+'''';
  //if CobDutSts.ItemIndex=0 then//�R�P�L������
  if CobDutSts.Visible then
    if CobDutSts.ItemIndex=0 then//�R�P�L������
    begin
    ab_flag:=false;
    for i:=0 to length(Dataset)-1 do
      if Dataset[i,7]='06' then
      begin//�����`�~�P�_
        ab_flag:=true;
        break;
      end;
    if ab_flag then
      Asql:=Asql+' and (real_start is null or real_end is null or (real_start<>''%%%%'' and real_end<>''%%%%''))';
    end;
  adoCommand1.commandtext := Asql;
  stat := 1;
  mess :='';
  hint1; //���ܫH��
  adoCommand1.execute;
end;
{ ***********************************************
��z�X��ڱƯZ��,���o�W�Z�ɬq�`��SegCount
emp : �u��
attdate:���
�g��� WrkSeg SegCount      (const emp:widestring;const attdate:string)
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
  hint1; //���ܫH��
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
           begin//61|62|63�Z�O�u�঳�@��
             for k:=0 to i do
             begin
               if AnsiContainsStr('61|62|63',ArrangeDs[k,j]) then
               begin
                 ArrangeDs[i,j]:=ArrangeDs[k,j];
                 break;
               end;//end if
             end;//end for
           end;//end if 61|62|63�Z�O�u�঳�@��
         end;//end if
       end;//end for
       adoquery2.close;
    end;
    // �ˬd�ӭ��u�ƯZ���ɬq�O�_���|
    if not checkperiod(ArrangeDs) then
    begin
     // result := 1;
      exit;
    end;
    // �q�[�Z�ɤ�Ū�X�ӭ��u���[�Z�ɬq�զ�
    GetOvrMst;

    //2014.12.02
    //if tmsStr<>'90' then
    begin//����L���u�а�(2006/10/03 anil modify )
      // �q���u�ɤ�Ū�X�ӭ��u�����u�ɬq�զ�
      GetStpWrk;
      // �M��а����
      GetLeavInfor;
    end;
    
    // ��z�X��ڮɬq��
    ReDealData;

  end;
  //result := 0;
end;

// �ˬd�ɬq�O�_���|
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

// �q�[�Z�ɤ�Ū�X�ӭ��u���[�Z�ɬq�զ�
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

    {�W�ɥ[�Z�B�z,�ק�Z�O,�Э�W�Z�ɶ�,�W�Z��d,�U�Z��d�ɶ�}

    // �ˬd�ӭ��u�[�Z�O�ƯZ���ɬq�O�_���|
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

// �q���u�ɤ�Ū�X�ӭ��u�����u�ɬq�զ�
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
          //�W�Z�ɬq�b���u�ɬq�� �ק�W�Z�ɬq
          if (StpDs[i,3]<=ArrangeDs[j,3]) and (StpDs[i,4]>=ArrangeDs[j,4]) then
          begin
            ArrangeDs[j,7] := ArrangeDs[j,2];
            ArrangeDs[j,2]:= StpDs[i,2];
            ArrangeDs[j,12]:= '****';
            ArrangeDs[j,13]:= '****';
            ArrangeDs[j,14]:= '****';
            ArrangeDs[j,15]:= '****';
          end  //���u�ɬq�_�b�W�Z�ɬq�� ���u�ɬq��b�W�Z�ɬq�~ �ק�U�Z�зǮɶ�,�s�W���u�ɬq
          else if (StpDs[i,3]>ArrangeDs[j,3]) and (StpDs[i,3]<ArrangeDs[j,4]) and  (StpDs[i,4]>=ArrangeDs[j,4])  then
          begin
            //�s�W���u�ɬq
            setlength(ArrangeDs,length(ArrangeDs)+1);
            ArrangeDs[length(ArrangeDs)-1]:=StpDs[i];
            if ArrangeDs[length(ArrangeDs)-1,4]>ArrangeDs[j,4] then
              ArrangeDs[length(ArrangeDs)-1,4]:=ArrangeDs[j,4];
            //�ק�U�Z�ɶ�
            ArrangeDs[j,4]:=StpDs[i,3];
            ArrangeDs[j,14]:= '****';
            ArrangeDs[j,15]:= '****';
          end  //���u�ɬq�_�b�W�Z�ɬq�~ ���u�ɬq��b�W�Z�ɬq��  �ק�W�Z�зǮɶ�,�s�W���u�ɬq
          else if (StpDs[i,3]<=ArrangeDs[j,3]) and (StpDs[i,4]>ArrangeDs[j,3]) and  (StpDs[i,4]<ArrangeDs[j,4])  then
          begin
            //�s�W���u�ɬq
            setlength(ArrangeDs,length(ArrangeDs)+1);
            ArrangeDs[length(ArrangeDs)-1]:=StpDs[i];
            if ArrangeDs[length(ArrangeDs)-1,3]>ArrangeDs[j,3] then
              ArrangeDs[length(ArrangeDs)-1,3]:=ArrangeDs[j,3];
            //�ק�W�Z�ɶ�
            ArrangeDs[j,3]:=StpDs[i,4];
            ArrangeDs[j,12]:= '****';
            ArrangeDs[j,13]:= '****';
          end //���u�ɬq�b�W�Z�ɬq�� �W�[���u�A�W�Z�ɬq�A�ק�U�Z�ɶ�
          else if (StpDs[i,3]>ArrangeDs[j,3]) and (StpDs[i,4]<ArrangeDs[j,4]) then
          begin
            setlength(ArrangeDs,length(ArrangeDs)+2);
            k:=length(ArrangeDs)-2;//�s�W���u�ɬq
            ArrangeDs[k]:=StpDs[i];
            k:=length(ArrangeDs)-1;//�s�W�W�Z�ɬq
            ArrangeDs[k,1]:= '@@';
            ArrangeDs[k,2]:= ArrangeDs[j,2];
            ArrangeDs[k,3]:= ArrangeDs[k-1,4];
            ArrangeDs[k,4]:= ArrangeDs[j,4];
            ArrangeDs[k,12]:= '****';
            ArrangeDs[k,13]:= '****';
            ArrangeDs[k,14]:= ArrangeDs[j,14];
            ArrangeDs[k,15]:= ArrangeDs[j,15];
            //�ק�U�Z�ɶ�
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

// �M��а����
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
  //�ץ��а��ɶ��_��b�W�Z�ɶ��d��(2006/10/03 anil modify )
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
      AskDs[i,3]:=MinSHour;//�W�Z�_�l�ɶ�
    if (MaxEHour<AskDs[i,4]) and (MaxEHour<>'0000') then
      AskDs[i,4]:=MaxEHour;//�U�Z�פ�ɶ�
  end;
  //�ץ��ƯZ���
  for i:=0 to length(AskDs)-1 do
  begin
    for j:=0 to ADsLen-1 do
    begin
      //�W�Z�ɬq�b�а��ɬq�� �ק�W�Z�ɬq(��d�ɶ��ίZ�O),�ư�����
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
      end  //�а��ɬq�_�b�W�Z�ɬq�� �а��ɬq��b�W�Z�ɬq�~ �ק�U�Z�зǮɶ��A�s�W�а��ɬq
      else if (AskDs[i,3]>ArrangeDs[j,3]) and (AskDs[i,3]<ArrangeDs[j,4]) and  (AskDs[i,4]>=ArrangeDs[j,4])  then
      begin
        //�s�W�а��ɬq
        setlength(ArrangeDs,length(ArrangeDs)+1);
        ArrangeDs[length(ArrangeDs)-1]:=AskDs[i];
        if ArrangeDs[length(ArrangeDs)-1,4]>ArrangeDs[j,4] then
          ArrangeDs[length(ArrangeDs)-1,4]:=ArrangeDs[j,4];
        //�ק�U�Z�ɶ�
        ArrangeDs[j,4]:=AskDs[i,3];
        ArrangeDs[j,14]:= '****';
        ArrangeDs[j,15]:= '****';
      end  //�а��ɬq�_�b�W�Z�ɬq�~ �а��ɬq��b�W�Z�ɬq��  �ק�W�Z�зǮɶ��A�s�W�а��ɬq
      else if (AskDs[i,3]<=ArrangeDs[j,3]) and (AskDs[i,4]>ArrangeDs[j,3]) and  (AskDs[i,4]<ArrangeDs[j,4])  then
      begin
        //�s�W�а��ɬq
        //ArrangeDs[j,3]:=AskDs[i,4];
        setlength(ArrangeDs,length(ArrangeDs)+1);
        ArrangeDs[length(ArrangeDs)-1]:=AskDs[i];
        if ArrangeDs[length(ArrangeDs)-1,3]<ArrangeDs[j,3] then
          ArrangeDs[length(ArrangeDs)-1,3]:=ArrangeDs[j,3];//�ק�а��_�ɶ�
        //�ק�W�Z�ɶ�
        ArrangeDs[j,3]:=AskDs[i,4];
        ArrangeDs[j,12]:= '****';
        ArrangeDs[j,13]:= '****';
      end //�а��ɬq�b�W�Z�ɬq�� �W�[�а��A�W�Z�ɬq�A�ק�U�Z�ɶ�
      else if (AskDs[i,3]>ArrangeDs[j,3]) and (AskDs[i,4]<ArrangeDs[j,4]) then
      begin
        //tmpds := AskDs;
        setlength(ArrangeDs,length(ArrangeDs)+2);
        k:=length(ArrangeDs)-2;//�s�W�а��ɬq
        ArrangeDs[k]:=AskDs[i];
        k:=length(ArrangeDs)-1;//�s�W�W�Z�ɬq
        ArrangeDs[k,1]:= '@@';
        ArrangeDs[k,2]:= ArrangeDs[j,2];
        ArrangeDs[k,3]:= ArrangeDs[k-1,4];
        ArrangeDs[k,4]:= ArrangeDs[j,4];
        ArrangeDs[k,12]:= '****';
        ArrangeDs[k,13]:= '****';
        ArrangeDs[k,14]:= ArrangeDs[j,14];
        ArrangeDs[k,15]:= ArrangeDs[j,15];
        //�ק�W�Z�ɶ�
        ArrangeDs[j,4]:=AskDs[i,3];
        ArrangeDs[j,14]:= '****';
        ArrangeDs[j,15]:= '****';
      end;
    end;
  end;
end;

// ��z�X��ڱƯZ��
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
  for i:=0 to length(Dataset)-2 do //�W�Ӯɬq��d�� �r= �U�Ӯɬq��d�_  �N����d�F
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

//���s��z�ɬq�H�� �h�����Ū��ɬq
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
  {  //��w��d���m
  sqlstr:='select * from hrd_dut_trt_station A,hrd_dut_trt_dept B where A.location=B.location'
    +' and (B.dept_code='''+dept_code+''' or B.dept_code='''+emp_id+''')';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if not Eof then//�w�g�s�b��d����m���
      sql_pre:=sql_pre+' and trt_station in (select machine from hrd_dut_trt_station'
        +' where location='''+FieldByName('location').AsString+''') ';
  end;}
    {//+' and trt_station in (select machine from hrd_dut_trt_station A,hrd_dut_trt_dept B,hrd_emp C'
    //+' where C.spc_id='''+spc_id+''' and A.location=B.location and B.dept_code=C.dept_code) ';}
  with adoquery2 do
  begin
    for i:= 0 to length(Dataset)-1 do
    begin
      //�W�Z��d
      if (trim(Dataset[i,12])<>'') and (trim(Dataset[i,12])<>'****') then
      begin
        if Dataset[i,12]>='2400' then
        begin//24�I�Z��d
          sqlstr:=sql_pre+' and trt_date='''+NextDate+''' and trt_time>='''+
            format('%.2d',[strtoint(leftstr(Dataset[i,12],2))-24])+':'+rightstr(Dataset[i,12],2)+TimeHeader+''' and trt_time<='''+
            format('%.2d',[strtoint(leftstr(Dataset[i,13],2))-24])+':'+rightstr(Dataset[i,13],2)+TimeFooter+''' ';
          sql.Clear;
          sql.Add(sqlstr);
          open;
          if not eof then
          begin//���`��d
            last;
            if not CheckTrtStation(emp_id,FieldByName('trt_station').AsString) then
            begin
              Dataset[i,7]:= '36';//�������x��d
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
              {�Y�L��d��ƫh�M�䤽�X���}
              if SrchTrp(datetostr(NextDay),inttostr(strtoint(Dataset[i,3])-2400)) then
              begin
                Dataset[i,5]:='####';
              end {��ݬO�_��d��G��}
              else if IsTrtConk(datetostr(NextDay),inttostr(strtoint(Dataset[i,3])-2400)) then
              begin
                Dataset[i,5]:='%%%%';
              end
              else
              begin
                Dataset[i,7]:= '06'; //����d
                AbCount := AbCount + 1;
              end;
            end
            else
            begin
              last;
              Dataset[i,8]:= '04'; //���
              Dataset[i,5]:= inttostr(strtoint(formatdatetime('hh',fieldbyname('trt_time').AsDateTime))+24)+formatdatetime('nn',fieldbyname('trt_time').AsDateTime);
            end;
          end;
        end
        else
        begin//24�I�e�W�Z��d
          sqlstr:=sql_pre+' and trt_date='''+TheDate+''' and trt_time>='''+
            leftstr(Dataset[i,12],2)+':'+rightstr(Dataset[i,12],2)+TimeHeader+''' and trt_time<='''+
            format('%.2d:%.2d',[strtoint(leftstr(Dataset[i,13],2)),strtoint(rightstr(Dataset[i,13],2))])+TimeFooter+''' ';
          sql.Clear;
          sql.Add(sqlstr);
          open;
          if not eof then
          begin//���`��d
            last;
          //////////////////////
            if not CheckTrtStation(emp_id,FieldByName('trt_station').AsString) then
            begin
              Dataset[i,7]:= '36';//�������x��d
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
              {�Y�L��d��ƫh�M�䤽�X���}
              if SrchTrp(datetostr(TheDay),Dataset[i,3]) then
              begin
                Dataset[i,5]:='####';
              end {��ݬO�_��d��G��}
              else if IsTrtConk(datetostr(TheDay),Dataset[i,3]) then
              begin
                Dataset[i,5]:='%%%%';
              end
              else
              begin
                Dataset[i,7]:= '06'; //����d
                AbCount := AbCount + 1;
              end;
            end
            else
            begin
              last;
              Dataset[i,8]:= '04'; //���
              Dataset[i,5]:= formatdatetime('hhnn',fieldbyname('trt_time').AsDateTime);
            end;
          end;
        end;
      end
      else
      begin
        Dataset[i,5]:='****';//���Ψ�d
      end;

      //�U�Z��d
      if (trim(Dataset[i,14])<>'') and (trim(Dataset[i,14])<>'****') then
      begin
        if Dataset[i,14]>='2400' then
        begin//24�I�Z�U�Z��d
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
            if eof then//�L��d���
            begin
              {�Y�L��d��ƫh�M�䤽�X���}
              if SrchTrp(datetostr(NextDay),inttostr(strtoint(Dataset[i,4])-2400)) then
              begin
                Dataset[i,6]:='####';
              end {��ݬO�_��d��G��}
              else if IsTrtConk(datetostr(NextDay),inttostr(strtoint(Dataset[i,4])-2400)) then
              begin
                Dataset[i,6]:='%%%%';
              end
              else
              begin
                Dataset[i,7]:= '06'; //����d
                AbCount := AbCount + 1;
              end;
            end
            else
            begin
              last;
              Dataset[i,9]:= '05'; //���h
              Dataset[i,6]:= inttostr(strtoint(formatdatetime('hh',fieldbyname('trt_time').AsDateTime))+24)+formatdatetime('nn',fieldbyname('trt_time').AsDateTime);
            end;
          end
          else
          begin//���`��d
            last;
            if not CheckTrtStation(emp_id,FieldByName('trt_station').AsString) then
            begin
              Dataset[i,7]:= '36';//�������x��d
              AbCount := AbCount + 1;
            end;
            Dataset[i,6]:= inttostr(strtoint(formatdatetime('hh',fieldbyname('trt_time').AsDateTime))+24)+formatdatetime('nn',fieldbyname('trt_time').AsDateTime);
          end;
        end
        else  //�b���Ѩ�d
        begin//24�I�e�U�Z��d
          sqlstr:=sql_pre+' and trt_date='''+TheDate+''' and trt_time>='''+
            leftstr(Dataset[i,14],2)+':'+rightstr(Dataset[i,14],2)+TimeHeader+''' and trt_time<='''+
            leftstr(Dataset[i,15],2)+':'+rightstr(Dataset[i,15],2)+TimeFooter+''' ';
          sql.Clear;
          sql.Add(sqlstr);
          open;
          if not eof then
          begin//���`��d
             last;
             // 2011.06.09 <<
             if not CheckTrtStation(emp_id,FieldByName('trt_station').AsString) then
             begin
               Dataset[i,7]:= '36';//�������x��d
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
              {�Y�L��d��ƫh�M�䤽�X���}
              if SrchTrp(datetostr(TheDay),Dataset[i,4]) then
              begin
                Dataset[i,6]:='####';
              end {��ݬO�_��d��G��}
              else if IsTrtConk(datetostr(TheDay),Dataset[i,4]) then
              begin
                Dataset[i,6]:='%%%%';
              end
              else
              begin
                Dataset[i,7]:= '06'; //����d
                AbCount := AbCount + 1;
              end;
            end
            else
            begin
              last;
              Dataset[i,9] := '05'; //���h
              Dataset[i,6] := formatdatetime('hhnn',fieldbyname('trt_time').AsDateTime);
            end;
          end;
        end;
      end
      else
      begin
        Dataset[i,6]:='****';//���Ψ�d
      end;
    end;
  end;
end;


{�ˬd�O�_��d��G��}
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

//�ˬd�O�_���X�]�i�@�Ѧh���^
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
  //�S���ƯZ���
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
        MemoLog.Lines.Add('Note:emp_id'+emp_id+'�S���ƯZ');
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
      fieldbyname('seg_code').Value := '��';
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
  hint1; //���ܫH��
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
    begin//����d�򤺴`��
      TheDay:=TheDay+1;
      NextDay:=TheDay+1;
      TheDate:=FormatDateTime('yyyy/mm/dd',TheDay);
      NextDate:=FormatDateTime('yyyy/mm/dd',NextDay);
      if not CheckRecordExist('select  top 1 * from hrd_dut_trt where trt_date='''+TheDate+''' and trt_time>''17:00:00''') then
      begin//�ˬd��d��ƬO�_�s�b
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
          begin//�ƾڮw�s���_�}
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
            factory :='N';//�Ƥu�Ҷ�
          if UpperCase(fieldbyname('info_code').AsString)='B' then
            factory :='N';//�Ƥu�Ҷ�
          progressbar1.StepBy(1);//�i�ױ�
          inc(i);
          sb_recno.SimpleText := inttostr(i)+'/'+inttostr(RecordCount);
          //�R����¾��ΥH�᪺�ҶԸ�� 2015.03.04 Sanjin ADD
          if not FieldByName('epledt').IsNull then
          begin
            //
            DeleteLeaveUser(emp_id, FieldByName('epledt').AsDateTime);
          end;
          //
          if (fieldbyname('epindt').AsDateTime > TheDay) or ((fieldbyname('epledt').AsString <> '') and (fieldbyname('epledt').AsDateTime<= TheDay)) then
          begin{��¾��� <= �ҶԤ�� .OR. �N¾��� >= �ҶԤ�� , �M���ҶԸ��}
            DelAttInfo(emp_id);//�M���Ӥu���Ӥ骺�ҶԫH���F
            next;
            continue;
          end;
          if (fieldbyname('spc_id').AsString = '9999999999') then
          begin{�Ƥu�s�i���u����, �M���ҶԸ��}
            DelAttInfo(emp_id);
            next;
            continue;
          end;
          {if (B_day<>E_day) and (1=2) then
          begin
            case cobDutSts.ItemIndex of
              0://�w���`�R�P����
              if checkRecordExist('select * from hrd_dut_day where emp_id='''+emp_id+''' and wrk_date='''+TheDate+''' and (real_start=''%%%%'' or real_end=''%%%%'')') then
                continue;
              1://�w��u������
              if checkRecordExist('select * from hrd_dut_day where emp_id='''+emp_id+''' and wrk_date='''+TheDate+'''') then
                continue;
              2://���`������
              if not checkRecordExist('select * from hrd_dut_day where emp_id='''+emp_id+''' and wrk_date='''+TheDate+''' and wrk_sts=''06''') then
                continue;
             end;
             if chk_ask.Checked then
             begin//��а�
               if not checkRecordExist('select * from hrd_dut_ask where emp_id='''+emp_id+''' and s_ask_d<='''+TheDate+''' and e_ask_d>='''+TheDate+'''') then
                 continue;
             end;
             if chk_over.Checked then
             begin//��[�Z
               if not checkRecordExist('select * from hrd_dut_ovrmst A,hrd_dut_ovrdtl B where emp_id='''+emp_id+''' and A.batch_no=B.batch_no and over_date='''+TheDate+'''') then
                 continue;
             end;
             if chk_stop.Checked then
             begin//�ఱ�u
               if not checkRecordExist('select emp_id from hrd_dut_stpwrk where stp_date='''+TheDate+''' and emp_id='''+emp_id+'''') then
                 continue;
             end;
             if chk_trip.Checked then
             begin//�ऽ�X
               if not checkRecordExist('select * from hrd_dut_trip where emp_id='''+emp_id+''' and s_trip_d<='''+TheDate+''' and e_trip_d>='''+TheDate+'''') then
                 continue;
             end;
          end; }
          { ��z�X��ڱƯZ��}
          DateStr:=formatdatetime('yyyymmdd',TheDay);
          synchronize(GetArrangeInfo);
          {�d��ӭ��u����d���}
          synchronize(SrchTrt);
          {�g�ҶԤ���}
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
//�ˬd��d��m�O�_���T
var
  SqlStr:string;
begin
  Result:=true;
  //SqlStr:='SELECT * FROM hrd_emp where emp_id='''+AEmpId+''' and factory=''N''';
  if (UpperCase(LeftStr(dept_code,1))='S') then// �c���t������ �D�c�t�������d��m
     exit;
  //if (UpperCase(factory)<>'V') then//�D�c�t�������d��m
  //  exit;
  {if (UpperCase(LeftStr(dept_code,1))='F') or (UpperCase(factory)='F') then
  begin//�ָS���ݭ����d
    Result:=true;
    exit;
  end;
  if (UpperCase(LeftStr(dept_code,1))='N') or (UpperCase(factory)='N') then
  begin//�Ƥu���ݭ����d
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

    if CheckRecordExist(SqlStr) then   // 2008.10.13 ��_�ָS�թ��M�S�H���]�m�T�w��d��m
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

//�R����¾��ΥH�᪺�ҶԸ�� 2015.03.04 Sanjin ADD
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