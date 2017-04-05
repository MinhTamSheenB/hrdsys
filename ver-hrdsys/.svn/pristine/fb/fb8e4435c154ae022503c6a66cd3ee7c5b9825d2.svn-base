unit UnitSal11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt;


type
  TFormSal11 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PanelData: TPanel;
    TntGroupBox1: TTntGroupBox;
    bb_ok: TTntBitBtn;
    bb_reset: TTntBitBtn;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    TntPanel1: TTntPanel;
    edit_month: TMaskEdit;
    Label_month: TTntLabel;
    cbEmp: TTntCheckBox;
    cbDept: TTntCheckBox;
    TntLabel1: TTntLabel;
    SP: TADOStoredProc;
    TntDBGrid1: TTntDBGrid;
    TntPanel2: TTntPanel;
    TntGroupBox2: TTntGroupBox;
    TntGroupBox3: TTntGroupBox;
    TntDBEdit6: TTntDBEdit;
    TntLabel8: TTntLabel;
    TntDBEdit7: TTntDBEdit;
    TntLabel9: TTntLabel;
    TntDBEdit8: TTntDBEdit;
    TntDBEdit9: TTntDBEdit;
    TntLabel10: TTntLabel;
    TntLabel11: TTntLabel;
    TntDBEdit12: TTntDBEdit;
    TntLabel13: TTntLabel;
    TntLabel14: TTntLabel;
    TntLabel15: TTntLabel;
    TntDBEdit14: TTntDBEdit;
    TntLabel16: TTntLabel;
    TntDBEdit15: TTntDBEdit;
    TntDBEdit16: TTntDBEdit;
    TntLabel20: TTntLabel;
    TntDBEdit19: TTntDBEdit;
    TntGroupBox4: TTntGroupBox;
    TntLabel2: TTntLabel;
    TntDBEdit1: TTntDBEdit;
    TntLabel3: TTntLabel;
    TntDBEdit2: TTntDBEdit;
    TntDBEdit3: TTntDBEdit;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    TntDBEdit4: TTntDBEdit;
    TntLabel4: TTntLabel;
    TntDBEdit5: TTntDBEdit;
    TntLabel23: TTntLabel;
    TntDBEdit22: TTntDBEdit;
    TntLabel24: TTntLabel;
    TntDBEdit23: TTntDBEdit;
    TntDBEdit24: TTntDBEdit;
    TntLabel25: TTntLabel;
    TntLabel26: TTntLabel;
    TntDBEdit25: TTntDBEdit;
    TntLabel27: TTntLabel;
    TntDBEdit26: TTntDBEdit;
    TntLabel28: TTntLabel;
    TntDBEdit27: TTntDBEdit;
    TntLabel29: TTntLabel;
    TntDBEdit28: TTntDBEdit;
    TntLabel30: TTntLabel;
    TntDBEdit29: TTntDBEdit;
    TntLabel31: TTntLabel;
    TntDBEdit30: TTntDBEdit;
    TntLabel32: TTntLabel;
    TntDBEdit31: TTntDBEdit;
    TntLabel34: TTntLabel;
    TntDBEdit33: TTntDBEdit;
    TntLabel36: TTntLabel;
    TntDBEdit35: TTntDBEdit;
    TntLabel37: TTntLabel;
    TntDBEdit36: TTntDBEdit;
    TntLabel38: TTntLabel;
    TntDBEdit37: TTntDBEdit;
    TntLabel40: TTntLabel;
    TntDBEdit39: TTntDBEdit;
    TntDBEdit40: TTntDBEdit;
    TntLabel41: TTntLabel;
    SPemp_id: TStringField;
    SPemp_chs: TWideStringField;
    SPepid_no: TStringField;
    SPepbirth: TDateTimeField;
    SPepsexd: TStringField;
    SPifmarry: TStringField;
    SPepAddrchs: TWideStringField;
    SPtpAddrchs: TWideStringField;
    SPedu_code: TStringField;
    SPchs_status: TStringField;
    SPeng_status: TStringField;
    SPepid_date: TDateTimeField;
    SPepid_area: TWideStringField;
    SPfactory: TStringField;
    SPdept_code: TStringField;
    SPepindt: TDateTimeField;
    SPepledt: TDateTimeField;
    SPpst_code: TStringField;
    SPinfo_code: TStringField;
    SPspc_id: TStringField;
    SPname_eng: TWideStringField;
    SPname_vim: TWideStringField;
    SPepAddrvim: TWideStringField;
    SPepAddreng: TWideStringField;
    SPtpAddrvim: TWideStringField;
    SPtpAddreng: TWideStringField;
    SPepid_vim: TWideStringField;
    SPepid_eng: TWideStringField;
    TntLabel42: TTntLabel;
    TntDBEdit41: TTntDBEdit;
    ADOQuery2: TADOQuery;
    SPabbr_titl: TTntWideStringField;
    DataSource2: TDataSource;
    ADOQuery3: TADOQuery;
    SPpst_chs: TTntWideStringField;
    ADOQuery4: TADOQuery;
    SPsal_grad: TIntegerField;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure edit_monthChange(Sender: TObject);
    procedure cbEmpClick(Sender: TObject);
    procedure bb_resetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditEmpBeginDblClick(Sender: TObject);
    procedure bb_okClick(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure SPAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal11: TFormSal11;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  Prv:TPrvArr;//權限數組

{$R *.dfm}

procedure TFormSal11.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
//  i:integer;
begin

keys:=keys+'sal11_titl,not_find_data,while_doing,'
  +'month,fld_emp_chs,'
  +'query,print,reset,search_condition';
LangStr:=GetLangWideStrs(keys);
PanelTitle.Caption:=GetLangName(LangStr,'sal11_titl');
SetComponentLang(self);

end;

procedure TFormSal11.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  Prv:=GetPrvArr(UserName,'sal11');
  if Prv[INQ] then
    PanelData.Enabled := true
  else
    PanelData.Enabled := false;
  if not HaveSpcPrv(UserName,'sal11') then
    PanelData.Enabled := false;
//edit_month.Text := formatdatetime('yyyymm',date-strtoint(formatdatetime('dd',date))-1);
  SetComboxList('select dept_code+'' ''+abbr_titl from hrd_dept order by dept_code',CobDeptBegin);
  SetComboxList('select dept_code+'' ''+abbr_titl from hrd_dept order by dept_code',CobDeptEnd);
end;

procedure TFormSal11.edit_monthChange(Sender: TObject);
begin
  if length(TMaskEdit(sender).Text)<>6 then
    exit;
  if (strtoint(rightstr(TMaskEdit(sender).Text,2))>12) or (strtoint(rightstr(TMaskEdit(sender).Text,2))<1) then
  begin
    TMaskEdit(sender).Text:='';
    wideshowmessage('月份輸入有誤!');
    exit;
  end;
  if strtoint(TMaskEdit(sender).Text)>strtoint(formatdatetime('yyyymm',date)) then
  begin
    TMaskEdit(sender).Text:='';
    wideshowmessage('不能大于當前月份!');
    exit;
  end;
  edit_month.Enabled := false;
  cbEmp.Enabled := true;
  cbDept.Enabled := true;
  bb_ok.Enabled := true;
  bb_reset.Enabled := true;
end;

procedure TFormSal11.cbEmpClick(Sender: TObject);
begin
  if cbEmp.Checked then
  begin
    EditEmpBegin.Enabled := true;
    EditEmpEnd.Enabled := true;
  end
  else
  begin
    EditEmpBegin.Enabled := false;
    EditEmpEnd.Enabled := false;
  end;
  if cbDept.Checked then
  begin
    CobDeptBegin.Enabled := true;
    CobDeptEnd.Enabled := true;
  end
  else
  begin
    CobDeptBegin.Enabled := false;
    CobDeptEnd.Enabled := false;
  end;
end;

procedure TFormSal11.bb_resetClick(Sender: TObject);
begin
  edit_month.Enabled := true;
  edit_month.Text :='';
  cbEmp.Enabled := false;
  cbDept.Enabled := false;
  cbEmp.Checked := false;
  cbDept.Checked := false;
  bb_ok.Enabled := false;
  bb_reset.Enabled := false;
  EditEmpBegin.Enabled := false;
  EditEmpEnd.Enabled := false;
  CobDeptBegin.Enabled := false;
  CobDeptEnd.Enabled := false;
  Sp.Close;
  ADOQUERY1.Close;
  ADOQUERY2.Close;
  Sp.Parameters.ParamByName('@emp_begin').Value := '';
  Sp.Parameters.ParamByName('@emp_end').Value := '';
  Sp.Parameters.ParamByName('@dept_begin').Value := '';
  Sp.Parameters.ParamByName('@dept_end').Value := '';
end;

procedure TFormSal11.FormCreate(Sender: TObject);
begin
  //
  InitLang;
  InitForm;
end;

procedure TFormSal11.EditEmpBeginDblClick(Sender: TObject);
var
  EmpId :string;
begin
  EmpId := FindEmpId('emp_id');
  if EmpId<>'' then
    TEdit(sender).Text := EmpId;
end;

procedure TFormSal11.bb_okClick(Sender: TObject);
begin
  if (not cbEmp.Checked) and (not cbDept.Checked) then
    exit;
  SP.Close;
  if cbEmp.Checked then
  begin
    if trim(EditEmpBegin.Text)<>'' then
      Sp.Parameters.ParamByName('@emp_begin').Value := trim(EditEmpBegin.Text);
    if trim(EditEmpEnd.Text)<>'' then
      Sp.Parameters.ParamByName('@emp_end').Value := trim(EditEmpEnd.Text);
  end;
  if cbDept.Checked then
  begin
    if trim(CobDeptBegin.Text)<>'' then
      Sp.Parameters.ParamByName('@dept_begin').Value := trim(leftstr(CobDeptBegin.Text,6));
    if trim(CobDeptEnd.Text)<>'' then
      Sp.Parameters.ParamByName('@dept_end').Value := trim(leftstr(CobDeptEnd.Text,6));
  end;
  Sp.Parameters.ParamByName('@year_month').Value := edit_month.Text;
  ADOQUERY2.Open;
  Sp.Open;
  bb_ok.Enabled := false;
  EditEmpBegin.Enabled := false;
  EditEmpEnd.Enabled := false;
  CobDeptBegin.Enabled := false;
  CobDeptEnd.Enabled := false;
  cbEmp.Enabled := false;
  cbDept.Enabled := false;
end;

procedure TFormSal11.TntDBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormSal11.SPAfterScroll(DataSet: TDataSet);
var
  sqlstr:string;
begin
  SqlStr := 'select * from hrd_sal_paymt where emp_id='''+sp.fieldbyname('emp_id').AsString+''' and pay_mon='''+edit_month.Text+'''';
  with adoquery1 do
  begin
    sql.Clear;
    sql.Add(SqlStr);
    open;
  end;
end;

end.
