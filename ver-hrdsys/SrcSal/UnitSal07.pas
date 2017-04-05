{*************************************************************************
Name：Sal08
修改部門sql語句
update hrd_sal_paymt set dept_code=A.dept_old from hrd_emp_upd A,hrd_sal_paymt B
where A.id in (select min(id) from hrd_emp_upd
where up_date>='2006/09/01' and dept_old<>dept_new group by emp_id)
and A.emp_id=B.emp_id and pay_mon='200608' and B.dept_code<>A.dept_old
*************************************************************************}
unit UnitSal07;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TntExtCtrls, StdCtrls, TntStdCtrls, Buttons,DateUtils,
  TntButtons, Grids, DBGrids, TntDBGrids, ComCtrls, TntComCtrls, DB, ADODB,
  Mask, DBCtrls,WSDLIntf,StrUtils, TntDbCtrls,tntdialogs, DBClient, Menus,
  TntMenus,math,midas;
const
  WORK_DAY_MEAL_PAY=800;//每工作天伙食費
  LANU_PAY=5000;        //公團費
  PERCENT_PICC_SHE=0.08;  //社保 5%  // 2010年1月起社保個人調整為 6%    ,2012年1月 7% (hyt upd 2012-01-13) 2014-01-07 hyt upd(7->8)
  PERCENT_PICC_YI =0.015;  //醫保 1%
  PERCENT_PICC_BACK=0.22;//保險返還 17% ,2012-02-01 hyt upd(0.19-->0.20) 2014-01-07 hyt upd(20->22)
  PERCENT_PICC_SHIYE =0.01;  //醫保 1%
  //2014.09.20 生日禮金
  BIRTHDAY_ALLOWANCE= 50000;
type
  TSpcGongCurrs= array[0..1] of Currency;
  TNormalTestDays =array[0..1] of Integer;
  TDutCurrs=array[0..22] of Currency;//14->17 (目前只用17)   2013-01-31 hyt upd      2016.02.27 17->22
  TSalGrad=array[0..6] of Currency;
  TSpcOver= array[0..3] of double;

  TFormSal07 = class(TForm)
    TntPanel1: TTntPanel;
    ADOCommand1: TADOCommand;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    pc_prv: TTntPageControl;
    ts_sel: TTntTabSheet;
    ts_tran: TTntTabSheet;
    TntPanel7: TTntPanel;
    TntPanel2: TTntPanel;
    TntLabel2: TTntLabel;
    tbb_reset: TTntBitBtn;
    tbb_ok: TTntBitBtn;
    sel_month: TMaskEdit;
    TntPanel3: TTntPanel;
    TntLabel4: TTntLabel;
    trb_id: TTntRadioButton;
    Tid_s: TTntEdit;
    Tid_e: TTntEdit;
    cob_DeptBeg1: TTntComboBox;
    cob_DeptEnd1: TTntComboBox;
    trb_dept: TTntRadioButton;
    tbb_search: TTntBitBtn;
    qry_temp: TADOQuery;
    TntGroupBox1: TTntGroupBox;
    cob_DeptBeg2: TTntComboBox;
    cob_DeptEnd2: TTntComboBox;
    rb_ByDept2: TTntRadioButton;
    EditEmpEnd2: TTntEdit;
    EditEmpBeg2: TTntEdit;
    rb_ByEmp2: TTntRadioButton;
    bbtn_Reset2: TTntBitBtn;
    bbtn_OK2: TTntBitBtn;
    me_Month2: TMaskEdit;
    TntLabel3: TTntLabel;
    sb_EmpBeg2: TTntSpeedButton;
    sb_EmpEnd2: TTntSpeedButton;
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
    qry_salpay_mon: TStringField;
    qry_salbase_pay: TBCDField;
    qry_salmgmt_ofr: TBCDField;
    qry_saltech_ofr: TBCDField;
    qry_salduty_ofr: TBCDField;
    qry_salenvr_ofr: TBCDField;
    qry_salgrad_ofr: TBCDField;
    qry_salefft_awd: TBCDField;
    qry_salte_pay: TBCDField;
    qry_salduo_awd: TBCDField;
    qry_salfull_awd: TBCDField;
    qry_salover_work: TBCDField;
    qry_salsal_night: TBCDField;
    qry_salgong_pay: TBCDField;
    qry_salsupp_agai: TBCDField;
    qry_salpicc_back: TBCDField;
    qry_salothe_supp: TBCDField;
    qry_salsick_supp: TBCDField;
    qry_saldeal_pay: TBCDField;
    qry_salmeal_pay: TBCDField;
    qry_salask_pay: TBCDField;
    qry_salstop_dedu: TBCDField;
    qry_salpicc_she: TBCDField;
    qry_salpicc_yi: TBCDField;
    qry_sallaun_pay: TBCDField;
    qry_saltax_pay: TBCDField;
    qry_salsup_dedu: TBCDField;
    qry_salactu_pay: TBCDField;
    ClientDataSet1upd_user: TStringField;
    ClientDataSet1upd_date: TDateTimeField;
    ClientDataSet1emp_id: TStringField;
    ClientDataSet1pay_mon: TStringField;
    ClientDataSet1base_pay: TBCDField;
    ClientDataSet1mgmt_ofr: TBCDField;
    ClientDataSet1tech_ofr: TBCDField;
    ClientDataSet1duty_ofr: TBCDField;
    ClientDataSet1envr_ofr: TBCDField;
    ClientDataSet1grad_ofr: TBCDField;
    ClientDataSet1efft_awd: TBCDField;
    ClientDataSet1te_pay: TBCDField;
    ClientDataSet1duo_awd: TBCDField;
    ClientDataSet1full_awd: TBCDField;
    ClientDataSet1over_work: TBCDField;
    ClientDataSet1sal_night: TBCDField;
    ClientDataSet1gong_pay: TBCDField;
    ClientDataSet1supp_agai: TBCDField;
    ClientDataSet1picc_back: TBCDField;
    ClientDataSet1othe_supp: TBCDField;
    ClientDataSet1sick_supp: TBCDField;
    ClientDataSet1deal_pay: TBCDField;
    ClientDataSet1meal_pay: TBCDField;
    ClientDataSet1ask_pay: TBCDField;
    ClientDataSet1stop_dedu: TBCDField;
    ClientDataSet1picc_she: TBCDField;
    ClientDataSet1picc_yi: TBCDField;
    ClientDataSet1laun_pay: TBCDField;
    ClientDataSet1tax_pay: TBCDField;
    ClientDataSet1sup_dedu: TBCDField;
    ClientDataSet1actu_pay: TBCDField;
    TntPopupMenu1: TTntPopupMenu;
    N1: TTntMenuItem;
    QryEmp: TADOQuery;
    qry_saldept_code: TStringField;
    ClientDataSet1dept_code: TStringField;
    qry_salinfo_code: TStringField;
    qry_salpst_code: TStringField;
    qry_salsick_back: TBCDField;
    qry_salother_temp: TBCDField;
    ClientDataSet1pst_code: TStringField;
    ClientDataSet1info_code: TStringField;
    ClientDataSet1other_temp: TBCDField;
    ClientDataSet1sick_back: TBCDField;
    ClientDataSet1psal_awd: TBCDField;
    qry_salyicard_dedu: TCurrencyField;
    qry_hrd_dut_class_13: TADOQuery;
    qry_hrd_emp_raise_data: TADOQuery;
    btn_sal_bao: TTntSpeedButton;
    qry_cos_data: TADOQuery;
    flu_conn: TADOConnection;
    qry_sal_bao: TADOQuery;
    ClientDataSet1zhuishuo_BHXH: TBCDField;
    chk_epledt: TTntCheckBox;
    dtp_epledt_bgn: TTntDateTimePicker;
    dtp_epledt_end: TTntDateTimePicker;
    qryLastPaymt: TADOQuery;
    cbChange: TTntCheckBox;

    //my define
//    procedure GetAllBaseLvl;
    function  GetBase(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime;EduCode:string=''):Currency;
    function  GetSpcGong(EmpId,PayMon:String;WorkDays:Integer):TSpcGongCurrs;
    function  GetDutyPay(EmpId,PayMon,PstCode:String;PstPay:Currency;WorkDays:Integer):Currency;
    function  GetSalTran(EmpId,PayMon,PstCode,EduCode:String;WorkDays:Integer;
      EmpInDate,EmpLvDate:TDatetime): TSalGrad;
    function  GetDut(EmpId,PayMon:String;EmpInDate,EmpLvDate:TDateTime;
      SalBasePay,ABasePay,DutyPay,GongSpcPay:Currency;AWorkDays:integer):TDutCurrs;
    function  GetGrad(GradStr,PstCode:String;WorkDays:Integer):Currency;
    function  GetMultPay(EmpId,PayMon:String):Currency;
    function  GetBuFaKou(EmpId,PayMon,BuType:String):Currency;
    function  GetLastAddition(EmpId,PayMon:String):Currency;
    function  GetLanuPay(EmpId,PayMon:String):Currency;
    function  CheckHasPicc(EmpId,PayMon:String):Boolean;
    function  IsNewEmp(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDate):Boolean;
    function  IsNewEmp1(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDate):Boolean;
    function  GetWrkPay(EmpId,PayMon:String):Currency;
    function  GetSpcOver(EmpId,PayMon:String):TSpcOver;
    function  GetSalTax(SalTot:Double; marryid,paymon,EmpId:String):Double;

    function  GetJiangli(EmpId,PayMon:String):Currency;

//    function  GetNormalBase(PstCode,EduCode:String;EmpInDate:TDateTime):Currency;
    function  GetPsalPay(EmpId,PayMon:String;BasePay:Currency):Currency;
    function  GetEffPay(EmpId,DeptCode,PayMon:String;EmpInDate,EmpLvDate:TDate):Currency;
    // 2007.11.05 <<
    function  getvirus(EmpId,PayMon:String):Currency;
    // 2007.11.05 >>
    //sys create
      //2011-01-14 adam add
    function GetYearSal(EmpId:String):Currency;
    function GetSpecSal(EmpId,PayMon:String;EmpInDate,EmpLvDate:TDate):Currency;
        //2012-03-02 hyt add
    function FenxiHour(fHours:Extended;PayMon:String):Extended;
        //2012-03-22 hyt add
    function GetYiCardPay(EmpId,PayMon:String):Currency;
        //2013-01-16 hyt add
    function GetMarryAmt(EmpId,PayMon:String):integer;
        //2013-01-18 hyt add
    function GetRaise_num(EmpId:String):integer;
        //2013-05-30 hyt add
    function GetOver195(PayMon:String):Currency;
        //2013-06-24 hyt add
    function GetFoster_pay(EmpId,PayMon:String):Currency;
    //
    function  GetBase1(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime;EduCode:string=''):Currency;
    //生日禮金 2014.09.20
    function GetBirthDay(EmpId, PayMon, PstCode:String; EmpInDate, EmpLvDate, EmpBirthDay : TDate):Currency;
    //2014.12.03 判斷是否為整月請扣薪假
    function IsAskMonthlong(const PayMon, EmpID: string): Boolean;


    procedure InitLangInfo;
    procedure FormInit;
    procedure FormCreate(Sender: TObject);
    procedure bbtn_OK2Click(Sender: TObject);
    procedure bbtn_Reset2Click(Sender: TObject);
    procedure rb_ByEmp2Click(Sender: TObject);
    procedure tbb_okClick(Sender: TObject);
    procedure SetEnableControl(ActNo:Integer;Value:Boolean);
    procedure pc_prvChange(Sender: TObject);
    procedure tbb_searchClick(Sender: TObject);
    procedure tbb_resetClick(Sender: TObject);
    procedure sb_EmpBeg2Click(Sender: TObject);
    procedure DelPayMT(EmpId,PayMon:String);
    procedure DealAEmp(EmpId,PayMon:String);
    procedure N1Click(Sender: TObject);
    procedure EditEmpBeg2Change(Sender: TObject);
    procedure btn_sal_baoClick(Sender: TObject);
    function getLastWeixiuPrice(iEmpId,iPayMon:string;iEmpInDate,iEmpLvDate:TDateTime):Currency;
  private
    //2015.04.25 計算離職補貼
    function GetLeaveSubsidy(AMonth, AEmpID: string; AEpIndt, AEpLedt: TDateTime; boChangeFactory: Boolean=False): Currency;
    //
    function GetYiFaJinE(const AMonth, AEmpID: string): Double;
    //得到應補貼的年假天數 2013.09.26 LX ADD
    function GetButieDays(AEmpID, PayMonth: string): Double;
    //
    function GetYXTS_16(AEmpID, AYear: string): Double;
    //2016.03.19 得到作業員的特別獎金
    function GetSpcPayOf60(const AMonth, AEmpID: string): Double;
    //2016.06.13 轉廠
    function IsChangeFactory(const AMonth, AEmpID: string): Boolean;
    //2016.06.13 得到上個月的最後一天
    function GetEndOfLastMonth(PayMon: string): TDateTime; 
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
function GetNormalTestDays(EmpId,PayMon,PstCode_new:String;EmpInDate,EmpLvDate:TDateTime):TNormalTestDays;
function GetWorkDays(PayMon:String;EmpInDate,EmpLvDate:TDateTime):Integer;
//2014.12.02 得到本月實際工作天數
function GetWorkDaysEx(PayMon:String;EmpInDate,EmpLvDate:TDateTime):Integer;
function GetSunDayCount(DayBeg,DayEnd:Integer;YearMonth:String):Integer;

var
  FormSal07: TFormSal07;
  runThread:TRunThread;
implementation

Uses
    UnitDMHrdsys,UnitHrdUtils;
var
   prv:TPrvArr;
   ws_Words:TWideStrings;
   SalBaseLvl:TStrings;//基本薪資等級額
   SalLongWorkLvl:TStrings;//久任獎金等級額
   AEmpId,PayMon:String;
   MonSDate,MonEDate:TDatetime;
   g_sHrd_sal_paymt:string;

{$R *.dfm}
{設置狀態 ActNo 為0 設置查詢 ActNo 為1 設置轉檔}
procedure TFormSal07.SetEnableControl(ActNo:Integer;Value:Boolean);
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
    rb_ByEmp2.Enabled := Value;
    rb_ByDept2.Enabled := Value;
    EditEmpBeg2.Enabled := Value;
    EditEmpEnd2.Enabled := Value;
    cob_DeptBeg2.Enabled := Value;
    cob_DeptEnd2.Enabled := Value;
    bbtn_Ok2.Enabled:= Value;
    bbtn_Reset2.Enabled:=not Value;
  end;
end;
procedure TFormSal07.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  //定義要用到的語言
 ThisFormUsedWords:='query,ok,reset,find,sal08_titl,fld_emp_id,'+
   'fld_emp_chs,fld_dept_code,msg_add_error,transferfiles,'+
   'msg_confirm_save,dbl_clk_slct_emp,month,fld_pay_mon,fld_base_pay,fld_mgmt_ofr,fld_tech_ofr,'+
   'fld_duty_ofr,fld_envr_ofr,fld_efft_awd,fld_te_pay,fld_duo_awd,fld_full_awd,fld_over_work,fld_gong_pay,fld_supp_agai,'+
   'fld_picc_back,fld_othe_supp,fld_sick_supp,fld_deal_pay,fld_meal_pay,fld_ask_pay,fld_stop_dedu,fld_picc_she,fld_picc_yi,'+
   'fld_laun_pay,fld_tax_pay,fld_sup_dedu,fld_actu_pay,msg_month_data_locked';
 ws_Words:=GetLangWideStrs(ThisFormUsedWords);
 tntpanel1.Caption := GetLangName(ws_Words,'sal08_titl');
 SetComponentLang(self);
 //bb_ok.Caption := GetLangName(ws_Words,'ok');
 //bb_reset.Caption := GetLangName(ws_Words,'reset');
 //bb_tran.Caption := GetLangName(ws_Words,'transferfiles');
 //tbb_ok.Caption := GetLangName(ws_Words,'ok');
 //tbb_reset.Caption := GetLangName(ws_Words,'reset');
 //tbb_search.Caption := GetLangName(ws_Words,'find');
 //tntlabel1.Caption := GetLangName(ws_Words,'dbl_clk_slct_emp');
 //tntlabel4.Caption := GetLangName(ws_Words,'dbl_clk_slct_emp');
 //tntlabel2.Caption := GetLangName(ws_Words,'query')+GetLangName(ws_Words,'month');
 //tntlabel3.Caption := GetLangName(ws_Words,'transferfiles')+GetLangName(ws_Words,'month');
 //rb_id.Caption :=  GetLangName(ws_Words,'fld_emp_id');
 //rb_dept.Caption :=  GetLangName(ws_Words,'fld_dept_code');
 //trb_id.Caption :=  GetLangName(ws_Words,'fld_emp_id');
 //trb_dept.Caption :=  GetLangName(ws_Words,'fld_dept_code');
 //pc_prv.Pages[0].Caption := GetLangName(ws_Words,'query');
 //pc_prv.Pages[1].Caption := GetLangName(ws_Words,'transferfiles');
 //for i:= 0 to dbgrid.Columns.Count-1 do
   //dbgrid.Columns[i].Title.Caption := GetLangName(ws_Words,'fld_'+dbgrid.Columns[i].FieldName);

end;
{初始化信息}
procedure TFormSal07.FormInit;
var
  slDate:TStringList;
begin
  Prv:=GetPrvArr(UserName,'sal08');
  if Prv[TRAN] then
    pc_prv.Pages[1].TabVisible := true
  else
    pc_prv.Pages[1].TabVisible := false;
//  if Prv[INQ] then
//    pc_prv.Pages[0].TabVisible := true
//  else
//    pc_prv.Pages[0].TabVisible := false;
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept',cob_DeptBeg1);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept',cob_DeptEnd1);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept',cob_DeptBeg2);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept',cob_DeptEnd2);
  me_Month2.Text := formatdatetime('yyyymm',date-strtoint(formatdatetime('dd',date))-1);
  //sel_month.Text := formatdatetime('yyyymm',date-strtoint(formatdatetime('dd',date))-1);
  slDate := TStringList.Create;
  try
    slDate := StrSplit(LockLeaveDate,'/');
    //dtp_epledt_bgn.Date := StrToDate(LockLeaveDate)+1;
    dtp_epledt_bgn.Date := EncodeDate(StrToInt(slDate[0]),StrToInt(slDate[1]),StrToInt(slDate[2]))+1;
    dtp_epledt_end.Date := GetServerDateTime;
  finally
//    slDate.Free;
  end;
end;

procedure TFormSal07.FormCreate(Sender: TObject);
begin
  g_sHrd_sal_paymt:='hrd_sal_paymt';  //2010/10/25 hyt add tempdbf.dbo.
  InitLangInfo;
  FormInit;
  SalBaseLvl:=GetAllBaseLvl;//取得所有基本薪資等級額
  SalLongWorkLvl:=GetLongWorkLvl;//取得所有久任獎金等級額

  //
  chk_epledt.Checked := True;
  chk_epledt.Enabled := False;
end;
{===============================================================================
  計算薪資確認
===============================================================================}
procedure TFormSal07.bbtn_OK2Click(Sender: TObject);
var
  sql_str:string;
