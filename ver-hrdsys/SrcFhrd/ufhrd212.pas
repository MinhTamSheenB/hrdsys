unit ufhrd212;

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
  TFormfhrd212 = class(TForm)
    TntPanel1: TTntPanel;
    TntPageControl1: TTntPageControl;
    TntTabSheet2: TTntTabSheet;
    TntPanel2: TTntPanel;
    TntGroupBox4: TTntGroupBox;
    dbg_Dut2_Q: TTntDBGrid;
    dbg_Dut1_Q: TTntDBGrid;
    TntPanel6: TTntPanel;
    TntGroupBox3: TTntGroupBox;
    TntLabel3: TTntLabel;
    TntLabel6: TTntLabel;
    TntLabel19: TTntLabel;
    TntLabel20: TTntLabel;
    TntLabel21: TTntLabel;
    TntLabel22: TTntLabel;
    sb_FindEmp: TTntSpeedButton;
    TntLabel4: TTntLabel;
    TntLabel5: TTntLabel;
    EditEmp_Q: TTntEdit;
    me_Month_Q: TMaskEdit;
    EditEmpDept_Q: TTntEdit;
    EditEmpName_Q: TTntEdit;
    EditEmpCard_Q: TTntEdit;
    EditEmpPst_Q: TTntEdit;
    bbtn_OK: TTntBitBtn;
    bbtn_Reset: TTntBitBtn;
    EditIndt: TTntEdit;
    EditLedt: TTntEdit;
    Panel1: TPanel;
    sb_Print: TTntSpeedButton;
    sb_Add: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Close: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    TntTabSheet3: TTntTabSheet;
    TntPanel3: TTntPanel;
    TntPanel4: TTntPanel;
    TntGroupBox2: TTntGroupBox;
    TntLabel17: TTntLabel;
    TntLabel18: TTntLabel;
    sb_EmpBeg: TTntSpeedButton;
    sb_EmpEnd: TTntSpeedButton;
    cob_Dept_begin: TTntComboBox;
    EditEmpBeg_T: TTntEdit;
    EditEmpEnd_T: TTntEdit;
    cob_Dept_end: TTntComboBox;
    rb_ByEmp_T: TCheckBox;
    rb_ByDept_T: TCheckBox;
    TntGroupBox1: TTntGroupBox;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    dp_DateBeg_T: TTntDateTimePicker;
    dp_DateEnd_T: TTntDateTimePicker;
    TntStaticText1: TTntStaticText;
    BBtn_Tran: TTntBitBtn;
    TntBitBtn1: TTntBitBtn;
    pb_tran: TTntProgressBar;
    TntStatusBar1: TTntStatusBar;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    qry_mon_Q: TADOQuery;
    qry_mon_Qupd_user: TStringField;
    qry_mon_Qupd_date: TDateTimeField;
    qry_mon_Qemp_id: TStringField;
    qry_mon_Qdut_mon: TStringField;
    qry_mon_Qclas_code: TStringField;
    qry_mon_Qclas_name: TTntWideStringField;
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
    ds_mon_Q: TDataSource;
    qry_DutDay: TADOQuery;
    sp_T_Emp1: TADOStoredProc;
    sp_T_Emp1emp_id: TStringField;
    sp_T_Emp1epledt: TDateTimeField;
    sp_T_Emp1epindt: TDateTimeField;
    cmd_Temp: TADOCommand;
    qry_Temp: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOQueryEmp: TADOQuery;
    ADOQueryEmpemp_id: TStringField;
    ADOQueryEmpepindt: TDateTimeField;
    ADOQueryEmpepledt: TDateTimeField;
    qry_mon_QC: TADOQuery;
    procedure BBtn_TranClick(Sender: TObject);
    procedure TntBitBtn1Click(Sender: TObject);
    procedure InitLangInfo;
    procedure InitInputDate;
     procedure CheckTranInput;
     procedure CheckSpcClas(empid:string;LateTimes,EarlyTimes,AbTimes:integer);
       procedure DelDayInMonth(empId:string);
      function  TakeTime(pre_Time:string=''):String;
     procedure AddMonRecord(empId,clas:string);
      function  CheckDate(aDate:TDateTime):Boolean;
    procedure me_Month_QChange(Sender: TObject);
    procedure me_Month_QExit(Sender: TObject);
    procedure bbtn_OKClick(Sender: TObject);
    procedure bbtn_ResetClick(Sender: TObject);
    procedure dbg_Dut1_QCellClick(Column: TColumn);
    procedure dbg_Dut1_QColExit(Sender: TObject);
    procedure dbg_Dut1_QKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sb_PrintClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure sb_CloseClick(Sender: TObject);
    procedure SetTotalValue;
    procedure FormCreate(Sender: TObject);
    procedure EditEmp_QChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd212: TFormfhrd212;
   RunThread :TRunThread;
  LateArr,EarlyArr:TMonArr;//遲到，早退
  Ab_Arr:TMonArr2;//異常
  PrvPrt,PrvAdd,PrvDel,PrvTran,PrvUpd:boolean;
  ws_Words:TWideStrings;
  Date_Begin,Date_end:TDateTime;
  emp_id,dut_mon,clas_code:string;
  ConnErrorCount:integer;//連接錯誤次數
