{*************************************************************************
Name：Sal08
*************************************************************************}
unit uFhrd311;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TntExtCtrls, StdCtrls, TntStdCtrls, Buttons,DateUtils,
  TntButtons, Grids, DBGrids, TntDBGrids, ComCtrls, TntComCtrls, DB, ADODB,
  Mask, DBCtrls,WSDLIntf,StrUtils, TntDbCtrls,tntdialogs, DBClient, Menus,
  TntMenus,math,midas;

type
  TSpcGongCurrs= array[0..1] of Currency;
  TNormalTestDays =array[0..1] of Integer;
  TDutCurrs=array[0..15] of Currency;
  TSalGrad=array[0..6] of Currency;
  TSpcOver= array[0..2] of double;
  TDutyArr = Array[0..10] of double;//考勤數組
  TAskArr = Array[1..31] of double;//請假時數數組

  TFormFhrd311 = class(TForm)
    TntPanel1: TTntPanel;
    ADOCommand1: TADOCommand;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    pc_prv: TTntPageControl;
    ts_tran: TTntTabSheet;
    TntPanel7: TTntPanel;
    qry_temp: TADOQuery;
    TntGroupBox1: TTntGroupBox;
    cob_DeptBeg2: TTntComboBox;
    cob_DeptEnd2: TTntComboBox;
    EditEmpEnd2: TTntEdit;
    EditEmpBeg2: TTntEdit;
    bbtn_Reset2: TTntBitBtn;
    bbtn_OK2: TTntBitBtn;
    me_Month2: TMaskEdit;
    TntLabel3: TTntLabel;
    TntLabel1: TTntLabel;
    TntGroupBox2: TTntGroupBox;
    TntDBGrid1: TTntDBGrid;
    sp_Emp2: TADOStoredProc;
    qry_sal: TADOQuery;
    ds_sal: TDataSource;
    qry_Temp2: TADOQuery;
    TntGroupBox3: TTntGroupBox;
    re_Message: TTntRichEdit;
    qry_Grad: TADOQuery;
    ClientDataSet1: TClientDataSet;
    qry_salupd_user: TStringField;
    qry_salupd_date: TDateTimeField;
    qry_salemp_id: TStringField;
    TntPopupMenu1: TTntPopupMenu;
    N1: TTntMenuItem;
    QryEmp: TADOQuery;
    qry_saldept_code: TStringField;
    qry_salpst_code: TStringField;
    qry_salsal_month: TWideStringField;
    qry_salsal_bas: TBCDField;
    qry_salsal_frn: TBCDField;
    qry_salfix_add: TBCDField;
    qry_salf_award: TBCDField;
    qry_saladjust: TBCDField;
    qry_salnight1_price: TBCDField;
    qry_salnight2_price: TIntegerField;
    qry_salnight3_price: TIntegerField;
    qry_saldinner_price: TIntegerField;
    qry_salactu_sal: TBCDField;
    qry_sallocal_amt: TBCDField;
    qry_salbank_sal: TBCDField;
    qry_salon_duty: TBCDField;
    qry_saloff_duty: TBCDField;
    qry_salnight1_duty: TBCDField;
    qry_salnight2_duty: TBCDField;
    qry_salnight3_duty: TIntegerField;
    ClientDataSet1upd_user: TStringField;
    ClientDataSet1upd_date: TDateTimeField;
    ClientDataSet1sal_month: TWideStringField;
    ClientDataSet1emp_id: TStringField;
    ClientDataSet1dept_code: TStringField;
    ClientDataSet1pst_code: TStringField;
    ClientDataSet1sal_bas: TBCDField;
    ClientDataSet1sal_frn: TBCDField;
    ClientDataSet1fix_add: TBCDField;
    ClientDataSet1f_award: TBCDField;
    ClientDataSet1adjust: TBCDField;
    ClientDataSet1night1_price: TBCDField;
    ClientDataSet1night2_price: TIntegerField;
    ClientDataSet1night3_price: TIntegerField;
    ClientDataSet1dinner_price: TIntegerField;
    ClientDataSet1actu_sal: TBCDField;
    ClientDataSet1local_amt: TBCDField;
    ClientDataSet1bank_sal: TBCDField;
    ClientDataSet1on_duty: TBCDField;
    ClientDataSet1off_duty: TBCDField;
    ClientDataSet1night1_duty: TBCDField;
    ClientDataSet1night2_duty: TBCDField;
    ClientDataSet1night3_duty: TIntegerField;
    qry_salnight_amt: TBCDField;
    ClientDataSet1night_amt: TBCDField;
    qry_salask_pay: TBCDField;
    ClientDataSet1ask_pay: TBCDField;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    ClientDataSet1curr_cate: TStringField;
    query: TTntTabSheet;
    TntPanel4: TTntPanel;
    TntGroupBox4: TTntGroupBox;
    TntLabel7: TTntLabel;
    TntLabel8: TTntLabel;
    TntLabel10: TTntLabel;
    month: TTntEdit;
    deptBegCob: TTntComboBox;
    deptEndCob: TTntComboBox;
    empIdBeg: TTntEdit;
    empIdEnd: TTntEdit;
    selectData: TTntBitBtn;
    PrintPanel: TTntPanel;
    totalBill: TTntRadioButton;
    salaryBill: TTntRadioButton;
    nightBill: TTntRadioButton;
    TntGroupBox5: TTntGroupBox;
    salGrid: TTntDBGrid;
    salaryQry: TADOQuery;
    salaryQryupd_user: TWideStringField;
    salaryQryupd_date: TDateTimeField;
    salaryQrysal_month: TWideStringField;
    salaryQryemp_id: TWideStringField;
    salaryQryemp_name: TStringField;
    salaryQrypst_code: TStringField;
    salaryQrypst_name: TStringField;
    salaryQrydept_code: TStringField;
    salaryQrydept_name: TStringField;
    salaryQryemp_etdt: TDateTimeField;
    salaryQryemp_gvdt: TDateTimeField;
    salaryQrysal_bas: TBCDField;
    salaryQrysal_frn: TBCDField;
    salaryQryfix_add: TBCDField;
    salaryQryf_award: TBCDField;
    salaryQryadjust: TBCDField;
    salaryQryask_pay: TBCDField;
    salaryQrynight_amt: TBCDField;
    salaryQrydinner_price: TBCDField;
    salaryQryactu_sal: TBCDField;
    salaryQrynight1_price: TBCDField;
    salaryQrynight2_price: TBCDField;
    salaryQrynight3_price: TBCDField;
    salaryQrynight1_duty: TBCDField;
    salaryQrynight2_duty: TBCDField;
    salaryQrynight3_duty: TBCDField;
    salaryDataSource: TDataSource;
    TntLabel2: TTntLabel;
    TntLabel4: TTntLabel;
    TntBitBtn1: TTntBitBtn;

    //my define
    function  GetSalTran(EmpId,PayMon,PstCode,EduCode:String;WorkDays:Integer;
      EmpInDate,EmpLvDate:TDatetime): TSalGrad;
    function  GetAskPay(EmpId,PayMon:String;AWorkDays:integer;DealPay,BasePay:double):Currency;
    function  GetAdjustPay(EmpId,PayMon:String):Currency;
    function  GetNightDut(EmpId,PayMon,Factory:String):TDutyArr;
    function  GetOverAmt(EmpId:String;BasePay:double; MonSDate,MonEDate:TDatetime): Currency;
    //sys create
    procedure InitLangInfo;
    procedure FormInit;
    procedure FormCreate(Sender: TObject);
    procedure bbtn_OK2Click(Sender: TObject);
    procedure bbtn_Reset2Click(Sender: TObject);
    procedure tbb_okClick(Sender: TObject);
    procedure SetEnableControl(ActNo:Integer;Value:Boolean);
    procedure tbb_resetClick(Sender: TObject);
    procedure sb_EmpBeg2Click(Sender: TObject);
    procedure DelPayMT(EmpId,PayMon:String);
    procedure DealAEmp(EmpId,PayMon:String);
    procedure N1Click(Sender: TObject);
    procedure selectDataClick(Sender: TObject);
    procedure TntBitBtn1Click(Sender: TObject);
    procedure EditEmpBeg2Change(Sender: TObject);
    procedure empIdBegChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TRunThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure execute;override;
  public
    { Public declarations }
  end;