begin
  PayMon:=me_Month2.Text;
  //該月資料已經鎖定
  if (PayMon<=LockMonth)  then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
    exit;
  end;
  MonSDate:=StartOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  MonEDate:=EndOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  sql_str:='select * from hrd_emp where 1=1'
   +' and epindt<='''+FormatDateTime('yyyy/mm/dd',MonEDate)+''''
   +' and (epledt>='''+FormatDateTime('yyyy/mm/dd',MonSDate)+''' or epledt is null)';
  if rb_ByEmp2.Checked then
  begin
    if Trim(EditEmpBeg2.Text)<>'' then
      sql_str:=sql_str+' and emp_id>='''+Trim(EditEmpBeg2.Text)+'''';
    if Trim(EditEmpEnd2.Text)<>'' then
      sql_str:=sql_str+' and emp_id<='''+Trim(EditEmpEnd2.Text)+'''';

    sql_str:=sql_str+' and left(dept_code,1)<>''V'' '; //2013-05-04 hyt add
  end
  else if rb_ByDept2.Checked then
  begin
    if trim(cob_DeptBeg2.Text)<>'' then
      sql_str:=sql_str+' and dept_code>='''+LeftStr(trim(cob_DeptBeg2.Text),6)+'''';
    if trim(cob_DeptEnd2.Text)<>'' then
      sql_str:=sql_str+' and dept_code<='''+LeftStr(trim(cob_DeptEnd2.Text),6)+'''';

    sql_str:=sql_str+' and left(dept_code,1)<>''V'' '; //2013-05-04 hyt add  
  end;

  //sql_str:=sql_str+' and emp_id in(select emp_id from tempdbf.dbo.aa_00) '; //test 2011-09-21 hyt add

  if cbChange.Checked then
    sql_str := sql_str + ' and emp_id in (select emp_id from hrd_emp_change where change_month = '+QuotedStr(PayMon)+')'
  else begin
    //離職日期
    if chk_epledt.Checked then
    begin
      sql_str := sql_str+' and epledt >= '''+FormatDateTime('yyyy/mm/dd',dtp_epledt_bgn.Date)+
            ''' and epledt <='''+FormatDateTime('yyyy/mm/dd',dtp_epledt_end.Date)+'''';
    end;
  end;  

  //鎖定離職日期
  sql_str:=sql_str+' and isnull(epledt,''2050/01/01'')>'''+LockLeaveDate+''' ';


  sql_str:=sql_str+' order by emp_id';
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
      runthread := TrunThread.Create(false);
    end
    else begin
      WideShowMessage('查尋範圍內無資料存在');
      qry_sal.Close;
    end;
  end;

  //***<<<2013-01-18 hyt add 撫養資料
  if (PayMon>='201301') then
  begin
    with qry_hrd_emp_raise_data do
    begin
      close;
      sql.Clear;
      sql_str:='SELECT emp_id, raise_num '+
               'FROM hrd_emp_raise_data ';
      sql.Add(sql_str);
      open;
    end;
  end;
  //***>>>
  //***<<<2013-01-16 hyt add 結婚禮金資料
  if (PayMon>='201301') then
  begin
    with qry_hrd_dut_class_13 do
    begin
      close;
      sql.Clear;
      sql_str:='SELECT emp_id, dbo.get_YM(MIN(s_ask_d)) AS ask_mon FROM hrd_dut_ask '+
               'WHERE clas_code=''13'' AND dbo.get_YM(s_ask_d) >= '''+str_PreMonth(PayMon)+''' ' +
               'GROUP BY  emp_id';
      sql.Add(sql_str);
      open;
    end;
  end;
  //***>>>
  {with sp_Emp2 do
  begin
    Close;
    Parameters.ParamByName('@year_month').Value:=me_Month2.Text;
    Parameters.ParamByName('@dept_begin').Value:=null;
    Parameters.ParamByName('@dept_end').Value:=null;
    Parameters.ParamByName('@emp_begin').Value:=null;
    Parameters.ParamByName('@emp_end').Value:=null;
    if rb_ByEmp2.Checked then
    begin
      if Trim(EditEmpBeg2.Text)<>'' then
        Parameters.ParamByName('@emp_begin').Value:=Trim(EditEmpBeg2.Text);
      if Trim(EditEmpEnd2.Text)<>'' then
        Parameters.ParamByName('@emp_end').Value:=Trim(EditEmpEnd2.Text);
    end
    else if rb_ByDept2.Checked then
    begin
      if trim(cob_DeptBeg2.Text)<>'' then
        Parameters.ParamByName('@dept_begin').Value:=LeftStr(trim(cob_DeptBeg2.Text),6);
      if trim(cob_DeptEnd2.Text)<>'' then
         Parameters.ParamByName('@dept_end').Value:=LeftStr(trim(cob_DeptEnd2.Text),6);
    end;
    Open;
  end;   }
end;
{轉檔月份重置}
procedure TFormSal07.bbtn_Reset2Click(Sender: TObject);
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
{選擇方式}
procedure TFormSal07.rb_ByEmp2Click(Sender: TObject);
begin
  if rb_ByEmp2.Checked then
  begin
    EditEmpBeg2.Enabled := true;
    EditEmpEnd2.Enabled := true;
  end
  else
  begin
    EditEmpBeg2.Enabled := false;
    EditEmpEnd2.Enabled := false;
  end;
  if rb_ByDept2.Checked then
  begin
    cob_DeptBeg2.Enabled := true;
    cob_DeptEnd2.Enabled := true;
  end
  else
  begin
    cob_DeptBeg2.Enabled := false;
    cob_DeptEnd2.Enabled := false;
  end;
end;

{===============================================================================
  計算薪資xian程
===============================================================================}
procedure TRunThread.Execute;
var
  formsal07:Tformsal07;
  MonthFirstDay:TDateTime; //計算月份的第一天
begin
  FreeOnTerminate := true;
  formsal07 := TFormSal07(Application.FindComponent('formsal07'));
  MonthFirstDay:=EncodeDate(StrToInt(LeftStr(formsal07.me_Month2.Text,4)),StrToInt(MidStr(formsal07.me_month2.Text,5,2)),1);
  with formsal07.QryEmp do
  begin
    SetProcessBar(true,1,RecordCount);
    //DMHrdsys.conn.BeginTrans;
    while not Eof do
    begin
      if Terminated then
      begin
        //進程結束，退出
        //dmhrdsys.conn.RollbackTrans;
        formsal07.SetEnableControl(1,true);
        ChangeSalDept(payMon);//修正部門等信息
        Exit;
      end;
      aEmpId:=FieldByName('emp_id').AsString;
      SetProcessBar(false,1);
      SetStatusText('當前第'+IntToStr(Recno)+'/'+IntToStr(RecordCount)+'筆');
      { 處理一個員工的資料 }
      //刪除該員工本月薪資
      if ((FieldByName('epledt').AsString<>'') and
          (FieldByName('epledt').AsDateTime<MonthFirstDay)) //本月前離職不處理 
          //(FieldByName('epledt').AsDateTime<=MonthFirstDay)) //本月前離職不處理
        or ((FieldByName('epledt').AsString<>'') and
            (FieldByName('epledt').AsDateTime<=FieldByName('epindt').AsDateTime)) then //離職日期小於進廠日期不處理
      begin
        try
          formsal07.DelPayMT(aEmpId,PayMon);
        except
          //DMHrdsys.conn.RollbackTrans;
        end;
      end
      else
        try
          {計算該員工本月薪資}
          formsal07.DealAEmp(aEmpId,PayMon);
        except
          //DMHrdsys.conn.RollbackTrans;
        end;
      Next;
    end;
    //DMHrdsys.conn.CommitTrans;
    ChangeSalDept(payMon);//修正部門等信息
    SetProcessBar(true);
    SetStatusText('轉檔完畢！');
    formsal07.re_Message.Lines.Add('轉檔完畢！');
    formsal07.SetEnableControl(1,true);
  end;
end;
{===============================================================================
  procedure DelPayMT(EmpId,PayMon:String);
  刪除員工薪資主檔紀錄
===============================================================================}
procedure TFormSal07.DelPayMT(EmpId,PayMon:String);
begin
  //
  with DMHrdsys.ADOCommand1 do
  begin
    CommandText:='DELETE FROM '+g_sHrd_sal_paymt+' WHERE emp_id='''+EmpId+''' AND pay_mon='''+PayMon+'''';
    Execute;
  end;
end;
{===============================================================================
  DealAEmp(EmpId,PayMon:String);
  計算一個員工的薪資
===============================================================================}
procedure TFormSal07.DealAEmp(EmpId,PayMon:String);
var
  EmpInfo:TFields;
  aSpcGong:TSpcGongCurrs;              //特別獎金与功績獎金
  aDutCurrs:TDutCurrs;                 //考勤返回數組
  ASalGrads:TSalGrad;                  //調薪記錄中數據
  pre_pst_flag:boolean;                //是否要重新取職務
  aSQL,
  DeptCode,                            //部門
  InfoCode,                            //在職情況
  PstCode,                             //職務代號
  marryid,                             //職務代號
  EduCode:String;                      //學歷代號
  CurDateTime,
  //2014.09.20 出生日期
  EmpBirthDay,
  //
  EmpInDate,                           //進廠日期
  EmpLvDate:TDateTime;                 //離職日期
  SalBase,                             //薪資總額 ，計算單價用
  PiccPay:Currency;                    //保險基數
  WorkDays:Integer;                    //本月工作天數
  F_BasePay,                           //基本工資    have done
  F_GradPay,                           //職等金額    have done
  F_MgmtPay,                           //主管加給    have done
  F_TechPay,                           //專業加給    have done
  F_DutyPay,                           //職務津貼(工種補貼)    have done
  F_EnvrPay,                           //環境津貼    have done(已停)
  F_OtherPay,                          //其他補貼    have done
  F_OtherTemp,                         //臨時項    have done
  F_EfftPay,                           //效率獎金  200704開始
  F_PsalPay,                           //件資獎金  200704開始
  F_LongWorkPay,                       //久任獎金
  F_SpcPay,                            //特別津貼    have done
  F_GongPay,                           //功績獎金    have done
  F_DuoPay,                            //多工獎金    have done
  F_NoLeavePay,                        //全勤獎      have done
  F_OverPay,                           //加班費      have done
  F_NightPay,                          //夜班津貼    have done
  F_SuppAgaiPay,                       //上月補發    have done
  F_LastAddPay,                        //上月餘額    have done
  F_SickPay,                           //病假補貼(保險公司)    have done
  F_SickPay2,                           //病假補貼(公司)    have done
  F_PiccBackPay,                       //保險返還    have done
  F_DealPay,                           //應發薪資    have done
  F_MealCost,                          //伙食費      have done
  F_AskCost,                           //請假扣款    have done
  F_StopCost,                          //停工扣款    have done
  F_PiccSheCost,                       //社會保險    have done
  F_PiccYiCost,                        //醫療保險    have done
  F_YiCardCost,                        //醫保卡扣款    have done
  F_LaunCost,                          //工團費      have done
  F_TaxCost,                           //個人所得稅  have done
  F_SupDeduCost,                       //上月補扣    have done
  //
  F_ZhuiShou,                          //追收病保超付款 2015.07.27
  //
  F_PiccShiyeCost,                     //2009.02.10
//  F_VirusPay ,                       //毒害津貼    have done   2007.11.03 <<
  F_Over195pay,
  F_Foster_pay,                        //2013-06-24 hyt add 育兒津貼 每個人小孩 60000vnd，最多不可以超過120000
  lciItem1, F_DealPay1,F_RealPay1,F_OverPay1,
  //多休年假扣款
  F_DuoxiuKoukuan,
  //
  F_LeavPay,                           //2015.05.04 離職補貼
  F_RealPay, F_Mealsal,F_YuzhiPay, F_YiFa:Currency;                  //實發薪資    have done

  F_NightHour,                         //夜班時數 2013-01-31 hyt add

  F_HourPrice,                         //小時單價
  F_Over15Hour,                        //加班時*1.5
  F_Over20Hour,                        //加班時*2.0
  F_Over30Hour,                        //加班時*3.0
  F_Over195Hour,
  HourPrice,            //小時單價
  HourPrice1:double ;           //小時單價
  sTemp:string;
  //
  boChange: Boolean;
begin
//  EmpInfo:=GetEmpInfo(EmpId,PayMon);
  CurDateTime:=GetServerDateTime;
  with QryEmp do
  begin
    DeptCode:=FieldByName('dept_code').AsString;  //部門代號
    PstCode:=FieldByName('pst_code').AsString;    //職稱代號
    EduCode:=FieldByName('edu_code').AsString;    //學歷代號
    EmpInDate:=FieldByName('epindt').AsDateTime;  //進廠日期
    EmpLvDate:=FieldByName('epledt').AsDateTime;  //離職日期
    InfoCode:=FieldByName('info_code').AsString;  //在職狀態
    marryid:=FieldByName('ifmarry').AsString;  //在職狀態
    //2014.09.01 出生日期
    EmpBirthDay := FieldByName('epbirth').AsDateTime;
  end;
  //在職狀態處理
  if (InfoCode='1') or (InfoCode='2') or (InfoCode='7') then
    InfoCode:='2'
  else if (InfoCode='3') or (InfoCode='4') or (InfoCode='5') or (InfoCode='6') then
    InfoCode:='6'
  else
    InfoCode:='0';
  if EmpLvDate>DateOf(MonEDate) then
    InfoCode:='0';
  //
  WorkDays:=GetWorkDays(PayMon,EmpInDate,EmpLvDate);    //本月工作天數
  //
  if empid ='060024'  then
       InfoCode:='0';
  {開始計算 以F_開頭的變量為數據庫薪資檔中的欄位}

  //查找調薪紀錄(hrd_sal_grade)
  aSQL:='select * from hrd_saltran where emp_id='''+EmpId+''' order by valid_date desc ';
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
      ASalGrads:=GetSalTran(EmpId,PayMon,PstCode,EduCode,WorkDays,EmpInDate,EmpLvDate);
      F_MgmtPay:=ASalGrads[1];                 //2,主管加給
      F_TechPay:=ASalGrads[2];                 //3,專業加給
      F_DutyPay:=ASalGrads[3];                 //4,職務津貼(工種補貼)
      //GetDutyPay(EmpId,PayMon,PstCode,FieldByName('pst_pay').AsCurrency,WorkDays);

    //  F_EnvrPay:=ASalGrads[4];                 //5,環境津貼(刪)
      //F_GradPay:=GetGrad(FieldByName('sal_grade').AsString,PstCode,WorkDays);
      F_GradPay:=ASalGrads[5];                 //6,職務等級額
      F_OtherPay:=0;//ASalGrads[6];                //5,其他補貼(刪)
      F_SpcPay:=ASalGrads[6];                                //7-特別獎金
      //***<<<2011-11-26 hyt add 福祿-印刷廠-作業員的月份特別獎金-特別處理
      if (PstCode='60') and (leftStr(DeptCode,2)='FE') and (PayMon>='201111') then
      begin
        F_SpcPay:=GetSpecSal(EmpId,PayMon,EmpInDate,EmpLvDate);
      end;
      //***>>>

      //***<<<2011-04-25 hyt add
      if ( PstCode='60' ) or ( PstCode='61' ) or ( PstCode='62' )  or ( PstCode='63' ) then
      begin
        //處理新進作業員（工種津貼）統一按20000越幣核資事宜
        if copy( deptcode, 1, 1) = 'S' then
        begin
          if (F_DutyPay<=0) and (PayMon>='201104') and (formatDatetime('yyyymm',EmpInDate)=PayMon) then //只對本月新進有效，次月不分析
          begin
            F_DutyPay:=20000*WorkDays/26
          end;
        end;
        //處理新進作業員（環境津貼）統一按40000越幣核資事宜
        //if copy( deptcode, 1, 1) = 'N' then
        //begin   //只對底廠
        //  if (PayMon>='201104') and (formatDatetime('yyyymm',EmpInDate)=PayMon) then //只對本月新進有效，次月不分析
        //  begin
        //    F_EnvrPay:=40000*WorkDays/26
        //  end;
        //end;
      end;
      //***>>>

    {else begin
      F_MgmtPay:=0;
      F_TechPay:=0;
//      F_DutyPay:=0;
      F_DutyPay:=GetDutyPay(EmpId,PayMon,PstCode,0,WorkDays);
      F_EnvrPay:=0;
      F_GradPay:=0;
      F_OtherPay:=0;
    end;}
    Close;
  end;
  F_BasePay := GetBase(EmpId,PayMon,PstCode,EmpInDate,EmpLvDate,EduCode); //1,基本工資
  if paymon <='200809'  then
     F_LongWorkPay:=GetLongWorkPay( EmpInDate,empid,PstCode,PayMon)  //久任獎金
  else
      F_LongWorkPay:= 0 ;
 // else
   //  F_BasePay := F_BasePay  + F_LongWorkPay ;

   if ( empid='064618') or ( empid='064619') then
       F_BasePay  :=1032000 ;
  //基薪總額（算單價時用）
  if PstCode='60' then
    //作業員，基薪總額為基本工資+工種補貼
    SalBase:=F_BasePay+F_DutyPay
  else
    //非作業員，基薪總額為 基本工資+主管加給+職務津貼+專業津貼+職務等級額+特別獎金(2016.03.16)  
    SalBase:=F_BasePay+F_MgmtPay+F_DutyPay+F_TechPay+F_GradPay + F_SpcPay;

  //
  aSpcGong:=GetSpcGong(EmpId,PayMon,WorkDays);          //計算功績獎金、特別獎金
  //F_SpcPay:=aSpcGong[0];                                //7-特別獎金
  F_GongPay:=aSpcGong[1];                               //8-功績獎金

  F_DuoPay:=GetMultPay(EmpId,PayMon);                   //9-多工獎金
  aDutCurrs:=GetDut(EmpId,PayMon,EmpInDate,EmpLvDate,SalBase,F_BasePay,F_DutyPay,F_SpcPay+F_GongPay,WorkDays);

  //加四舍五入 2013-06-07 hyt add
  aDutCurrs[4]:=strToInt(formatFloat('0',aDutCurrs[4]));
  
  //2010/07/12
  if WorkDays<> 0 then
    HourPrice:=SalBase/WorkDays/8;            //小時單價
    F_Over15Hour:=aDutCurrs[9];                            //16-加班時*1.5
    F_Over20Hour:=aDutCurrs[10];                            //16-加班時*2
    F_Over30Hour:=aDutCurrs[11];                           //16-加班時*3
    F_Over195Hour :=aDutCurrs[13] ;                        //16-加班時*1.95
    F_HourPrice:=aDutCurrs[14];                            //16-小時單價
    F_Over195pay := 0;
    F_Over195pay :=F_Over195Hour*F_HourPrice*GetOver195(PayMon) ;//aDutCurrs[18];                         //1.95
    F_Over195pay:=strToInt(formatFloat('0',F_Over195pay)); //2013-06-07 hyt add 

    if PayMon<'201305' then
      F_OverPay :=Int(F_Over15Hour*F_HourPrice*1.5)+ Int(F_Over20Hour*F_HourPrice*2.0) + Int(F_Over30Hour*F_HourPrice*2.0)
    else  //2013-05-31 hyt add  201305 300%
      F_OverPay :=Int(F_Over15Hour*F_HourPrice*1.5)+ Int(F_Over20Hour*F_HourPrice*2.0) + Int(F_Over30Hour*F_HourPrice*3.0);

    F_OverPay := F_OverPay + F_Over195pay ;

    F_OverPay1 :=0;
    //這裡設定全部 加班的 扣稅金額 算1倍
    if PayMon>='201307' then //2013-07-30 扣稅中 只有加班1.5和夜班加班1.95 2種情況分析
      F_OverPay1 :=Int(F_Over15Hour*F_HourPrice*1)+ Int(F_Over195Hour*F_HourPrice*1) + Int(F_Over20Hour*F_HourPrice*1) + Int(F_Over30Hour*F_HourPrice*1)
    else
      F_OverPay1 :=Int(F_Over15Hour*F_HourPrice*1)+ Int(F_Over20Hour*F_HourPrice*1) + Int(F_Over30Hour*F_HourPrice*1) + Int(F_Over195Hour*F_HourPrice*1);
  //2010/07/12
  F_MealCost:=aDutCurrs[0];                             //10-伙食費
  F_NoLeavePay:=aDutCurrs[1];                           //11-全勤獎

  //***<<<2013-01-31 hyt add 特殊處理 Adidas 的19個作業員
  if PayMon='201301' then
  begin
    if (EmpId>='200309') and (EmpId<='200327') then
    begin
      if (EmpId>='200309') and (EmpId<='200310') then
        F_NoLeavePay:=100000
      else if (EmpId='200311') then
        F_NoLeavePay:=200000
      else if (EmpId>='200312') and (EmpId<='200314') then
        F_NoLeavePay:=150000
      else if (EmpId='200315') then
        F_NoLeavePay:=75000
      else if (EmpId='200316') then
        F_NoLeavePay:=100000
      else if (EmpId='200317') then
        F_NoLeavePay:=175000
      else if (EmpId>='200318') and (EmpId<='200323') then
        F_NoLeavePay:=200000
      else if (EmpId='200324') then
        F_NoLeavePay:=0
      else
        F_NoLeavePay:=200000;
    end;
  end;
  //***>>>

  //2016.01.29
  if (PayMon= '201601') or (PayMon= '201602') then
  begin
    F_YiFa := GetYiFaJinE(PayMon, EmpId);
  end;
  //
  if (PayMon= '201602') and (F_YiFa > 0) then
    F_SuppAgaiPay:=GetBuFaKou(EmpId,PayMon,'1') + F_YiFa 
  else
    F_SuppAgaiPay:=GetBuFaKou(EmpId,PayMon,'1');          //17-補發金額
  // 2008.01.24  << 2008 年一月份上半月不扣費用
 //   if paymon = '200801'  then
   //    begin
   // 2008.05.07 <<
  if paymon >='200804'  then
     F_MealCost:=0;                             //10-伙食費
     //  F_NoLeavePay:=0;                           //11-全勤獎
     //  F_SuppAgaiPay:=0;                          //17-補發金額
   //  end;
   // 2008.01.24  >> 2008 年一月份上半月不扣費用
  //2010/07/12 del <<
 // F_OverPay:=aDutCurrs[2];                              //12-加班費
 // F_OverPay1:= aDutCurrs[8];
 // 2010/07/12  >>

  F_NightPay:=aDutCurrs[3];                             //13-夜班津貼
  F_AskCost:=aDutCurrs[4];                              //14-請假扣款
  F_SickPay:=GetSalBaoBu(EmpId,PayMon);                  //15-病假補貼(保險公司)
  F_SickPay2:=aDutCurrs[5];                              //15-病假補貼(公司)
  F_StopCost:=aDutCurrs[6];                              //16-停工扣款

  //if PayMon>='201305' then //開始不處理上個月的尾數 2013-05-25 hyt add
  //  F_LastAddPay:=0
  //else

  //21 - 多休扣款
  F_DuoxiuKoukuan := aDutCurrs[21];

    F_LastAddPay:=GetLastAddition(EmpId,PayMon);              //17-上月餘額

  if IsNewEmp(EmpId,PayMon,PstCode,EmpInDate,EmpLvDate) then      //判斷該員工是否為新進員工
  begin
    if PstCode >= '60' then
      F_PiccBackPay := F_BasePay*PERCENT_PICC_BACK          //18-保險返還(新進員工有)
    else
    //職員或幹部為基本工資+主管加給+職務津貼+專業加給+職等金額+特別獎金
      F_PiccBackPay := (F_BasePay+F_MgmtPay+F_DutyPay+F_TechPay+F_GradPay + F_SpcPay)*PERCENT_PICC_BACK;
  end
  else
  begin
    F_PiccBackPay:=0;
  end;
  {if CheckRecordExist('SELECT * FROM hrd_picc WHERE emp_id='''+EmpId+''' AND picc_mon<='''+PayMon+'''') then
    PiccPay:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false)//F_BasePay
  else                                                  //保險基數
    PiccPay:=0;//CheckHasPicc(EmpId,PayMon,PstCode);}
  if CheckHasPicc(EmpId,PayMon) then
  begin
    // if  payMon <'200801'  then
    //     PiccPay:=GetBase1(PayMon,PstCode,EmpInDate,EmpLvDate,EduCode)
       //  PiccPay:=F_BasePay
    // else
      PiccPay:=GetNormalBase(EmpId,PayMon,PstCode,EduCode,EmpInDate,SalBaseLvl,false);  //F_BasePay

      //2016.01.19 職員或其他需加上職等金額、職務津貼、專業加給、特別獎金、主管加給
      //2016.01.23 作業員只算基本工資，不算工種補貼
      if PstCode < '60' then
        PiccPay := PiccPay + GetPiccBase(PayMon, EmpId)
      else
        PiccPay := PiccPay + GetSpcPayOf60(PayMon, EmpId);  

      if ( empid='064618') or ( empid='064619') then
       PiccPay:=1032000
  end
  else                                                  //保險基數
    PiccPay:=0;//CheckHasPicc(EmpId,PayMon,PstCode);
  {2016.04.04
  F_PiccSheCost:=PiccPay*PERCENT_PICC_SHE;              //19-社會保險
  F_PiccYiCost:=PiccPay*PERCENT_PICC_YI;                //20-醫療保險
  // 2009.02.10 <<

    //個人繳納的最多23000000
  if PiccPay > 23000000 then
    F_PiccShiYeCost := 23000000*PERCENT_PICC_SHIYE
  else
    F_PiccShiYeCost:=PiccPay*PERCENT_PICC_SHIYE;              //23-2009年1月起扣除 1%的社保失業金
  }
  //2016.04.04 社保和醫保最多按23000000繳納，失業保險按實際繳納
  if PiccPay > 23000000 then
  begin
    F_PiccSheCost:= 23000000*PERCENT_PICC_SHE;              //19-社會保險
    F_PiccYiCost:= 23000000*PERCENT_PICC_YI;                //20-醫療保險
  end
  else begin
    F_PiccSheCost:=PiccPay*PERCENT_PICC_SHE;              //19-社會保險
    F_PiccYiCost:=PiccPay*PERCENT_PICC_YI;                //20-醫療保險
  end;
  //失業
  F_PiccShiYeCost:=PiccPay*PERCENT_PICC_SHIYE;              //23-2009年1月起扣除 1%的社保失業金

  // 2009.02.10  >>
   // 2008.01.24  << 2008 年一月份上半月不扣費用
 // if paymon ='200801'  then
 //    begin
 //      F_PiccSheCost:=0;              //19-社會保險
 //      F_PiccYiCost:=0;                //20-醫療保險
 //    end;
     // 2008.01.24  << 2008 年一月份上半月不扣費用
  if  PayMon >='200704'  then
    begin
      F_PsalPay:=GetPsalPay(EmpId,PayMon,F_DutyPay);           //21-件資獎金
      F_EfftPay:= 0 ; //GetEffPay(EmpId,DeptCode,PayMon,EmpInDate,EmpLvDate);//21-效率獎金

    end
  else
    begin
       F_PsalPay:=0 ;
       F_EfftPay:= 0 ;

    end;
   // 2008.01.24  << 2008 年一月份上半月不扣費用
 // if paymon='200801'  then
 //    begin
 //      F_PsalPay:=0 ;
 //      F_EfftPay:= 0 ;
 //    end;
  //if paymon='200712'  then
  //   F_SupDeduCost:=  5000  // 200712月每個員工特別扣除基金捐款 5000
  //else
  F_SupDeduCost:= GetBuFaKou(EmpId,PayMon,'2');          //22-上月補扣
  //
  if (PayMon= '201601') or (F_YiFa < 0) then
    F_SupDeduCost := F_SupDeduCost + Abs(F_YiFa);
  //追收病保超付款 2015.07.27
  F_ZhuiShou   := GetBuFaKou(EmpId,PayMon,'3');          //追收病保超付款

  
  F_Mealsal := 0 ;  //誤餐費
  F_Mealsal:=aDutCurrs[12] ; //- getnomeal( empid, paymon );
  F_OtherPay:=0;

  F_NightHour:=aDutCurrs[17];                            //16-夜班時數 2013-01-31 hyt add
                                        //23-其他補貼(刪)
  // 2008.01.24  << 2008 年一月份上半月不扣費用
  //2015.09.04 當月有上班才扣工團費
  if WorkDays> 0 then
    F_LaunCost:=GetLanuPay(EmpId,PayMon);                 //24-工團費
 // if paymon='200801'  then
 //    F_LaunCost:= 0 ;
   F_YiCardCost:=GetYiCardPay(EmpId,PayMon); //2012-03-22 hyt add 
  F_OtherTemp:=0;                                       //23-臨時金額
  // 2010.09.18 <<
 // if (RightStr(PayMon,2)='09') and (InfoCode='0') then                         //(中秋禮金)
   if (payMon='201309') and (InfoCode='0') then                         //(中秋禮金) 201108==>201209 2012-09-25 hyt upd
  begin
    //aSQL:='select * from hrd_picc where insu_cod=''9'' and emp_id='''+EmpId+'''';
    //if not CheckRecordExist(aSQL) then
      F_OtherTemp := 50000;  //F_OtherTemp  //+20000; 2013-10-04 hyt upd 30000->50000
  end;
  // 2010.09.18 >>

  //2014.09.20 中秋禮金
  if PayMon= '201409' then
  begin
    //中秋節即2014/09/08前(不含)進廠，且當月在職的員工才有中秋禮金
    if (FormatDateTime('YYYY/MM/DD', EmpInDate)<= '2014/09/07') and
       ((EmpLvDate= 0) or (FormatDateTime('YYYYMM', EmpLvDate)> PayMon)) then
      F_OtherTemp := F_OtherTemp + 50000;
  end;

  //2015.10.05 中秋禮金
  if PayMon= '201509' then
  begin
    //中秋節即2015/09/27前(不含)進廠，且當月在職的員工才有中秋禮金
    if (FormatDateTime('YYYY/MM/DD', EmpInDate)<= '2015/09/10') and
       ((EmpLvDate= 0) or (FormatDateTime('YYYYMM', EmpLvDate)> PayMon)) then
      F_OtherTemp := F_OtherTemp + 50000;
  end;


  //2014年09月20日 2014年09月起，試用期後滿一年，生日當月發放50000生日禮金
  if PayMon>= '201409' then
    F_OtherTemp := F_OtherTemp + GetBirthDay(EmpId, PayMon, PstCode, EmpInDate, EmpLvDate, EmpBirthDay);

  //***<<2010-11-30 hyt
  if (payMon>='201011') then
    F_OtherTemp:=F_OtherTemp+GetJiangli(EmpId,PayMon);
  //***>>

  F_OtherTemp:=F_OtherTemp+GetMarryAmt(EmpId,paymon); //2013-01-16 hyt add  結婚禮金 201301開始 

  //2013-06-24 hyt add 育兒津貼
  F_Foster_pay:=0;
  if (paymon >='201306') and (InfoCode='0')  then
    F_Foster_pay:=GetFoster_pay(EmpId,PayMon);
  //2015.08.27 離職補貼
  F_LeavPay := 0;
  //2015.05.04 離職補貼

  //
  boChange := False;
  if cbChange.Checked then
    boChange := IsChangeFactory(PayMon, EmpId);

  //2015.05.22 正常離職者才有離職補貼 2016.06.13 福祿變順杰補貼
  if (PayMon >= '201508') and ((InfoCode= '2') or boChange)then
    F_LeavPay := GetLeaveSubsidy(PayMon, EmpId, EmpInDate, EmpLvDate, boChange);


  //***<<<2013-05-04 hyt add       2016.05.07 5月1日離職的不享有50000
  if (paymon >='201305') and (rightStr(paymon,2)='05') and (FormatDateTime('MMDD', EmpLvDate)<> '0501') then
  begin
    F_OtherTemp:=F_OtherTemp+50000 ; //固定每年 5.1 都要加禮金 5萬
  end;
    //***>>>

  //
  if (PayMon= '201511') and ((EmpId= '074244') or (EmpId= '810030') or (EmpId= '062123') or (EmpId= '065417') or
                             (EmpId= '061012') or (EmpId= '072242') or (EmpId= '074848') or (EmpId= '078974') or
                             (EmpId= '810028') or (EmpId= '067202') or (EmpId= '064056') or (EmpId= '810029') or
                             (EmpId= '069079') or (EmpId= '069080') or (EmpId= '062959') or (EmpId= '066235')) then
    F_OtherTemp := F_OtherTemp + 180000;


 // if ( pstcode= '60' ) and ( Int(F_PsalPay) >= 0 )  then
 //     F_DutyPay  := 0 ;
  //2007.11.03-毒害津貼 <<
  if paymon <='200809'  then
     F_EnvrPay:=GetVirus(EmpId,PayMon)          //2007.11.03-毒害津貼
  else
     F_EnvrPay :=0 ;
 //2007.11.03-毒害津貼  >>
  // 2008.05.07 <<
  if paymon >= '200804'  then
  begin
   // if IsNewEmp1(EmpId,PayMon,PstCode,EmpInDate,EmpLvDate) then      //判斷該員工是否為新進員工
   // else
   //   begin
    if paymon < '200807' then
      F_GongPay := int((WorkDays/26)*100000 ) //1,另外補貼
    else
    begin
      if paymon ='200807'  then
        F_GongPay := int((WorkDays/26)*135000)  //1,另外補貼
      else
      begin
        if paymon <'201103'  then
          F_GongPay := int((WorkDays/26)*200000 ) //1,另外補貼
        else
          F_GongPay := int((WorkDays/26)*400000 ); //1,另外補貼   2011年3月
      end;
    end;
    //  end;
  end;
  // 2008.05.07 >>

  F_BasePay:=strToInt(formatFloat('0',F_BasePay));//加四舍五入 2013-06-07 hyt add
  F_GradPay:=strToInt(formatFloat('0',F_GradPay));
  F_DutyPay:=strToInt(formatFloat('0',F_DutyPay));
  F_TechPay:=strToInt(formatFloat('0',F_TechPay));
  F_MgmtPay:=strToInt(formatFloat('0',F_MgmtPay));
  F_EnvrPay:=strToInt(formatFloat('0',F_EnvrPay));
  F_EfftPay:=strToInt(formatFloat('0',F_EfftPay));
  F_SpcPay:=strToInt(formatFloat('0',F_SpcPay));
  F_DuoPay:=strToInt(formatFloat('0',F_DuoPay));
  F_NoLeavePay:=strToInt(formatFloat('0',F_NoLeavePay));
  F_OverPay:=strToInt(formatFloat('0',F_OverPay));
  F_NightPay:=strToInt(formatFloat('0',F_NightPay));
  F_GongPay:=strToInt(formatFloat('0',F_GongPay));
  F_SuppAgaiPay:=strToInt(formatFloat('0',F_SuppAgaiPay));
  F_PiccBackPay:=strToInt(formatFloat('0',F_PiccBackPay));
  F_SickPay:=strToInt(formatFloat('0',F_SickPay));
  F_SickPay2:=strToInt(formatFloat('0',F_SickPay2));
  F_OtherPay:=strToInt(formatFloat('0',F_OtherPay));
  F_OtherTemp:=strToInt(formatFloat('0',F_OtherTemp));
  F_LastAddPay:=strToInt(formatFloat('0',F_LastAddPay));
  //F_SalHolPay:=strToInt(formatFloat('0',F_SalHolPay));
  //F_IPsal:=strToInt(formatFloat('0',F_IPsal));
  F_Mealsal:=strToInt(formatFloat('0',F_Mealsal));
  //F_xiaoyeban:=strToInt(formatFloat('0',F_xiaoyeban));
  //F_dayeban:=strToInt(formatFloat('0',F_dayeban));
  F_MealCost:=strToInt(formatFloat('0',F_MealCost));
  F_AskCost:=strToInt(formatFloat('0',F_AskCost));
  F_StopCost:=strToInt(formatFloat('0',F_StopCost));
  F_PiccSheCost:=strToInt(formatFloat('0',F_PiccSheCost));
  F_PiccYiCost:=strToInt(formatFloat('0',F_PiccYiCost));
  F_LaunCost:=strToInt(formatFloat('0',F_LaunCost));
  F_SupDeduCost:=strToInt(formatFloat('0',F_SupDeduCost));
  //追收病保超付款 2015.07.27
  F_ZhuiShou   := StrToInt(FormatFloat('0', F_ZhuiShou));

  F_YiCardCost:=strToInt(formatFloat('0',F_YiCardCost));
  F_PiccShiyeCost:=strToInt(formatFloat('0',F_PiccShiyeCost));
  //F_LeavPay:=strToInt(formatFloat('0',F_LeavPay));
  //F_SalHolDec:=strToInt(formatFloat('0',F_SalHolDec));




  lciItem1:=round(F_BasePay+F_GradPay+F_DutyPay+F_TechPay+F_MgmtPay);
                                                        //26-應發薪資
  F_DealPay:=F_BasePay+F_MgmtPay+F_TechPay+F_DutyPay+F_GradPay
    +F_PsalPay+F_EfftPay+F_LongWorkPay+F_SpcPay+F_DuoPay+F_NoLeavePay+F_OverPay+F_NightPay+F_GongPay
    +F_SuppAgaiPay+F_PiccBackPay+F_SickPay+F_SickPay2+F_OtherPay+F_OtherTemp+F_LastAddPay +F_EnvrPay +F_Mealsal
    +F_Foster_pay  //2013-06-24 hyt add 育兒津貼
    +F_LeavPay;    //2015.08.27 lx add 離職津貼                                  
  F_RealPay:=F_DealPay-F_MealCost-F_AskCost-F_StopCost-F_PiccSheCost-F_PiccYiCost-
      F_LaunCost-F_SupDeduCost-F_PiccShiyeCost-F_YiCardCost - F_ZhuiShou - Int(F_DuoxiuKoukuan); //追收病保超付款 //多休扣款
   //2009.11.24<<
  F_DealPay1:=0;
 //// F_OverPay1 := 0;
 // F_DealPay1:= lciItem1 //F_BasePay+F_MgmtPay+F_TechPay+F_DutyPay+F_EnvrPay+F_GradPay
 //   +F_EfftPay+F_SpcPay+F_DuoPay+F_NoLeavePay+F_OverPay1+F_GongPay
 //   +F_SuppAgaiPay+F_OtherTemp  +F_Mealsal  ; //+F_PiccBackPay+F_SickPay+F_SickPay2;

 // F_RealPay1:=0;
 // F_RealPay1:=F_DealPay1-F_MealCost-F_AskCost-F_StopCost-F_PiccSheCost-F_PiccYiCost
  //    -F_LaunCost-F_SupDeduCost-F_PiccShiyeCost;
  F_DealPay1:= lciItem1 //F_BasePay+F_MgmtPay+F_TechPay+F_DutyPay+F_EnvrPay+F_GradPay
    + F_EfftPay+F_SpcPay+F_DuoPay+F_NoLeavePay+F_OverPay1+F_GongPay
    + F_SuppAgaiPay+F_OtherTemp    //+F_PiccBackPay+F_SickPay+F_SickPay2;
    + F_PiccBackPay  //2011-09-21 hyt add 保險返還
    + F_Foster_pay ; //2013-06-24 hyt add 育兒津貼
                                            //2012-02-20 hyt add F_NightPay 夜班津貼 (the same chingluh)
   //+F_LastAddPay+F_NightPay 2012-07-31 hyt add 財務要求 從2012-07開始 不要考慮 夜班補貼，補未發

  F_RealPay1:=0;
  F_RealPay1:=F_DealPay1-F_MealCost-F_AskCost-F_StopCost-F_PiccSheCost-F_PiccYiCost
      -F_SupDeduCost-F_PiccShiyeCost - F_ZhuiShou -
      //多休年假扣款
      Int(F_DuoxiuKoukuan); //追收病保超付款
 //2009.11.24 >>
  F_TaxCost:= 0;
  // 2011.01.14  add  <<
  if paymon ='201101'  then
     F_RealPay1 := F_RealPay1 + getyearsal( empid) ;
  // 2011.01.14  add   >>

  F_TaxCost:=GetSalTax(F_RealPay1,marryid,paymon,empid);
  F_TaxCost:=strToInt(formatFloat('0',F_TaxCost));//加四舍五入 2013-06-07 hyt add


 // F_TaxCost:=GetSalTax(F_RealPay);                     //25-個人所得稅
  // 2008.01.24  << 2008 年一月份上半月不扣費用
//  if paymon ='200801'  then
 //    F_TaxCost:= 0 ;

  F_RealPay:=F_RealPay-F_TaxCost;                      //27-實發薪資
 //  if paymon ='200801'  then
 //    begin
//        F_RealPay:= int( F_RealPay / 50000 )*50000;
 //    end;

  //***<<<2014-01-07 hyt add
  F_YuzhiPay:=0;
  if  paymon='201401' then
  begin
    //sTemp:=DB_GetSRecord('select advance_amt from hrd_year_end_bonus where r_year=''2013'' and emp_id='''+EmpId+''' ');// 上半月薪資
    sTemp:=DB_GetSRecord('select last_salary from hrd_sal_currency201401 where pay_mon=''201401'' and emp_id='''+EmpId+''' ');// 上半月薪資
    if sTemp<>'' then
    begin
      F_RealPay  :=F_RealPay - strToFloat(sTemp);
      F_YuzhiPay := strToFloat(sTemp);
    end;
  end;
  //***>>>

  if F_RealPay<0 then
  begin
    F_RealPay:=0;
    re_Message.Lines.Add('員工'+EmpId+' 的實發薪資小于零！請重新計算！');
  end;
  with qry_temp2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM '+g_sHrd_sal_paymt+' WHERE emp_id='''+EmpId+''' AND pay_mon='''+PayMon+'''');
    Open;
    if Eof then
    begin
      Append;
      FieldByName('upd_user').AsString:=UserName;
      FieldByName('upd_date').AsDateTime:=CurDateTime;
      FieldByName('dept_code').AsString:=DeptCode;
      FieldByName('info_code').AsString:=InfoCode;
      FieldByName('pst_code').AsString:=PstCode;
      FieldByName('emp_id').AsString:=EmpId;
      FieldByName('pay_mon').AsString:=PayMon;
      FieldByName('base_pay').AsCurrency:=Int(F_BasePay);
      FieldByName('mgmt_ofr').AsCurrency:=Int(F_MgmtPay);
      FieldByName('tech_ofr').AsCurrency:=Int(F_TechPay);
    //  if ( pstcode= '60' ) and ( Int(F_PsalPay) >= 0 )  then
    //     FieldByName('duty_ofr').AsCurrency:= 0    //Int(F_DutyPay);
    //  else
      FieldByName('duty_ofr').AsCurrency:=Int(F_DutyPay);
   //   FieldByName('envr_ofr').AsCurrency:=Int(F_EnvrPay);
      FieldByName('grad_ofr').AsCurrency:=Int(F_GradPay);
      if PayMon >='200704'   then
         begin
          FieldByName('efft_awd').AsCurrency:=Int(F_EfftPay);
          if ( pstcode= '60' ) and ( Int(F_PsalPay) >= 0 )  then
             FieldByName('psal_awd').AsCurrency:=Int(F_PsalPay) ;
         end;
      FieldByName('longwork_pay').AsCurrency:= 0 ; //Int(F_LongWorkPay);
      FieldByName('te_pay').AsCurrency:=Int(F_SpcPay);
      FieldByName('duo_awd').AsCurrency:=Int(F_DuoPay);
      FieldByName('full_awd').AsCurrency:=Int(F_NoLeavePay);
      FieldByName('over_work').AsCurrency:=Int(F_OverPay);
      FieldByName('sal_night').AsCurrency:=Int(F_NightPay);
      FieldByName('gong_pay').AsCurrency:=Int(F_GongPay);
      FieldByName('supp_agai').AsCurrency:=Int(F_SuppAgaiPay);
      FieldByName('picc_back').AsCurrency:=Int(F_PiccBackPay);
      FieldByName('othe_supp').AsCurrency:=Int(F_OtherPay);
      FieldByName('other_Temp').AsCurrency:=Int(F_OtherTemp);
      FieldByName('last_addition').AsCurrency:=Int(F_LastAddPay);
      FieldByName('sick_supp').AsCurrency:=Int(F_SickPay);
      FieldByName('sick_back').AsCurrency:=Int(F_SickPay2);
      FieldByName('deal_pay').AsCurrency:=Int(F_DealPay);
      FieldByName('meal_pay').AsCurrency:=Int(F_MealCost);
      FieldByName('ask_pay').AsCurrency:=Int(F_AskCost);
      FieldByName('stop_dedu').AsCurrency:=Int(F_StopCost);
      FieldByName('picc_she').AsCurrency:=Int(F_PiccSheCost);
      FieldByName('picc_yi').AsCurrency:=Int(F_PiccYiCost);
      FieldByName('yicard_dedu').AsCurrency:=Int(F_YiCardCost); //醫療卡扣款
      FieldByName('laun_pay').AsCurrency:=Int(F_LaunCost);
      FieldByName('tax_pay').AsCurrency:=Int(F_TaxCost);

      if (paymon ='201401')  then
        FieldByName('sup_dedu').AsCurrency:=Int(F_SupDeduCost) + Int(F_YuzhiPay )
      else
        FieldByName('sup_dedu').AsCurrency:=Int(F_SupDeduCost) ; //上月補扣
      //追收病保超付款 2015.07.27
      FieldByName('zhuishuo_BHXH').AsCurrency := Int(F_ZhuiShou);
      //多休年假扣款 2016.02.27
      FieldByName('duoxiu_koukuan').AsFloat:= Int(F_DuoxiuKoukuan);

      FieldByName('actu_pay').AsCurrency:=Int(F_RealPay);
      FieldByName('envr_ofr').AsCurrency:= 0 ; //Int(F_EnvrPay);    // 2007/11/03 <<
      FieldByName('picc_shiye').AsCurrency:=Int( F_PiccShiyeCost) ; //Int(F_EnvrPay);    // 2009/02/10 <<
   //   FieldByName('OT_hour15').AsFloat := aDutCurrs[9];
   //   FieldByName('OT_hour20').AsFloat := aDutCurrs[10];
    //  FieldByName('OT_hour30').AsFloat := aDutCurrs[11];
    //  FieldByName('OT_hour195').AsFloat := aDutCurrs[13];
    //2010/07/12 <<
      FieldByName('over_time').AsFloat:=F_Over15Hour + F_Over20Hour + F_Over30Hour; // 加班時數
      FieldByName('over15_hour').AsFloat:=F_Over15Hour; //   加班時數1.5
      FieldByName('over15_price').AsCurrency:=Int(F_HourPrice*1.5); // 加班薪資1.5倍
      FieldByName('over15_sal').AsCurrency:=Int(F_Over15Hour*F_HourPrice*1.5); //加班費1.5
      FieldByName('over20_hour').AsFloat:=F_Over20Hour; //   加班時數2.0
      FieldByName('over20_price').AsCurrency:=Int(F_HourPrice*2);// 加班時薪2.0倍
      FieldByName('over20_sal').AsCurrency:=Int(F_Over20Hour*F_HourPrice*2.0);  // 加班薪資2.0倍
      FieldByName('over30_hour').AsFloat:=F_Over30Hour;  //  加班時數3.0

      if PayMon<'201305' then
      begin
        FieldByName('over30_price').AsCurrency:=Int(F_HourPrice*2);  //加班時薪3.0倍
        FieldByName('over30_sal').AsCurrency:=Int(F_Over30Hour*F_HourPrice*2.0) //// 加班薪資3.0倍
      end
      else
      begin
        FieldByName('over30_price').AsCurrency:=Int(F_HourPrice*3);  //加班時薪3.0倍
        FieldByName('over30_sal').AsCurrency:=Int(F_Over30Hour*F_HourPrice*3.0); //// 加班薪資3.0倍    2013-05-31 hyt upd
      end;
      FieldByName('over195_hour').AsFloat:=F_Over195Hour;  //  加班時數195
      FieldByName('over195_price').AsCurrency:=Int(F_HourPrice*GetOver195(PayMon));  //加班時薪195倍1.95
      FieldByName('over195_sal').AsCurrency:=Int(F_Over195pay); //// 加班薪資195倍
      //2010/07/12  >>

      FieldByName('meal_sal').AsFloat:=F_Mealsal; //餐費補貼

      FieldByName('night_time').AsFloat:=F_NightHour; // 夜班時數 2013-01-31 hyt add
      FieldByName('foster_pay').AsFloat:=F_Foster_pay; //育兒津貼 2013-06-24 hyt add
      //2015.08.27 離職補貼
      FieldByName('leav_pay').AsFloat := F_LeavPay;
      Post;
    end
    else begin
      Edit;
      FieldByName('upd_user').AsString:=UserName;
      FieldByName('upd_date').AsDateTime:=CurDateTime;
      FieldByName('dept_code').AsString:=DeptCode;
      FieldByName('info_code').AsString:=InfoCode;
      FieldByName('pst_code').AsString:=PstCode;
      FieldByName('base_pay').AsCurrency:=Int(F_BasePay);
      FieldByName('mgmt_ofr').AsCurrency:=Int(F_MgmtPay);
      FieldByName('tech_ofr').AsCurrency:=Int(F_TechPay);
     // if ( pstcode= '60' ) and ( Int(F_PsalPay) > 0 )  then
    //     FieldByName('duty_ofr').AsCurrency:= 0    //Int(F_DutyPay);
     // else
      FieldByName('duty_ofr').AsCurrency:=Int(F_DutyPay);
   //   FieldByName('duty_ofr').AsCurrency:=Int(F_DutyPay);
  //    FieldByName('envr_ofr').AsCurrency:=Int(F_EnvrPay);
      FieldByName('grad_ofr').AsCurrency:=Int(F_GradPay);

      if  PayMon >='200704' then
          begin
            FieldByName('efft_awd').AsCurrency:=Int(F_EfftPay);
            if ( pstcode= '60' ) and ( Int(F_PsalPay) >= 0 )  then
               FieldByName('psal_awd').AsCurrency:=Int(F_PsalPay) ;
          end;
      FieldByName('longwork_pay').AsCurrency:= 0 ; //Int(F_LongWorkPay);
      FieldByName('te_pay').AsCurrency:=Int(F_SpcPay);
      FieldByName('duo_awd').AsCurrency:=Int(F_DuoPay);
      FieldByName('full_awd').AsCurrency:=Int(F_NoLeavePay);
      FieldByName('over_work').AsCurrency:=Int(F_OverPay);
      FieldByName('sal_night').AsCurrency:=Int(F_NightPay);
      FieldByName('gong_pay').AsCurrency:=Int(F_GongPay);
      FieldByName('supp_agai').AsCurrency:=Int(F_SuppAgaiPay);
      FieldByName('picc_back').AsCurrency:=Int(F_PiccBackPay);
      FieldByName('othe_supp').AsCurrency:=Int(F_OtherPay);
      FieldByName('other_Temp').AsCurrency:=Int(F_OtherTemp);
      FieldByName('last_addition').AsCurrency:=Int(F_LastAddPay);
      FieldByName('sick_supp').AsCurrency:=Int(F_SickPay);
      FieldByName('sick_back').AsCurrency:=Int(F_SickPay2);
      FieldByName('deal_pay').AsCurrency:=Int(F_DealPay);
      FieldByName('meal_pay').AsCurrency:=Int(F_MealCost);
      FieldByName('ask_pay').AsCurrency:=Int(F_AskCost);
      FieldByName('stop_dedu').AsCurrency:=Int(F_StopCost);
      FieldByName('picc_she').AsCurrency:=Int(F_PiccSheCost);
      FieldByName('picc_yi').AsCurrency:=Int(F_PiccYiCost);
      FieldByName('yicard_dedu').AsCurrency:=Int(F_YiCardCost); //醫療卡扣款
      FieldByName('laun_pay').AsCurrency:=Int(F_LaunCost);
      FieldByName('tax_pay').AsCurrency:=Int(F_TaxCost);

      if (paymon ='201401')  then      //2014-01-22 hyt add
        FieldByName('sup_dedu').AsCurrency:=Int(F_SupDeduCost) + Int(F_YuzhiPay )
      else
        FieldByName('sup_dedu').AsCurrency:=Int(F_SupDeduCost);

      //追收病保超付款 2015.07.27
      FieldByName('zhuishuo_BHXH').AsCurrency := Int(F_ZhuiShou);
      //多休年假扣款 2016.02.27
      FieldByName('duoxiu_koukuan').AsFloat:= Int(F_DuoxiuKoukuan); 

      FieldByName('actu_pay').AsCurrency:=Int(F_RealPay);
      FieldByName('envr_ofr').AsCurrency:=Int(F_EnvrPay);   // 2007.11.03
      FieldByName('picc_shiye').AsCurrency:=Int( F_PiccShiyeCost) ; //Int(F_EnvrPay);    // 2009/02/10 <<
       //2010/07/12 <<
      FieldByName('over_time').AsFloat:=F_Over15Hour + F_Over20Hour + F_Over30Hour; // 加班時數
      FieldByName('over15_hour').AsFloat:=F_Over15Hour; //   加班時數1.5
      FieldByName('over15_price').AsCurrency:=Int(F_HourPrice*1.5); // 加班薪資1.5倍
      FieldByName('over15_sal').AsCurrency:=Int(F_Over15Hour*F_HourPrice*1.5); //加班費1.5
      FieldByName('over20_hour').AsFloat:=F_Over20Hour; //   加班時數2.0
      FieldByName('over20_price').AsCurrency:=Int(F_HourPrice*2);// 加班時薪2.0倍
      FieldByName('over20_sal').AsCurrency:=Int(F_Over20Hour*F_HourPrice*2.0);  // 加班薪資2.0倍

      FieldByName('over30_hour').AsFloat:=F_Over30Hour;  //  加班時數3.0
      if PayMon<'201305' then
      begin
        FieldByName('over30_price').AsCurrency:=Int(F_HourPrice*2);  //加班時薪3.0倍
        FieldByName('over30_sal').AsCurrency:=Int(F_Over30Hour*F_HourPrice*2); //// 加班薪資3.0倍
      end
      else  //2013-05-31 hyt add
      begin
        FieldByName('over30_price').AsCurrency:=Int(F_HourPrice*3);  //加班時薪3.0倍
        FieldByName('over30_sal').AsCurrency:=Int(F_Over30Hour*F_HourPrice*3); //// 加班薪資3.0倍
      end;
      FieldByName('over195_hour').AsFloat:=F_Over195Hour;  //  加班時數195
      FieldByName('over195_price').AsCurrency:=Int(F_HourPrice*GetOver195(PayMon));  //加班時薪195倍1.95
      FieldByName('over195_sal').AsCurrency:=Int(F_Over195pay); //// 加班薪資195倍
      //2010/07/12  >>
      FieldByName('meal_sal').AsFloat:=F_Mealsal; //餐費補貼

      FieldByName('night_time').AsFloat:=F_NightHour; // 夜班時數 2013-01-31 hyt add
      FieldByName('foster_pay').AsFloat:=F_Foster_pay; //育兒津貼 2013-06-24 hyt add
      //2015.08.27 離職補貼
      FieldByName('leav_pay').AsFloat := F_LeavPay;
      Post;
    end;
  end;
  with ClientDataSet1 do
  begin
    Append;
    FieldByName('dept_code').AsString:=DeptCode;
    FieldByName('info_code').AsString:=InfoCode;
    FieldByName('pst_code').AsString:=PstCode;
    FieldByName('emp_id').AsString:=EmpId;
    FieldByName('pay_mon').AsString:=PayMon;
    FieldByName('base_pay').AsCurrency:=Int(F_BasePay);
    FieldByName('mgmt_ofr').AsCurrency:=Int(F_MgmtPay);
    FieldByName('tech_ofr').AsCurrency:=Int(F_TechPay);
    FieldByName('duty_ofr').AsCurrency:=Int(F_DutyPay);
  //  FieldByName('envr_ofr').AsCurrency:=Int(F_EnvrPay);
    FieldByName('grad_ofr').AsCurrency:=Int(F_GradPay);

    if  PayMon >='200704' then
        begin
          FieldByName('efft_awd').AsCurrency:=Int(F_EfftPay);
          FieldByName('psal_awd').AsCurrency:=Int(F_PsalPay);
        end;
    FieldByName('te_pay').AsCurrency:=Int(F_SpcPay);
    FieldByName('duo_awd').AsCurrency:=Int(F_DuoPay);
    FieldByName('full_awd').AsCurrency:=Int(F_NoLeavePay);
    FieldByName('over_work').AsCurrency:=Int(F_OverPay);
    FieldByName('sal_night').AsCurrency:=Int(F_NightPay);
    FieldByName('gong_pay').AsCurrency:=Int(F_GongPay);
    FieldByName('supp_agai').AsCurrency:=Int(F_SuppAgaiPay);
    FieldByName('picc_back').AsCurrency:=Int(F_PiccBackPay);
    FieldByName('othe_supp').AsCurrency:=Int(F_OtherPay);
    FieldByName('other_Temp').AsCurrency:=Int(F_OtherTemp);
    FieldByName('sick_supp').AsCurrency:=Int(F_SickPay);
    FieldByName('sick_back').AsCurrency:=Int(F_SickPay2);
    FieldByName('deal_pay').AsCurrency:=Int(F_DealPay);
    FieldByName('meal_pay').AsCurrency:=Int(F_MealCost);
    FieldByName('ask_pay').AsCurrency:=Int(F_AskCost);
    FieldByName('stop_dedu').AsCurrency:=Int(F_StopCost);
    FieldByName('picc_she').AsCurrency:=Int(F_PiccSheCost);
    FieldByName('picc_yi').AsCurrency:=Int(F_PiccYiCost);
    FieldByName('laun_pay').AsCurrency:=Int(F_LaunCost);
    FieldByName('tax_pay').AsCurrency:=Int(F_TaxCost);
    FieldByName('sup_dedu').AsCurrency:=Int(F_SupDeduCost);
    FieldByName('actu_pay').AsCurrency:=Int(F_RealPay);
    FieldByName('envr_ofr').AsCurrency:= 0 ; //Int(F_EnvrPay); // 2007.11.03
    //追收病保超付款 2015.07.27
    FieldByName('zhuishuo_BHXH').AsCurrency := Int(F_ZhuiShou);
    Post;
  end;
end;
{===============================================================================
  函數名稱:GetBase  -- 計算員工基本工資
  參數:    EmpId -- 員工工號  PayMon  -- 工資月份 PstCode -- 職稱
           EmpInDate -- 進廠日期  EmpLvDate -- 離職日期
===============================================================================}
function TFormSal07.GetBase(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime;EduCode:string=''):Currency;
var
  PayNormal,PayTest:Currency;
  NormalTestDays:TNormalTestDays;
  NormalDays,TestDays,edu_no:Integer;
begin
  //PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl);//正式基本薪資
 // if paymon <'200801'  then
     PayNormal:=GetNormalBase(Empid, paymon, PstCode,EduCode,EmpInDate,SalBaseLvl,false); //正式基本薪資
 // else
  //   begin
  //     if( pstcode ='60' )  then
  //        PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 170000 ;   //2008.01 起職員作業員薪資上浮190000
  //     if ( pstCode ='50' ) then
  //        PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 190000 ;   //2008.01 起職員作業員薪資上浮190000
  //     if ( pstCode ='46' ) or ( pstcode ='41' ) or ( pstcode ='42' )  then
 //         PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 172000 ;  // 2008.01 起班長級薪資上浮172000
  //     if ( pstCode ='33' ) or ( pstcode ='37' )  then
  //        PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 242000 ;  // 2008.01 起組長級薪資上浮242000
  //     if ( pstCode ='22' ) or ( pstcode ='26' ) or ( pstcode ='28' )  then
  //        PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 342000 ;  // 2008.01 起課長級薪資上浮342000
  //     if ( pstCode ='18' ) or ( pstcode ='19' )   then
  //        PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 442000 ;  // 2008.01 起主任級薪資上浮90000
  //   end;
//  if PstCode>='50' then//試用期薪資
//     begin
       if paymon >='200801'  then
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 90000    // 2008.01起試用期薪資上浮90000
       else
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) ;

       if paymon >='200810'  then
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 ;    // 2008.10起試用期薪資上浮150000

       if paymon >='200901'  then
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000;    // 2008.10起試用期薪資上浮150000
       if paymon >='201001'  then
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000+110000;    // 2008.10起試用期薪資上浮150000
       if paymon >='201101'  then
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000+110000 + 430000 ;    // 2008.10起試用期薪資上浮150000
       if paymon >='201107'  then
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000+110000 + 430000 + 200000 ;    // 2008.10起試用期薪資上浮150000
       if paymon >='201110'  then //2011-11-01 hyt add
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000+110000 + 430000 + 200000+60000 ;    // 2011.10起試用期薪資上浮60000
       if paymon >='201301'  then //2013-01-09 hyt add
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000+110000 + 430000 + 200000+60000+320000 ;    // 2013.01起試用期薪資上浮320000
       if paymon >='201401'  then //2014-01-07 hyt add
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000+110000 + 430000 + 200000+60000+320000+300000;    // 2013.01起試用期薪資上浮3000000

       //2015.01.07 試用期基本薪資+400000
       if PayMon>= '201501' then
         PayTest:= 2830000;
       //2016.01.06 試用期薪資漲至3230000
       if PayMon>= '201601' then
         PayTest:= 3230000;

       //2017.01.06 試用期薪資漲至3480000  
       if PayMon >= '201701' then
         PayTest := 3480000;  

 //   end
 //   end
//  else//職員以上無試用期
  //  begin
//     if paymon >='200801'  then
  //        PayTest:=PayNormal + 90000    // 2008.01起試用期薪資上浮90000
   //    else
  //       PayTest:=PayNormal ;
 //   end;
   // PayTest:=PayNormal;
  {
  if SalBaseLvl.IndexOf(PstCode)>=0 then
    PayNormal:=StrToFloat(SalBaseLvl.Strings[SalBaseLvl.IndexOf(PstCode)+1]);
  if EmpInDate<EncodeDate(2004,9,1) then//2004/9/1前進廠考慮學歷附加金額
  begin
    if TryStrToInt(EduCode,Edu_no) then
      EduCode:=Format('%.2d',[Edu_no]);
    if pstCode='60' then
    begin
      if (EduCode>='12') and (EduCode<='14') then
        PayNormal:=PayNormal+50000;
      if (EduCode>='15') then
        PayNormal:=PayNormal+120000;
    end;
    if pstCode='50' then
    begin
      if (EduCode>='12') and (EduCode<='14') then
        PayNormal:=PayNormal+30000;
      if (EduCode>='15') then
        PayNormal:=PayNormal+100000;
    end;
    if (pstCode>='41') and (pstCode<='46') then
    begin
      if (EduCode>='15') then
        PayNormal:=PayNormal+70000;
    end;
  end;}
  NormalTestDays:=GetNormalTestDays(EmpId,PayMon,PstCode,EmpInDate,EmpLvDate);
  NormalDays:=NormalTestDays[0];
  TestDays:=NormalTestDays[1];

  //***<<<2014-01-07 hyt add 分析計算半個月薪資的情況
  {if PayMon='201401' then
  begin
    if (NormalDays+TestDays)>13 then
    begin         //beizhu
      if TestDays>=13 then //先扣
      begin
        TestDays:=13;
        NormalDays:=0;
      end
      else
      begin
        NormalDays:=13-TestDays;
      end
    end;
  end;}
  //***>>>

  Result:=(NormalDays/26)*PayNormal+(TestDays/26)*PayTest;

  //分析是否有特殊人員 剛進廠就不用 試用期的情況    2013-01-10 hyt add
  if TestDays>0 then
  begin
    if DB_SeekRecord('SELECT * FROM hrd_emp_spc_set where emp_id='''+EmpId+''' and if_test=0')=true then
       Result:=((NormalDays+TestDays)/26)*PayNormal;
  end;
end;
{===============================================================================
  函數名稱:GetBase  -- 計算員工基本工資
  參數:    EmpId -- 員工工號  PayMon  -- 工資月份 PstCode -- 職稱
           EmpInDate -- 進廠日期  EmpLvDate -- 離職日期
===============================================================================}
function TFormSal07.GetBase1(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime;EduCode:string=''):Currency;
var
  PayNormal,PayTest:Currency;
  NormalTestDays:TNormalTestDays;
  NormalDays,TestDays,edu_no:Integer;
begin
  //PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl);//正式基本薪資
 // if paymon <'200801'  then
     PayNormal:=GetNormalBase(Empid,paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) ; //正式基本薪資
//  else
 //    begin
  //     if( pstcode ='60' )  then
 //         PayNormal:=GetNormalBase(paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 170000 ;   //2008.01 起職員作業員薪資上浮190000
 //      if ( pstCode ='50' ) then
  //        PayNormal:=GetNormalBase(paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 190000 ;   //2008.01 起職員作業員薪資上浮190000
  //     if ( pstCode ='46' ) or ( pstcode ='41' ) or ( pstcode ='42' )  then
  //        PayNormal:=GetNormalBase(paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 172000 ;  // 2008.01 起班長級薪資上浮172000
  //     if ( pstCode ='33' ) or ( pstcode ='37' )  then
  //        PayNormal:=GetNormalBase(paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 242000 ;  // 2008.01 起組長級薪資上浮242000
  //     if ( pstCode ='22' ) or ( pstcode ='26' ) or ( pstcode ='28' )  then
  //        PayNormal:=GetNormalBase(paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 342000 ;  // 2008.01 起課長級薪資上浮342000
   //    if ( pstCode ='18' ) or ( pstcode ='19' )   then
   //       PayNormal:=GetNormalBase(paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 442000 ;  // 2008.01 起主任級薪資上浮90000
 //    end;
 // if PstCode>='50' then//試用期薪資
  //   begin
  //     if paymon >='200801'  then
  //        PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 90000    // 2008.01起試用期薪資上浮90000
  //     else
  //       PayTest:=StrToFloat(SalBaseLvl.Strings[1]) ;
  //  end
 // else//職員以上無試用期
 //   begin
  //   if paymon >='200801'  then
 //         PayTest:=PayNormal + 90000    // 2008.01起試用期薪資上浮90000
  //     else
  //       PayTest:=PayNormal ;
 //   end;
// Result:=PayNormal;
end;

{function Tformsal07.GetNormalBase(PstCode,EduCode:String;EmpInDate:TDateTime):Currency;
//取得某職稱正式薪資基數
var
  PayNormal:double;
  edu_no:integer;
begin
  if SalBaseLvl.IndexOf(PstCode)>=0 then
    PayNormal:=StrToFloat(SalBaseLvl.Strings[SalBaseLvl.IndexOf(PstCode)+1]);
  if EmpInDate<EncodeDate(2004,9,1) then//2004/9/1前進廠考慮學歷附加金額
  begin
    if TryStrToInt(EduCode,Edu_no) then
      EduCode:=Format('%.2d',[Edu_no]);
    if pstCode='60' then
    begin
      if (EduCode>='12') and (EduCode<='14') then
        PayNormal:=PayNormal+50000;
      if (EduCode>='15') then
        PayNormal:=PayNormal+120000;
    end;
    if pstCode='50' then
    begin
      if (EduCode>='12') and (EduCode<='14') then
        PayNormal:=PayNormal+30000;
      if (EduCode>='15') then
        PayNormal:=PayNormal+100000;
    end;
    if (pstCode>='41') and (pstCode<='46') then
    begin
      if (EduCode>='15') then
        PayNormal:=PayNormal+70000;
    end;
  end;
  result:=PayNormal;
end;}

{===============================================================================
  GetSpcGong(EmpId:String;Id:Integer)  計算功績獎金与特別獎金
  input :EmpId 員工工號  PayMon 薪資月份 EmpInDate 進廠日期 EmpLvDate 離職日期
  output:RetArr 0-特別獎金 1-功績獎金
===============================================================================}
function TFormSal07.GetSpcGong(EmpId,PayMon:String;WorkDays:Integer):TSpcGongCurrs;
var
  ValidDate:TDateTime;
  RetArr:TSpcGongCurrs;
begin
  with qry_temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_sal_spec WHERE emp_id='''+EmpId+'''');
    Open;
    if Eof then
    begin
      RetArr[0]:=0;
      RetArr[1]:=0;
    end
    else begin
      ValidDate:=FieldByName('valid_date').AsDateTime;
      //判斷薪資月份是否生效了
      if StrToInt(RightStr(PayMon,2))+(StrToInt(LeftStr(PayMon,4))-YearOf(ValidDate))*12-
        MonthOf(ValidDate)<0 then
      begin
        RetArr[0]:=0;
        RetArr[1]:=0;
      end
      else begin
        RetArr[0]:=Int((WorkDays/26)*FieldByName('sal_spec').AsCurrency);
        RetArr[1]:=Int((WorkDays/26)*FieldByName('sal_achi').AsCurrency);
      end;//if
    end;//if
  end;//with
  Result:=RetArr;
end;
{===============================================================================
  得到保險基數
===============================================================================}
function  TFormSal07.CheckHasPicc(EmpId,PayMon:String):Boolean;
var
  PayNormal:Currency;
  sqlstr:string;
  ADate:TDatetime;
   SDate :string ;
begin
  ADate:=EncodeDate(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)),1);
  ADate:=EndOfTheMonth(ADate);
   SDate := LeftStr(PayMon,4) +'/'+ RightStr(PayMon,2)+'/14' ;   //2011.07.29 upd
  //當月離職不交保險
  //PayNormal:=StrToFloat(SalBaseLvl.Strings[SalBaseLvl.IndexOf(PstCode)+1]);
  sqlstr:='SELECT * FROM hrd_picc A,hrd_emp B WHERE A.emp_id=B.emp_id'
    +' and A.emp_id='''+EmpId+''' AND A.picc_mon<='''+PayMon+''' and insu_cod=''1'''
    +' and (B.epledt is null or B.epledt>'''+ SDate+''')' ;//+FormatDateTime('yyyy/mm/dd',ADate)+''')';
  if CheckRecordExist(sqlstr) then
    Result:=true
  else
    Result:=false;