implementation

uses UnitDMHrdsys,UnitHrdUtils;

{$R *.dfm}
 procedure TFormfhrd212.InitLangInfo;
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

procedure TFormfhrd212.InitInputDate;
//初始化轉檔日期
begin
  GetDeptRange(cob_Dept_begin);
  GetDeptRange(cob_Dept_end);
  dp_DateBeg_T.Date:=EnCodeDate(YearOf(now-4),MonthOf(now-4),1);
  dp_DateEnd_T.Date:=EnCodeDate(YearOf(now-4),MonthOf(now-4),DaysInMonth(date-4));
end;

procedure TFormfhrd212.BBtn_TranClick(Sender: TObject);
begin
  Date_begin:=DateOf(dp_DateBeg_T.Date);
  Date_End:=DateOf(dp_DateEnd_T.Date);
  //檢查輸入是否正確
  CheckTranInput;
  dut_mon:=FormatDateTime('yyyymm',Date_begin);
  ConnErrorCount:=0;
  //新開轉檔線程
  RunThread := TRunThread.Create(false);
end;

procedure TFormfhrd212.TntBitBtn1Click(Sender: TObject);
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
{===============================================================================
  線程轉檔
===============================================================================}
procedure TRunThread.execute;
var
  aSQL,DutTime,AbTime,clas_code,pre_clas,the_day,pre_day,fld_day,pre_emp,emp_str:String;
  count1,LateTimes,EarlyTimes,AbTimes,Aday,i:Integer;
  CurTime:TDateTime;
  Formfhrd212:TFormfhrd212;
