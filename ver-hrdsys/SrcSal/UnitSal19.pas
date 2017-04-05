{*************************************************************************
Name：Sal19
Author: hyt
Create date:2006-09-12
Modify date:2006-09-12
Commentate:離職補助金
*************************************************************************}
unit UnitSal19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils,math;
type
  TFormSal19 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PrintDialog1: TPrintDialog;
    ADOQuery_prt: TADOQuery;
    ADOQuery1emp_id: TStringField;
    Panel5: TPanel;
    PanelGrid: TPanel;
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
    Panel7: TPanel;
    ADOQuery1dept_code: TStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1epid_no: TStringField;
    ADOQuery1epindt: TDateTimeField;
    ADOQuery1epledt: TDateTimeField;
    ADOQuery1abbr_titl: TStringField;
    ADOQuery1sort: TIntegerField;
    ADOQuery1pst_code: TStringField;
    ADOQuery1edu_code: TStringField;
    ADOQuery1supp_amt: TFloatField;
    ADOQuery1tr_month: TStringField;
    ADOQuery1fac_months: TIntegerField;
    ADOQuery1rub_days: TIntegerField;
    ADOQuery1years: TFloatField;
    ADOQuery1six_amt: TFloatField;
    ADOQuery_cur: TADOQuery;
    ADOQuery_curupd_user: TStringField;
    ADOQuery_curupd_date: TDateTimeField;
    ADOQuery_curpay_mon: TStringField;
    ADOQuery_curemp_id: TStringField;
    ADOQuery_curdept_code: TStringField;
    ADOQuery_curinfo_code: TStringField;
    ADOQuery_cursalary: TBCDField;
    ADOQuery_curfull_sal: TBCDField;
    ADOQuery_curif_full: TStringField;
    ADOQuery_curcurr_qty: TIntegerField;
    ADOQuery_cursal50w: TIntegerField;
    ADOQuery_cursal10w: TIntegerField;
    ADOQuery_cursal5w: TIntegerField;
    ADOQuery_cursal2w: TIntegerField;
    ADOQuery_cursal1w: TIntegerField;
    ADOQuery_cursal5s: TIntegerField;
    ADOQuery_cursal2s: TIntegerField;
    ADOQuery_cursal1s: TIntegerField;
    ADOQuery_cursal5h: TIntegerField;
    ADOQuery_cursal2h: TIntegerField;
    Panel2: TPanel;
    BtnQuery: TTntButton;
    BtnPreview: TTntButton;
    BtnPrint: TTntBitBtn;
    ADOQuery1factory_name: TStringField;
    ADOQuery1basic_pay: TFloatField;
    ADOQuery1other_pay: TFloatField;
    ADOQuery1in_months: TIntegerField;
    ADOQuery1sal_pay: TFloatField;
    ADOQuery1epbirth: TDateTimeField;
    ADOQuery1pst_vim: TWideStringField;
    ADOQuery1dept_vim: TWideStringField;
    ADOQuery1six_amt_new2: TFloatField;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure SetPrintDataset;
    procedure PrintTip(PrintFlag:boolean;sClass:string);
    function  GetWrkPay(EmpId,PayMon:String):Currency;
    procedure DetSetEnable(bFlag:Boolean);
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure BtnQueryClick(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1supp_amtGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQuery1epindtGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure TntRadioButton_faceClick(Sender: TObject);
    procedure EditEmpBeginChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal19: TFormSal19;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal19_fac, UnitPrtSal19_rub;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  SalBaseLvl:TStrings;//基本薪資等級額
  PayMon :string ;
{$R *.dfm}

procedure TFormSal19.FormCreate(Sender: TObject);

begin

  PayMon := leftstr(edit_month.text,4 ) + RightStr( edit_month.Text , 2 ) ;
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'sal12');
  InitForm;// Init Form
  Application.CreateForm(TFormPrtSal19_rub,FormPrtSal19_rub);
  Application.CreateForm(TFormPrtSal19_fac,FormPrtSal19_fac);
  SalBaseLvl:=GetAllBaseLvl;//取得所有基本薪資等級額
end;

