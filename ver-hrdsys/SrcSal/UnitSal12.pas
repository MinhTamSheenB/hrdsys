{*************************************************************************
Name：Sal12
Author: anil
Create date:2005-10-12
Modify date:2005-10-14
Commentate:薪資單/薪資表列印
*************************************************************************}
unit UnitSal12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils,math, ComObj, ExcelXP;

type
  TFormSal12 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PrintDialog1: TPrintDialog;
    ADOQuery2: TADOQuery;
    ADOQuery1emp_id: TStringField;
    ADOQuery1pay_mon: TStringField;
    ADOQuery1base_pay: TBCDField;
    ADOQuery1mgmt_ofr: TBCDField;
    ADOQuery1tech_ofr: TBCDField;
    ADOQuery1duty_ofr: TBCDField;
    ADOQuery1envr_ofr: TBCDField;
    ADOQuery1efft_awd: TBCDField;
    ADOQuery1te_pay: TBCDField;
    ADOQuery1full_awd: TBCDField;
    ADOQuery1gong_pay: TBCDField;
    ADOQuery1supp_agai: TBCDField;
    ADOQuery1picc_back: TBCDField;
    ADOQuery1sick_supp: TBCDField;
    ADOQuery1deal_pay: TBCDField;
    ADOQuery1meal_pay: TBCDField;
    ADOQuery1ask_pay: TBCDField;
    ADOQuery1stop_dedu: TBCDField;
    ADOQuery1picc_she: TBCDField;
    ADOQuery1picc_yi: TBCDField;
    ADOQuery1laun_pay: TBCDField;
    ADOQuery1tax_pay: TBCDField;
    ADOQuery1sup_dedu: TBCDField;
    ADOQuery1actu_pay: TBCDField;
    ADOQuery1salary: TBCDField;
    ADOQuery1curr_qty: TIntegerField;
    ADOQuery1sal50w: TIntegerField;
    ADOQuery1sal10w: TIntegerField;
    ADOQuery1sal5w: TIntegerField;
    ADOQuery1sal2w: TIntegerField;
    ADOQuery1sal1w: TIntegerField;
    ADOQuery1sal5s: TIntegerField;
    ADOQuery1sal2s: TIntegerField;
    ADOQuery1sal1s: TIntegerField;
    ADOQuery1sal5h: TIntegerField;
    ADOQuery1sal2h: TIntegerField;
    ADOQuery1emp_chs: TTntWideStringField;
    ADOQuery1name_vim: TTntWideStringField;
    ADOQuery1dept_abbr: TTntWideStringField;
    ADOQuery1pst_code: TStringField;
    ADOQuery1epindt: TDateField;
    ADOQuery1sal_total1: TCurrencyField;
    ADOQuery1sal_total2: TCurrencyField;
    ADOQuery1sal_total3: TCurrencyField;
    ADOQuery1hour_normal: TFloatField;
    ADOQuery1hour_price: TCurrencyField;
    Panel5: TPanel;
    Panel6: TPanel;
    TntDBGrid1: TTntDBGrid;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    edit_month: TMaskEdit;
    RbEmp: TTntRadioButton;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    RbDept: TTntRadioButton;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    ADOQuery1dept_code: TTntWideStringField;
    ADOQuery1hour_stop: TFloatField;
    ADOQuery1hour_sick: TFloatField;
    ADOQuery1hour_late: TFloatField;
    ADOQuery1hour_suff: TFloatField;
    ADOQuery1hour_overtotal: TFloatField;
    ADOQuery1hour_withsal: TFloatField;
    ADOQuery1stop_pay: TFloatField;
    ADOQuery1sal_night: TBCDField;
    ADOQuery1grad_ofr: TBCDField;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1emp_id: TStringField;
    ClientDataSet1emp_chs: TWideStringField;
    ClientDataSet1name_vim: TWideStringField;
    ClientDataSet1dept_code: TWideStringField;
    ClientDataSet1dept_abbr: TWideStringField;
    ClientDataSet1pst_code: TStringField;
    ClientDataSet1epindt: TDateField;
    ClientDataSet1pay_mon: TStringField;
    ClientDataSet1base_pay: TBCDField;
    ClientDataSet1hour_normal: TFloatField;
    ClientDataSet1duty_ofr: TBCDField;
    ClientDataSet1tech_ofr: TBCDField;
    ClientDataSet1mgmt_ofr: TBCDField;
    ClientDataSet1grad_ofr: TBCDField;
    ClientDataSet1stop_pay: TFloatField;
    ClientDataSet1sal_total1: TCurrencyField;
    ClientDataSet1full_awd: TBCDField;
    ClientDataSet1envr_ofr: TBCDField;
    ClientDataSet1efft_awd: TBCDField;
    ClientDataSet1te_pay: TBCDField;
    ClientDataSet1over_work: TBCDField;
    ClientDataSet1gong_pay: TBCDField;
    ClientDataSet1sal_night: TBCDField;
    ClientDataSet1picc_back: TBCDField;
    ClientDataSet1supp_agai: TBCDField;
    ClientDataSet1sick_supp: TBCDField;
    ClientDataSet1sal_total2: TCurrencyField;
    ClientDataSet1deal_pay: TBCDField;
    ClientDataSet1picc_she: TBCDField;
    ClientDataSet1picc_yi: TBCDField;
    ClientDataSet1laun_pay: TBCDField;
    ClientDataSet1tax_pay: TBCDField;
    ClientDataSet1ask_pay: TBCDField;
    ClientDataSet1sup_dedu: TBCDField;
    ClientDataSet1meal_pay: TBCDField;
    ClientDataSet1stop_dedu: TBCDField;
    ClientDataSet1sal_total3: TCurrencyField;
    ClientDataSet1actu_pay: TBCDField;
    ClientDataSet1salary: TBCDField;
    ClientDataSet1curr_qty: TIntegerField;
    ClientDataSet1sal50w: TIntegerField;
    ClientDataSet1sal10w: TIntegerField;
    ClientDataSet1sal5w: TIntegerField;
    ClientDataSet1sal2w: TIntegerField;
    ClientDataSet1sal1w: TIntegerField;
    ClientDataSet1sal5s: TIntegerField;
    ClientDataSet1sal2s: TIntegerField;
    ClientDataSet1sal1s: TIntegerField;
    ClientDataSet1sal5h: TIntegerField;
    ClientDataSet1sal2h: TIntegerField;
    ClientDataSet1hour_stop: TFloatField;
    ClientDataSet1hour_withsal: TFloatField;
    ClientDataSet1hour_sick: TFloatField;
    ClientDataSet1hour_suff: TFloatField;
    ClientDataSet1hour_late: TFloatField;
    ClientDataSet1hour_price: TCurrencyField;
    ClientDataSet1hour_over30: TFloatField;
    ClientDataSet1hour_over20: TFloatField;
    ClientDataSet1hour_over15: TFloatField;
    ClientDataSet1hour_overtotal: TFloatField;
    ADOQuery1info_code: TStringField;
    ADOQuery1stop_supp: TBCDField;
    ADOQuery1injury_supp: TBCDField;
    ADOQuery1salhol_supp: TBCDField;
    ADOQuery1othe_supp: TBCDField;
    ADOQuery1other_temp: TBCDField;
    ADOQuery1last_addition: TBCDField;
    ADOQuery1full_sal: TBCDField;
    ADOQuery1sal_sub: TBCDField;
    Button1: TButton;
    ADOQuery1picc_shiye: TFloatField;
    ClientDataSet1picc_shiye: TFloatField;
    ADOQuery1card_no: TTntStringField;
    ADOQuery1over15_hour: TFloatField;
    ADOQuery1over20_hour: TFloatField;
    ADOQuery1over30_hour: TFloatField;
    ADOQuery1over195_hour: TFloatField;
    ADOQuery1over15_price: TFloatField;
    ADOQuery1over20_price: TFloatField;
    ADOQuery1over30_price: TFloatField;
    ADOQuery1over195_price: TFloatField;
    ADOQuery1over15_sal: TFloatField;
    ADOQuery1over20_sal: TFloatField;
    ADOQuery1over30_sal: TFloatField;
    ADOQuery1over195_sal: TFloatField;
    ADOQuery1init_base_pay: TFloatField;
    ADOQuery1ovr_base_pay: TFloatField;
    ADOQuery1meal_sal: TFloatField;
    qry_prof: TADOQuery;
    ADOQuery1pst_name: TWideStringField;
    ADOQuery1yicard_dedu: TCurrencyField;
    chk_full_sal: TTntCheckBox;
    ADOQuery1night_time: TFloatField;
    ADOQuery1foster_pay: TCurrencyField;
    ADOQuery1epid_no: TStringField;
    ADOQuery1zhuishuo_BHXH: TBCDField;
    ADOQuery1leav_pay: TBCDField;
    BtnPrint: TTntBitBtn;
    BtnPreview: TTntButton;
    BtnQuery: TTntButton;
    TntPanel1: TTntPanel;
    Rb_direct: TTntRadioButton;
    Rb_bank: TTntRadioButton;
    rbAllWay: TTntRadioButton;
    TntPanel2: TTntPanel;
    RBAutoLeft: TTntRadioButton;
    RBNormalLeft: TTntRadioButton;
    RBInwork: TTntRadioButton;
    rbAllEmployee: TTntRadioButton;
    TntPanel3: TTntPanel;
    TntPanel4: TTntPanel;
    RBTable: TTntRadioButton;
    RBTip: TTntRadioButton;
    rd_adidas: TTntRadioButton;
    rd_mizuno: TTntRadioButton;
    chk_epledt: TTntCheckBox;
    dtp_epledt_bgn: TTntDateTimePicker;
    dtp_epledt_end: TTntDateTimePicker;
    ADOQuery1grad_money: TIntegerField;
    memVim: TTntMemo;
    ADOQuery1duoxiu_koukuan: TBCDField;
    cbChange: TTntCheckBox;
    Rb_SB: TTntRadioButton;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure SetPrintDataset;
    procedure PrintTip(PrintFlag:boolean);
    procedure GetDutTime(emp_id,dut_month:string;EmpInDate,EmpLvDate:TDateTime);
    function GetPstPay(pst_code:string;grad:string='1'):double;
    function GetWorkPay(emp_id,month:string):double;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure sb_FindEmpClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure BtnQueryClick(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure EditEmpBeginChange(Sender: TObject);
    procedure edit_monthChange(Sender: TObject);
  private
    //
    procedure ExportDataToExcel;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal12: TFormSal12;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12,UnitSal08;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
{$R *.dfm}

procedure TFormSal12.FormCreate(Sender: TObject);
var
  sql_str:string;
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'sal12');
  InitForm;// Init Form
  Application.CreateForm(TFormPrtSal12,FormPrtSal12);

  //取職務資料 2011-11-01 hyt add
  sql_str :='SELECT pst_code,(pst_chs+'' ''+pst_vim) as pst_name FROM dbo.hrd_prof ';
  with qry_prof do
  begin
      close;
      sql.Clear;
      sql.add(sql_str);
      open;
  end;
