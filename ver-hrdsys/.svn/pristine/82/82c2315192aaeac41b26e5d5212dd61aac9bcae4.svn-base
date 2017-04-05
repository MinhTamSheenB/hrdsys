{******************************************************************************
name：fhrd306(調升記錄查詢)
author: tristan
create date:2005-08-23
commentate:調升記錄查詢
*******************************************************************************}

unit uFhrd306;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, ExtCtrls, TntExtCtrls, Grids, DBGrids,
  TntDBGrids, Buttons, TntButtons, DBCtrls, DB,StrUtils,WSDLIntf, Mask,
  TntDbCtrls, ComCtrls,TntComCtrls, ADODB,tntDialogs, DateUtils,TntGrids,
  CheckLst, TntCheckLst, TntForms;

type
  TFormfhrd306 = class(TForm)
    TntPanel1: TTntPanel;
    tranHistQry: TADOQuery;
    tranHistDataSource: TDataSource;
    TntPanel2: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    deptBegCob: TTntComboBox;
    deptEndCob: TTntComboBox;
    empBegId: TTntEdit;
    empEndId: TTntEdit;
    selData: TTntBitBtn;
    prnData: TTntBitBtn;
    exitSubForm: TTntBitBtn;
    chkDate: TTntCheckBox;
    dateBeg: TTntDateTimePicker;
    dateEnd: TTntDateTimePicker;
    TntPanel3: TTntPanel;
    TntGroupBox2: TTntGroupBox;
    tranHistGrid: TTntDBGrid;
    TntGroupBox3: TTntGroupBox;
    employeeList: TTntListBox;
    PrintPanel: TTntPanel;
    transBill: TTntRadioButton;
    totalBill: TTntRadioButton;
    employeeQry: TADOQuery;
    totalHistQry: TADOQuery;
    chkDept: TTntCheckBox;
    chkEmp: TTntCheckBox;
    TntSpeedButton1: TTntSpeedButton;

    // user create function and procedure

    procedure InitLang;
    procedure ctlStatus(sFlag : Char);
    procedure setDeptCob;

    // system create proceudre

    procedure FormCreate(Sender: TObject);
    procedure selDataClick(Sender: TObject);
    procedure exitSubFormClick(Sender: TObject);
    procedure empBegIdChange(Sender: TObject);
    procedure empEndIdChange(Sender: TObject);
    procedure deptBegCobChange(Sender: TObject);
    procedure deptEndCobChange(Sender: TObject);
    procedure tranHistGridTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dateBegChange(Sender: TObject);
    procedure dateEndChange(Sender: TObject);
    procedure prnDataClick(Sender: TObject);
    procedure transBillClick(Sender: TObject);
    procedure totalBillClick(Sender: TObject);
    procedure employeeListClick(Sender: TObject);
    procedure empBegIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure deptBegCobKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dateBegKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TntSpeedButton1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd306: TFormfhrd306;

implementation

uses
  UnitHrdUtils,unitDMHrdsys,UnitHrdMain,uFhrd306Report,uFhrd306ReportA;

{$R *.dfm}

{***定義全局變量***}
var
  g_sLangStr : TWideStrings;
  sWhere : string;

{*****************************************
Name: InitLang
Func: 初始化語言變量
Args:
    sKeys->語言變量
*****************************************}

procedure TFormfhrd306.InitLang;
var
  sKeys : string;
begin

  sKeys:='fhrd306,emp_id,fld_department,button_query,fhrd104_condition,'+
  'print,quit,browsedata,c_name,sal_bas,sal_frn,local_amt,promote_date,'+
  'table_field_pst_name,confirm_close,msg_set_dept,msg_empid_null,'+
  'msg_cho_dept,msg_no_record,msg_query_error';

  g_sLangStr:=GetLangWideStrs(sKeys);

  TntPanel1.Caption:=GetLangName(g_sLangStr,'fhrd306');
  exitSubForm.Caption:=GetLangName(g_sLangStr,'quit');
  prnData.Caption := GetLangName(g_sLangStr,'print');
  selData.Caption := GetLangName(g_sLangStr,'button_query');
  chkemp.Caption := GetLangName(g_sLangStr,'emp_id');
  chkdept.Caption := GetLangName(g_sLangStr,'fld_department');
  TntGroupBox1.Caption:=GetLangName(g_sLangStr,'fhrd104_condition');
  TntGroupBox2.Caption:=GetLangName(g_sLangStr,'browsedata');

  tranHistGrid.Columns[0].Title.caption := GetLangName(g_sLangStr,'promote_date');
  tranHistGrid.Columns[1].Title.caption := GetLangName(g_sLangStr,'emp_id');
  tranHistGrid.Columns[2].Title.caption := GetLangName(g_sLangStr,'c_name');
  tranHistGrid.Columns[3].Title.caption := GetLangName(g_sLangStr,'fld_department');
  tranHistGrid.Columns[4].Title.caption := GetLangName(g_sLangStr,'table_field_pst_name');
  tranHistGrid.Columns[5].Title.caption := GetLangName(g_sLangStr,'sal_bas');
  tranHistGrid.Columns[6].Title.caption := GetLangName(g_sLangStr,'sal_frn');
  tranHistGrid.Columns[7].Title.caption := GetLangName(g_sLangStr,'local_amt');

