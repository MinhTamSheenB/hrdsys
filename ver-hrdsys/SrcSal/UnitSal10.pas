{*************************************************************************
Name：Sal10(員工薪資調動考核表)
Author: anil
Create date:2005-09-06
Modify date:2005-09-08
Commentate:員工薪資調動考核表
*************************************************************************}
unit UnitSal10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils,DateUtils, TntDB,Qt, QuickRpt;

type
   TNormalTestDays =array[0..1] of Integer;
  TFormSal10 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Panel7: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    CobDept: TTntComboBox;
    BtnPrint: TTntBitBtn;
    RbEmp: TTntRadioButton;
    RbDept: TTntRadioButton;
    BtnPreview: TTntButton;
    EditEmp: TTntEdit;
    ADODataSet1: TADODataSet;
    PrintDialog1: TPrintDialog;
    sb_FindEmp: TTntSpeedButton;
    ADOQuery1abbr_titl: TWideStringField;
    ADOQuery1position: TWideStringField;
    ADOQuery1sal_spec: TFloatField;
    ADOQuery1sal_grade: TStringField;
    ADOQuery1sal_base: TFloatField;
    ADOQuery1sal_mgmt: TFloatField;
    ADOQuery1sal_tech: TFloatField;
    ADOQuery1pst_pay: TFloatField;
    ADOQuery1grade_pay: TFloatField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1edu_code: TStringField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1epindt: TDateTimeField;
    ADOQuery1pst_code: TStringField;
    ADOQuery1total: TFloatField;
    ADOQuery1sal_achi: TFloatField;
    Panel3: TPanel;
    TntRadioButton_face: TTntRadioButton;
    TntRadioButton_rub: TTntRadioButton;
    ADOQuery2: TADOQuery;
    ADOQuery2emp_id: TStringField;
    ADOQuery2emp_chs: TWideStringField;
    ADOQuery2epid_no: TStringField;
    ADOQuery2edu_code: TStringField;
    ADOQuery2chs_status: TStringField;
    ADOQuery2eng_status: TStringField;
    ADOQuery2epid_date: TDateTimeField;
    ADOQuery2epid_area: TWideStringField;
    ADOQuery2factory: TStringField;
    ADOQuery2dept_code: TStringField;
    ADOQuery2epindt: TDateTimeField;
    ADOQuery2epledt: TDateTimeField;
    ADOQuery2left_reason: TWideStringField;
    ADOQuery2pst_code: TStringField;
    ADOQuery2info_code: TStringField;
    ADOQuery2name_vim: TWideStringField;
    ADOQuery2epid_vim: TWideStringField;
    ADOQuery2epid_eng: TWideStringField;
    ADOQuery2chk1: TStringField;
    ADOQuery2chk12: TStringField;
    ADOQuery2chk13: TStringField;
    ADOQuery2chk2: TStringField;
    ADOQuery2chk22: TStringField;
    ADOQuery2emp_cn_vn: TWideStringField;
    ADOQuery2prd_grade: TStringField;
    ADOQuery2sal_base: TCurrencyField;
    ADOQuery2grade_pay: TCurrencyField;
    ADOQuery2pst_pay: TCurrencyField;
    ADOQuery2sal_mgmt: TCurrencyField;
    ADOQuery2sal_tech: TCurrencyField;
    ADOQuery2ton_pay: TCurrencyField;
    ADOQuery2prd_pay: TCurrencyField;
    ADOQuery2envir_pay: TCurrencyField;
    ADOQuery2full_awd: TCurrencyField;
    ADOQuery2total0: TCurrencyField;
    ADOQuery2valid_date1: TDateField;
    ADOQuery2valid_date2: TDateField;
    ADOQuery2valid_date3: TDateField;
    ADOQuery2valid_date4: TDateField;
    ADOQuery2valid_date5: TDateField;
    ADOQuery2prd_grade1: TStringField;
    ADOQuery2prd_grade2: TStringField;
    ADOQuery2prd_grade3: TStringField;
    ADOQuery2prd_grade4: TStringField;
    ADOQuery2prd_grade5: TStringField;
    ADOQuery2sal_base1: TCurrencyField;
    ADOQuery2sal_base2: TCurrencyField;
    ADOQuery2sal_base3: TCurrencyField;
    ADOQuery2sal_base4: TCurrencyField;
    ADOQuery2sal_base5: TCurrencyField;
    ADOQuery2grade_pay1: TCurrencyField;
    ADOQuery2grade_pay2: TCurrencyField;
    ADOQuery2grade_pay3: TCurrencyField;
    ADOQuery2grade_pay4: TCurrencyField;
    ADOQuery2grade_pay5: TCurrencyField;
    ADOQuery2pst_pay1: TCurrencyField;
    ADOQuery2pst_pay2: TCurrencyField;
    ADOQuery2pst_pay3: TCurrencyField;
    ADOQuery2pst_pay4: TCurrencyField;
    ADOQuery2pst_pay5: TCurrencyField;
    ADOQuery2sal_mgmt1: TCurrencyField;
    ADOQuery2sal_mgmt2: TCurrencyField;
    ADOQuery2sal_mgmt3: TCurrencyField;
    ADOQuery2sal_mgmt4: TCurrencyField;
    ADOQuery2sal_mgmt5: TCurrencyField;
    ADOQuery2sal_tech1: TCurrencyField;
    ADOQuery2sal_tech2: TCurrencyField;
    ADOQuery2sal_tech3: TCurrencyField;
    ADOQuery2sal_tech4: TCurrencyField;
    ADOQuery2sal_tech5: TCurrencyField;
    ADOQuery2ton_pay1: TCurrencyField;
    ADOQuery2ton_pay2: TCurrencyField;
    ADOQuery2ton_pay3: TCurrencyField;
    ADOQuery2ton_pay4: TCurrencyField;
    ADOQuery2ton_pay5: TCurrencyField;
    ADOQuery2prd_pay1: TCurrencyField;
    ADOQuery2prd_pay2: TCurrencyField;
    ADOQuery2prd_pay3: TCurrencyField;
    ADOQuery2prd_pay4: TCurrencyField;
    ADOQuery2prd_pay5: TCurrencyField;
    ADOQuery2p_date1: TDateField;
    ADOQuery2p_date2: TDateField;
    ADOQuery2p_date3: TDateField;
    ADOQuery2p_date4: TDateField;
    ADOQuery2p_date5: TDateField;
    ADOQuery2aaa: TStringField;
    ADOQuery2aaa2: TStringField;
    ADOQuery2aaa3: TStringField;
    ADOQuery2aaa4: TStringField;
    ADOQuery2aaa5: TStringField;
    ADOQuery2aaa6: TStringField;
    ADOQuery2abbr_titl1: TStringField;
    ADOQuery2abbr_titl12: TStringField;
    ADOQuery2abbr_titl13: TStringField;
    ADOQuery2abbr_titl14: TStringField;
    ADOQuery2abbr_titl9: TStringField;
    ADOQuery2position1: TStringField;
    ADOQuery2position12: TStringField;
    ADOQuery2position13: TStringField;
    ADOQuery2position14: TStringField;
    ADOQuery2abbr_titl92: TStringField;
    ADOQuery2position9: TStringField;
    Panel_rub: TPanel;
    TntRadioButton_new: TTntRadioButton;
    TntRadioButton_adjust: TTntRadioButton;
    TntRadioButton_move: TTntRadioButton;
    TntRadioButton_rise: TTntRadioButton;
    TntRadioButton_drop: TTntRadioButton;
    ADOQuery2abbr_titl10: TStringField;
    ADODataSet1upd_user: TStringField;
    ADODataSet1upd_date: TDateTimeField;
    ADODataSet1emp_id: TStringField;
    ADODataSet1valid_date: TDateTimeField;
    ADODataSet1dept_code: TStringField;
    ADODataSet1pst_code: TStringField;
    ADODataSet1sal_grade: TStringField;
    ADODataSet1sal_base: TBCDField;
    ADODataSet1sal_mgmt: TBCDField;
    ADODataSet1sal_tech: TBCDField;
    ADODataSet1pst_pay: TBCDField;
    ADODataSet1envir_pay: TBCDField;
    ADODataSet1grade_pay: TBCDField;
    ADODataSet1sal_spec: TBCDField;
    ADODataSet1sal_achi: TBCDField;
    ADODataSet1other_pay: TBCDField;
    ADODataSet1id: TLargeintField;
    ADODataSet1pst_name: TStringField;
    ADOQuery1full_awd: TFloatField;
    ADOQuery1gong_pay: TFloatField;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure SetPrintDataset(PrintFlag:boolean);
    procedure SetPrintDataset_rub(PrintFlag:boolean);

    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure sb_FindEmpClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADOQuery2CalcFields(DataSet: TDataSet);
    procedure TntRadioButton_rubClick(Sender: TObject);
    procedure TntRadioButton_faceClick(Sender: TObject);
    procedure ADODataSet1CalcFields(DataSet: TDataSet);
    function  GetBase(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime;EduCode:string=''):Currency;
  
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FormSal10: TFormSal10;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal10;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  SalBaseLvl:Tstrings;//基本薪資等級額
  paymon:string ;

