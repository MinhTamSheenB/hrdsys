{*************************************************************************
Name：Sal08
修改部門sql語句
update hrd_sal_paymt set dept_code=A.dept_old from hrd_emp_upd A,hrd_sal_paymt B
where A.id in (select min(id) from hrd_emp_upd
where up_date>='2006/09/01' and dept_old<>dept_new group by emp_id)
and A.emp_id=B.emp_id and pay_mon='200608' and B.dept_code<>A.dept_old
//月底鞋廠化工區分
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
  WORK_DAY_MEAL_PAY=800;//每工作天伙食費
  LANU_PAY=5000;        //公團費
  PERCENT_PICC_SHE=0.05;  //社保 5%
  PERCENT_PICC_YI =0.01;  //醫保 1%
  PERCENT_PICC_BACK=0.17;//保險返還 17%

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
   SalBaseLvl:TStrings;//基本薪資等級額
   AEmpId,PayMon:String;
   MonSDate,MonEDate:TDatetime;

{$R *.dfm}
{設置狀態 ActNo 為0 設置查詢 ActNo 為1 設置轉檔}
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
  //定義要用到的語言
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
{初始化信息}
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
  SalBaseLvl:=GetAllBaseLvl;//取得所有基本薪資等級額
end;
{===============================================================================
  計算薪資確認
===============================================================================}
procedure TFormFhrd403.bbtn_OK2Click(Sender: TObject);
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
      WideShowMessage('查尋範圍內無資料存在');
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
{轉檔月份重置}
procedure TFormFhrd403.bbtn_Reset2Click(Sender: TObject);
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
  計算薪資xian程
===============================================================================}
procedure TRunThread.Execute;
var
  FormFhrd403:TformFhrd403;
  MonthFirstDay:TDateTime; //計算月份的第一天
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
        //進程結束，退出
        //dmhrdsys.conn.RollbackTrans;
        FormFhrd403.SetEnableControl(1,true);
        ChangeSalDept(payMon);//修正部門等信息
        Exit;
      end;
      aEmpId:=FieldByName('emp_id').AsString;
//      dept_code:=FieldByName('dept_code').AsString;
      SetProcessBar(false,1);
      SetStatusText('當前第'+IntToStr(Recno)+'/'+IntToStr(RecordCount)+'筆');
      { 處理一個員工的資料 }
      //刪除該員工本月薪資
      if ( (FieldByName('epledt').AsString<>'') and (FieldByName('epledt').AsDateTime<=MonthFirstDay)) //本月前離職不處理
        or ( (FieldByName('epledt').AsString<>'') and (FieldByName('epledt').AsDateTime<=FieldByName('epindt').AsDateTime)) then //離職日期小於進廠日期不處理
      begin
        try
          FormFhrd403.DelPayMT(aEmpId,PayMon);
        except
          //DMHrdsys.conn.RollbackTrans;
        end;
      end
      else
        try
          {計算該員工本月薪資}
          FormFhrd403.DealAEmp(aEmpId,PayMon);
        except
          //DMHrdsys.conn.RollbackTrans;
        end;
      Next;
    end;
  end;
  //DMHrdsys.conn.CommitTrans;
  ChangeSalDept(payMon);//修正部門等信息
  SetProcessBar(true);
  SetStatusText('轉檔完畢！');
  FormFhrd403.re_Message.Lines.Add('轉檔完畢！');
  FormFhrd403.SetEnableControl(1,true);
