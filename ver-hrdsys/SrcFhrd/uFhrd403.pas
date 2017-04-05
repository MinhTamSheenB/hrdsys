{*************************************************************************
Name�GSal08
�קﳡ��sql�y�y
update hrd_sal_paymt set dept_code=A.dept_old from hrd_emp_upd A,hrd_sal_paymt B
where A.id in (select min(id) from hrd_emp_upd
where up_date>='2006/09/01' and dept_old<>dept_new group by emp_id)
and A.emp_id=B.emp_id and pay_mon='200608' and B.dept_code<>A.dept_old
//�멳�c�t�Ƥu�Ϥ�
select * from hrd_emp A 
where  epindt<='2006/09/30'    and (epledt>='2006/09/01' or epledt is null)
and (left(dept_code,1)='V' and emp_id not in (select emp_id from hrd_emp_upd 
  where left(dept_old,1)='n' and left(dept_new,1)='V'  and valid_date>'2006/10/01')
or (left(dept_code,1)='n' and emp_id  in(select emp_id from hrd_emp_upd 
  where left(dept_old,1)='V' and left(dept_new,1)='N'  and valid_date>'2006/10/01')))
*************************************************************************}
unit uFhrd403;

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
  PERCENT_PICC_SHE=0.05;  //���O 5%
  PERCENT_PICC_YI =0.01;  //��O 1%
  PERCENT_PICC_BACK=0.17;//�O�I���� 17%

type
  TSpcGongCurrs= array[0..1] of Currency;
  TNormalTestDays =array[0..1] of Integer;
  TDutCurrs=array[0..15] of Currency;
  TSalGrad=array[0..6] of Currency;
  TSpcOver= array[0..2] of double;

  TFormFhrd403 = class(TForm)
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
    qry_salduty_time: TBCDField;
    qry_saldut_price: TBCDField;
    qry_salover_time: TBCDField;
    qry_salover_price: TBCDField;
    qry_salweek_end: TBCDField;
    qry_salend_price: TBCDField;
    qry_salholiday: TBCDField;
    qry_salhol_price: TBCDField;
    qry_saln_later: TIntegerField;
    ClientDataSet1duty_time: TBCDField;
    ClientDataSet1dut_price: TBCDField;
    ClientDataSet1over_time: TBCDField;
    ClientDataSet1over_price: TBCDField;
    ClientDataSet1week_end: TBCDField;
    ClientDataSet1end_price: TBCDField;
    ClientDataSet1holiday: TBCDField;
    ClientDataSet1hol_price: TBCDField;
    ClientDataSet1n_later: TIntegerField;
    qry_saldept_code: TStringField;
    ClientDataSet1dept_code: TStringField;
    qry_salinfo_code: TStringField;
    qry_salpst_code: TStringField;
    qry_salstop_supp: TBCDField;
    qry_salinjury_supp: TBCDField;
    qry_salsalhol_supp: TBCDField;
    qry_salsick_back: TBCDField;
    qry_salother_temp: TBCDField;
    ClientDataSet1info_code: TStringField;
    ClientDataSet1pst_code: TStringField;
    ClientDataSet1stop_supp: TBCDField;
    ClientDataSet1injury_supp: TBCDField;
    ClientDataSet1salhol_supp: TBCDField;
    ClientDataSet1sick_back: TBCDField;
    ClientDataSet1other_temp: TBCDField;

    //my define
//    procedure GetAllBaseLvl;
    function  GetBase(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime;EduCode:string=''):Currency;
    function  GetSpcGong(EmpId,PayMon:String;WorkDays:Integer):TSpcGongCurrs;
//    function  GetDutyPay(EmpId,PayMon,PstCode:String;PstPay:Currency;WorkDays:Integer):Currency;
    function  GetSalTran(EmpId,PayMon,PstCode,EduCode:String;WorkDays:Integer;
      EmpInDate,EmpLvDate:TDatetime): TSalGrad;
    function  GetDut(EmpId,PayMon:String;EmpInDate,EmpLvDate:TDateTime;
      SalBasePay,ABasePay,DutyPay,GongSpcPay:Currency;AWorkDays:integer):TDutCurrs;
//    function  GetGrad(GradStr,PstCode:String;WorkDays:Integer):Currency;
    function  GetMultPay(EmpId,PayMon:String):Currency;
    function  GetBuFaKou(EmpId,PayMon,BuType:String):Currency;
    function  GetLanuPay(EmpId,PayMon:String):Currency;
    function  CheckHasPicc(EmpId,PayMon:String):Boolean;
    function  IsNewEmp(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDate):Boolean;
    function  GetWrkPay(EmpId,PayMon:String):Currency;
    function  GetSpcOver(EmpId,PayMon:String):TSpcOver;
    function  GetSalTax(SalTot:Double):Double;
//    function  GetNormalBase(PstCode,EduCode:String;EmpInDate:TDateTime):Currency;

    //sys create
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
  FormFhrd403: TFormFhrd403;
  runThread:TRunThread;
implementation

Uses
    UnitDMHrdsys,UnitHrdUtils;
