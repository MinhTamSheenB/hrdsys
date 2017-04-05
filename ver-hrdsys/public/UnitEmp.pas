unit UnitEmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, TntDBGrids, StdCtrls, TntStdCtrls, ExtCtrls,
  TntExtCtrls, Buttons, TntButtons, DB, ADODB,StrUtils,TntForms,WSDLIntf;

type
  TFormEmp = class(TTntForm)
    TntGroupBox1: TTntGroupBox;
    TntGroupBox2: TTntGroupBox;
    EditEmpBegin: TTntEdit;
    cb_Emp: TTntCheckBox;
    EditEmpEnd: TTntEdit;
    cb_Dept: TTntCheckBox;
    cob_DeptBeg: TTntComboBox;
    cob_DeptEnd: TTntComboBox;
    TntPanel1: TTntPanel;
    TntDBGrid1: TTntDBGrid;
    cb_Name: TTntCheckBox;
    EditNameChs: TTntEdit;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    TntBitBtn1: TTntBitBtn;
    sp_Emp: TADOStoredProc;
    TntBitBtn2: TTntBitBtn;
    ds_emp: TDataSource;
    sp_Empemp_id: TStringField;
    sp_Empemp_chs: TWideStringField;
    sp_Empepsexd: TStringField;
    sp_Empdept_code: TStringField;
    sp_Emppst_code: TStringField;
    TntGroupBox3: TTntGroupBox;
    TntLabel3: TTntLabel;
    EditEmp: TTntEdit;
    TntLabel5: TTntLabel;
    TntEdit1: TTntEdit;
    qry_pst: TADOQuery;
    sp_Emppst_name: TStringField;
    sp_Empdept_name: TStringField;
    qry_dept: TADOQuery;
    sp_Empname_vim: TWideStringField;
    procedure TntBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TntDBGrid1DblClick(Sender: TObject);
    procedure TntBitBtn2Click(Sender: TObject);
    procedure EditEmpChange(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure sp_EmpepsexdGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cob_DeptBegChange(Sender: TObject);
    procedure InitLangInfo;
    procedure TntDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    YearMonth:String;
    { Public declarations }
  end;

var
  FormEmp: TFormEmp;
  ws_Words:TWideStrings;
implementation
uses
  UnitHrdUtils,unitDMHrdsys;
{$R *.dfm}
{===============================================================================
  過程名稱: InitLangInfo
  過程功能: 初始化語言信息
===============================================================================}
procedure TFormEmp.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  SetComponentLang(self);
  //定義要用到的語言
  ThisFormUsedWords:='choose_emp,fld_emp_id,fld_emp_name,table_field_dept_code,'+
    'fld_epsexd,fld_pstname,query_condition,fast_find,hint,hrd08_base_info,ok,close,'+
    'sex_man,sex_woman,dbl_clk_slct_emp';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
  //GetLangName(ws_Words,'')+':';
  //TntPanel1.Caption:=GetLangName(ws_Words,'dut01_titl');
  FormEmp.Caption:=GetLangName(ws_Words,'choose_emp');
  TntGroupBox1.Caption:=GetLangName(ws_Words,'query_condition');
  TntGroupBox2.Caption:=GetLangName(ws_Words,'hrd08_base_info');
  TntGroupBox3.Caption:=GetLangName(ws_Words,'fast_find');
  cb_Emp.Caption:=GetLangName(ws_Words,'fld_emp_id')+':';
  cb_Name.Caption:=GetLangName(ws_Words,'fld_emp_name')+':';
  cb_Dept.Caption:=GetLangName(ws_Words,'table_field_dept_code')+':';
  TntLabel3.Caption:=GetLangName(ws_Words,'fld_emp_id')+':';
  TntLabel5.Caption:=GetLangName(ws_Words,'hint')+':';
  TntBitBtn1.Caption:=GetLangName(ws_Words,'ok');
  TntBitBtn2.Caption:=GetLangName(ws_Words,'close');
  {TntDBGrid1.Columns[0].Title.Caption:=GetLangName(ws_Words,'fld_emp_id');
  TntDBGrid1.Columns[1].Title.Caption:=GetLangName(ws_Words,'fld_emp_name');
  TntDBGrid1.Columns[2].Title.Caption:=GetLangName(ws_Words,'fld_epsexd');
  TntDBGrid1.Columns[3].Title.Caption:=GetLangName(ws_Words,'table_field_dept_code');
  TntDBGrid1.Columns[4].Title.Caption:=GetLangName(ws_Words,'fld_pstname');
  }TntEdit1.Text:=GetLangName(ws_Words,'dbl_clk_slct_emp');
end;
procedure TFormEmp.TntBitBtn1Click(Sender: TObject);
begin
  qry_pst.Open;
  qry_dept.Open;
  With sp_Emp do
  begin
    Close;
    Parameters.ParamByName('@year_month').Value:=YearMonth;
    if cb_Emp.Checked then
    begin
      Parameters.ParamByName('@emp_begin').Value:=EditEmpBegin.Text;
      Parameters.ParamByName('@emp_end').Value:=EditEmpEnd.Text;
    end
    else
    begin
      Parameters.ParamByName('@emp_begin').Value:='';
      Parameters.ParamByName('@emp_end').Value:='';
    end;
    if cb_Dept.Checked then
    begin
      Parameters.ParamByName('@dept_begin').Value:=leftstr(cob_DeptBeg.Text,6);
      Parameters.ParamByName('@dept_end').Value:=leftstr(cob_DeptEnd.Text,6);
    end
    else
    begin
      Parameters.ParamByName('@dept_begin').Value:='';
      Parameters.ParamByName('@dept_end').Value:='';
    end;
    if cb_Name.Checked then
      Parameters.ParamByName('@name_chs').Value:='%'+EditNameChs.Text+'%'
    else
      Parameters.ParamByName('@name_chs').Value:='';
    Open;
  end;
end;

procedure TFormEmp.FormCreate(Sender: TObject);
var
  sql_str,fld_name:String;
begin
  //初始化語言信息
  InitLangInfo;
  if userLang='E' then
    fld_name:='dept_code+'' ''+eng_abbr'
  else if userLang='V' then
    fld_name:='dept_code+'' ''+vim_abbr'
  else
    fld_name:='dept_code+'' ''+abbr_titl';
  sql_str:='select '+fld_name+' as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,cob_DeptBeg);
  SetComboxList(sql_str,cob_DeptEnd);

end;

procedure TFormEmp.TntDBGrid1DblClick(Sender: TObject);
begin
  ModalResult:=mrOK;
  FormEmp.Hide;
end;

procedure TFormEmp.TntBitBtn2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
  FormEmp.Hide;
end;

procedure TFormEmp.EditEmpChange(Sender: TObject);
begin
  With sp_Emp do
  begin
    if TTntEdit(Sender).Text<>'' then
      Filter:='emp_id like '''+TTntEdit(Sender).Text+'*'+''''
    else
      Filter:='';
    Filtered:=true;
  end;
end;

procedure TFormEmp.TntDBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormEmp.sp_EmpepsexdGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.Value='M' then
    Text:=GetLangName(ws_Words,'sex_man');
  if Sender.Value='W' then
    Text:=GetLangName(ws_Words,'sex_woman');
end;

procedure TFormEmp.cob_DeptBegChange(Sender: TObject);
begin
  //設置結束部門与開始部門一致
  SetComboxIndex(cob_DeptEnd,LeftStr(cob_DeptBeg.Text,6));
end;

procedure TFormEmp.TntDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
  begin
    ModalResult:=mrOK;
    FormEmp.Hide;
  end;
end;

end.