end;
{===============================================================================
  procedure DelPayMT(EmpId,PayMon:String);
  刪除員工薪資主檔紀錄
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
  計算一個員工的薪資
===============================================================================}
procedure TFormFhrd403.DealAEmp(EmpId,PayMon:String);
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
  EduCode:String;                      //學歷代號
  CurDateTime,
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
  F_OtherPay,                          //其他補貼    have done(已停)
  F_OtherTemp,                         //臨時項    have done
  F_EfftPay,                           //效率獎金    (已停)
  F_SpcPay,                            //特別津貼    have done
  F_GongPay,                           //功績獎金    have done
  F_DuoPay,                            //多工獎金    have done
  F_NoLeavePay,                        //全勤獎      have done
  F_OverPay,                           //加班費      have done
  F_NightPay,                          //夜班津貼    have done
  F_SuppAgaiPay,                       //上月補發    have done
  F_SickPay,                           //病假補貼(保險公司)    have done
  F_SickPay2,                           //病假補貼(公司)    have done
  F_PiccBackPay,                       //保險返還    have done
  F_DealPay,                           //應發薪資    have done
  F_MealCost,                          //伙食費      have done
  F_AskCost,                           //請假扣款    have done
  F_StopCost,                          //停工扣款    have done
  F_PiccSheCost,                       //社會保險    have done
  F_PiccYiCost,                        //醫療保險    have done
  F_LaunCost,                          //工團費      have done
  F_TaxCost,                           //個人所得稅  have done
  F_SupDeduCost,                       //上月補扣    have done
  F_RealPay:Currency;                  //實發薪資    have done
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
  WorkDays:=GetWorkDays(PayMon,EmpInDate,EmpLvDate);    //本月工作天數

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

      F_EnvrPay:=ASalGrads[4];                 //5,環境津貼(刪)
      //F_GradPay:=GetGrad(FieldByName('sal_grade').AsString,PstCode,WorkDays);
      F_GradPay:=ASalGrads[5];                 //6,職務等級額
      F_OtherPay:=0;//ASalGrads[6];                //5,其他補貼(刪)
      F_SpcPay:=ASalGrads[6];                                //7-特別獎金
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
  //基薪總額（算單價時用）
  if PstCode='60' then
    //作業員，基薪總額為基本工資+工種補貼
    SalBase:=F_BasePay+F_DutyPay
  else
    //非作業員，基薪總額為 基本工資+主管加給+職務津貼+專業津貼+職務等級額
    SalBase:=F_BasePay+F_MgmtPay+F_DutyPay+F_TechPay+F_GradPay;
  aSpcGong:=GetSpcGong(EmpId,PayMon,WorkDays);          //計算功績獎金、特別獎金
  //F_SpcPay:=aSpcGong[0];                                //7-特別獎金
  F_GongPay:=aSpcGong[1];                               //8-功績獎金
  F_DuoPay:=GetMultPay(EmpId,PayMon);                   //9-多工獎金
  aDutCurrs:=GetDut(EmpId,PayMon,EmpInDate,EmpLvDate,SalBase,F_BasePay,F_DutyPay,F_SpcPay+F_GongPay,WorkDays);
  F_MealCost:=aDutCurrs[0];                             //10-伙食費
  F_NoLeavePay:=aDutCurrs[1];                           //11-全勤獎
  F_OverPay:=aDutCurrs[2];                              //12-加班費
  F_NightPay:=aDutCurrs[3];                             //13-夜班津貼
  F_AskCost:=aDutCurrs[4];                              //14-請假扣款
  F_SickPay:=GetSalBaoBu(EmpId,PayMon);                 //15-病假補貼(保險公司補)
  F_SickPay2:=aDutCurrs[5];                             //15-病假補貼(公司補)
  F_StopCost:=aDutCurrs[6];                             //16-停工扣款
  F_SuppAgaiPay:=GetBuFaKou(EmpId,PayMon,'1');          //17-補發金額
  if IsNewEmp(EmpId,PayMon,PstCode,EmpInDate,EmpLvDate) then      //判斷該員工是否為新進員工
    F_PiccBackPay:=F_BasePay*PERCENT_PICC_BACK          //18-保險返還(新進員工有)
  else
    F_PiccBackPay:=0;
  //if CheckRecordExist('SELECT * FROM hrd_picc WHERE emp_id='''+EmpId+''' AND picc_mon<='''+PayMon+''' and insu_cod<>''9''') then
  if CheckHasPicc(EmpId,PayMon) then
    PiccPay:=GetNormalBase(empid, PayMon, PstCode,EduCode,EmpInDate,SalBaseLvl,false)//F_BasePay
  else                                                  //保險基數
    PiccPay:=0;//CheckHasPicc(EmpId,PayMon,PstCode);
  F_PiccSheCost:=PiccPay*PERCENT_PICC_SHE;              //19-社會保險
  F_PiccYiCost:=PiccPay*PERCENT_PICC_YI;                //20-醫療保險
  F_EfftPay:=0;                                         //21-效率獎金(刪)
  F_SupDeduCost:=GetBuFaKou(EmpId,PayMon,'2');          //22-上月補扣
  F_OtherPay:=0;                                        //23-其他補貼(刪)
  F_LaunCost:=GetLanuPay(EmpId,PayMon);                 //24-工團費
  F_OtherTemp:=0;                                       //23-臨時金額
  if (RightStr(PayMon,2)='09') and (InfoCode='0') then                         //(中秋禮金)
  begin
    aSQL:='select * from hrd_picc where insu_cod=''9'' and emp_id='''+EmpId+'''';
    if not CheckRecordExist(aSQL) then
      F_OtherTemp:=F_OtherTemp+20000;
  end;
                                                        //26-應發薪資
  F_DealPay:=F_BasePay+F_MgmtPay+F_TechPay+F_DutyPay+F_EnvrPay+F_GradPay
    +F_EfftPay+F_SpcPay+F_DuoPay+F_NoLeavePay+F_OverPay+F_NightPay+F_GongPay
    +F_SuppAgaiPay+F_PiccBackPay+F_SickPay+F_SickPay2+F_OtherPay+F_OtherTemp;
  F_RealPay:=F_DealPay-F_MealCost-F_AskCost-F_StopCost-F_PiccSheCost-F_PiccYiCost-
      F_LaunCost-F_SupDeduCost;
  F_TaxCost:=GetSalTax(F_RealPay);                     //25-個人所得稅
  F_RealPay:=F_RealPay-F_TaxCost;                      //27-實發薪資
  if F_RealPay<0 then
  begin
    F_RealPay:=0;
    re_Message.Lines.Add('員工'+EmpId+' 的實發薪資小于零！請重新計算！');
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
  函數名稱:GetBase  -- 計算員工基本工資
  參數:    EmpId -- 員工工號  PayMon  -- 工資月份 PstCode -- 職稱
           EmpInDate -- 進廠日期  EmpLvDate -- 離職日期
===============================================================================}
function TFormFhrd403.GetBase(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime;EduCode:string=''):Currency;
var
  PayNormal,PayTest:Currency;
  NormalTestDays:TNormalTestDays;
  NormalDays,TestDays,edu_no:Integer;
begin
  PayTest:=StrToFloat(SalBaseLvl.Strings[1]);//試用期薪資
  PayNormal:=GetNormalBase(empid, PayMon, PstCode,EduCode,EmpInDate,SalBaseLvl,false);//正式基本薪資
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
  Result:=(NormalDays/26)*PayNormal+(TestDays/26)*PayTest;
end;

{function TFormSal08.GetNormalBase(PstCode,EduCode:String;EmpInDate:TDateTime):Currency;
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
function  TFormFhrd403.CheckHasPicc(EmpId,PayMon:String):Boolean;
var
  PayNormal:Currency;
  sqlstr:string;
  ADate:TDatetime;
begin
  ADate:=EncodeDate(StrToInt(LeftStr(PayMon,4)),StrToInt(RightStr(PayMon,2)),1);
  ADate:=EndOfTheMonth(ADate);
  //當月離職不交保險
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
  得到公團費
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
  得到多工獎金
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
  得到上月補發補扣
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
  if BuType='1' then //補發
    aSQL:=aSQL+' AND al_type=''1'''
  else if BuType='2' then  //扣款
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
        //if FieldByName('al_money').AsString='1' then//補發
          RetCur:=RetCur+FieldByName('al_money').AsCurrency;
        //if FieldByName('al_money').AsString='2' then//補扣
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
  GetDutyPay():Currency -- 得到職務津貼
