{*************************************************************************
Name：fhrd314(職薪異動通知單)
Author: tim
Create date:2011-12-14
Modify date:2011-12-14
Commentate:職薪異動通知單
*************************************************************************}
unit uFhrd314;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, DateUtils,QuickRpt;

type
  TFormFhrd314 = class(TForm)
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
    ADOQuery1abbr_titl: TWideStringField;
    ADOQuery1position: TWideStringField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1edu_code: TStringField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1pst_code: TStringField;
    ADOQuery1total: TFloatField;
    Panel_rub: TPanel;
    r_rea00: TTntRadioButton;
    r_rea01: TTntRadioButton;
    r_rea02: TTntRadioButton;
    r_rea03: TTntRadioButton;
    r_rea04: TTntRadioButton;
    ADODataSet1upd_user: TStringField;
    ADODataSet1upd_date: TDateTimeField;
    ADODataSet1emp_id: TStringField;
    ADODataSet1valid_date: TDateTimeField;
    ADODataSet1dept_code: TStringField;
    ADODataSet1pst_code: TStringField;
    ADODataSet1id: TLargeintField;
    ADODataSet1pst_name: TStringField;
    ADODataSet1dept_title: TWideStringField;
    ADODataSet1tryout: TStringField;
    ADODataSet1base_amt: TBCDField;
    ADODataSet1frn_amt: TBCDField;
    ADODataSet1faward_amt: TBCDField;
    ADODataSet1over_amt: TBCDField;
    ADODataSet1local_amt: TBCDField;
    ADODataSet1sal_bas: TWideStringField;
    ADODataSet1sal_frn: TWideStringField;
    ADOQuery1emp_name: TWideStringField;
    ADOQuery1emp_etdt: TDateTimeField;
    ADOQuery1emp_gvdt: TDateTimeField;
    ADOQuery1edu_chs: TStringField;
    ADOQuery1base_amt: TFloatField;
    ADOQuery1frn_amt: TFloatField;
    ADOQuery1faward_amt: TFloatField;
    ADOQuery1over_amt: TFloatField;
    ADODataSet1total: TFloatField;
    r_rea05: TTntRadioButton;
    r_rea06: TTntRadioButton;
    r_rea07: TTntRadioButton;
    r_rea08: TTntRadioButton;
    r_rea09: TTntRadioButton;
    ADOQuery1pre_base_amt: TFloatField;
    ADOQuery1pre_frn_amt: TFloatField;
    ADOQuery1pre_faward_amt: TFloatField;
    ADOQuery1pre_over_amt: TFloatField;
    ADOQuery1pre_total: TFloatField;
    ADOQuery1valid_date: TDateField;
    ADOQuery1pre_position: TWideStringField;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure SetPrintDataset(PrintFlag:boolean);
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFhrd314: TFormFhrd314;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UPrtFhrd314;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  SalBaseLvl:Tstrings;//基本薪資等級額
  PayMon :string ;
{$R *.dfm}

procedure TFormFhrd314.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
keys:=keys+'sal10_titl,not_find_data,while_doing,total,current_location,'
  +'preview,print,while_printing,department,print_finish,by_empid,by_deptcode,'
  +'dut11_stop,dut11_over,dept_begin,dept_end,print_muti_page_pre,'
  +'sal_face,sal_rub,r_new,r_adjust,r_move,r_rise,r_drop,'
  +'r_f_yidong_rea00,r_f_yidong_rea01,r_f_yidong_rea02,r_f_yidong_rea03,'
  +'r_f_yidong_rea04,r_f_yidong_rea05,r_f_yidong_rea06,r_f_yidong_rea07,'
  +'r_f_yidong_rea08,r_f_yidong_rea09';
LangStr:=GetLangWideStrs(keys);
PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
BtnPrint.Caption:=GetLangName(LangStr,'print');
BtnPreview.Caption:=GetLangName(LangStr,'preview');
rbemp.Caption:=GetLangName(LangStr,'by_empid');
rbdept.Caption:=GetLangName(LangStr,'by_deptcode');
r_rea00.Caption   :=GetLangName(LangStr,'r_f_yidong_rea00');
r_rea01.Caption   :=GetLangName(LangStr,'r_f_yidong_rea01');
r_rea02.Caption   :=GetLangName(LangStr,'r_f_yidong_rea02');
r_rea03.Caption   :=GetLangName(LangStr,'r_f_yidong_rea03');
r_rea04.Caption   :=GetLangName(LangStr,'r_f_yidong_rea04');
r_rea05.Caption   :=GetLangName(LangStr,'r_f_yidong_rea05');
r_rea06.Caption   :=GetLangName(LangStr,'r_f_yidong_rea06');
r_rea07.Caption   :=GetLangName(LangStr,'r_f_yidong_rea07');
r_rea08.Caption   :=GetLangName(LangStr,'r_f_yidong_rea08');
r_rea09.Caption   :=GetLangName(LangStr,'r_f_yidong_rea09');
end;

