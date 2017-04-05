{*************************************************************************
Name�GSal08
�קﳡ��sql�y�y
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
  WORK_DAY_MEAL_PAY=800;//�C�u�@�ѥ뭹�O
  LANU_PAY=5000;        //���ζO
  PERCENT_PICC_SHE=0.08;  //���O 5%  // 2010�~1��_���O�ӤH�վ㬰 6%    ,2012�~1�� 7% (hyt upd 2012-01-13) 2014-01-07 hyt upd(7->8)
  PERCENT_PICC_YI =0.015;  //��O 1%
  PERCENT_PICC_BACK=0.22;//�O�I���� 17% ,2012-02-01 hyt upd(0.19-->0.20) 2014-01-07 hyt upd(20->22)
  PERCENT_PICC_SHIYE =0.01;  //��O 1%
  //2014.09.20 �ͤ�§��
  BIRTHDAY_ALLOWANCE= 50000;
type
  TSpcGongCurrs= array[0..1] of Currency;
  TNormalTestDays =array[0..1] of Integer;
  TDutCurrs=array[0..22] of Currency;//14->17 (�ثe�u��17)   2013-01-31 hyt upd      2016.02.27 17->22
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
    //�ͤ�§�� 2014.09.20
    function GetBirthDay(EmpId, PayMon, PstCode:String; EmpInDate, EmpLvDate, EmpBirthDay : TDate):Currency;
    //2014.12.03 �P�_�O�_�����Ц��~��
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
    //2015.04.25 �p����¾�ɶK
    function GetLeaveSubsidy(AMonth, AEmpID: string; AEpIndt, AEpLedt: TDateTime; boChangeFactory: Boolean=False): Currency;
    //
    function GetYiFaJinE(const AMonth, AEmpID: string): Double;
    //�o�����ɶK���~���Ѽ� 2013.09.26 LX ADD
    function GetButieDays(AEmpID, PayMonth: string): Double;
    //
    function GetYXTS_16(AEmpID, AYear: string): Double;
    //2016.03.19 �o��@�~�����S�O����
    function GetSpcPayOf60(const AMonth, AEmpID: string): Double;
    //2016.06.13 ��t
    function IsChangeFactory(const AMonth, AEmpID: string): Boolean;
    //2016.06.13 �o��W�Ӥ몺�̫�@��
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
//2014.12.02 �o�쥻���ڤu�@�Ѽ�
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
   SalBaseLvl:TStrings;//���~�굥���B
   SalLongWorkLvl:TStrings;//�[�����������B
   AEmpId,PayMon:String;
   MonSDate,MonEDate:TDatetime;
   g_sHrd_sal_paymt:string;

{$R *.dfm}
{�]�m���A ActNo ��0 �]�m�d�� ActNo ��1 �]�m����}
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
  //�w�q�n�Ψ쪺�y��
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
{��l�ƫH��}
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
  SalBaseLvl:=GetAllBaseLvl;//���o�Ҧ����~�굥���B
  SalLongWorkLvl:=GetLongWorkLvl;//���o�Ҧ��[�����������B

  //
  chk_epledt.Checked := True;
  chk_epledt.Enabled := False;