procedure TFormSal19.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='sal19_titl,not_find_data,total,current_location,'
  +'unit_wan,unit_qian,unit_bai,unit_zhang,unit_currency_num,'
  +'total,sal09_count_num,fld_salary,fld_full_sal,'
  +'while_printing,print_finish,print_muti_page_pre';
LangStr:=GetLangWideStrs(keys);
PanelTitle.Caption:=GetLangName(LangStr,'sal19_titl');

end;

procedure TFormSal19.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  edit_month.Text:=formatdatetime('yyyymm',StartOfTheMonth(date)-10);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql+' ',CobDeptBegin);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql+' ',CobDeptEnd);
end;

procedure TFormSal19.SetPrintDataset;
//設置打印數據集
var
  sql_str:string;
  lcdStart,lcdEnd:TDateTime;
  nlMon :integer ;
begin                             //stop
  if trim(edit_month.Text)='' then
    exit;
  lcdStart:=EnCodeDate(StrToInt(LeftStr(edit_month.Text,4)),StrToInt(RightStr(edit_month.Text,2)),1);
  lcdEnd:=EndOfTheMonth(lcdStart);
  sql_str:='select *,'
           +'(DATEDIFF(Month,epindt-10, epledt-24)) as fac_months,'
           +'(DATEDIFF(Day,epindt, epledt)) as rub_days,'
           +'(select pst_vim from hrd_prof where pst_code=a.pst_code) as pst_vim,'
           +'(select vim_titl from hrd_dept where dept_code=a.dept_code) as dept_vim'
           +' from hrd_emp as a where epledt between '''+FormatDateTime('yyyy/mm/dd',lcdStart)
           +''' and '''+FormatDateTime('yyyy/mm/dd',lcdEnd)+'''';
  //工號
  if RbEmp.Checked then
  begin
    if EditEmpBegin.Text<>'' then
      sql_str:=sql_str+' and emp_id>='''+EditEmpBegin.Text+'''';
    if EditEmpEnd.Text<>'' then
      sql_str:=sql_str+' and emp_id<='''+EditEmpEnd.Text+'''';
  end;
  //部門
  if RbDept.Checked then
  begin
    if CobDeptBegin.Text<>'' then
      sql_str:=sql_str+' and dept_code>='''+leftstr(CobDeptBegin.Text,6)+'''';
    if CobDeptEnd.Text<>'' then
      sql_str:=sql_str+' and dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';
  end;

  //2012-09-07 hyt add
   sql_str:=sql_str+' and '+G_sFactorySql;

  //從工號檔中判斷在職狀態 (正常離職)
  sql_str:=sql_str+' and info_code =''2''';
 // if (TntRadioButton_face.Checked) then
    sql_str:=sql_str+' and left(dept_code,1)=''F''' ;
 // else
 //   sql_str:=sql_str+' and left(dept_code,1)=''N''';
  //factory 2006-02-23 規定 每工作 每滿一年 發放 1/2 月薪資
 // if (TntRadioButton_face.Checked) or (edit_month.Text>='200611') then //鞋廠
 // begin
    //nlMon := 0;
    //nlMon :=(yearof(2007/03/21-24)-yearof(2006/03/20-10))*12+monthof(2007/03/21-24)-monthof(2006/03/20-10)   ;

    sql_str:=sql_str+' and ('+
                      '(year(epledt-24)-year(epindt-10))*12+'+
                      'month(epledt-24)-month(epindt-10)'+
                      ')>=12'      ;
 // end;
//  else
//  begin                                //化工
//    sql_str:=sql_str+' and left(dept_code,1)=''N''';
//    sql_str:=sql_str+' and DATEDIFF(Day,epindt, epledt)>=365';
//  end;

  sql_str:=sql_str+' order by emp_id';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.add(sql_str);
    open;
  end;
  //ADOQuery_prt.Clone(ADOQuery1); //打印數據(缺點: 計算闌位無法 copy  )--沒用到
end;