//function GetBase(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime;EduCode:string=''):Currency;
function GetNormalTestDays(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime):TNormalTestDays;
function GetWorkDays(PayMon:String;EmpInDate,EmpLvDate:TDateTime):Integer;
function GetSunDayCount(DayBeg,DayEnd:Integer;YearMonth:String):Integer;

var
  FormFhrd311: TFormFhrd311;
  runThread:TRunThread;
implementation

Uses
    UnitDMHrdsys,UnitHrdUtils;
var
   prv:TPrvArr;
   ws_Words:TWideStrings;
   SalBaseLvl:TStrings;//基本薪資等級額
   AEmpId,PayMon:String;
   MonSDate,MonEDate:TDatetime;
   AskArr:TAskArr;//請假時間數組
   aduty : TDutyArr;
   CurrCate:string ;
   g_sLangStr : TWideStrings;
   DateS, DateE :TDatetime ;
  {**************
  aduty[0]-> 基本時數208
  aduty[1]-> 上班時數
  aduty[2]-> 缺勤時數
  aduty[3]-> 小夜班時數(中班)
  aduty[4]-> 大夜班(晚班)(8 H)時數
  aduty[5]-> 大夜班(12H)時數
  aduty[6]-> 小夜班補貼額
  aduty[7]-> 大夜班(晚班)(8 H)補貼額
  aduty[8]-> 大夜班(12H)補貼額
  aduty[9]-> 餐補費
  **************}

{$R *.dfm}
{設置狀態 ActNo 為0 設置查詢 ActNo 為1 設置轉檔}
procedure TFormFhrd311.SetEnableControl(ActNo:Integer;Value:Boolean);
begin
  if ActNo=0 then
  begin
    {sel_month.enabled:= true;
    tbb_ok.Enabled := true;
    trb_id.Enabled := false;
    trb_dept.Enabled := false;
    tid_s.Enabled := false;
    tid_e.Enabled := false;
    dept_b.Enabled := false;
    dept_o.Enabled := false;
    tbb_search.Enabled := false;}
  end
  else if ActNo=1 then
  begin
    me_Month2.Enabled:= Value;
    EditEmpBeg2.Enabled := Value;
    EditEmpEnd2.Enabled := Value;
    cob_DeptBeg2.Enabled := Value;
    cob_DeptEnd2.Enabled := Value;
    bbtn_Ok2.Enabled:= Value;
    bbtn_Reset2.Enabled:=not Value;
  end;
end;
procedure TFormFhrd311.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  //定義要用到的語言
 ThisFormUsedWords:='query,ok,reset,find,sal08_titl,fld_emp_id,'+
   'fld_emp_chs,fld_dept_code,msg_add_error,transferfiles,'+
   'msg_confirm_save,dbl_clk_slct_emp,month,fld_pay_mon,fld_base_pay,fld_mgmt_ofr,fld_tech_ofr,'+
   'fld_duty_ofr,fld_envr_ofr,fld_efft_awd,fld_te_pay,fld_duo_awd,fld_full_awd,fld_over_work,fld_gong_pay,fld_supp_agai,'+
   'fld_picc_back,fld_othe_supp,fld_sick_supp,fld_deal_pay,fld_meal_pay,fld_ask_pay,fld_stop_dedu,fld_picc_she,fld_picc_yi,'+
   'fld_laun_pay,fld_tax_pay,fld_sup_dedu,fld_actu_pay,msg_month_data_locked,';
 ws_Words:=GetLangWideStrs(ThisFormUsedWords);
 tntpanel1.Caption := GetLangName(ws_Words,'sal08_titl');
 SetComponentLang(self);
end;

{初始化信息}
procedure TFormFhrd311.FormInit;
begin
  Prv:=GetPrvArr(UserName,'fhrd311');    //sal08 2011-10-03 hyt add
  if Prv[TRAN] then
    pc_prv.Pages[1].TabVisible := true
  else
    pc_prv.Pages[1].TabVisible := false;
//  if Prv[INQ] then
//    pc_prv.Pages[0].TabVisible := true
//  else
//    pc_prv.Pages[0].TabVisible := false;
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept',DeptBegCob);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept',DeptEndCob );
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept',cob_DeptBeg2);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept',cob_DeptEnd2);
//  me_Month2.Text := formatdatetime('yyyymm',date-strtoint(formatdatetime('dd',date))-1);
  me_Month2.Text := formatdatetime('yyyymm',date-12);
  Month.Text:=formatDateTime('yyyymm',date-12);
  //sel_month.Text := formatdatetime('yyyymm',date-strtoint(formatdatetime('dd',date))-1);
end;

procedure TFormFhrd311.FormCreate(Sender: TObject);
begin
  InitLangInfo;
  FormInit;
  SalBaseLvl:=GetAllBaseLvl;//取得所有基本薪資等級額
end;
{===============================================================================
  計算薪資確認
===============================================================================}
procedure TFormFhrd311.bbtn_OK2Click(Sender: TObject);
var
  sql_str:string;