end;
{===============================================================================
  Name:GetLanuPay(EmpId,PayMon:String):Currency;
  得到公團費
===============================================================================}
function TFormSal07.GetLanuPay(EmpId,PayMon:String):Currency;
begin
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_lanu WHERE emp_id='''+EmpId+''' AND lanu_date<='''+PayMon+'''');
    Open;
    if not Eof then
    begin
      //2015.02.02 2015年1月起共團費漲至20000
      if PayMon >= '201501' then
         Result:= 20000
      else if paymon>='201102'  then
         Result:=10000
      else
         Result:=LANU_PAY   ;
    end
    else
      Result:=0;
    Close;
  end;
end;
{===============================================================================
  Name:GetMultPay(EmpId,PayMon:String):Currency;
  得到多工獎金
===============================================================================}
function TFormSal07.GetMultPay(EmpId,PayMon:String):Currency;
begin
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_sal_mult WHERE emp_id='''+EmpId+'''');
    Open;
    if not Eof then
    begin
      if (FieldByName('valid_date').Value <> null) and (FormatDateTime('yyyymm',FieldByName('valid_date').AsDateTime)<=PayMon) then
        Result:=FieldByName('wrk_pay').AsCurrency
      else
        Result:=0;
    end
    else
      Result:=0;
    Close;
  end;