procedure TFormSal19.PrintTip(PrintFlag:boolean;sClass:string);
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
     // if (TntRadioButton_face.Checked) or (edit_month.Text>='200611') then
    //  begin  //鞋廠
         with FormPrtSal19_fac.QuickRep1 do
         begin
           FormPrtSal19_fac.QRLabel_day.Caption   :='10';//formatDatetime('dd',getServerDatetime);
           FormPrtSal19_fac.QRLabel_month.Caption :=formatDatetime('mm',getServerDatetime);
           FormPrtSal19_fac.QRLabel_year.Caption  :=formatDatetime('yyyy',getServerDatetime);
           if PrintFlag then
              Print
           else
              Preview;
          end;
     // end
    //  else
   //   begin  //化工
   //       with FormPrtSal19_rub.QuickRep1 do
   //       begin
    //        if PrintFlag then
      //        Print
      //      else
      //        Preview;
     //     end;
    //  end;
    end;
  end;
  if PrintFlag then
    SetStatusText(GetLangName(LangStr,'print_finish'));
end;

procedure TFormSal19.BtnPrintClick(Sender: TObject);
//打印內容設置
begin
  //打印(預覽)
  if TtntButton(Sender).Name='BtnPrint' then
  begin
    if PrintDialog1.Execute then
    PrintTip(true,'1');
  end
  else
    PrintTip(false,'1');
end;

procedure TFormSal19.ADOQuery1CalcFields(DataSet: TDataSet);
//計算字段
var
  lcsMonth,EmpId,SqlStr,key,PstCode,EduCode,dept_code:string;
  EmpInDate,EmpLvDate,lcdEndDate:TDatetime;
  lcfDays,lcfMonths,lcfYear:Extended;
  lv_supp_amt:Currency;                   //離職補助金
  lcsDealMon:string;
