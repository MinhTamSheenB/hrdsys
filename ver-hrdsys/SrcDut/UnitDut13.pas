unit UnitDut13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, TntComCtrls, ExtCtrls, TntExtCtrls, Grids, DBGrids,
  TntDBGrids, Mask, TntStdCtrls, StdCtrls, Buttons, TntButtons, DB, ADODB,DateUtils,
  TntDialogs,StrUtils, TntDB, DBCtrls,WSDLIntf, TntDbCtrls,ActiveX;
type
  TMonArr=array[1..31] of integer;
type
  TMonArr2=array[1..31] of string;
type
  TRunThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure execute;override;

  public
    { Public declarations }
  end;
type
  TFormDut13 = class(TForm)
    TntPanel1: TTntPanel;
    qry_mon_Q: TADOQuery;
    ds_mon_Q: TDataSource;
    qry_DutDay: TADOQuery;
    sp_T_Emp1: TADOStoredProc;
    sp_T_Emp1emp_id: TStringField;
    cmd_Temp: TADOCommand;
    qry_Temp: TADOQuery;
    qry_mon_Qemp_id: TStringField;
    qry_mon_Qdut_mon: TStringField;
    qry_mon_Qclas_code: TStringField;
    qry_mon_Qday01: TStringField;
    qry_mon_Qday02: TStringField;
    qry_mon_Qday03: TStringField;
    qry_mon_Qday04: TStringField;
    qry_mon_Qday05: TStringField;
    qry_mon_Qday06: TStringField;
    qry_mon_Qday07: TStringField;
    qry_mon_Qday08: TStringField;
    qry_mon_Qday09: TStringField;
    qry_mon_Qday10: TStringField;
    qry_mon_Qday11: TStringField;
    qry_mon_Qday12: TStringField;
    qry_mon_Qday13: TStringField;
    qry_mon_Qday14: TStringField;
    qry_mon_Qday15: TStringField;
    qry_mon_Qday16: TStringField;
    qry_mon_Qday17: TStringField;
    qry_mon_Qday18: TStringField;
    qry_mon_Qday19: TStringField;
    qry_mon_Qday20: TStringField;
    qry_mon_Qday21: TStringField;
    qry_mon_Qday22: TStringField;
    qry_mon_Qday23: TStringField;
    qry_mon_Qday24: TStringField;
    qry_mon_Qday25: TStringField;
    qry_mon_Qday26: TStringField;
    qry_mon_Qday27: TStringField;
    qry_mon_Qday28: TStringField;
    qry_mon_Qday29: TStringField;
    qry_mon_Qday30: TStringField;
    qry_mon_Qday31: TStringField;
    qry_mon_Qupd_user: TStringField;
    qry_mon_Qupd_date: TDateTimeField;
    ADOQuery1: TADOQuery;
    qry_mon_Qclas_name: TTntWideStringField;
    TntPageControl1: TTntPageControl;
    TntTabSheet2: TTntTabSheet;
    TntPanel2: TTntPanel;
    TntGroupBox4: TTntGroupBox;
    dbg_Dut2_Q: TTntDBGrid;
    dbg_Dut1_Q: TTntDBGrid;
    TntTabSheet3: TTntTabSheet;
    TntPanel3: TTntPanel;
    TntPanel4: TTntPanel;
    TntGroupBox2: TTntGroupBox;
    TntLabel17: TTntLabel;
    TntLabel18: TTntLabel;
    cob_Dept_begin: TTntComboBox;
    EditEmpBeg_T: TTntEdit;
    EditEmpEnd_T: TTntEdit;
    cob_Dept_end: TTntComboBox;
    TntGroupBox1: TTntGroupBox;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    dp_DateBeg_T: TTntDateTimePicker;
    dp_DateEnd_T: TTntDateTimePicker;
    TntStaticText1: TTntStaticText;
    BBtn_Tran: TTntBitBtn;
    TntPanel6: TTntPanel;
    TntGroupBox3: TTntGroupBox;
    TntLabel3: TTntLabel;
    TntLabel6: TTntLabel;
    TntLabel19: TTntLabel;
    TntLabel20: TTntLabel;
    TntLabel21: TTntLabel;
    TntLabel22: TTntLabel;
    EditEmp_Q: TTntEdit;
    me_Month_Q: TMaskEdit;
    EditEmpDept_Q: TTntEdit;
    EditEmpName_Q: TTntEdit;
    EditEmpCard_Q: TTntEdit;
    EditEmpPst_Q: TTntEdit;
    bbtn_OK: TTntBitBtn;
    bbtn_Reset: TTntBitBtn;
    TntBitBtn1: TTntBitBtn;
    sb_FindEmp: TTntSpeedButton;
    sb_EmpBeg: TTntSpeedButton;
    sb_EmpEnd: TTntSpeedButton;
    sp_T_Emp1epledt: TDateTimeField;
    ADOQueryEmp: TADOQuery;
    ADOQueryEmpemp_id: TStringField;
    ADOQueryEmpepindt: TDateTimeField;
    ADOQueryEmpepledt: TDateTimeField;
    pb_tran: TTntProgressBar;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    rb_ByEmp_T: TCheckBox;
    rb_ByDept_T: TCheckBox;
    TntStatusBar1: TTntStatusBar;
    Panel1: TPanel;
    sb_Print: TTntSpeedButton;
    sb_Add: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Close: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    TntLabel4: TTntLabel;
    EditIndt: TTntEdit;
    TntLabel5: TTntLabel;
    EditLedt: TTntEdit;
    sp_T_Emp1epindt: TDateTimeField;
    qry_mon_QC: TADOQuery;
    {���@����}
    function GetPstName(pst_code:String):WideString;
    function GetDeptName(DeptCode,EditMon:String):WideString;
    procedure InitLangInfo;
    procedure InitInputDate;
    {���ɵ{�ǳ���}
    procedure CheckTranInput;
    procedure DelDayInMonth(empId:string);
    function  CheckDate(aDate:TDateTime):Boolean;
    function  TakeTime(clas_code:string;pre_Time:string=''):String;
    procedure AddMonRecord(empId,clas:string);
    procedure BBtn_TranClick(Sender: TObject);
    procedure rb_ByEmp_T2Click(Sender: TObject);
    procedure rb_ByDept_T2Click(Sender: TObject);
    procedure DealDutClas(emp_id,clas_code,DutTime:String;dut_day:TDateTime);
    procedure DealDutLate(emp_id:String;LateTimes:Integer;dut_day:TDateTime);
    procedure DealDutEarly(emp_id:String;EarlyTimes:Integer;dut_day:TDateTime);
    procedure CheckSpcClas(empid:string;LateTimes,EarlyTimes,AbTimes:integer);
    //procedure TntTabSheet3Show(Sender: TObject);
    procedure TntTabSheet2Show(Sender: TObject);
    procedure me_Month_QExit(Sender: TObject);
    procedure EditEmp_QChange(Sender: TObject);
    procedure me_Month_QChange(Sender: TObject);
    procedure bbtn_OKClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure qry_mon_QAfterScroll(DataSet: TDataSet);
    procedure SetTotalValue;
    procedure qry_mon_QAfterDelete(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qry_mon_QAfterPost(DataSet: TDataSet);
    procedure sb_SaveClick(Sender: TObject);
    procedure qry_mon_QBeforePost(DataSet: TDataSet);
    procedure bbtn_ResetClick(Sender: TObject);
    procedure qry_mon_QAfterClose(DataSet: TDataSet);
    procedure dbg_Dut1_QKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_Dut2_QKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qry_mon_Qday01SetText(Sender: TField; const Text: String);
    procedure sb_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_AddClick(Sender: TObject);
    procedure qry_mon_QAfterEdit(DataSet: TDataSet);
    procedure qry_mon_QAfterInsert(DataSet: TDataSet);
    procedure TntBitBtn1Click(Sender: TObject);
    procedure sb_FindEmpClick(Sender: TObject);
    procedure sb_EmpBegClick(Sender: TObject);
    procedure sb_EmpEndClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure qry_mon_QAfterOpen(DataSet: TDataSet);
    procedure dbg_Dut1_QColExit(Sender: TObject);
    procedure dbg_Dut1_QCellClick(Column: TColumn);
    procedure sb_PrintClick(Sender: TObject);
    procedure qry_mon_Qclas_codeChange(Sender: TField);

    function DealHhMm(DutTime:String):string; //2011-10-01 hyt add
    function FenxiAsk(StdStartTime,StdEndTime,sSql:string):boolean;
    procedure EditEmpBeg_TChange(Sender: TObject);
    procedure cob_Dept_beginChange(Sender: TObject); //2011-11-02 hyt add
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut13: TFormDut13;
  RunThread :TRunThread;
  LateArr,EarlyArr:TMonArr;//���A���h
  Ab_Arr:TMonArr2;//���`
  PrvPrt,PrvAdd,PrvDel,PrvTran,PrvUpd:boolean;
  ws_Words:TWideStrings;
  Date_Begin,Date_end:TDateTime;
  emp_id,dut_mon,clas_code:string;
  G_sEmpWrkDate:string;
  ConnErrorCount:integer;//�s�����~����

implementation
uses
  UnitDMHrdsys,UnitHrdUtils;
{$R *.dfm}
{���@����}
procedure TFormDut13.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  SetComponentLang(self);//set component language text
  ThisFormUsedWords:='dut13_titl,dut13_titl_2,hours,minues,msg_slt_query_conidition,'+
    'hrd07_error1,not_find_data,tran_success,tran_fail,unknown_errors,cls_hol_name,total,'+
    'hours,minutes,dut13_error1,dut13_error2,dut13_error3,dut13_error4,'
    +'msg_confirm_cancel2,by_empid,by_deptcode,msg_month_data_locked,';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
  rb_ByEmp_T.Caption:=GetLangName(ws_Words,'by_empid');
  rb_ByDept_T.Caption:=GetLangName(ws_Words,'by_deptcode');
end;

procedure TFormDut13.InitInputDate;
//��l�����ɤ��
begin
  GetDeptRange(cob_Dept_begin);
  GetDeptRange(cob_Dept_end);
  dp_DateBeg_T.Date:=EnCodeDate(YearOf(now-4),MonthOf(now-4),1);
  dp_DateEnd_T.Date:=EnCodeDate(YearOf(now-4),MonthOf(now-4),DaysInMonth(date-4));
end;

procedure TFormDut13.FormCreate(Sender: TObject);
const
  FORM_ID='dut13';
var
  PrvArr:TPrvArr;
begin
  //��l��,���Τ��ӵe���֦����v��
  PrvArr:=GetPrvArr(UserName,FORM_ID);
  //�C�L�v��
  PrvPrt:=PrvArr[Prt];
  //�s�W�v��
  PrvAdd:=PrvArr[ADD];
  //�R���v��
  PrvDel:=PrvArr[DEL];
  //�ק��v��
  PrvUpd:=PrvArr[UPD];
  //���ɥ���
  PrvTran:=PrvArr[TRAN];
  if not PrvTran then
    TntTabSheet3.TabVisible:=false;
  if (not PrvArr[INQ]) and (not PrvAdd) and (not PrvDel) and (not PrvUpd) then
    TntTabSheet2.TabVisible:=false;
  if (not PrvArr[UPD]) or (not PrvArr[ADD]) then
  begin
    qry_mon_Q.Fields.FindField('clas_name').ReadOnly:=true;
    dbg_Dut1_Q.ReadOnly:=true;
    dbg_Dut2_Q.ReadOnly:=true;
  end;
  InitLangInfo;
  InitInputDate;
end;

function TFormDut13.GetPstName(pst_code:String):WideString;
//GetPstName--�o��¾�٦W��
begin
//
end;

function TFormDut13.GetDeptName(DeptCode,EditMon:String):WideString;
//GetDeptName--�o�쳡���W��
var
  DeptName:String;
begin
  if UserLang='C' then
    DeptName:='abbr_titl'
  else if UserLang='V' then
    DeptName:='vim_abbr'
  else
    DeptName:='eng_abbr';
  if DeptCode='' then
  begin
    Result:='';
    exit;
  end;
  with DMHrdsys.ADOStoredProc1 do
  begin
    Close;
    ProcedureName:='proc_dept';
    Parameters.Clear;
    Parameters.CreateParameter('@dept_begin',ftString,pdInput,6,DeptCode);
    Parameters.CreateParameter('@dept_end',ftString,pdInput,6,DeptCode);
    Parameters.CreateParameter('@year_month',ftString,pdInput,6,EditMon);
    Prepared:=true;
    Open;
    if not Eof then
      Result:=DeptCode+'--'+FieldByName('abbr_titl').Value
    else
      Result:='';
    Close;
  end;
end;
{*******************************************************************************}
{                ���ɵ{�ǳ���                                                   }
{*******************************************************************************}
{===============================================================================
  �p��b�Z�ɶ�
===============================================================================}
function TFormDut13.TakeTime(clas_code:string;pre_Time:string=''):String;
var
  sSql,StdStartTime,StdEndTime,WorkTime:String;
  WorkHour,WorkMinu,tmp,last_hour,last_min,this_hour,this_min:Integer;
begin
  if pre_Time<>'' then
  begin//�W���ɶ���p
    last_hour:=StrToInt(LeftStr(pre_Time,2));
    last_min:=StrToInt(RightStr(pre_Time,2));
  end
  else
  begin
    last_hour:=0;
    last_min:=0;
  end;
  StdStartTime:=qry_DutDay.FieldByName('s_start').AsString;
  StdEndTime:=qry_DutDay.FieldByName('s_end').AsString;

  sSql:='select emp_id from hrd_dut_day where '+G_sEmpWrkDate+' '+
        'and clas_code in(''12'') and s_start='''+StdEndTime+''' ';
     //(clas_code>='61') and //���i�H�[�]�����I�� �Шư����H �b��ҶԤ��N��{7�Ӥp���٬O�n�S���B�z

  //if (clas_code<='63') then //��Z,���Z,�߯Z ==>�ثe���u�勵�`�Z�����p�Ӥ��R 2011-11-30 hyt aa
  //2015.05.05�������W�Z7�p�ɡA���u�����p�A�G�W�[��64��
  if (clas_code<='64') then //��Z,���Z,�߯Z ==>�ثe���u�勵�`�Z�����p�Ӥ��R 2011-11-30 hyt aa
  begin
    if (StdStartTime='1230') and (StdEndTime='1530') and (not FenxiAsk(StdStartTime,StdEndTime,sSql))  then
    begin
      WorkHour:=4;
      WorkMinu:=0;
    end
    else if (StdStartTime='1200') and (StdEndTime='1500') and (not FenxiAsk(StdStartTime,StdEndTime,sSql)) then
    begin
      WorkHour:=4;
      WorkMinu:=0;
    end
    else if (StdStartTime='1230') and (StdEndTime='1500') and (not FenxiAsk(StdStartTime,StdEndTime,sSql)) then
    begin    //2011-10-28 hyt add  7Hours==>8Hours
      WorkHour:=3; //2.5+1
      WorkMinu:=30;
    end
    {else if (StdStartTime='1900') and (StdEndTime='2300') then
    begin
      WorkHour:=5;
      WorkMinu:=0;
    end
    else if (StdStartTime='2000') and (StdEndTime='2400') then
    begin
      WorkHour:=5;
      WorkMinu:=0;
    end}
    else if TryStrToInt(LeftStr(StdEndTime,2),tmp) then
    begin
      WorkHour:=StrToInt(LeftStr(StdEndTime,2))-StrToInt(LeftStr(StdStartTime,2));
      WorkMinu:=StrToInt(RightStr(StdEndTime,2))-StrToInt(RightStr(StdStartTime,2));
    end;
  end
  else if TryStrToInt(LeftStr(StdEndTime,2),tmp) then
  begin
      WorkHour:=StrToInt(LeftStr(StdEndTime,2))-StrToInt(LeftStr(StdStartTime,2));
      WorkMinu:=StrToInt(RightStr(StdEndTime,2))-StrToInt(RightStr(StdStartTime,2));
  end;

  if WorkMinu<0 then
  begin
    WorkHour:=WorkHour-1;
    WorkMinu:=WorkMinu+60;
  end;
  //��p�����Z�ɶ�
  this_hour:=WorkHour+last_hour;
  this_min:=WorkMinu+last_min;
  if this_min>=60 then
  begin//�p�ɶi��
    this_hour:=this_hour+1;
    this_min:=this_min-60;
  end;
  if this_hour<0 then
    WorkTime:=''
  else
    WorkTime:=Format('%.2d',[this_hour])+Format('%.2d',[this_min]);
  Result:=WorkTime;
end;
//���R �ɬq��᭱�O�_���а������p   2011-11-02 hyt add
function TFormDut13.FenxiAsk(StdStartTime,StdEndTime,sSql:string):boolean;
begin
  if (StdStartTime='1230') and (StdEndTime='1530') then
    result:=DB_SeekRecord(sSql)
  else if (StdStartTime='1200') and (StdEndTime='1500') then
    result:=DB_SeekRecord(sSql)
  else if (StdStartTime='1230') and (StdEndTime='1500') then
    result:=DB_SeekRecord(sSql)
  else
    result:=true;
end;

{===============================================================================
  DealDutClas--�B�zHH MM 2011-10-01 hyt add
===============================================================================}
function TFormDut13.DealHhMm(DutTime:String):string;
var
  WorkTime:String;
  WorkHour,WorkMinu:Integer;
begin
  WorkHour:=StrToInt(LeftStr(DutTime,2));
  WorkMinu:=StrToInt(RightStr(DutTime,2));

  if WorkMinu>=60 then
  begin//�p�ɶi��
    WorkHour:=WorkHour+1;
    WorkMinu:=WorkMinu-60;

    WorkTime:=Format('%.2d',[WorkHour])+Format('%.2d',[WorkMinu]);
  end
  else
  begin
    WorkTime:=DutTime;
  end;

  Result:=WorkTime;

end;
{===============================================================================
  DealDutClas--�B�z��Ҷ� �A���Ҷ�
===============================================================================}
procedure TFormDut13.DealDutClas(emp_id,clas_code,DutTime:String;dut_day:TDateTime);
var
  aSQL:String;
  CurDateTime:TDateTime;
  clMinu,clHour:Integer;
begin
  //���o���
  CurDateTime:=GetServerDateTime;
  //�d�߸Ӥ�ӯZ�O���
  aSQL:='SELECT * FROM hrd_dut_mon WHERE emp_id='''+emp_id+''' AND dut_mon='''+
    FormatDateTime('yyyymm',dut_day)+''' AND clas_code='''+clas_code+'''';
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    if not EOF then
    begin
      //�Y�Ӥ�s�b�ӭ��u�ӯZ�O��ơA�[�J�����ɶ�
      while not EOF do
      begin
        if (VarIsNull(FieldByName('day'+FormatDateTime('dd',dut_day)).Value)) or
         (Trim(FieldByName('day'+FormatDateTime('dd',dut_day)).AsString)='') then
        begin
          //�p�G���e��Ƭ��šA�u�[�J���Ѹ��
          clHour:=StrToInt(LeftStr(DutTime,2));
          clMinu:=StrToInt(RightStr(DutTime,2));
        end
        else begin
          //�_�h�[�W���e���
          clHour:=StrToInt(LeftStr(FieldByName('day'+FormatDateTime('dd',dut_day)).AsString,2))+
            StrToInt(LeftStr(DutTime,2));
          clMinu:=StrToInt(RightStr(FieldByName('day'+FormatDateTime('dd',dut_day)).AsString,2))+
            StrToInt(RightStr(DutTime,2));
        end;
        if clMinu>=60 then
        begin
          clMinu:=clMinu-60;
          clHour:=clHour+1;
        end;
        Edit;
        FieldByName('upd_user').AsString:=UserName;
        FieldByName('upd_date').Value:=CurDateTime;
        FieldByName('day'+FormatDateTime('dd',dut_day)).AsString:=Format('%.2d',[clHour])+Format('%.2d',[clMinu]);
        Post;
        Next;
      end;
    end
    else begin
      //���s�b�A�s�W��clas_code
      Append;
      FieldByName('upd_user').AsString:=UserName;
      FieldByName('upd_date').Value:=CurDateTime;
      FieldByName('emp_id').AsString:=emp_id;
      FieldByName('dut_mon').AsString:=FormatDateTime('yyyymm',dut_day);
      FieldByName('clas_code').AsString:=clas_Code;
      FieldByName('day'+FormatDateTime('dd',dut_day)).AsString:=DutTime;
      Post;
    end;
    Close;
  end;
end;
{===============================================================================
  DealDutLate---�B�z���
===============================================================================}
procedure TFormDut13.DealDutLate(emp_id:String;LateTimes:Integer;dut_day:TDateTime);
var
  aSQL:String;
  CurDateTime:TDateTime;
begin
  if LateTimes=0 then exit;
  CurDateTime:=GetServerDateTime;
  aSQL:='SELECT * FROM hrd_dut_mon WHERE emp_id='''+emp_id+''' AND dut_mon='''+
    FormatDateTime('yyyymm',dut_day)+''' AND clas_code=''04''';
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    if not EOF then
    begin
      Edit;
      FieldByName('upd_user').Value:=UserName;
      FieldByName('upd_date').Value:=CurDateTime;
      FieldByName('day'+FormatDateTime('dd',dut_day)).Value:=IntToStr(LateTimes);
      Post;
    end
    else begin
      Append;
      FieldByName('upd_user').Value:=UserName;
      FieldByName('upd_date').Value:=CurDateTime;
      FieldByName('emp_id').Value:=emp_id;
      FieldByName('dut_mon').Value:=FormatDateTime('yyyymm',dut_day);
      FieldByName('clas_code').Value:='04';
      FieldByName('day'+FormatDateTime('dd',dut_day)).Value:=IntToStr(LateTimes);
      Post;
    end;
    Close;
  end;
end;
{===============================================================================
  DealDutEarly ---�B�z���h
===============================================================================}
procedure TFormDut13.DealDutEarly(emp_id:String;EarlyTimes:Integer;dut_day:TDateTime);
var
  aSQL:String;
  CurDateTime:TDateTime;
begin
  if EarlyTimes=0 then exit;
    CurDateTime:=GetServerDateTime;
  aSQL:='SELECT * FROM hrd_dut_mon WHERE emp_id='''+emp_id+''' AND dut_mon='''+
    FormatDateTime('yyyymm',dut_day)+''' AND clas_code=''05''';
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    if not EOF then
    begin
      Edit;
      FieldByName('upd_user').Value:=UserName;
      FieldByName('upd_date').Value:=CurDateTime;
      FieldByName('day'+FormatDateTime('dd',dut_day)).Value:=IntToStr(EarlyTimes);
      Post;
    end
    else begin
      Append;
      FieldByName('upd_user').Value:=UserName;
      FieldByName('upd_date').Value:=CurDateTime;
      FieldByName('emp_id').Value:=emp_id;
      FieldByName('dut_mon').Value:=FormatDateTime('yyyymm',dut_day);
      FieldByName('clas_code').Value:='05';
      FieldByName('day'+FormatDateTime('dd',dut_day)).Value:=IntToStr(EarlyTimes);
      Post;
    end;
    Close;
  end;
end;
{===============================================================================
  �ˬd��J�O�_���T
===============================================================================}
procedure TFormDut13.CheckTranInput;
begin
  //��_���X�k
  if (not CheckDate(dp_DateBeg_T.Date)) or (not CheckDate(dp_DateEnd_T.Date)) then
    Abort;
  if (not rb_ByEmp_T.Checked) and (not rb_ByDept_T.Checked) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_slt_query_conidition'),mtError,[mbYes],0);
    abort;
  end;
  if  rb_ByEmp_T.Checked then
  begin
    if (Trim(EditEmpBeg_T.Text)='') and (Trim(EditEmpEnd_T.Text)='') then
    begin
      WideMessageDlg(GetLangName(ws_Words,'hrd07_error1'),mtError,[mbYes],0);
      abort;
    end;
  end;
  if rb_ByDept_T.Checked then
  begin
    if (Trim(cob_Dept_begin.Text)='') and (Trim(cob_Dept_end.Text)='') then
    begin
      WideMessageDlg(GetLangName(ws_Words,'hrd07_error1'),mtError,[mbYes],0);
      abort;
    end;
  end;
end;
{===============================================================================
  �ˬd��J����O�_���T
===============================================================================}
function TFormDut13.CheckDate(aDate:TDateTime):Boolean;
var
  ServerDateTime:TDateTime;
begin
  //���A�Ⱦ����e�ɶ�
  ServerDateTime:=GetServerDateTime;
  result:=true;
  //�Ӥ��Ƥw�g��w
  if (formatDateTime('yyyymm',aDate)<=LockMonthPart) and (UserName<>DebugUser) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
    result:=false;
  end
  {//�Y����W�L10��A����u�ର����
  else if (DayOf(ServerDateTime)>=10) and (MonthOf(ServerDateTime)<>MonthOf(aDate)) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'dut13_error1'),mtError,[mbYes],0);
    result:=false;
  end}
  //�������W�L���e����A���ର��
  // 2011.01.17  del �Ȯɨ��� <<
 // else if (CompareDate(aDate,DateOf(ServerDateTime))=1) or (trim(DateTimeToStr(aDate))='')  then
//  begin
 //   WideMessageDlg(GetLangName(ws_Words,'dut13_error2'),mtError,[mbYes],0);
 //   result:=false;
//  end
  // 2011.01.17 del >>
  //���ର�e���
//  else if MonthOf(ServerDateTime)-MonthOf(aDate)+12*(YearOf(ServerDateTime)-YearOf(aDate))>1 then
//  begin
//    WideMessageDlg(GetLangName(ws_Words,'dut13_error3'),mtError,[mbYes],0);
//    result:=false;
//  end
  //�_���������P��
  else if (YearOf(dp_DateBeg_T.Date)<>YearOf(dp_DateEnd_T.Date)) or
    (MonthOf(dp_DateBeg_T.Date)<>MonthOf(dp_DateEnd_T.Date)) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'dut13_error4'),mtError,[mbYes],0);
    result:=false;
  end
  //����_�n�p������
  else if dp_DateBeg_T.Date>dp_DateEnd_T.Date then
  begin
    WideMessageDlg(GetLangName(ws_Words,'dut13_error4'),mtError,[mbYes],0);
    result:=false;
  end;