end;

{****************************************
Name: ctlStatus
Func: 控制可編輯狀態
Args:
    sFlag->狀態標誌
*****************************************}

procedure TFormfhrd306.ctlStatus(sFlag : Char);
begin
  case sFlag of
  '0':
  begin
    prnData.Enabled := false;
  end;
  '1':
  begin
    selData.Enabled := true;
  end;
  end;
end;

{*****************************************
Name: setDeptCob
Func: 初始化部門資料
Args:
******************************************}

procedure TFormFhrd306.setDeptCob;
begin
  try
    with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from fhrd_dept order by dept_code');
      open;
      while Not Eof do
      begin
        deptBegCob.Items.Add(FieldByName('dept_code').Value+'/'+
        FieldByName('dept_abbr').Value);
        deptEndCob.Items.Add(FieldByName('dept_code').Value+'/'+
        FieldByName('dept_abbr').Value);
        next;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_set_dept'),
    mtError,[mbyes],1);
  end;
end;

procedure TFormfhrd306.FormCreate(Sender: TObject);
begin
  InitLang;
  ctlStatus('0');
  setDeptCob;
  dateBeg.Date := Date;
  dateEnd.Date := Date;
end;

{*********************************************
Name: selDataClick
Func: 根據輸入條件查詢薪資結構
Args:
    sSelStr->查詢語句
*********************************************}

procedure TFormfhrd306.selDataClick(Sender: TObject);
var
  sSelStr : string;