procedure TFormFhrd314.InitForm;
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
  sql_str:='select '+fld_name+' as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,CobDept);
  SalBaseLvl:=GetAllBaseLvl;//基本薪資等級對照
end;

procedure TFormFhrd314.FormCreate(Sender: TObject);
var
   clMonth :string ;
begin
  pri_arr:=GetPrvArr(username,'fhrd314');
  InitLang;// Init language
  if length( inttostr(Monthof( date ) ) ) < 2 then
      clMonth := '0'+ inttostr(Monthof( date ) )
   else
      clMonth := inttostr(Monthof( date ) ) ;
  PayMon := clMonth;
  InitForm;// Init Form
  Application.CreateForm(TFormPrtFhrd314,FormPrtFhrd314);
end;

procedure TFormFhrd314.SetPrintDataset(PrintFlag:boolean);
//設置打印數據集
var
  sql_str,emp_id:string;
  i:integer;
begin
  //sql_str:='select *,(D.abbr_titl + E.pst_chs) as position from hrd_sal_grade as A,hrd_sal_spec as B,hrd_emp as C,hrd_dept as D,hrd_prof as E where A.emp_id=C.emp_id and B.emp_id=C.emp_id and C.dept_code=D.dept_code and C.pst_code=E.pst_code';
  sql_str:='select * from fhrd_emp where 1=1';
  if rbemp.Checked then
    sql_str:=sql_str+' and emp_id='''+EditEmp.Text+''''
  else
    sql_str:=sql_str+' and dept_code='''+leftstr(CobDept.Text,6)+''' and emp_ledt is null';
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
          {with ADODataSet1 do
            begin
              Active:=false;
              CommandText:='select * from fhrd_tranhist where id in (select top 11  id from fhrd_tranhist where emp_id='''+emp_id+''' order by valid_date desc)';
              Active:=true;
              for i:=RecordCount+1 to 11 do
              begin//共顯示11行
                Append;
                FieldByName('emp_id').AsString:=emp_id;
                Post;
              end;
            end;}
          if PrintFlag then
            SetStatusText(GetLangName(LangStr,'while_printing')+GetLangName(LangStr,'fld_emp_id')+FieldByName('emp_id').AsString);
        //按部門打印/預覽
          with FormPrtFhrd314.QuickRep1 do
            begin
              if r_rea00.Checked then
                FormPrtFhrd314.qrl_rea00.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_rea00.Caption :='O';
              if r_rea01.Checked then
                FormPrtFhrd314.qrl_rea01.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_rea01.Caption :='O';
              if r_rea02.Checked then
                FormPrtFhrd314.qrl_rea02.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_rea02.Caption :='O';
              if r_rea03.Checked then
                FormPrtFhrd314.qrl_rea03.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_rea03.Caption :='O';
              if r_rea04.Checked then
                FormPrtFhrd314.qrl_rea04.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_rea04.Caption :='O';
              if r_rea05.Checked then
                FormPrtFhrd314.qrl_rea05.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_rea05.Caption :='O';
              if r_rea06.Checked then
                FormPrtFhrd314.qrl_rea06.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_rea06.Caption :='O';
              if r_rea07.Checked then
                FormPrtFhrd314.qrl_rea07.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_rea07.Caption :='O';
              if r_rea08.Checked then
                FormPrtFhrd314.qrl_rea08.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_rea08.Caption :='O';
              if r_rea09.Checked then
                FormPrtFhrd314.qrl_rea09.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_rea09.Caption :='O';  
              //***2
              if r_rea00.Checked then
                FormPrtFhrd314.qrl_2rea00.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_2rea00.Caption :='O';
              if r_rea01.Checked then
                FormPrtFhrd314.qrl_2rea01.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_2rea01.Caption :='O';
              if r_rea02.Checked then
                FormPrtFhrd314.qrl_2rea02.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_2rea02.Caption :='O';
              if r_rea03.Checked then
                FormPrtFhrd314.qrl_2rea03.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_2rea03.Caption :='O';
              if r_rea04.Checked then
                FormPrtFhrd314.qrl_2rea04.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_2rea04.Caption :='O';
              if r_rea05.Checked then
                FormPrtFhrd314.qrl_2rea05.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_2rea05.Caption :='O';
              if r_rea06.Checked then
                FormPrtFhrd314.qrl_2rea06.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_2rea06.Caption :='O';
              if r_rea07.Checked then
                FormPrtFhrd314.qrl_2rea07.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_2rea07.Caption :='O';
              if r_rea08.Checked then
                FormPrtFhrd314.qrl_2rea08.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_2rea08.Caption :='O';
              if r_rea09.Checked then
                FormPrtFhrd314.qrl_2rea09.Caption :='⊙'
              else
                FormPrtFhrd314.qrl_2rea09.Caption :='O';
              //***
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

procedure TFormFhrd314.BtnPrintClick(Sender: TObject);
//打印內容設置
begin
  //打印(預覽)
  if TtntButton(Sender).Name='BtnPrint' then
    begin
      if PrintDialog1.Execute then
        SetPrintDataset(true)
    end
  else
    SetPrintDataset(false);
end;

procedure TFormFhrd314.ADOQuery1CalcFields(DataSet: TDataSet);
var
  key,SqlStr,PstCode,DeptCode,EduCode:string;
  InDate,valid_date:TDateTime;
begin
  PstCode:=DataSet.FieldByName('pst_code').AsString;
  EduCode:=DataSet.FieldByName('edu_code').AsString;
  DeptCode:=DataSet.FieldByName('dept_code').AsString;
  InDate:=DataSet.FieldByName('emp_etdt').AsDateTime;

  key:=DataSet.FieldByName('dept_code').AsString;
  SqlStr:='select abbr_titl from hrd_dept where dept_code='''+key+'''';
  DataSet.FieldByName('abbr_titl').AsString:=DB_GetSRecord(SqlStr) ;

  key:=DataSet.FieldByName('pst_code').AsString;
  SqlStr:='select pst_chs from hrd_prof where pst_code='''+key+'''';
  DataSet.FieldByName('position').AsString:=DB_GetSRecord(SqlStr); //DataSet.FieldByName('abbr_titl').AsString+

  key:=DataSet.FieldByName('edu_code').AsString;
  SqlStr:='select edu_titl from hrd_educ where edu_code='''+key+'''';
  DataSet.FieldByName('edu_chs').AsString:=DB_GetSRecord(SqlStr);

  with DMHrdsys.SQLQuery4  do
  begin

    key:=DataSet.FieldByName('emp_id').AsString;
    SqlStr:='select top 2 * from fhrd_tranhist where emp_id='''+key+''''
           +' and base_amt>0 order by valid_date desc';
    Close;
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;

    if RecordCount>=1 then
    begin
      DataSet.FieldByName('base_amt').AsString:=FieldByName('base_amt').AsString;
      DataSet.FieldByName('frn_amt').AsString:=FieldByName('frn_amt').AsString;
      DataSet.FieldByName('faward_amt').AsString:=FieldByName('faward_amt').AsString;
      DataSet.FieldByName('over_amt').AsString:=FieldByName('over_amt').AsString;
      DataSet.FieldByName('valid_date').AsString:=FieldByName('valid_date').AsString;

    end;
    if RecordCount>=2 then
    begin
      next;

      DataSet.FieldByName('pre_base_amt').AsString:=FieldByName('base_amt').AsString;
      DataSet.FieldByName('pre_frn_amt').AsString:=FieldByName('frn_amt').AsString;
      DataSet.FieldByName('pre_faward_amt').AsString:=FieldByName('faward_amt').AsString;
      DataSet.FieldByName('pre_over_amt').AsString:=FieldByName('over_amt').AsString;

      key:=FieldByName('pst_code').AsString;
      SqlStr:='select pst_chs from hrd_prof where pst_code='''+key+'''';
      DataSet.FieldByName('pre_position').AsString:=DB_GetSRecord(SqlStr);
    end;

  end;
  with DataSet do
  begin
    //合計
    FieldByName('total').AsFloat:=FieldByName('base_amt').AsFloat
                                  +FieldByName('frn_amt').AsFloat+FieldByName('faward_amt').AsFloat
                                  +FieldByName('over_amt').AsFloat;
    FieldByName('pre_total').AsFloat:=FieldByName('pre_base_amt').AsFloat
                                      +FieldByName('pre_frn_amt').AsFloat+FieldByName('pre_faward_amt').AsFloat
                                      +FieldByName('pre_over_amt').AsFloat;
  end;

end;



end.
