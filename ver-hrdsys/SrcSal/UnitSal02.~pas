unit UnitSal02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TntExtCtrls, StdCtrls, TntStdCtrls, Buttons,DateUtils,
  TntButtons, Grids, DBGrids, TntDBGrids, ComCtrls, TntComCtrls, DB, ADODB,
  Mask, DBCtrls,WSDLIntf,StrUtils, TntDbCtrls,tntdialogs;

type
  TFormSal02 = class(TForm)
    TntPanel1: TTntPanel;
    TntPageControl1: TTntPageControl;
    update: TTntTabSheet;
    addpage: TTntTabSheet;
    TntGroupBox3: TTntGroupBox;
    Label6: TLabel;
    id_s: TTntEdit;
    ID_E: TTntEdit;
    bb_search: TTntBitBtn;
    DEPT_E: TTntComboBox;
    DEPT_S: TTntComboBox;
    ID_RANGE: TTntCheckBox;
    DEPT_RANGE: TTntCheckBox;
    EDT_name: TTntEdit;
    cb_name: TTntCheckBox;
    TntPanel2: TTntPanel;
    TntDBGrid1: TTntDBGrid;
    TntPanel3: TTntPanel;
    ADOCommand1: TADOCommand;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    TntDBEdit1: TTntDBEdit;
    TntLabel1: TTntLabel;
    TntDBEdit2: TTntDBEdit;
    TntLabel2: TTntLabel;
    TntLabel3: TTntLabel;
    TntDBEdit3: TTntDBEdit;
    TntDBEdit4: TTntDBEdit;
    TntLabel4: TTntLabel;
    Label1: TLabel;
    Label2: TLabel;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    TntPanel4: TTntPanel;
    panel1: TTntPanel;
    bb_add: TTntBitBtn;
    Label3: TLabel;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    TntEdit1: TTntEdit;
    TntEdit2: TTntEdit;
    ADOQuery2: TADOQuery;
    TntLabel7: TTntLabel;
    TntLabel8: TTntLabel;
    tedt_name: TTntEdit;
    TntLabel9: TTntLabel;
    tedt_dept: TTntEdit;
    TntLabel10: TTntLabel;
    TntLabel11: TTntLabel;
    TntLabel12: TTntLabel;
    edt_emp: TTntEdit;
    date_valid: TTntDateTimePicker;
    TntPanel5: TTntPanel;
    TntPanel6: TTntPanel;
    me_spec: TMaskEdit;
    me_achi: TMaskEdit;
    bb_reset: TTntBitBtn;
    TntLabel13: TTntLabel;
    TntLabel15: TTntLabel;
    procedure InitLangInfo;
    procedure FormInit;
    procedure FormCreate(Sender: TObject);
    procedure bb_searchClick(Sender: TObject);
    procedure ID_RANGEClick(Sender: TObject);
    procedure id_sDblClick(Sender: TObject);
    procedure EDT_nameDblClick(Sender: TObject);
    procedure TntDBEdit1Change(Sender: TObject);
    procedure edt_empChange(Sender: TObject);
    procedure bb_resetClick(Sender: TObject);
    procedure bb_addClick(Sender: TObject);
    procedure me_specEnter(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure ADOQuery1WillChangeField(DataSet: TCustomADODataSet;
      const FieldCount: Integer; const Fields: OleVariant;
      var EventStatus: TEventStatus);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal02: TFormSal02;

implementation

Uses
    unitdmhrdsys,unithrdutils;
var
   prv:TPrvArr;
   ws_Words:TWideStrings;

{$R *.dfm}
procedure TformSal02.InitLangInfo;
var
  ThisFormUsedWords:String;
  i:integer;
begin
  //定義要用到的語言
 ThisFormUsedWords:='query,ok,save,recover,reset,find,update,add,close,sal02_titl,fld_emp_id,'+
   'fld_emp_chs,fld_dept_code,fld_valid_date,fld_sal_spec,fld_sal_achi,msg_add_error,'+
   'msg_confirm_save,search_condition,sal02_error1,sal02_error2,sal02_error3,add_success,dbl_clk_slct_emp';
 ws_Words:=GetLangWideStrs(ThisFormUsedWords);
 tntpanel1.Caption := GetLangName(ws_Words,'sal02_titl');
 tntGroupbox3.Caption := GetLangName(ws_Words,'search_condition');
 id_range.Caption :=  GetLangName(ws_Words,'fld_emp_id');
 dept_range.Caption :=  GetLangName(ws_Words,'fld_dept_code');
 cb_name.Caption :=  GetLangName(ws_Words,'fld_emp_chs');
 bb_search.Caption :=  GetLangName(ws_Words,'query');
 bb_add.Caption := GetLangName(ws_Words,'add');
 bb_reset.Caption := GetLangName(ws_Words,'reset');
 tntpagecontrol1.Pages[0].Caption :=  GetLangName(ws_Words,'update');
 tntpagecontrol1.Pages[1].Caption :=  GetLangName(ws_Words,'add');
 tntlabel1.Caption := GetLangName(ws_Words,'fld_emp_id');
 tntlabel2.Caption := GetLangName(ws_Words,'fld_valid_date');
 tntlabel3.Caption := GetLangName(ws_Words,'fld_sal_spec');
 tntlabel4.Caption := GetLangName(ws_Words,'fld_sal_achi');
 tntlabel5.Caption := GetLangName(ws_Words,'fld_emp_chs');
 tntlabel6.Caption := GetLangName(ws_Words,'fld_dept_code');
 tntlabel7.Caption := GetLangName(ws_Words,'fld_emp_id');
 tntlabel10.Caption := GetLangName(ws_Words,'fld_valid_date');
 tntlabel11.Caption := GetLangName(ws_Words,'fld_sal_spec');
 tntlabel12.Caption := GetLangName(ws_Words,'fld_sal_achi');
 tntlabel8.Caption := GetLangName(ws_Words,'fld_emp_chs');
 tntlabel9.Caption := GetLangName(ws_Words,'fld_dept_code');
 tntlabel13.Caption := GetLangName(ws_Words,'dbl_clk_slct_emp');
 tntlabel15.Caption := GetLangName(ws_Words,'dbl_clk_slct_emp');
 sb_recover.Caption := GetLangName(ws_Words,'recover');
 sb_save.Caption := GetLangName(ws_Words,'save');
 for i:= 0 to tntdbgrid1.Columns.Count-1 do
   tntdbgrid1.Columns[i].Title.Caption := GetLangName(ws_Words,'fld_'+tntdbgrid1.Columns[i].FieldName);
end;

procedure TformSal02.FormInit;
begin
  prv := GetPrvArr(UserName,'sal02');
  tntpageControl1.Pages[0].TabVisible := prv[UPD];
  tntpageControl1.Pages[1].TabVisible := prv[ADD];
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql,dept_s);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql,dept_e);