end;
{===============================================================================
  �p���~��T�{
===============================================================================}
procedure TFormSal07.bbtn_OK2Click(Sender: TObject);
var
  sql_str:string;
begin
  PayMon:=me_Month2.Text;
  //�Ӥ��Ƥw�g��w
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
    //��¾���
    if chk_epledt.Checked then
    begin
      sql_str := sql_str+' and epledt >= '''+FormatDateTime('yyyy/mm/dd',dtp_epledt_bgn.Date)+
            ''' and epledt <='''+FormatDateTime('yyyy/mm/dd',dtp_epledt_end.Date)+'''';
    end;
  end;  

  //��w��¾���
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
      WideShowMessage('�d�M�d�򤺵L��Ʀs�b');
      qry_sal.Close;
    end;
  end;

  //***<<<2013-01-18 hyt add ���i���
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
  //***<<<2013-01-16 hyt add ���B§�����
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
{���ɤ�����m}
procedure TFormSal07.bbtn_Reset2Click(Sender: TObject);
begin
  if (RunThread<>nil) and (not RunThread.Terminated) then
  begin
    RunThread.Suspend;
    if MessageDlg('�z�T�w�n����?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      RunThread.Resume;
      RunThread.Terminate;
      re_Message.Lines.Add('�Τᰱ��F�ާ@�I');
      SetEnableControl(1,true);
      ClientDataSet1.CancelUpdates;
    end
    else
      RunThread.Resume;
  end;
end;
{��ܤ覡}
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
  �p���~��xian�{
===============================================================================}
procedure TRunThread.Execute;
var
  formsal07:Tformsal07;
  MonthFirstDay:TDateTime; //�p�������Ĥ@��
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
        //�i�{�����A�h�X
        //dmhrdsys.conn.RollbackTrans;
        formsal07.SetEnableControl(1,true);
        ChangeSalDept(payMon);//�ץ��������H��
        Exit;
      end;
      aEmpId:=FieldByName('emp_id').AsString;
      SetProcessBar(false,1);
      SetStatusText('���e��'+IntToStr(Recno)+'/'+IntToStr(RecordCount)+'��');
      { �B�z�@�ӭ��u����� }
      //�R���ӭ��u�����~��
      if ((FieldByName('epledt').AsString<>'') and
          (FieldByName('epledt').AsDateTime<MonthFirstDay)) //����e��¾���B�z 
          //(FieldByName('epledt').AsDateTime<=MonthFirstDay)) //����e��¾���B�z
        or ((FieldByName('epledt').AsString<>'') and
            (FieldByName('epledt').AsDateTime<=FieldByName('epindt').AsDateTime)) then //��¾����p��i�t������B�z
      begin
        try
          formsal07.DelPayMT(aEmpId,PayMon);
        except
          //DMHrdsys.conn.RollbackTrans;
        end;
      end
      else
        try
          {�p��ӭ��u�����~��}
          formsal07.DealAEmp(aEmpId,PayMon);
        except
          //DMHrdsys.conn.RollbackTrans;
        end;
      Next;
    end;
    //DMHrdsys.conn.CommitTrans;
    ChangeSalDept(payMon);//�ץ��������H��
    SetProcessBar(true);
    SetStatusText('���ɧ����I');
    formsal07.re_Message.Lines.Add('���ɧ����I');
    formsal07.SetEnableControl(1,true);
  end;
end;
{===============================================================================
  procedure DelPayMT(EmpId,PayMon:String);
  �R�����u�~��D�ɬ���
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
  �p��@�ӭ��u���~��
===============================================================================}
procedure TFormSal07.DealAEmp(EmpId,PayMon:String);
var
  EmpInfo:TFields;
  aSpcGong:TSpcGongCurrs;              //�S�O�����O�\�Z����
  aDutCurrs:TDutCurrs;                 //�ҶԪ�^�Ʋ�
  ASalGrads:TSalGrad;                  //���~�O�����ƾ�
  pre_pst_flag:boolean;                //�O�_�n���s��¾��
  aSQL,
  DeptCode,                            //����
  InfoCode,                            //�b¾���p
  PstCode,                             //¾�ȥN��
  marryid,                             //¾�ȥN��
  EduCode:String;                      //�Ǿ��N��
  CurDateTime,
  //2014.09.20 �X�ͤ��
  EmpBirthDay,
  //
  EmpInDate,                           //�i�t���
  EmpLvDate:TDateTime;                 //��¾���
  SalBase,                             //�~���`�B �A�p������
  PiccPay:Currency;                    //�O�I���
  WorkDays:Integer;                    //����u�@�Ѽ�
  F_BasePay,                           //�򥻤u��    have done
  F_GradPay,                           //¾�����B    have done
  F_MgmtPay,                           //�D�ޥ[��    have done
  F_TechPay,                           //�M�~�[��    have done
  F_DutyPay,                           //¾�Ȭz�K(�u�ظɶK)    have done
  F_EnvrPay,                           //���Ҭz�K    have done(�w��)
  F_OtherPay,                          //��L�ɶK    have done
  F_OtherTemp,                         //�{�ɶ�    have done
  F_EfftPay,                           //�Ĳv����  200704�}�l
  F_PsalPay,                           //������  200704�}�l
  F_LongWorkPay,                       //�[������
  F_SpcPay,                            //�S�O�z�K    have done
  F_GongPay,                           //�\�Z����    have done
  F_DuoPay,                            //�h�u����    have done
  F_NoLeavePay,                        //���Լ�      have done
  F_OverPay,                           //�[�Z�O      have done
  F_NightPay,                          //�]�Z�z�K    have done
  F_SuppAgaiPay,                       //�W��ɵo    have done
  F_LastAddPay,                        //�W��l�B    have done
  F_SickPay,                           //�f���ɶK(�O�I���q)    have done
  F_SickPay2,                           //�f���ɶK(���q)    have done
  F_PiccBackPay,                       //�O�I����    have done
  F_DealPay,                           //���o�~��    have done
  F_MealCost,                          //�뭹�O      have done
  F_AskCost,                           //�а�����    have done
  F_StopCost,                          //���u����    have done
  F_PiccSheCost,                       //���|�O�I    have done
  F_PiccYiCost,                        //�����O�I    have done
  F_YiCardCost,                        //��O�d����    have done
  F_LaunCost,                          //�u�ζO      have done
  F_TaxCost,                           //�ӤH�ұo�|  have done
  F_SupDeduCost,                       //�W��ɦ�    have done
  //
  F_ZhuiShou,                          //�l���f�O�W�I�� 2015.07.27
  //
  F_PiccShiyeCost,                     //2009.02.10
//  F_VirusPay ,                       //�r�`�z�K    have done   2007.11.03 <<
  F_Over195pay,
  F_Foster_pay,                        //2013-06-24 hyt add �|��z�K �C�ӤH�p�� 60000vnd�A�̦h���i�H�W�L120000
  lciItem1, F_DealPay1,F_RealPay1,F_OverPay1,
  //�h��~������
  F_DuoxiuKoukuan,
  //
  F_LeavPay,                           //2015.05.04 ��¾�ɶK
  F_RealPay, F_Mealsal,F_YuzhiPay, F_YiFa:Currency;                  //��o�~��    have done

  F_NightHour,                         //�]�Z�ɼ� 2013-01-31 hyt add

  F_HourPrice,                         //�p�ɳ��
  F_Over15Hour,                        //�[�Z��*1.5
  F_Over20Hour,                        //�[�Z��*2.0
  F_Over30Hour,                        //�[�Z��*3.0
  F_Over195Hour,
  HourPrice,            //�p�ɳ��
  HourPrice1:double ;           //�p�ɳ��
  sTemp:string;
  //
  boChange: Boolean;
begin
//  EmpInfo:=GetEmpInfo(EmpId,PayMon);
  CurDateTime:=GetServerDateTime;
  with QryEmp do
  begin
    DeptCode:=FieldByName('dept_code').AsString;  //�����N��
    PstCode:=FieldByName('pst_code').AsString;    //¾�٥N��
    EduCode:=FieldByName('edu_code').AsString;    //�Ǿ��N��
    EmpInDate:=FieldByName('epindt').AsDateTime;  //�i�t���
    EmpLvDate:=FieldByName('epledt').AsDateTime;  //��¾���
    InfoCode:=FieldByName('info_code').AsString;  //�b¾���A
    marryid:=FieldByName('ifmarry').AsString;  //�b¾���A
    //2014.09.01 �X�ͤ��
    EmpBirthDay := FieldByName('epbirth').AsDateTime;
  end;
  //�b¾���A�B�z
  if (InfoCode='1') or (InfoCode='2') or (InfoCode='7') then
    InfoCode:='2'
  else if (InfoCode='3') or (InfoCode='4') or (InfoCode='5') or (InfoCode='6') then
    InfoCode:='6'
  else
    InfoCode:='0';
  if EmpLvDate>DateOf(MonEDate) then
    InfoCode:='0';
  //
  WorkDays:=GetWorkDays(PayMon,EmpInDate,EmpLvDate);    //����u�@�Ѽ�
  //
  if empid ='060024'  then
       InfoCode:='0';
  {�}�l�p�� �HF_�}�Y���ܶq���ƾڮw�~���ɤ������}

  //�d����~����(hrd_sal_grade)
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
        begin//���뤧�ᦳ��¾����
          Next;
          pre_pst_flag:=true;
        end
        else
          Break;
      end;
      {if (pre_pst_flag) and (not Eof) then//���s���o��¾�e��¾��
        PstCode:=FieldByName('pst_code').AsString;}
      if (pre_pst_flag) then//���s���o��¾�e��¾��(����Z����¾)
      begin
        if (not Eof) then//���e����¾
          PstCode:=FieldByName('pst_code').AsString
        else//���e����¾
          PstCode:='60';
      end;
    end;
      ASalGrads:=GetSalTran(EmpId,PayMon,PstCode,EduCode,WorkDays,EmpInDate,EmpLvDate);
      F_MgmtPay:=ASalGrads[1];                 //2,�D�ޥ[��
      F_TechPay:=ASalGrads[2];                 //3,�M�~�[��
      F_DutyPay:=ASalGrads[3];                 //4,¾�Ȭz�K(�u�ظɶK)
      //GetDutyPay(EmpId,PayMon,PstCode,FieldByName('pst_pay').AsCurrency,WorkDays);

    //  F_EnvrPay:=ASalGrads[4];                 //5,���Ҭz�K(�R)
      //F_GradPay:=GetGrad(FieldByName('sal_grade').AsString,PstCode,WorkDays);
      F_GradPay:=ASalGrads[5];                 //6,¾�ȵ����B
      F_OtherPay:=0;//ASalGrads[6];                //5,��L�ɶK(�R)
      F_SpcPay:=ASalGrads[6];                                //7-�S�O����
      //***<<<2011-11-26 hyt add �ָS-�L��t-�@�~��������S�O����-�S�O�B�z
      if (PstCode='60') and (leftStr(DeptCode,2)='FE') and (PayMon>='201111') then
      begin
        F_SpcPay:=GetSpecSal(EmpId,PayMon,EmpInDate,EmpLvDate);
      end;
      //***>>>

      //***<<<2011-04-25 hyt add
      if ( PstCode='60' ) or ( PstCode='61' ) or ( PstCode='62' )  or ( PstCode='63' ) then
      begin
        //�B�z�s�i�@�~���]�u�جz�K�^�Τ@��20000�V���ָ�Ʃy
        if copy( deptcode, 1, 1) = 'S' then
        begin
          if (F_DutyPay<=0) and (PayMon>='201104') and (formatDatetime('yyyymm',EmpInDate)=PayMon) then //�u�糧��s�i���ġA���뤣���R
          begin
            F_DutyPay:=20000*WorkDays/26
          end;
        end;
        //�B�z�s�i�@�~���]���Ҭz�K�^�Τ@��40000�V���ָ�Ʃy
        //if copy( deptcode, 1, 1) = 'N' then
        //begin   //�u�侀�t
        //  if (PayMon>='201104') and (formatDatetime('yyyymm',EmpInDate)=PayMon) then //�u�糧��s�i���ġA���뤣���R
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
  F_BasePay := GetBase(EmpId,PayMon,PstCode,EmpInDate,EmpLvDate,EduCode); //1,�򥻤u��
  if paymon <='200809'  then
     F_LongWorkPay:=GetLongWorkPay( EmpInDate,empid,PstCode,PayMon)  //�[������
  else
      F_LongWorkPay:= 0 ;
 // else
   //  F_BasePay := F_BasePay  + F_LongWorkPay ;

   if ( empid='064618') or ( empid='064619') then
       F_BasePay  :=1032000 ;
  //���~�`�B�]�����ɥΡ^
  if PstCode='60' then
    //�@�~���A���~�`�B���򥻤u��+�u�ظɶK
    SalBase:=F_BasePay+F_DutyPay
  else
    //�D�@�~���A���~�`�B�� �򥻤u��+�D�ޥ[��+¾�Ȭz�K+�M�~�z�K+¾�ȵ����B+�S�O����(2016.03.16)  
    SalBase:=F_BasePay+F_MgmtPay+F_DutyPay+F_TechPay+F_GradPay + F_SpcPay;

  //
  aSpcGong:=GetSpcGong(EmpId,PayMon,WorkDays);          //�p��\�Z�����B�S�O����
  //F_SpcPay:=aSpcGong[0];                                //7-�S�O����
  F_GongPay:=aSpcGong[1];                               //8-�\�Z����

  F_DuoPay:=GetMultPay(EmpId,PayMon);                   //9-�h�u����
  aDutCurrs:=GetDut(EmpId,PayMon,EmpInDate,EmpLvDate,SalBase,F_BasePay,F_DutyPay,F_SpcPay+F_GongPay,WorkDays);

  //�[�|�٤��J 2013-06-07 hyt add
  aDutCurrs[4]:=strToInt(formatFloat('0',aDutCurrs[4]));
  
  //2010/07/12
  if WorkDays<> 0 then
    HourPrice:=SalBase/WorkDays/8;            //�p�ɳ��
    F_Over15Hour:=aDutCurrs[9];                            //16-�[�Z��*1.5
    F_Over20Hour:=aDutCurrs[10];                            //16-�[�Z��*2
    F_Over30Hour:=aDutCurrs[11];                           //16-�[�Z��*3
    F_Over195Hour :=aDutCurrs[13] ;                        //16-�[�Z��*1.95
    F_HourPrice:=aDutCurrs[14];                            //16-�p�ɳ��
    F_Over195pay := 0;
    F_Over195pay :=F_Over195Hour*F_HourPrice*GetOver195(PayMon) ;//aDutCurrs[18];                         //1.95
    F_Over195pay:=strToInt(formatFloat('0',F_Over195pay)); //2013-06-07 hyt add 

    if PayMon<'201305' then
      F_OverPay :=Int(F_Over15Hour*F_HourPrice*1.5)+ Int(F_Over20Hour*F_HourPrice*2.0) + Int(F_Over30Hour*F_HourPrice*2.0)
    else  //2013-05-31 hyt add  201305 300%
      F_OverPay :=Int(F_Over15Hour*F_HourPrice*1.5)+ Int(F_Over20Hour*F_HourPrice*2.0) + Int(F_Over30Hour*F_HourPrice*3.0);

    F_OverPay := F_OverPay + F_Over195pay ;

    F_OverPay1 :=0;
    //�o�̳]�w���� �[�Z�� ���|���B ��1��
    if PayMon>='201307' then //2013-07-30 ���|�� �u���[�Z1.5�M�]�Z�[�Z1.95 2�ر��p���R
      F_OverPay1 :=Int(F_Over15Hour*F_HourPrice*1)+ Int(F_Over195Hour*F_HourPrice*1) + Int(F_Over20Hour*F_HourPrice*1) + Int(F_Over30Hour*F_HourPrice*1)
    else
      F_OverPay1 :=Int(F_Over15Hour*F_HourPrice*1)+ Int(F_Over20Hour*F_HourPrice*1) + Int(F_Over30Hour*F_HourPrice*1) + Int(F_Over195Hour*F_HourPrice*1);
  //2010/07/12
  F_MealCost:=aDutCurrs[0];                             //10-�뭹�O
  F_NoLeavePay:=aDutCurrs[1];                           //11-���Լ�

  //***<<<2013-01-31 hyt add �S���B�z Adidas ��19�ӧ@�~��
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
    F_SuppAgaiPay:=GetBuFaKou(EmpId,PayMon,'1');          //17-�ɵo���B
  // 2008.01.24  << 2008 �~�@����W�b�뤣���O��
 //   if paymon = '200801'  then
   //    begin
   // 2008.05.07 <<
  if paymon >='200804'  then
     F_MealCost:=0;                             //10-�뭹�O
     //  F_NoLeavePay:=0;                           //11-���Լ�
     //  F_SuppAgaiPay:=0;                          //17-�ɵo���B
   //  end;
   // 2008.01.24  >> 2008 �~�@����W�b�뤣���O��
  //2010/07/12 del <<
 // F_OverPay:=aDutCurrs[2];                              //12-�[�Z�O
 // F_OverPay1:= aDutCurrs[8];
 // 2010/07/12  >>

  F_NightPay:=aDutCurrs[3];                             //13-�]�Z�z�K
  F_AskCost:=aDutCurrs[4];                              //14-�а�����
  F_SickPay:=GetSalBaoBu(EmpId,PayMon);                  //15-�f���ɶK(�O�I���q)
  F_SickPay2:=aDutCurrs[5];                              //15-�f���ɶK(���q)
  F_StopCost:=aDutCurrs[6];                              //16-���u����

  //if PayMon>='201305' then //�}�l���B�z�W�Ӥ몺���� 2013-05-25 hyt add
  //  F_LastAddPay:=0
  //else

  //21 - �h�𦩴�
  F_DuoxiuKoukuan := aDutCurrs[21];

    F_LastAddPay:=GetLastAddition(EmpId,PayMon);              //17-�W��l�B

  if IsNewEmp(EmpId,PayMon,PstCode,EmpInDate,EmpLvDate) then      //�P�_�ӭ��u�O�_���s�i���u
  begin
    if PstCode >= '60' then
      F_PiccBackPay := F_BasePay*PERCENT_PICC_BACK          //18-�O�I����(�s�i���u��)
    else
    //¾���ηF�����򥻤u��+�D�ޥ[��+¾�Ȭz�K+�M�~�[��+¾�����B+�S�O����
      F_PiccBackPay := (F_BasePay+F_MgmtPay+F_DutyPay+F_TechPay+F_GradPay + F_SpcPay)*PERCENT_PICC_BACK;
  end
  else
  begin
    F_PiccBackPay:=0;
  end;
  {if CheckRecordExist('SELECT * FROM hrd_picc WHERE emp_id='''+EmpId+''' AND picc_mon<='''+PayMon+'''') then
    PiccPay:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false)//F_BasePay
  else                                                  //�O�I���
    PiccPay:=0;//CheckHasPicc(EmpId,PayMon,PstCode);}
  if CheckHasPicc(EmpId,PayMon) then
  begin
    // if  payMon <'200801'  then
    //     PiccPay:=GetBase1(PayMon,PstCode,EmpInDate,EmpLvDate,EduCode)
       //  PiccPay:=F_BasePay
    // else
      PiccPay:=GetNormalBase(EmpId,PayMon,PstCode,EduCode,EmpInDate,SalBaseLvl,false);  //F_BasePay

      //2016.01.19 ¾���Ψ�L�ݥ[�W¾�����B�B¾�Ȭz�K�B�M�~�[���B�S�O�����B�D�ޥ[��
      //2016.01.23 �@�~���u��򥻤u��A����u�ظɶK
      if PstCode < '60' then
        PiccPay := PiccPay + GetPiccBase(PayMon, EmpId)
      else
        PiccPay := PiccPay + GetSpcPayOf60(PayMon, EmpId);  

      if ( empid='064618') or ( empid='064619') then
       PiccPay:=1032000
  end
  else                                                  //�O�I���
    PiccPay:=0;//CheckHasPicc(EmpId,PayMon,PstCode);
  {2016.04.04
  F_PiccSheCost:=PiccPay*PERCENT_PICC_SHE;              //19-���|�O�I
  F_PiccYiCost:=PiccPay*PERCENT_PICC_YI;                //20-�����O�I
  // 2009.02.10 <<

    //�ӤHú�Ǫ��̦h23000000
  if PiccPay > 23000000 then
    F_PiccShiYeCost := 23000000*PERCENT_PICC_SHIYE
  else
    F_PiccShiYeCost:=PiccPay*PERCENT_PICC_SHIYE;              //23-2009�~1��_���� 1%�����O���~��
  }
  //2016.04.04 ���O�M��O�̦h��23000000ú�ǡA���~�O�I�����ú��
  if PiccPay > 23000000 then
  begin
    F_PiccSheCost:= 23000000*PERCENT_PICC_SHE;              //19-���|�O�I
    F_PiccYiCost:= 23000000*PERCENT_PICC_YI;                //20-�����O�I
  end
  else begin
    F_PiccSheCost:=PiccPay*PERCENT_PICC_SHE;              //19-���|�O�I
    F_PiccYiCost:=PiccPay*PERCENT_PICC_YI;                //20-�����O�I
  end;
  //���~
  F_PiccShiYeCost:=PiccPay*PERCENT_PICC_SHIYE;              //23-2009�~1��_���� 1%�����O���~��

  // 2009.02.10  >>
   // 2008.01.24  << 2008 �~�@����W�b�뤣���O��
 // if paymon ='200801'  then
 //    begin
 //      F_PiccSheCost:=0;              //19-���|�O�I
 //      F_PiccYiCost:=0;                //20-�����O�I
 //    end;
     // 2008.01.24  << 2008 �~�@����W�b�뤣���O��
  if  PayMon >='200704'  then
    begin
      F_PsalPay:=GetPsalPay(EmpId,PayMon,F_DutyPay);           //21-������
      F_EfftPay:= 0 ; //GetEffPay(EmpId,DeptCode,PayMon,EmpInDate,EmpLvDate);//21-�Ĳv����

    end
  else
    begin
       F_PsalPay:=0 ;
       F_EfftPay:= 0 ;

    end;
   // 2008.01.24  << 2008 �~�@����W�b�뤣���O��
 // if paymon='200801'  then
 //    begin
 //      F_PsalPay:=0 ;
 //      F_EfftPay:= 0 ;
 //    end;
  //if paymon='200712'  then
  //   F_SupDeduCost:=  5000  // 200712��C�ӭ��u�S�O����������� 5000
  //else
  F_SupDeduCost:= GetBuFaKou(EmpId,PayMon,'2');          //22-�W��ɦ�
  //
  if (PayMon= '201601') or (F_YiFa < 0) then
    F_SupDeduCost := F_SupDeduCost + Abs(F_YiFa);
  //�l���f�O�W�I�� 2015.07.27
  F_ZhuiShou   := GetBuFaKou(EmpId,PayMon,'3');          //�l���f�O�W�I��

  
  F_Mealsal := 0 ;  //�~�\�O
  F_Mealsal:=aDutCurrs[12] ; //- getnomeal( empid, paymon );
  F_OtherPay:=0;

  F_NightHour:=aDutCurrs[17];                            //16-�]�Z�ɼ� 2013-01-31 hyt add
                                        //23-��L�ɶK(�R)
  // 2008.01.24  << 2008 �~�@����W�b�뤣���O��
  //2015.09.04 ���릳�W�Z�~���u�ζO
  if WorkDays> 0 then
    F_LaunCost:=GetLanuPay(EmpId,PayMon);                 //24-�u�ζO
 // if paymon='200801'  then
 //    F_LaunCost:= 0 ;
   F_YiCardCost:=GetYiCardPay(EmpId,PayMon); //2012-03-22 hyt add 
  F_OtherTemp:=0;                                       //23-�{�ɪ��B
  // 2010.09.18 <<
 // if (RightStr(PayMon,2)='09') and (InfoCode='0') then                         //(����§��)
   if (payMon='201309') and (InfoCode='0') then                         //(����§��) 201108==>201209 2012-09-25 hyt upd
  begin
    //aSQL:='select * from hrd_picc where insu_cod=''9'' and emp_id='''+EmpId+'''';
    //if not CheckRecordExist(aSQL) then
      F_OtherTemp := 50000;  //F_OtherTemp  //+20000; 2013-10-04 hyt upd 30000->50000
  end;
  // 2010.09.18 >>

  //2014.09.20 ����§��
  if PayMon= '201409' then
  begin
    //����`�Y2014/09/08�e(���t)�i�t�A�B����b¾�����u�~������§��
    if (FormatDateTime('YYYY/MM/DD', EmpInDate)<= '2014/09/07') and
       ((EmpLvDate= 0) or (FormatDateTime('YYYYMM', EmpLvDate)> PayMon)) then
      F_OtherTemp := F_OtherTemp + 50000;
  end;

  //2015.10.05 ����§��
  if PayMon= '201509' then
  begin
    //����`�Y2015/09/27�e(���t)�i�t�A�B����b¾�����u�~������§��
    if (FormatDateTime('YYYY/MM/DD', EmpInDate)<= '2015/09/10') and
       ((EmpLvDate= 0) or (FormatDateTime('YYYYMM', EmpLvDate)> PayMon)) then
      F_OtherTemp := F_OtherTemp + 50000;
  end;


  //2014�~09��20�� 2014�~09��_�A�եδ��ạ�@�~�A�ͤ����o��50000�ͤ�§��
  if PayMon>= '201409' then
    F_OtherTemp := F_OtherTemp + GetBirthDay(EmpId, PayMon, PstCode, EmpInDate, EmpLvDate, EmpBirthDay);

  //***<<2010-11-30 hyt
  if (payMon>='201011') then
    F_OtherTemp:=F_OtherTemp+GetJiangli(EmpId,PayMon);
  //***>>

  F_OtherTemp:=F_OtherTemp+GetMarryAmt(EmpId,paymon); //2013-01-16 hyt add  ���B§�� 201301�}�l 

  //2013-06-24 hyt add �|��z�K
  F_Foster_pay:=0;
  if (paymon >='201306') and (InfoCode='0')  then
    F_Foster_pay:=GetFoster_pay(EmpId,PayMon);
  //2015.08.27 ��¾�ɶK
  F_LeavPay := 0;
  //2015.05.04 ��¾�ɶK

  //
  boChange := False;
  if cbChange.Checked then
    boChange := IsChangeFactory(PayMon, EmpId);

  //2015.05.22 ���`��¾�̤~����¾�ɶK 2016.06.13 �ָS�ܶ��N�ɶK
  if (PayMon >= '201508') and ((InfoCode= '2') or boChange)then
    F_LeavPay := GetLeaveSubsidy(PayMon, EmpId, EmpInDate, EmpLvDate, boChange);


  //***<<<2013-05-04 hyt add       2016.05.07 5��1����¾�����ɦ�50000
  if (paymon >='201305') and (rightStr(paymon,2)='05') and (FormatDateTime('MMDD', EmpLvDate)<> '0501') then
  begin
    F_OtherTemp:=F_OtherTemp+50000 ; //�T�w�C�~ 5.1 ���n�[§�� 5�U
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
  //2007.11.03-�r�`�z�K <<
  if paymon <='200809'  then
     F_EnvrPay:=GetVirus(EmpId,PayMon)          //2007.11.03-�r�`�z�K
  else
     F_EnvrPay :=0 ;
 //2007.11.03-�r�`�z�K  >>
  // 2008.05.07 <<
  if paymon >= '200804'  then
  begin
   // if IsNewEmp1(EmpId,PayMon,PstCode,EmpInDate,EmpLvDate) then      //�P�_�ӭ��u�O�_���s�i���u
   // else
   //   begin
    if paymon < '200807' then
      F_GongPay := int((WorkDays/26)*100000 ) //1,�t�~�ɶK
    else
    begin
      if paymon ='200807'  then
        F_GongPay := int((WorkDays/26)*135000)  //1,�t�~�ɶK
      else
      begin
        if paymon <'201103'  then
          F_GongPay := int((WorkDays/26)*200000 ) //1,�t�~�ɶK
        else
          F_GongPay := int((WorkDays/26)*400000 ); //1,�t�~�ɶK   2011�~3��
      end;
    end;
    //  end;
  end;
  // 2008.05.07 >>

  F_BasePay:=strToInt(formatFloat('0',F_BasePay));//�[�|�٤��J 2013-06-07 hyt add
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
  //�l���f�O�W�I�� 2015.07.27
  F_ZhuiShou   := StrToInt(FormatFloat('0', F_ZhuiShou));

  F_YiCardCost:=strToInt(formatFloat('0',F_YiCardCost));
  F_PiccShiyeCost:=strToInt(formatFloat('0',F_PiccShiyeCost));
  //F_LeavPay:=strToInt(formatFloat('0',F_LeavPay));
  //F_SalHolDec:=strToInt(formatFloat('0',F_SalHolDec));




  lciItem1:=round(F_BasePay+F_GradPay+F_DutyPay+F_TechPay+F_MgmtPay);
                                                        //26-���o�~��
  F_DealPay:=F_BasePay+F_MgmtPay+F_TechPay+F_DutyPay+F_GradPay
    +F_PsalPay+F_EfftPay+F_LongWorkPay+F_SpcPay+F_DuoPay+F_NoLeavePay+F_OverPay+F_NightPay+F_GongPay
    +F_SuppAgaiPay+F_PiccBackPay+F_SickPay+F_SickPay2+F_OtherPay+F_OtherTemp+F_LastAddPay +F_EnvrPay +F_Mealsal
    +F_Foster_pay  //2013-06-24 hyt add �|��z�K
    +F_LeavPay;    //2015.08.27 lx add ��¾�z�K                                  
  F_RealPay:=F_DealPay-F_MealCost-F_AskCost-F_StopCost-F_PiccSheCost-F_PiccYiCost-
      F_LaunCost-F_SupDeduCost-F_PiccShiyeCost-F_YiCardCost - F_ZhuiShou - Int(F_DuoxiuKoukuan); //�l���f�O�W�I�� //�h�𦩴�
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
    + F_PiccBackPay  //2011-09-21 hyt add �O�I����
    + F_Foster_pay ; //2013-06-24 hyt add �|��z�K
                                            //2012-02-20 hyt add F_NightPay �]�Z�z�K (the same chingluh)
   //+F_LastAddPay+F_NightPay 2012-07-31 hyt add �]�ȭn�D �q2012-07�}�l ���n�Ҽ{ �]�Z�ɶK�A�ɥ��o

  F_RealPay1:=0;
  F_RealPay1:=F_DealPay1-F_MealCost-F_AskCost-F_StopCost-F_PiccSheCost-F_PiccYiCost
      -F_SupDeduCost-F_PiccShiyeCost - F_ZhuiShou -
      //�h��~������
      Int(F_DuoxiuKoukuan); //�l���f�O�W�I��
 //2009.11.24 >>
  F_TaxCost:= 0;
  // 2011.01.14  add  <<
  if paymon ='201101'  then
     F_RealPay1 := F_RealPay1 + getyearsal( empid) ;
  // 2011.01.14  add   >>

  F_TaxCost:=GetSalTax(F_RealPay1,marryid,paymon,empid);
  F_TaxCost:=strToInt(formatFloat('0',F_TaxCost));//�[�|�٤��J 2013-06-07 hyt add


 // F_TaxCost:=GetSalTax(F_RealPay);                     //25-�ӤH�ұo�|
  // 2008.01.24  << 2008 �~�@����W�b�뤣���O��
//  if paymon ='200801'  then
 //    F_TaxCost:= 0 ;

  F_RealPay:=F_RealPay-F_TaxCost;                      //27-��o�~��
 //  if paymon ='200801'  then
 //    begin
//        F_RealPay:= int( F_RealPay / 50000 )*50000;
 //    end;

  //***<<<2014-01-07 hyt add
  F_YuzhiPay:=0;
  if  paymon='201401' then
  begin
    //sTemp:=DB_GetSRecord('select advance_amt from hrd_year_end_bonus where r_year=''2013'' and emp_id='''+EmpId+''' ');// �W�b���~��
    sTemp:=DB_GetSRecord('select last_salary from hrd_sal_currency201401 where pay_mon=''201401'' and emp_id='''+EmpId+''' ');// �W�b���~��
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
    re_Message.Lines.Add('���u'+EmpId+' ����o�~��p�_�s�I�Э��s�p��I');
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
      FieldByName('yicard_dedu').AsCurrency:=Int(F_YiCardCost); //�����d����
      FieldByName('laun_pay').AsCurrency:=Int(F_LaunCost);
      FieldByName('tax_pay').AsCurrency:=Int(F_TaxCost);

      if (paymon ='201401')  then
        FieldByName('sup_dedu').AsCurrency:=Int(F_SupDeduCost) + Int(F_YuzhiPay )
      else
        FieldByName('sup_dedu').AsCurrency:=Int(F_SupDeduCost) ; //�W��ɦ�
      //�l���f�O�W�I�� 2015.07.27
      FieldByName('zhuishuo_BHXH').AsCurrency := Int(F_ZhuiShou);
      //�h��~������ 2016.02.27
      FieldByName('duoxiu_koukuan').AsFloat:= Int(F_DuoxiuKoukuan);

      FieldByName('actu_pay').AsCurrency:=Int(F_RealPay);
      FieldByName('envr_ofr').AsCurrency:= 0 ; //Int(F_EnvrPay);    // 2007/11/03 <<
      FieldByName('picc_shiye').AsCurrency:=Int( F_PiccShiyeCost) ; //Int(F_EnvrPay);    // 2009/02/10 <<
   //   FieldByName('OT_hour15').AsFloat := aDutCurrs[9];
   //   FieldByName('OT_hour20').AsFloat := aDutCurrs[10];
    //  FieldByName('OT_hour30').AsFloat := aDutCurrs[11];
    //  FieldByName('OT_hour195').AsFloat := aDutCurrs[13];
    //2010/07/12 <<
      FieldByName('over_time').AsFloat:=F_Over15Hour + F_Over20Hour + F_Over30Hour; // �[�Z�ɼ�
      FieldByName('over15_hour').AsFloat:=F_Over15Hour; //   �[�Z�ɼ�1.5
      FieldByName('over15_price').AsCurrency:=Int(F_HourPrice*1.5); // �[�Z�~��1.5��
      FieldByName('over15_sal').AsCurrency:=Int(F_Over15Hour*F_HourPrice*1.5); //�[�Z�O1.5
      FieldByName('over20_hour').AsFloat:=F_Over20Hour; //   �[�Z�ɼ�2.0
      FieldByName('over20_price').AsCurrency:=Int(F_HourPrice*2);// �[�Z���~2.0��
      FieldByName('over20_sal').AsCurrency:=Int(F_Over20Hour*F_HourPrice*2.0);  // �[�Z�~��2.0��
      FieldByName('over30_hour').AsFloat:=F_Over30Hour;  //  �[�Z�ɼ�3.0

      if PayMon<'201305' then
      begin
        FieldByName('over30_price').AsCurrency:=Int(F_HourPrice*2);  //�[�Z���~3.0��
        FieldByName('over30_sal').AsCurrency:=Int(F_Over30Hour*F_HourPrice*2.0) //// �[�Z�~��3.0��
      end
      else
      begin
        FieldByName('over30_price').AsCurrency:=Int(F_HourPrice*3);  //�[�Z���~3.0��
        FieldByName('over30_sal').AsCurrency:=Int(F_Over30Hour*F_HourPrice*3.0); //// �[�Z�~��3.0��    2013-05-31 hyt upd
      end;
      FieldByName('over195_hour').AsFloat:=F_Over195Hour;  //  �[�Z�ɼ�195
      FieldByName('over195_price').AsCurrency:=Int(F_HourPrice*GetOver195(PayMon));  //�[�Z���~195��1.95
      FieldByName('over195_sal').AsCurrency:=Int(F_Over195pay); //// �[�Z�~��195��
      //2010/07/12  >>

      FieldByName('meal_sal').AsFloat:=F_Mealsal; //�\�O�ɶK

      FieldByName('night_time').AsFloat:=F_NightHour; // �]�Z�ɼ� 2013-01-31 hyt add
      FieldByName('foster_pay').AsFloat:=F_Foster_pay; //�|��z�K 2013-06-24 hyt add
      //2015.08.27 ��¾�ɶK
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
      FieldByName('yicard_dedu').AsCurrency:=Int(F_YiCardCost); //�����d����
      FieldByName('laun_pay').AsCurrency:=Int(F_LaunCost);
      FieldByName('tax_pay').AsCurrency:=Int(F_TaxCost);

      if (paymon ='201401')  then      //2014-01-22 hyt add
        FieldByName('sup_dedu').AsCurrency:=Int(F_SupDeduCost) + Int(F_YuzhiPay )
      else
        FieldByName('sup_dedu').AsCurrency:=Int(F_SupDeduCost);

      //�l���f�O�W�I�� 2015.07.27
      FieldByName('zhuishuo_BHXH').AsCurrency := Int(F_ZhuiShou);
      //�h��~������ 2016.02.27
      FieldByName('duoxiu_koukuan').AsFloat:= Int(F_DuoxiuKoukuan); 

      FieldByName('actu_pay').AsCurrency:=Int(F_RealPay);
      FieldByName('envr_ofr').AsCurrency:=Int(F_EnvrPay);   // 2007.11.03
      FieldByName('picc_shiye').AsCurrency:=Int( F_PiccShiyeCost) ; //Int(F_EnvrPay);    // 2009/02/10 <<
       //2010/07/12 <<
      FieldByName('over_time').AsFloat:=F_Over15Hour + F_Over20Hour + F_Over30Hour; // �[�Z�ɼ�
      FieldByName('over15_hour').AsFloat:=F_Over15Hour; //   �[�Z�ɼ�1.5
      FieldByName('over15_price').AsCurrency:=Int(F_HourPrice*1.5); // �[�Z�~��1.5��
      FieldByName('over15_sal').AsCurrency:=Int(F_Over15Hour*F_HourPrice*1.5); //�[�Z�O1.5
      FieldByName('over20_hour').AsFloat:=F_Over20Hour; //   �[�Z�ɼ�2.0
      FieldByName('over20_price').AsCurrency:=Int(F_HourPrice*2);// �[�Z���~2.0��
      FieldByName('over20_sal').AsCurrency:=Int(F_Over20Hour*F_HourPrice*2.0);  // �[�Z�~��2.0��

      FieldByName('over30_hour').AsFloat:=F_Over30Hour;  //  �[�Z�ɼ�3.0
      if PayMon<'201305' then
      begin
        FieldByName('over30_price').AsCurrency:=Int(F_HourPrice*2);  //�[�Z���~3.0��
        FieldByName('over30_sal').AsCurrency:=Int(F_Over30Hour*F_HourPrice*2); //// �[�Z�~��3.0��
      end
      else  //2013-05-31 hyt add
      begin
        FieldByName('over30_price').AsCurrency:=Int(F_HourPrice*3);  //�[�Z���~3.0��
        FieldByName('over30_sal').AsCurrency:=Int(F_Over30Hour*F_HourPrice*3); //// �[�Z�~��3.0��
      end;
      FieldByName('over195_hour').AsFloat:=F_Over195Hour;  //  �[�Z�ɼ�195
      FieldByName('over195_price').AsCurrency:=Int(F_HourPrice*GetOver195(PayMon));  //�[�Z���~195��1.95
      FieldByName('over195_sal').AsCurrency:=Int(F_Over195pay); //// �[�Z�~��195��
      //2010/07/12  >>
      FieldByName('meal_sal').AsFloat:=F_Mealsal; //�\�O�ɶK

      FieldByName('night_time').AsFloat:=F_NightHour; // �]�Z�ɼ� 2013-01-31 hyt add
      FieldByName('foster_pay').AsFloat:=F_Foster_pay; //�|��z�K 2013-06-24 hyt add
      //2015.08.27 ��¾�ɶK
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
    //�l���f�O�W�I�� 2015.07.27
    FieldByName('zhuishuo_BHXH').AsCurrency := Int(F_ZhuiShou);
    Post;
  end;
end;
{===============================================================================
  ��ƦW��:GetBase  -- �p����u�򥻤u��
  �Ѽ�:    EmpId -- ���u�u��  PayMon  -- �u���� PstCode -- ¾��
           EmpInDate -- �i�t���  EmpLvDate -- ��¾���
===============================================================================}
function TFormSal07.GetBase(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime;EduCode:string=''):Currency;
var
  PayNormal,PayTest:Currency;
  NormalTestDays:TNormalTestDays;
  NormalDays,TestDays,edu_no:Integer;
begin
  //PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl);//�������~��
 // if paymon <'200801'  then
     PayNormal:=GetNormalBase(Empid, paymon, PstCode,EduCode,EmpInDate,SalBaseLvl,false); //�������~��
 // else
  //   begin
  //     if( pstcode ='60' )  then
  //        PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 170000 ;   //2008.01 �_¾���@�~���~��W�B190000
  //     if ( pstCode ='50' ) then
  //        PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 190000 ;   //2008.01 �_¾���@�~���~��W�B190000
  //     if ( pstCode ='46' ) or ( pstcode ='41' ) or ( pstcode ='42' )  then
 //         PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 172000 ;  // 2008.01 �_�Z�����~��W�B172000
  //     if ( pstCode ='33' ) or ( pstcode ='37' )  then
  //        PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 242000 ;  // 2008.01 �_�ժ����~��W�B242000
  //     if ( pstCode ='22' ) or ( pstcode ='26' ) or ( pstcode ='28' )  then
  //        PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 342000 ;  // 2008.01 �_�Ҫ����~��W�B342000
  //     if ( pstCode ='18' ) or ( pstcode ='19' )   then
  //        PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 442000 ;  // 2008.01 �_�D�����~��W�B90000
  //   end;
//  if PstCode>='50' then//�եδ��~��
//     begin
       if paymon >='200801'  then
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 90000    // 2008.01�_�եδ��~��W�B90000
       else
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) ;

       if paymon >='200810'  then
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 ;    // 2008.10�_�եδ��~��W�B150000

       if paymon >='200901'  then
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000;    // 2008.10�_�եδ��~��W�B150000
       if paymon >='201001'  then
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000+110000;    // 2008.10�_�եδ��~��W�B150000
       if paymon >='201101'  then
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000+110000 + 430000 ;    // 2008.10�_�եδ��~��W�B150000
       if paymon >='201107'  then
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000+110000 + 430000 + 200000 ;    // 2008.10�_�եδ��~��W�B150000
       if paymon >='201110'  then //2011-11-01 hyt add
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000+110000 + 430000 + 200000+60000 ;    // 2011.10�_�եδ��~��W�B60000
       if paymon >='201301'  then //2013-01-09 hyt add
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000+110000 + 430000 + 200000+60000+320000 ;    // 2013.01�_�եδ��~��W�B320000
       if paymon >='201401'  then //2014-01-07 hyt add
          PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 150000 + 150000+110000 + 430000 + 200000+60000+320000+300000;    // 2013.01�_�եδ��~��W�B3000000

       //2015.01.07 �եδ����~��+400000
       if PayMon>= '201501' then
         PayTest:= 2830000;
       //2016.01.06 �եδ��~�꺦��3230000
       if PayMon>= '201601' then
         PayTest:= 3230000;

       //2017.01.06 �եδ��~�꺦��3480000  
       if PayMon >= '201701' then
         PayTest := 3480000;  

 //   end
 //   end
//  else//¾���H�W�L�եδ�
  //  begin
//     if paymon >='200801'  then
  //        PayTest:=PayNormal + 90000    // 2008.01�_�եδ��~��W�B90000
   //    else
  //       PayTest:=PayNormal ;
 //   end;
   // PayTest:=PayNormal;
  {
  if SalBaseLvl.IndexOf(PstCode)>=0 then
    PayNormal:=StrToFloat(SalBaseLvl.Strings[SalBaseLvl.IndexOf(PstCode)+1]);
  if EmpInDate<EncodeDate(2004,9,1) then//2004/9/1�e�i�t�Ҽ{�Ǿ����[���B
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

  //***<<<2014-01-07 hyt add ���R�p��b�Ӥ��~�ꪺ���p
  {if PayMon='201401' then
  begin
    if (NormalDays+TestDays)>13 then
    begin         //beizhu
      if TestDays>=13 then //����
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

  //���R�O�_���S���H�� ��i�t�N���� �եδ������p    2013-01-10 hyt add
  if TestDays>0 then
  begin
    if DB_SeekRecord('SELECT * FROM hrd_emp_spc_set where emp_id='''+EmpId+''' and if_test=0')=true then
       Result:=((NormalDays+TestDays)/26)*PayNormal;
  end;
end;
{===============================================================================
  ��ƦW��:GetBase  -- �p����u�򥻤u��
  �Ѽ�:    EmpId -- ���u�u��  PayMon  -- �u���� PstCode -- ¾��
           EmpInDate -- �i�t���  EmpLvDate -- ��¾���
===============================================================================}
function TFormSal07.GetBase1(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime;EduCode:string=''):Currency;
var
  PayNormal,PayTest:Currency;
  NormalTestDays:TNormalTestDays;
  NormalDays,TestDays,edu_no:Integer;
begin
  //PayNormal:=GetNormalBase(PstCode,EduCode,EmpInDate,SalBaseLvl);//�������~��
 // if paymon <'200801'  then
     PayNormal:=GetNormalBase(Empid,paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) ; //�������~��
//  else
 //    begin
  //     if( pstcode ='60' )  then
 //         PayNormal:=GetNormalBase(paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 170000 ;   //2008.01 �_¾���@�~���~��W�B190000
 //      if ( pstCode ='50' ) then
  //        PayNormal:=GetNormalBase(paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 190000 ;   //2008.01 �_¾���@�~���~��W�B190000
  //     if ( pstCode ='46' ) or ( pstcode ='41' ) or ( pstcode ='42' )  then
  //        PayNormal:=GetNormalBase(paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 172000 ;  // 2008.01 �_�Z�����~��W�B172000
  //     if ( pstCode ='33' ) or ( pstcode ='37' )  then
  //        PayNormal:=GetNormalBase(paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 242000 ;  // 2008.01 �_�ժ����~��W�B242000
  //     if ( pstCode ='22' ) or ( pstcode ='26' ) or ( pstcode ='28' )  then
  //        PayNormal:=GetNormalBase(paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 342000 ;  // 2008.01 �_�Ҫ����~��W�B342000
   //    if ( pstCode ='18' ) or ( pstcode ='19' )   then
   //       PayNormal:=GetNormalBase(paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 442000 ;  // 2008.01 �_�D�����~��W�B90000
 //    end;
 // if PstCode>='50' then//�եδ��~��
  //   begin
  //     if paymon >='200801'  then
  //        PayTest:=StrToFloat(SalBaseLvl.Strings[1]) + 90000    // 2008.01�_�եδ��~��W�B90000
  //     else
  //       PayTest:=StrToFloat(SalBaseLvl.Strings[1]) ;
  //  end
 // else//¾���H�W�L�եδ�
 //   begin
  //   if paymon >='200801'  then
 //         PayTest:=PayNormal + 90000    // 2008.01�_�եδ��~��W�B90000
  //     else
  //       PayTest:=PayNormal ;
 //   end;
// Result:=PayNormal;
end;

{function Tformsal07.GetNormalBase(PstCode,EduCode:String;EmpInDate:TDateTime):Currency;
//���o�Y¾�٥����~����
var
  PayNormal:double;
  edu_no:integer;
begin
  if SalBaseLvl.IndexOf(PstCode)>=0 then
    PayNormal:=StrToFloat(SalBaseLvl.Strings[SalBaseLvl.IndexOf(PstCode)+1]);
  if EmpInDate<EncodeDate(2004,9,1) then//2004/9/1�e�i�t�Ҽ{�Ǿ����[���B
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
  GetSpcGong(EmpId:String;Id:Integer)  �p��\�Z�����O�S�O����
  input :EmpId ���u�u��  PayMon �~���� EmpInDate �i�t��� EmpLvDate ��¾���
  output:RetArr 0-�S�O���� 1-�\�Z����
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
      //�P�_�~�����O�_�ͮĤF
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
  �o��O�I���
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
  //������¾����O�I
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
  �o�줽�ζO
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
      //2015.02.02 2015�~1��_�@�ζO����20000
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
  �o��h�u����
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
  �o��W��ɵo�ɦ�
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
  if BuType='1' then //�ɵo
    aSQL:=aSQL+' AND al_type=''1'''
  else if BuType='2' then  //����
    aSQL:=aSQL+' AND al_type=''2'''
  //�l���f�O�W�I�� 2015.07.27
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
      //  if FieldByName('al_type').AsString='1' then//�ɵo
           RetCur:=RetCur+FieldByName('al_money').AsCurrency;
       // if FieldByName('al_type').AsString='2' then//�ɦ�
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
  �o��W��l�B
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
  //anil modify 2007/2/5 �ʸ˳̤p�I��2000,������p��U��
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
  GetDutyPay():Currency -- �o��¾�Ȭz�K
===============================================================================}
function TFormSal07.GetDutyPay(EmpId,PayMon,PstCode:String;PstPay:Currency;WorkDays:Integer):Currency;
var
  WorkSal,              //�u�ظɶK
  OfrPay,OfrPay1,OfrPay2:Currency;
  aSQL:String;
  ValidDay,FirstDay,SecondDay,EDay,SDay,DayCount,DayLeft:Integer;