end;
{===============================================================================
  GetSupDedu(EmpId,PayMon:String):Currency;
  得到上月補發補扣
===============================================================================}
function TFormSal07.GetBuFaKou(EmpId,PayMon,BuType:String):Currency;
var
  RetCur:Currency;
  aSQL,LastMon:String;
  ADate:TDatetime;
begin
  RetCur:=0;
  ADate:=EnCodeDate(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)),1)-1;
  LastMon:=FormatDateTime('yyyymm',ADate);
  aSQL:='SELECT * FROM hrd_sal_allowance WHERE emp_id='''+EmpId+''' AND al_mon='''+LastMon+'''';
  if BuType='1' then //補發
    aSQL:=aSQL+' AND al_type=''1'''
  else if BuType='2' then  //扣款
    aSQL:=aSQL+' AND al_type=''2'''
  //追收病保超付款 2015.07.27
  else if BuType= '3' then
    aSQL:=aSQL+' AND al_type=''3'''
  else
    aSQL:=aSQL+' AND 1=2';
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    if not Eof then
    begin
      while not Eof do
      begin
      //  if FieldByName('al_type').AsString='1' then//補發
           RetCur:=RetCur+FieldByName('al_money').AsCurrency;
       // if FieldByName('al_type').AsString='2' then//補扣
       //   RetCur:=RetCur-FieldByName('al_money').AsCurrency;
        Next;
      end;
    end
    else
      RetCur:=0;
    Close;
  end;
  Result:=RetCur;