{$R *.dfm}

procedure TFormSal10.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
keys:=keys+'sal10_titl,not_find_data,while_doing,total,current_location,'
  +'preview,print,while_printing,department,print_finish,by_empid,by_deptcode,'
  +'dut11_stop,dut11_over,dept_begin,dept_end,print_muti_page_pre,'
  +'sal_face,sal_rub,r_new,r_adjust,r_move,r_rise,r_drop';
LangStr:=GetLangWideStrs(keys);
PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
BtnPrint.Caption:=GetLangName(LangStr,'print');
BtnPreview.Caption:=GetLangName(LangStr,'preview');
rbemp.Caption:=GetLangName(LangStr,'by_empid');
rbdept.Caption:=GetLangName(LangStr,'by_deptcode');
TntRadioButton_face.Caption   :=GetLangName(LangStr,'sal_face');
TntRadioButton_rub.Caption    :=GetLangName(LangStr,'sal_rub');
TntRadioButton_new.Caption    :=GetLangName(LangStr,'r_new');
TntRadioButton_adjust.Caption :=GetLangName(LangStr,'r_adjust');
TntRadioButton_move.Caption   :=GetLangName(LangStr,'r_move');
TntRadioButton_rise.Caption   :=GetLangName(LangStr,'r_rise');
TntRadioButton_drop.Caption   :=GetLangName(LangStr,'r_drop');
end;