===============================================================================}
{function TFormSal08.GetDutyPay(EmpId,PayMon,PstCode:String;PstPay:Currency;WorkDays:Integer):Currency;
var
  WorkSal,              //工種補貼
  OfrPay,OfrPay1,OfrPay2:Currency;
  aSQL:String;
  ValidDay,FirstDay,SecondDay,EDay,SDay,DayCount,DayLeft:Integer;
begin
  OfrPay:=0;
  if PstCode='60' then //1,作業員
  begin//待加上生效日期
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
        FirstDay:=ValidDay-GetSunDayCount(1,ValidDay,PayMon);  //本月調薪前工作天數
        SecondDay:=WorkDays-FirstDay;                          //本月調薪后工作天數
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
  函數名稱:GetGrad(GradStr:String):Currency -- 得到 職務等級額
  輸入參數:GradStr -- eg. 0102 0504
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
      TestDays:=26-(TheInDay-SundayCount);
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
  判斷員工是否為新進員工(計算保險返還用)(當月離職無)
===============================================================================}
function TFormFhrd403.IsNewEmp(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDate):Boolean;
var
  HaveInMonths:Integer;
begin
  if PayMon=FormatDateTime('yyyymm',EmpLvDate) then
  begin//(當月離職無保險返還)
    Result:=false;
    exit;
  end;
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
                   4-環境津貼 5-職等金額 6-特別獎金