begin
  FreeOnTerminate := true;
  Formfhrd212:=TFormfhrd212(Application.FindComponent('Formfhrd212'));
  with Formfhrd212 do
  begin
    BBtn_Tran.Enabled:=false;
    //得到查詢範圍內的員工
    //GetTranEmp;
    emp_str:='';
    if rb_ByEmp_T.Checked then
      emp_str:=emp_str+' and emp_id>='''+EditEmpBeg_T.Text+''' and emp_id<='''+EditEmpEnd_T.Text+'''';
    if rb_ByDept_T.Checked then
      emp_str:=emp_str+' and emp_id in(select emp_id from hrd_emp where '
        +' dept_code >='''+LeftStr(cob_Dept_begin.Text,6)+''''
        +' and dept_code <='''+LeftStr(cob_Dept_end.Text,6)+''')';
    //查找日期範圍內考勤紀錄
    aSQL:='SELECT * FROM fhrd_dut_day WHERE 1=1 '+emp_str
      +' and wrk_date>='''+FormatDateTime('yyyy/mm/dd',Date_Begin)+''''
      +' and wrk_date<='''+FormatDateTime('yyyy/mm/dd',Date_End)+''''
      +' order by emp_id,clas_code,wrk_date';
    TntStatusBar1.SimpleText:='正在打開考勤日檔...';
//    try
    with qry_DutDay do
    begin
      Close;
      SQL.Clear;
      SQL.Add(aSQL);
      try
        Open;
      except//斷開連接
        Memo1.Lines.Add('cannot open database');
        RunThread.Terminate;
        Exit;
      end;
//      try
      DMHrdsys.conn.BeginTrans;
      if not EOF then
      begin
        //進度欄最大最小值設定
        pb_tran.Min := 0;
        pb_tran.Max :=RecordCount;
        //初始化變量
        count1:=0;
        LateTimes:=0;
        EarlyTimes:=0;
        AbTimes:=0;
        pre_clas:='';
        pre_day:='';
        pre_emp:='';
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
          TntStatusBar1.SimpleText:='正在轉檔，請稍侯...   處理第  '+IntToStr(count1)+'/'+IntToStr(pb_tran.Max)+'  筆記錄，當前工號'+emp_id;
          if Terminated then
          begin//進程結束，退出
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
          if (pre_emp<>emp_id) then
          begin
            CheckSpcClas(pre_emp,LateTimes,EarlyTimes,AbTimes);//檢查上一個工號是否有遲到早退異常
            DMHrdsys.conn.CommitTrans;
            //開始處理新的工號
            DMHrdsys.conn.BeginTrans;//開始新的事務
            LateTimes:=0;
            EarlyTimes:=0;
            AbTimes:=0;
            //刪除員工考勤月檔日期範圍內的所有記錄(一個工號處理一次)
            DelDayInMonth(emp_Id);
            //DelDayInMonth(aDay);
            {with DMHrdSys.ADOCommand1 do
            begin
              CommandText:='delete from hrd_dut_mon where emp_id='''+emp_id+''' and dut_mon='''+dut_mon+'''';
              Execute;
            end;}
          end;
          if (pre_emp<>emp_id) or (pre_clas<>clas_code) or (pre_day<>the_day) then
          begin//重置
            DutTime:='0000';
            AbTime:='';
          end;
          //纍計上班時間
          if trim(FieldByName('wrk_sts').AsString)<>'06' then
            DutTime:=TakeTime(DutTime);
          if (pre_emp<>emp_id) or (pre_clas<>clas_code) then
            AddMonRecord(emp_id,clas_code);//月檔新增一筆記錄(換工號和班別)
          qry_Temp.FieldByName(fld_day).AsString:=DutTime;//修改數據
          //遲到次數加1
          if trim(FieldByName('late').AsString)<>'' then
          begin
            LateTimes:=LateTimes+1;
            LateArr[Aday]:=LateArr[Aday]+1;
          end;
          //早退次數加1
          if trim(FieldByName('early').AsString)<>'' then
          begin
            EarlyTimes:=EarlyTimes+1;
            EarlyArr[Aday]:=EarlyArr[Aday]+1;
          end;
          //異常處理
          if trim(FieldByName('wrk_sts').AsString)='06' then
          begin
            AbTimes:=AbTimes+1;
            AbTime:=TakeTime(AbTime);
            Ab_Arr[Aday]:=AbTime;
            //qry_Temp.FieldByName(fld_day).AsString:='0000';//實際班別時間變為0
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
    messageboxW(0,PWideChar(GetLangName(ws_Words,'tran_success')),'提示信息',mb_iconinformation);
    //except
      //轉檔失敗，返回
    //  messageboxW(0,PWideChar(GetLangName(ws_Words,'tran_fail')),'提示信息',mb_iconinformation);
    //end;
    pb_tran.Position:=0;
    TntStatusBar1.SimpleText:='';
    BBtn_Tran.Enabled:=true;
    qry_Temp.Close;
  end;//with FormDut13
  Terminate;
end;
{===============================================================================
  檢查輸入是否正確
===============================================================================}
procedure TFormfhrd212.CheckTranInput;
begin
  //日起不合法
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
procedure TFormfhrd212.CheckSpcClas(empid:string;LateTimes,EarlyTimes,AbTimes:integer);
//工號是否有遲到早退異常處理
var
  i:integer;
begin
            if LateTimes>0 then//
            with qry_Temp do//月檔新增遲到紀錄
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
            with qry_Temp do//月檔新增早退紀錄
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
            with qry_Temp do//月檔新增異常紀錄
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
procedure TFormfhrd212.DelDayInMonth(empId:string);
//清除日期範圍內舊的月檔資料
var
  sql_str,DayFld:string;
  i,Ayear,Amonth:integer;
begin
  TryStrToInt(LeftStr(dut_mon,4),Ayear);
  TryStrToInt(RightStr(dut_mon,2),Amonth);
  if (Date_Begin=DateOf(StartOfAMonth(Ayear,AMonth))) and (Date_End=DateOf(EndOfAMonth(Ayear,AMonth))) then
  begin//直接刪除
    sql_str:='delete from fhrd_dut_mon where emp_id='''+emp_id+''' and dut_mon='''+dut_Mon+'''';
    with DMHrdSys.ADOCommand1 do
    begin
      CommandText:=sql_str;
      Execute;
    end;
  end
  else
  begin//修改欄位
    sql_str:='update fhrd_dut_mon set ';
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
function TFormfhrd212.TakeTime(pre_Time:string=''):String;
var
  StdStartTime,StdEndTime,WorkTime:String;
  WorkHour,WorkMinu,tmp,last_hour,last_min:Integer;
begin
  if pre_Time<>'' then
  begin
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
  if (StdStartTime='1300') and (StdEndTime='1600') then
  begin
    WorkHour:=4;
    WorkMinu:=0;
  end
  else if (StdStartTime='1230') and (StdEndTime='1530') then
  begin
    WorkHour:=4;
    WorkMinu:=0;
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
  if WorkMinu<0 then
  begin
    WorkHour:=WorkHour-1;
    WorkMinu:=WorkMinu+60;
  end;
  if WorkHour<0 then
    WorkTime:=''
  else
    WorkTime:=Format('%.2d',[WorkHour+last_hour])+Format('%.2d',[WorkMinu+last_min]);
  Result:=WorkTime;
end;
procedure TFormfhrd212.AddMonRecord(empId,clas:string);
//月檔新增/修改紀錄
var
  aSQL:string;
begin
  with qry_Temp do//月檔新增/修改紀錄
  begin
    aSQL:='select * from fhrd_dut_mon where emp_id='''+empId+''' and dut_mon='''
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
{===============================================================================
  檢查輸入日期是否正確
===============================================================================}
function TFormfhrd212.CheckDate(aDate:TDateTime):Boolean;
var
  ServerDateTime:TDateTime;