end;
{===============================================================================
  GetLastAddition(EmpId,PayMon:String):Currency;
  得到上月餘額
  anil add 2007/2/5
===============================================================================}
function TFormSal07.GetLastAddition(EmpId,PayMon:String):Currency;
var
  RetCur:Currency;
  aSQL,LastMon:String;
  ADate:TDatetime;
begin
  RetCur:=0;
  ADate:=EnCodeDate(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)),1)-1;
  LastMon:=FormatDateTime('yyyymm',ADate);
  //anil modify 2007/2/5 封裝最小截至2000,尾數纍計到下月
  if (PayMon>='200702') then
  begin
     if paymon ='200802'  then
       aSQL:='SELECT a.salary-a.full_sal-b.full_sal FROM hrd_sal_currency as a, hrd_med_sal as b  WHERE  a.emp_id=b.emp_id and '
         +' a.emp_id='''+EmpId+''' AND a.pay_mon='''+LastMon+''''
    else

     aSQL:='SELECT salary-full_sal FROM hrd_sal_currency WHERE '
      +' emp_id='''+EmpId+''' AND pay_mon='''+LastMon+''''; 
 //   aSQL:='SELECT salary-full_sal FROM hrd_sal_currency WHERE '
  //    +' emp_id='''+EmpId+''' AND pay_mon='''+LastMon+'''';
    with qry_Temp do
    begin
      Close;
      SQL.Clear;
      SQL.Add(aSQL);
      Open;
      if not Eof then
        RetCur:=RetCur+Fields[0].AsCurrency;
    end;
  end;
  Result:=RetCur;
end;
{===============================================================================
  GetDutyPay():Currency -- 得到職務津貼
===============================================================================}
function TFormSal07.GetDutyPay(EmpId,PayMon,PstCode:String;PstPay:Currency;WorkDays:Integer):Currency;
var
  WorkSal,              //工種補貼
  OfrPay,OfrPay1,OfrPay2:Currency;
  aSQL:String;
  ValidDay,FirstDay,SecondDay,EDay,SDay,DayCount,DayLeft:Integer;
begin
  OfrPay:=0;
  if PstCode='60' then //1,作業員
  begin
    with qry_temp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM hrd_wrkpay WHERE emp_id='''+EmpId+''' AND wrk_mon='''+PayMon+'''');
      Open;
      if (not Eof) and (FieldByName('valid_date').AsDateTime<>0) then
      begin
        WorkSal:=FieldByName('wrk_sal').AsCurrency;
        OfrPay:=Int((WorkDays/26)*WorkSal);
      end
      else
        OfrPay:=0;
      Close;
    end;
  end
  //2
  else if (PstCode='28') or (PstCode='33') or (PstCode='41') or (PstCode='42') or (PstCode='46') or (PstCode='50') then
  begin
//    aSQL:='SELECT pst_pay FROM hrd_saltran WHERE emp_id='''+EmpId+
//      ''' AND valid_date=(SELECT MAX(valid_date) FROM hrd_saltran WHERE valid_date<'''+
//      FormatDateTime('yyyy/mm/dd',MonSDate)+''' AND emp_id='''+EmpId+''' order BY valid_date desc)';
    aSQL:='SELECT * FROM hrd_saltran WHERE emp_id='''+EmpId+
      ''' AND valid_date<='''+FormatDateTime('yyyy/mm/dd',MonEDate)+''' order BY valid_date desc';
    with qry_temp do
    begin
      Close;
      SQL.Clear;
      SQL.Add(aSQL);
      Open;
      EDay:=DayOf(MonEDate);
      DayLeft:=WorkDays;//剩下可用天數最多為工作天數(如26)
      OfrPay:=0;
      while not eof do
      begin
        if DateOf(FieldByName('valid_date').AsDateTime)>DateOf(MonEDate) then
          Next;//跳過當月之後調職的紀錄
        SDay:=DayOf(FieldByName('valid_date').AsDateTime);
        if DateOf(FieldByName('valid_date').AsDateTime)<DateOf(MonSDate) then
          SDay:=1;//上月調職的紀錄設置起始日期為1
        DayCount:=EDay-SDay+1-GetSunDayCount(SDay,EDay,PayMon);
        DayCount:=min(DayCount,DayLeft);
        OfrPay1:=FieldByName('pst_pay').AsFloat;
        OfrPay:=OfrPay+int(OfrPay1*DayCount/26);
        DayLeft:=DayLeft-DayCount;
        EDay:=SDay;
        if EDay=1 then
          break;
        Next;
      end;
{      if not Eof then
        try
          OfrPay1:=FieldByName('pst_pay').AsCurrency;
        except
          OfrPay1:=0;
        end
      else
        OfrPay1:=0;}
      Close;
    end;
    aSQL:='SELECT pst_pay,valid_date FROM hrd_saltran WHERE emp_id='''+EmpId+''''+
      ' AND Year(valid_date)='+LeftStr(PayMon,4)+' AND Month(valid_date)='+IntToStr(StrToInt(RightStr(PayMon,2)))
      +'  order by valid_date desc';
{    with qry_Temp do
    begin
      Close;
      SQL.Clear;
      SQL.Add(aSQL);
      Open;
      if not Eof then
      begin
        try
          OfrPay2:=FieldByName('pst_pay').AsCurrency;
        except
          OfrPay2:=0;
        end;
        ValidDay:=DayOf(FieldByName('valid_date').AsDateTime);
        FirstDay:=ValidDay-GetSunDayCount(1,ValidDay,PayMon);  //本月調薪前工作天數
        SecondDay:=WorkDays-FirstDay;                          //本月調薪后工作天數
        if FirstDay<0 then FirstDay:=0;
        if SecondDay<0 then FirstDay:=0;
        OfrPay:=Int((FirstDay*OfrPay1+SecondDay*OfrPay2)/26);
      end
      else
        OfrPay:=Int(OfrPay1*WorkDays/26);
    end;}
  end
  //3
  else begin
    OfrPay:=Int((WorkDays/26)*PstPay);
  end;
  Result:=OfrPay;
end;

{===============================================================================
  函數名稱:GetGrad(GradStr:String):Currency -- 得到 職務等級額
  輸入參數:GradStr -- eg. 0102 0504
===============================================================================}
function TFormSal07.GetGrad(GradStr,PstCode:String;WorkDays:Integer):Currency;
var
  GradClas,GradLevel:Integer;
  aSQL:String;
  GradPay:Currency;
begin
  if Length(GradStr)=4 then
  begin
    GradClas:=StrToInt(LeftStr(GradStr,2));
    GradLevel:=StrToInt(RightStr(GradStr,2));
  end
  else begin
    GradClas:=0;
    GradLevel:=0;
  end;
  if GradLevel=0 then
  begin
    if PstCode='50'  then
      GradPay:=20000
    else
      GradPay:=0;
  end;
  if GradClas>9 then
    GradPay:=0;
  if GradLevel<>0 then
  begin
    aSQL:='SELECT grad_'+IntToStr(GradLevel)+' FROM hrd_sal_lvl WHERE grad_clas='''+IntToStr(GradClas)+'''';
    with DMHrdsys.SQLQuery4 do
    begin
      Close;
      SQL.Clear;
      SQL.Add(aSQL);
      try
        Open;
        GradPay:=FieldByName('grad_'+IntToStr(GradLevel)).AsCurrency;
      except
        GradPay:=0;
        Exit;
      end;
      Close;
    end;
  end;
  if (PstCode='28') or (PstCode='33') or (PstCode='41') or (PstCode='42') or (PstCode='46') or (PstCode='50') then
  begin
    GradPay:=(WorkDays/26)*GradPay;
  end;
  Result:=GradPay;
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
  {Count:=0;
  for i:=DayBeg to DayEnd do
  begin
    if TryEnCodeDate(StrToInt(LeftStr(YearMonth,4)),StrToInt(RightStr(YearMonth,2)),i,aDay) then
    begin
      if DayOfWeek(aDay)=1 then
        Inc(Count);
    end;
  end;}
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
      SunDays:=GetSunDayCount(1,TheInDay,PayMon);
      WorkDays:=26-(TheInDay-SunDays)+1; //2010-10-04 hyt add 加1天,因規定一進廠就要算薪資  exp:810740
    end
    else begin
      SunDays:=GetSunDayCount(TheInDay,TheLvDay,PayMon);
      WorkDays:=TheLvDay-TheInDay-Sundays;
    end;
  end
  else begin
    if (EmpLvDate=0) or (EmpLvDate>MonEnd) then
    begin
      WorkDays:=26;
    end
    else begin
      SunDays:=GetSunDayCount(1,TheLvDay,PayMon);
      WorkDays:=TheLvDay-SunDays;
    end;
  end;
  WorkDays:=max(WorkDays,0);

  //***<<< 2014-01-07 hyt add 分析算半個月薪資的情況
  {if PayMon='201401' then
  begin    //beizhu
    if WorkDays>13 then    //  26/2=13
      WorkDays:=13;
  end;}
  //***>>>

  Result:=WorkDays;
end;

//2014.12.02 得到本月實際工作天數
function GetWorkDaysEx(PayMon:String;EmpInDate,EmpLvDate:TDateTime):Integer;
var
  WorkDays,
  TheInDay,
  TheLvDay,
  HaveInMonths,
  SunDays,
  TheMaxDay,
  //2014.12.02 該月的最大天數
  iMaxDay : Integer;
  //
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
      SunDays:=GetSunDayCount(1,TheInDay,PayMon);
      WorkDays:=26-(TheInDay-SunDays)+1; //2010-10-04 hyt add 加1天,因規定一進廠就要算薪資  exp:810740
    end
    else begin
      SunDays:=GetSunDayCount(TheInDay,TheLvDay,PayMon);
      WorkDays:=TheLvDay-TheInDay-Sundays;
    end;
  end
  else begin
    if (EmpLvDate=0) or (EmpLvDate>MonEnd) then
    begin
      //
      iMaxDay := DayOf(MonEnd);
      //
      SunDays := GetSunDayCount(1, iMaxDay, PayMon);
      //
      WorkDays := iMaxDay - SunDays;
      //最多26天
      if WorkDays> 26 then
        WorkDays:=26;
    end
    else begin
      SunDays:=GetSunDayCount(1,TheLvDay,PayMon);
      WorkDays:=TheLvDay-SunDays;
    end;
  end;
  WorkDays:=max(WorkDays,0);
  //
  Result:=WorkDays;
end;

{===============================================================================
  計算當月試用期与正式工資天數
===============================================================================}
function GetNormalTestDays(EmpId,PayMon,PstCode_new:String;EmpInDate,EmpLvDate:TDateTime):TNormalTestDays;
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
  PstCode:string; //2013-07-04 hyt upd 轉換 職務
  sTmpMonth:string;
begin
  PstCode:=PstCode_new;
  //***<<<2013-07-04 hyt add
  sTmpMonth:=formatDatetime('yyyymm',EmpInDate);
  sTmpMonth:=str_NextMonth(sTmpMonth);
  sTmpMonth:=str_NextMonth(sTmpMonth);
  sTmpMonth:=str_NextMonth(sTmpMonth);

  if PayMon<=sTmpMonth then
  begin
    sTmpMonth:=formatDatetime('yyyymm',EmpInDate);
    PstCode:=DB_GetSRecord('select pst_code from hrd_sal_paymt where pay_mon='''+sTmpMonth+''' and emp_id='''+EmpId+'''');
  end;
  //***>>>

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
      TestDays:=26-(TheInDay-SundayCount)+1; //2010-10-04 hyt add 加1天,因規定一進廠就要算薪資  exp:810740
      NormalDays:=0;
    end
    else begin//當月即離職
      TheLvDay:=DayOf(EmpLvDate)-1;
      SundayCount:=GetSundayCount(TheInDay+1,TheLvDay,PayMon);
      TestDays:=TheLvDay-TheInDay-SundayCount;
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
        TestDays:=TestDays-SunDayCount;
        NormalDays:=26-TestDays;
      end
      else begin          //離職日期不空，本月离職
        TheLvDay:=DayOf(EmpLvDate)-1;
        if TheLvDay > TheInDay then     //滿一個月了,薪資分試用期部分与正常部分
        begin
          TestDays:=TheInDay;
          SunDayCount:=GetSundayCount(1,TheInDay,PayMon);
          TestDays:=TestDays-SunDayCount;
          NormalDays:=TheLvDay-TheInDay;
          SunDayCount:=GetSundayCount(TheInDay+1,TheLvDay,PayMon);
          NormalDays:=NormalDays-SunDayCount;
        end
        else begin                     //未滿一個月，薪資試用期
          TestDays:=TheLvDay;
          SunDayCount:=GetSundayCount(1,TestDays,PayMon);
          TestDays:=TestDays-SunDayCount;
          NormalDays:=0;
        end;
      end;
    end
    else begin             //非作業員
      if (EmpLvDate=0) or (EmpLvDate>MonEDate) then //在職
      begin
        TestDays:=26;
        NormalDays:=0;
      end
      else begin                  //離職
        TheLvDay:=DayOf(EmpLvDate)-1;
        TestDays:=TheLvDay;
        SundayCount:=GetSundayCount(1,TheLvDay,PayMon);
        TestDays:=TestDays-SundayCount;
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
      TestDays:=TestDays-SundayCount;
      NormalDays:=26-TestDays;
    end
    else begin   //離職
      TheLvDay:=DayOf(EmpLvDate)-1;
      if TheLvDay>TheInDay then //滿試用期，分試用期薪資与滿試用期薪資
      begin
        TestDays:=TheInDay;
        SundayCount:=GetSundayCount(1,TheInDay,PayMon);
        TestDays:=TestDays-SundayCount;
        NormalDays:=TheLvDay-TheInDay;
        SundayCount:=GetSundayCount(TheInDay+1,TheLvDay,PayMon);
        NormalDays:=NormalDays-SundayCount;
      end
      else begin               //未滿試用期，全部為試用期薪資
        TestDays:=TheLvDay;
        SundayCount:=GetSundayCount(1,TheLvDay,PayMon);
        TestDays:=TestDays-SundayCount;
        NormalDays:=0;
      end;
    end;
  end
  {進廠兩個月以上}
  else begin
    if (EmpLvDate=0) or (EmpLvDate>MonEDate) then   //非離職,即在職
    begin
      TestDays:=0;
      NormalDays:=26;
    end
    else begin
      TheLvDay:=DayOf(EmpLvDate)-1;
      TestDays:=0;
      TheLvDay:=DayOf(EmpLvDate)-1;
      SundayCount:=GetSundayCount(1,TheLvDay,PayMon);
      NormalDays:=TheLvDay-SundayCount;
    end;
  end;
  if NormalDays>26 then NormalDays:=26;
  if NormalDays<0 then NormalDays:=0;
  if TestDays<0 then TestDays:=0;
  if TestDays>26 then TestDays:=26;
  NormalTestDays[0]:=NormalDays;
  NormalTestDays[1]:=TestDays;
  Result:=NormalTestDays;
end;

{===============================================================================
  function IsNewEmp(EmpId,PayMon,PstCode:String;EmpInDate:TDate):Boolean;
  判斷員工是否為新進員工(計算保險返還用)
===============================================================================}
function TFormSal07.IsNewEmp(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDate):Boolean;
var
  HaveInMonths:Integer;
  sSql:string;
begin
  if ( PayMon=FormatDateTime('yyyymm',EmpLvDate) )  then
  begin//(當月離職無保險返還)
    Result:=false;
    exit;
  end;
  //員工已進廠月數
  HaveInMonths:=StrToInt(RightStr(PayMon,2))+(StrToInt(LeftStr(PayMon,4))-YearOf(EmpInDate))*12-MonthOf(EmpInDate);
  if PstCode='60' then   //作業員
  begin
    if (HaveInMonths=0) or ( (HaveInMonths=1) and (DayOf(EmpInDate)>14) ) then
      Result:=true
    else
      Result:=false;
  end
  else begin             //其他
    if (HaveInMonths<2) or ( (HaveInMonths=2) and (DayOf(EmpInDate)>14) ) then
      Result:=true
    else
      Result:=false;
  end;

  //2013-01-30 hyt add
  if Result then
  begin  //假如是新進，再分析看看 是否有特殊設定一進廠就是正式員工的情況
    sSql:='SELECT * FROM hrd_emp_spc_set where emp_id='''+EmpId+''' and if_test=''0'' and set_month<='''+PayMon+'''';
    if DB_SeekRecord(sSql) then
      Result:=false;
  end;
end;
 {===============================================================================
  function IsNewEmp(EmpId,PayMon,PstCode:String;EmpInDate:TDate):Boolean;
  判斷員工是否為新進員工(計算保險返還用)
===============================================================================}
function TFormSal07.IsNewEmp1(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDate):Boolean;
var
  HaveInMonths:Integer;
begin
 // if PayMon=FormatDateTime('yyyymm',EmpLvDate) then
 // begin//(當月離職無保險返還)
 //   Result:=false;
 //   exit;
//  end;
  //員工已進廠月數
  HaveInMonths:=StrToInt(RightStr(PayMon,2))+(StrToInt(LeftStr(PayMon,4))-YearOf(EmpInDate))*12-MonthOf(EmpInDate);
  if PstCode='60' then   //作業員
  begin
    if (HaveInMonths=0) or ( (HaveInMonths=1) and (DayOf(EmpInDate)>10) ) then
      Result:=true
    else
      Result:=false;
  end
  else begin             //其他
    if (HaveInMonths<2) or ( (HaveInMonths=2) and (DayOf(EmpInDate)>10) ) then
      Result:=true
    else
      Result:=false;
  end;
end;

{===============================================================================
  GetDut
  返回值: TSalGrad 0-基本工資 1-主管加給 2-專業加給  3-職務津貼(工種補貼)
                   4-環境津貼 5-職等金額 6-其他加給
===============================================================================}
function TFormSal07.GetSalTran(EmpId,PayMon,PstCode,EduCode:String;WorkDays:Integer;
  EmpInDate,EmpLvDate:TDatetime):TSalGrad;
var
  WorkSal,              //工種補貼
  sal_base,sal_mgmt,sal_tech,pst_pay,envir_pay,grade_pay,other_pay,sal_spec:Currency;
  aSQL,Pst_Code:String;
  ValidDay,FirstDay,SecondDay,EDay,SDay,DayCount,DayLeft:Integer;
begin
  sal_base:=0;
  sal_mgmt:=0;
  sal_tech:=0;
  pst_pay:=0;
  envir_pay:=0;
  grade_pay:=0;
  other_pay:=0;
  sal_spec:=0;
  aSQL:='SELECT * FROM hrd_saltran WHERE emp_id='''+EmpId+
    ''' AND valid_date<='''+FormatDateTime('yyyy/mm/dd',MonEDate)+''' order BY valid_date desc';
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
    if Eof then//如果沒有調薪紀錄
    begin
      //sal_base := GetBase(EmpId,PayMon,PstCode,EmpInDate,EmpLvDate,EduCode);
      DayLeft:=0;
      if pstCode='60' then
        pst_pay:=pst_pay+int(GetWrkPay(EmpId,PayMon)*WorkDays/26);
      if pstCode='50' then//職員默認職等額20000
        grade_pay:=grade_pay+20000*WorkDays/26;
    end;
    while not eof do
    begin
      if DateOf(FieldByName('valid_date').AsDateTime)>DateOf(MonEDate) then
        Next;//跳過當月之後調職的紀錄
      Pst_Code:=FieldByName('pst_code').AsString;
      SDay:=DayOf(FieldByName('valid_date').AsDateTime);
      if DateOf(FieldByName('valid_date').AsDateTime)<DateOf(MonSDate) then
        SDay:=1;//上月調職的紀錄設置起始日期為1
      if GetSunDayCount(SDay,EDay,PayMon) = 5 then
         Eday := 31;
      DayCount:=EDay-SDay+1-GetSunDayCount(SDay,EDay,PayMon);
      DayCount:=min(DayCount,DayLeft);
      if Pst_Code='60' then
      begin
        pst_pay:=pst_pay+int(GetWrkPay(EmpId,PayMon)*DayCount/26);
        sal_spec:=sal_spec+int(FieldByName('sal_spec').AsFloat*DayCount/26);
      end
      else
      begin
        sal_mgmt:=sal_mgmt+int(FieldByName('sal_mgmt').AsFloat*DayCount/26);
        sal_tech:=sal_tech+int(FieldByName('sal_tech').AsFloat*DayCount/26);
        pst_pay:=pst_pay+int(FieldByName('pst_pay').AsFloat*DayCount/26);
        envir_pay:=envir_pay+int(FieldByName('envir_pay').AsFloat*DayCount/26);
        grade_pay:=grade_pay+int(FieldByName('grade_pay').AsFloat*DayCount/26);
        other_pay:=other_pay+int(FieldByName('other_pay').AsFloat*DayCount/26);
        //2014.09.19  sal_spec:=other_pay+int(FieldByName('sal_spec').AsFloat*DayCount/26);
        sal_spec:=sal_spec+int(FieldByName('sal_spec').AsFloat*DayCount/26);
      end;
      DayLeft:=DayLeft-DayCount;
      EDay:=SDay;
      if EDay=1 then//無本月調職記錄,退出
        break;
      Next;
    end;
  end;
  if DayLeft>0 then
  begin//起始調薪在月中
    if Pst_Code='60' then
      pst_pay:=pst_pay+int(GetWrkPay(EmpId,PayMon)*DayLeft/26);
    if Pst_Code='50' then
      grade_pay:=grade_pay+20000*DayLeft/26;
  end;
  //***<<<2013-01-31 hyt add
  if PayMon='201301' then
  begin
    if (EmpId>='200309') and (EmpId<='200311') then
      pst_pay:=220000
    else if (EmpId>='200319') and (EmpId<='200326') then
      pst_pay:=220000   ;
    {else if (EmpId>='200323') and (EmpId<='200324') then
      pst_pay:=220000
    else if (EmpId='200326')  then
      pst_pay:=220000 ;}
  end;
  //***>>>

  result[0]:=sal_base;
  result[1]:=sal_mgmt;
  result[2]:=sal_tech;
  result[3]:=pst_pay;
  result[4]:=0;//envir_pay;(環境津貼忽略)
  result[5]:=grade_pay;
  result[6]:=sal_spec;//特別獎金//other_pay;(其他津貼忽略)
//  result[7]:=pst_code;
end;

function TFormSal07.GetWrkPay(EmpId,PayMon:String):Currency;
//作業員取工種補貼
var
  ASQL:string;
begin
  aSQL:='SELECT * FROM hrd_wrkpay A,hrd_wrkpart B,hrd_wrkpay_grad C'
      +' WHERE A.part_code=B.part_code and B.part_grad=C.grad_code'
      +' and emp_id='''+EmpId+''' AND wrk_mon='''+PayMon+''''
      +' and valid_date is not null';
  with DMhrdsys.SQLQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    if (not Eof) then
    begin
      result:=FieldByName('grad_money').AsCurrency;
        //Int((WorkDays/26)*WorkSal);
    end
    else
      result:=0;
    Close;
  end;




end;

{===============================================================================
  GetDut
  返回值: TRetCurrs 0-伙食費 1-全勤獎 2-加班費  3-夜班津貼 4-請假扣款 5-病假補貼
                    6-停工扣款
===============================================================================}
function TFormSal07.GetDut(EmpId,PayMon:String;EmpInDate,EmpLvDate:TDateTime;
  SalBasePay,ABasePay,DutyPay,GongSpcPay:Currency;AWorkDays:integer):TDutCurrs;
var
  MonthMaxDay,StartDay,EndDay,TheInDay,TheLvDay,Value1,i:Integer;
  ASpcOver:TspcOver;
  ClasHours,            //班別時數
  NightDays,            //夜班天數
  WorkDays,             //上班天數
  Hours_1,              //常態工時
  Hours_2,              //夜班工時
  Hours_3,              //平常加班
  Hours_4,              //周末加班
  Hours_5,              //節假日加班
  Hours_6,              //一般病假
  Hours_7,              //有薪假
  Hours_8,              //有薪公傷假
  Hours_9,              //刷卡異常
  Hours_10,             //正常停工
  Hours_11,             //停工全扣
  Hours_12,             //停工扣半
  Hours_17,             //夜連班1.95
  Hours_14,             //夜連班1.95
  Hours_13_kou,         //2013-07-04 hyt add
  Hours_27,             //無薪假（不扣年終獎） //2016.03.17 
  Hours_CQJ,            //2016.03.17 產前假不給薪資，但不扣全勤
  Hours_13:Extended;    //曠工,請事假, 補貼病假, 無薪公傷假, 生育假
  Hours_22,             //休養與恢復健康假(不享有休假期間之薪水，但享有全勤獎及生活津貼)  2015.03.09 LX
  MonthFirstDate,aDate:TDateTime;
  ClasCode, Asql:String;
  Value2, MealDay, MealDays:Extended;
  StaffNatuPrice,       //平常加班單價
  StaffPeriPrice,       //周末加班單價
  StaffHoliPrice,       //節假加班單價
  StaffNighPrice,       //夜班津貼單價
  StaffSickPrice,       //病假補貼單價
  AskLeavPrice:Currency;//請假扣款單價
  RetArr:TDutCurrs;     //返回值
  psalkou:double;
  //2014.12.02 計算扣款時的實際工作天數
  iWorkDays: Integer;
  fDays : Double;
  lastMonthPrice:Currency;
begin
  //
  fDays := 0;

  //
  if AWorkDays = 0 then
  begin
    //
    fDays:= GetButieDays(EmpId, PayMon);
    //工作天數為0，僅計算未休年假補發
    lastMonthPrice := getLastWeixiuPrice(EmpId,PayMon,EmpInDate,EmpLvDate);
    //未休補發
    if fDays>= 0 then
      RetArr[20]:= fDays*8*lastMonthPrice
    //多休扣款
    else if PayMon>= '201401' then
    begin
      //2014.02.08 取消多休扣款
      RetArr[21]:= Abs(fDays)*8*lastMonthPrice;

      //2017.03.03及之前離職的，已在2月扣除，所以3月份算離職薪資的時候不再扣減
      if (PayMon= '201703') and (FormatDateTime('DD', EmpLvDate)<= '03') then
        RetArr[21]:= 0;
    end;  
    Result := RetArr;
    Exit;
  end;


  //計算薪資月第一天
  MonthFirstDate:=EnCodeDate(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)),1);
  //計算薪資月天數
  MonthMaxDay:=DaysInAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  //員工進廠日
  TheInDay:=DayOf(EmpInDate);
  //員工離職日
  if EmpLvDate<>0 then
    TheLvDay:=DayOf(EmpLvDate);
  //考勤統計開始日期
  if MonthFirstDate>=EmpInDate then
    StartDay:=1
  else
    StartDay:=DayOf(EmpInDate);
  //考勤統計結束日期
  if (EmpLvDate<>0) and (EmpLvDate<=MonEDate) then//當月離職
    EndDay:=DayOf(EmpLvDate)-1
  else
    EndDay:=MonthMaxDay;
  NightDays:=0;
  Hours_1:=0;
  Hours_2:=0;
  Hours_3:=0;
  Hours_4:=0;
  Hours_5:=0;
  Hours_6:=0;
  Hours_7:=0;
  Hours_8:=0;
  Hours_9:=0;
  Hours_10:=0;
  Hours_11:=0;
  Hours_12:=0;
  Hours_13:=0;
  //2015.03.09 休養與恢復健康假
  Hours_22:= 0;
  //
  Hours_27 := 0;
  Hours_CQJ:= 0;
  //
  Hours_13_kou:=0;
  RetArr[0]:=0;                  //伙食費
  RetArr[1]:=0;                  //全勤獎
  RetArr[2]:=0;                  //加班費
  RetArr[3]:=0;                  //夜班津貼
  RetArr[4]:=0;                  //請假扣款
  RetArr[5]:=0;                  //病假補貼
  RetArr[6]:=0;                  //停工扣款
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_dut_mon WHERE emp_id='''+EmpId+''' AND dut_mon='''+PayMon+'''');
    Open;
    while not Eof do
    begin
      Value1:=0;          //每天工時 （如0800）
      Value2:=0;          //每天小時數（如8）
      ClasCode:=FieldByName('clas_code').AsString;  //班別
      ClasHours:=0;       //該類別工作時數
      WorkDays:=0;        //該班別工作天數
      for i:=StartDay to EndDay do
      begin
        //取得該天日期
        aDate:=EnCodeDate(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)),1);
        try
          if FieldByName('day'+Format('%.2d',[i])).AsString<>'' then
            Value1:=StrToInt(FieldByName('day'+Format('%.2d',[i])).AsString)
          else
            Value1:=0;
        except
          Value1:=0;
        end;
        if Value1<0 then
        begin
          re_Message.Lines.Append('工號:'+EmpId+' 班別:'+FieldByName('clas_code').AsString+'出現負數!');
          exit;
        end;
        Value2:=Value1;
        //如果大於等於30，應該不是遲到或早退，將它折算成小時數
        if ClasCode>='06' then
        begin
          if Value1>=30 then
            Value2:=(Value1 div 100)+(Value1 mod 100)/60
          else
            Value2:=0;
        end;
        //06-曠工 08-公假 09-住院假 10-一般病假 12-事假 13-婚假 14-喪家 15-有薪公傷假 16-年假 周末不計入
        if ((ClasCode='06') or (ClasCode='08') or (ClasCode='09') or (ClasCode='10') or (ClasCode='12') or
           (ClasCode='13') or (ClasCode='14') or (ClasCode='15') or (ClasCode='16') or (ClasCode='23')) and
           (DayOf(aDate)<>1) then //這邊有問題，要改，假期不一定就為星期天，法定假日也要算上 2010-10-27 hyt add 23-遲到/早退
          ClasHours:=ClasHours
        else if (Value2=9) and (ClasCode='63') then
        begin
          NightDays:=NightDays+1;
          ClasHours:=ClasHours+8;
        end
        else if (Value2=5) and (ClasCode='63') then
        begin
          NightDays:=NightDays+1;
          ClasHours:=ClasHours+4;
        end
        else  if (( clasCode='70' )  or ( clascode='67' )   or ( clascode='76' ))  and ( value2 > 0 ) then //2014-03-25 hyt add 76
        begin                    //2010.05.07 添加
          mealday := mealday + 1 ;
          ClasHours:=ClasHours+Value2;
        end                                                                       //晚班跨時段，要補貼餐費
        else  if (( clasCode='73' ) or ( clascode='74' ) or ( clascode='75' ) or ( clascode='6C' ))  and ( value2 > 0 ) then
        begin                    //2010.08.09 添加
          mealdays := mealdays + 1 ;
          ClasHours:=ClasHours+Value2;
        end
        else begin
          ClasHours:=ClasHours+Value2;
          if Value2>0 then
            WorkDays:=WorkDays+1;
        end;
      end;//for
                                               //6D 跨晚班和早班時段，不給夜班補貼 2015.09.10
      if (ClasCode='61') or (ClasCode='62') or (ClasCode='6D') then   //常態工時
      begin
        Hours_1:=Hours_1+ClasHours;
        RetArr[0]:=RetArr[0]+WORK_DAY_MEAL_PAY*WorkDays; //伙食費
      end
      else if  (ClasCode='63') or (ClasCode='73') or (ClasCode='6C')  then  //2010.08.09                  //夜班工時
      begin
        Hours_1:=Hours_1+ClasHours;
        Hours_2:=Hours_2+ClasHours;
      end
     //  else if   ( ClasCode='74' )  then  //2010.08.09                  //夜班工時
    //  begin     //( ClasCode='74' ) or
    //    Hours_2:=Hours_2+ClasHours;
    //  end
      else if  ( ClasCode='75' ) then
      begin
        Hours_2:=Hours_2+ClasHours;
        Hours_5:=Hours_5+ClasHours

      end
      else if (ClasCode='65') or (ClasCode='66') or (ClasCode='67') or(ClasCode='68') or(ClasCode='80') or (ClasCode='90') then
        Hours_3:=Hours_3+ClasHours            //平常加班
      else if (ClasCode='69') or (ClasCode='82') or (ClasCode='92') or (ClasCode='74') or (ClasCode='76')   then //2010-10-27 hyt add 74 2014-03-25 hyt add 76
         begin
            if   ( ClasCode='74' )  then  //2010.08.09                  //夜班工時
                 Hours_2:=Hours_2+ClasHours;
            Hours_4:=Hours_4+ClasHours            //周末加班
         end
      else if (ClasCode='72') or (ClasCode='85') or (ClasCode='95') or (ClasCode= '7C') then
      begin

        Hours_5:=Hours_5+ClasHours;            //節假日加班
        //2015.12.29
        if ClasCode= '7C' then
        begin
          Hours_2 := Hours_2 + ClasHours;
          NightDays := NightDays + 1;
        end;
      end
      else if  (ClasCode='09') or (ClasCode='10') then
        Hours_6:=Hours_6+ClasHours            //一般病假
      else if (ClasCode='07') or (ClasCode='08') or (ClasCode='13') or (ClasCode='14') or (ClasCode='16') or (ClasCode='17') then //2014.12.29 17:安排年休
        Hours_7:=Hours_7+ClasHours            //有薪假
      //11-產前假  
      else if ClasCode='11' then
      begin
        if PayMon <= '201602' then
          Hours_1:=Hours_1+ClasHours            //產假
        else
          Hours_CQJ := Hours_CQJ + ClasHours;
      end
      else if ClasCode='15' then
        Hours_8:=Hours_8+ClasHours            //有薪公傷假
      else if ClasCode='02' then
        Hours_9:=Hours_9+ClasHours*5          //刷卡異常
      else if (ClasCode='04') or (ClasCode='05') then
        Hours_9:=Hours_9+ClasHours            //遲到早退
      else if ClasCode='64' then              //正常停工
      begin
        Hours_10:=Hours_10+ClasHours;
        Hours_1:=Hours_1+ClasHours;
      end
      else if ClasCode='54' then              //停工全扣
        Hours_11:=Hours_11+ClasHours
      else if ClasCode='44' then              //停工扣半
      begin
        Hours_12:=Hours_12+ClasHours;
        Hours_1:=Hours_1+(ClasHours/2);
      end
      else if (ClasCode='70') or (ClasCode='71')  then
        Hours_17:=Hours_17+ClasHours
      //休養與恢復健康假(不享有休假期間之薪水，但享有全勤獎及生活津貼)  2015.03.09 LX
      else if ClasCode= '22' then
        Hours_22:= Hours_22 + ClasHours
      else if (ClasCode='06')or(ClasCode='12')or(ClasCode='20')or(ClasCode='21')or(ClasCode='25') or (ClasCode='23') or
         //2015.05.07 婦女病假，等同於20-補貼病假
         (ClasCode='24') or
         //陪產假
         (ClasCode= '27')   then
      begin
        Hours_13:=Hours_13+ClasHours;        //曠工,請事假, 補貼病假, 無薪公傷假, 生育假 2010-10-27 hyt add 23-遲到/早退
        {2016.03.17 無薪假，需扣全勤獎
        if ClasCode='25' then
          Hours_13_kou :=Hours_13_kou +ClasHours;
        }
        //陪產假，不扣全勤獎 2016.03.17
        if ClasCode= '27' then
          Hours_13_kou := Hours_13_kou + ClasHours;
      end;
      Next;
    end;//while
  end;//with
  // 新進,離職員工無全勤獎
  if (EmpInDate>MonthFirstDate) or ((EmpLvDate<>0) and (EmpLvDate<=MonEDate)) then
    RetArr[1]:=0
  else
    begin
     if paymon <='200809'  then
        RetArr[1]:=100000
     else
       begin
         if paymon >='200901' then
            RetArr[1]:=200000
         else
            RetArr[1]:=160000 ;
       end;
    end;

  if Hours_9<11 then
  begin
    RetArr[1]:=RetArr[1]-Hours_9*25000; //20000; //*12500;
    RetArr[1]:=RetArr[1]-(Hours_13-Hours_13_kou)*25000; //20000 ; //*12500;        2013-07-04 hyt upd
    RetArr[1]:=RetArr[1]-Hours_6*25000 ;// 20000; //12500;
    if RetArr[1]<0 then RetArr[1]:=0;
  end
  else
    RetArr[1]:=0;
  //休養與恢復健康假(不享有休假期間之薪水，但享有全勤獎及生活津貼)  2015.03.09 Sanjin
  Hours_13 := Hours_13 + Hours_22;

  //無薪假（不扣全勤獎） 2016.03.17 lx
  Hours_13 := Hours_13 + Hours_27;
  //2016.03.17 產前假沒有薪資，但不扣全勤獎
  Hours_13 := Hours_13 + Hours_CQJ;
  //2015.09.04 1號離職，但有離職補貼
  if AWorkDays<> 0 then
  begin
    StaffNatuPrice:=(SalBasePay/AWorkDays/8)*1.5; //平常加班單價
    StaffPeriPrice:=(SalBasePay/AWorkDays/8)*2.0; //周末加班單價
    StaffHoliPrice:=(SalBasePay/AWorkDays/8)*2.0; //節假加班單價
    StaffNighPrice:=(SalBasePay/AWorkDays/8)*0.3; //夜班津貼單價
    StaffSickPrice:=(ABasePay/AWorkDays/8)*0.5;   //病假補貼單價
  end
  else begin
    StaffNatuPrice:= 0; //平常加班單價
    StaffPeriPrice:= 0; //周末加班單價
    StaffHoliPrice:= 0; //節假加班單價
    StaffNighPrice:= 0; //夜班津貼單價
    StaffSickPrice:= 0;   //病假補貼單價
  end;
  //2014.12.02
  //AskLeavPrice  :=SalBasePay/AWorkDays/8;       //請假扣款單價

  //2014.12.02 請假扣款單價，當工作日小於26天時，以實際工作天數計數請假扣款單價
  //
  iWorkDays := AWorkDays;
  //2014.12.03 整月都是扣薪水的假
  if IsAskMonthlong(PayMon, EmpId) then
    iWorkDays := GetWorkDaysEx(PayMon, EmpInDate, EmpLvDate);    //本月工作天數
  //
  if iWorkDays<> 0 then
    AskLeavPrice  :=SalBasePay/iWorkDays/8;       //請假扣款單價

 // stdoverPrice := SalBasePay/AWorkDays/8 ;
  ASpcOver:=GetSpcOver(EmpId,PayMon);//纍計特殊加班
  hours_3:=hours_3+ASpcOver[0];
  hours_4:=hours_4+ASpcOver[1];
  hours_5:=hours_5+ASpcOver[2];

  Hours_6:=min(Hours_6,208);
  //Hours_13:=min(Hours_13,208);
   // 2007.10.30 �r<<
//  Asql:='select emp_id from hrd_sal_kou where emp_id='''+empId+''' and sal_mon=''200710''';
//  with DMHrdsys.SQLQuery3 do
//  begin
//    close;
//    sql.Clear;
//    sql.Add(Asql);
//    Open;
  // if paymon ='200801' then
  //    Hours_13 :=Hours_13 + 80 ;