begin

  sWhere := '';

  with employeeQry do
  begin
    close;
    sql.Clear;
    sSelStr := 'select distinct t.emp_id,(select emp_name from fhrd_emp '+
    'where emp_id=t.emp_id) as emp_name from fhrd_tranhist as t';
    if chkDept.Checked then
      if sWhere='' then
        sWhere := sWhere+' t.dept_code '+
        'between '''+LeftStr(deptBegCob.Text,6)+''' and '+
        ''''+LeftStr(deptEndCob.Text,6)+''' '
      else
      if sWhere='' then
        sWhere := sWhere+' and t.dept_code '+
        'between '''+LeftStr(deptBegCob.Text,6)+''' and '+
        ''''+LeftStr(deptEndCob.Text,6)+''' ';

    if chkEmp.Checked then
      if sWhere='' then
        sWhere := sWhere+' t.emp_id '+
        'between '''+empBegId.Text+''' and '''+empEndId.Text+''' '
      else
        sWhere := sWhere+' and t.emp_id '+
        'between '''+empBegId.Text+''' and '''+empEndId.Text+''' ';

    if chkDate.Checked then
    begin
      if sWhere='' then
        sWhere := sWhere+' t.valid_date '+
        'between '''+DateToStr(dateBeg.Date)+''' '+
        'and '''+DateTostr(dateEnd.Date)+''''
      else
        sWhere := sWhere+' and t.valid_date '+
        'between '''+DateTostr(dateBeg.Date)+''' '+
        'and '''+DateTostr(dateEnd.Date)+''' ';
    end;

    if sWhere<>'' then
      sWhere := ' where '+sWhere;

    sSelStr := sSelStr+sWhere+' order by t.emp_id ';
    sql.Add(sSelStr);
    try
      open;
    except
      widemessagedlg(GetLangName(g_sLangStr,'msg_query_error'),mtError,[mbyes],1);
    end;
    prnData.Enabled := true;

    if RecordCount<=0 then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'msg_no_record'),mtError,[mbyes],1);
      prnData.Enabled := false;
      employeeList.Clear;
      tranHistQry.Close;
    end
    else
    begin
      TntGroupBox3.Caption := '員工:'+IntToStr(RecordCount)+'人';
      employeeList.Clear;
      while Not Eof do
      begin
        employeeList.Items.Add(FieldByName('emp_id').Value+'/'+
        FieldBYName('emp_name').Value);
        next;
      end;
    end;
  end;
end;

procedure TFormfhrd306.exitSubFormClick(Sender: TObject);
begin
  close;
end;

procedure TFormfhrd306.empBegIdChange(Sender: TObject);
begin
  if Length(empBegId.Text)=6 then
  begin
    chkemp.Checked := true;
    selData.Enabled := true;
    deptBegCob.Text := '';
    deptEndCob.Text := '';
  end;
end;

procedure TFormfhrd306.empEndIdChange(Sender: TObject);
begin
  if (Length(empEndId.Text)=6) and (empBegId.Text<>'') then
  begin
    chkemp.Checked := true;
    selData.Enabled := true;
    deptBegCob.Text := '';
    deptEndCob.Text := '';
  end;
end;

procedure TFormfhrd306.deptBegCobChange(Sender: TObject);
begin
  if deptBegCob.Text<>'' then
  begin
    chkdept.Checked := true;
    selData.Enabled := true;
    empBegId.Text := '';
    empEndId.Text := '';
  end;
end;

procedure TFormfhrd306.deptEndCobChange(Sender: TObject);
begin
  if deptEndCob.Text<>'' then
  begin
    chkdept.Checked := true;
    selData.Enabled := true;
    empBegId.Text := '';
    empEndId.Text := '';
  end;
end;

procedure TFormfhrd306.tranHistGridTitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;

procedure TFormfhrd306.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:= caFree;
end;

procedure TFormfhrd306.dateBegChange(Sender: TObject);
begin
  chkDate.Checked := true;
  ctlStatus('1');
end;

procedure TFormfhrd306.dateEndChange(Sender: TObject);
begin
  chkDate.Checked := true;
  ctlStatus('1');
end;

procedure TFormfhrd306.prnDataClick(Sender: TObject);
begin
  PrintPanel.Visible := true;
end;

procedure TFormfhrd306.transBillClick(Sender: TObject);
begin
  PrintPanel.Visible := false;
  Application.CreateForm(TFhrd306ReportA,Fhrd306ReportA);
  Fhrd306ReportA.Fhrd306QRep.Preview;
  totalBill.Checked := false;
  transBill.Checked := false;
end;

procedure TFormfhrd306.totalBillClick(Sender: TObject);
begin
  with totalHistQry do
  begin
    close;
    sql.Clear;
    sql.Add('select t.valid_date,t.emp_id,'+
    '(select emp_name from fhrd_emp where emp_id=t.emp_id) as emp_name,'+
    '(select emp_etdt from fhrd_emp where emp_id=t.emp_id) as emp_etdt,'+
    '(select edu_title from vfhrdemp where emp_id=t.emp_id) as edu_title,'+
    't.dept_title,'+
    '(select pst_name from fhrd_prof where pst_code=t.pst_code) as '+
    'pst_name,t.bas_amt,t.frn_amt,t.local_amt '+
    'from fhrd_tranhist as t'+sWhere+' order by t.emp_id,t.valid_date');
    try
      open;
    except
      showmessage('取匯總資料失敗');
    end;
  end;
  PrintPanel.Visible := false;
  Application.CreateForm(TFhrd306Report,Fhrd306Report);
  Fhrd306Report.QRLabel41.Caption := FormatDateTime('yyyy/mm',Date);
  Fhrd306Report.QRLabel45.Caption := DateTostr(Date);
  Fhrd306Report.Fhrd306QRep.Prepare;
  Fhrd306Report.Fhrd306QRep.Preview;
  totalBill.Checked := false;
  transBill.Checked := false;
end;

procedure TFormfhrd306.employeeListClick(Sender: TObject);
var
  sStr : string;
begin
  sStr := 'select t.valid_date,t.emp_id,'+
  '(select emp_name from fhrd_emp where emp_id=t.emp_id) as emp_name,'+
  '(select emp_etdt from fhrd_emp where emp_id=t.emp_id) as emp_etdt,'+
  '(select edu_title from vfhrdemp where emp_id=t.emp_id) as edu_title,'+
  't.dept_title,'+
  '(select pst_name from fhrd_prof where pst_code=t.pst_code) as '+
  'pst_name,t.bas_amt,t.frn_amt,t.local_amt '+
  'from fhrd_tranhist as t where t.emp_id='''+LeftStr(employeeList.Items.Strings[employeeList.ItemIndex],6)+''' order by t.valid_date';
  with TranHistQry do
  begin
    close;
    sql.Clear;
    sql.Add(sStr);
    try
      open;
    except
      showmessage('查詢調升記錄失敗');
    end;
  end;
end;

procedure TFormfhrd306.empBegIdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
    empendId.SetFocus;
end;

procedure TFormfhrd306.deptBegCobKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
    deptEndcob.SetFocus;
end;

procedure TFormfhrd306.dateBegKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
    dateEnd.SetFocus;
end;

procedure TFormfhrd306.TntSpeedButton1Click(Sender: TObject);
begin
  printPanel.Visible := false;
end;

end.