begin
  //取服務器當前時間
  ServerDateTime:=GetServerDateTime;
  result:=true;
  LockMonthPart  := '200712';
  //該月資料已經鎖定
  if (formatDateTime('yyyymm',aDate)<=LockMonthPart) and (UserName<>DebugUser) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
    result:=false;
  end
  {//若日期超過10日，月份只能為本月
  else if (DayOf(ServerDateTime)>=10) and (MonthOf(ServerDateTime)<>MonthOf(aDate)) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'dut13_error1'),mtError,[mbYes],0);
    result:=false;
  end}
  //日期不能超過當前日期，不能為空
  else if (CompareDate(aDate,DateOf(ServerDateTime))=1) or (trim(DateTimeToStr(aDate))='')  then
  begin
    WideMessageDlg(GetLangName(ws_Words,'dut13_error2'),mtError,[mbYes],0);
    result:=false;
  end
  //不能為前兩月
  else if MonthOf(ServerDateTime)-MonthOf(aDate)+12*(YearOf(ServerDateTime)-YearOf(aDate))>1 then
  begin
    WideMessageDlg(GetLangName(ws_Words,'dut13_error3'),mtError,[mbYes],0);
    result:=false;
  end
  //起止日期應為同月
  else if (YearOf(dp_DateBeg_T.Date)<>YearOf(dp_DateEnd_T.Date)) or
    (MonthOf(dp_DateBeg_T.Date)<>MonthOf(dp_DateEnd_T.Date)) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'dut13_error4'),mtError,[mbYes],0);
    result:=false;
  end
  //日期起要小於日期止
  else if dp_DateBeg_T.Date>dp_DateEnd_T.Date then
  begin
    WideMessageDlg(GetLangName(ws_Words,'dut13_error4'),mtError,[mbYes],0);
    result:=false;
  end;
end;
procedure TFormfhrd212.me_Month_QChange(Sender: TObject);
begin
  qry_mon_Q.Close;
end;

procedure TFormfhrd212.me_Month_QExit(Sender: TObject);
var
  aDate:TDateTime;
  i,MaxDay:Integer;
