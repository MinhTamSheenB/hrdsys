{******************************************************************************
name：fhrd305(薪資結構查詢)
author: tristan
create date:2005-08-23
commentate:薪資結構查詢
*******************************************************************************}

unit uFhrd305;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, ExtCtrls, TntExtCtrls, Grids, DBGrids,
  TntDBGrids, Buttons, TntButtons, DBCtrls, DB,StrUtils,WSDLIntf, Mask,
  TntDbCtrls, ComCtrls,TntComCtrls, ADODB,tntDialogs, DateUtils,TntGrids,
  CheckLst, TntCheckLst;

type
  TFormfhrd305 = class(TForm)
    TntPanel1: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntGroupBox2: TTntGroupBox;
    salStrucGrid: TTntDBGrid;
    selData: TTntBitBtn;
    prnData: TTntBitBtn;
    empSalStruQry: TADOQuery;
    empSalStruDataSource: TDataSource;
    empSalStruQryupd_user: TWideStringField;
    empSalStruQryupd_date: TDateTimeField;
    empSalStruQryemp_id: TWideStringField;
    empSalStruQryvalid_date: TDateTimeField;
    empSalStruQrydept_code: TWideStringField;
    empSalStruQrydept_title: TWideStringField;
    empSalStruQrypst_code: TWideStringField;
    empSalStruQrytryout: TStringField;
    empSalStruQrybase_amt: TBCDField;
    empSalStruQryfrn_amt: TBCDField;
    empSalStruQryfaward_amt: TBCDField;
    empSalStruQryover_amt: TBCDField;
    empSalStruQrylocal_amt: TBCDField;
    empSalStruQryactu_sal: TFloatField;
    TntLabel10: TTntLabel;
    deptBegCob: TTntComboBox;
    deptEndCob: TTntComboBox;
    TntLabel6: TTntLabel;
    empIdBeg: TTntEdit;
    empIdEnd: TTntEdit;
    empSalStruQryemp_name: TStringField;
    RbAllWork: TTntRadioButton;
    RbLeftWork: TTntRadioButton;
    RbInWork: TTntRadioButton;
    empSalStruQrypst_name: TStringField;
    empSalStruQrybank_sal: TFloatField;

    // user create function and procedure

    procedure InitLang;
    procedure setDeptCob;

    // system create proceudre

    procedure FormCreate(Sender: TObject);
    procedure selDataClick(Sender: TObject);
    procedure salStrucGridTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure prnDataClick(Sender: TObject);
    procedure empSalStruQryCalcFields(DataSet: TDataSet);
    procedure empSalStruQryAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd305: TFormfhrd305;

implementation

uses
  UnitHrdUtils,unitDMHrdsys,UnitHrdMain,uFhrd305Report;

{$R *.dfm}

{***定義全局變量***}
var
  g_sLangStr : TWideStrings;

{*****************************************
Name: InitLang
Func: 初始化語言變量
Args:
    sKeys->語言變量
*****************************************}

procedure TFormfhrd305.InitLang;
var
  sKeys : string;
begin
  SetComponentLang(self);//set component language text
  sKeys:='fhrd305,emp_id,fld_department,button_query,fhrd104_condition,'+
  'print,quit,browsedata,c_name,sal_bas,sal_frn,local_amt,confirm_close,'+
  'msg_set_dept,msg_empid_null,msg_cho_dept,msg_cho_dept,position,'+
  'msg_no_record,msg_query_error,current_location,total';

  g_sLangStr:=GetLangWideStrs(sKeys);

  TntPanel1.Caption:=GetLangName(g_sLangStr,'fhrd305');
  prnData.Caption := GetLangName(g_sLangStr,'print');
  selData.Caption := GetLangName(g_sLangStr,'button_query');
  TntGroupBox1.Caption:=GetLangName(g_sLangStr,'fhrd104_condition');
  TntGroupBox2.Caption:=GetLangName(g_sLangStr,'browsedata');

end;

{*****************************************
Name: setDeptCob
Func: 初始化部門資料
Args:
******************************************}

procedure TFormFhrd305.setDeptCob;
begin
  try
    with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;          //fhrd_dept==>hrd_dept 2011-10-27 hyt upd
      sql.Add('select * from hrd_dept order by dept_code');
      open;
      while Not Eof do
      begin
        deptBegCob.Items.Add(FieldByName('dept_code').Value+'/'+
        FieldByName('abbr_titl').Value);//dept_abbr
        deptEndCob.Items.Add(FieldByName('dept_code').Value+'/'+
        FieldByName('abbr_titl').Value);
        next;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_set_dept'),
    mtError,[mbyes],1);
  end;
end;

procedure TFormfhrd305.FormCreate(Sender: TObject);
begin
  InitLang;
  prnData.Enabled := false;
  setDeptCob;
end;

{*********************************************
Name: selDataClick
Func: 根據輸入條件查詢薪資結構
Args:
    sSelStr->查詢語句
*********************************************}

procedure TFormfhrd305.selDataClick(Sender: TObject);
var
  sSelStr : string;