===============================================================================}
function TFormFhrd403.GetSalTran(EmpId,PayMon,PstCode,EduCode:String;WorkDays:Integer;
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
  result[0]:=sal_base;
  result[1]:=sal_mgmt;
  result[2]:=sal_tech;
  result[3]:=pst_pay;
  result[4]:=0;//envir_pay;(環境津貼忽略)
  result[5]:=grade_pay;
  result[6]:=sal_spec;//特別獎金
//  result[7]:=pst_code;
end;

function TFormFhrd403.GetWrkPay(EmpId,PayMon:String):Currency;
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
      6-停工扣款 7-常態工時 8-平常加班時 9-周末加班時 10-節假加班時 11-小時單價
      12-1.5加班單價 13-2加班單價 14-3加班單價 15-遲到早退次數
===============================================================================}
function TFormFhrd403.GetDut(EmpId,PayMon:String;EmpInDate,EmpLvDate:TDateTime;
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
  Hours_13:Extended;    //曠工,請事假, 補貼病假, 無薪公傷假, 生育假
  MonthFirstDate,aDate:TDateTime;
  ClasCode:String;
  Value2:Extended;
  StaffNatuPrice,       //平常加班單價
  StaffPeriPrice,       //周末加班單價
  StaffHoliPrice,       //節假加班單價
  StaffNighPrice,       //夜班津貼單價
  StaffSickPrice,       //病假補貼單價
  AskLeavPrice:Currency;//請假扣款單價
  RetArr:TDutCurrs;     //返回值
begin
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
  RetArr[0]:=0;                  //伙食費
  RetArr[1]:=0;                  //全勤獎
  RetArr[2]:=0;                  //加班費
  RetArr[3]:=0;                  //夜班津貼
  RetArr[4]:=0;                  //請假扣款
  RetArr[5]:=0;                  //病假補貼
  RetArr[6]:=0;                  //停工扣款
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
           (ClasCode='13') or (ClasCode='14') or (ClasCode='15') or (ClasCode='16')) and
           (DayOf(aDate)<>1) then //這邊有問題，要改，假期不一定就為星期天，法定假日也要算上
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

      if (ClasCode='61') or (ClasCode='62') then   //常態工時
      begin
        Hours_1:=Hours_1+ClasHours;
        RetArr[0]:=RetArr[0]+WORK_DAY_MEAL_PAY*WorkDays; //伙食費
      end
      else if ClasCode='63' then                   //夜班工時
      begin
        Hours_1:=Hours_1+ClasHours;
        Hours_2:=Hours_2+ClasHours;
      end
      else if (ClasCode='65') or (ClasCode='66') or (ClasCode='67') or(ClasCode='68') or(ClasCode='80') or (ClasCode='90') then
        Hours_3:=Hours_3+ClasHours            //平常加班
      else if (ClasCode='69') or (ClasCode='82') or (ClasCode='92') then
        Hours_4:=Hours_4+ClasHours            //周末加班
      else if (ClasCode='72') or (ClasCode='85') or (ClasCode='95') then
        Hours_5:=Hours_5+ClasHours            //節假日加班
      else if  (ClasCode='09') or (ClasCode='10') then
        Hours_6:=Hours_6+ClasHours            //一般病假
      else if (ClasCode='07') or (ClasCode='08') or (ClasCode='13') or (ClasCode='14') or (ClasCode='16') then
        Hours_7:=Hours_7+ClasHours            //有薪假
      else if ClasCode='11' then
        Hours_1:=Hours_1+ClasHours            //產假
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
      else if (ClasCode='06')or(ClasCode='12')or(ClasCode='20')or(ClasCode='21')or(ClasCode='25') then
        Hours_13:=Hours_13+ClasHours;        //曠工,請事假, 補貼病假, 無薪公傷假, 生育假
      Next;
    end;//while
  end;//with
  // 新進,離職員工無全勤獎
  if (EmpInDate>=MonthFirstDate) or ((EmpLvDate<>0) and (EmpLvDate<=MonEDate)) then
    RetArr[1]:=0
  else
    RetArr[1]:=60000;
  // 全勤獎 遲到早退不超過6個小時一個小時扣10000
  if Hours_9<7 then
  begin
    RetArr[1]:=RetArr[1]-Hours_9*10000;
    RetArr[1]:=RetArr[1]-Hours_13*10000;
    RetArr[1]:=RetArr[1]-Hours_6*10000;
    if RetArr[1]<0 then RetArr[1]:=0;
  end
  else
    RetArr[1]:=0;
  StaffNatuPrice:=(SalBasePay/AWorkDays/8)*1.5; //平常加班單價
  StaffPeriPrice:=(SalBasePay/AWorkDays/8)*2.0; //周末加班單價
  StaffHoliPrice:=(SalBasePay/AWorkDays/8)*3.0; //節假加班單價
  StaffNighPrice:=(SalBasePay/AWorkDays/8)*0.3; //夜班津貼單價
  StaffSickPrice:=(ABasePay/AWorkDays/8)*0.5;   //病假補貼單價
  AskLeavPrice  :=SalBasePay/AWorkDays/8;       //請假扣款單價

  ASpcOver:=GetSpcOver(EmpId,PayMon);//纍計特殊加班
  hours_3:=hours_3+ASpcOver[0];
  hours_4:=hours_4+ASpcOver[1];
  hours_5:=hours_5+ASpcOver[2];

  Hours_6:=min(Hours_6,208);
  Hours_13:=min(Hours_13,208);
  //計算加班費
  RetArr[2]:=Hours_3*StaffNatuPrice+Hours_4*StaffPeriPrice+StaffHoliPrice*Hours_5;
  //計算夜班津貼
  RetArr[3]:=(NightDays+Hours_2)*StaffNighPrice+NightDays*SalBasePay/208;
  //計算請假扣款（包括特別獎金与功績獎金+一般病假扣款）
  RetArr[4]:=Hours_13*(AskLeavPrice+GongSpcPay/208)+Hours_6*AskLeavPrice;
  RetArr[5]:=Hours_6*StaffSickPrice;//病假補貼
  RetArr[6]:=(Hours_11+Hours_12/2)/208*DutyPay;//停工扣款
  RetArr[7]:=Hours_1;                  //常態工時
  RetArr[8]:=Hours_3;                  //平常加班
  RetArr[9]:=Hours_4;                  //周末加班
  RetArr[10]:=Hours_5;                  //節假加班
  RetArr[11]:=Hours_5;                  //小時單價
  RetArr[12]:=StaffNatuPrice;                  //平常加班單價
  RetArr[13]:=StaffPeriPrice;                  //周末加班單價
  RetArr[14]:=StaffHoliPrice;                  //節假加班單價
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

//取得所有基本薪資,職位對應金額
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

{----------------------計算特殊加班時間-----------------------------
SpcOver[0]-平常加班；SpcOver[1]-周末加班；SpcOver[2]-節假加班
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
        time0:=time0+FieldByName('tot_hour').AsFloat       //平常加班
      else if (ClasCode='69') or (ClasCode='82') or (ClasCode='92') then
        time1:=time1+FieldByName('tot_hour').AsFloat       //周末加班
      else if (ClasCode='72') or (ClasCode='85') or (ClasCode='95') then
        time2:=time2+FieldByName('tot_hour').AsFloat;       //節假日加班
      Next;
    end;
    close;
  end;
  result[0]:=time0;
  result[1]:=time1;
  result[2]:=time2;
end;

//計算個人所得稅
function  TFormFhrd403.GetSalTax(SalTot:Double):Double;
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
end;

end.