var
   prv:TPrvArr;
   ws_Words:TWideStrings;
   SalBaseLvl:TStrings;//���~�굥���B
   AEmpId,PayMon:String;
   MonSDate,MonEDate:TDatetime;

{$R *.dfm}
{�]�m���A ActNo ��0 �]�m�d�� ActNo ��1 �]�m����}
procedure TFormFhrd403.SetEnableControl(ActNo:Integer;Value:Boolean);
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
procedure TFormFhrd403.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  //�w�q�n�Ψ쪺�y��
 ThisFormUsedWords:='query,ok,reset,find,sal08_titl,fld_emp_id,'+
   'fld_emp_chs,fld_dept_code,msg_add_error,transferfiles,'+
   'msg_confirm_save,dbl_clk_slct_emp,month,fld_pay_mon,fld_base_pay,fld_mgmt_ofr,fld_tech_ofr,'+
   'fld_duty_ofr,fld_envr_ofr,fld_efft_awd,fld_te_pay,fld_duo_awd,fld_full_awd,fld_over_work,fld_gong_pay,fld_supp_agai,'+
   'fld_picc_back,fld_othe_supp,fld_sick_supp,fld_deal_pay,fld_meal_pay,fld_ask_pay,fld_stop_dedu,fld_picc_she,fld_picc_yi,'+
   'fld_laun_pay,fld_tax_pay,fld_sup_dedu,fld_actu_pay';
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
procedure TFormFhrd403.FormInit;
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
//  me_Month2.Text := formatdatetime('yyyymm',date-strtoint(formatdatetime('dd',date))-1);
  me_Month2.Text := formatdatetime('yyyymm',date-12);
  //sel_month.Text := formatdatetime('yyyymm',date-strtoint(formatdatetime('dd',date))-1);
end;

procedure TFormFhrd403.FormCreate(Sender: TObject);
begin
  InitLangInfo;
  FormInit;
  SalBaseLvl:=GetAllBaseLvl;//���o�Ҧ����~�굥���B