end;

procedure TFormSal02.FormCreate(Sender: TObject);
begin
  InitLangInfo;
  FormInit;
end;

procedure TFormSal02.bb_searchClick(Sender: TObject);
var
  sql_cond,sql_str:string;
begin
  sql_str := 'select * from hrd_sal_spec where 1>0 ';
  //sql_cond := '';
  //2012-09-07 hyt add
  sql_cond:=' '+G_sFactorySql+' ';

  if id_range.Checked then
  begin
    if trim(id_s.Text)<>'' then
      sql_str := sql_str + ' and emp_id>='''+trim(id_s.Text)+''' ';
    if trim(id_e.Text)<>'' then
      sql_str := sql_str + ' and emp_id<='''+trim(id_e.Text)+''' ';
  end;
  if cb_name.Checked then
  begin
    if sql_cond<>'' then
      sql_cond :=sql_cond+ ' and emp_chs like ''%'+trim(edt_name.text)+'%'' '
    else
      sql_cond := ' emp_chs like ''%'+trim(edt_name.text)+'%'' ';
  end;
  if dept_range.Checked then
  begin
    if trim(dept_s.Text)<>'' then
    begin
      if sql_cond<>'' then
        sql_cond := sql_cond+' and dept_code>='''+leftstr(dept_s.Text,6)+''' '
      else
        sql_cond := ' dept_code>='''+leftstr(dept_s.Text,6)+''' ';
    end;
    if trim(dept_e.Text)<>'' then
    begin
      if sql_cond<>'' then
        sql_cond := sql_cond+' and dept_code<='''+leftstr(dept_e.Text,6)+''' '
      else
        sql_cond := ' dept_code<='''+leftstr(dept_e.Text,6)+''' ';
    end;
  end;
  if sql_cond<>'' then
    sql_str := sql_str+' and emp_id in (select emp_id from hrd_emp where '+sql_cond+' )';
  with adoquery1 do
  begin
    sql.Clear;
    sql.Add(sql_str);
    Open;
    if eof then
      close;
  end;

 // showmessage(sql_str);
end;

procedure TFormSal02.ID_RANGEClick(Sender: TObject);
begin
  if id_range.Checked then
  begin
    id_s.Enabled := true;
    id_e.Enabled := true;
  end
  else
  begin
    id_s.Enabled := false;
    id_e.Enabled := false;
  end;
  if dept_range.Checked then
  begin
    dept_s.Enabled := true;
    dept_e.Enabled := true;
  end
  else
  begin
    dept_s.Enabled := false;
    dept_e.Enabled := false;
  end;
  if cb_name.Checked then
    edt_name.Enabled := true
  else
    edt_name.Enabled := false;
end;

procedure TFormSal02.id_sDblClick(Sender: TObject);
var
  emp:string;
begin
  emp := FindEmpId('emp_id');
  if emp<>'' then
    Tedit(sender).Text := emp;
end;

procedure TFormSal02.EDT_nameDblClick(Sender: TObject);
var
  empchs:widestring;
begin
  empchs := FindEmpId('emp_chs');
  if empchs<>'' then
    Tedit(sender).Text := empchs;
end;

procedure TFormSal02.TntDBEdit1Change(Sender: TObject);
var
  sqlstr:string;
begin
  if tntdbedit1.Text = '' then
  begin
    tntedit1.Text := '';
    tntedit2.Text := '';
    exit;
  end;
  sqlstr := 'select a.emp_chs,b.dept_code+'' ''+b.abbr_titl as dept_code from hrd_emp a,hrd_dept b where a.emp_id='''+tntdbedit1.Text+''' and a.dept_code=b.dept_code ';
  with adoquery2 do
  begin
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if not eof then
    begin
      tntedit1.Text := fieldbyname('emp_chs').Value;
      tntedit2.Text := fieldbyname('dept_code').Value;
    end;
    close;
  end;
end;

procedure TFormSal02.edt_empChange(Sender: TObject);
var
  sqlstr:string;
begin
  if length(trim(edt_emp.Text))=6 then
  begin
    sqlstr := 'select a.emp_chs,b.dept_code+'' ''+b.abbr_titl as dept_code from hrd_emp a,hrd_dept b where a.emp_id='''+trim(edt_emp.Text)+''' and a.dept_code=b.dept_code ';
    with adoquery2 do
    begin
      sql.Clear;
      sql.Add(sqlstr);
      open;
      if eof then
      begin
        wideshowmessage(GetLangName(ws_Words,'sal02_error1'));
        edt_emp.Text:='';
        exit;
      end;
      tedt_name.Text := fieldbyname('emp_chs').value;
      tedt_dept.Text := fieldbyname('dept_code').value;
      sqlstr := 'select * from hrd_sal_spec where emp_id='''+trim(edt_emp.Text)+''' ';
      sql.Clear;
      sql.Add(sqlstr);
      open;
      if not eof then
      begin
        wideshowmessage(GetLangName(ws_Words,'sal02_error2'));
        tedt_name.Text :='';
        tedt_dept.Text :='';
        edt_emp.Text:='';
        exit;
      end;
    end;
    date_valid.Enabled := true;
    me_spec.Enabled := true;
    me_achi.Enabled := true;
    bb_add.Enabled := true;
    bb_reset.Enabled := true;
    edt_emp.Enabled := false;
  end;
end;

procedure TFormSal02.bb_resetClick(Sender: TObject);
begin
  edt_emp.text := '';
  tedt_name.text := '';
  tedt_dept.text := '';
  date_valid.Date := now;
  me_spec.Text := '';
  me_achi.Text := '';
  date_valid.Enabled := false;
  me_spec.Enabled := false;
  me_achi.Enabled := false;
  bb_reset.Enabled := false;
  bb_add.Enabled := false;
  edt_emp.Enabled := true;
end;

procedure TFormSal02.bb_addClick(Sender: TObject);
var
  sqlstr,spec,achi:string;
begin
  //2012-09-07 hyt add
  if AnalysisEmpFactory(edt_emp.Text)=false then
    exit ;

  if trim(me_spec.Text)<>'' then
    spec:= trim(me_spec.Text)
  else
    spec:= 'null';
  if trim(me_achi.Text)<>'' then
    achi:= trim(me_achi.Text)
  else
    achi:= 'null';
  if (trim(me_spec.Text)='') and (trim(me_achi.Text)='') then
  begin
    wideshowmessage(GetLangName(ws_Words,'sal02_error3'));
    exit;
  end;
  sqlstr := 'insert into hrd_sal_spec(upd_user,emp_id,sal_spec,sal_achi,valid_date) '+
    ' values('''+UserName+''','''+edt_emp.Text+''','+spec+','+achi+','''+datetostr(dateof(date_valid.date))+''')';
  with adocommand1 do
  begin
    commandtext := sqlstr;
    //showmessage(sqlstr);
    try
      execute;
      wideshowmessage(GetLangName(ws_Words,'add_success'));
      edt_emp.text := '';
      tedt_name.text := '';
      tedt_dept.text := '';
      date_valid.Date := now;
      me_spec.Text := '';
      me_achi.Text := '';
      date_valid.Enabled := false;
      me_spec.Enabled := false;
      me_achi.Enabled := false;
      bb_reset.Enabled := false;
      bb_add.Enabled := false;
      edt_emp.Enabled := true;
    except
      wideshowmessage(GetLangName(ws_Words,'msg_add_error'));
    end;  
  end;
end;

procedure TFormSal02.me_specEnter(Sender: TObject);
begin
  Tedit(sender).SelStart:=0;
  Tedit(sender).SelLength:=8;
end;

procedure TFormSal02.sb_RecoverClick(Sender: TObject);
begin
  adoquery1.CancelBatch(arAll);
  sb_recover.Enabled := false;
  sb_save.Enabled := false;
end;

procedure TFormSal02.sb_SaveClick(Sender: TObject);
begin
  adoquery1.UpdateBatch(arAll);
  sb_save.Enabled := false;
  sb_recover.Enabled := false;
end;

procedure TFormSal02.ADOQuery1WillChangeField(DataSet: TCustomADODataSet;
  const FieldCount: Integer; const Fields: OleVariant;
  var EventStatus: TEventStatus);
begin
  sb_recover.Enabled := true;
  sb_save.enabled := true;
end;

end.