begin
  {sSelStr := 'select * from fhrd_tranhist where id in '
    +'( select max(id) from fhrd_tranhist where base_amt>0';
  if trim(empIdBeg.Text)<>'' then
    sSelStr := sSelStr+' and emp_id>='''+empIdBeg.Text+'''';
  if trim(empIdEnd.Text)<>'' then
    sSelStr := sSelStr+' and emp_id<='''+empIdEnd.Text+'''';
  if trim(deptBegCob.Text)<>'' then
    sSelStr := sSelStr+' and dept_code>='''+LeftStr(deptBegCob.Text,6)+'''';
  if trim(deptEndCob.Text)<>'' then
    sSelStr := sSelStr+' and dept_code<='''+LeftStr(deptEndCob.Text,6)+'''';
  if RbInWork.Checked then//在職
    sSelStr:=sSelStr+' and emp_id in (select emp_id from fhrd_emp where emp_ledt is null)';
  if RbLeftWork.Checked then//離職
    sSelStr:=sSelStr+' and emp_id in (select emp_id from fhrd_emp where emp_ledt is not null)';
  sSelStr := sSelStr+' group by emp_id) order by emp_id';}

  //2011-10-27 hyt upd
  sSelStr := 'select * from fhrd_tranhist where 1=1 ';
  if trim(empIdBeg.Text)<>'' then
    sSelStr := sSelStr+' and emp_id>='''+empIdBeg.Text+'''';
  if trim(empIdEnd.Text)<>'' then
    sSelStr := sSelStr+' and emp_id<='''+empIdEnd.Text+'''';
  if trim(deptBegCob.Text)<>'' then
    sSelStr := sSelStr+' and dept_code>='''+LeftStr(deptBegCob.Text,6)+'''';
  if trim(deptEndCob.Text)<>'' then
    sSelStr := sSelStr+' and dept_code<='''+LeftStr(deptEndCob.Text,6)+'''';
  if RbInWork.Checked then//在職
    sSelStr:=sSelStr+' and emp_id in (select emp_id from fhrd_emp where emp_ledt is null)';
  if RbLeftWork.Checked then//離職
    sSelStr:=sSelStr+' and emp_id in (select emp_id from fhrd_emp where emp_ledt is not null)';
  sSelStr := sSelStr+' and id in(SELECT MAX(id) AS id  FROM  fhrd_tranhist WHERE (base_amt > 0) GROUP BY  emp_id) '+
                    'order by emp_id';

  try
    with empSalStruQry do
    begin
      close;
      sql.Clear;
      sql.Add(sSelStr);
      open;
      prnData.Enabled := true;
      if RecordCount<=0 then
      begin
        widemessagedlg(GetLangName(g_sLangStr,'msg_no_record'),mtError,[mbyes],1);
       // prnData.Enabled := false;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_query_error'),mtError,[mbyes],1);
  end;
end;

procedure TFormfhrd305.salStrucGridTitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;

procedure TFormfhrd305.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFormfhrd305.prnDataClick(Sender: TObject);
begin
  ShowPrint(empSalStruQry,'海外幹部薪資結構列印');
{  Application.CreateForm(TFhrd305Report,Fhrd305Report);
  Fhrd305Report.QRLabel41.Caption := FormatDateTime('yyyy/mm',Date);
  Fhrd305Report.qrlabel45.caption :=DateToStr(Date) ;
  Fhrd305Report.Fhrd305QRep.Prepare;
  Fhrd305Report.Fhrd305QRep.Preview;}
end;

procedure TFormfhrd305.empSalStruQryCalcFields(DataSet: TDataSet);
var
  sqlstr,key:string;
begin
  //emp_name
  key:=Dataset.FieldByName('emp_id').AsString;
  sqlstr:='select * from fhrd_emp where emp_id='''+key+'''';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.add(sqlstr);
    open;
    if not Eof then
      DataSet.FieldByName('emp_name').AsString:=FieldByName('emp_name').AsString;
  end;
  //pst_name
  key:=Dataset.FieldByName('pst_code').AsString;
  sqlstr:='select * from hrd_prof where pst_code='''+key+'''';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.add(sqlstr);
    open;
    if not Eof then
      DataSet.FieldByName('pst_name').AsString:=FieldByName('pst_chs').AsString;
  end;
  with DataSet do
  begin
    FieldByName('actu_sal').AsFloat:=FieldByName('base_amt').AsFloat
      +FieldByName('frn_amt').AsFloat+FieldByName('faward_amt').AsFloat
      +FieldByName('over_amt').AsFloat;
    FieldByName('bank_sal').AsFloat:=FieldByName('base_amt').AsFloat
      +FieldByName('frn_amt').AsFloat+FieldByName('faward_amt').AsFloat
      +FieldByName('over_amt').AsFloat-FieldByName('local_amt').AsFloat;
  end;
end;

procedure TFormfhrd305.empSalStruQryAfterScroll(DataSet: TDataSet);
begin
with DataSet do
  setStatusText(GetLangName(g_sLangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(g_sLangStr,'total')+':'+inttostr(RecordCount));
end;

end.
