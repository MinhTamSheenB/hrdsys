unit ufhrd214;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  CheckLst, TntCheckLst,DateUtils,math;


type
  TFormFhrd214 = class(TForm)
    TntPanel1: TTntPanel;
    TntPageControl1: TTntPageControl;
    TntTabSheet3: TTntTabSheet;
    TntPanel4: TTntPanel;
    TntGroupBox6: TTntGroupBox;
    TntLabel7: TTntLabel;
    sb_Emp: TTntSpeedButton;
    dtp_DutDay: TTntDateTimePicker;
    cob_DeptBeg: TTntComboBox;
    cob_DeptEnd: TTntComboBox;
    cb_Mach: TTntCheckBox;
    cob_QryMch: TTntComboBox;
    bbtn_ConfirmQry: TTntBitBtn;
    cb_Dept: TTntCheckBox;
    cb_Emp: TTntCheckBox;
    EditEmp: TTntEdit;
    bbtn_Reset: TTntBitBtn;
    TntDateTimePicker1: TTntDateTimePicker;
    TntGroupBox7: TTntGroupBox;
    dbg_TrtQry: TTntDBGrid;
    TntPanel6: TTntPanel;
    TntBitBtn2: TTntBitBtn;
    TntBitBtn4: TTntBitBtn;
    qry_machine: TADOQuery;
    qry_machinemac_addr: TStringField;
    qry_machinemac_pos: TWideStringField;
    qry_machinemac_remark: TWideStringField;
    ds_machine: TDataSource;
    OpenDialog: TTntOpenDialog;
    cmd_Temp: TADOCommand;
    qry_Temp: TADOQuery;
    ds_DutDtl: TDataSource;
    qry_TrtQry: TADOQuery;
    ds_TrtQry: TDataSource;
    qry_Del: TADOQuery;
    qry_tmp: TADOQuery;
    qry_tmpspc_id: TStringField;
    qry_tmpuser_id: TStringField;
    qry_tmpuser_name: TWideStringField;
    qry_tmpuser_dept: TStringField;
    qry_tmptrt_date: TDateTimeField;
    qry_tmptrt_time: TStringField;
    qry_tmptrt_addr: TStringField;
    procedure bbtn_ConfirmQryClick(Sender: TObject);
    procedure bbtn_ResetClick(Sender: TObject);
    procedure cob_DeptBegChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InitLang;
    procedure InitForm;
    procedure dtp_DutDayChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFhrd214: TFormFhrd214;

implementation
uses
  UnitDMHrdsys,UnitHrdUtils;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  DutDate :Tdatetime;
{$R *.dfm}
procedure TFormfhrd214.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
keys:=keys+'dut11_titl,not_find_data,while_doing,total,current_location,'
  +'preview,print,while_printing,department,print_finish,'
  +'dut11_stop,dut11_over,dept_begin,dept_end,dut11_muti_dept_pre,'
  +'dut11_half_deduct,dut11_not_deduct,dut11_all_deduct';
LangStr:=GetLangWideStrs(keys);
//PanelTitle.Caption:=GetLangName(LangStr,'dut11_titl');
//BtnPrint.Caption:=GetLangName(LangStr,'print');
//RBStop.Caption:=GetLangName(LangStr,'dut11_stop');
//RBOver.Caption:=GetLangName(LangStr,'dut11_over');
//label_dept_begin.Caption:=GetLangName(LangStr,'dept_begin');
//label_dept_end.Caption:=GetLangName(LangStr,'dept_end');
//BtnPreview.Caption:=GetLangName(LangStr,'preview');
end;                        

procedure TFormfhrd214.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
{  if userLang='E' then
    fld_name:='dept_code+'' ''+eng_abbr'
  else if userLang='V' then
    fld_name:='dept_code+'' ''+vim_abbr'
  else
    fld_name:='dept_code+'' ''+abbr_titl';
  sql_str:='select '+fld_name+' as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,CobDeptBegin);
  SetComboxList(sql_str,CobDeptEnd);
}
  GetDeptRange(cob_DeptBeg);
  GetDeptRange(cob_DeptEnd);

  dtp_DutDay.DateTime :=date();    //2012-07-03 hyt add