begin
  OfrPay:=0;
  if PstCode='60' then //1,�@�~��
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
      DayLeft:=WorkDays;//�ѤU�i�ΤѼƳ̦h���u�@�Ѽ�(�p26)
      OfrPay:=0;
      while not eof do
      begin
        if DateOf(FieldByName('valid_date').AsDateTime)>DateOf(MonEDate) then
          Next;//���L���뤧���¾������
        SDay:=DayOf(FieldByName('valid_date').AsDateTime);
        if DateOf(FieldByName('valid_date').AsDateTime)<DateOf(MonSDate) then
          SDay:=1;//�W���¾�������]�m�_�l�����1
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
        FirstDay:=ValidDay-GetSunDayCount(1,ValidDay,PayMon);  //������~�e�u�@�Ѽ�
        SecondDay:=WorkDays-FirstDay;                          //������~�Z�u�@�Ѽ�
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
  ��ƦW��:GetGrad(GradStr:String):Currency -- �o�� ¾�ȵ����B
  ��J�Ѽ�:GradStr -- eg. 0102 0504
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
  ��ƦW��:GetSunDayCount -- �o���J�d�򤺪��P���Ѽ�
  �Ѽ�:    DayBeg -- �}�l��� DayEnd -- ������� YearMonth -- �~��
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
  �p�����u�@�Ѽ�
===============================================================================}
function GetWorkDays(PayMon:String;EmpInDate,EmpLvDate:TDateTime):Integer;
var
  WorkDays,TheInDay,TheLvDay,HaveInMonths,SunDays,TheMaxDay:Integer;
  MonEnd:TDateTime;
begin
  //���u�w�i�t���
  HaveInMonths:=StrToInt(RightStr(PayMon,2))+(StrToInt(LeftStr(PayMon,4))-
                YearOf(EmpInDate))*12-MonthOf(EmpInDate);
  //���u�i�t��
  TheInDay:=DayOf(EmpInDate);
  //���u��¾��
  if (EmpLvDate<>0) then
    TheLvDay:=DayOf(EmpLvDate)-1;
  //�Ӥ�̫�@��
  MonEnd:=EndOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  if HaveInMonths=0 then  //�s�i���u
  begin
    if (EmpLvDate=0) or (EmpLvDate>MonEnd) then
    begin
      SunDays:=GetSunDayCount(1,TheInDay,PayMon);
      WorkDays:=26-(TheInDay-SunDays)+1; //2010-10-04 hyt add �[1��,�]�W�w�@�i�t�N�n���~��  exp:810740
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

  //***<<< 2014-01-07 hyt add ���R��b�Ӥ��~�ꪺ���p
  {if PayMon='201401' then
  begin    //beizhu
    if WorkDays>13 then    //  26/2=13
      WorkDays:=13;
  end;}
  //***>>>

  Result:=WorkDays;