end;
{===============================================================================
  ���ɾާ@�}�l
===============================================================================}
procedure TFormDut13.bbtn_TranClick(Sender: TObject);
begin
  Date_begin:=DateOf(dp_DateBeg_T.Date);
  Date_End:=DateOf(dp_DateEnd_T.Date);
  //�ˬd��J�O�_���T
  CheckTranInput;
  dut_mon:=FormatDateTime('yyyymm',Date_begin);
  ConnErrorCount:=0;
  //�s�}���ɽu�{
  RunThread := TRunThread.Create(false);
end;
{===============================================================================
  �������ɾާ@
===============================================================================}
procedure TFormDut13.TntBitBtn1Click(Sender: TObject);
begin
 if (RunThread<>nil) and (not RunThread.Terminated) then
  begin
    RunThread.Suspend;
    if WideMessageDlg(GetLangName(ws_Words,'msg_confirm_cancel2'),mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      RunThread.Resume;
      RunThread.Terminate;
    end
    else
      RunThread.Resume;
  end;
end;
{==============================================================================
  ��ܫ����u�d��
===============================================================================}
procedure TFormDut13.rb_ByEmp_T2Click(Sender: TObject);
begin
  EditEmpBeg_T.Enabled:=true;
  sb_EmpBeg.Enabled:=true;
  EditEmpEnd_T.Enabled:=true;
  sb_EmpEnd.Enabled:=true;
  cob_Dept_begin.Enabled:=false;
  cob_Dept_end.Enabled:=false;
end;
{===============================================================================
  ��ܫ������d��
===============================================================================}
procedure TFormDut13.rb_ByDept_T2Click(Sender: TObject);
begin
  EditEmpBeg_T.Enabled:=false;
  sb_EmpBeg.Enabled:=false;
  EditEmpEnd_T.Enabled:=false;
  sb_EmpEnd.Enabled:=false;
  cob_Dept_begin.Enabled:=true;
  cob_Dept_end.Enabled:=true;
end;

{===============================================================================
  �u�{����
===============================================================================}
procedure TRunThread.execute;
var
  aSQL,DutTime,AbTime,clas_code,pre_clas,the_day,pre_day,fld_day,pre_emp,emp_str:String;
  count1,LateTimes,EarlyTimes,AbTimes,Aday,i, abshour:Integer;
  CurTime:TDateTime;
  Formdut13:TFormdut13;
begin
  FreeOnTerminate := true;
  Formdut13:=TFormdut13(Application.FindComponent('Formdut13'));
  with FormDut13 do
  begin
    BBtn_Tran.Enabled:=false;
    //�o��d�߽d�򤺪����u
    //GetTranEmp;
    emp_str:='';
    if rb_ByEmp_T.Checked then
      emp_str:=emp_str+' and emp_id>='''+EditEmpBeg_T.Text+''' and emp_id<='''+EditEmpEnd_T.Text+'''';
    if rb_ByDept_T.Checked then
    begin
      emp_str:=emp_str+' and emp_id in(select emp_id from hrd_emp where '
        +' dept_code >='''+LeftStr(cob_Dept_begin.Text,6)+''''
        +' and dept_code <='''+LeftStr(cob_Dept_end.Text,6)+''' )';
    end
    else
    begin
      emp_str := emp_str + ' and emp_id in(select emp_id from hrd_emp where '+G_sFactorySql+') ' ; //2012-09-07 hyt add
    end;

    //�d�����d�򤺦ҶԬ���
    aSQL:='SELECT * FROM hrd_dut_day WHERE 1=1 '+emp_str
      +' and wrk_date>='''+FormatDateTime('yyyy/mm/dd',Date_Begin)+''''
      +' and wrk_date<='''+FormatDateTime('yyyy/mm/dd',Date_End)+''''
      +' order by emp_id,clas_code,wrk_date';
    TntStatusBar1.SimpleText:='���b���}�ҶԤ���...';
//    try
    with qry_DutDay do
    begin
      Close;
      SQL.Clear;
      SQL.Add(aSQL);
      try
        Open;
      except//�_�}�s��
        Memo1.Lines.Add('cannot open database');
        RunThread.Terminate;
        Exit;
      end;
//      try
      DMHrdsys.conn.BeginTrans;
      if not EOF then
      begin
        //�i����̤j�̤p�ȳ]�w
        pb_tran.Min := 0;
        pb_tran.Max :=RecordCount;
        //��l���ܶq
        count1:=0;
        LateTimes:=0;
        EarlyTimes:=0;
        AbTimes:=0;
        pre_clas:='';
        pre_day:='';
        pre_emp:='';
        abshour := 0; 
        i:=1;
        for i:=1 to 31 do
        begin
          EarlyArr[i]:=0;
          LateArr[i]:=0;
          Ab_Arr[i]:='';
        end;
        while not EOF do
        begin
          try
          pb_tran.StepBy(1);
          Inc(count1);
          TntStatusBar1.SimpleText:='���b���ɡA�еy�J...   �B�z��  '+IntToStr(count1)+'/'+IntToStr(pb_tran.Max)+'  ���O���A���e�u��'+emp_id;
          if Terminated then
          begin//�i�{�����A�h�X
            DMHrdsys.conn.RollbackTrans;
            pb_tran.Position:=0;
            BBtn_Tran.Enabled:=true;
            TntStatusBar1.SimpleText:='';
            qry_Temp.Active:=false;
            Break;
            Exit;
          end;
          emp_id:=FieldByName('emp_id').AsString;
          clas_code:=FieldByName('clas_code').AsString;
          the_day:=FormatDateTime('dd',FieldByName('wrk_date').asDateTime);
          Aday:=StrToInt(the_day);
          fld_day:='day'+the_day;
          G_sEmpWrkDate:='emp_id='''+emp_id+''' '+
                         'and wrk_date='''+FormatDatetime('yyyy/mm/dd',FieldByName('wrk_date').asDateTime)+''' ';
          if (pre_emp<>emp_id) then
          begin
            CheckSpcClas(pre_emp,LateTimes,EarlyTimes,AbTimes);//�ˬd�W�@�Ӥu���O�_����즭�h���`
            DMHrdsys.conn.CommitTrans;
            //�}�l�B�z�s���u��
            DMHrdsys.conn.BeginTrans;//�}�l�s���ư�
            LateTimes:=0;
            EarlyTimes:=0;
            AbTimes:=0;
            //�R�����u�ҶԤ��ɤ���d�򤺪��Ҧ��O��(�@�Ӥu���B�z�@��)
            DelDayInMonth(emp_Id);
            //DelDayInMonth(aDay);
            {with DMHrdSys.ADOCommand1 do
            begin
              CommandText:='delete from hrd_dut_mon where emp_id='''+emp_id+''' and dut_mon='''+dut_mon+'''';
              Execute;
            end;}
          end;
          if (pre_emp<>emp_id) or (pre_clas<>clas_code) or (pre_day<>the_day) then
          begin//���m
            DutTime:='0000';
            AbTime:='';
          end;
          //��p�W�Z�ɶ�
          if trim(FieldByName('wrk_sts').AsString)<>'06' then
            DutTime:=TakeTime(clas_code,DutTime);
          if (pre_emp<>emp_id) or (pre_clas<>clas_code) then
            AddMonRecord(emp_id,clas_code);//���ɷs�W�@���O��(���u���M�Z�O)
          qry_Temp.FieldByName(fld_day).AsString:=DutTime;//�ק�ƾ�
          //��즸�ƥ[1
          if trim(FieldByName('late').AsString)<>'' then
          begin
            LateTimes:=LateTimes+1;
            LateArr[Aday]:=LateArr[Aday]+1;
          end;
          //���h���ƥ[1
          if trim(FieldByName('early').AsString)<>'' then
          begin
            EarlyTimes:=EarlyTimes+1;
            EarlyArr[Aday]:=EarlyArr[Aday]+1;
          end;
          //���`�B�z
          if trim(FieldByName('wrk_sts').AsString)='06' then
          begin
            AbTimes:=AbTimes+1;
            AbTime:=TakeTime(AbTime);
            abshour := 0 ;
            if ( Ab_Arr[Aday] <> '' )   then
               abshour := strtoint( Ab_Arr[Aday] ) ;
               Ab_Arr[Aday]:=Format('%.4d',[abshour+strtoint(AbTime)]);
               
               Ab_Arr[Aday]:=DealHhMm(Ab_Arr[Aday]); //2011-10-01 hyt add exp:0760==>0800
           // Ab_Arr[Aday]:=AbTime;

            //qry_Temp.FieldByName(fld_day).AsString:='0000';//��گZ�O�ɶ��ܬ�0
          end;
        except
          Memo1.Lines.Add('Error:'+emp_id+'--'+the_day+'day--'+clas_code);
        end;//end try
          pre_emp:=FieldByName('emp_id').AsString;
          pre_clas:=FieldByName('clas_code').AsString;
          pre_day:=FormatDateTime('dd',FieldByName('wrk_date').asDateTime);
          Next;
        end;//end while
        CheckSpcClas(pre_emp,LateTimes,EarlyTimes,AbTimes);
        qry_Temp.Post;
      end;//if not Eof
      Close;
    end;//with qry_DutDay
    DMHrdsys.conn.CommitTrans;
    messageboxW(0,PWideChar(GetLangName(ws_Words,'tran_success')),'���ܫH��',mb_iconinformation);
    //except
      //���ɥ��ѡA��^
    //  messageboxW(0,PWideChar(GetLangName(ws_Words,'tran_fail')),'���ܫH��',mb_iconinformation);
    //end;
    pb_tran.Position:=0;
    TntStatusBar1.SimpleText:='';
    BBtn_Tran.Enabled:=true;
    qry_Temp.Close;
  end;//with FormDut13
  Terminate;
end;


procedure TFormDut13.sb_EmpBegClick(Sender: TObject);
var
  aEmpId:String;
begin
  aEmpId:=FindEmpId('emp_id',me_Month_Q.Text);
  if aEmpId<>'' then
    EditEmpBeg_T.Text:=aEmpId;
end;

procedure TFormDut13.sb_EmpEndClick(Sender: TObject);
var
  aEmpId:String;
begin
  aEmpId:=FindEmpId('emp_id',me_Month_Q.Text);
  if aEmpId<>'' then
    EditEmpEnd_T.Text:=aEmpId;
end;
{*******************************************************************************
      �d�߳���
*******************************************************************************}
{==============================================================================
  �d�߬ɭ���ܪ�l��
===============================================================================}
procedure TFormDut13.TntTabSheet2Show(Sender: TObject);
begin
  if me_Month_Q.Enabled then
  begin
    me_Month_Q.Text:=FormatDateTime('yyyymm',date-5);
    me_Month_Q.SelectAll;
    me_Month_Q.SetFocus;
  end;
end;
{==============================================================================
  ��J����h�X���ˬd������T��
===============================================================================}
procedure TFormDut13.me_Month_QExit(Sender: TObject);
var
  aDate:TDateTime;
  i,MaxDay:Integer;
begin
  if Length(me_Month_Q.Text)<6 then
  begin
    WideMessageDlg('�п�J�d�ߤ���A���T�榡��''yyyy/mm'',�p2005/08',mtError,[mbYes],0);
    me_Month_Q.SelectAll;
    me_Month_Q.SetFocus;
    abort;
  end;
  if not TryEncodeDate(StrToInt(LeftStr(me_Month_Q.Text,4)),StrToInt(RightStr(me_Month_Q.Text,2)),1,aDate) then
  begin
    WideMessageDlg('�п�J�d�ߤ���A���T�榡��''yyyy/mm'',�p2005/08',mtError,[mbYes],0);
    me_Month_Q.SelectAll;
    me_Month_Q.SetFocus;
    abort;
  end;
  MaxDay:=DaysInAMonth(StrToInt(LeftStr(me_Month_Q.Text,4)),StrToInt(RightStr(me_Month_Q.Text,2)));
  case MaxDay of
    28:
       begin
         dbg_Dut2_Q.Columns.Items[14].Visible:=false;//29��
         dbg_Dut2_Q.Columns.Items[15].Visible:=false;//30
         dbg_Dut2_Q.Columns.Items[16].Visible:=false;//31
       end;
    29:
       begin
         dbg_Dut2_Q.Columns.Items[14].Visible:=true;//29��
         dbg_Dut2_Q.Columns.Items[15].Visible:=false;//30
         dbg_Dut2_Q.Columns.Items[16].Visible:=false;//31
       end;
    30:
       begin
         dbg_Dut2_Q.Columns.Items[14].Visible:=true;//29��
         dbg_Dut2_Q.Columns.Items[15].Visible:=true;//30
         dbg_Dut2_Q.Columns.Items[16].Visible:=false;//31
       end;
    31:
       begin
         dbg_Dut2_Q.Columns.Items[14].Visible:=true;//29��
         dbg_Dut2_Q.Columns.Items[15].Visible:=true;//30
         dbg_Dut2_Q.Columns.Items[16].Visible:=true;//31
       end;
  else
    begin
      WideMessageDlg('�п�J�d�ߤ���A���T�榡��''yyyy/mm'',�p2005/08',mtError,[mbYes],0);
      me_Month_Q.SelectAll;
      me_Month_Q.SetFocus;
      abort;
    end;
  end;
  for i:=1 to MaxDay do
  begin
    if DayOfWeek(EncodeDate(StrToInt(LeftStr(me_Month_Q.Text,4)),StrToInt(RightStr(me_Month_Q.Text,2)),i))=1 then
    begin
      if i<=15 then
        dbg_Dut1_Q.Columns[i].Color:=clMoneyGreen
      else
        dbg_Dut2_Q.Columns[i-15].Color:=clMoneyGreen;
    end
    else begin
      if i<=15 then
        dbg_Dut1_Q.Columns[i].Color:=clWindow
      else
        dbg_Dut2_Q.Columns[i-15].Color:=clWindow;
    end;
  end;
end;
{===============================================================================
   ���u��J�A��ܭ��u�H��
===============================================================================}
procedure TFormDut13.EditEmp_QChange(Sender: TObject);
var
  EmpInfo:TFields;
begin
  EditEmpName_Q.Text:='';
  EditEmpCard_Q.Text:='';
  EditEmpPst_Q.Text:='';
  EditEmpDept_Q.Text:='';
  EditIndt.Text:='';
  EditLedt.Text:='';
  bbtn_OK.Enabled:=false;
  if Length(EditEmp_Q.Text)<6 then exit;
  EmpInfo:=GetEmpInfo(EditEmp_Q.Text,me_Month_Q.Text);
  if EmpInfo.FieldByName('emp_id').AsString='' then
  begin
    MessageDlg('�ӭ��u���s�b�I',mtError,[mbYes],0);
    EditEmp_Q.SetFocus;
    Exit;
  end;
  bbtn_OK.Enabled:=true;
  EditEmpName_Q.Text:=EmpInfo.FieldByName('emp_chs').AsString;
  EditEmpCard_Q.Text:=EmpInfo.FieldByName('spc_id').AsString;
  EditEmpPst_Q.Text:=EmpInfo.FieldByName('pst_code').AsString;
  EditIndt.Text:=EmpInfo.FieldByName('epindt').AsString;
  EditLedt.Text:=EmpInfo.FieldByName('epledt').AsString;
  EditEmpDept_Q.Text:=EmpInfo.FieldByName('dept_code').AsString+' '+EmpInfo.FieldByName('abbr_titl').AsString;
  //EditEmpDept_Q.Text:=GetDeptName(EmpInfo.FieldByName('dept_code').AsString,me_Month_Q.Text);
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.me_Month_QChange(Sender: TObject);
begin
  qry_mon_Q.Close;
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.bbtn_OKClick(Sender: TObject);
begin
  if AnalysisEmpFactory(EditEmp_Q.Text)=false then
    exit ;   //2012-09-07 hyt add

  qry_mon_Q.Close;
  qry_mon_Q.Parameters.ParamByName('emp_id').Value:=EditEmp_Q.Text;
  qry_mon_Q.Parameters.ParamByName('dut_mon').Value:=me_Month_Q.Text;
  qry_mon_Q.Open;
  qry_mon_QC.Clone(qry_mon_Q);
  bbtn_OK.Enabled:=false;
  me_Month_Q.Enabled:=false;
  EditEmp_Q.Enabled:=false;
  sb_FindEmp.Enabled:=false;
  bbtn_Reset.Enabled:=true;
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.sb_DelClick(Sender: TObject);
begin
  if WideMessageDlg('�z�T�w�R��?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    qry_mon_Q.Delete;
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.sb_RecoverClick(Sender: TObject);
begin
  qry_mon_Q.CancelUpdates;
  sb_Recover.Enabled:=false;
  sb_Save.Enabled:=false;
  sb_Del.Enabled:=true;
  //sb_post.Enabled:=false;
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.SetTotalValue;
var
  DayVal,EchoStr:String;
  i,TotalHours,TotalMins,TotalTimes:Integer;
begin
  //�p��X�p
  //��즭�h�B�z
  TotalTimes:=0;
  TotalHours:=0;
  TotalMins:=0;
  EchoStr:=GetLangName(ws_Words,'cls_hol_name')+':'+ qry_mon_Q.FieldByName('clas_name').AsString+
    '  '+GetLangName(ws_Words,'total')+':';
  if (qry_mon_Q.FieldByName('clas_code').AsString='04') or
    (qry_mon_Q.FieldByName('clas_code').AsString='05') then
  begin
    for i:=1 to 31 do
    begin
      DayVal:=Trim(qry_mon_Q.FieldByName('day'+Format('%.2d',[i])).AsString);
      if DayVal<>'' then
        TotalTimes:=TotalTimes+StrToInt(DayVal);
    end;
    EchoStr:=EchoStr+Format('%.3d',[TotalTimes])+'  '+GetLangName(ws_Words,'hours');
  end
  else
  begin
    for i:=1 to 31 do
    begin
      DayVal:=Trim(qry_mon_Q.FieldByName('day'+Format('%.2d',[i])).AsString);
      if DayVal<>'' then
      begin
        TotalHours:=TotalHours+StrToInt(LeftStr(DayVal,2));
        TotalMins:= TotalMins+StrToInt(MidStr(DayVal,3,2));
      end;
    end;
    TotalHours:=TotalHours+(TotalMins div 60 );
    TotalMins:=TotalMins mod 60;
    EchoStr:=EchoStr+Format('%.3d',[TotalHours])+' '+GetLangName(ws_Words,'hours')+' '+
      Format('%.2d',[TotalMins])+' '+GetLangName(ws_Words,'minutes'); 
  end;
  setStatusText(EchoStr);
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.qry_mon_QAfterScroll(DataSet: TDataSet);
begin
  SetTotalValue;
  if DataSet.State=dsinsert then
    DataSet.FieldByName('clas_code').ReadOnly:=false
  else
    DataSet.FieldByName('clas_code').ReadOnly:=true;
  //dbg_Dut1_Q.Columns[0].ReadOnly:=true;
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.qry_mon_QAfterDelete(DataSet: TDataSet);
begin
  if qry_mon_Q.Eof then
    sb_Del.Enabled:=false;
  sb_Recover.Enabled:=true;
  sb_Save.Enabled:=true;
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.qry_mon_QAfterPost(DataSet: TDataSet);
begin
  sb_Recover.Enabled:=true;
  sb_Save.Enabled:=true;
  //sb_post.Enabled:=false;
  SetTotalValue;
  qry_mon_QC.Clone(qry_mon_Q);
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.sb_SaveClick(Sender: TObject);
begin
  //�Ӥ��Ƥw�g��w
  if ((me_Month_Q.Text)<=LockMonthPart) and (UserName<>DebugUser) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
    exit;
  end;
  try
    qry_mon_Q.UpdateBatch;
  except
    WideMessageDlg('�O�s���ѡA�Э���',mtError,[mbYes],0);
    abort;
  end;
  sb_Save.Enabled:=false;
  sb_Recover.Enabled:=false;
  WideMessageDlg('�O�s���\',mtInformation,[mbYes],0);
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.qry_mon_QBeforePost(DataSet: TDataSet);
begin
  qry_mon_Q.FieldByName('emp_id').AsString:=EditEmp_Q.Text;
  qry_mon_Q.FieldByName('dut_mon').AsString:=me_Month_Q.Text;
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.bbtn_ResetClick(Sender: TObject);
begin
  bbtn_OK.Enabled:=true;
  bbtn_Reset.Enabled:=false;
  me_Month_Q.Enabled:=true;
  EditEmp_Q.Enabled:=true;
  sb_FindEmp.Enabled:=true;
  qry_mon_Q.Close;
  setStatusText('');
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.qry_mon_QAfterClose(DataSet: TDataSet);
begin
  sb_Del.Enabled:=false;
  sb_Add.Enabled:=false;
  ///sb_post.Enabled:=false;
  sb_Recover.Enabled:=false;
  sb_Save.Enabled:=false;
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.dbg_Dut1_QKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_TAB then
    dbg_Dut2_Q.SetFocus;
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.dbg_Dut2_QKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_TAB then
    dbg_Dut1_Q.SetFocus;
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.qry_mon_Qday01SetText(Sender: TField;
  const Text: String);
begin
  if Trim(Text)='' then
  begin
    Sender.Value:=Text;
    exit;
  end;
  if (qry_mon_Q.FieldByName('clas_code').AsString='04') or
    (qry_mon_Q.FieldByName('clas_code').AsString='05') then
  begin
    try
      if StrToInt(Text)>2 then
        WideMessageDlg('�z��J����Ʀ��~�I',mtError,[mbYes],0)
      else
        Sender.Value:=IntToStr(StrToInt(Text));
    except
      WideMessageDlg('�z��J����Ʀ��~�I',mtError,[mbYes],0);
      Sender.Value:=Sender.OldValue;
    end;
  end
  else begin
    try
      if (Length(Trim(Text))<>4) or (StrToInt(LeftStr(Trim(Text),2))>24) or
        (StrToInt(RightStr(Trim(Text),2))>59) then
      begin
        WideMessageDlg('�z��J����Ʀ��~�I',mtError,[mbYes],0);
        Sender.Value:=Sender.OldValue;
      end
      else
        Sender.Value:=Text;
    except
      WideMessageDlg('�z��J����Ʀ��~�I',mtError,[mbYes],0);
      Sender.Value:=Sender.OldValue;
    end;
  end;
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.sb_CloseClick(Sender: TObject);
begin
  TForm(TntPanel1.Parent).Close;
end;
{===============================================================================
===============================================================================}
procedure TFormDut13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry_mon_Q.Close;
  EditEmp_Q.Text:='';
  bbtn_OK.Enabled:=true;
  bbtn_Reset.Enabled:=false;
  me_Month_Q.Enabled:=true;
  EditEmp_Q.Enabled:=true;
  sb_FindEmp.Enabled:=true;
end;

procedure TFormDut13.sb_AddClick(Sender: TObject);
begin
  dbg_Dut1_Q.ReadOnly:=false;
  dbg_Dut2_Q.ReadOnly:=false;
  qry_Mon_Q.Append;

end;

procedure TFormDut13.qry_mon_QAfterEdit(DataSet: TDataSet);
begin
  //sb_post.Enabled:=true;
  SetTotalValue;
end;

procedure TFormDut13.qry_mon_QAfterInsert(DataSet: TDataSet);
begin
 // sb_post.Enabled:=true;
  SetTotalValue;
end;

procedure TFormDut13.sb_FindEmpClick(Sender: TObject);
var
  aEmpId:String;
begin
  aEmpId:=FindEmpId('emp_id',me_Month_Q.Text);
  if aEmpId<>'' then
    EditEmp_Q.Text:=aEmpId;
end;

procedure TFormDut13.sb_editClick(Sender: TObject);
begin
  dbg_Dut1_Q.ReadOnly:=false;
  dbg_Dut2_Q.ReadOnly:=false;
  qry_Mon_Q.Edit;
end;

procedure TFormDut13.qry_mon_QAfterOpen(DataSet: TDataSet);
begin
  if PrvAdd then
    sb_Add.Enabled:=true;
  if PrvPrt then
    sb_Print.Enabled:=true;
  if not qry_mon_Q.Eof then
  begin
    if PrvDel then
      sb_Del.Enabled:=true;
  end;
end;

procedure TFormDut13.dbg_Dut1_QColExit(Sender: TObject);
begin
  if qry_mon_Q.State in [dsInsert,dsEdit] then
     qry_mon_Q.Post;
end;

procedure TFormDut13.dbg_Dut1_QCellClick(Column: TColumn);
begin
  SetTotalValue;
end;

procedure TFormDut13.sb_PrintClick(Sender: TObject);
begin
  showPrint(qry_mon_Q,'�ҶԤ��ɦC�L');
end;

procedure TFormDut13.CheckSpcClas(empid:string;LateTimes,EarlyTimes,AbTimes:integer);
//�u���O�_����즭�h���`�B�z
var
  i:integer;
begin
            if LateTimes>0 then//
            with qry_Temp do//���ɷs�W������
            begin
              AddMonRecord(empid,'04');
              for i:=1 to 31 do
              begin
                if LateArr[i]>0 then
                begin
                  FieldByName('day'+Format('%.2d', [i])).AsInteger:=LateArr[i];
                  LateArr[i]:=0;
                end;
              end;
              //Post;
            end;
            if EarlyTimes>0 then//
            with qry_Temp do//���ɷs�W���h����
            begin
              AddMonRecord(empid,'05');;
              for i:=1 to 31 do
              begin
                if EarlyArr[i]>0 then
                begin
                  FieldByName('day'+Format('%.2d',[i])).AsInteger:=EarlyArr[i];
                  EarlyArr[i]:=0;
                end;
              end;
            end;
            if AbTimes>0 then//
            with qry_Temp do//���ɷs�W���`����
            begin
              AddMonRecord(empid,'06');;
              for i:=0 to 31 do
              begin
                if Ab_Arr[i]<>'' then
                begin
                  FieldByName('day'+Format('%.2d',[i])).AsString:=Ab_Arr[i];
                  Ab_Arr[i]:='';
                end;
              end;
            end;
end;

procedure TFormDut13.AddMonRecord(empId,clas:string);
//���ɷs�W/�ק����
var
  aSQL:string;
begin
  with qry_Temp do//���ɷs�W/�ק����
  begin
    aSQL:='select * from hrd_dut_mon where emp_id='''+empId+''' and dut_mon='''
      +dut_mon+''' and clas_code='''+clas+'''';
    if Active then
      Post;
    close;
    sql.Clear;
    sql.Add(aSQL);
    try
      Open;
    except
      Memo1.Lines.Add('net connect error when open emp_id:'+empId);
      Exit;
    end;
    if Eof then
      Append
    else
      Edit;
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').Value:=GetServerDateTime;
    FieldByName('emp_id').AsString:=empId;
    FieldByName('dut_mon').AsString:=dut_mon;
    FieldByName('clas_code').AsString:=clas;
  end;
end;

procedure TFormDut13.DelDayInMonth(empId:string);
//�M������d���ª����ɸ��
var
  sql_str,DayFld:string;
  i,Ayear,Amonth:integer;
begin
  TryStrToInt(LeftStr(dut_mon,4),Ayear);
  TryStrToInt(RightStr(dut_mon,2),Amonth);
  if (Date_Begin=DateOf(StartOfAMonth(Ayear,AMonth))) and (Date_End=DateOf(EndOfAMonth(Ayear,AMonth))) then
  begin//�����R��
    sql_str:='delete from hrd_dut_mon where emp_id='''+emp_id+''' and dut_mon='''+dut_Mon+'''';
    with DMHrdSys.ADOCommand1 do
    begin
      CommandText:=sql_str;
      Execute;
    end;
  end
  else
  begin//�ק����
    sql_str:='update hrd_dut_mon set ';
    for i:=DayOf(Date_Begin) to DayOf(Date_End) do
    begin
      DayFld:='day'+Format('%.2d', [i]);
      sql_str:=sql_str+DayFld+'='''', ';
    end;
    sql_str:=sql_str+'upd_user='''+username+'''';
    sql_str:=sql_str+' where emp_id='''+emp_id+''' and dut_mon='''+dut_mon+'''';
    with DMHrdSys.ADOCommand1 do
    begin
      CommandText:=sql_str;
      Execute;
    end;
  end;
end;

procedure TFormDut13.qry_mon_Qclas_codeChange(Sender: TField);
//�s�W�@�ӯZ�O�ˬd
begin
  if qry_mon_QC.Locate('clas_code',Sender.Text,[loCaseInsensitive]) then
  begin
    qry_mon_Q.Last;
    qry_mon_Q.Delete;
  end;
end;

procedure TFormDut13.EditEmpBeg_TChange(Sender: TObject);
begin
  EditEmpEnd_T.Text:=EditEmpBeg_T.Text;
end;

procedure TFormDut13.cob_Dept_beginChange(Sender: TObject);
begin
  cob_Dept_end.Text:=cob_Dept_begin.Text;
end;

end.