begin
  if DataSet.RecNo=-1 then
    DataSet.FieldByName('sort').AsString:='1'
  else
    DataSet.FieldByName('sort').AsString:=intToStr(DataSet.RecNo);
  EmpId  :=DataSet.FieldByName('emp_id').AsString;
  PstCode:=DataSet.FieldByName('pst_code').AsString;
  EduCode:=DataSet.FieldByName('edu_code').AsString;    //學歷代號
  dept_code:=DataSet.FieldByName('dept_code').AsString;
  EmpInDate:=DataSet.FieldByName('epindt').AsDateTime;
  EmpLvDate:=DataSet.FieldByName('epledt').AsDateTime;
  lcfDays:=DataSet.FieldByName('rub_days').AsInteger ;
  lcsMonth:=edit_month.Text;
  DataSet.FieldByName('tr_month').AsString:=lcsMonth;
  lcdEndDate:=EndOfAMonth(StrToInt(LeftStr(lcsMonth,4)),StrToInt(RightStr(lcsMonth,2)));
  lcsDealMon:=formatDatetime('yyyymm',EmpLvDate-25);
  lcdEndDate :=EmpLvDate-25;
  with DMHrdsys.SQLQuery4 do
  begin
    //dept_code
    key:=DataSet.FieldByName('dept_code').AsString;
    SqlStr:='select abbr_titl from hrd_dept where dept_code='''+key+'''';
    Close;
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;
    DataSet.FieldByName('abbr_titl').AsString:=FieldByName('abbr_titl').AsString;
    //取調薪資料
    SqlStr:='SELECT * FROM hrd_saltran WHERE emp_id='''+EmpId+
            ''' AND valid_date<='''+FormatDateTime('yyyy/mm/dd',lcdEndDate)+
            ''' order BY valid_date desc';
    Close;
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;

    if paymon <'200801'  then
       lv_supp_amt:=GetNormalBase(EmpId, paymon, PstCode,EduCode,EmpInDate,SalBaseLvl,true) //基本工資
    else
     //  lv_supp_amt:=GetNormalBase( PstCode,EduCode,EmpInDate,SalBaseLvl,true) + 92300; //基本工資
    begin
       if( pstcode ='60' )  then
          lv_supp_amt:=GetNormalBase(EmpId,paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 170000 ;   //2008.01 起職員作業員薪資上浮190000
       if ( pstCode ='50' ) then
          lv_supp_amt:=GetNormalBase(EmpId,paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 190000 ;   //2008.01 起職員作業員薪資上浮190000
       if ( pstCode ='46' ) or ( pstcode ='41' ) or ( pstcode ='42' )  then
          lv_supp_amt:=GetNormalBase(EmpId,paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 172000 ;  // 2008.01 起班長級薪資上浮172000
       if ( pstCode ='33' ) or ( pstcode ='37' )  then
          lv_supp_amt:=GetNormalBase(EmpId,paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 242000 ;  // 2008.01 起組長級薪資上浮242000
       if ( pstCode ='22' ) or ( pstcode ='26' ) or ( pstcode ='28' )  then
          lv_supp_amt:=GetNormalBase(EmpId,paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 342000 ;  // 2008.01 起課長級薪資上浮342000
       if ( pstCode ='18' ) or ( pstcode ='19' )   then
          lv_supp_amt:=GetNormalBase(EmpId,paymon,PstCode,EduCode,EmpInDate,SalBaseLvl,false) + 442000 ;  // 2008.01 起主任級薪資上浮90000
    end;
    DataSet.FieldByName('basic_pay').AsFloat :=lv_supp_amt;
    //基薪總額（算單價時用）
    if PstCode='60' then
    begin
      //作業員，基薪總額為基本工資+工種補貼
      lv_supp_amt:=lv_supp_amt+GetWrkPay(EmpId,lcsDealMon);  //注意: 不是lcsMonth 2006-10-02
    end
    else
      //非作業員，基薪總額為 基本工資+主管加給+職務津貼+專業津貼+職務等級額
      lv_supp_amt:=lv_supp_amt+FieldByName('sal_mgmt').AsFloat+
                               FieldByName('pst_pay').AsFloat+
                               FieldByName('sal_tech').AsFloat+
                               FieldByName('grade_pay').AsFloat;
    DataSet.FieldByName('other_pay').AsFloat :=lv_supp_amt - DataSet.FieldByName('basic_pay').AsFloat;
    DataSet.FieldByName('sal_pay').AsFloat :=lv_supp_amt;
  end;
  DataSet.FieldByName('in_months').AsString :=DataSet.FieldByName('fac_months').AsString ;
  lcfMonths:=DataSet.FieldByName('fac_months').AsInteger ;
  //依上公式,年數及尾數:
  lcfYear:=int(lcfMonths/12);//去尾數 0.5==>1
  if lcfYear>0 then
  begin
    lcfMonths:=lcfMonths-lcfYear*12;
    if lcfMonths=0 then
        lcfYear:=lcfYear;
    if (lcfMonths>=1) and (lcfMonths<=6) then
        lcfYear:=lcfYear+0.5;
    if (lcfMonths>=7) and (lcfMonths<=11) then
        lcfYear:=lcfYear+1;
    DataSet.FieldByName('lv_supp_amt').AsString :=floatToStr(lcfYear*lv_supp_amt/2);
    DataSet.FieldByName('years').AsString :=floatToStr(lcfYear);
  end
  else  //不足一年
  begin
    showmessage('is error!');
  end;
  DataSet.FieldByName('factory_name').AsString :='鞋廠';
  DataSet.FieldByName('six_amt').AsString :=floatToStr(lv_supp_amt);
end;

procedure TFormSal19.BtnQueryClick(Sender: TObject);
begin
  SetPrintDataset;
  DetSetEnable(true);
end;

procedure TFormSal19.DetSetEnable(bFlag:Boolean);
begin
  BtnPreview.Enabled:=bFlag;
  BtnPrint.Enabled:=bFlag;
  if not bFlag then
    ADOQuery1.close;
end;

procedure TFormSal19.TntDBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
//  DBGridSortByTitle(column);
end;

procedure TFormSal19.ADOQuery1AfterScroll(DataSet: TDataSet);
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

procedure TFormSal19.ADOQuery1supp_amtGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text :=formatfloat(',0',Sender.DataSet.fieldbyname(TField(Sender).FieldName).Asfloat);
end;

procedure TFormSal19.ADOQuery1epindtGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text :=formatDatetime('yyyy/mm/dd',Sender.DataSet.fieldbyname(TField(Sender).FieldName).AsDateTime );
end;

function TFormSal19.GetWrkPay(EmpId,PayMon:String):Currency;
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

procedure TFormSal19.TntRadioButton_faceClick(Sender: TObject);
begin
  DetSetEnable(false);
end;

procedure TFormSal19.EditEmpBeginChange(Sender: TObject);
begin
  DetSetEnable(false);
end;

end.