end;

//2014.12.02 �o�쥻���ڤu�@�Ѽ�
function GetWorkDaysEx(PayMon:String;EmpInDate,EmpLvDate:TDateTime):Integer;
var
  WorkDays,
  TheInDay,
  TheLvDay,
  HaveInMonths,
  SunDays,
  TheMaxDay,
  //2014.12.02 �Ӥ몺�̤j�Ѽ�
  iMaxDay : Integer;
  //
  MonEnd:TDateTime;
begin
  //���u�w�i�t���
  HaveInMonths:=StrToInt(RightStr(PayMon,2))+(StrToInt(LeftStr(PayMon,4))-
                YearOf(EmpInDate))*12-MonthOf(EmpInDate);
  //���u�i�t��
  TheInDay:=DayOf(EmpInDate);
  //���u��¾��
  if (EmpLvDate<>0) then
    TheLvDay:=DayOf(EmpLvDate)-1;
  //�Ӥ�̫�@��
  MonEnd:=EndOfAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  if HaveInMonths=0 then  //�s�i���u
  begin
    if (EmpLvDate=0) or (EmpLvDate>MonEnd) then
    begin
      SunDays:=GetSunDayCount(1,TheInDay,PayMon);
      WorkDays:=26-(TheInDay-SunDays)+1; //2010-10-04 hyt add �[1��,�]�W�w�@�i�t�N�n���~��  exp:810740
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
      //�̦h26��
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
  �p�����եδ��O�����u��Ѽ�
===============================================================================}
function GetNormalTestDays(EmpId,PayMon,PstCode_new:String;EmpInDate,EmpLvDate:TDateTime):TNormalTestDays;
var
  NormalTestDays:TNormalTestDays;
  CurServerDateTime:TDateTime;  //�A�Ⱦ��W���e�ɶ�
  HaveInMonths,                 //�p���~�ꪺ������u�w�i�t���
  TheInDay,                     //���u�i�t��
  TheLvDay,                     //���u��¾��
  WorkDays,                     //����u�@�Ѽ�
  TestDays,                     //�եδ��u�@�Ѽ�
  NormalDays,                   //�եδ����u�@�Ѽ�
  SunDayCount,                  //�P���Ѽ�
  TheMaxDay:Integer;            //�~��p�����Ѽ�
  PstCode:string; //2013-07-04 hyt upd �ഫ ¾��
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

  //���A�Ⱦ����e�ɶ�
  //CurServerDateTime:=GetServerDateTime;
  //���u�w�i�t���
  HaveInMonths:=StrToInt(RightStr(PayMon,2))+(StrToInt(LeftStr(PayMon,4))-
                YearOf(EmpInDate))*12-MonthOf(EmpInDate);
  //�C��̤j�@��
  TheMaxDay:=DaysInAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  //���u�i�t��
  TheInDay:=DayOf(EmpInDate);
  {����i�t}
  if HaveInMonths=0 then  //pst_code "60" �� ��L�@��
  begin
    if (EmpLvDate=0) or (EmpLvDate>MonEDate) then   //�D��¾,�Y�b¾
    begin
      SundayCount:=GetSundayCount(1,TheInDay,PayMon);
      TestDays:=26-(TheInDay-SundayCount)+1; //2010-10-04 hyt add �[1��,�]�W�w�@�i�t�N�n���~��  exp:810740
      NormalDays:=0;
    end
    else begin//����Y��¾
      TheLvDay:=DayOf(EmpLvDate)-1;
      SundayCount:=GetSundayCount(TheInDay+1,TheLvDay,PayMon);
      TestDays:=TheLvDay-TheInDay-SundayCount;
      NormalDays:=0;
    end;
  end
  {�i�t�@�Ӥ�}
  else if HaveInMonths=1 then
  begin
    if PstCode='60' then   //�@�~��
    begin
      if (EmpLvDate=0) or (EmpLvDate>MonEDate) then  //�D��¾,�Y�b¾
      begin
        TestDays:=TheInDay;
        if TestDays>=TheMaxDay then
          TestDays:=TheMaxDay;
        SunDayCount:=GetSundayCount(1,TestDays,PayMon);
        TestDays:=TestDays-SunDayCount;
        NormalDays:=26-TestDays;
      end
      else begin          //��¾������šA������¾
        TheLvDay:=DayOf(EmpLvDate)-1;
        if TheLvDay > TheInDay then     //���@�Ӥ�F,�~����եδ������O���`����
        begin
          TestDays:=TheInDay;
          SunDayCount:=GetSundayCount(1,TheInDay,PayMon);
          TestDays:=TestDays-SunDayCount;
          NormalDays:=TheLvDay-TheInDay;
          SunDayCount:=GetSundayCount(TheInDay+1,TheLvDay,PayMon);
          NormalDays:=NormalDays-SunDayCount;
        end
        else begin                     //�����@�Ӥ�A�~��եδ�
          TestDays:=TheLvDay;
          SunDayCount:=GetSundayCount(1,TestDays,PayMon);
          TestDays:=TestDays-SunDayCount;
          NormalDays:=0;
        end;
      end;
    end
    else begin             //�D�@�~��
      if (EmpLvDate=0) or (EmpLvDate>MonEDate) then //�b¾
      begin
        TestDays:=26;
        NormalDays:=0;
      end
      else begin                  //��¾
        TheLvDay:=DayOf(EmpLvDate)-1;
        TestDays:=TheLvDay;
        SundayCount:=GetSundayCount(1,TheLvDay,PayMon);
        TestDays:=TestDays-SundayCount;
        NormalDays:=0;
      end;
    end;
  end
  {�i�t��Ӥ�}
  else if (HaveInMonths=2) and (PstCode<>'60')  then
  begin
    if (EmpLvDate=0) or (EmpLvDate>MonEDate) then //�b¾
    begin
      TestDays:=TheInDay;
      if TestDays>TheMaxDay then
        TestDays:=TheMaxDay;
      SundayCount:=GetSundayCount(1,TheInDay,PayMon);
      TestDays:=TestDays-SundayCount;
      NormalDays:=26-TestDays;
    end
    else begin   //��¾
      TheLvDay:=DayOf(EmpLvDate)-1;
      if TheLvDay>TheInDay then //���եδ��A���եδ��~���O���եδ��~��
      begin
        TestDays:=TheInDay;
        SundayCount:=GetSundayCount(1,TheInDay,PayMon);
        TestDays:=TestDays-SundayCount;
        NormalDays:=TheLvDay-TheInDay;
        SundayCount:=GetSundayCount(TheInDay+1,TheLvDay,PayMon);
        NormalDays:=NormalDays-SundayCount;
      end
      else begin               //�����եδ��A�������եδ��~��
        TestDays:=TheLvDay;
        SundayCount:=GetSundayCount(1,TheLvDay,PayMon);
        TestDays:=TestDays-SundayCount;
        NormalDays:=0;
      end;
    end;
  end
  {�i�t��Ӥ�H�W}
  else begin
    if (EmpLvDate=0) or (EmpLvDate>MonEDate) then   //�D��¾,�Y�b¾
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
  �P�_���u�O�_���s�i���u(�p��O�I���٥�)