begin
  if Length(me_Month_Q.Text)<6 then
  begin
    WideMessageDlg('請輸入查詢月份，正確格式為''yyyy/mm'',如2005/08',mtError,[mbYes],0);
    me_Month_Q.SelectAll;
    me_Month_Q.SetFocus;
    abort;
  end;
  if not TryEncodeDate(StrToInt(LeftStr(me_Month_Q.Text,4)),StrToInt(RightStr(me_Month_Q.Text,2)),1,aDate) then
  begin
    WideMessageDlg('請輸入查詢月份，正確格式為''yyyy/mm'',如2005/08',mtError,[mbYes],0);
    me_Month_Q.SelectAll;
    me_Month_Q.SetFocus;
    abort;
  end;
  MaxDay:=DaysInAMonth(StrToInt(LeftStr(me_Month_Q.Text,4)),StrToInt(RightStr(me_Month_Q.Text,2)));
  case MaxDay of
    28:
       begin
         dbg_Dut2_Q.Columns.Items[14].Visible:=false;//29日
         dbg_Dut2_Q.Columns.Items[15].Visible:=false;//30
         dbg_Dut2_Q.Columns.Items[16].Visible:=false;//31
       end;
    29:
       begin
         dbg_Dut2_Q.Columns.Items[14].Visible:=true;//29日
         dbg_Dut2_Q.Columns.Items[15].Visible:=false;//30
         dbg_Dut2_Q.Columns.Items[16].Visible:=false;//31
       end;
    30:
       begin
         dbg_Dut2_Q.Columns.Items[14].Visible:=true;//29日
         dbg_Dut2_Q.Columns.Items[15].Visible:=true;//30
         dbg_Dut2_Q.Columns.Items[16].Visible:=false;//31
       end;
    31:
       begin
         dbg_Dut2_Q.Columns.Items[14].Visible:=true;//29日
         dbg_Dut2_Q.Columns.Items[15].Visible:=true;//30
         dbg_Dut2_Q.Columns.Items[16].Visible:=true;//31
       end;
  else
    begin
      WideMessageDlg('請輸入查詢月份，正確格式為''yyyy/mm'',如2005/08',mtError,[mbYes],0);
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

procedure TFormfhrd212.bbtn_OKClick(Sender: TObject);
var
  sql :string ;