procedure TFormSal10.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str,fld_name:string;
begin
  if userLang='E' then
    fld_name:='dept_code+'' ''+eng_abbr'
  else if userLang='V' then
    fld_name:='dept_code+'' ''+vim_abbr'
  else
    fld_name:='dept_code+'' ''+abbr_titl';
  sql_str:='select '+fld_name+' as dept_name,dept_code from hrd_dept where '+G_sFactorySql+' ';
  SetComboxList(sql_str,CobDept);
  SalBaseLvl:=GetAllBaseLvl;//基本薪資等級對照
end;

procedure TFormSal10.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(username,'sal10');
  InitLang;// Init language
  InitForm;// Init Form
  Application.CreateForm(TFormPrtSal10,FormPrtSal10);
//  Application.CreateForm(TFormPrtSal10_rub,FormPrtSal10_rub);
end;

procedure TFormSal10.SetPrintDataset(PrintFlag:boolean);
//設置打印數據集
var
  sql_str,emp_id:string;
  i:integer;
begin
  //sql_str:='select *,(D.abbr_titl + E.pst_chs) as position from hrd_sal_grade as A,hrd_sal_spec as B,hrd_emp as C,hrd_dept as D,hrd_prof as E where A.emp_id=C.emp_id and B.emp_id=C.emp_id and C.dept_code=D.dept_code and C.pst_code=E.pst_code';
  sql_str:='select * from hrd_emp where 1=1';
  if rbemp.Checked then
    sql_str:=sql_str+' and emp_id='''+EditEmp.Text+''''
  else
    sql_str:=sql_str+' and dept_code='''+leftstr(CobDept.Text,6)+''' and epledt is null';
  with ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.add(sql_str);
      open;
      if EOF then
        begin
          WideMessageDlg(GetLangName(LangStr,'not_find_data'),mtConfirmation,[mbok],0);
          exit;
        end;
      while not EOF do
        begin
          emp_id:=ADOQuery1.FieldByName('emp_id').AsString;
          with ADODataSet1 do
            begin
              Active:=false;
              CommandText:='select * from hrd_saltran where id in (select top 5  id from hrd_saltran where emp_id='''+emp_id+''' order by valid_date desc)';
              Active:=true;
              for i:=RecordCount+1 to 8 do
              begin//共顯示8行
                Append;
                FieldByName('emp_id').AsString:=emp_id;
                Post;
              end;
            end;
          if PrintFlag then
            SetStatusText(GetLangName(LangStr,'while_printing')+GetLangName(LangStr,'fld_emp_id')+FieldByName('emp_id').AsString);
        //按部門打印/預覽
          with FormPrtSal10.QuickRep1 do
            begin
              if PrintFlag then
                Print
              else if ADOQuery1.RecNo=1 then
                begin
                  if ADOQuery1.RecordCount>1 then
                    WideMessageDlg(GetLangName(LangStr,'print_muti_page_pre'),mtConfirmation,[mbok],0);
                  Preview;
                  exit;
                end;
            end;
          next;
        end;
    end;

  if PrintFlag then
    SetStatusText(GetLangName(LangStr,'print_finish'));
end;
//add hyt
procedure TFormSal10.SetPrintDataset_rub(PrintFlag:boolean);
//設置打印數據集
var
  sql_str,emp_id:string;
begin
  sql_str:='select * from hrd_emp where left(dept_code,1)=''N'' and epledt is null';  //只有 化工才可用
  if rbemp.Checked then
    sql_str:=sql_str+' and emp_id='''+EditEmp.Text+''''
  else
    sql_str:=sql_str+' and dept_code='''+leftstr(CobDept.Text,6)+'''';
  with ADOQuery2 do
  begin
    close;
    sql.Clear;
    sql.add(sql_str);
    open;
    if EOF then
    begin
      WideMessageDlg(GetLangName(LangStr,'not_find_data'),mtConfirmation,[mbok],0);
      exit;
    end;
    while not EOF do
    begin
      emp_id:=ADOQuery2.FieldByName('emp_id').AsString;

      if PrintFlag then
        SetStatusText(GetLangName(LangStr,'while_printing')+GetLangName(LangStr,'fld_emp_id')+FieldByName('emp_id').AsString);
      //按部門打印/預覽
      {with FormPrtSal10_rub.QuickRep1 do
      begin
        if PrintFlag then
          Print
        else if ADOQuery2.RecNo=1 then
        begin
          if ADOQuery2.RecordCount>1 then
            WideMessageDlg(GetLangName(LangStr,'print_muti_page_pre'),mtConfirmation,[mbok],0);
          Preview;
          exit;
        end;
      end;}
      next;
    end;
  end;

  if PrintFlag then
    SetStatusText(GetLangName(LangStr,'print_finish'));
end;

procedure TFormSal10.BtnPrintClick(Sender: TObject);
//打印內容設置
begin
  //2012-09-07 hyt add
  if RbEmp.Checked then
  begin
    if AnalysisEmpFactory(EditEmp.Text)=false then
      exit ;
  end;

  //打印(預覽)
  if TtntButton(Sender).Name='BtnPrint' then
    begin
      if PrintDialog1.Execute then
        if TntRadioButton_face.Checked then  //upd hyt
          SetPrintDataset(true)
        else
          SetPrintDataset_rub(true);
    end
  else
    if TntRadioButton_face.Checked then      //upd hyt
      SetPrintDataset(false)
    else
      SetPrintDataset_rub(false);
end;

procedure TFormSal10.sb_FindEmpClick(Sender: TObject);
begin
  editemp.Text:=FindEmpId('emp_id');
end;

procedure TFormSal10.ADOQuery1CalcFields(DataSet: TDataSet);
var
  key,SqlStr,PstCode,DeptCode,EduCode, clmon :string;
  InDate,valid_date,LeDate:TDateTime;
begin
  PstCode:=DataSet.FieldByName('pst_code').AsString;
  EduCode:=DataSet.FieldByName('edu_code').AsString;
  DeptCode:=DataSet.FieldByName('dept_code').AsString;
  InDate:=DataSet.FieldByName('epindt').AsDateTime;
  LeDate:=DataSet.FieldByName('epindt').AsDateTime;
  with DMHrdsys.SQLQuery4 do
  begin
    //dept_code
    key:=DataSet.FieldByName('dept_code').AsString;
    SqlStr:='select * from hrd_dept where dept_code='''+key+'''';
    Close;
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;
    DataSet.FieldByName('abbr_titl').AsString:=FieldByName('abbr_titl').AsString;
    //pst_code
    key:=DataSet.FieldByName('pst_code').AsString;
    SqlStr:='select * from hrd_prof where pst_code='''+key+'''';
    Close;
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;
    DataSet.FieldByName('position').AsString:=DataSet.FieldByName('abbr_titl').AsString+FieldByName('pst_chs').AsString;
    //sal_achi
    key:=DataSet.FieldByName('emp_id').AsString;
    SqlStr:='select * from hrd_sal_spec where emp_id='''+key+'''';
    Close;
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;
    DataSet.FieldByName('sal_achi').AsString:=FieldByName('sal_achi').AsString;
    //DataSet.FieldByName('sal_spec').AsString:=FieldByName('sal_spec').AsString;
    //sal_grade
    key:=DataSet.FieldByName('emp_id').AsString;
    SqlStr:='select top 1 * from hrd_saltran where emp_id='''+key+''' order by valid_date desc';
    Close;
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;
    DataSet.FieldByName('sal_grade').AsString:=FieldByName('sal_grade').AsString;
    //DataSet.FieldByName('sal_base').AsString:=FieldByName('sal_base').AsString;
    DataSet.FieldByName('sal_mgmt').AsString:=FieldByName('sal_mgmt').AsString;
    DataSet.FieldByName('sal_tech').AsString:=FieldByName('sal_tech').AsString;
    DataSet.FieldByName('pst_pay').AsString:=FieldByName('pst_pay').AsString;
    DataSet.FieldByName('grade_pay').AsString:=FieldByName('grade_pay').AsString;
    DataSet.FieldByName('sal_spec').AsString:=FieldByName('sal_spec').AsString;
    DataSet.FieldByName('gong_pay').AsString:='400000' ; //'200000';
    DataSet.FieldByName('full_awd').AsString:='200000';
    valid_date:=FieldByName('valid_date').AsDateTime;
    //基本薪資
    {if (valid_date-indate<30) or ((valid_date-indate<60) and (PstCode<='50')) then//試用期
      DataSet.FieldByName('sal_base').AsFloat:=StrToFloat(SalBaseLvl.Strings[1])
    else}
    //正式基本薪資
    if UpperCase(LeftStr(DeptCode,1))='N' then
    begin
      //DataSet.FieldByName('sal_base').AsFloat:=GetNormalBase_Rub(PstCode,EduCode,InDate,SalBaseLvl,false);
    end
    else
    begin
      paymon := formatdatetime('yyyymm',DMHrdsys.SQLQuery4.FieldByName('valid_date').AsDateTime ) ;  //copy( datetostr( DMHrdsys.SQLQuery4.FieldByName('valid_date').AsDateTime ), 1, 4 ) + copy( datetostr( DMHrdsys.SQLQuery4.FieldByName('valid_date').AsDateTime ), 6, 2 ) ;
   //   if clmon <='200801' then
        DataSet.FieldByName('sal_base').AsFloat:=GetBase( key,paymon,PstCode,InDate,LeDate,EduCode)  ;//GetNormalBase( DataSet.FieldByName('emp_id').AsString,paymon,PstCode,EduCode,InDate,SalBaseLvl)  ;
     // else
      //  DataSet.FieldByName('sal_base').AsFloat:=GetNormalBase(clmon,PstCode,EduCode,InDate,SalBaseLvl) + 92300;
      if (Eof) and (PstCode='50') then
        DataSet.FieldByName('grade_pay').AsString:='20000';
    end;
    //DataSet.FieldByName('sal_base').AsFloat:=GetNormalBase(PstCode,EduCode,InDate,SalBaseLvl);
  end;
  with DataSet do
  begin
    //合計
    FieldByName('total').AsFloat:=FieldByName('sal_base').AsFloat
      +FieldByName('sal_mgmt').AsFloat+FieldByName('sal_tech').AsFloat
      +FieldByName('pst_pay').AsFloat+FieldByName('grade_pay').AsFloat
      +FieldByName('sal_achi').AsFloat+FieldByName('sal_spec').AsFloat
      +FieldByName('full_awd').AsFloat+FieldByName('gong_pay').AsFloat;
  end;
end;
//add hyt
procedure TFormSal10.ADOQuery2CalcFields(DataSet: TDataSet);
var
  key,SqlStr,PstCode,EduCode,lcs, clmon :string;
  InDate,valid_date:TDateTime;
  lciRec:integer;
begin
  { chk1-5
    emp_cn_vn,edu_name,abbr_titl
    prd_grade,position
    sal_base,grade_pay,pst_pay,sal_mgmt,sal_tech,ton_pay,prd_pay,envir_pay,full_awd,total0

    valid_date1,abbr_titl1,prd_grade1,position1,sal_base1,grade_pay1,pst_pay1,sal_mgmt1,
    sal_tech1,ton_pay1,prd_pay1  ==>(1-5)

    p_date1,p_name1 ==>(1-5)}
  DataSet.FieldByName('emp_cn_vn').AsString :=DataSet.FieldByName('emp_chs').AsString +
         ' / '+DataSet.FieldByName('name_vim').AsString;

  PstCode:=DataSet.FieldByName('pst_code').AsString;
  EduCode:=DataSet.FieldByName('edu_code').AsString;
  InDate :=DataSet.FieldByName('epindt').AsDateTime;

  //dept_code==>abbr_titl
  key:=DataSet.FieldByName('dept_code').AsString;
  SqlStr:='select dept_titl as abbr_titl from hrd_dept where dept_code='''+key+'''';
  DMHrdsys.SQLQuery4.Close;
  DMHrdsys.SQLQuery4.Sql.Clear;
  DMHrdsys.SQLQuery4.Sql.Add(SqlStr);
  DMHrdsys.SQLQuery4.Open;
  DataSet.FieldByName('abbr_titl').AsString :=DMHrdsys.SQLQuery4.FieldByName('abbr_titl').AsString ;
  //pst_code==>position
  key:=DataSet.FieldByName('pst_code').AsString;
  SqlStr:='select pst_chs as abbr_titl from hrd_prof where pst_code='''+key+'''';
  DMHrdsys.SQLQuery4.Close;
  DMHrdsys.SQLQuery4.Sql.Clear;
  DMHrdsys.SQLQuery4.Sql.Add(SqlStr);
  DMHrdsys.SQLQuery4.Open;
  DataSet.FieldByName('position').AsString:=DMHrdsys.SQLQuery4.FieldByName('abbr_titl').AsString ;
  //edu_code==>edu_name
  key:=DataSet.FieldByName('edu_code').AsString;
  {SqlStr:='select edu_titl from hrd_educ where edu_code='''+key+'''';
  DMHrdsys.SQLQuery4.Close;
  DMHrdsys.SQLQuery4.Sql.Clear;
  DMHrdsys.SQLQuery4.Sql.Add(SqlStr);
  DMHrdsys.SQLQuery4.Open;
  DataSet.FieldByName('edu_name').AsString :=DMHrdsys.SQLQuery4.FieldByName('edu_titl').AsString ;}
  DataSet.FieldByName('edu_name').AsString :=key+' 年';
  //saltran 's data
  key:=DataSet.FieldByName('emp_id').AsString;
  SqlStr:='select top 5 *,(select abbr_titl from hrd_dept where dept_code=a.dept_code)'+
          ' as abbr_titl,(select pst_chs as abbr_titl from hrd_prof where pst_code=a.pst_code)'+
          ' as position from hrd_saltran as a where emp_id='''+key+''' order by valid_date desc';
  DMHrdsys.SQLQuery4.Close;
  DMHrdsys.SQLQuery4.Sql.Clear;
  DMHrdsys.SQLQuery4.Sql.Add(SqlStr);
  DMHrdsys.SQLQuery4.Open;

  lciRec:=DMHrdsys.SQLQuery4.RecordCount;
  while not DMHrdsys.SQLQuery4.Eof do
  begin
    if lciRec=DMHrdsys.SQLQuery4.RecordCount then
    begin //取最新一筆
     // prd_grade,position ,sal_base,grade_pay,pst_pay,sal_mgmt,sal_tech,
     // ton_pay,prd_pay,envir_pay,full_awd,total0

      DataSet.FieldByName('prd_grade').AsString :=DMHrdsys.SQLQuery4.FieldByName('prd_grade').AsString ;
      //基本薪資
      valid_date:=DMHrdsys.SQLQuery4.FieldByName('valid_date').AsDateTime;
      //if (valid_date-indate<30) or ((valid_date-indate<60) and (PstCode<='50')) then//試用期
      //  DataSet.FieldByName('sal_base').AsFloat:=StrToFloat(SalBaseLvl.Strings[1])
      //else                                                                                                //,valid_date
    //  DataSet.FieldByName('sal_base').AsFloat:=GetNormalBase(PstCode,EduCode,InDate,SalBaseLvl,false);//正式基本薪資
      //DataSet.FieldByName('sal_base').AsFloat :=GetNormalBase_rub(PstCode,EduCode,InDate,SalBaseLvl,false);//正式基本薪資
      //DataSet.FieldByName('sal_base').AsString :=DMHrdsys.SQLQuery4.FieldByName('sal_base').AsString ;

      DataSet.FieldByName('grade_pay').AsString :=DMHrdsys.SQLQuery4.FieldByName('grade_pay').AsString ;
      DataSet.FieldByName('pst_pay').AsString :=DMHrdsys.SQLQuery4.FieldByName('pst_pay').AsString ;
      DataSet.FieldByName('sal_mgmt').AsString :=DMHrdsys.SQLQuery4.FieldByName('sal_mgmt').AsString ;
      DataSet.FieldByName('sal_tech').AsString :=DMHrdsys.SQLQuery4.FieldByName('sal_tech').AsString ;
      DataSet.FieldByName('ton_pay').AsString :=DMHrdsys.SQLQuery4.FieldByName('ton_pay').AsString ;
      DataSet.FieldByName('prd_pay').AsString :=DMHrdsys.SQLQuery4.FieldByName('prd_pay').AsString ;
      DataSet.FieldByName('envir_pay').AsString :=DMHrdsys.SQLQuery4.FieldByName('envir_pay').AsString ;
      DataSet.FieldByName('full_awd').Value :=60000 ;
      //合計
      DataSet.FieldByName('total0').Value :=DataSet.FieldByName('sal_base').Value+
                                            DataSet.FieldByName('grade_pay').Value+
                                            DataSet.FieldByName('pst_pay').Value+
                                            DataSet.FieldByName('sal_mgmt').Value+
                                            DataSet.FieldByName('sal_tech').Value+
                                            DataSet.FieldByName('ton_pay').Value+
                                            DataSet.FieldByName('prd_pay').Value+
                                            DataSet.FieldByName('envir_pay').Value+
                                            DataSet.FieldByName('full_awd').Value;
    end;
    //valid_date1,abbr_titl1,prd_grade1,position1,sal_base1,grade_pay1,pst_pay1,
    //sal_mgmt1,sal_tech1,ton_pay1,prd_pay1
    lcs:=formatFloat('0',lciRec);
    DataSet.FieldByName('valid_date'+lcs).AsString :=DMHrdsys.SQLQuery4.FieldByName('valid_date').AsString ;
    DataSet.FieldByName('abbr_titl'+lcs).AsString :=DMHrdsys.SQLQuery4.FieldByName('abbr_titl').AsString ;
    DataSet.FieldByName('prd_grade'+lcs).AsString :=DMHrdsys.SQLQuery4.FieldByName('prd_grade').AsString ;
    DataSet.FieldByName('position'+lcs).AsString :=DMHrdsys.SQLQuery4.FieldByName('position').AsString ;
    if lciRec=DMHrdsys.SQLQuery4.RecordCount then
      DataSet.FieldByName('sal_base'+lcs).AsString :=DataSet.FieldByName('sal_base').AsString
    else
      DataSet.FieldByName('sal_base'+lcs).AsString :=DMHrdsys.SQLQuery4.FieldByName('sal_base').AsString ;
    DataSet.FieldByName('grade_pay'+lcs).AsString :=DMHrdsys.SQLQuery4.FieldByName('grade_pay').AsString ;
    DataSet.FieldByName('pst_pay'+lcs).AsString :=DMHrdsys.SQLQuery4.FieldByName('pst_pay').AsString ;
    DataSet.FieldByName('sal_mgmt'+lcs).AsString :=DMHrdsys.SQLQuery4.FieldByName('sal_mgmt').AsString ;
    DataSet.FieldByName('sal_tech'+lcs).AsString :=DMHrdsys.SQLQuery4.FieldByName('sal_tech').AsString ;
    DataSet.FieldByName('ton_pay'+lcs).AsString :=DMHrdsys.SQLQuery4.FieldByName('ton_pay').AsString ;
    DataSet.FieldByName('prd_pay'+lcs).AsString :=DMHrdsys.SQLQuery4.FieldByName('prd_pay').AsString ;

    //DMHrdsys.SQLQuery4.
    lciRec:=lciRec-1;  //倒退法
    DMHrdsys.SQLQuery4.Next ;
  end;
  //無薪資紀律
  if DMHrdsys.SQLQuery4.RecordCount<=0 then
  begin
    valid_date:=date;
    //基本薪資
   // if (valid_date-indate<30) or ((valid_date-indate<60) and (PstCode<='50')) then//試用期
    //  DataSet.FieldByName('sal_base').AsFloat:=StrToFloat(SalBaseLvl.Strings[1]);
    //else
      DataSet.FieldByName('sal_base').AsFloat:=GetNormalBase(DataSet.FieldByName('emp_id').AsString ,paymon, PstCode,EduCode,InDate,SalBaseLvl);//正式基本薪資
    //
      //DataSet.FieldByName('prd_grade').AsString :=DMHrdsys.SQLQuery4.FieldByName('prd_grade').AsString ;
     // //基本薪資 未考慮？？？
     // DataSet.FieldByName('sal_base').Value :=GetNormalBase(PstCode,EduCode,InDate,SalBaseLvl,
      DataSet.FieldByName('full_awd').Value :=100000 ;
      //合計
      DataSet.FieldByName('total0').Value :=DataSet.FieldByName('sal_base').Value+
                                            DataSet.FieldByName('full_awd').Value;
  end;

  //獎懲
  key:=DataSet.FieldByName('emp_id').AsString;
  SqlStr:='select top 5 p_p_date as p_date,(select script_cht from hrd_prs_type where prs_type=a.p_p_type)'+
          ' as p_name from hrd_prs_pun as a where emp_id='''+key+''' order by p_p_date desc';
  DMHrdsys.SQLQuery4.Close;
  DMHrdsys.SQLQuery4.Sql.Clear;
  DMHrdsys.SQLQuery4.Sql.Add(SqlStr);
  DMHrdsys.SQLQuery4.Open;
  lciRec:=DMHrdsys.SQLQuery4.RecordCount;
  while not DMHrdsys.SQLQuery4.Eof do
  begin
    lcs:=formatFloat('0',lciRec);
    DataSet.FieldByName('p_date'+lcs).Value :=DMHrdsys.SQLQuery4.FieldByName('p_date').Value ;
    DataSet.FieldByName('p_name'+lcs).Value :=DMHrdsys.SQLQuery4.FieldByName('p_name').Value ;

    lciRec:=lciRec-1;
    DMHrdsys.SQLQuery4.Next ;
  end;
  //狀態
  if TntRadioButton_new.Checked then
    DataSet.FieldByName('chk1').Value :='V';
  if TntRadioButton_adjust.Checked then
    DataSet.FieldByName('chk2').Value :='V';
  if TntRadioButton_move.Checked then
    DataSet.FieldByName('chk3').Value :='V';
  if TntRadioButton_rise.Checked then
    DataSet.FieldByName('chk4').Value :='V';
 if TntRadioButton_drop.Checked then
    DataSet.FieldByName('chk5').Value :='V';

end;

procedure TFormSal10.TntRadioButton_rubClick(Sender: TObject);
begin
  Panel_rub.Visible :=true;
end;

procedure TFormSal10.TntRadioButton_faceClick(Sender: TObject);
begin
  Panel_rub.Visible :=false;
end;

procedure TFormSal10.ADODataSet1CalcFields(DataSet: TDataSet);
var
  sql_str,key:string;
begin
  key:=DataSet.FieldByName('pst_code').AsString;
  sql_str:='select * from hrd_prof where pst_code='''+key+'''';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      DataSet.FieldByName('pst_name').AsString:=FieldByName('pst_chs').AsString;
  end;
end;
{===============================================================================
  函數名稱:GetBase  -- 計算員工基本工資
  參數:    EmpId -- 員工工號  PayMon  -- 工資月份 PstCode -- 職稱
           EmpInDate -- 進廠日期  EmpLvDate -- 離職日期
===============================================================================}
function TFormSal10.GetBase(EmpId,PayMon,PstCode:String;EmpInDate,EmpLvDate:TDateTime;EduCode:string=''):Currency;
var
  PayNormal,PayTest:Currency;
  NormalTestDays:TNormalTestDays;
  NormalDays,TestDays,edu_no:Integer;
begin

     PayNormal:=GetNormalBase(Empid, paymon, PstCode,EduCode,EmpInDate,SalBaseLvl,false); //正式基本薪資
     if PayNormal = 950000 then
        Result:=PayNormal + 170000
     else
        Result:=PayNormal;

end;

end.