===============================================================================}
function TFormSal07.IsNewEmp(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDate):Boolean;
var
  HaveInMonths:Integer;
  sSql:string;
begin
  if ( PayMon=FormatDateTime('yyyymm',EmpLvDate) )  then
  begin//(������¾�L�O�I����)
    Result:=false;
    exit;
  end;
  //���u�w�i�t���
  HaveInMonths:=StrToInt(RightStr(PayMon,2))+(StrToInt(LeftStr(PayMon,4))-YearOf(EmpInDate))*12-MonthOf(EmpInDate);
  if PstCode='60' then   //�@�~��
  begin
    if (HaveInMonths=0) or ( (HaveInMonths=1) and (DayOf(EmpInDate)>14) ) then
      Result:=true
    else
      Result:=false;
  end
  else begin             //��L
    if (HaveInMonths<2) or ( (HaveInMonths=2) and (DayOf(EmpInDate)>14) ) then
      Result:=true
    else
      Result:=false;
  end;

  //2013-01-30 hyt add
  if Result then
  begin  //���p�O�s�i�A�A���R�ݬ� �O�_���S���]�w�@�i�t�N�O�������u�����p
    sSql:='SELECT * FROM hrd_emp_spc_set where emp_id='''+EmpId+''' and if_test=''0'' and set_month<='''+PayMon+'''';
    if DB_SeekRecord(sSql) then
      Result:=false;
  end;
end;
 {===============================================================================
  function IsNewEmp(EmpId,PayMon,PstCode:String;EmpInDate:TDate):Boolean;
  �P�_���u�O�_���s�i���u(�p��O�I���٥�)
===============================================================================}
function TFormSal07.IsNewEmp1(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDate):Boolean;
var
  HaveInMonths:Integer;
begin
 // if PayMon=FormatDateTime('yyyymm',EmpLvDate) then
 // begin//(������¾�L�O�I����)
 //   Result:=false;
 //   exit;
//  end;
  //���u�w�i�t���
  HaveInMonths:=StrToInt(RightStr(PayMon,2))+(StrToInt(LeftStr(PayMon,4))-YearOf(EmpInDate))*12-MonthOf(EmpInDate);
  if PstCode='60' then   //�@�~��
  begin
    if (HaveInMonths=0) or ( (HaveInMonths=1) and (DayOf(EmpInDate)>10) ) then
      Result:=true
    else
      Result:=false;
  end
  else begin             //��L
    if (HaveInMonths<2) or ( (HaveInMonths=2) and (DayOf(EmpInDate)>10) ) then
      Result:=true
    else
      Result:=false;
  end;
end;

{===============================================================================
  GetDut
  ��^��: TSalGrad 0-�򥻤u�� 1-�D�ޥ[�� 2-�M�~�[��  3-¾�Ȭz�K(�u�ظɶK)
                   4-���Ҭz�K 5-¾�����B 6-��L�[��
===============================================================================}
function TFormSal07.GetSalTran(EmpId,PayMon,PstCode,EduCode:String;WorkDays:Integer;
  EmpInDate,EmpLvDate:TDatetime):TSalGrad;
var
  WorkSal,              //�u�ظɶK
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
      EDay:=30;//�G��վ�Ѽ�
    DayLeft:=WorkDays;//�ѤU�i�ΤѼƳ̦h���u�@�Ѽ�(�p26)
    //OfrPay:=0;
    if Eof then//�p�G�S�����~����
    begin
      //sal_base := GetBase(EmpId,PayMon,PstCode,EmpInDate,EmpLvDate,EduCode);
      DayLeft:=0;
      if pstCode='60' then
        pst_pay:=pst_pay+int(GetWrkPay(EmpId,PayMon)*WorkDays/26);
      if pstCode='50' then//¾���q�{¾���B20000
        grade_pay:=grade_pay+20000*WorkDays/26;
    end;
    while not eof do
    begin
      if DateOf(FieldByName('valid_date').AsDateTime)>DateOf(MonEDate) then
        Next;//���L���뤧���¾������
      Pst_Code:=FieldByName('pst_code').AsString;
      SDay:=DayOf(FieldByName('valid_date').AsDateTime);
      if DateOf(FieldByName('valid_date').AsDateTime)<DateOf(MonSDate) then
        SDay:=1;//�W���¾�������]�m�_�l�����1
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
      if EDay=1 then//�L�����¾�O��,�h�X
        break;
      Next;
    end;
  end;
  if DayLeft>0 then
  begin//�_�l���~�b�뤤
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
  result[4]:=0;//envir_pay;(���Ҭz�K����)
  result[5]:=grade_pay;
  result[6]:=sal_spec;//�S�O����//other_pay;(��L�z�K����)
//  result[7]:=pst_code;
end;

function TFormSal07.GetWrkPay(EmpId,PayMon:String):Currency;
//�@�~�����u�ظɶK
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
  ��^��: TRetCurrs 0-�뭹�O 1-���Լ� 2-�[�Z�O  3-�]�Z�z�K 4-�а����� 5-�f���ɶK
                    6-���u����
===============================================================================}
function TFormSal07.GetDut(EmpId,PayMon:String;EmpInDate,EmpLvDate:TDateTime;
  SalBasePay,ABasePay,DutyPay,GongSpcPay:Currency;AWorkDays:integer):TDutCurrs;
var
  MonthMaxDay,StartDay,EndDay,TheInDay,TheLvDay,Value1,i:Integer;
  ASpcOver:TspcOver;
  ClasHours,            //�Z�O�ɼ�
  NightDays,            //�]�Z�Ѽ�
  WorkDays,             //�W�Z�Ѽ�
  Hours_1,              //�`�A�u��
  Hours_2,              //�]�Z�u��
  Hours_3,              //���`�[�Z
  Hours_4,              //�P���[�Z
  Hours_5,              //�`����[�Z
  Hours_6,              //�@��f��
  Hours_7,              //���~��
  Hours_8,              //���~���˰�
  Hours_9,              //��d���`
  Hours_10,             //���`���u
  Hours_11,             //���u����
  Hours_12,             //���u���b
  Hours_17,             //�]�s�Z1.95
  Hours_14,             //�]�s�Z1.95
  Hours_13_kou,         //2013-07-04 hyt add
  Hours_27,             //�L�~���]�����~�׼��^ //2016.03.17 
  Hours_CQJ,            //2016.03.17 ���e�������~��A����������
  Hours_13:Extended;    //�m�u,�Шư�, �ɶK�f��, �L�~���˰�, �ͨ|��
  Hours_22,             //��i�P��_���d��(���ɦ��𰲴������~���A���ɦ����Լ��Υͬ��z�K)  2015.03.09 LX
  MonthFirstDate,aDate:TDateTime;
  ClasCode, Asql:String;
  Value2, MealDay, MealDays:Extended;
  StaffNatuPrice,       //���`�[�Z���
  StaffPeriPrice,       //�P���[�Z���
  StaffHoliPrice,       //�`���[�Z���
  StaffNighPrice,       //�]�Z�z�K���
  StaffSickPrice,       //�f���ɶK���
  AskLeavPrice:Currency;//�а����ڳ��
  RetArr:TDutCurrs;     //��^��
  psalkou:double;
  //2014.12.02 �p�⦩�ڮɪ���ڤu�@�Ѽ�
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
    //�u�@�ѼƬ�0�A�ȭp�⥼��~���ɵo
    lastMonthPrice := getLastWeixiuPrice(EmpId,PayMon,EmpInDate,EmpLvDate);
    //����ɵo
    if fDays>= 0 then
      RetArr[20]:= fDays*8*lastMonthPrice
    //�h�𦩴�
    else if PayMon>= '201401' then
    begin
      //2014.02.08 �����h�𦩴�
      RetArr[21]:= Abs(fDays)*8*lastMonthPrice;

      //2017.03.03�Τ��e��¾���A�w�b2�릩���A�ҥH3�������¾�~�ꪺ�ɭԤ��A����
      if (PayMon= '201703') and (FormatDateTime('DD', EmpLvDate)<= '03') then
        RetArr[21]:= 0;
    end;  
    Result := RetArr;
    Exit;
  end;


  //�p���~���Ĥ@��
  MonthFirstDate:=EnCodeDate(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)),1);
  //�p���~���Ѽ�
  MonthMaxDay:=DaysInAMonth(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)));
  //���u�i�t��
  TheInDay:=DayOf(EmpInDate);
  //���u��¾��
  if EmpLvDate<>0 then
    TheLvDay:=DayOf(EmpLvDate);
  //�ҶԲέp�}�l���
  if MonthFirstDate>=EmpInDate then
    StartDay:=1
  else
    StartDay:=DayOf(EmpInDate);
  //�ҶԲέp�������
  if (EmpLvDate<>0) and (EmpLvDate<=MonEDate) then//������¾
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
  //2015.03.09 ��i�P��_���d��
  Hours_22:= 0;
  //
  Hours_27 := 0;
  Hours_CQJ:= 0;
  //
  Hours_13_kou:=0;
  RetArr[0]:=0;                  //�뭹�O
  RetArr[1]:=0;                  //���Լ�
  RetArr[2]:=0;                  //�[�Z�O
  RetArr[3]:=0;                  //�]�Z�z�K
  RetArr[4]:=0;                  //�а�����
  RetArr[5]:=0;                  //�f���ɶK
  RetArr[6]:=0;                  //���u����
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_dut_mon WHERE emp_id='''+EmpId+''' AND dut_mon='''+PayMon+'''');
    Open;
    while not Eof do
    begin
      Value1:=0;          //�C�Ѥu�� �]�p0800�^
      Value2:=0;          //�C�Ѥp�ɼơ]�p8�^
      ClasCode:=FieldByName('clas_code').AsString;  //�Z�O
      ClasHours:=0;       //�����O�u�@�ɼ�
      WorkDays:=0;        //�ӯZ�O�u�@�Ѽ�
      for i:=StartDay to EndDay do
      begin
        //���o�ӤѤ��
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
          re_Message.Lines.Append('�u��:'+EmpId+' �Z�O:'+FieldByName('clas_code').AsString+'�X�{�t��!');
          exit;
        end;
        Value2:=Value1;
        //�p�G�j�󵥩�30�A���Ӥ��O���Φ��h�A�N����⦨�p�ɼ�
        if ClasCode>='06' then
        begin
          if Value1>=30 then
            Value2:=(Value1 div 100)+(Value1 mod 100)/60
          else
            Value2:=0;
        end;
        //06-�m�u 08-���� 09-���|�� 10-�@��f�� 12-�ư� 13-�B�� 14-��a 15-���~���˰� 16-�~�� �P�����p�J
        if ((ClasCode='06') or (ClasCode='08') or (ClasCode='09') or (ClasCode='10') or (ClasCode='12') or
           (ClasCode='13') or (ClasCode='14') or (ClasCode='15') or (ClasCode='16') or (ClasCode='23')) and
           (DayOf(aDate)<>1) then //�o�䦳���D�A�n��A�������@�w�N���P���ѡA�k�w����]�n��W 2010-10-27 hyt add 23-���/���h
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
        begin                    //2010.05.07 �K�[
          mealday := mealday + 1 ;
          ClasHours:=ClasHours+Value2;
        end                                                                       //�߯Z��ɬq�A�n�ɶK�\�O
        else  if (( clasCode='73' ) or ( clascode='74' ) or ( clascode='75' ) or ( clascode='6C' ))  and ( value2 > 0 ) then
        begin                    //2010.08.09 �K�[
          mealdays := mealdays + 1 ;
          ClasHours:=ClasHours+Value2;
        end
        else begin
          ClasHours:=ClasHours+Value2;
          if Value2>0 then
            WorkDays:=WorkDays+1;
        end;
      end;//for
                                               //6D ��߯Z�M���Z�ɬq�A�����]�Z�ɶK 2015.09.10
      if (ClasCode='61') or (ClasCode='62') or (ClasCode='6D') then   //�`�A�u��
      begin
        Hours_1:=Hours_1+ClasHours;
        RetArr[0]:=RetArr[0]+WORK_DAY_MEAL_PAY*WorkDays; //�뭹�O
      end
      else if  (ClasCode='63') or (ClasCode='73') or (ClasCode='6C')  then  //2010.08.09                  //�]�Z�u��
      begin
        Hours_1:=Hours_1+ClasHours;
        Hours_2:=Hours_2+ClasHours;
      end
     //  else if   ( ClasCode='74' )  then  //2010.08.09                  //�]�Z�u��
    //  begin     //( ClasCode='74' ) or
    //    Hours_2:=Hours_2+ClasHours;
    //  end
      else if  ( ClasCode='75' ) then
      begin
        Hours_2:=Hours_2+ClasHours;
        Hours_5:=Hours_5+ClasHours

      end
      else if (ClasCode='65') or (ClasCode='66') or (ClasCode='67') or(ClasCode='68') or(ClasCode='80') or (ClasCode='90') then
        Hours_3:=Hours_3+ClasHours            //���`�[�Z
      else if (ClasCode='69') or (ClasCode='82') or (ClasCode='92') or (ClasCode='74') or (ClasCode='76')   then //2010-10-27 hyt add 74 2014-03-25 hyt add 76
         begin
            if   ( ClasCode='74' )  then  //2010.08.09                  //�]�Z�u��
                 Hours_2:=Hours_2+ClasHours;
            Hours_4:=Hours_4+ClasHours            //�P���[�Z
         end
      else if (ClasCode='72') or (ClasCode='85') or (ClasCode='95') or (ClasCode= '7C') then
      begin

        Hours_5:=Hours_5+ClasHours;            //�`����[�Z
        //2015.12.29
        if ClasCode= '7C' then
        begin
          Hours_2 := Hours_2 + ClasHours;
          NightDays := NightDays + 1;
        end;
      end
      else if  (ClasCode='09') or (ClasCode='10') then
        Hours_6:=Hours_6+ClasHours            //�@��f��
      else if (ClasCode='07') or (ClasCode='08') or (ClasCode='13') or (ClasCode='14') or (ClasCode='16') or (ClasCode='17') then //2014.12.29 17:�w�Ʀ~��
        Hours_7:=Hours_7+ClasHours            //���~��
      //11-���e��  
      else if ClasCode='11' then
      begin
        if PayMon <= '201602' then
          Hours_1:=Hours_1+ClasHours            //����
        else
          Hours_CQJ := Hours_CQJ + ClasHours;
      end
      else if ClasCode='15' then
        Hours_8:=Hours_8+ClasHours            //���~���˰�
      else if ClasCode='02' then
        Hours_9:=Hours_9+ClasHours*5          //��d���`
      else if (ClasCode='04') or (ClasCode='05') then
        Hours_9:=Hours_9+ClasHours            //��즭�h
      else if ClasCode='64' then              //���`���u
      begin
        Hours_10:=Hours_10+ClasHours;
        Hours_1:=Hours_1+ClasHours;
      end
      else if ClasCode='54' then              //���u����
        Hours_11:=Hours_11+ClasHours
      else if ClasCode='44' then              //���u���b
      begin
        Hours_12:=Hours_12+ClasHours;
        Hours_1:=Hours_1+(ClasHours/2);
      end
      else if (ClasCode='70') or (ClasCode='71')  then
        Hours_17:=Hours_17+ClasHours
      //��i�P��_���d��(���ɦ��𰲴������~���A���ɦ����Լ��Υͬ��z�K)  2015.03.09 LX
      else if ClasCode= '22' then
        Hours_22:= Hours_22 + ClasHours
      else if (ClasCode='06')or(ClasCode='12')or(ClasCode='20')or(ClasCode='21')or(ClasCode='25') or (ClasCode='23') or
         //2015.05.07 ���k�f���A���P��20-�ɶK�f��
         (ClasCode='24') or
         //������
         (ClasCode= '27')   then
      begin
        Hours_13:=Hours_13+ClasHours;        //�m�u,�Шư�, �ɶK�f��, �L�~���˰�, �ͨ|�� 2010-10-27 hyt add 23-���/���h
        {2016.03.17 �L�~���A�ݦ����Լ�
        if ClasCode='25' then
          Hours_13_kou :=Hours_13_kou +ClasHours;
        }
        //�������A�������Լ� 2016.03.17
        if ClasCode= '27' then
          Hours_13_kou := Hours_13_kou + ClasHours;
      end;
      Next;
    end;//while
  end;//with
  // �s�i,��¾���u�L���Լ�
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
  //��i�P��_���d��(���ɦ��𰲴������~���A���ɦ����Լ��Υͬ��z�K)  2015.03.09 Sanjin
  Hours_13 := Hours_13 + Hours_22;

  //�L�~���]�������Լ��^ 2016.03.17 lx
  Hours_13 := Hours_13 + Hours_27;
  //2016.03.17 ���e���S���~��A���������Լ�
  Hours_13 := Hours_13 + Hours_CQJ;
  //2015.09.04 1����¾�A������¾�ɶK
  if AWorkDays<> 0 then
  begin
    StaffNatuPrice:=(SalBasePay/AWorkDays/8)*1.5; //���`�[�Z���
    StaffPeriPrice:=(SalBasePay/AWorkDays/8)*2.0; //�P���[�Z���
    StaffHoliPrice:=(SalBasePay/AWorkDays/8)*2.0; //�`���[�Z���
    StaffNighPrice:=(SalBasePay/AWorkDays/8)*0.3; //�]�Z�z�K���
    StaffSickPrice:=(ABasePay/AWorkDays/8)*0.5;   //�f���ɶK���
  end
  else begin
    StaffNatuPrice:= 0; //���`�[�Z���
    StaffPeriPrice:= 0; //�P���[�Z���
    StaffHoliPrice:= 0; //�`���[�Z���
    StaffNighPrice:= 0; //�]�Z�z�K���
    StaffSickPrice:= 0;   //�f���ɶK���
  end;
  //2014.12.02
  //AskLeavPrice  :=SalBasePay/AWorkDays/8;       //�а����ڳ��

  //2014.12.02 �а����ڳ���A���u�@��p��26�ѮɡA�H��ڤu�@�Ѽƭp�ƽа����ڳ��
  //
  iWorkDays := AWorkDays;
  //2014.12.03 ��볣�O���~������
  if IsAskMonthlong(PayMon, EmpId) then
    iWorkDays := GetWorkDaysEx(PayMon, EmpInDate, EmpLvDate);    //����u�@�Ѽ�
  //
  if iWorkDays<> 0 then
    AskLeavPrice  :=SalBasePay/iWorkDays/8;       //�а����ڳ��

 // stdoverPrice := SalBasePay/AWorkDays/8 ;
  ASpcOver:=GetSpcOver(EmpId,PayMon);//��p�S���[�Z
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
  
  //***<<<���R�����������p2014-03-03 hyt add
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

  //�p��[�Z�O
  if AWorkDays<> 0 then
    RetArr[2]:=Hours_3*StaffNatuPrice+Hours_4*StaffPeriPrice+StaffHoliPrice*Hours_5+Hours_17*(SalBasePay/AWorkDays/8)*GetOver195(PayMon); //1.95

  RetArr[9]:=Hours_3 ;
  RetArr[10]:=Hours_4 ;
  RetArr[11]:=Hours_5 ;

  RetArr[8]:=Hours_3* AskLeavPrice+Hours_4* AskLeavPrice+ Hours_5* AskLeavPrice;
  //�p��]�Z�z�K
  RetArr[3]:=(NightDays+Hours_2)*StaffNighPrice+NightDays*SalBasePay/208;
  //�p��а����ڡ]�]�A�S�O�����O�\�Z����+�@��f�����ڡ^
  //RetArr[4]:=( Hours_13*(AskLeavPrice+GongSpcPay/208)+Hours_6*AskLeavPrice ) ;
  //2014.12.03
  //RetArr[4]:=( FenxiHour(Hours_13,PayMon)*(AskLeavPrice+GongSpcPay/208)+FenxiHour(Hours_6,PayMon)*AskLeavPrice ) ; //2012-03-02 hyt upd
  //2014.12.03
  if iWorkDays<> 0 then
    //RetArr[4]:=( FenxiHour(Hours_13,PayMon)*(AskLeavPrice+GongSpcPay/AWorkDays/8)+FenxiHour(Hours_6,PayMon)*AskLeavPrice ) ; //2012-03-02 hyt upd
    RetArr[4]:=( FenxiHour(Hours_13,PayMon)*AskLeavPrice+FenxiHour(Hours_6,PayMon)*AskLeavPrice );

  //�~������¾����p�⥼��~���ɶK 2013.09.26 LX ADD**************************>>
  if (RightStr(PayMon, 2)= '12') or ((EmpLvDate>= MonSDate) and (EmpLvDate<= MonEDate)) then
  begin
    //
    fDays:= GetButieDays(EmpId, PayMon);
    //����ɵo
    if fDays>= 0 then
    begin
      //2014.10.20 �~�����b¾�A����~���ɶK4���~��
      if (RightStr(PayMon, 2)= '12') and ((EmpLvDate= 0) or (EmpLvDate> MonEDate)) then
        RetArr[20]:= fDays*8*AskLeavPrice*4
      else
        RetArr[20]:= fDays*8*AskLeavPrice;
    end
    //�h�𦩴�
    else if PayMon>= '201602' then
    begin
      // RetArr[21]:= Abs(fDays)*8*(AskLeavPrice+wholeSpecsal/208);
      //2016.02.24  �p���~��w�]�t�S�O����
      RetArr[21]:= Abs(fDays)*8*AskLeavPrice;

      //2017.03.03�Τ��e��¾���A�w�b2�릩���A�ҥH3�������¾�~�ꪺ�ɭԤ��A����
      if (PayMon= '201703') and (FormatDateTime('DD', EmpLvDate)<= '03') then
        RetArr[21]:= 0;
    end;  
  end;  

  //�f���ɶK
  RetArr[5]:=0 ;  //Hours_6*StaffSickPrice;
  //���u����
  RetArr[6]:=(Hours_11+Hours_12/2)/208*DutyPay;
   //2010.07.08 <<
  //RetArr[12]:=mealday*8000 + mealdays*9000;  //2010.07.08 �\�O�ɶK
  RetArr[12]:=mealday*9000 + mealdays*10000;  //2013.01.18 �\�O�ɶK hyt add
  RetArr[13]:=Hours_17+ASpcOver[3] ;
  if AWorkDays<> 0 then
    RetArr[14]:=SalBasePay/AWorkDays/8 ;
   // 2010.07.08 >>

   //2013-01-31 hyt add
   //�]�Z�ɼ�
  RetArr[17]:=(NightDays+Hours_2);

  Result:=RetArr;
end;

function TFormSal07.FenxiHour(fHours:Extended;PayMon:String):Extended;
{----------2012-03-02 hyt add ���R�S������� �𺡤밲�����p----------}
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

//���o�Ҧ����~��,¾��������B
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

{----------------------�p��S���[�Z�ɶ�-----------------------------
SpcOver[0]-���`�[�Z�FSpcOver[1]-�P���[�Z�FSpcOver[2]-�`���[�Z
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
        time0:=time0+FieldByName('tot_hour').AsFloat       //���`�[�Z
      else if (ClasCode='69') or (ClasCode='82') or (ClasCode='92')  or (ClasCode='74') or (ClasCode='76')   then //2010-10-27 hyt add 74 2014-03-25 hyt add 76
        time1:=time1+FieldByName('tot_hour').AsFloat       //�P���[�Z
      else if (ClasCode='72') or (ClasCode='85') or (ClasCode='95') then
        time2:=time2+FieldByName('tot_hour').AsFloat       //�`����[�Z
      else if (ClasCode='70') or (ClasCode='71')  then
        time3:=time3+FieldByName('tot_hour').AsFloat;       //�`����[�Z
      Next;
    end;
    close;
  end;
  result[0]:=time0;
  result[1]:=time1;
  result[2]:=time2;
  result[3]:=time3;
end;

//�p��ӤH�ұo�|
{function  Tformsal07.GetSalTax(SalTot:Double):Double;
var
  BaseSal,LeftSal,tax:double;
begin
  tax:=0;
  LeftSal:=SalTot;
  if SalTot<5000000 then
  begin//�_���I
    result:=tax;
    exit;
  end;
  //�U�ŵ|�v��[
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

//�p��ӤH�ұo�|
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
  begin//�_���I
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
  //�U�ŵ|�v��[
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
//�p��ӤH�ұo�|
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

  //2012-01-18 hyt add �[�~�׼��� ��|
  if PayMon='201201' then
  begin
    sTemp:=DB_GetSRecord('SELECT ROUND(pack_amt/12, 0) AS y_sal FROM hrd_year_end_bonus WHERE r_year=''2011'' AND emp_id='''+EmpId+'''');
    if sTemp<>'' then
      SalTot :=SalTot+strToFloat(sTemp);
  end;
  //2013-01-18 hyt add �[�~�׼��� ��|
  if PayMon='201301' then
  begin
    sTemp:=DB_GetSRecord('SELECT ROUND(pack_amt/12, 0) AS y_sal FROM hrd_year_end_bonus WHERE r_year=''2012'' AND emp_id='''+EmpId+'''');
    if sTemp<>'' then
      SalTot :=SalTot+strToFloat(sTemp);
  end;
  //2014-01-22 hyt add �[�~�׼��� ��|
  if PayMon='201401' then
  begin
    sTemp:=DB_GetSRecord('SELECT ROUND(pack_amt/12, 0) AS y_sal FROM hrd_year_end_bonus WHERE r_year=''2013'' AND emp_id='''+EmpId+'''');
    if sTemp<>'' then
      SalTot :=SalTot+strToFloat(sTemp);
  end;

  //2015-02-04 sanjin add �[�~�׼��� ��|
  if PayMon='201501' then
  begin
    sTemp:=DB_GetSRecord('SELECT ROUND(pack_amt/12, 0) AS y_sal FROM hrd_year_end_bonus WHERE r_year=''2014'' AND emp_id='''+EmpId+'''');
    if sTemp<>'' then
      SalTot :=SalTot+strToFloat(sTemp);
  end;

  //2015-02-04 sanjin add �[�~�׼��� ��|
  if PayMon='201601' then
  begin
    sTemp:=DB_GetSRecord('SELECT ROUND(pack_amt/12, 0) AS y_sal FROM hrd_year_end_bonus WHERE r_year=''2015'' AND emp_id='''+EmpId+'''');
    if sTemp<>'' then
      SalTot :=SalTot+strToFloat(sTemp);
  end;


  if SalTot<4000000 then  //2009.05.26 <<
  begin//�_���I
    result:=tax;
    exit;
  end;
  //GetRaise_num
  if PayMon>='201307' then   //2013-07-30 hyt add �ﵽ���i�H�ƪ����@�e�����ܰ�
  begin
    rate := 3600000*GetRaise_num(EmpId);
  end
  else if PayMon>='201301' then   //2013-01-18 hyt add �ﵽ���i�H�ƪ����@�e�����ܰ�
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
    
   // 2011�~8��_ , 12�����ӥH�U�������| <<
  if ( salTot <= 5000000 ) and ( payMon >='201108' ) and ( Paymon <='201112' )   then
   begin
     result :=tax;
     exit;
    end;
  // 2011�~8��_ , 12�����ӥH�W�������|  >>
  
  //2012-07-31 hyt add  �����ұo�|���@�š] <=5.000.000 D�^���K�E�ӤH�ұo�|
  if (SalTot<=5000000) and (PayMon>='201207') and (PayMon<='201212') then
  begin//�_���I
    result:=tax;
    exit;
  end;

  Ytax :=  salTot ;



  // 2009.05.26 >>
  //�U�ŵ|�v��[
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
//�p�������
var
  Asql:string;
  psal, psalsupp:double;
begin
  if PayMon<'200704' then//2007�~04��}�l
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
//�p��Ĳv����

var
  Asql:string;
begin
  if PayMon<'200704' then//2007�~04��}�l
  begin
    result:=0;
    exit;
  end;
  if formatDateTime('yyyymm',EmpInDate)=PayMon then//����i�t�L
  begin
    result:=0;
    exit;
  end;
  if formatDateTime('yyyymm',EmpLvDate)=PayMon then//������¾�L
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
//���o �r�`�z�K 2007.11.03 <<
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
// ���o �r�`�z�K 2007.11.03  >>
 {===============================================================================
  Name:GetYiCardPay(EmpId,PayMon:String):Currency;
  ?��??�E?�瓪�L?
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
  �o�즩�|���~�׼���
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
//�ָS-�L��t-�@�~�����S�O����-�S�O�B�z 2011-11-26 hyt add te_pay
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
        //iWorkDays:=GetWorkDays(PayMon,FieldByName('valid_date').AsDateTime ,EmpLvDate) ; //���u�@��
        iWorkDays:=GetWorkDays(PayMon,EmpInDate ,EmpLvDate) ; //���u�@��  2012-08-04 hyt add
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
  �o�쥼��^��O�d����     2012-03-22 hyt add
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
���i�H��  �q2012-05 ����}�l �G �� hrd_emp_raise_data �����R
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
���B§��  �q2013-01 ����}�l   2013-01-16 hyt add
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
    if DB_SeekRecord(sSql) then //�ثe13�O�]�A ���H���B�M�Ĥl���B==�n�o�̭��w ���H���B �~�� §���� 2013-01-28
      Result:=200000;
  end ;
end;

//���ܩ]�Z�z�K������ 2013-05-30
function TFormSal07.GetOver195(PayMon:String):Currency;
begin
  if PayMon>='201305' then
    Result:=2.15
  else
    Result:=1.95;
end;
//�����f���O�I��� 2013-06-03 hyt add
procedure TFormSal07.btn_sal_baoClick(Sender: TObject);
var
  sSql,ConnStr:string;
  i:integer;
begin
 PayMon:=me_Month2.Text;
  //�Ӥ��Ƥw�g��w
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

    //��cossys���
    sSql:='select * from hrd_sal_bao '+
          ' where sal_mon='''+PayMon+''' and left(emp_id,1)<>''2'' ';
    with qry_cos_data do
    begin
      sql.Clear ;
      sql.Add(sSql);
      open;
    end;
    //��hrdsys���
    sSql:='select * from hrd_sal_bao '+
          ' where sal_mon='''+PayMon+''' ';
    with qry_sal_bao do
    begin
      sql.Clear ;
      sql.Add(sSql);
      open;
      //�g�ɤJ���
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
    //����
    qry_sal_bao.UpdateBatch;
    showmessage('deal ok,total RecordCount:'+intToStr(qry_cos_data.RecordCount ) );

    flu_conn.close;
  except
       {showMessage('delete is error!');}
       showmessage('deal error');
  end;
end;
//���|�I�z�K    2013-06-24 hyt add
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

  if result>120000 then //�̤j���B���i�H�W�L2�ӤH �Y12�U
    result:=120000;
end;

//�ͤ�§�� 2014.09.20
function TFormSal07.GetBirthDay(EmpId, PayMon, PstCode: String; EmpInDate,
  EmpLvDate, EmpBirthDay: TDate): Currency;
var
  sMonth: string;
  //
  dDate : TDateTime;
begin
  //
  Result := 0;
  //�ͤ����
  if FormatDateTime('MM', EmpBirthDay) <> Copy(PayMon, 5, 2) then Exit;
  //��¾����S���ͤ�§��
  if (EmpLvDate<> 0) and (FormatDateTime('YYYYMM', EmpLvDate)<= PayMon) then Exit;
  //�C��14���ΥH�e�i�t��������1����
  if DayOf(EmpInDate)<= 14 then
    dDate := StartOfTheMonth(EmpInDate)
  //14���H��i�t��������1���  
  else begin
    dDate := IncMonth(EmpInDate, 1);
    //
    dDate := StartOfTheMonth(dDate);
  end;
  //�@�~��
  if PstCode>= '60' then
    dDate := IncMonth(dDate, 13)
  //��l��14�Ӥ�
  else
    dDate := IncMonth(dDate, 14);
  //�եδ��ạ�@�~
  if FormatDateTime('YYYYMM', dDate)> PayMon then Exit;
  //
  Result := BIRTHDAY_ALLOWANCE;
end;

//2014.12.03 �P�_�O�_�����Ц��~��
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
      if //�q�u
         (sClassCode <> '06') and
         //�ư�
         (sClassCode<> '12') and
         //�ɶK�f��
         (sClassCode<> '20') and
         //�ͨ|��
         (sClassCode<> '21') and
         //�L�~��
         (sClassCode<> '25') and
         //���B���h
         (sClassCode<> '23') and
         //�g��
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
  //��¾�e���Ӥ몺�����~��  2009�~�H��
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

  //��¾�e���Ӥ몺�����~��  2009�~�H�e
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
  // 2016.06.13 �ָS�ܶ��N
  if boChangeFactory then
    dDate := GetEndOfLastMonth(PayMon)
  else
    dDate := 0;  

  iCount := 0;
  iCountOld := 0;
  //
  Result := 0;
  //�b¾
  if (AEpLedt= 0) and (boChangeFactory=False) then Exit;
  //�D������¾
  if (FormatDateTime('YYYYMM', AEpLedt)<> AMonth) and (boChangeFactory= False) then Exit;
  //�u�@��12�Ӥ�
  if (MonthsBetweenEx(AEpLedt-1, AEpIndt)< 12) and (MonthsBetweenEx(dDate, AEpIndt)< 12) then Exit;
  //�̪�6�Ӥ륭���~��
  cBasePay := GetAverageOld(AEmpID, AMonth);
  //�J�S�R�O�I�A�S�S���٪����   2009�H�e
  sSQL := 'SELECT COUNT(EMP_ID) AS MONTH_COUNT'
        + '  FROM HRD_SAL_PAYMT'
        + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
        //2009�~�H�e
        + '   AND PAY_MON <=''200812'''
        //���]�t��¾����
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
  //�p��2008�~12����Τ��e���i�t���
  iCountOld := (2008-YearOf(AEpIndt))*12+(12-MonthOf(AEpIndt) + 1);
  //10���H��i�t���A�⦸��
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
  //�J�S�R�O�I�A�S�S���٪����   2009�H��
  sSQL := 'SELECT COUNT(EMP_ID) AS MONTH_COUNT'
        + '  FROM HRD_SAL_PAYMT'
        + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
        + '   AND (PICC_SHIYE = 0 OR PICC_SHIYE IS NULL)'
        + '   AND (PICC_BACK = 0 OR PICC_BACK IS NULL)'
        //
        + '   AND PAY_MON >=''200901'''
        //���]�t��¾����
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
  //2016.04.23 ���b�ϧO�s�¨�A�������s������
  iCount := iCount + iCountOld;
  //
  if iCount<= 0 then Exit;
  //�̪�6�Ӥ륭���~��
  cBasePay := GetAverage(AEmpID, AMonth);
  {2016.04.23 ���b�ϧO�s�¨�A�������s������
  //6�Ӥ�H���A0.5��
  if iCount< 6 then
    Result := Result + cBasePay/2*0.5
  //6�Ӥ�(�t)�H�W�A1��
  else
    Result := Result + cBasePay/2;
  }
  //2016.04.23 ���b�ϧO�s�¨�A�������s������

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
  //6�Ӥ�H���A0.5��
  if iCount< 6 then
    Result := cBasePay/2*0.5
  //6�Ӥ�(�t)�H�W�A1��
  else
    Result := cBasePay/2;
  }
end;


//2016.01.29 �o��w�o�~��
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

//�o�����ɶK���~���Ѽ� 2013.09.26 LX ADD
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
  //���ɶK = �i�� - �w��
  aryYixiu:= GetYXTS(AEmpID, sYear);
  //
  Result:= GetKXTS(AEmpID, sYear) - aryYixiu[0] - aryYixiu[1];
end;

function TFormSal07.GetYXTS_16(AEmpID, AYear: string): Double;
var
  //�����Ѽ�
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
  //********************�w��~�� 2013.09.23 LX ADD******************************
  _16Hours  := 0;
  //
  _16Minutes:= 0;
  //
  sSQL:= 'SELECT *'
       + '  FROM HRD_DUT_MON'
       //�T�ئ~�� 2014.02.27
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

//2016.03.19 �o��@�~�����S�O����
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
  pre_mon:string;  //�W�@�Ӥ�
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

//2016.06.13 ��t
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

//2016.06.13 �o��W�Ӥ몺�̫�@��
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