end;

procedure TFormSal12.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='sal10_titl,not_find_data,total,current_location,'
  +'while_printing,print_finish,print_muti_page_pre';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormSal12.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str:string;
begin
  sql_str:='select dept_code+'' ''+abbr_titl as dept_name,dept_code from hrd_dept where '+G_sFactorySql+' ';
  SetComboxList(sql_str,CobDeptBegin);
  SetComboxList(sql_str,CobDeptEnd);
  edit_month.Text:=formatdatetime('yyyymm',StartOfTheMonth(date)-10);
  dtp_epledt_bgn.Date := GetServerDateTime;
  dtp_epledt_end.Date := GetServerDateTime;
end;

procedure TFormSal12.SetPrintDataset;
//設置打印數據集
var
  sql_str,DateStr,sWhereFull_sal, sMonth:string;
  flds:TFields;
  ADate:TDateTime;
begin
  //
  sMonth := edit_month.Text;
  //
  ADate:=EnCodeDate(StrToInt(LeftStr(edit_month.Text,4)),StrToInt(RightStr(edit_month.Text,2)),1);
  ADate:=EndOfTheMonth(ADate);
  DateStr:=FormatDateTime('yyyy/mm/dd',ADate);
  //加職務(vim,cn):如作業員,滿試用期 hyt stop
  if chk_full_sal.Checked then //2012-03-02 hyt add
  begin
    sWhereFull_sal:=' and B.full_sal<=0 ';
  end
  else
  begin
    sWhereFull_sal:=' and A.actu_pay>0 and B.full_sal>0 ';
  end;
  //2010.02.27 << 添加銀行轉賬
  //if Rb_bank.Checked then//銀行轉賬
  if Rb_bank.Checked then   //銀行轉賬
    sql_str:='select A.dept_code,*,''zuo ye yuan'' as pst_vim,''作業員'''
            +' as pst_cn,''2006/01/01'' as try_date, (B.salary-B.full_sal) as sal_sub '
            +' from hrd_sal_paymt as A,hrd_sal_currency as B,hrd_sal_bankcard as C  '
            +' where A.emp_id=B.emp_id and A.pay_mon=B.pay_mon and A.emp_id=C.emp_id  '+sWhereFull_sal // and A.actu_pay>0 and B.full_sal>0'
  else if Rb_direct.Checked then//直接發放薪資 
    sql_str:='select A.dept_code,*,''zuo ye yuan'' as pst_vim,''作業員'''
            +' as pst_cn,''2006/01/01'' as try_date,(B.salary-B.full_sal ) as sal_sub,'''' as card_no from hrd_sal_paymt as A,hrd_sal_currency as B '
            +' where A.emp_id=B.emp_id and A.pay_mon=B.pay_mon '+sWhereFull_sal // and A.actu_pay>0 '
            +' and A.emp_id not in (select emp_id from hrd_sal_bankcard)'
  else //全部
    sql_str:='select A.dept_code,*,''zuo ye yuan'' as pst_vim,''作業員'''
            +' as pst_cn,''2006/01/01'' as try_date,(B.salary-B.full_sal ) as sal_sub,'''' as card_no from hrd_sal_paymt as A,hrd_sal_currency as B '
            +' where A.emp_id=B.emp_id and A.pay_mon=B.pay_mon '+sWhereFull_sal; // and A.actu_pay>0 '

  sql_str:=sql_str+' and A.pay_mon='''+edit_month.Text+'''';
  if RbEmp.Checked then
  begin
    if EditEmpBegin.Text<>'' then
      sql_str:=sql_str+' and A.emp_id>='''+EditEmpBegin.Text+'''';
    if EditEmpEnd.Text<>'' then
      sql_str:=sql_str+' and A.emp_id<='''+EditEmpEnd.Text+'''';
  end;
  //從(工號檔)->薪資檔中判斷在職狀態
  //sql_str:=sql_str+' and A.emp_id in (select emp_id from hrd_emp where 1=1';
  if RBInwork.Checked then
    sql_str:=sql_str+' and A.info_code=''0''';
  if RBNormalLeft.Checked then
    sql_str:=sql_str+' and A.info_code=''2''';
  if RBAutoLeft.Checked then
    sql_str:=sql_str+' and A.info_code=''6''';
  //sql_str:=sql_str+' )';//取月底
  if RbDept.Checked then
  begin
    if CobDeptBegin.Text<>'' then
      sql_str:=sql_str+' and A.dept_code>='''+leftstr(CobDeptBegin.Text,6)+'''';
    if CobDeptEnd.Text<>'' then
      sql_str:=sql_str+' and A.dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';
  end;
  //*****hyt add 2012-12-29
  if rd_adidas.Checked then //adidas
    sql_str:=sql_str+' and left(A.dept_code,1)=''V'''
  else if Rb_SB.Checked then
  begin
    if edit_month.Text = '201606' then
      sql_str:= sql_str + ' AND A.EMP_ID IN (SELECT EMP_ID FROM HRD_EMP_CHANGE WHERE CHANGE_MONTH='+QuotedStr(edit_month.Text)+')'
    else
      sql_str:= sql_str + ' AND A.PAY_MON >= ''201607''';
  end
  //mizuno
  else begin
    if sMonth < '201606' then
      sql_str:=sql_str+' and left(A.dept_code,1)<>''V'''
    else if sMonth= '201606' then
      sql_str:=sql_str+' and left(A.dept_code,1)<>''V'''
                + ' AND A.EMP_ID NOT IN (SELECT EMP_ID FROM HRD_EMP_CHANGE WHERE CHANGE_MONTH='+QuotedStr(edit_month.Text)+')'
    else
      sql_str:=sql_str+' and left(A.dept_code,1)<>''V'''
                + ' AND A.PAY_MON < ''201607''';
  end;                  
  //*****

  if chk_epledt.Checked then
  begin
    sql_str := sql_str+' and Exists(select emp.emp_id from hrd_emp emp where emp.emp_id=a.emp_id '
                   +' and emp.epledt >= '''+FormatDateTime('yyyy/mm/dd',dtp_epledt_bgn.Date)
                   +' '' and epledt<='''+FormatDateTime('yyyy/mm/dd',dtp_epledt_end.Date)+''')';
  end;
  //

  if cbChange.Checked then
    sql_str := sql_str + ' and exists(select ch.emp_id from hrd_emp_change ch where a.emp_id=ch.emp_id and ch.change_month = '+QuotedStr(edit_month.Text)+')';


  sql_str:=sql_str+' order by A.dept_code,A.emp_id';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.add(sql_str);
    open;
  end;
end;

procedure TFormSal12.PrintTip(PrintFlag:boolean);
begin
  with ADOQuery1 do
  begin
    first;
    if EOF then
    begin
      WideMessageDlg(GetLangName(LangStr,'not_find_data'),mtConfirmation,[mbok],0);
      exit;
    end
    else
    begin
      if PrintFlag then
        SetStatusText(GetLangName(LangStr,'while_printing')+GetLangName(LangStr,'fld_emp_id')+FieldByName('emp_id').AsString);
      with FormPrtSal12.QuickRep1 do
      begin
        //***<<<2011-12-05 hyt add
        if Rb_bank.Checked then   //銀行轉賬
          FormPrtSal12.QRIfBank.Caption:='CHUYEN KHOAN'
        else if Rb_direct.Checked then //付款
          FormPrtSal12.QRIfBank.Caption:='TIEN MAT';
        //***>>>
        FormPrtSal12.qrlblGrad.Caption := memVim.Lines.Strings[0];
        FormPrtSal12.qrlblDuty.Caption := memVim.Lines.Strings[1];
        FormPrtSal12.qrlblDuoxiubukou.Caption := memVim.Lines.Strings[2];


        if PrintFlag then
          Print
        else
          Preview;
      end;
    end;
  end;
  if PrintFlag then
    SetStatusText(GetLangName(LangStr,'print_finish'));
end;

procedure TFormSal12.BtnPrintClick(Sender: TObject);
//打印內容設置
var
  Atitle,AFooter,DefFlds,StatFlds:string;
begin
  //打印(預覽)
  Atitle:='Cty TNHH Giay FULUH'+'<br>'
    +'<left>BP:                                                                        '
    +'Ngay   Nam  Thang                           '
    //+'So-@PageNumber trg:                                        '
    //+'NgLapBieu:                         DonVi:VND<br>'
    +'                                                             '
    +'                                            '
    +'<left>Bo phan:                                                                  '
    +'日期:  '+LeftStr(Edit_month.Text,4)+' 年 '+RightStr(Edit_month.Text,2)+' 月               '
    +'第@PageNumber 頁:                              '
    +'制表日期: '+FormatDateTime('yyyy/mm/dd',date)+'                單位:VND<br>';
  AFooter:='                   Hiep                                           '
    +'Giam                                           TaiVu                            '
    +'               Phe                                           Lap';
  {DefFlds:='emp_id,name_vim,base_pay,hour_normal,mgmt_ofr,hour_over15,'
    +'hour_over20,hour_over30,duty_ofr,picc_she,picc_yi,luan_pay,tax_pay,'
    +'deal_pay,supp_agai,actu_pay';}
  DefFlds:='emp_id,name_vim,epindt,base_pay,mgmt_ofr,duty_ofr,tech_ofr,grad_ofr,'
    +'full_awd,picc_she,picc_yi,luan_pay,actu_pay';
  if RBTable.Checked then
  begin
    //AddMiniTotalToDataSet(ADOQuery1,ClientDataSet1,'',0,'',StatFlds);
//    showPrint(TCustomADODataset(ClientDataSet1),Atitle,AFooter,DefFlds);
    showPrint(ADOQuery1,Atitle,AFooter,DefFlds);
  end
  else
  if TtntButton(Sender).Name='BtnPrint' then
  begin
    if PrintDialog1.Execute then
      PrintTip(true);
  end
  else
    PrintTip(false);
end;

procedure TFormSal12.sb_FindEmpClick(Sender: TObject);
begin
  editempbegin.Text:=FindEmpId('emp_id');
end;

procedure TFormSal12.GetDutTime(emp_id,dut_month:string;EmpInDate,EmpLvDate:TDateTime);
var
  TmpSql,clas_code,sqlstr:string;
  i,hour_day,sDay,eDay,hour_price:integer;
  hour_mon,max_hour,hour_normal,hour_stop,hour_late,hour_withsal,hour_sick,hour_suff,hour_abse,hour_over15,hour_over20,hour_over30,overtotal:double;
  hour_ask,hour_absentwork,hour_wedding,hour_funeral,hour_maternity,hour_public,hour_holiday:Double;
  MonsDate,MonEDate:TDateTime;
  night_time, wanban_time:Double;
  ADays:TStrings;
begin
  MonSDate:=StartOfAMonth(StrToInt(LeftStr(dut_month,4)),StrToInt(RightStr(dut_month,2)));
  MonEDate:=EndOfAMonth(StrToInt(LeftStr(dut_month,4)),StrToInt(RightStr(dut_month,2)));
  if (EmpLvDate<>0) or (EmpLvDate<=MonEDate) or (EmpInDate>=MonSDate) then
    max_hour:=GetWorkDays(dut_month,EmpInDate,EmpLvDate)*8//當月離職/新進
  else
   // begin
   // if dut_month='201102' then
   //     max_hour:=192
   // else
       max_hour:=208;
   // end;
  max_hour:=min(max_hour,208);
  if (dut_month='201102') and (emp_id='810354') then
     max_hour:=min(max_hour,192);

  if EmpInDate<MonSDate then
    sDay:=5+1 //4==>5 hyt 2010-12-04
  else//當月進廠
    sDay:=5+DayOf(EmpInDate); //4==>5 hyt 2010-12-04
  if (EmpLVDate=0) or (EmpLVDate>MonEDate) then
    eDay:=4+DayOf(MonEDate)   
  else//當月離職
    eDay:=5+DayOf(EmpLVDate)-1; //4==>5 hyt 2010-12-04
  TmpSql:='select * from hrd_dut_mon where dut_mon='''+dut_month+''''
    +'and emp_id='''+emp_id+'''';
  with DMHrdsys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add(TmpSql);
    open;
    First;
    hour_normal:=0;
    // 在職人員及非1號離職人員
    // hour_normal:=8;//9月25天，補上一天
    night_time := 0;
    wanban_time:= 0;

    while not EOF do
    begin
      clas_code:=FieldByName('clas_code').AsString;
      hour_mon:=0;
      for i:=sDay -1  to eDay do
      //從進廠次日到離職前一日(正常：1-31)
      begin
        if (Fields[i].Value<>'') and (Fields[i].Value<>null) then
          hour_day:=Fields[i].AsInteger
        else
          hour_day:=0 ;
        if hour_day>=10 then
          hour_mon:=hour_mon+(hour_day div 100) + ((hour_day mod 100)*5/3)/100
        else//遲到，早退
          hour_mon:=hour_mon+hour_day;
      end;
      if AnsiContainsStr('65|66|67|68|69|72|80|90|82|92|85|95|74',clas_code) then //2010-10-27 hyt add 74
      begin//加班
        if AnsiContainsStr('72|85|95',clas_code) then
          hour_over30:=hour_over30+hour_mon//節日加班
        else if AnsiContainsStr('69|82|92|74',clas_code) then //2010-10-27 hyt add 74
          hour_over20:=hour_over20+hour_mon//周末加班
        else//平常加班
          hour_over15:=hour_over15+hour_mon;
      end;
      //04-遲到 05-早退 23-由警衛登記的遲到、早退 2013.12.03 LX ADD->23
      if AnsiContainsStr('04|05|23',clas_code) then
      begin//遲到，早退
        hour_late:=hour_late+hour_mon;
      end;
      //18 - 集體年休 2014.10.16
      if AnsiContainsStr('06|07|08|11|12|13|14|09|10|15|64|16|18|20|21|22|25|44|54|23|73|24|6C',clas_code) then    //2010-10-27 hyt add 23-遲到/早退
      begin//請假停工
        //if clas_code='64' then//停工
        if (clas_code='64') or (clas_code='54') or (clas_code='44') then//停工
        begin
          //hour_normal:=hour_normal+hour_mon;
          hour_stop:=hour_stop+hour_mon;
        end
        else if clas_code='15' then //工傷假
          hour_suff:=hour_suff+hour_mon
        //2015.11.04
        //else if AnsiContainsStr('09|10|20',clas_code) then//病假
        else if AnsiContainsStr('09|10|20|24',clas_code) then//病假
          hour_sick:=hour_sick+hour_mon
        else if AnsiContainsStr('07|08|11|13|14|16|18',clas_code) then//帶薪休假
        begin
          hour_withsal:=hour_withsal+hour_mon;
          if AnsiContainsStr('13',clas_code) then
            hour_wedding := hour_wedding+hour_mon
          else if AnsiContainsStr('14',clas_code) then
            hour_funeral := hour_funeral+hour_mon
          else if AnsiContainsStr('08',clas_code) then
            hour_public := hour_public+hour_mon
          //18 - 集體年休 2014.10.16
          else if AnsiContainsStr('16|18',clas_code) then
            hour_holiday := hour_holiday+hour_mon;
        end
        else if AnsiContainsStr('12|06|21|22|25|20|23',clas_code) then//缺勤  2010-10-27 hyt add 23-遲到/早退
        begin
          hour_abse:=hour_abse+hour_mon;
          if AnsiContainsStr('12',clas_code) then
            hour_ask := hour_ask+hour_mon
          else if AnsiContainsStr('06',clas_code) then
            hour_absentwork := hour_absentwork+hour_mon
          else if AnsiContainsStr('21',clas_code) then
            hour_maternity := hour_maternity+hour_mon;
        end;
        //夜班
        {2016.03.29
        else if AnsiContainsStr('73|6C',clas_code) then
          night_time := night_time+hour_mon;
        }
      end
      else if AnsiContainsStr('61|62|63|6D',clas_code) then//61|62|63|64|10
      begin//常態工時
        hour_normal:=hour_normal+hour_mon;
        //
        if (clas_code= '63') or (clas_code= '6C') then
          wanban_time := wanban_time + hour_mon;
      end;

      if AnsiContainsStr('63|73|6C',clas_code) then
          night_time := night_time+hour_mon;


      next;
    end;
  end;
  //***<<<2010-12-03 hyt add
  hour_withsal:=strToInt(formatFloat('0',hour_withsal));
  hour_abse   :=strToInt(formatFloat('0',hour_abse));
  //***>>>
  //hour_normal:=min(hour_normal,208);
  {if hour_normal>=max_hour then
    hour_normal:=max_hour
  else
    hour_normal:=max_hour-hour_stop-hour_suff-hour_sick-hour_withsal-hour_abse;}
  //2010-12-04 hyt upd
  if  ( dut_month='201102') and ( hour_stop+hour_suff+hour_sick+hour_withsal+hour_abse =192 ) then
      hour_normal:= 0
  //2015.03.04 二月工時192小時 sanjin
  else if  ( dut_month='201502') and ( hour_stop+hour_suff+hour_sick+hour_withsal+hour_abse =192 ) then
      hour_normal:= 0
  //2015.12.03 二月工時200小時 tim add
  else if  ( dut_month='201511') and ( hour_stop+hour_suff+hour_sick+hour_withsal+hour_abse =200 ) then
      hour_normal:= 0
  else
      hour_normal:=max_hour-hour_stop-hour_suff-hour_sick-hour_withsal-hour_abse;

  //1日離職人員固定為0小時
  if FormatDateTime('YYYYMMDD',EmpLvDate)=edit_month.Text+'01' then
    hour_normal := 0;      

  if  hour_normal < 0 then  hour_normal:=0 ;
  //小時單價
  if max_hour>0 then
     begin
       hour_price:=(ADOQuery1.FieldByName('sal_total1').Value +
                    ADOQuery1.FieldByName('te_pay').Value -
                    ADOQuery1.FieldByName('stop_pay').Value ) div max_hour
     end
  else
    hour_price:=0;
  //全年加班纍計
  overtotal:=0.0;
  sqlstr:='SELECT * FROM hrd_dut_empovr where emp_id='''+emp_id+''' and [year]='''+LeftStr(dut_month,4)+'''';
  with DMHrdsys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if not Eof then
    begin
      for i:=1 to StrToInt(RightStr(dut_month,2)) do
      begin
        overtotal:=overtotal+Fields[i+3].AsFloat;
      end;
    end;  
  end;

  //
  if hour_normal> 208 then
    hour_normal := 208;
  //
  if hour_stop> 208 then
    hour_stop := 208;
  //
  if hour_suff> 208 then
    hour_suff := 208;
  //
  if hour_sick> 208 then
    hour_sick := 208;
  //
  if hour_withsal> 208 then
    hour_withsal := 208;  

  overtotal:=min(overtotal,300);
  ADays := GetYearHolEx(emp_id,LeftStr(dut_month,4));
  with ADOQuery1 do
  begin
    FieldByName('hour_normal').AsFloat:=hour_normal;
    FieldByName('hour_late').AsFloat:=hour_late;
    FieldByName('hour_stop').AsFloat:=hour_stop;
    FieldByName('hour_suff').AsFloat:=hour_suff;
    FieldByName('hour_sick').AsFloat:=hour_sick;
    FieldByName('hour_withsal').AsFloat:=hour_withsal;
    FieldByName('night_time').AsFloat := night_time;
    FieldByName('hour_price').AsCurrency:=hour_price;
    FieldByName('hour_overtotal').AsFloat:=overtotal;
  end;
end;

function TFormSal12.GetPstPay(pst_code:string;grad:string='1'):double;
var
  TmpSql:string;
begin
  TmpSql:='select * from hrd_sal_lvl where pst_code='''+pst_code+'''';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(TmpSql);
    open;
    if not EOF then
      result:=FieldByName('grad_'+grad).AsCurrency
    else
      result:=0;
  end;
end;

function TFormSal12.GetWorkPay(emp_id,month:string):double;
//作業員取工種補貼
var
  ASQL:string;
begin
  aSQL:='SELECT * FROM hrd_wrkpay A,hrd_wrkpart B,hrd_wrkpay_grad C'
      +' WHERE A.part_code=B.part_code and B.part_grad=C.grad_code'
      +' and emp_id='''+Emp_Id+''' AND wrk_mon='''+month+''''
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

procedure TFormSal12.ADOQuery1CalcFields(DataSet: TDataSet);
//計算字段
var
  TmpSql,pst_code,emp_id,month,dept_code:string;
  i,hour_price:integer;
  sal_total1,sal_total2,sal_total3:double;
  Flds:TFields;
  EmpInDate,EmpLVDate:TDateTime;
  //
  dOvrBasePay: Double;
begin
  with ADOQuery1 do
  begin
    pst_code :=  FieldByName('pst_code').AsString;
    emp_id:=FieldByName('emp_id').AsString;
    month:=Edit_month.Text;
  //  if month ='200801' then
   //      FieldByName('last_addition').Value:=0;
    Flds:=GetEmpInfo(emp_id,month);
    FieldByName('stop_pay').AsCurrency:=0;
    //員工個人信息
    if Flds.FieldByName('emp_chs').asstring<>'' then
    FieldByName('emp_chs').AsString:=Flds.FieldByName('emp_chs').AsString
    else
    FieldByName('emp_chs').AsString:='';
    if Flds.FieldByName('name_vim').asstring<>'' then
      FieldByName('name_vim').Value:=Flds.FieldByName('name_vim').Value;
    //FieldByName('dept_code').AsString:=Flds.FieldByName('dept_code').Value;
    //FieldByName('dept_abbr').AsString:=Flds.FieldByName('abbr_titl').Value;
    //pst_code:=Flds.FieldByName('pst_code').AsString;
    //FieldByName('pst_code').AsString:=pst_code;
    EmpInDate:=Flds.FieldByName('epindt').AsDateTime;
    EmpLvDate:=Flds.FieldByName('epledt').AsDateTime;
    FieldByName('epindt').AsString:=Flds.FieldByName('epindt').AsString;
    //身份證號碼
    FieldByName('epid_no').AsString := Flds.FieldByName('epid_no').AsString;


    //部門(舊部門)
     //部門(舊部門)
      emp_id:=FieldByName('emp_id').AsString;

      //2015.02.04 sanjin
      with DMHrdsys.SQLQuery3 do
      begin
        close;
        sql.Clear;
        sql.Add('select base_pay from hrd_sal_base where emp_id='''+emp_id+'''');
        open;
        if not Eof then
          DataSet.FieldByName('ovr_base_pay').AsString:=FieldByName('base_pay').Value;
      end;
      //轉正後基本工資
      //操作員

      dOvrBasePay := 0;

      if FieldByName('pst_code').AsString>='60' then
      begin
        if month < '201301' then
          dOvrBasePay := 1936700
        else if month < '201303' then
          dOvrBasePay := 2279100
        else if month <= '201312' then
          dOvrBasePay := 2393055
        else if month <= '201412' then
          dOvrBasePay := 2730105
        else if month <= '201512' then
          dOvrBasePay := 3179505
        else if month <= '201612' then
          dOvrBasePay := 3628905
        else
          dOvrBasePay := 3909780;

      //其他
      end else begin
        if month < '201301' then
          dOvrBasePay := 2053535
        else if month < '201303' then
          dOvrBasePay := 2413055
        else if month <= '201312' then
          dOvrBasePay := 2413055
        else if month <= '201412' then
          dOvrBasePay := 2750105
        else if month <= '201512' then
          dOvrBasePay := 3199505  
        else if month <= '201612' then
          dOvrBasePay := 3648905
        else
          dOvrBasePay := 3909780;
      end;
      //
      if DataSet.FieldByName('ovr_base_pay').AsFloat < dOvrBasePay then
        DataSet.FieldByName('ovr_base_pay').AsFloat := dOvrBasePay;
      //試用期基本工資
      if  month < '201101'  then
            DataSet.FieldByName('init_base_pay').AsString:='1120000'
      else if  month < '201107'  then
            DataSet.FieldByName('init_base_pay').AsString:='1550000'
      else if  month < '201110'  then
            DataSet.FieldByName('init_base_pay').AsString:='1750000'
      else if  month < '201301'  then
            DataSet.FieldByName('init_base_pay').AsString:='1810000' //2011-10-11 hyt add (201110 valide)
      else if  month < '201401'  then
            DataSet.FieldByName('init_base_pay').AsString:='2130000' //2013-01-09 hyt add (201301 valide)
      else if  month < '201501'  then
            DataSet.FieldByName('init_base_pay').AsString:='2430000' //2014-01-15 hyt add (201401 valide)
      else if  month < '201601'  then
        DataSet.FieldByName('init_base_pay').AsString:='2830000' //2014-01-15 hyt add (201401 valide)
      else if  month < '201701'  then
        DataSet.FieldByName('init_base_pay').AsString:='3230000'
      else
        DataSet.FieldByName('init_base_pay').AsString:='3480000';


    dept_code:=FieldByName('dept_code').AsString;
    with DMHrdsys.SQLQuery3 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from hrd_dept where dept_code='''+dept_code+'''');
        open;
        if not Eof then
          if FieldByName('abbr_titl').asstring<>'' then
          DataSet.FieldByName('dept_abbr').value:=FieldByName('abbr_titl').AsString;
      end;
    //薪資總計
    for i:=FieldByName('pay_mon').Index+1 to FieldByName('sal_total1').Index-1 do
      if (Fields[i].AsString<>'') then
        sal_total1:=sal_total1+Fields[i].AsCurrency;
    for i:=FieldByName('sal_total1').Index+1 to FieldByName('sal_total2').Index-1 do
      if (Fields[i].AsString<>'') then
        sal_total2:=sal_total2+Fields[i].AsCurrency;
    for i:=FieldByName('sal_total2').Index+2 to FieldByName('sal_total3').Index-1 do
      if (Fields[i].AsString<>'') then
        sal_total3:=sal_total3+Fields[i].AsCurrency;
     
    FieldByName('sal_total1').Value:=sal_total1;
    FieldByName('sal_total2').Value:=sal_total2;
    FieldByName('sal_total3').Value:=sal_total3;
    //FieldByName('pst_pay').AsCurrency:=GetPstPay(pst_code);//計算職等金額
    //計算考勤時間
    GetDutTime(emp_id,edit_month.Text,EmpInDate,EmpLvDate);
    //工種補貼(職務津貼)
    if pst_code='60' then
       begin
         FieldByName('duty_ofr').DisplayLabel:='wrk_pay';
       end;
    {hour_price:=(sal_total1-FieldByName('stop_pay').Value) div FieldByName('hour_normal').Value;
    FieldByName('hour_price').AsCurrency:=hour_price;}

    //***<<<2010-11-01 hyt upd
    pst_code:=FieldByName('pst_code').AsString;
    if qry_prof.Locate('pst_code',pst_code,[loCaseInsensitive]) then
    begin
      DataSet.FieldByName('pst_name').Value :=qry_prof.FieldByName('pst_name').Value;
    end;
    //***>>>

    if FieldByName('PST_CODE').AsString>= '60' then
    begin
      FieldByName('grad_money').AsInteger := FieldByName('duty_ofr').AsInteger;
      FieldByName('duty_ofr').AsInteger := 0;
    end
    else
      FieldByName('grad_money').AsInteger := 0;

  end;
end;

procedure TFormSal12.BtnQueryClick(Sender: TObject);
begin
  SetPrintDataset;
  BtnPreview.Enabled:=true;
  BtnPrint.Enabled:=true;
end;

procedure TFormSal12.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示,及改變編輯區一些欄位
var
  AText:string;
begin
with ADOQuery1 do
  AText:=GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+'; '
    +GetLangName(LangStr,'total')+':'+inttostr(RecordCount)+'; '
    +GetLangName(LangStr,'cur_emp_id')+':'+FieldByName('emp_id').AsString;
  setStatusText(AText);
end;

procedure TFormSal12.Button1Click(Sender: TObject);
begin
  ExportDataToExcel;
end;

//2012-02-04 hyt add
procedure TFormSal12.EditEmpBeginChange(Sender: TObject);
begin
  EditEmpEnd.Text :=EditEmpBegin.Text ;
end;

//2016.07.09
procedure TFormSal12.ExportDataToExcel;
var
  MyExcel: Variant;
  iRow, iCol: Integer;
  //
  dFullSal: Double;
  //
  CardList, ExistsList: TStringList;
  //
  sCardNo: string;
begin
  try
    MyExcel := CreateOleObject('Excel.Application');
    MyExcel.WorkBooks.Add;
  except
    ShowMessage('Error');
  end;
  //
  MyExcel.Visible := False;
  CardList := TStringList.Create;
  ExistsList:= TStringList.Create;
  try
    iRow := 1;
    iCol := 8;
    MyExcel.Cells[iRow, 1] := Copy(edit_month.Text, 1, 4)+'年'+Copy(edit_month.Text, 5, 2)+' 月 越南福祿V2員工薪資轉帳明細表';
    Inc(iRow);
    MyExcel.Cells[iRow, 1] := '部門代號';
    MyExcel.Cells[iRow, 2] := '部門簡稱';
    MyExcel.Cells[iRow, 3] := '工號';
    MyExcel.Cells[iRow, 4] := '中文姓名';
    MyExcel.Cells[iRow, 5] := '越文姓名';
    MyExcel.Cells[iRow, 6] := '帳號';
    MyExcel.Cells[iRow, 7] := '身份證號碼';
    MyExcel.Cells[iRow, 8] := '實發薪資';

    MyExcel.Columns[3].NumberFormatLocal:= '@ ';
    MyExcel.Columns[6].NumberFormatLocal:= '@ ';
    MyExcel.Columns[7].NumberFormatLocal:= '@ ';
    //
    dFullSal := 0;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
      //
      sCardNo := ADOQuery1.FieldByName('Card_no').AsString;
      if Trim(sCardNo)<> '' then
      begin
        if CardList.IndexOf(sCardNo)= -1 then
          CardList.Append(sCardNo)
        else
          ExistsList.Append(sCardNo);
      end;
      //
      Inc(iRow);
      MyExcel.Cells[iRow, 1] := ADOQuery1.FieldByName('dept_code').Value;
      MyExcel.Cells[iRow, 2] := ADOQuery1.FieldByName('dept_abbr').Value;
      MyExcel.Cells[iRow, 3] := ADOQuery1.FieldByName('emp_id').Value;
      MyExcel.Cells[iRow, 4] := ADOQuery1.FieldByName('emp_chs').Value;
      MyExcel.Cells[iRow, 5] := ADOQuery1.FieldByName('name_vim').Value;
      MyExcel.Cells[iRow, 6] := ADOQuery1.FieldByName('Card_no').Value;
      MyExcel.Cells[iRow, 7] := ADOQuery1.FieldByName('epid_no').Value;
      MyExcel.Cells[iRow, 8] := ADOQuery1.FieldByName('full_sal').Value;
      dFullSal := dFullSal + ADOQuery1.FieldByName('full_sal').AsCurrency;
      ADOQuery1.Next;
    end;
    Inc(iRow);
    MyExcel.Cells[iRow, 1] := 'Total:';
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 7]].MergeCells := True;
    MyExcel.Cells[iRow, 8] := dFullSal;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[1, iCol]].MergeCells := True;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, iCol]].Font.Bold := True;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, iCol]].Font.Name := '新細明體';
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, iCol]].Font.Size := 10;    
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, iCol]].HorizontalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, iCol]].VerticalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[iRow, iCol]].Borders.LineStyle := xlContinuous;
    MyExcel.Range[MyExcel.Cells.Item[3, 1], MyExcel.Cells.Item[iRow, iCol]].Font.Name := 'Arial';
    MyExcel.Range[MyExcel.Cells.Item[3, 1], MyExcel.Cells.Item[iRow, iCol]].Font.Size := 9;
    MyExcel.Cells.EntireColumn.AutoFit;
    if ExistsList.Count> 0 then
      ShowMessage('以下銀行卡號重複'+#13#10+ExistsList.CommaText);
  finally
    MyExcel.Visible := True;
    CardList.Free;
    ExistsList.Free;
  end;
end;

procedure TFormSal12.edit_monthChange(Sender: TObject);
begin
  cbChange.Visible := edit_month.Text = '201606';
end;

end.