begin
  PayMon:=me_Month2.Text;
  //該月資料已經鎖定
  if (PayMon<=LockMonth)  then //'200804'
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
    exit;
  end;
  MonSDate:=StartOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  MonEDate:=EndOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  sql_str:='select * from fhrd_emp where '
   +' (emp_ledt>='''+FormatDateTime('yyyy/mm/dd',MonSDate)+''' or emp_ledt is null)'
   +' and emp_etdt<='''+FormatDateTime('yyyy/mm/dd',MonEDate)+'''';
   {+' and ((left(dept_code,1)=''V'' and emp_id not in (select emp_id from hrd_emp_upd'
   +' where left(dept_old,1)=''N'' and left(dept_new,1)=''V'' and valid_date>='''+FormatDateTime('yyyy/mm/dd',MonEDate+1)+'''))'
   +' or (left(dept_code,1)=''N'' and emp_id in(select emp_id from hrd_emp_upd'
   +' where left(dept_old,1)=''V'' and left(dept_new,1)=''N'' and valid_date>='''+FormatDateTime('yyyy/mm/dd',MonEDate+1)+''')))';}
  //if rb_ByEmp2.Checked then
  {//begin
  end
  //else if rb_ByDept2.Checked then
  begin
  end;}
  if Trim(EditEmpBeg2.Text)<>'' then
    sql_str:=sql_str+' and emp_id>='''+Trim(EditEmpBeg2.Text)+'''';
  if Trim(EditEmpEnd2.Text)<>'' then
    sql_str:=sql_str+' and emp_id<='''+Trim(EditEmpEnd2.Text)+'''';
  if trim(cob_DeptBeg2.Text)<>'' then
    sql_str:=sql_str+' and dept_code>='''+LeftStr(trim(cob_DeptBeg2.Text),6)+'''';
  if trim(cob_DeptEnd2.Text)<>'' then
    sql_str:=sql_str+' and dept_code<='''+LeftStr(trim(cob_DeptEnd2.Text),6)+'''';
  sql_str:=sql_str+' and emp_info=''0'' order by emp_id';
  with QryEmp do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
    begin
      SetEnableControl(1,false);
      ClientDataSet1.CancelUpdates;
//      ClientDataSet1.Active:=true;
      runthread := TrunThread.Create(false);
    end
    else begin
      WideShowMessage('查尋範圍內無資料存在');
      qry_sal.Close;
    end;
  end;
end;

{轉檔月份重置}
procedure TFormFhrd311.bbtn_Reset2Click(Sender: TObject);
begin
  if (RunThread<>nil) and (not RunThread.Terminated) then
  begin
    RunThread.Suspend;
    if MessageDlg('您確定要取消?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      RunThread.Resume;
      RunThread.Terminate;
      re_Message.Lines.Add('用戶停止了操作！');
      SetEnableControl(1,true);
      ClientDataSet1.CancelUpdates;
    end
    else
      RunThread.Resume;
  end;
end;

{===============================================================================
  計算薪資xian程
===============================================================================}
procedure TRunThread.Execute;
var
  FormFhrd311:TformFhrd311;
  MonthFirstDay:TDateTime; //計算月份的第一天
begin
  FreeOnTerminate := true;
  FormFhrd311 := TFormFhrd311(Application.FindComponent('formFhrd311'));
  with FormFhrd311 do
  begin
  MonthFirstDay:=EncodeDate(StrToInt(LeftStr(me_Month2.Text,4)),StrToInt(MidStr(me_month2.Text,5,2)),1);
  with QryEmp do
  begin
    SetProcessBar(true,1,RecordCount);
    //DMHrdsys.conn.BeginTrans;
    while not Eof do
    begin
      if Terminated then
      begin
        //進程結束，退出
        //dmhrdsys.conn.RollbackTrans;
        SetEnableControl(1,true);
        //ChangeSalDept(payMon);//修正部門等信息
        Exit;
      end;
      aEmpId:=FieldByName('emp_id').AsString;
//      dept_code:=FieldByName('dept_code').AsString;
      SetProcessBar(false,1);
      SetStatusText('當前第'+IntToStr(Recno)+'/'+IntToStr(RecordCount)+'筆');
      { 處理一個員工的資料 }
      //刪除該員工本月薪資
      if ( (FieldByName('emp_ledt').AsString<>'') and (FieldByName('emp_ledt').AsDateTime<=MonthFirstDay)) //本月前離職不處理
        or ( (FieldByName('emp_ledt').AsString<>'') and (FieldByName('emp_ledt').AsDateTime<=FieldByName('emp_etdt').AsDateTime)) then //離職日期小於進廠日期不處理
      begin
        try
          DelPayMT(aEmpId,PayMon);
        except
          //DMHrdsys.conn.RollbackTrans;
        end;
      end
      else
        try
          {計算該員工本月薪資}
          DealAEmp(aEmpId,PayMon);
        except
          //DMHrdsys.conn.RollbackTrans;
        end;
      Next;
    end;
  end;
    //DMHrdsys.conn.CommitTrans;
    //ChangeSalDept(payMon);//修正部門等信息
    SetProcessBar(true);
    SetStatusText('轉檔完畢！');
    re_Message.Lines.Add('轉檔完畢！');
    SetEnableControl(1,true);
  end;
end;
{===============================================================================
  procedure DelPayMT(EmpId,PayMon:String);
  刪除員工薪資主檔紀錄
===============================================================================}
procedure TFormFhrd311.DelPayMT(EmpId,PayMon:String);
begin
  //
  with DMHrdsys.ADOCommand1 do
  begin
    CommandText:='DELETE FROM fhrd_salary WHERE emp_id='''+EmpId+''' AND pay_mon='''+PayMon+'''';
    Execute;
  end;
end;
{===============================================================================
  DealAEmp(EmpId,PayMon:String);
  計算一個員工的薪資
===============================================================================}
procedure TFormFhrd311.DealAEmp(EmpId,PayMon:String);
var
  EmpInfo:TFields;
  aSpcGong:TSpcGongCurrs;              //特別獎金与功績獎金
  aDutCurrs:TDutCurrs;                 //考勤返回數組
  ASalGrads:TSalGrad;                  //調薪記錄中數據
  pre_pst_flag:boolean;                //是否要重新取職務
  aSQL,
  DeptCode,                            //部門
  Factory,                             //廠區
  InfoCode,                            //在職情況
  PstCode,                             //職務代號
  EduCode:String;                      //學歷代號
  CurDateTime,
  EmpInDate,                           //進廠日期(改為抵越日期)
  EmpLvDate:TDateTime;                 //離職日期
  SalBase,                             //薪資總額 ，計算單價用
  PiccPay:Currency;                    //保險基數
  WorkDays:Integer;                    //本月工作天數
  //海外薪資部分
  F_BaseAmt,                           //基本薪資    have done
  F_FrnAmt,                            //海外津貼    have done
  F_FawardAmt,                         //全勤獎      have done
  F_OverAmt,                           //特殊加班    have done
  F_adjustAmt,                         //調整額
  F_askAmt,                            //請假扣款
  F_nightAmt,                          //夜班津貼(合計)
  F_night1Amt,                         //夜班津貼1
  F_night2Amt,                         //夜班津貼2
  F_night3Amt,                         //夜班津貼3
  F_dinnerAmt,                         //補餐費
  F_LocalAmt,                          //零用金      have done
  F_DealAmt,                           //應發薪資(不含調整扣款)    have done
  F_ActuAmt,                           //實際薪資(USD)    have done
  F_RActuAmt,                           //實際薪資(RMB)    have done
  F_BankAmt:Currency;                  //轉賬金額    have done
  //海外工時部分
  F_OnTime,                            //出勤時數    have done
  F_OffTime,                           //缺勤時數
  F_night1Time,                        //夜班津貼1時
  F_night2Time,                        //夜班津貼2時
  F_night3Time:double;                 //夜班津貼3時
begin
//  EmpInfo:=GetEmpInfo(EmpId,PayMon);
  CurDateTime:=GetServerDateTime;
  with QryEmp do
  begin
    DeptCode:=FieldByName('dept_code').AsString;  //部門代號
    Factory:=UpperCase(LeftStr(DeptCode,1));        //廠區
    PstCode:=FieldByName('pst_code').AsString;    //職稱代號
    EduCode:=FieldByName('edu_code').AsString;    //學歷代號
    EmpInDate:=FieldByName('emp_gvdt').AsDateTime;  //進廠日期(抵越日期)
    EmpLvDate:=FieldByName('emp_ledt').AsDateTime;  //離職日期
//    InfoCode:=FieldByName('info_code').AsString;  //在職狀態
  end;

  WorkDays:=GetWorkDays(PayMon,EmpInDate,EmpLvDate);    //本月工作天數

  {開始計算 以F_開頭的變量為數據庫薪資檔中的欄位}

  //查找調薪紀錄(hrd_sal_grade)
  aSQL:='select * from fhrd_tranhist where emp_id='''+EmpId+''' and base_amt>0 order by valid_date desc ';
  with qry_Grad do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    if not Eof then
    begin
      first;
      pre_pst_flag:=false;
      while not Eof do
      begin
        if DateOf(FieldByName('valid_date').AsDateTime)>DateOf(MonEDate) then
        begin//當月之後有調職紀錄
          Next;
          pre_pst_flag:=true;
        end
        else
          Break;
      end;
      {if (pre_pst_flag) and (not Eof) then//重新取得調職前的職稱
        PstCode:=FieldByName('pst_code').AsString;}
      if (pre_pst_flag) then//重新取得調職前的職稱(當月后有調職)
      begin
        if (not Eof) then//之前有調職
          PstCode:=FieldByName('pst_code').AsString
        else//之前未調職
          PstCode:='60';
      end;
    end;
      CurrCate:='';
      ASalGrads:=GetSalTran(EmpId,PayMon,PstCode,EduCode,WorkDays,EmpInDate,EmpLvDate);
      if CurrCate = '' then
         showmessage( empid + '的調薪幣別為空!!') ;              //4,零用金

      if CurrCate = 'USD'  then
         begin
           F_BaseAmt:=ASalGrads[0]*7.5;                  //0,基本薪資
           F_FrnAmt:=ASalGrads[1]*7.5;                   //1,海外津貼
           F_FawardAmt:=ASalGrads[2]*7.5;                //2,全勤獎
           if pstcode <='14' then //2011-12-07 hyt add 18==>14
              F_OverAmt:=ASalGrads[3]*7.5                  //3,固定加班
           else
           begin
              if PayMon>='201406' then
                 F_OverAmt:=ASalGrads[3]*7.5                  //3,固定加班 2014-06-12 hyt add
              else
                 F_OverAmt:= 0 ;
           end;

           F_LocalAmt:=ASalGrads[4]*7.5;                 //4,零用金
        end
      else
        begin
          F_BaseAmt:=ASalGrads[0];                  //0,基本薪資
          F_FrnAmt:=ASalGrads[1];                   //1,海外津貼
          F_FawardAmt:=ASalGrads[2];                //2,全勤獎
          if pstcode <='14' then //2011-12-07 hyt add 18==>14
             F_OverAmt:=ASalGrads[3]                  //3,固定加班
          else
             F_OverAmt:= 0 ;
          F_LocalAmt:=ASalGrads[4];                 //4,零用金
        end;

      Close;
  end;
  F_DealAmt:=F_BaseAmt+F_FrnAmt+F_FawardAmt+F_OverAmt; //應發薪資
  if CurrCate = 'USD'  then
     begin
       F_askAmt:=0-GetAskPay(aEmpId,PayMon,WorkDays,F_DealAmt,F_BaseAmt); //請假扣款
       F_askAmt :=strtofloat( FormatFloat('0.00', F_askAmt )) ;
       F_adjustAmt:=GetAdjustPay(aEmpId,PayMon)*7.5; //上月調整
     end
  else
     begin
        F_askAmt:=0-GetAskPay(aEmpId,PayMon,WorkDays,F_DealAmt,F_BaseAmt); //請假扣款
       F_askAmt :=strtofloat( FormatFloat('0.00', F_askAmt )) ;
       F_adjustAmt:=GetAdjustPay(aEmpId,PayMon); //上月調整
     end;
  aDuty:=GetNightDut(aEmpId,PayMon,Factory);    //夜班考勤
  //考勤部分
  F_OnTime:=aDuty[1];
  F_OffTime:=aDuty[2];
  F_night1Time:=aDuty[3];
  F_night2Time:=aDuty[4];
  F_night3Time:=aDuty[5];
  //金額部分
  F_night1Amt:=aDuty[6];
  F_night2Amt:=aDuty[7];
  F_night3Amt:=aDuty[8];
 // 2009.04.22 <<
 // F_dinnerAmt:=aDuty[9]*7.5;
 // 2009.04.22 >>
  if pstcode >'14' then //2011-12-07 hyt add 18==>14
  begin
     if (PayMon>='201406') and (PayMon<='201511') then   //2014-06-12 hyt add
       F_dinnerAmt:=0
     else
       F_dinnerAmt:=getoveramt( aEmpId,ASalGrads[5]*7.5, MonSDate,MonEDate )
  end
  else
     F_dinnerAmt:= 0 ;
 // 2009.04.22 >>
  F_nightAmt:=( F_night1Amt+F_night2Amt+F_night3Amt ) *7.5 ;  //夜班津貼合計
  if CurrCate ='USD' then
     F_DealAmt:= F_DealAmt+ F_nightAmt+F_dinnerAmt      //應發薪資
  else
      F_DealAmt:= F_DealAmt+F_nightAmt+F_dinnerAmt ;
  F_ActuAmt:=F_DealAmt+F_adjustAmt+ F_askAmt ;        //26-實發薪資

  F_LocalAmt:=min(F_LocalAmt,F_ActuAmt);            //修正零用金
  F_BankAmt:=F_ActuAmt- F_LocalAmt;                  //27-轉賬薪資
  if F_ActuAmt<0 then
  begin
    F_ActuAmt:=0;
    re_Message.Lines.Add('員工'+EmpId+' 的實發薪資小于零！請重新計算！');
  end;
  with qry_temp2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM fhrd_salary WHERE emp_id='''+EmpId+''' AND sal_month='''+PayMon+'''');
    Open;
    if Eof then
    begin
      Append;
      FieldByName('emp_id').AsString:=EmpId;
      FieldByName('sal_month').AsString:=PayMon;
    end
    else
      Edit;
    //欄位賦值
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=CurDateTime;
    FieldByName('dept_code').AsString:=DeptCode;
    FieldByName('pst_code').AsString:=PstCode;
    FieldByName('sal_bas').AsCurrency:=F_BaseAmt;
    FieldByName('sal_frn').AsCurrency:=F_FrnAmt;
    FieldByName('f_award').AsCurrency:=F_FawardAmt;
    FieldByName('fix_add').AsCurrency:=F_OverAmt;
    FieldByName('adjust').AsCurrency:=F_adjustAmt;
    FieldByName('ask_pay').AsCurrency:=F_askAmt;
    FieldByName('night_amt').AsCurrency:=F_NightAmt;
    FieldByName('night1_price').AsCurrency:=F_Night1Amt;
    FieldByName('night2_price').AsCurrency:=F_Night2Amt;
    FieldByName('night3_price').AsCurrency:=F_Night3Amt;
    FieldByName('dinner_price').AsCurrency:=F_DinnerAmt;
    FieldByName('actu_sal').AsCurrency:=F_ActuAmt;
    FieldByName('local_amt').AsCurrency:=F_LocalAmt;
    FieldByName('bank_sal').AsCurrency:=F_BankAmt;
    FieldByName('on_duty').AsCurrency:=F_OnTime;
    FieldByName('off_duty').AsCurrency:=F_OffTime;
    FieldByName('night1_duty').AsCurrency:=F_Night1Time;
    FieldByName('night2_duty').AsCurrency:=F_Night2Time;
    FieldByName('night3_duty').AsCurrency:=F_Night3Time;    
    if paymon > '200804'  then
     FieldByName('Curr_cate').AsString :='RMB'
    else
      FieldByName('Curr_cate').AsString :='USD';
    Post;
  end;
  with ClientDataSet1 do
  begin
    Append;
    FieldByName('emp_id').AsString:=EmpId;
    FieldByName('sal_month').AsString:=PayMon;
    //欄位賦值
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=CurDateTime;
    FieldByName('dept_code').AsString:=DeptCode;
    FieldByName('pst_code').AsString:=PstCode;
  //  FieldByName('sal_bas').AsCurrency:=F_BaseAmt;
    FieldByName('sal_frn').AsCurrency:=F_FrnAmt;
    FieldByName('f_award').AsCurrency:=F_FawardAmt;
    FieldByName('fix_add').AsCurrency:=F_OverAmt;

    //FieldByName('adjust').AsCurrency:=F_adjustAmt;
    if F_adjustAmt<=9999 then //2012-01-06 hyt update 超過5位，目前還沒找到修改的方法特殊跳過
      FieldByName('adjust').AsCurrency:=F_adjustAmt;
      
    FieldByName('ask_pay').AsCurrency:=F_askAmt;
    FieldByName('night_amt').AsCurrency:=F_NightAmt;
    FieldByName('night1_price').AsCurrency:=F_Night1Amt;
    FieldByName('night2_price').AsCurrency:=F_Night2Amt;
    FieldByName('night3_price').AsCurrency:=F_Night3Amt;
    FieldByName('dinner_price').AsCurrency:=F_DinnerAmt;
    FieldByName('actu_sal').AsCurrency:=F_ActuAmt;
    FieldByName('local_amt').AsCurrency:=F_LocalAmt;
    FieldByName('bank_sal').AsCurrency:=F_BankAmt;
    FieldByName('on_duty').AsCurrency:=F_OnTime;
    FieldByName('off_duty').AsCurrency:=F_OffTime;
    FieldByName('night1_duty').AsCurrency:=F_Night1Time;
    FieldByName('night2_duty').AsCurrency:=F_Night2Time;
    FieldByName('night3_duty').AsCurrency:=F_Night3Time;
    if paymon > '200804'  then
     FieldByName('Curr_cate').AsString :='RMB'
    else
      FieldByName('Curr_cate').AsString :='USD';
    Post;
  end;
end;

{===============================================================================
  函數名稱:GetSunDayCount -- 得到輸入範圍內的星期天數
  參數:    DayBeg -- 開始日期 DayEnd -- 結束日期 YearMonth -- 年月
===============================================================================}
function GetSunDayCount(DayBeg,DayEnd:Integer;YearMonth:String):Integer;
var
  i,Count:Integer;
  SDate,EDate:TDateTime;
begin
  TryEnCodeDate(StrToInt(LeftStr(YearMonth,4)),StrToInt(RightStr(YearMonth,2)),DayBeg,SDate);
  TryEnCodeDate(StrToInt(LeftStr(YearMonth,4)),StrToInt(RightStr(YearMonth,2)),DayEnd,EDate);
  Count:=GetRestDayCount(SDate,EDate);
  Result:=Count;
end;
{===============================================================================
  計算當月工作天數
===============================================================================}
function GetWorkDays(PayMon:String;EmpInDate,EmpLvDate:TDateTime):Integer;
var
  WorkDays,TheInDay,TheLvDay,HaveInMonths,SunDays,TheMaxDay:Integer;
  MonEnd:TDateTime;
begin
  //員工已進廠月數
  HaveInMonths:=StrToInt(RightStr(PayMon,2))+(StrToInt(LeftStr(PayMon,4))-
                YearOf(EmpInDate))*12-MonthOf(EmpInDate);
  //員工進廠日
  TheInDay:=DayOf(EmpInDate);
  //員工離職日
  if (EmpLvDate<>0) then
    TheLvDay:=DayOf(EmpLvDate)-1;
  //該月最後一天
  MonEnd:=EndOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  if HaveInMonths=0 then  //新進員工
  begin
    if (EmpLvDate=0) or (EmpLvDate>MonEnd) then
    begin
      //2016.12.03s
      // SunDays:=GetSunDayCount(1,TheInDay,PayMon);
      SunDays:=GetSunDayCount(TheInDay, DayOf(MonEnd),PayMon);
      // WorkDays:= 26-(TheInDay-SunDays)+1; //2012-07-06 hyt add 加1天,因規定一進廠就要算薪資  exp:060081
      WorkDays:= DayOf(MonEnd)-TheInDay-SunDays+1;
    end
    else begin
      SunDays:=GetSunDayCount(TheInDay,TheLvDay,PayMon);
      WorkDays:=TheLvDay-Sundays;
    end;
  end
  else begin
    if (EmpLvDate=0) or (EmpLvDate>MonEnd) then
    begin
      WorkDays:= 26 ; //2. 26;
    end
    else begin
      SunDays:=GetSunDayCount(1,TheLvDay,PayMon);
      WorkDays:=TheLvDay ; //-SunDays;
    end;
  end;
  WorkDays:=max(WorkDays,0);
  Result:=WorkDays;
end;
{===============================================================================
  計算當月試用期与正式工資天數
===============================================================================}
function GetNormalTestDays(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime):TNormalTestDays;
var
  NormalTestDays:TNormalTestDays;
  CurServerDateTime:TDateTime;  //服務器上當前時間
  HaveInMonths,                 //計算薪資的當月員工已進廠月數
  TheInDay,                     //員工進廠日
  TheLvDay,                     //員工離職日
  WorkDays,                     //本月工作天數
  TestDays,                     //試用期工作天數
  NormalDays,                   //試用期滿工作天數
  SunDayCount,                  //星期天數
  TheMaxDay:Integer;            //薪資計算當月天數
begin
  //取服務器當前時間
  //CurServerDateTime:=GetServerDateTime;
  //員工已進廠月數
  HaveInMonths:=StrToInt(RightStr(PayMon,2))+(StrToInt(LeftStr(PayMon,4))-
                YearOf(EmpInDate))*12-MonthOf(EmpInDate);
  //每月最大一天
  TheMaxDay:=DaysInAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  //員工進廠日
  TheInDay:=DayOf(EmpInDate);
  {本月進廠}
  if HaveInMonths=0 then  //pst_code "60" 及 其他共用
  begin
    if (EmpLvDate=0) or (EmpLvDate>MonEDate) then   //非離職,即在職
    begin
      SundayCount:=GetSundayCount(1,TheInDay,PayMon);
      TestDays:=26 -TheInDay ;  ///30-TheInDay ; //26-(TheInDay-SundayCount);
      NormalDays:=0;
    end
    else begin//當月即離職
      TheLvDay:=DayOf(EmpLvDate)-1;
      SundayCount:=GetSundayCount(TheInDay+1,TheLvDay,PayMon);
      TestDays:=TheLvDay-TheInDay; //-SundayCount;
      NormalDays:=0;
    end;
  end
  {進廠一個月}
  else if HaveInMonths=1 then
  begin
    if PstCode='60' then   //作業員
    begin
      if (EmpLvDate=0) or (EmpLvDate>MonEDate) then  //非離職,即在職
      begin
        TestDays:=TheInDay;
        if TestDays>=TheMaxDay then
          TestDays:=TheMaxDay;
        SunDayCount:=GetSundayCount(1,TestDays,PayMon);
        TestDays:=TestDays; // 3. -SunDayCount;
        NormalDays:= 26 -TestDays ; //4. 26-TestDays;
      end
      else begin          //離職日期不空，本月离職
        TheLvDay:=DayOf(EmpLvDate)-1;
        if TheLvDay > TheInDay then     //滿一個月了,薪資分試用期部分与正常部分
        begin
          TestDays:=TheInDay;
          SunDayCount:=GetSundayCount(1,TheInDay,PayMon);
          TestDays:=TestDays ; //7. -SunDayCount;
          NormalDays:=TheLvDay-TheInDay;
          SunDayCount:=GetSundayCount(TheInDay+1,TheLvDay,PayMon);
          NormalDays:=NormalDays ; // 8. -SunDayCount;
        end
        else begin                     //未滿一個月，薪資試用期
          TestDays:=TheLvDay;
          SunDayCount:=GetSundayCount(1,TestDays,PayMon);
          TestDays:=TestDays ; // 6. -SunDayCount;
          NormalDays:=0;
        end;
      end;
    end
    else begin             //非作業員
      if (EmpLvDate=0) or (EmpLvDate>MonEDate) then //在職
      begin
        TestDays:= 26 ; //5. 26;
        NormalDays:=0;
      end
      else begin                  //離職
        TheLvDay:=DayOf(EmpLvDate)-1;
        TestDays:=TheLvDay;
        SundayCount:=GetSundayCount(1,TheLvDay,PayMon);
        TestDays:=TestDays ; //9. -SundayCount;
        NormalDays:=0;
      end;
    end;
  end
  {進廠兩個月}
  else if (HaveInMonths=2) and (PstCode<>'60')  then
  begin
    if (EmpLvDate=0) or (EmpLvDate>MonEDate) then //在職
    begin
      TestDays:=TheInDay;
      if TestDays>TheMaxDay then
        TestDays:=TheMaxDay;
      SundayCount:=GetSundayCount(1,TheInDay,PayMon);
      TestDays:=TestDays ; // 10. -SundayCount;
      NormalDays:=26-TestDays; //26-TestDays;
    end
    else begin   //離職
      TheLvDay:=DayOf(EmpLvDate)-1;
      if TheLvDay>TheInDay then //滿試用期，分試用期薪資与滿試用期薪資
      begin
        TestDays:=TheInDay;
        SundayCount:=GetSundayCount(1,TheInDay,PayMon);
        TestDays:=TestDays; //11.-SundayCount;
        NormalDays:=TheLvDay-TheInDay;
        SundayCount:=GetSundayCount(TheInDay+1,TheLvDay,PayMon);
        NormalDays:=NormalDays ; //12.-SundayCount;
      end
      else begin               //未滿試用期，全部為試用期薪資
        TestDays:=TheLvDay;
        SundayCount:=GetSundayCount(1,TheLvDay,PayMon);
        TestDays:=TestDays ; //13. -SundayCount;
        NormalDays:=0;
      end;
    end;
  end
  {進廠兩個月以上}
  else begin
    if (EmpLvDate=0) or (EmpLvDate>MonEDate) then   //非離職,即在職
    begin
      TestDays:=0;
      NormalDays:= 26 ; //26;
    end
    else begin
      TheLvDay:=DayOf(EmpLvDate)-1;
      TestDays:=0;
      TheLvDay:=DayOf(EmpLvDate)-1;
      SundayCount:=GetSundayCount(1,TheLvDay,PayMon);
      NormalDays:=TheLvDay; // 14.-SundayCount;
    end;
  end;
  //if NormalDays>26 then NormalDays:=26;
  if NormalDays>26 then NormalDays:=26;
  if NormalDays<0 then NormalDays:=0;
  if TestDays<0 then TestDays:=0;
 // if TestDays>26 then TestDays:=26;
  if TestDays>26 then TestDays:=26;
  NormalTestDays[0]:=NormalDays;
  NormalTestDays[1]:=TestDays;
  Result:=NormalTestDays;
end;

{===============================================================================
  GetDut
  返回值: TSalGrad 0-基本工資 1-主管加給 2-專業加給  3-職務津貼(工種補貼)
                   4-環境津貼 5-職等金額 6-特別獎金
===============================================================================}
function TFormFhrd311.GetSalTran(EmpId,PayMon,PstCode,EduCode:String;WorkDays:Integer;
  EmpInDate,EmpLvDate:TDatetime):TSalGrad;
var
  WorkSal,              //工種補貼
  base_amt,frn_amt,faward_amt,over_amt,local_amt, sal_base :Currency;
  aSQL,Pst_Code,sOver_spc :String;
  ValidDay,FirstDay,SecondDay,EDay,SDay,DayCount,DayLeft:Integer;
begin
  base_amt:=0;
  frn_amt:=0;
  faward_amt:=0;
  over_amt:=0;
  local_amt:=0;
  sal_base := 0 ;
  //aSQL:='SELECT * FROM fhrd_tranhist WHERE emp_id='''+EmpId+''' and base_amt>0'
  //2011-12-07 hyt upd 人事規定2011-12 開始主任級沒有固定加班費 25$
  //aSQL:='SELECT case when pst_code<=''14'' then over_amt else 0 end as over_amt, *  '
  //2014-06-12 hyt upd
  //2015.12.28 2015年12月起副理以下級有加班費
  if (PayMon>='201406') and (PayMon<='201511') then
    sOver_spc:='ROUND(base_amt*200*1.5/(208*12),0)'
  else
    sOver_spc:='0';

  aSQL:='SELECT case when pst_code<=''14'' then over_amt else '+sOver_spc+' end as over_amt, *  '
    +'FROM fhrd_tranhist WHERE emp_id='''+EmpId+''' and base_amt>0'
    +' AND valid_date<='''+FormatDateTime('yyyy/mm/dd',MonEDate)+''' order BY valid_date desc';
  with qry_temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    EDay:=DayOf(MonEDate);
    if (EDay=28) or (EDay=29) then
      EDay:=30;//二月調整天數

    DayLeft:=WorkDays;//剩下可用天數最多為工作天數(如26)
    //OfrPay:=0;
    while not eof do
    begin
      if DateOf(FieldByName('valid_date').AsDateTime)>DateOf(MonEDate) then
        Next;//跳過當月之後調職的紀錄
      Pst_Code:=FieldByName('pst_code').AsString;
      CurrCate:=FieldByName('Curr_Cate').AsString; // 2008.05.23 <<
      SDay:=DayOf(FieldByName('valid_date').AsDateTime);
      if DateOf(FieldByName('valid_date').AsDateTime)<DateOf(MonSDate) then
        SDay:=1;//上月調職的紀錄設置起始日期為1
      if GetSunDayCount(SDay,EDay,PayMon) = 5 then
          Eday := 31;
    //  if ( copy(paymon, 5,2) = '08' ) or ( copy(paymon, 5,2) = '10' ) or  ( copy(paymon, 5,2) = '12' ) then
    //      Eday := 31;
//      if Eday > 26 then Eday := 26 ;
      DayCount:=EDay-SDay+GetSunDayCount(SDay,EDay,PayMon)+1;
      DayCount:=min(DayCount,DayLeft);
      sal_base := FieldByName('base_amt').AsFloat ;
      base_amt:=base_amt+FieldByName('base_amt').AsFloat*DayCount/26 ;//30 ; ///26;
      frn_amt:=frn_amt+FieldByName('frn_amt').AsFloat*DayCount/26; //30;
      if DayCount <> 26 then
         faward_amt:= 0
      else
         faward_amt:=faward_amt+FieldByName('faward_amt').AsFloat*DayCount/26; ///30;
      over_amt:=over_amt+FieldByName('over_amt').AsFloat*DayCount/26; //30;
      //local_amt:=local_amt+int(FieldByName('local_amt').AsFloat*DayCount/26);
      local_amt:=FieldByName('local_amt').AsFloat;
      DayLeft:=DayLeft-DayCount;
      EDay:=SDay;
      if EDay=1 then//無本月調職記錄,退出
        break;
      Next;
    end;
  end;
  result[0]:=base_amt;
  result[1]:=frn_amt;
  result[2]:=faward_amt;
  result[3]:=over_amt;
  result[4]:=local_amt;
  result[5]:=sal_base;
end;

procedure TFormFhrd311.tbb_okClick(Sender: TObject);
begin
 // sel_month.Enabled := false;
 // trb_id.Enabled := true;
  //trb_dept.Enabled := true;
 // tbb_search.Enabled := true;
 // tbb_ok.Enabled := false;
end;

procedure TFormFhrd311.tbb_resetClick(Sender: TObject);
begin
  adoquery1.Close;
 // tbb_ok.Enabled := true;
end;

procedure TFormFhrd311.sb_EmpBeg2Click(Sender: TObject);
var
  empid:String;
begin
  empid := FindEmpId('emp_id',me_month2.Text);
  if empid<>'' then
  begin
    if TTntSpeedButton(Sender).Name='sb_EmpBeg2' then
      EditEmpBeg2.Text:= empid
    else if TTntSpeedButton(Sender).Name='sb_EmpEnd2' then
      EditEmpEnd2.Text:=empid;
  end;
end;

procedure TFormFhrd311.N1Click(Sender: TObject);
begin
  re_Message.Clear;
end;

function  TFormFhrd311.GetAdjustPay(EmpId,PayMon:String):Currency;
//上月調整
var
  RetCur:Currency;
  aSQL,LastMon:String;
  ADate:TDatetime;
begin
  RetCur:=0;
  ADate:=EnCodeDate(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)),1)-1;
  LastMon:=FormatDateTime('yyyymm',ADate);
  aSQL:='SELECT * FROM fhrd_sal_adjust WHERE emp_id='''+EmpId+''' AND al_mon='''+LastMon+'''';
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    while not Eof do
    begin
      if FieldByName('al_type').AsString='1' then//補發
        RetCur:=RetCur+FieldByName('al_money').AsCurrency;
      if FieldByName('al_type').AsString='2' then//補扣
        RetCur:=RetCur-FieldByName('al_money').AsCurrency;
      Next;
    end;
    Close;
  end;
  Result:=RetCur;
end;

function TFormFhrd311.GetAskPay(EmpId,PayMon:String;AWorkDays:integer;DealPay,BasePay:double):Currency;
//計算請假扣款，並給請假數組賦值
var
  sql_str,SDate,EDate,clas_code:string;
  MminDate,MmaxDate,minDate,maxDate,minTime,maxTime:TDateTime;
  AdjustPay, AdjustPay1:Currency;
  AskDay,per_rate, nlask:double;
  i :integer;
  bADDFlag :boolean;
begin
  AdjustPay1:=0;
  AdjustPay:=0;
  AskDay:=0;
  nlAsk := 0 ;
  for i:=1 to 31 do
    AskArr[i]:=0;
  MminDate:=StartOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  MmaxDate:=EndOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  SDate:=FormatDateTime('yyyy/mm/dd',StartOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2))));
  EDate:=FormatDateTime('yyyy/mm/dd',EndOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2))));
  sql_str:='select * from fhrd_hol where emp_id='''+empId+''''
    +' and (('''+SDate+''' between up_date and down_date)'
    +'   or ('''+EDate+''' between up_date and down_date)'
    +'   or (up_date between '''+SDate+''' and '''+EDate+''')'
    +'   or (down_date between '''+SDate+''' and '''+EDate+'''))';
  with Qry_temp do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    Open;


    bADDFlag:=false;
    first;
    while not Eof do
    begin//計算缺勤時間
      clas_code:=FieldByName('cls_id').AsString;
      //if (clas_code='08') or ((clas_code>='13') and (clas_code<='16')) then
      //2012-08-08 hyt upd 2012-09-13==>add <27 陪產假,28 計畫生育假>     2013-10-31 hyt add 19 國假
      if (clas_code='08') or (clas_code='64') or (clas_code='27') or (clas_code='28') or (clas_code='19') or ((clas_code>='13') and (clas_code<='16')) then
        per_rate:=0//不扣
      else if (clas_code='09') or (clas_code='10') then
        per_rate:=0.2//扣20%
      else
        per_rate:=1;//全扣


      minDate:=max(FieldByName('up_date').AsDateTime,MminDate);
      maxDate:=min(FieldByName('down_date').AsDateTime,MmaxDate);
      minTime:=ShortstrToTime(FieldByName('up_time').AsString);
      maxTime:=ShortstrToTime(FieldByName('down_time').AsString);
      //AskDay:=AskDay+(maxDate-minDate-GetRestDayCount(minDate,maxDate));
      AskDay:=(maxDate-minDate ) ; //-GetRestDayCount(minDate,maxDate));//只統計本次請假
      AskDay:=AskDay+round((maxTime-minTime)*24/4)/2;
     // nlAsk := nlAsk + AskDay ;
      if (clas_code='08') or ((clas_code>='13') and (clas_code<='16')) or (clas_code='27')  or (clas_code='19')  then   //2013-10-31 hyt add 19 國假
         AskDay := 0;
     // nlAsk := nlAsk + AskDay ;
       nlAsk := AskDay ;
      if ( GetSunDayCount(DayOf(minDate),DayOf(maxDate),PayMon ) > 0 )   and ( nlAsk > 0 ) then
         nlAsk := nlAsk - GetSunDayCount(DayOf(minDate),DayOf(maxDate),PayMon ) ;
    //  if (clas_code='08') or ((clas_code>='13') and (clas_code<='16')) then
     //    AskDay := 0;
      //  nlAsk:=0   ;//不扣
      // 2007.05.01 起生育假要扣除薪資       <<
     // if clas_code='21' then
    //    AdjustPay:=AdjustPay+(DealPay-BasePay)*AskDay*per_rate/AWorkDays//生育假不扣本薪
    //  else
       // 2007.05.01 起生育假要扣除薪資       >>

    //  AdjustPay:=AdjustPay+DealPay*AskDay*per_rate/AWorkDays;//本次請假金額
      for i:=DayOf(minDate) to  DayOf(maxDate) do
      begin//保存請假時數
        AskArr[i]:=(round((maxTime-minTime)*24/4)/2)*8;
      end;
      if nlask > 26 then nlask := 26  ;  //30

      //<<<***2013-03-05 hyt add   
      if PayMon='201302' then
      begin
        if nlask=24 then nlask:=26;
      end;
      //***>>>

      AdjustPay:=( DealPay-5*7.5 )*nlAsk*per_rate/AWorkDays;//本次請假金額
       if  (nlask > 0 )  then
        begin
          if (clas_code='08') or ((clas_code>='13') and (clas_code<='16')) or (clas_code='27') then
            AdjustPay:= 0
          else
          begin
             //***<<<2011-10-03 hyt add
             if not bADDFlag  then
             begin
               AdjustPay:= AdjustPay + 5*7.5 ;// 2010.08.02 <<//sk*per_rate/AWorkDays ;
               bADDFlag:=true;
             end;
             //***>>>
             //AdjustPay:= AdjustPay + 5*7.5 ;// 2010.08.02 <<//sk*per_rate/AWorkDays ;
          end;
        end ;
        AdjustPay1:= AdjustPay1 + AdjustPay ;
      Next;
    end;
  end;
//  if copy( paymon, 5,2  )  <> '08' then
    // if nlask > 26 then nlask := 26 ;
    // 2008.06.26 <<
//     if nlask > 30 then nlask := 30 ;
     // 2008.06.26 >>
 // else
  //    nlask := 27 ;
 // if ( copy( paymon, 5,2  )  = '08' ) and ( EditEmpBeg2.Text = '001409' )  then
  //   AWorkDays := 27 ;
  // 2007.08.31 upd <<
//  AdjustPay:=DealPay*nlAsk*per_rate/AWorkDays;//本次請假金額
    // 2008.6.26 <<
    // AdjustPay:=( DealPay-5*7.5 )*nlAsk*per_rate/AWorkDays;//本次請假金額
    // 2008.06.26 >>
    // 2007.09.25 upd <<
 //    AdjustPay:=DealPay*nlAsk*per_rate/AWorkDays  ;//本次請假金額
    // 2008.06.25 <<
   // 2010.08.02  <<
   //  if  (nlask > 0 )  then
     //2010.08.02 >>
     //   begin
      //    if (clas_code='08') or ((clas_code>='13') and (clas_code<='16')) then
      //      AdjustPay:= 0
       //   else
       //2010.08.02 <<
     //  AdjustPay1:= AdjustPay1 + 5*7.5 ;
      // 2010.08.02 >>
       // end ;
       // 2008.06.26 >>
    // 2007.09.25 upd >>
    // 2007.08.31 upd >>
  //AdjustPay:=DealPay*AskDay/AWorkDays;
  result:=AdjustPay1;
end;

function TFormFhrd311.GetNightDut(EmpId,PayMon,Factory:String):TDutyArr;
//夜班考勤
  {**************
  aduty[0]-> 基本時數208
  aduty[1]-> 上班時數
  aduty[2]-> 缺勤時數
  aduty[3]-> 小夜班時數(中班)
  aduty[4]-> 大夜班(晚班)(8 H)時數
  aduty[5]-> 大夜班(12H)時數
  aduty[6]-> 小夜班補貼額
  aduty[7]-> 大夜班(晚班)(8 H)補貼額
  aduty[8]-> 大夜班(12H)補貼額
  aduty[9]-> 餐補費
  **************}
var
  sql_str,SDate,EDate:string;
  minDate,maxDate,minTime,maxTime:TDateTime;
  AdjustPay:Currency;
  AskDay,OnceTime:double;
  i:integer;
  TmpDuty:TDutyArr;
begin
  for i:=0 to 9 do
    TmpDuty[i]:=0;
  {if (Factory='B') or (Factory='V') then
  begin//跳過
    result:=TmpDuty;
    exit;
  end;}
  minDate:=StartOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  maxDate:=EndOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  SDate:=FormatDateTime('yyyy/mm/dd',StartOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2))));
  EDate:=FormatDateTime('yyyy/mm/dd',EndOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2))));
  sql_str:='select * from fhrd_arr A,fhrd_segment B where A.seg_id=B.seg_id'
    +' and emp_id='''+EmpId+''' and night_amt>0'
    +' and arr_date>='''+SDate+''' and arr_date<='''+EDate+'''';
  with qry_temp do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    while not Eof do
    begin
      OnceTime:=FieldByName('time_count').AsFloat;
      //忽略夜班請假時間
      OnceTime:=OnceTime-AskArr[DayOf(FieldByName('arr_date').AsDateTime)];
      if FieldByName('seg_id').AsString='02' then//中班
      begin
        TmpDuty[3]:=TmpDuty[3]+OnceTime;
        TmpDuty[6]:=TmpDuty[6]+OnceTime*FieldByName('night_amt').AsFloat/8;
      end;
      if FieldByName('seg_id').AsString='03' then//夜班
      begin
        TmpDuty[4]:=TmpDuty[4]+OnceTime;
        TmpDuty[7]:=TmpDuty[7]+OnceTime*FieldByName('night_amt').AsFloat/8;
      end;
      if FieldByName('seg_id').AsString='04' then//大夜班
      begin
        TmpDuty[5]:=TmpDuty[5]+OnceTime;
        TmpDuty[8]:=TmpDuty[8]+OnceTime*FieldByName('night_amt').AsFloat/12;
      end;
      Next;
    end;
  end;
  //TmpDuty[9]:=(((TmpDuty[3]+TmpDuty[4]+TmpDuty[5])/8)*8000)/16000;//夜點補貼
  TmpDuty[9]:=0;
  result:=TmpDuty;
end;

procedure TFormFhrd311.selectDataClick(Sender: TObject);
var
  sSelStr, sql, a : string;
  lcYear,lcMonth : Integer;
  CurrRate:double;
begin
  if month.Text='' then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_month_null'),mtError,[mbyes],1);
    month.SetFocus;
    exit;
  end
  else
  begin
    Currrate:= 1;

    if length(month.Text )<>6 then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'dut03_dateerror'),mtError,[mbyes],1);
      exit;
    end;
    try
      lcYear:=StrToInt(LeftStr(month.Text,4));
      lcMonth:=StrToInt(RightStr(month.Text,2));
    except
      exit;
    end;
    if (lcMonth>12) or (lcMonth<1) or (lcYear>2100) or (lcYear<1900) then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'dut03_dateerror'),mtError,[mbyes],1);
      exit;
    end;
 // end;
     if month.Text <= '200804'  then
       begin

      sSelStr := 'select * from fhrd_salary A, fhrd_emp as b where A.sal_month='''+month.Text+'''';
      if trim(empIdBeg.Text)<>'' then
        sSelStr := sSelStr+' and A.emp_id>='''+empIdBeg.Text+'''';
      if trim(empIdEnd.Text)<>'' then
        sSelStr := sSelStr+' and A.emp_id<='''+empIdEnd.Text+'''';
      if trim(deptBegCob.Text)<>'' then
        sSelStr := sSelStr+' and A.dept_code>='''+LeftStr(deptBegCob.Text,6)+'''';
      if trim(deptEndCob.Text)<>'' then
        sSelStr := sSelStr+' and A.dept_code<='''+LeftStr(deptEndCob.Text,6)+'''';
      sSelStr := sSelStr+' and a.emp_id=b.emp_id and b.emp_info =''0''  order by A.dept_code,A.emp_id';
      end
     else
        begin
        sSelStr := 'select * from fhrd_salary A, fhrd_emp as b  where A.sal_month='''+month.Text+'''';
      if trim(empIdBeg.Text)<>'' then
        sSelStr := sSelStr+' and A.emp_id>='''+empIdBeg.Text+'''';
      if trim(empIdEnd.Text)<>'' then
        sSelStr := sSelStr+' and A.emp_id<='''+empIdEnd.Text+'''';
      if trim(deptBegCob.Text)<>'' then
        sSelStr := sSelStr+' and A.dept_code>='''+LeftStr(deptBegCob.Text,6)+'''';
      if trim(deptEndCob.Text)<>'' then
        sSelStr := sSelStr+' and A.dept_code<='''+LeftStr(deptEndCob.Text,6)+'''';
      sSelStr := sSelStr+'   and a.emp_id=b.emp_id and b.emp_info =''0''  order by A.dept_code,A.emp_id'
     end;
  try
    with salaryQry do
    begin
      close;
      sql.Clear;
      sql.Add(sSelStr);
      open;
      tntlabel4.Caption := inttostr(salaryQry.RecordCount ) ; 
    //  prnData.Enabled := true;
      if RecordCount<=0 then
      begin
        widemessagedlg('no data',mtError,[mbyes],1);
      //  prnData.Enabled := false;
      end;
    end;
  except
    widemessagedlg('query_error',mtError,[mbyes],1);
  end;
 end;

end;

procedure TFormFhrd311.TntBitBtn1Click(Sender: TObject);
var
   year , mon :string ;
begin
    year := copy(month.Text, 1,4) ;
    mon  := copy(month.Text, 5,2) ;
    showPrint(salaryQry,year + '年' + mon + ' 月  陸籍員工薪資明細表');
end;
function  TFormFhrd311.GetOverAmt(EmpId:String;BasePay:double; MonSDate,MonEDate:TDatetime): Currency;
//上月調整
var
  RetCur:Currency;
  aSQL,LastMon:String;
  ADate:TDatetime;
  nlhour,nl2hour :real ;
begin
  RetCur:=0;
  nlhour := 0 ;
  nl2hour:= 0 ;
  aSQL:='SELECT  *FROM fhrd_dut_over WHERE emp_id='''+EmpId+''' AND over_date >='''+FormatDateTime('yyyy/mm/dd',MonSDate )+''' and over_date<=''' + FormatDateTime('yyyy/mm/dd',MonEDate ) + '''';
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    while not Eof do
    begin
      if fieldbyname('class_code').AsString ='69' then //星期日加班-固加 目前只有福祿在特殊要求，而清祿 統一1.5倍     2012-07-02 hyt add
        nl2hour:=nl2hour+fieldbyname('tot_hour').AsFloat
      else
        nlhour := nlhour + fieldbyname('tot_hour').AsFloat ;
      Next;
    end;
    Close;
  end;
  RetCur:=nlhour*basepay/208*1.5;
  RetCur:=RetCur+nl2hour*basepay/208*2.0; //2012-07-02 hyt add

  Result:=RetCur;
end;

procedure TFormFhrd311.EditEmpBeg2Change(Sender: TObject);
begin
  EditEmpEnd2.Text :=EditEmpBeg2.Text ;
end;

procedure TFormFhrd311.empIdBegChange(Sender: TObject);
begin
  empIdEnd.Text :=empIdBeg.Text ;
end;

end.