end;
procedure TFormFhrd214.bbtn_ConfirmQryClick(Sender: TObject);
var
  aSQL:String;
  sql :string ;
begin
  aSQL:='SELECT distinct a.emp_id,a.emp_name,a.dept_code,b.abbr_titl,c.spc_id,c.trt_date,c.trt_time,c.trt_station'+
    ' FROM fhrd_emp a,hrd_dept b, hrd_dut_trt as c ' +  //hrd_dut_trt c'+
    ' WHERE a.spc_id=c.spc_id AND a.dept_code=b.dept_code and trt_date >='''+FormatDateTime('yyyy/mm/dd',dtp_DutDay.date)+''' and trt_date <='''+FormatDateTime('yyyy/mm/dd',TntDateTimePicker1.date) + ''''
    +' and (A.emp_ledt is null or A.emp_ledt >='''+FormatDateTime('yyyy/mm/dd',dtp_DutDay.date)+''')';
  if (cb_Mach.Checked) and (cob_QryMch.ItemIndex<>0)  then
    aSQL:=aSQL+' AND c.trt_station='''+LeftStr(cob_QryMch.Text,1)+'''';
  if cb_Emp.Checked then
    aSQL:=aSQL+' AND a.emp_id='''+EditEmp.Text+'''';
  if cb_Dept.Checked then
    aSQL:=aSQL+'AND a.dept_code>='''+LeftStr(cob_DeptBeg.Text,6)+''''+
      ' AND a.dept_code<='''+LeftStr(cob_DeptEnd.Text,6)+'''';

  with qry_TrtQry do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    try
      Open;
      if EOF then
      begin
        WideMessageDlg('沒有找到查詢範圍內的資料！',mtInformation,[mbYes],0);
        Close;
        Exit;
      end;
    except
      WideMessageDlg('沒有該日的刷卡資料！',mtError,[mbYes],0);
      Exit;
    end;
  end;
  TntLabel7.Enabled:=false;
  dtp_DutDay.Enabled:=false;
  cb_Mach.Enabled:=false;
  cob_QryMch.Enabled:=false;
  cb_Emp.Enabled:=false;
  EditEmp.Enabled:=false;
  sb_Emp.Enabled:=false;
  cb_Dept.Enabled:=false;
  cob_DeptBeg.Enabled:=false;
  cob_DeptEnd.Enabled:=false;
  bbtn_ConfirmQry.Enabled:=false;
  bbtn_Reset.Enabled:=true;
end;


procedure TFormFhrd214.bbtn_ResetClick(Sender: TObject);
begin
  TntLabel7.Enabled:=true;
  dtp_DutDay.Enabled:=true;
  cb_Mach.Enabled:=true;
  cob_QryMch.Enabled:=true;
  cb_Emp.Enabled:=true;
  EditEmp.Enabled:=true;
  sb_Emp.Enabled:=true;
//  cb_Dept.Enabled:=true;
  cob_DeptBeg.Enabled:=true;
  cob_DeptEnd.Enabled:=true;
  bbtn_ConfirmQry.Enabled:=true;
  bbtn_Reset.Enabled:=false;
  qry_TrtQry.Close;
end;

procedure TFormFhrd214.cob_DeptBegChange(Sender: TObject);
begin
   cob_DeptEnd.Text := cob_DeptBeg.Text;
end;

procedure TFormFhrd214.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(username,'fhrd214');
  InitLang;// Init language
  InitForm;// Init Form
//  Application.CreateForm(TFormPrtDut11,FormPrtDut11);

end;

procedure TFormFhrd214.dtp_DutDayChange(Sender: TObject);
begin
  TntDateTimePicker1.Date:=dtp_DutDay.Date;
end;

end.