//  end;
  // 2007.10.30 >>
  Hours_13:=min(Hours_13,208);
  if (( paymon ='201102' ) and ( Hours_13=192 )) then
      Hours_13:=208
  else
      Hours_13:=min(Hours_13,208)  ;

  if Hours_13 > 208  then  Hours_13 := 208 ;

  //***<<<2013-03-04 hyt add
  if (paymon ='201302') or (paymon ='201402') then
  begin
    if Hours_13 = 192 then  Hours_13 :=208 ;
    if Hours_14 = 192 then  Hours_14 :=208 ;
  end;
  //***>>>
  
  //***<<<分析部分假的情況2014-03-03 hyt add
  if paymon ='201402' then
  begin
    if (Hours_13+Hours_14)=192 then
    begin
      if Hours_13>Hours_14 then
        Hours_13:=208-Hours_14
      else
        Hours_14:=208-Hours_13;
    end;
  end;
  //***>>>

  //***<<<2013-07-02 hyt add
  if (paymon ='201306') or (paymon ='201309') or (paymon ='201406') then
  begin
    if Hours_13 = 200 then  Hours_13 :=208 ;
    if Hours_14 = 200 then  Hours_14 :=208 ;
  end;
  //***>>>

  //計算加班費
  if AWorkDays<> 0 then
    RetArr[2]:=Hours_3*StaffNatuPrice+Hours_4*StaffPeriPrice+StaffHoliPrice*Hours_5+Hours_17*(SalBasePay/AWorkDays/8)*GetOver195(PayMon); //1.95

  RetArr[9]:=Hours_3 ;
  RetArr[10]:=Hours_4 ;
  RetArr[11]:=Hours_5 ;

  RetArr[8]:=Hours_3* AskLeavPrice+Hours_4* AskLeavPrice+ Hours_5* AskLeavPrice;
  //計算夜班津貼
  RetArr[3]:=(NightDays+Hours_2)*StaffNighPrice+NightDays*SalBasePay/208;
  //計算請假扣款（包括特別獎金与功績獎金+一般病假扣款）
  //RetArr[4]:=( Hours_13*(AskLeavPrice+GongSpcPay/208)+Hours_6*AskLeavPrice ) ;
  //2014.12.03
  //RetArr[4]:=( FenxiHour(Hours_13,PayMon)*(AskLeavPrice+GongSpcPay/208)+FenxiHour(Hours_6,PayMon)*AskLeavPrice ) ; //2012-03-02 hyt upd
  //2014.12.03
  if iWorkDays<> 0 then
    //RetArr[4]:=( FenxiHour(Hours_13,PayMon)*(AskLeavPrice+GongSpcPay/AWorkDays/8)+FenxiHour(Hours_6,PayMon)*AskLeavPrice ) ; //2012-03-02 hyt upd
    RetArr[4]:=( FenxiHour(Hours_13,PayMon)*AskLeavPrice+FenxiHour(Hours_6,PayMon)*AskLeavPrice );

  //年底或離職當月計算未休年假補貼 2013.09.26 LX ADD**************************>>
  if (RightStr(PayMon, 2)= '12') or ((EmpLvDate>= MonSDate) and (EmpLvDate<= MonEDate)) then
  begin
    //
    fDays:= GetButieDays(EmpId, PayMon);
    //未休補發
    if fDays>= 0 then
    begin
      //2014.10.20 年底仍在職，未休年假補貼4倍薪資
      if (RightStr(PayMon, 2)= '12') and ((EmpLvDate= 0) or (EmpLvDate> MonEDate)) then
        RetArr[20]:= fDays*8*AskLeavPrice*4
      else
        RetArr[20]:= fDays*8*AskLeavPrice;
    end
    //多休扣款
    else if PayMon>= '201602' then
    begin
      // RetArr[21]:= Abs(fDays)*8*(AskLeavPrice+wholeSpecsal/208);
      //2016.02.24  小時薪資已包含特別獎金
      RetArr[21]:= Abs(fDays)*8*AskLeavPrice;

      //2017.03.03及之前離職的，已在2月扣除，所以3月份算離職薪資的時候不再扣減
      if (PayMon= '201703') and (FormatDateTime('DD', EmpLvDate)<= '03') then
        RetArr[21]:= 0;
    end;  
  end;  

  //病假補貼
  RetArr[5]:=0 ;  //Hours_6*StaffSickPrice;
  //停工扣款
  RetArr[6]:=(Hours_11+Hours_12/2)/208*DutyPay;
   //2010.07.08 <<
  //RetArr[12]:=mealday*8000 + mealdays*9000;  //2010.07.08 餐費補貼
  RetArr[12]:=mealday*9000 + mealdays*10000;  //2013.01.18 餐費補貼 hyt add
  RetArr[13]:=Hours_17+ASpcOver[3] ;
  if AWorkDays<> 0 then
    RetArr[14]:=SalBasePay/AWorkDays/8 ;
   // 2010.07.08 >>

   //2013-01-31 hyt add
   //夜班時數
  RetArr[17]:=(NightDays+Hours_2);

  Result:=RetArr;
end;

function TFormSal07.FenxiHour(fHours:Extended;PayMon:String):Extended;
{----------2012-03-02 hyt add 分析特殊月份中 休滿月假的情況----------}
begin    //4,19,20,21,27
  Result:= fHours;
  if fHours > 208  then
    Result := 208
  else if fHours=200 then
  begin
    if (paymon ='200911') or (paymon ='201202')  or (paymon ='201204')  or (paymon ='201209') then
      Result := 208
  end ;
end;