begin
  if Checktempuser(username)  = false  then
     begin
       sql := ' select *from hrd_deny_emp where emp_id= '''+ EditEmp_Q.Text + '''' ;
       dmhrdsys.SQLQuery1.SQL.Clear ;
       dmhrdsys.SQLQuery1.SQL.Add(sql) ;
       dmhrdsys.SQLQuery1.Open ;
       if not dmhrdsys.SQLQuery1.Eof  then
          begin
            showmessage('not data !!!') ;
            exit ; 
          end;
     end;
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

procedure TFormfhrd212.bbtn_ResetClick(Sender: TObject);
begin
    bbtn_OK.Enabled:=true;
  bbtn_Reset.Enabled:=false;
  me_Month_Q.Enabled:=true;
  EditEmp_Q.Enabled:=true;
  sb_FindEmp.Enabled:=true;
  qry_mon_Q.Close;
  setStatusText('');
end;

procedure TFormfhrd212.dbg_Dut1_QCellClick(Column: TColumn);
begin
  SetTotalValue;
end;

procedure TFormfhrd212.dbg_Dut1_QColExit(Sender: TObject);
begin
   if qry_mon_Q.State in [dsInsert,dsEdit] then
     qry_mon_Q.Post;
end;

procedure TFormfhrd212.dbg_Dut1_QKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=VK_TAB then
    dbg_Dut2_Q.SetFocus;
end;

procedure TFormfhrd212.sb_PrintClick(Sender: TObject);
begin
   showPrint(qry_mon_Q,'考勤月檔列印');
end;

procedure TFormfhrd212.sb_AddClick(Sender: TObject);
begin
   dbg_Dut1_Q.ReadOnly:=false;
  dbg_Dut2_Q.ReadOnly:=false;
  qry_Mon_Q.Append;
end;

procedure TFormfhrd212.sb_DelClick(Sender: TObject);
begin
   if WideMessageDlg('您確定刪除?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    qry_mon_Q.Delete;
end;

procedure TFormfhrd212.sb_RecoverClick(Sender: TObject);
begin
   qry_mon_Q.CancelUpdates;
  sb_Recover.Enabled:=false;
  sb_Save.Enabled:=false;
  sb_Del.Enabled:=true;
end;

procedure TFormfhrd212.sb_SaveClick(Sender: TObject);
begin
    //該月資料已經鎖定
  if ((me_Month_Q.Text)<=LockMonthPart) and (UserName<>DebugUser) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
    exit;
  end;
  try
    qry_mon_Q.UpdateBatch;
  except
    WideMessageDlg('保存失敗，請重試',mtError,[mbYes],0);
    abort;
  end;
  sb_Save.Enabled:=false;
  sb_Recover.Enabled:=false;
  WideMessageDlg('保存成功',mtInformation,[mbYes],0);
end;

procedure TFormfhrd212.sb_CloseClick(Sender: TObject);
begin
  TForm(TntPanel1.Parent).Close;
end;
 procedure TFormfhrd212.SetTotalValue;
var
  DayVal,EchoStr:String;
  i,TotalHours,TotalMins,TotalTimes:Integer;
begin
  //計算合計
  //遲到早退處理
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
procedure TFormfhrd212.FormCreate(Sender: TObject);
const
  FORM_ID='fhrd209';
var
  PrvArr:TPrvArr;
begin
  //初始化,取用戶對該畫面擁有的權限
  PrvArr:=GetPrvArr(UserName,FORM_ID);
  //列印權限
  PrvPrt:=PrvArr[Prt];
  //新增權限
  PrvAdd:=PrvArr[ADD];
  //刪除權限
  PrvDel:=PrvArr[DEL];
  //修改權限
  PrvUpd:=PrvArr[UPD];
  //轉檔全縣
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

procedure TFormfhrd212.EditEmp_QChange(Sender: TObject);
var
  EmpInfo:TFields;
  sql :string ;
begin
  EditEmpName_Q.Text:='';
  EditEmpCard_Q.Text:='';
  EditEmpPst_Q.Text:='';
  EditEmpDept_Q.Text:='';
  EditIndt.Text:='';
  EditLedt.Text:='';
  bbtn_OK.Enabled:=false;
  if Length(EditEmp_Q.Text)<6 then exit;
  sql :='select a.emp_name, a.spc_id, a.pst_code, a.emp_gvdt,a.emp_ledt, a.dept_code,b.abbr_titl from fhrd_emp as a, hrd_dept as b where a.dept_code=b.dept_code and a.emp_id=''' +EditEmp_Q.Text + '''';
  EmpInfo:=GetEmpInfo(EditEmp_Q.Text,me_Month_Q.Text);
  dmhrdsys.SQLQuery1.SQL.Clear ;
  dmhrdsys.SQLQuery1.SQL.Add( sql );
  dmhrdsys.SQLQuery1.Open ;
  if dmhrdsys.SQLQuery1.Eof then
  begin
    MessageDlg('該員工不存在！',mtError,[mbYes],0);
    EditEmp_Q.SetFocus;
    Exit;
  end;
  bbtn_OK.Enabled:=true;
  EditEmpName_Q.Text:=dmhrdsys.SQLQuery1.FieldByName('emp_name').AsString;
  EditEmpCard_Q.Text:=dmhrdsys.SQLQuery1.FieldByName('spc_id').AsString;
  EditEmpPst_Q.Text:=dmhrdsys.SQLQuery1.FieldByName('pst_code').AsString;
  EditIndt.Text:=dmhrdsys.SQLQuery1.FieldByName('emp_gvdt').AsString;
  EditLedt.Text:=dmhrdsys.SQLQuery1.FieldByName('emp_ledt').AsString;
  EditEmpDept_Q.Text:=dmhrdsys.SQLQuery1.FieldByName('dept_code').AsString+' '+dmhrdsys.SQLQuery1.FieldByName('abbr_titl').AsString;
  //EditEmpDept_Q.Text:=GetDeptName(EmpInfo.FieldByName('dept_code').AsString,me_Month_Q.Text);
end;

end.