end;
{===============================================================================
  �p���~��T�{
===============================================================================}
procedure TFormFhrd403.bbtn_OK2Click(Sender: TObject);
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
  sql_str:='select * from hrd_emp where '
   +' (epledt>='''+FormatDateTime('yyyy/mm/dd',MonSDate)+''' or epledt is null)'
   +' and epindt<='''+FormatDateTime('yyyy/mm/dd',MonEDate)+''''
   +' and ((left(dept_code,1)=''V'' and emp_id not in (select emp_id from hrd_emp_upd'
   +' where left(dept_old,1)=''N'' and left(dept_new,1)=''V'' and valid_date>='''+FormatDateTime('yyyy/mm/dd',MonEDate+1)+'''))'
   +' or (left(dept_code,1)=''N'' and emp_id in(select emp_id from hrd_emp_upd'
   +' where left(dept_old,1)=''V'' and left(dept_new,1)=''N'' and valid_date>='''+FormatDateTime('yyyy/mm/dd',MonEDate+1)+''')))';
  if rb_ByEmp2.Checked then
  begin
    if Trim(EditEmpBeg2.Text)<>'' then
      sql_str:=sql_str+' and emp_id>='''+Trim(EditEmpBeg2.Text)+'''';
    if Trim(EditEmpEnd2.Text)<>'' then
      sql_str:=sql_str+' and emp_id<='''+Trim(EditEmpEnd2.Text)+'''';
  end
  else if rb_ByDept2.Checked then
  begin
    if trim(cob_DeptBeg2.Text)<>'' then
      sql_str:=sql_str+' and dept_code>='''+LeftStr(trim(cob_DeptBeg2.Text),6)+'''';
    if trim(cob_DeptEnd2.Text)<>'' then
      sql_str:=sql_str+' and dept_code<='''+LeftStr(trim(cob_DeptEnd2.Text),6)+'''';
  end;
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
procedure TFormFhrd403.bbtn_Reset2Click(Sender: TObject);
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
procedure TFormFhrd403.rb_ByEmp2Click(Sender: TObject);
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
  FormFhrd403:TformFhrd403;
  MonthFirstDay:TDateTime; //�p�������Ĥ@��
begin
  FreeOnTerminate := true;
  FormFhrd403 := TFormFhrd403(Application.FindComponent('formFhrd403'));
  MonthFirstDay:=EncodeDate(StrToInt(LeftStr(FormFhrd403.me_Month2.Text,4)),StrToInt(MidStr(FormFhrd403.me_month2.Text,5,2)),1);
  with FormFhrd403.QryEmp do
  begin
    SetProcessBar(true,1,RecordCount);
    //DMHrdsys.conn.BeginTrans;
    while not Eof do
    begin
      if Terminated then
      begin
        //�i�{�����A�h�X
        //dmhrdsys.conn.RollbackTrans;
        FormFhrd403.SetEnableControl(1,true);
        ChangeSalDept(payMon);//�ץ��������H��
        Exit;
      end;
      aEmpId:=FieldByName('emp_id').AsString;
//      dept_code:=FieldByName('dept_code').AsString;
      SetProcessBar(false,1);
      SetStatusText('��e��'+IntToStr(Recno)+'/'+IntToStr(RecordCount)+'��');
      { �B�z�@�ӭ��u����� }
      //�R���ӭ��u�����~��
      if ( (FieldByName('epledt').AsString<>'') and (FieldByName('epledt').AsDateTime<=MonthFirstDay)) //����e��¾���B�z
        or ( (FieldByName('epledt').AsString<>'') and (FieldByName('epledt').AsDateTime<=FieldByName('epindt').AsDateTime)) then //��¾����p��i�t������B�z
      begin
        try
          FormFhrd403.DelPayMT(aEmpId,PayMon);
        except
          //DMHrdsys.conn.RollbackTrans;
        end;
      end
      else
        try
          {�p��ӭ��u�����~��}
          FormFhrd403.DealAEmp(aEmpId,PayMon);
        except
          //DMHrdsys.conn.RollbackTrans;
        end;
      Next;
    end;
  end;
  //DMHrdsys.conn.CommitTrans;
  ChangeSalDept(payMon);//�ץ��������H��
  SetProcessBar(true);
  SetStatusText('���ɧ����I');
  FormFhrd403.re_Message.Lines.Add('���ɧ����I');
  FormFhrd403.SetEnableControl(1,true);
end;
{===============================================================================
  procedure DelPayMT(EmpId,PayMon:String);
  �R�����u�~��D�ɬ���
===============================================================================}
procedure TFormFhrd403.DelPayMT(EmpId,PayMon:String);
begin
  //
  with DMHrdsys.ADOCommand1 do
  begin
    CommandText:='DELETE FROM hrd_sal_paymt WHERE emp_id='''+EmpId+''' AND pay_mon='''+PayMon+'''';
    Execute;
  end;
end;
{===============================================================================
  DealAEmp(EmpId,PayMon:String);
  �p��@�ӭ��u���~��
===============================================================================}
procedure TFormFhrd403.DealAEmp(EmpId,PayMon:String);
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
  EduCode:String;                      //�Ǿ��N��
  CurDateTime,
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
  F_OtherPay,                          //��L�ɶK    have done(�w��)
  F_OtherTemp,                         //�{�ɶ�    have done
  F_EfftPay,                           //�Ĳv����    (�w��)
  F_SpcPay,                            //�S�O�z�K    have done
  F_GongPay,                           //�\�Z����    have done
  F_DuoPay,                            //�h�u����    have done
  F_NoLeavePay,                        //���Լ�      have done
  F_OverPay,                           //�[�Z�O      have done
  F_NightPay,                          //�]�Z�z�K    have done
  F_SuppAgaiPay,                       //�W��ɵo    have done
  F_SickPay,                           //�f���ɶK(�O�I���q)    have done
  F_SickPay2,                           //�f���ɶK(���q)    have done
  F_PiccBackPay,                       //�O�I����    have done
  F_DealPay,                           //���o�~��    have done
  F_MealCost,                          //�뭹�O      have done
  F_AskCost,                           //�а�����    have done
  F_StopCost,                          //���u����    have done
  F_PiccSheCost,                       //���|�O�I    have done
  F_PiccYiCost,                        //�����O�I    have done
  F_LaunCost,                          //�u�ζO      have done
  F_TaxCost,                           //�ӤH�ұo�|  have done
  F_SupDeduCost,                       //�W��ɦ�    have done
  F_RealPay:Currency;                  //��o�~��    have done
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
  WorkDays:=GetWorkDays(PayMon,EmpInDate,EmpLvDate);    //����u�@�Ѽ�

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
        begin//��뤧�ᦳ��¾����
          Next;
          pre_pst_flag:=true;
        end
        else
          Break;
      end;
      {if (pre_pst_flag) and (not Eof) then//���s���o��¾�e��¾��
        PstCode:=FieldByName('pst_code').AsString;}
      if (pre_pst_flag) then//���s���o��¾�e��¾��(���Z����¾)
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

      F_EnvrPay:=ASalGrads[4];                 //5,���Ҭz�K(�R)
      //F_GradPay:=GetGrad(FieldByName('sal_grade').AsString,PstCode,WorkDays);
      F_GradPay:=ASalGrads[5];                 //6,¾�ȵ����B
      F_OtherPay:=0;//ASalGrads[6];                //5,��L�ɶK(�R)
      F_SpcPay:=ASalGrads[6];                                //7-�S�O����
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
  //���~�`�B�]�����ɥΡ^
  if PstCode='60' then
    //�@�~���A���~�`�B���򥻤u��+�u�ظɶK
    SalBase:=F_BasePay+F_DutyPay
  else
    //�D�@�~���A���~�`�B�� �򥻤u��+�D�ޥ[��+¾�Ȭz�K+�M�~�z�K+¾�ȵ����B
    SalBase:=F_BasePay+F_MgmtPay+F_DutyPay+F_TechPay+F_GradPay;
  aSpcGong:=GetSpcGong(EmpId,PayMon,WorkDays);          //�p��\�Z�����B�S�O����
  //F_SpcPay:=aSpcGong[0];                                //7-�S�O����
  F_GongPay:=aSpcGong[1];                               //8-�\�Z����
  F_DuoPay:=GetMultPay(EmpId,PayMon);                   //9-�h�u����
  aDutCurrs:=GetDut(EmpId,PayMon,EmpInDate,EmpLvDate,SalBase,F_BasePay,F_DutyPay,F_SpcPay+F_GongPay,WorkDays);
  F_MealCost:=aDutCurrs[0];                             //10-�뭹�O
  F_NoLeavePay:=aDutCurrs[1];                           //11-���Լ�
  F_OverPay:=aDutCurrs[2];                              //12-�[�Z�O
  F_NightPay:=aDutCurrs[3];                             //13-�]�Z�z�K
  F_AskCost:=aDutCurrs[4];                              //14-�а�����
  F_SickPay:=GetSalBaoBu(EmpId,PayMon);                 //15-�f���ɶK(�O�I���q��)
  F_SickPay2:=aDutCurrs[5];                             //15-�f���ɶK(���q��)
  F_StopCost:=aDutCurrs[6];                             //16-���u����
  F_SuppAgaiPay:=GetBuFaKou(EmpId,PayMon,'1');          //17-�ɵo���B
  if IsNewEmp(EmpId,PayMon,PstCode,EmpInDate,EmpLvDate) then      //�P�_�ӭ��u�O�_���s�i���u
    F_PiccBackPay:=F_BasePay*PERCENT_PICC_BACK          //18-�O�I����(�s�i���u��)
  else
    F_PiccBackPay:=0;
  //if CheckRecordExist('SELECT * FROM hrd_picc WHERE emp_id='''+EmpId+''' AND picc_mon<='''+PayMon+''' and insu_cod<>''9''') then
  if CheckHasPicc(EmpId,PayMon) then
    PiccPay:=GetNormalBase(empid, PayMon, PstCode,EduCode,EmpInDate,SalBaseLvl,false)//F_BasePay
  else                                                  //�O�I���
    PiccPay:=0;//CheckHasPicc(EmpId,PayMon,PstCode);
  F_PiccSheCost:=PiccPay*PERCENT_PICC_SHE;              //19-���|�O�I
  F_PiccYiCost:=PiccPay*PERCENT_PICC_YI;                //20-�����O�I
  F_EfftPay:=0;                                         //21-�Ĳv����(�R)
  F_SupDeduCost:=GetBuFaKou(EmpId,PayMon,'2');          //22-�W��ɦ�
  F_OtherPay:=0;                                        //23-��L�ɶK(�R)
  F_LaunCost:=GetLanuPay(EmpId,PayMon);                 //24-�u�ζO
  F_OtherTemp:=0;                                       //23-�{�ɪ��B
  if (RightStr(PayMon,2)='09') and (InfoCode='0') then                         //(����§��)
  begin
    aSQL:='select * from hrd_picc where insu_cod=''9'' and emp_id='''+EmpId+'''';
    if not CheckRecordExist(aSQL) then
      F_OtherTemp:=F_OtherTemp+20000;
  end;
                                                        //26-���o�~��
  F_DealPay:=F_BasePay+F_MgmtPay+F_TechPay+F_DutyPay+F_EnvrPay+F_GradPay
    +F_EfftPay+F_SpcPay+F_DuoPay+F_NoLeavePay+F_OverPay+F_NightPay+F_GongPay
    +F_SuppAgaiPay+F_PiccBackPay+F_SickPay+F_SickPay2+F_OtherPay+F_OtherTemp;
  F_RealPay:=F_DealPay-F_MealCost-F_AskCost-F_StopCost-F_PiccSheCost-F_PiccYiCost-
      F_LaunCost-F_SupDeduCost;
  F_TaxCost:=GetSalTax(F_RealPay);                     //25-�ӤH�ұo�|
  F_RealPay:=F_RealPay-F_TaxCost;                      //27-��o�~��
  if F_RealPay<0 then
  begin
    F_RealPay:=0;
    re_Message.Lines.Add('���u'+EmpId+' ����o�~��p�_�s�I�Э��s�p��I');
  end;
  with qry_temp2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_sal_paymt WHERE emp_id='''+EmpId+''' AND pay_mon='''+PayMon+'''');
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
      FieldByName('duty_ofr').AsCurrency:=Int(F_DutyPay);
      FieldByName('envr_ofr').AsCurrency:=Int(F_EnvrPay);
      FieldByName('grad_ofr').AsCurrency:=Int(F_GradPay);
      FieldByName('efft_awd').AsCurrency:=Int(F_EfftPay);
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
      FieldByName('duty_ofr').AsCurrency:=Int(F_DutyPay);
      FieldByName('envr_ofr').AsCurrency:=Int(F_EnvrPay);
      FieldByName('grad_ofr').AsCurrency:=Int(F_GradPay);
      FieldByName('efft_awd').AsCurrency:=Int(F_EfftPay);
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
    FieldByName('envr_ofr').AsCurrency:=Int(F_EnvrPay);
    FieldByName('grad_ofr').AsCurrency:=Int(F_GradPay);
    FieldByName('efft_awd').AsCurrency:=Int(F_EfftPay);
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
    Post;
  end;
  {ClientDataSet1.AppendRecord([UserName,CurDateTime,EmpId,PayMon,F_BasePay,F_MgmtPay,F_TechPay,
      F_DutyPay,F_EnvrPay,F_GradPay,F_EfftPay,F_SpcPay,F_DuoPay,F_NoLeavePay,
      F_OverPay,F_NightPay,F_GongPay,F_SuppAgaiPay,F_PiccBackPay,F_OtherPay,
      F_SickPay,F_DealPay,F_MealCost,F_AskCost,F_StopCost,F_PiccSheCost,F_PiccYiCost,
      F_LaunCost,F_TaxCost,F_SupDeduCost,F_RealPay]);}
  //ADOCommand1.CommandText:=aSQL;
  //ADOCommand1.Execute;
    {AppendRecord([UserName,CurDateTime,EmpId,PayMon,F_BasePay,F_MgmtPay,F_TechPay,
      F_DutyPay,F_EnvrPay,F_GradPay,F_EfftPay,F_SpcPay,F_DuoPay,F_NoLeavePay,
      F_OverPay,F_NightPay,F_GongPay,F_SuppAgaiPay,F_PiccBackPay,F_OtherPay,
      F_SickPay,F_DealPay,F_MealCost,F_AskCost,F_StopCost,F_PiccSheCost,F_PiccYiCost,
      F_LaunCost,F_TaxCost,F_SupDeduCost,F_RealPay]);}
end;
{===============================================================================
  ��ƦW��:GetBase  -- �p����u�򥻤u��
  �Ѽ�:    EmpId -- ���u�u��  PayMon  -- �u���� PstCode -- ¾��
           EmpInDate -- �i�t���  EmpLvDate -- ��¾���
===============================================================================}
function TFormFhrd403.GetBase(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime;EduCode:string=''):Currency;
var
  PayNormal,PayTest:Currency;
  NormalTestDays:TNormalTestDays;
  NormalDays,TestDays,edu_no:Integer;
begin
  PayTest:=StrToFloat(SalBaseLvl.Strings[1]);//�եδ��~��
  PayNormal:=GetNormalBase(empid, PayMon, PstCode,EduCode,EmpInDate,SalBaseLvl,false);//�������~��
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
  Result:=(NormalDays/26)*PayNormal+(TestDays/26)*PayTest;
end;

{function TFormSal08.GetNormalBase(PstCode,EduCode:String;EmpInDate:TDateTime):Currency;
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
function TFormFhrd403.GetSpcGong(EmpId,PayMon:String;WorkDays:Integer):TSpcGongCurrs;
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
function  TFormFhrd403.CheckHasPicc(EmpId,PayMon:String):Boolean;
var
  PayNormal:Currency;
  sqlstr:string;
  ADate:TDatetime;
begin
  ADate:=EncodeDate(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)),1);
  ADate:=EndOfTheMonth(ADate);
  //�����¾����O�I
  //PayNormal:=StrToFloat(SalBaseLvl.Strings[SalBaseLvl.IndexOf(PstCode)+1]);
  sqlstr:='SELECT * FROM hrd_picc A,hrd_emp B WHERE A.emp_id=B.emp_id'
    +' and A.emp_id='''+EmpId+''' AND A.picc_mon<='''+PayMon+''' and insu_cod=''1'''
    +' and (B.epledt is null or B.epledt>'''+FormatDateTime('yyyy/mm/dd',ADate)+''')';
  if CheckRecordExist(sqlstr) then
    Result:=true
  else
    Result:=false;
end;
{===============================================================================
  Name:GetLanuPay(EmpId,PayMon:String):Currency;
  �o�줽�ζO
===============================================================================}
function TFormFhrd403.GetLanuPay(EmpId,PayMon:String):Currency;
begin
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_lanu WHERE emp_id='''+EmpId+''' AND lanu_date<='''+PayMon+'''');
    Open;
    if not Eof then
      Result:=LANU_PAY
    else
      Result:=0;
    Close;
  end;
end;
{===============================================================================
  Name:GetMultPay(EmpId,PayMon:String):Currency;
  �o��h�u����
===============================================================================}
function TFormFhrd403.GetMultPay(EmpId,PayMon:String):Currency;
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
function TFormFhrd403.GetBuFaKou(EmpId,PayMon,BuType:String):Currency;
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
        //if FieldByName('al_money').AsString='1' then//�ɵo
          RetCur:=RetCur+FieldByName('al_money').AsCurrency;
        //if FieldByName('al_money').AsString='2' then//�ɦ�
        //  RetCur:=RetCur-FieldByName('al_money').AsCurrency;
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
  GetDutyPay():Currency -- �o��¾�Ȭz�K
===============================================================================}
{function TFormSal08.GetDutyPay(EmpId,PayMon,PstCode:String;PstPay:Currency;WorkDays:Integer):Currency;
var
  WorkSal,              //�u�ظɶK
  OfrPay,OfrPay1,OfrPay2:Currency;
  aSQL:String;
  ValidDay,FirstDay,SecondDay,EDay,SDay,DayCount,DayLeft:Integer;
begin
  OfrPay:=0;
  if PstCode='60' then //1,�@�~��
  begin//�ݥ[�W�ͮĤ��
    aSQL:='SELECT * FROM hrd_wrkpay A,hrd_wrkpart B,hrd_wrkpay_grad C'
      +' WHERE A.part_code=B.part_code and B.part_grad=C.grad_code'
      +' and emp_id='''+EmpId+''' AND wrk_mon='''+PayMon+''''
      +' and valid_date is not null';
    with qry_temp do
    begin
      Close;
      SQL.Clear;
      SQL.Add(aSQL);
      Open;
      if (not Eof) then
      begin
        WorkSal:=FieldByName('grad_money').AsCurrency;
        OfrPay:=Int((WorkDays/26)*WorkSal);
      end
      else
        OfrPay:=0;
      Close;
    end;
  end
  //2
  else if (PstCode='28') or (PstCode='33') or (PstCode='41') or (PstCode='42') or (PstCode='46') or (PstCode='50') then
  begin }
{    aSQL:='SELECT pst_pay FROM hrd_saltran WHERE emp_id='''+EmpId+
      ''' AND valid_date=(SELECT MAX(valid_date) FROM hrd_saltran WHERE valid_date<'''+
      FormatDateTime('yyyy/mm/dd',MonSDate)+''' AND emp_id='''+EmpId+''' order BY valid_date desc)';
}{    aSQL:='SELECT * FROM hrd_saltran WHERE emp_id='''+EmpId+
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
          Next;//���L��뤧���¾������
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
      end;}
{      if not Eof then
        try
          OfrPay1:=FieldByName('pst_pay').AsCurrency;
        except
          OfrPay1:=0;
        end
      else
        OfrPay1:=0;}
{      Close;
    end;
    aSQL:='SELECT pst_pay,valid_date FROM hrd_saltran WHERE emp_id='''+EmpId+''''+
      ' AND Year(valid_date)='+LeftStr(PayMon,4)+' AND Month(valid_date)='+IntToStr(StrToInt(RightStr(PayMon,2)))
      +'  order by valid_date desc'; }
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
{  end
  //3
  else begin
    OfrPay:=Int((WorkDays/26)*PstPay);
  end;
  Result:=OfrPay;
end;             }

{===============================================================================
  ��ƦW��:GetGrad(GradStr:String):Currency -- �o�� ¾�ȵ����B
  ��J�Ѽ�:GradStr -- eg. 0102 0504
===============================================================================}
{function TFormSal08.GetGrad(GradStr,PstCode:String;WorkDays:Integer):Currency;
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
end;}
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
  �p����u�@�Ѽ�
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
      WorkDays:=26-(TheInDay-SunDays);
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
  Result:=WorkDays;
end;
{===============================================================================
  �p����եδ��O�����u��Ѽ�
===============================================================================}
function GetNormalTestDays(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime):TNormalTestDays;
var
  NormalTestDays:TNormalTestDays;
  CurServerDateTime:TDateTime;  //�A�Ⱦ��W��e�ɶ�
  HaveInMonths,                 //�p���~�ꪺ�����u�w�i�t���
  TheInDay,                     //���u�i�t��
  TheLvDay,                     //���u��¾��
  WorkDays,                     //����u�@�Ѽ�
  TestDays,                     //�եδ��u�@�Ѽ�
  NormalDays,                   //�եδ����u�@�Ѽ�
  SunDayCount,                  //�P���Ѽ�
  TheMaxDay:Integer;            //�~��p����Ѽ�
begin
  //���A�Ⱦ���e�ɶ�
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
      TestDays:=26-(TheInDay-SundayCount);
      NormalDays:=0;
    end
    else begin//���Y��¾
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
  �P�_���u�O�_���s�i���u(�p��O�I���٥�)(�����¾�L)
===============================================================================}
function TFormFhrd403.IsNewEmp(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDate):Boolean;
var
  HaveInMonths:Integer;
begin
  if PayMon=FormatDateTime('yyyymm',EmpLvDate) then
  begin//(�����¾�L�O�I����)
    Result:=false;
    exit;
  end;
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
                   4-���Ҭz�K 5-¾�����B 6-�S�O����
===============================================================================}
function TFormFhrd403.GetSalTran(EmpId,PayMon,PstCode,EduCode:String;WorkDays:Integer;
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
        Next;//���L��뤧���¾������
      Pst_Code:=FieldByName('pst_code').AsString;
      SDay:=DayOf(FieldByName('valid_date').AsDateTime);
      if DateOf(FieldByName('valid_date').AsDateTime)<DateOf(MonSDate) then
        SDay:=1;//�W���¾�������]�m�_�l�����1
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
  result[0]:=sal_base;
  result[1]:=sal_mgmt;
  result[2]:=sal_tech;
  result[3]:=pst_pay;
  result[4]:=0;//envir_pay;(���Ҭz�K����)
  result[5]:=grade_pay;
  result[6]:=sal_spec;//�S�O����
//  result[7]:=pst_code;
end;

function TFormFhrd403.GetWrkPay(EmpId,PayMon:String):Currency;
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
      6-���u���� 7-�`�A�u�� 8-���`�[�Z�� 9-�P���[�Z�� 10-�`���[�Z�� 11-�p�ɳ��
      12-1.5�[�Z��� 13-2�[�Z��� 14-3�[�Z��� 15-��즭�h����
===============================================================================}
function TFormFhrd403.GetDut(EmpId,PayMon:String;EmpInDate,EmpLvDate:TDateTime;
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
  Hours_13:Extended;    //�m�u,�Шư�, �ɶK�f��, �L�~���˰�, �ͨ|��
  MonthFirstDate,aDate:TDateTime;
  ClasCode:String;
  Value2:Extended;
  StaffNatuPrice,       //���`�[�Z���
  StaffPeriPrice,       //�P���[�Z���
  StaffHoliPrice,       //�`���[�Z���
  StaffNighPrice,       //�]�Z�z�K���
  StaffSickPrice,       //�f���ɶK���
  AskLeavPrice:Currency;//�а����ڳ��
  RetArr:TDutCurrs;     //��^��
begin
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
  if (EmpLvDate<>0) and (EmpLvDate<=MonEDate) then//�����¾
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
  RetArr[0]:=0;                  //�뭹�O
  RetArr[1]:=0;                  //���Լ�
  RetArr[2]:=0;                  //�[�Z�O
  RetArr[3]:=0;                  //�]�Z�z�K
  RetArr[4]:=0;                  //�а�����
  RetArr[5]:=0;                  //�f���ɶK
  RetArr[6]:=0;                  //���u����
  RetArr[7]:=0;                  //
  RetArr[8]:=0;                  //
  RetArr[9]:=0;                  //
  RetArr[10]:=0;                  //
  RetArr[11]:=0;                  //
  RetArr[12]:=0;                  //
  RetArr[13]:=0;                  //
  RetArr[14]:=0;                  //
  RetArr[15]:=0;                  //
  {for i:=0 to Length(RetArr) do
  begin
    RetArr[i]:=0;
  end;}
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
        //06-�m�u 08-���� 09-��|�� 10-�@��f�� 12-�ư� 13-�B�� 14-��a 15-���~���˰� 16-�~�� �P�����p�J
        if ((ClasCode='06') or (ClasCode='08') or (ClasCode='09') or (ClasCode='10') or (ClasCode='12') or
           (ClasCode='13') or (ClasCode='14') or (ClasCode='15') or (ClasCode='16')) and
           (DayOf(aDate)<>1) then //�o�䦳���D�A�n��A�������@�w�N���P���ѡA�k�w����]�n��W
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
        else begin
          ClasHours:=ClasHours+Value2;
          if Value2>0 then
            WorkDays:=WorkDays+1;
        end;
      end;//for

      if (ClasCode='61') or (ClasCode='62') then   //�`�A�u��
      begin
        Hours_1:=Hours_1+ClasHours;
        RetArr[0]:=RetArr[0]+WORK_DAY_MEAL_PAY*WorkDays; //�뭹�O
      end
      else if ClasCode='63' then                   //�]�Z�u��
      begin
        Hours_1:=Hours_1+ClasHours;
        Hours_2:=Hours_2+ClasHours;
      end
      else if (ClasCode='65') or (ClasCode='66') or (ClasCode='67') or(ClasCode='68') or(ClasCode='80') or (ClasCode='90') then
        Hours_3:=Hours_3+ClasHours            //���`�[�Z
      else if (ClasCode='69') or (ClasCode='82') or (ClasCode='92') then
        Hours_4:=Hours_4+ClasHours            //�P���[�Z
      else if (ClasCode='72') or (ClasCode='85') or (ClasCode='95') then
        Hours_5:=Hours_5+ClasHours            //�`����[�Z
      else if  (ClasCode='09') or (ClasCode='10') then
        Hours_6:=Hours_6+ClasHours            //�@��f��
      else if (ClasCode='07') or (ClasCode='08') or (ClasCode='13') or (ClasCode='14') or (ClasCode='16') then
        Hours_7:=Hours_7+ClasHours            //���~��
      else if ClasCode='11' then
        Hours_1:=Hours_1+ClasHours            //����
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
      else if (ClasCode='06')or(ClasCode='12')or(ClasCode='20')or(ClasCode='21')or(ClasCode='25') then
        Hours_13:=Hours_13+ClasHours;        //�m�u,�Шư�, �ɶK�f��, �L�~���˰�, �ͨ|��
      Next;
    end;//while
  end;//with
  // �s�i,��¾���u�L���Լ�
  if (EmpInDate>=MonthFirstDate) or ((EmpLvDate<>0) and (EmpLvDate<=MonEDate)) then
    RetArr[1]:=0
  else
    RetArr[1]:=60000;
  // ���Լ� ��즭�h���W�L6�Ӥp�ɤ@�Ӥp�ɦ�10000
  if Hours_9<7 then
  begin
    RetArr[1]:=RetArr[1]-Hours_9*10000;
    RetArr[1]:=RetArr[1]-Hours_13*10000;
    RetArr[1]:=RetArr[1]-Hours_6*10000;
    if RetArr[1]<0 then RetArr[1]:=0;
  end
  else
    RetArr[1]:=0;
  StaffNatuPrice:=(SalBasePay/AWorkDays/8)*1.5; //���`�[�Z���
  StaffPeriPrice:=(SalBasePay/AWorkDays/8)*2.0; //�P���[�Z���
  StaffHoliPrice:=(SalBasePay/AWorkDays/8)*3.0; //�`���[�Z���
  StaffNighPrice:=(SalBasePay/AWorkDays/8)*0.3; //�]�Z�z�K���
  StaffSickPrice:=(ABasePay/AWorkDays/8)*0.5;   //�f���ɶK���
  AskLeavPrice  :=SalBasePay/AWorkDays/8;       //�а����ڳ��

  ASpcOver:=GetSpcOver(EmpId,PayMon);//��p�S��[�Z
  hours_3:=hours_3+ASpcOver[0];
  hours_4:=hours_4+ASpcOver[1];
  hours_5:=hours_5+ASpcOver[2];

  Hours_6:=min(Hours_6,208);
  Hours_13:=min(Hours_13,208);
  //�p��[�Z�O
  RetArr[2]:=Hours_3*StaffNatuPrice+Hours_4*StaffPeriPrice+StaffHoliPrice*Hours_5;
  //�p��]�Z�z�K
  RetArr[3]:=(NightDays+Hours_2)*StaffNighPrice+NightDays*SalBasePay/208;
  //�p��а����ڡ]�]�A�S�O�����O�\�Z����+�@��f�����ڡ^
  RetArr[4]:=Hours_13*(AskLeavPrice+GongSpcPay/208)+Hours_6*AskLeavPrice;
  RetArr[5]:=Hours_6*StaffSickPrice;//�f���ɶK
  RetArr[6]:=(Hours_11+Hours_12/2)/208*DutyPay;//���u����
  RetArr[7]:=Hours_1;                  //�`�A�u��
  RetArr[8]:=Hours_3;                  //���`�[�Z
  RetArr[9]:=Hours_4;                  //�P���[�Z
  RetArr[10]:=Hours_5;                  //�`���[�Z
  RetArr[11]:=Hours_5;                  //�p�ɳ��
  RetArr[12]:=StaffNatuPrice;                  //���`�[�Z���
  RetArr[13]:=StaffPeriPrice;                  //�P���[�Z���
  RetArr[14]:=StaffHoliPrice;                  //�`���[�Z���
  Result:=RetArr;
end;

procedure TFormFhrd403.tbb_okClick(Sender: TObject);
begin
  sel_month.Enabled := false;
  trb_id.Enabled := true;
  trb_dept.Enabled := true;
  tbb_search.Enabled := true;
  tbb_ok.Enabled := false;
end;

procedure TFormFhrd403.pc_prvChange(Sender: TObject);
begin
  //ComEnable;
end;

procedure TFormFhrd403.tbb_searchClick(Sender: TObject);
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

procedure TFormFhrd403.tbb_resetClick(Sender: TObject);
begin
  adoquery1.Close;
  tbb_ok.Enabled := true;
end;

procedure TFormFhrd403.sb_EmpBeg2Click(Sender: TObject);
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

procedure TFormFhrd403.N1Click(Sender: TObject);
begin
  re_Message.Clear;
end;

//���o�Ҧ����~��,¾��������B
{procedure TFormSal08.GetAllBaseLvl;
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

{----------------------�p��S��[�Z�ɶ�-----------------------------
SpcOver[0]-���`�[�Z�FSpcOver[1]-�P���[�Z�FSpcOver[2]-�`���[�Z
--------------------------------------------------------------------}
function  TFormFhrd403.GetSpcOver(EmpId,PayMon:String):TSpcOver;
var
  sql_str,ClasCode:string;
  time0,time1,time2:double;
begin
  time0:=0;
  time1:=0;
  time2:=0;
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
      else if (ClasCode='69') or (ClasCode='82') or (ClasCode='92') then
        time1:=time1+FieldByName('tot_hour').AsFloat       //�P���[�Z
      else if (ClasCode='72') or (ClasCode='85') or (ClasCode='95') then
        time2:=time2+FieldByName('tot_hour').AsFloat;       //�`����[�Z
      Next;
    end;
    close;
  end;
  result[0]:=time0;
  result[1]:=time1;
  result[2]:=time2;
end;

//�p��ӤH�ұo�|
function  TFormFhrd403.GetSalTax(SalTot:Double):Double;
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
end;

end.