procedure TFormSal07.tbb_okClick(Sender: TObject);
begin
  sel_month.Enabled := false;
  trb_id.Enabled := true;
  trb_dept.Enabled := true;
  tbb_search.Enabled := true;
  tbb_ok.Enabled := false;
end;

procedure TFormSal07.pc_prvChange(Sender: TObject);
begin
  //ComEnable;
end;

procedure TFormSal07.tbb_searchClick(Sender: TObject);
//var
//  sqlstr,condstr:string;
begin
  {sqlstr := 'select * from hrd_sal_paymt where 1>0 ';
  condstr := '';
  if trb_id.Checked then
  begin
    if trim(tid_s.Text)<>'' then
      sqlstr := sqlstr + ' and emp_id>='''+trim(tid_s.Text)+''' ';
    if trim(tid_e.Text)<>'' then
      sqlstr := sqlstr + ' and emp_id<='''+trim(tid_e.Text)+''' ';
  end;
  if trb_dept.Checked then
  begin
    if trim(dept_b.Text)<>'' then
      condstr := condstr + ' dept_code>='''+leftstr(trim(dept_b.Text),6)+''' ';
    if (trim(dept_o.Text)<>'') and (condstr<>'') then
      condstr := condstr + ' and dept_code<='''+leftstr(trim(dept_o.Text),6)+''' '
    else if (trim(dept_o.Text)<>'') and (condstr='') then
      condstr := condstr + ' and dept_code<='''+leftstr(trim(dept_o.Text),6)+''' ';
    if condstr<>'' then
      condstr := 'select emp_id from hrd_emp where '+condstr;
  end;
  if condstr<>'' then
    sqlstr := sqlstr + ' and emp_id in ('+condstr+')';
  with adoquery1 do
  begin
    sql.Clear;
    sql.Add(sqlstr);
    open;
  end;}
end;

procedure TFormSal07.tbb_resetClick(Sender: TObject);
begin
  adoquery1.Close;
  tbb_ok.Enabled := true;
end;

procedure TFormSal07.sb_EmpBeg2Click(Sender: TObject);
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

procedure TFormSal07.N1Click(Sender: TObject);
begin
  re_Message.Clear;
end;

//取得所有基本薪資,職位對應金額
{procedure Tformsal07.GetAllBaseLvl;
begin
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_sal_lvl_base order by pst_code desc');
    open;
    SalBaseLvl:=TstringList.Create;
    while not Eof do
    begin
      SalBaseLvl.Add(FieldByName('pst_code').AsString);
      SalBaseLvl.Add(FieldByName('money').AsString);
      Next;
    end;
  end;
end;}

{----------------------計算特殊加班時間-----------------------------
SpcOver[0]-平常加班；SpcOver[1]-周末加班；SpcOver[2]-節假加班
--------------------------------------------------------------------}
function  TFormSal07.GetSpcOver(EmpId,PayMon:String):TSpcOver;
var
  sql_str,ClasCode:string;
  time0,time1,time2,time3:double;
begin
  time0:=0;
  time1:=0;
  time2:=0;
  time3:=0;
  sql_str:='select * from hrd_dut_spe_overwork where emp_id='''+empId+''''
    +' and year(over_date)='+LeftStr(PayMon,4)+' and month(over_date)='+RightStr(PayMon,2);
  with qry_temp do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    while not Eof do
    begin
      ClasCode:=FieldByName('class_code').AsString;
      if (ClasCode='65') or (ClasCode='66') or (ClasCode='67') or(ClasCode='68') or(ClasCode='80') or (ClasCode='90') then
        time0:=time0+FieldByName('tot_hour').AsFloat       //平常加班
      else if (ClasCode='69') or (ClasCode='82') or (ClasCode='92')  or (ClasCode='74') or (ClasCode='76')   then //2010-10-27 hyt add 74 2014-03-25 hyt add 76
        time1:=time1+FieldByName('tot_hour').AsFloat       //周末加班
      else if (ClasCode='72') or (ClasCode='85') or (ClasCode='95') then
        time2:=time2+FieldByName('tot_hour').AsFloat       //節假日加班
      else if (ClasCode='70') or (ClasCode='71')  then
        time3:=time3+FieldByName('tot_hour').AsFloat;       //節假日加班
      Next;
    end;
    close;
  end;
  result[0]:=time0;
  result[1]:=time1;
  result[2]:=time2;
  result[3]:=time3;
end;

//計算個人所得稅
{function  Tformsal07.GetSalTax(SalTot:Double):Double;
var
  BaseSal,LeftSal,tax:double;
begin
  tax:=0;
  LeftSal:=SalTot;
  if SalTot<5000000 then
  begin//起征點
    result:=tax;
    exit;
  end;
  //各級稅率纍加
  BaseSal:=max(SalTot-40000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.4;
  BaseSal:=max(LeftSal-25000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.3;
  BaseSal:=max(LeftSal-15000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.2;
  BaseSal:=max(LeftSal-5000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.1;
  result:=tax;
end;     }

//計算個人所得稅
{function  Tformsal07.GetSalTax(SalTot:Double; marryid:String):Double;
var
  BaseSal,LeftSal,rate:double;
  tax, Posfee, Dedu,Nett,YIncome, nontax,Ytax, Ytax1, Ytax2, Mtax, tax0, tax1, tax2,tax3,tax4,tax5,tax6:double;
begin
  BaseSal := 0 ;
  LeftSal := 0 ;
  tax := 0 ;
  Posfee := 0 ;
  Dedu := 0 ;
  Nett := 0 ;
  YIncome:= 0 ;
  nontax := 0 ;
  Ytax := 0;
  Ytax1 := 0;
  Mtax := 0 ;
  tax0 := 0 ;tax1 := 0 ; tax2 := 0 ; tax3 := 0 ; tax4 := 0; tax5 := 0 ; tax6 := 0 ;

  LeftSal:=SalTot;

  if SalTot<4000000 then  //2009.05.26 <<
  begin//起征點
    result:=tax;
    exit;
  end;
  // 2009.05.26 <<
  if marryid ='a' then
     rate := 1600000*1;
  if marryid ='b' then
     rate := 1600000*2;
  if marryid ='c' then
     rate := 1600000*3;
  if marryid ='d' then
     rate := 1600000*4;
  if marryid ='e' then
     rate := 1600000*5;
  salTot := salTot - 4000000 - rate ;
  Ytax :=  salTot ;
  // 2009.05.26 >>
  //各級稅率纍加
  // 2009.05.26 <<
//  BaseSal:=max(SalTot-40000000,0);
 // LeftSal:=LeftSal-BaseSal;
 // tax:=tax+BaseSal*0.4;
 // BaseSal:=max(LeftSal-25000000,0);
 // LeftSal:=LeftSal-BaseSal;
 // tax:=tax+BaseSal*0.3;
 // BaseSal:=max(LeftSal-15000000,0);
  //LeftSal:=LeftSal-BaseSal;
 // tax:=tax+BaseSal*0.2;
 // BaseSal:=max(LeftSal-5000000,0);
 // LeftSal:=LeftSal-BaseSal;
  //tax:=tax+BaseSal*0.1;
  // 2009.05. 26 >>
    // 2009.05.26 <<

 { BaseSal:=max(SalTot-80000000,0);  //1. 8
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.35;
  BaseSal:=max(80000000-52000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.3;
  BaseSal:=max(52000000-32000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.25;
  BaseSal:=max(32000000-18000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.20;
  BaseSal:=max(18000000-10000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.15;
  BaseSal:=max(10000000-5000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.10;
  BaseSal:=max(5000000-4000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.05;    }
  // 2009.05. 26 >>
 { if Ytax > 0 then
     begin
       if ( Ytax > 0 ) and ( Ytax <= 5000000  ) then
          begin
           tax5 :=Ytax*0.05  ;
          end;
       if Ytax >  5000000 then
          begin
           tax5 :=5000000*0.05  ;
          // Ytax :=Ytax - 25000000 ;
          end;
       if ( Ytax > 5000000 ) and ( Ytax <= 10000000  ) then
          begin
             tax4 :=(Ytax - 5000000 )*0.1  ;
          end ;
       if ( Ytax > 10000000  ) then
          begin
           tax4 :=(10000000 - 5000000 )*0.1  ;
          end;

     if ( Ytax > 10000000 ) and ( Ytax <= 18000000  ) then
         begin
           tax3 :=(Ytax - 10000000 )*0.15  ;
         end ;
      if  ( Ytax > 18000000 ) then
          begin
           tax3 :=(18000000 - 10000000 )*0.15  ;
         //  Ytax :=Ytax - 100000000;
          end;

     if ( Ytax > 18000000 ) and ( Ytax <=32000000  ) then
         begin
           tax2 :=(Ytax - 18000000 )*0.2  ;

         end  ;
      if  ( Ytax > 32000000 ) then
          begin
           tax2 :=(32000000 - 18000000 )*0.2  ;
         //  Ytax :=Ytax - 100000000;
          end;
       if ( Ytax > 32000000 ) and ( Ytax <=52000000  ) then
         begin
           tax1 :=(Ytax - 32000000 )*0.25  ;

         end  ;
      if  ( Ytax > 32000000 ) then
          begin
           tax1 :=(52000000 - 32000000 )*0.25  ;
         //  Ytax :=Ytax - 100000000;
          end;
       if ( Ytax > 52000000 ) and ( Ytax <=800000000  ) then
         begin
           tax0 :=(Ytax - 52000000 )*0.3  ;

         end  ;
        if  ( Ytax > 52000000 ) then
          begin
           tax1 :=(800000000 - 52000000 )*0.3  ;
         //  Ytax :=Ytax - 100000000;
          end;
      if  ( Ytax > 800000000 ) then
          begin
           tax6 := (Ytax - 800000000 )*0.35  ;
         //  Ytax :=Ytax - 100000000;
          end;


        // tax1 := 0;  //100000000*0.3  ;

  end;
  Ytax1 := tax1+tax2+tax3+tax4+tax5+tax6;
  result:=Ytax1;
end; }
//計算個人所得稅
function  TFormSal07.GetSalTax(SalTot:Double; marryid,Paymon,EmpId:String):Double;
var
  BaseSal,LeftSal,rate:double;
  tax, Posfee, Dedu,Nett,YIncome, nontax,Ytax, Ytax1, Ytax2, Mtax, tax0, tax1, tax2,tax3,tax4,tax5,tax6:double;
  sTemp:string;
begin
  BaseSal := 0 ;
  LeftSal := 0 ;
  tax := 0 ;
  Posfee := 0 ;
  Dedu := 0 ;
  Nett := 0 ;
  YIncome:= 0 ;
  nontax := 0 ;
  Ytax := 0;
  Ytax1 := 0;
  Mtax := 0 ;
  tax0 := 0 ;tax1 := 0 ; tax2 := 0 ; tax3 := 0 ; tax4 := 0; tax5 := 0 ; tax6 := 0 ;

  LeftSal:=SalTot;

  //2012-01-18 hyt add 加年終獎金 交稅
  if PayMon='201201' then
  begin
    sTemp:=DB_GetSRecord('SELECT ROUND(pack_amt/12, 0) AS y_sal FROM hrd_year_end_bonus WHERE r_year=''2011'' AND emp_id='''+EmpId+'''');
    if sTemp<>'' then
      SalTot :=SalTot+strToFloat(sTemp);
  end;
  //2013-01-18 hyt add 加年終獎金 交稅
  if PayMon='201301' then
  begin
    sTemp:=DB_GetSRecord('SELECT ROUND(pack_amt/12, 0) AS y_sal FROM hrd_year_end_bonus WHERE r_year=''2012'' AND emp_id='''+EmpId+'''');
    if sTemp<>'' then
      SalTot :=SalTot+strToFloat(sTemp);
  end;
  //2014-01-22 hyt add 加年終獎金 交稅
  if PayMon='201401' then
  begin
    sTemp:=DB_GetSRecord('SELECT ROUND(pack_amt/12, 0) AS y_sal FROM hrd_year_end_bonus WHERE r_year=''2013'' AND emp_id='''+EmpId+'''');
    if sTemp<>'' then
      SalTot :=SalTot+strToFloat(sTemp);
  end;

  //2015-02-04 sanjin add 加年終獎金 交稅
  if PayMon='201501' then
  begin
    sTemp:=DB_GetSRecord('SELECT ROUND(pack_amt/12, 0) AS y_sal FROM hrd_year_end_bonus WHERE r_year=''2014'' AND emp_id='''+EmpId+'''');
    if sTemp<>'' then
      SalTot :=SalTot+strToFloat(sTemp);
  end;

  //2015-02-04 sanjin add 加年終獎金 交稅
  if PayMon='201601' then
  begin
    sTemp:=DB_GetSRecord('SELECT ROUND(pack_amt/12, 0) AS y_sal FROM hrd_year_end_bonus WHERE r_year=''2015'' AND emp_id='''+EmpId+'''');
    if sTemp<>'' then
      SalTot :=SalTot+strToFloat(sTemp);
  end;


  if SalTot<4000000 then  //2009.05.26 <<
  begin//起征點
    result:=tax;
    exit;
  end;
  //GetRaise_num
  if PayMon>='201307' then   //2013-07-30 hyt add 改善撫養人數的維護畫面而變動
  begin
    rate := 3600000*GetRaise_num(EmpId);
  end
  else if PayMon>='201301' then   //2013-01-18 hyt add 改善撫養人數的維護畫面而變動
  begin
    rate := 1600000*GetRaise_num(EmpId);
  end
  else
  begin
    // 2009.05.26 <<   2010-10-14 hyt upd toLow==>toUpper
    if marryid ='A' then
       rate := 1600000*1;
    if marryid ='B' then
       rate := 1600000*2;
    if marryid ='C' then
       rate := 1600000*3;
    if marryid ='D' then
       rate := 1600000*4;
    if marryid ='E' then
       rate := 1600000*5;
  end;

  if PayMon>='201307' then   //2013-07-30 hyt add
    salTot := salTot - 9000000 - rate
  else
    salTot := salTot - 4000000 - rate ;
    
   // 2011年8月起 , 12月止按照以下公式扣稅 <<
  if ( salTot <= 5000000 ) and ( payMon >='201108' ) and ( Paymon <='201112' )   then
   begin
     result :=tax;
     exit;
    end;
  // 2011年8月起 , 12月止按照以上公式扣稅  >>
  
  //2012-07-31 hyt add  應扣所得稅為一級（ <=5.000.000 D）內免激個人所得稅
  if (SalTot<=5000000) and (PayMon>='201207') and (PayMon<='201212') then
  begin//起征點
    result:=tax;
    exit;
  end;

  Ytax :=  salTot ;



  // 2009.05.26 >>
  //各級稅率纍加
  // 2009.05.26 <<
//  BaseSal:=max(SalTot-40000000,0);
 // LeftSal:=LeftSal-BaseSal;
 // tax:=tax+BaseSal*0.4;
 // BaseSal:=max(LeftSal-25000000,0);
 // LeftSal:=LeftSal-BaseSal;
 // tax:=tax+BaseSal*0.3;
 // BaseSal:=max(LeftSal-15000000,0);
  //LeftSal:=LeftSal-BaseSal;
 // tax:=tax+BaseSal*0.2;
 // BaseSal:=max(LeftSal-5000000,0);
 // LeftSal:=LeftSal-BaseSal;
  //tax:=tax+BaseSal*0.1;
  // 2009.05. 26 >>
    // 2009.05.26 <<

 { BaseSal:=max(SalTot-80000000,0);  //1. 8
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.35;
  BaseSal:=max(80000000-52000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.3;
  BaseSal:=max(52000000-32000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.25;
  BaseSal:=max(32000000-18000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.20;
  BaseSal:=max(18000000-10000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.15;
  BaseSal:=max(10000000-5000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.10;
  BaseSal:=max(5000000-4000000,0);
  LeftSal:=LeftSal-BaseSal;
  tax:=tax+BaseSal*0.05;    }
  // 2009.05. 26 >>
  if Ytax > 0 then
     begin
       if ( Ytax > 0 ) and ( Ytax <= 5000000  ) then
          begin
           tax5 :=Ytax*0.05  ;
          end;
       if Ytax >  5000000 then
          begin
           tax5 :=5000000*0.05  ;
          // Ytax :=Ytax - 25000000 ;
          end;
       if ( Ytax > 5000000 ) and ( Ytax <= 10000000  ) then
          begin
             tax4 :=(Ytax - 5000000 )*0.1  ;
          end ;
       if ( Ytax > 10000000  ) then
          begin
           tax4 :=(10000000 - 5000000 )*0.1  ;
          end;

     if ( Ytax > 10000000 ) and ( Ytax <= 18000000  ) then
         begin
           tax3 :=(Ytax - 10000000 )*0.15  ;
         end ;
      if  ( Ytax > 18000000 ) then
          begin
           tax3 :=(18000000 - 10000000 )*0.15  ;
         //  Ytax :=Ytax - 100000000;
          end;

     if ( Ytax > 18000000 ) and ( Ytax <=32000000  ) then
         begin
           tax2 :=(Ytax - 18000000 )*0.2  ;

         end  ;
      if  ( Ytax > 32000000 ) then
          begin
           tax2 :=(32000000 - 18000000 )*0.2  ;
         //  Ytax :=Ytax - 100000000;
          end;
       if ( Ytax > 32000000 ) and ( Ytax <=52000000  ) then
         begin
           tax1 :=(Ytax - 32000000 )*0.25  ;

         end  ;
      if  ( Ytax > 32000000 ) then
          begin
           tax1 :=(52000000 - 32000000 )*0.25  ;
         //  Ytax :=Ytax - 100000000;
          end;
       if ( Ytax > 52000000 ) and ( Ytax <=800000000  ) then
         begin
           tax0 :=(Ytax - 52000000 )*0.3  ;

         end  ;
        if  ( Ytax > 52000000 ) then
          begin
           tax1 :=(800000000 - 52000000 )*0.3  ;
         //  Ytax :=Ytax - 100000000;
          end;
      if  ( Ytax > 800000000 ) then
          begin
           tax6 := (Ytax - 800000000 )*0.35  ;
         //  Ytax :=Ytax - 100000000;
          end;


        // tax1 := 0;  //100000000*0.3  ;

  end;
  Ytax1 := tax1+tax2+tax3+tax4+tax5+tax6;
  result:=Ytax1;
end;


function TFormSal07.GetPsalPay(EmpId,PayMon:String;BasePay:Currency):Currency;
//計算件資獎金
var
  Asql:string;
  psal, psalsupp:double;
begin
  if PayMon<'200704' then//2007年04月開始
  begin
    result:=0;
    exit;
  end;
  Asql:='select * from hrd_sal_award where emp_id='''+empId+''''
    +' and tr_month='''+PayMon+''' and tr_class=''01''';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(Asql);
    Open;
    if not Eof then
      psal:=FieldByName('tr_amt').AsCurrency
    else
      psal:=0;
  end;
  Asql:='select * from hrd_sal_award_supp where emp_id='''+empId+''''
    +' and tr_month='''+PayMon+''' ';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(Asql);
    Open;
    if not Eof then
      psalsupp:=FieldByName('supp_pay').AsCurrency
    else
      psalsupp:=0;
  end;
 // if psal>BasePay then
   // result:=psal-BasePay

  psal := psal + psalsupp ;
  if psal>BasePay then
    result:=psal-BasePay
  else
    result:=0;
end;

function TFormSal07.GetEffPay(EmpId,DeptCode,PayMon:String;EmpInDate,EmpLvDate:TDate):Currency;
//計算效率獎金

var
  Asql:string;
begin
  if PayMon<'200704' then//2007年04月開始
  begin
    result:=0;
    exit;
  end;
  if formatDateTime('yyyymm',EmpInDate)=PayMon then//當月進廠無
  begin
    result:=0;
    exit;
  end;
  if formatDateTime('yyyymm',EmpLvDate)=PayMon then//當月離職無
  begin
    result:=0;
    exit;
  end;
  Asql:='select * from hrd_sal_eff where dept_code='''+DeptCode+''''
    +' and sal_month='''+PayMon+'''';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(Asql);
    Open;
    if not Eof then
      result:=FieldByName('eff_money').AsCurrency
    else
      result:=0;
  end;
end;
//取得 毒害津貼 2007.11.03 <<
function TFormSal07.getvirus(EmpId, PayMon:String):Currency;
var
   clsql :string ;
  i:integer;
begin
  clsql := 'select emp_id from  hrd_sal_virus  where emp_id=''' + EmpId + ''' and sal_mon=''' + paymon + '''' ;
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add( clsql );
    open;
    //SalBaseLvl:=TstringList.Create;
    if not Eof then
      result:=35000
    else
      result:=0;
  end;
end;
// 取得 毒害津貼 2007.11.03  >>
 {===============================================================================
  Name:GetYiCardPay(EmpId,PayMon:String):Currency;
  ?��??�E?玂�炒L?
===============================================================================}
function TFormSal07.GetJiangli(EmpId,PayMon:String):Currency;
begin
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_sal_jiangli WHERE emp_id='''+EmpId+''' and pay_mon='''+PayMon+'''');
    Open;
    if not Eof then
    begin
      Result:=FieldByName('money').AsCurrency;
    end
    else
      Result:=0;
    Close;
  end;
end;
{===============================================================================
  Name:GetIPSal(EmpId,PayMon:String):Currency;
  得到扣稅的年終獎金
===============================================================================}
function TFormSal07.Getyearsal(EmpId:String):Currency;
var
  pay :real ;
begin
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT pay_tax  FROM year_sal_new WHERE emp_id='''+EmpId+'''');
    Open;
    if not Eof then
    begin
      pay:=FieldByName('pay_tax').AsCurrency;
    end
    else
      pay := 0 ;

    Close;
    Result:= pay;
  end;
end;

{===============================================================================
//福祿-印刷廠-作業員的特別獎金-特別處理 2011-11-26 hyt add te_pay
===============================================================================}
function  TFormSal07.GetSpecSal(EmpId,PayMon:String;EmpInDate,EmpLvDate:TDate):Currency;
var
  sSql,sTemp:string;
  iWorkDays:integer;
begin
  sSql:='SELECT sal_spec, valid_date '+
        'FROM hrd_sal_mon_spec '+
        'where spc_month='''+PayMon+''' and emp_id='''+EmpId+''' ';

  Result:=0;
  with DMHrdsys.qry_pub do
  begin
      SQL.Clear ;
      SQL.Add(sSql);
      try
        Open ;
      except
        exit;
      end;

      if not Eof then
      begin
        //iWorkDays:=GetWorkDays(PayMon,FieldByName('valid_date').AsDateTime ,EmpLvDate) ; //取工作日
        iWorkDays:=GetWorkDays(PayMon,EmpInDate ,EmpLvDate) ; //取工作日  2012-08-04 hyt add
        if FieldByName('sal_spec').AsString<>'' then
          Result :=Int(FieldByName('sal_spec').Value *iWorkDays/26) ;
      end;
  end;

end;
//2012-02-04 hyt add
procedure TFormSal07.EditEmpBeg2Change(Sender: TObject);
begin
  EditEmpEnd2.Text :=EditEmpBeg2.Text ;
end;

{===============================================================================
  Name:GetYiCardPay(EmpId,PayMon:String):Currency;
  得到未交回毉保卡扣款     2012-03-22 hyt add
===============================================================================}
function TFormSal07.GetYiCardPay(EmpId,PayMon:String):Currency;
begin
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_sal_yicard WHERE emp_id='''+EmpId+''' and pay_mon='''+PayMon+'''');
    Open;
    if not Eof then
    begin
      Result:=FieldByName('money').AsCurrency;
    end
    else
      Result:=0;
    Close;
  end;
end;
{===============================================================================
撫養人數  從2012-05 月份開始 ： 有 hrd_emp_raise_data 中分析
===============================================================================}
function TFormSal07.GetRaise_num(EmpId:String):integer;
var
  iRetNum:integer;
  sFieldName:String;
begin
  iRetNum:=0;
  if qry_hrd_emp_raise_data.Locate('emp_id',EmpId,[loCaseInsensitive]) then
  begin
    iRetNum:=qry_hrd_emp_raise_data.FieldByName('raise_num').Value;
  end;
  Result:=iRetNum;
end;
{===============================================================================
結婚禮金  從2013-01 月份開始   2013-01-16 hyt add
===============================================================================}
function TFormSal07.GetMarryAmt(EmpId,PayMon:String):integer;
var
  sSql :string;
begin
  {if qry_hrd_dut_class_13.Locate('emp_id;ask_mon',VarArrayOf([EmpId,PayMon]),[loCaseInsensitive]) then
    Result:=200000
  else
    Result:=0;
  }
  Result:=0;

  if qry_hrd_dut_class_13.Locate('emp_id;ask_mon',VarArrayOf([EmpId,PayMon]),[loCaseInsensitive]) then
  begin
    sSql:='select * from hrd_dut_ask '+
          'where emp_id='''+EmpId+''' and clas_code=''13'' and clas_code_sub=''00'' and dbo.get_YM(s_ask_d)='''+PayMon+''' ';
    if DB_SeekRecord(sSql) then //目前13是包括 本人結婚和孩子結婚==》這裡限定 本人結婚 才有 禮金的 2013-01-28
      Result:=200000;
  end ;
end;

//改變夜班津貼的倍數 2013-05-30
function TFormSal07.GetOver195(PayMon:String):Currency;
begin
  if PayMon>='201305' then
    Result:=2.15
  else
    Result:=1.95;
end;
//接收病假保險資料 2013-06-03 hyt add
procedure TFormSal07.btn_sal_baoClick(Sender: TObject);
var
  sSql,ConnStr:string;
  i:integer;
begin
 PayMon:=me_Month2.Text;
  //該月資料已經鎖定
  if (PayMon<=LockMonth)  then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
    exit;
  end;

  //open connect
  try
      flu_conn.close;
      ConnStr:='Provider=SQLOLEDB.1;Persist Security Info=False;';
      ConnStr:=ConnStr+'User ID=web;Password=web;';
      ConnStr:=ConnStr+'Initial Catalog=flu-erp;Data Source=192.168.7.12;';
      flu_conn.ConnectionString:=ConnStr ;
      flu_conn.Open ;
  except
      showmessage('Connect Fuluh Server is error');
      exit;
  end;

   //deal data
   try
    ADOCommand1.CommandText :='delete from hrd_sal_bao '+
                              ' where sal_mon='''+PayMon+''' ';

    ADOCommand1.Execute ;

    //取cossys資料
    sSql:='select * from hrd_sal_bao '+
          ' where sal_mon='''+PayMon+''' and left(emp_id,1)<>''2'' ';
    with qry_cos_data do
    begin
      sql.Clear ;
      sql.Add(sSql);
      open;
    end;
    //取hrdsys資料
    sSql:='select * from hrd_sal_bao '+
          ' where sal_mon='''+PayMon+''' ';
    with qry_sal_bao do
    begin
      sql.Clear ;
      sql.Add(sSql);
      open;
      //寫導入資料
      qry_cos_data.First ;
      while not qry_cos_data.Eof do
      begin
        append;
        for i:=0 to qry_cos_data.FieldCount -1 do
        begin
          Fields[i].Value:=qry_cos_data.Fields[i].Value;
        end;
        post;
        qry_cos_data.Next
      end;
    end;
    //提交
    qry_sal_bao.UpdateBatch;
    showmessage('deal ok,total RecordCount:'+intToStr(qry_cos_data.RecordCount ) );

    flu_conn.close;
  except
       {showMessage('delete is error!');}
       showmessage('deal error');
  end;
end;
//取育儿津貼    2013-06-24 hyt add
function TFormSal07.GetFoster_pay(EmpId,PayMon:String):Currency;
var
  sTemp,sSql:string;
begin
  sSql:='select count(*) from hrd_sal_foster '+
        'where emp_id='''+EmpId+''' and buzhu_month_bgn<='''+PayMon+''' '+
        'and buzhu_month_end>='''+PayMon+''' ';
  sTemp:=DB_GetSRecord(sSql);
  if sTemp='' then
    sTemp:='0';
  result:=60000*strToInt(sTemp);

  if result>120000 then //最大限額不可以超過2個人 即12萬
    result:=120000;
end;

//生日禮金 2014.09.20
function TFormSal07.GetBirthDay(EmpId, PayMon, PstCode: String; EmpInDate,
  EmpLvDate, EmpBirthDay: TDate): Currency;
var
  sMonth: string;
  //
  dDate : TDateTime;
begin
  //
  Result := 0;
  //生日當月
  if FormatDateTime('MM', EmpBirthDay) <> Copy(PayMon, 5, 2) then Exit;
  //離職當月沒有生日禮金
  if (EmpLvDate<> 0) and (FormatDateTime('YYYYMM', EmpLvDate)<= PayMon) then Exit;
  //每月14號及以前進廠的按當月1號算
  if DayOf(EmpInDate)<= 14 then
    dDate := StartOfTheMonth(EmpInDate)
  //14號以後進廠的按次月1日算  
  else begin
    dDate := IncMonth(EmpInDate, 1);
    //
    dDate := StartOfTheMonth(dDate);
  end;
  //作業員
  if PstCode>= '60' then
    dDate := IncMonth(dDate, 13)
  //其餘滿14個月
  else
    dDate := IncMonth(dDate, 14);
  //試用期後滿一年
  if FormatDateTime('YYYYMM', dDate)> PayMon then Exit;
  //
  Result := BIRTHDAY_ALLOWANCE;
end;

//2014.12.03 判斷是否為整月請扣薪假
function TFormSal07.IsAskMonthlong(const PayMon, EmpID: string): Boolean;
var
  sSQL, sClassCode: string;
begin
  //
  Result := True;
  //
  sSQL := 'SELECT *'
        + '  FROM HRD_DUT_MON'
        + ' WHERE DUT_MON = '+QuotedStr(PayMon)
        + '   AND EMP_ID = '+QuotedStr(EmpID)
        + ' ORDER BY CLAS_CODE';
  //
  with qry_temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    First;
    while not Eof do
    begin
      //
      sClassCode := FieldByName('CLAS_CODE').AsString;
      //
      if //礦工
         (sClassCode <> '06') and
         //事假
         (sClassCode<> '12') and
         //補貼病假
         (sClassCode<> '20') and
         //生育假
         (sClassCode<> '21') and
         //無薪假
         (sClassCode<> '25') and
         //遲到、早退
         (sClassCode<> '23') and
         //週末
         (sClassCode<> '60') then
      begin
        Result := False;
        Break;
      end;
      //
      Next;
    end;
    //
    Close;
  end;
end;

function TFormSal07.GetLeaveSubsidy(AMonth, AEmpID: string; AEpIndt,
  AEpLedt: TDateTime; boChangeFactory: Boolean=False): Currency;
  //辭職前六個月的平均薪資  2009年以後
  function GetAverage(AEmpID, AMonth: string): Currency;
  var
    //
    sMonth, sSQL: string;
    //
    I, iYear, iMonth: Integer;
    //
    cTotal: Currency;
  begin
    //
    cTotal:= 0;
    //
    iYear := StrToInt(Copy(AMonth, 1, 4));
    iMonth:= StrToInt(Copy(AMonth, 5, 2));
    for I:= 1 to 6 do
    begin
      iMonth := iMonth - 1;
      //
      if iMonth = 0 then
      begin
        iMonth := 12;
        iYear  := iYear - 1;
      end;
      //
      sMonth := Format('%.4d', [iYear])+Format('%.2d', [iMonth]);
      //
      if AMonth< '201601' then
        sSQL := 'SELECT BASE_PAY'
              + '  FROM HRD_SAL_PAYMT'
              + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
              + '   AND PAY_MON = '+QuotedStr(sMonth)
      else
        sSQL := 'SELECT SUM(ISNULL(BASE_PAY,0) + ISNULL(MGMT_OFR,0) + ISNULL(TECH_OFR,0) + ISNULL(DUTY_OFR,0) + ISNULL(GRAD_OFR,0) + ISNULL(TE_PAY,0)) AS BASE_PAY'
              + '  FROM HRD_SAL_PAYMT'
              + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
              + '   AND PAY_MON = '+QuotedStr(sMonth);
      with DMHrdsys.SQLQuery4 do
      begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Open;
        //
        cTotal := cTotal + FieldByName('BASE_PAY').AsCurrency;
        //
        Close;
      end;
    end;
    //
    Result := StrToCurr(FormatFloat('0', cTotal/6));
  end;

  //辭職前六個月的平均薪資  2009年以前
  function GetAverageOld(AEmpID, AMonth: string): Currency;
  var
    //
    sMonth, sSQL: string;
    //
    I, iYear, iMonth: Integer;
    //
    cTotal: Currency;
  begin
    //
    cTotal:= 0;
    //
    iYear := StrToInt(Copy(AMonth, 1, 4));
    iMonth:= StrToInt(Copy(AMonth, 5, 2));
    for I:= 1 to 6 do
    begin
      iMonth := iMonth - 1;
      //
      if iMonth = 0 then
      begin
        iMonth := 12;
        iYear  := iYear - 1;
      end;
      //
      sMonth := Format('%.4d', [iYear])+Format('%.2d', [iMonth]);
      //
      sSQL := 'SELECT (ISNULL(BASE_PAY, 0) + ISNULL(MGMT_OFR, 0) + ISNULL(TECH_OFR, 0) +'
            + '       ISNULL(DUTY_OFR, 0) + ISNULL(ENVR_OFR, 0) + ISNULL(GRAD_OFR, 0)) AS SUM_AMT'
            + '  FROM HRD_SAL_PAYMT'
            + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
            + '   AND PAY_MON = '+QuotedStr(sMonth);
      with DMHrdsys.SQLQuery4 do
      begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Open;
        //
        cTotal := cTotal + FieldByName('SUM_AMT').AsCurrency;
        //
        Close;
      end;
    end;
    //
    Result := StrToCurr(FormatFloat('0', cTotal/6));
  end;
var
  iCount, iCountOld: Integer;
  //
  sSQL: string;
  //
  cBasePay: Currency;
  //
  dRate: Double;
  //
  dDate: TDateTime;
begin
  // 2016.06.13 福祿變順杰
  if boChangeFactory then
    dDate := GetEndOfLastMonth(PayMon)
  else
    dDate := 0;  

  iCount := 0;
  iCountOld := 0;
  //
  Result := 0;
  //在職
  if (AEpLedt= 0) and (boChangeFactory=False) then Exit;
  //非本月離職
  if (FormatDateTime('YYYYMM', AEpLedt)<> AMonth) and (boChangeFactory= False) then Exit;
  //工作滿12個月
  if (MonthsBetweenEx(AEpLedt-1, AEpIndt)< 12) and (MonthsBetweenEx(dDate, AEpIndt)< 12) then Exit;
  //最近6個月平均薪資
  cBasePay := GetAverageOld(AEmpID, AMonth);
  //既沒買保險，又沒返還的月數   2009以前
  sSQL := 'SELECT COUNT(EMP_ID) AS MONTH_COUNT'
        + '  FROM HRD_SAL_PAYMT'
        + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
        //2009年以前
        + '   AND PAY_MON <=''200812'''
        //不包含離職當月
        + '   AND PAY_MON <> '+QuotedStr(AMonth);
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    iCount := FieldByName('MONTH_COUNT').AsInteger;
    Close;
  end;
  //計算2008年12月份及之前的進廠月數
  iCountOld := (2008-YearOf(AEpIndt))*12+(12-MonthOf(AEpIndt) + 1);
  //10號以後進廠的，算次月
  if DayOf(AEpIndt)> 10 then
    iCountOld := iCountOld -1;
  //
  if iCountOld< 0 then
    iCountOld := 0;
  //
  dRate := 0;
  if (iCount>= 1) and (iCount<= 5) then
    dRate := 1
  else if (iCount>= 6) and (iCount<= 12) then
    dRate := 2
  else if (iCount>= 13) and (iCount<= 17) then
    dRate := 3
  else if (iCount>= 18) and (iCount<= 24) then
    dRate := 4
  else if (iCount>= 25) and (iCount<= 29) then
    dRate := 5
  else if (iCount>= 30) and (iCount<= 36) then
    dRate := 6
  else if (iCount>= 37) and (iCount<= 41) then
    dRate := 7
  else if (iCount>= 42) and (iCount<= 48) then
    dRate := 8;
  //
  Result := Result + cBasePay/2*0.5*dRate;
  //既沒買保險，又沒返還的月數   2009以後
  sSQL := 'SELECT COUNT(EMP_ID) AS MONTH_COUNT'
        + '  FROM HRD_SAL_PAYMT'
        + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
        + '   AND (PICC_SHIYE = 0 OR PICC_SHIYE IS NULL)'
        + '   AND (PICC_BACK = 0 OR PICC_BACK IS NULL)'
        //
        + '   AND PAY_MON >=''200901'''
        //不包含離職當月
        + '   AND PAY_MON <> '+QuotedStr(AMonth);
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    iCount := FieldByName('MONTH_COUNT').AsInteger;
    Close;
  end;
  //2016.04.23 不在區別新舊制，全部按新的執行
  iCount := iCount + iCountOld;
  //
  if iCount<= 0 then Exit;
  //最近6個月平均薪資
  cBasePay := GetAverage(AEmpID, AMonth);
  {2016.04.23 不在區別新舊制，全部按新的執行
  //6個月以內，0.5倍
  if iCount< 6 then
    Result := Result + cBasePay/2*0.5
  //6個月(含)以上，1倍
  else
    Result := Result + cBasePay/2;
  }
  //2016.04.23 不在區別新舊制，全部按新的執行

  //
  dRate := 0;
  if (iCount>= 1) and (iCount<= 5) then
    dRate := 1
  else if (iCount>= 6) and (iCount<= 12) then
    dRate := 2
  else if (iCount>= 13) and (iCount<= 17) then
    dRate := 3
  else if (iCount>= 18) and (iCount<= 24) then
    dRate := 4
  else if (iCount>= 25) and (iCount<= 29) then
    dRate := 5
  else if (iCount>= 30) and (iCount<= 36) then
    dRate := 6
  else if (iCount>= 37) and (iCount<= 41) then
    dRate := 7
  else if (iCount>= 42) and (iCount<= 48) then
    dRate := 8
   else if (iCount>= 49) and (iCount<= 54) then
    dRate := 9
  else if (iCount>= 55) and (iCount<= 60) then
    dRate := 10;  

  Result := cBasePay/2*0.5*dRate;
  {
  //6個月以內，0.5倍
  if iCount< 6 then
    Result := cBasePay/2*0.5
  //6個月(含)以上，1倍
  else
    Result := cBasePay/2;
  }
end;


//2016.01.29 得到已發薪資
function TFormSal07.GetYiFaJinE(const AMonth, AEmpID: string): Double;
var
  sSQL: string;
begin
  Result := 0;
  if (AMonth <> '201601') and (AMonth <> '201602') then Exit;
  //
  if FormatDateTime('YYYYMMDD', GetServerDateTime)> '20160125' then
  begin
    //
    sSQL := 'SELECT ACTU_PAY'
          + '  FROM HRD_SAL_PAYMT_201601'
          + ' WHERE PAY_MON = ''201601'''
          + '   AND EMP_ID = '+QuotedStr(AEmpID);
    with DMHrdsys.SQLQuery4 do
    begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Open;
      Result := FieldByName('ACTU_PAY').AsFloat;
      Close;
    end;
    //
    if AMonth= '201602' then
    begin
      sSQL := 'SELECT ACTU_PAY'
            + '  FROM HRD_SAL_PAYMT'
            + ' WHERE PAY_MON = ''201601'''
            + '   AND EMP_ID = '+QuotedStr(AEmpID);
      with DMHrdsys.SQLQuery4 do
      begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Open;
        Result := FieldByName('ACTU_PAY').AsFloat - Result;
        Close;
      end;
    end;
  end;
end;

//得到應補貼的年假天數 2013.09.26 LX ADD
function TFormSal07.GetButieDays(AEmpID, PayMonth: string): Double;
var
  sYear: string;
  //
  aryYixiu: TAnnualLeaveDays;
begin
  //
  Result := 0;
  //
  sYear:= Copy(PayMon, 1, 4);
  //應補貼 = 可休 - 已休
  aryYixiu:= GetYXTS(AEmpID, sYear);
  //
  Result:= GetKXTS(AEmpID, sYear) - aryYixiu[0] - aryYixiu[1];
end;

function TFormSal07.GetYXTS_16(AEmpID, AYear: string): Double;
var
  //全部天數
  HasDays, FestDays: Double;
  //
  sSQL: string;
  //
  _16Hours, _16Minutes, _18Hours, _18Minutes, dHours, dMinutes: Double;
  //
  sFieldName: string;
  //
  I: Integer;
begin
  //********************已休年假 2013.09.23 LX ADD******************************
  _16Hours  := 0;
  //
  _16Minutes:= 0;
  //
  sSQL:= 'SELECT *'
       + '  FROM HRD_DUT_MON'
       //三種年假 2014.02.27
       + ' WHERE CLAS_CODE = ''16'''
       + '   AND EMP_ID = '+QuotedStr(AEmpID)
       + '  AND SUBSTRING(DUT_MON, 1, 4) = '+QuotedStr(AYear);
  //
  with DMHrdsys.SQLQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    First;
    while not Eof do
    begin
      //
      for I:= 1 to 31 do
      begin
        //
        sFieldName:= 'day'+Format('%.2d', [I]);
        //
        if Trim(FieldByName(sFieldName).AsString)= '' then
          Continue;
        //
        dHours  := StrToFloat(Copy(FieldByName(sFieldName).AsString, 1, 2));
        //
        dMinutes:= StrToFloat(Copy(FieldByName(sFieldName).AsString, 3, 2));
        //
        if dHours>= 8 then
        begin
          dHours  := 8;
          dMinutes:= 0;
        end;
        //
        _16Hours  := _16Hours + dHours;
        //
        _16Minutes:= _16Minutes + dMinutes;
      end;
      //
      Next;
    end;
    //
    _16Hours  := _16Hours + _16Minutes/60;
    //
    HasDays   := _16Hours/8;
    //
    Close;
  end;
  //
  Result:= HasDays;
end;

//2016.03.19 得到作業員的特別獎金
function TFormSal07.GetSpcPayOf60(const AMonth, AEmpID: string): Double;
var
  sSQL: string;
begin
  Result := 0;
  //
  sSQL := 'SELECT sal_spec'
        + '  FROM HRD_SALTRAN'
        + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
        + '   AND CONVERT(VARCHAR(8),VALID_DATE,112) <= '+QuotedStr(AMonth+'15')
        + ' ORDER BY VALID_DATE DESC';
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    if not IsEmpty then
      Result := FieldByName('sal_spec').AsFloat
    else
      Result := 0;  
    Close;
  end;
end;

function TFormSal07.getLastWeixiuPrice(iEmpId, iPayMon: string; iEmpInDate,
  iEmpLvDate: TDateTime): Currency;
var
  lastMonthEDate:TDateTime;
  pre_mon:string;  //上一個月
  lastMonthWorkDays:Integer;
  cPrice:Currency;
  sSql:string;
begin
  lastMonthEDate := EncodeDate(StrToInt(LeftStr(iPayMon,4)),StrToInt(RightStr(iPayMon,2)),1)-1;
  pre_mon := FormatDateTime('YYYYMM',lastMonthEDate);
  lastMonthWorkDays := GetWorkDaysEx(pre_mon,iEmpInDate,iEmpLvDate);
  with qryLastPaymt do
  begin
    if Active then
      Close;
    sql.Clear;
    sSql := 'select * from hrd_sal_paymt p,hrd_emp e where p.emp_id=e.emp_id and p.emp_id='+QuotedStr(iEmpId)+' and p.pay_mon='+QuotedStr(pre_mon);
    SQL.Add(sSql);
    Open;
    if recordcount=0 then
      cPrice := 0
    else
    begin
      if FieldByName('pst_code').AsString='60' then
        cPrice := (FieldByName('base_pay').AsCurrency+FieldByName('duty_ofr').AsCurrency
                  +FieldByName('te_pay').AsCurrency)/lastMonthWorkDays/8
      else
        cPrice := (FieldByName('base_pay').AsCurrency+FieldByName('duty_ofr').AsCurrency
                  +FieldByName('mgmt_ofr').AsCurrency+FieldByName('tech_ofr').AsCurrency
                  +FieldByName('grad_ofr').AsCurrency
                  +FieldByName('te_pay').AsCurrency)/lastMonthWorkDays/8;
    end;
  end;
  Result := cPrice;
end;

//2016.06.13 轉廠
function TFormSal07.IsChangeFactory(const AMonth, AEmpID: string): Boolean;
var
  sSQL: string;
begin
  sSQL := 'SELECT *'
        + '  FROM HRD_EMP_CHANGE'
        + ' WHERE CHANGE_MONTH = '+QuotedStr(AMonth)
        + '   AND EMP_ID = '+QuotedStr(AEmpID);
  Result := CheckRecordExist(sSQL);      
end;

//2016.06.13 得到上個月的最後一天
function TFormSal07.GetEndOfLastMonth(PayMon: string): TDateTime;
var
  iYear, iMonth, iDay: Integer;
  dDate: TDateTime;
begin
  iYear := StrToInt(Copy(PayMon, 1, 4));
  iMonth:= StrToInt(Copy(PayMon, 5, 2));
  if iMonth= 1 then
  begin
    iYear := iYear - 1;
    iMonth := 12;
  end
  else
    iMonth := iMonth - 1;
  dDate := EncodeDate(iYear, iMonth, 1);
  //
  dDate := EndOfTheMonth(dDate);
end;

end.
