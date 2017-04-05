unit UnitHrd10;

interface

uses
  Windows,SqlExpr, ComCtrls, TntComCtrls, Classes, Controls, ExtCtrls, Messages, SysUtils, Variants, Graphics,  Forms,
  Dialogs, FMTBcd, DB, StdCtrls, Grids, DBGrids, TntDBGrids, TntStdCtrls,tntdialogs,
  DBCtrls,WSDLIntf,TntDBCtrls, Buttons, TntButtons,StrUtils, ADODB, TntExtCtrls,
  Mask,DateUtils, TntDB;

type
  TFormhrd10 = class(TForm)
    Panel1: TTntPanel;
    Panel2: TTntPanel;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    qry_rp_type: TADOQuery;
    qry_reason: TADOQuery;
    qry_pub: TADOQuery;
    PanelMain: TTntPanel;
    TntGroupBox2: TTntGroupBox;
    rp_type: TTntCheckBox;
    date_range: TTntCheckBox;
    dept_code: TTntCheckBox;
    code_range: TTntCheckBox;
    edt_code_s: TTntEdit;
    edt_code_e: TTntEdit;
    cb_rp_s_code: TTntComboBox;
    cb_rp_e_code: TTntComboBox;
    cb_dept_s: TTntComboBox;
    cb_dept_e: TTntComboBox;
    edt_date_s: TTntDateTimePicker;
    edt_date_e: TTntDateTimePicker;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    DBGridUPD: TTntDBGrid;
    PanelFlow: TTntPanel;
    TntLabel3: TTntLabel;
    sbtn_add: TTntSpeedButton;
    sbtn_finish: TTntSpeedButton;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    TntGroupBox5: TTntGroupBox;
    Nvg: TDBNavigator;
    TntLabel1: TTntLabel;
    p_p_date: TTntDBEdit;
    TntSpeedButton2: TTntSpeedButton;
    tntlabel4: TTntLabel;
    prs_type: TTntDBComboBox;
    p_times: TTntDBEdit;
    TntLabel7: TTntLabel;
    prs_code: TTntDBComboBox;
    TntLabel6: TTntLabel;
    vim_remark: TTntDBEdit;
    chs_remark: TTntDBEdit;
    tntlabel5: TTntLabel;
    TntLabel9: TTntLabel;
    TntLabel8: TTntLabel;
    TntLabel10: TTntLabel;
    sbtn_emp: TTntSpeedButton;
    TntLabel11: TTntLabel;
    TntLabel12: TTntLabel;
    mcd: TTntMonthCalendar;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1p_p_date: TDateTimeField;
    ADOQuery1p_p_type: TStringField;
    ADOQuery1p_p_times: TIntegerField;
    ADOQuery1prs_code: TStringField;
    ADOQuery1chs_remark: TWideStringField;
    ADOQuery1vim_remark: TWideStringField;
    ADOQuery1rp_type: TTntWideStringField;
    ADOQuery1rp_reason: TTntWideStringField;
    Btn_Search: TTntBitBtn;
    Btn_Reset: TTntBitBtn;
    EDT_COST: TTntEdit;
    ADOQuery1emp_chs: TTntWideStringField;
    EDT_ID: TTntDBEdit;
    TntDBEdit1: TTntDBEdit;
    TntDBEdit2: TTntDBEdit;
    ADOQuery1dept_code: TTntWideStringField;
    ADOQuery1prs_pay: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure InitInqPage(Sender: TObject);
    procedure InitLangInfo;
    procedure DBGridInqRsTitleClick(Column: TColumn);
    procedure cb_rp_s_codeChange(Sender: TObject);
    procedure edt_date_sChange(Sender: TObject);
    procedure cb_dept_sChange(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure PanelFlowTitleMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TntSpeedButton2Click(Sender: TObject);
    procedure mcdDblClick(Sender: TObject);
    procedure sbtn_empClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure sb_editClick(Sender: TObject);
    procedure sbtn_finishClick(Sender: TObject);
    procedure SetActEnabled(Modify_Flag:boolean=true);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure sbtn_addClick(Sender: TObject);
    procedure prs_codeChange(Sender: TObject);
    procedure rp_typeClick(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure Btn_ResetClick(Sender: TObject);
    procedure p_p_dateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formhrd10: TFormhrd10;
  epindt :Tdatetime;

implementation

Uses
    unitdmhrdsys,unithrdutils;
var
   prv:TPrvArr;
   ws_Words:TWideStrings;
   IsAdd:Boolean;
{$R *.dfm}

procedure TFormhrd10.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  //默認為中文
 //if UserLang='C' then exit;
 ThisFormUsedWords:='upd_success,add_success,hrd10_error1,hrd10_warning1,search_fail,'+
     'hrd09_error4,hrd10_error7,hrd10_error8,msg_del_alert';
 ws_Words:=GetLangWideStrs(ThisFormUsedWords);

 SetComponentLang(self);
end;

//初始化查詢頁面
procedure TFormhrd10.InitInqPage(Sender: TObject);
begin
  edt_date_s.date:=EncodeDate(yearof(date),1,1);
  edt_date_e.date:=date;
  //取得獎懲類別
  SetComboxList('select prs_type+''-''+script_cht from hrd_prs_type order by prs_type',cb_rp_s_code);
  SetComboxList('select prs_type+''-''+script_cht from hrd_prs_type order by prs_type',cb_rp_e_code);
  cb_rp_s_code.ItemIndex:=0;
  cb_rp_e_code.ItemIndex:=cb_rp_e_code.Items.Count-1;

  prs_type.Items:=cb_rp_s_code.Items;
  with qry_reason do
  begin
    if not active then
      Open;
    first;
    while not eof do
    begin
      prs_code.Items.Add(fieldbyname('rp_reason').Value);
      next;
    end;
  end;
  

//取得部門代號
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql,cb_dept_s);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql,cb_dept_e);
  cb_dept_s.ItemIndex:=0;
  cb_dept_e.ItemIndex:=cb_dept_e.Items.Count-1;

  SetActEnabled(false);
end;

//初始化維護頁面
procedure TFormhrd10.FormCreate(Sender: TObject);
begin
//取得權限數組
  prv:=GetPrvArr(username,'hrd10');
  InitInqPage(Sender);
  InitLangInfo;
end;


procedure TFormhrd10.DBGridInqRsTitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormhrd10.cb_rp_s_codeChange(Sender: TObject);
begin
  if cb_rp_s_code.ItemIndex>cb_rp_e_code.ItemIndex then
    cb_rp_e_code.ItemIndex:= cb_rp_s_code.ItemIndex;
end;

procedure TFormhrd10.edt_date_sChange(Sender: TObject);
begin
  if edt_date_s.Date>edt_date_e.Date then
    edt_date_e.Date:=edt_date_s.Date;
end;

procedure TFormhrd10.cb_dept_sChange(Sender: TObject);
begin
  if cb_dept_s.ItemIndex>cb_dept_e.ItemIndex then
    cb_dept_e.ItemIndex:=cb_dept_s.ItemIndex;
end;

procedure TFormhrd10.sb_AddClick(Sender: TObject);
begin
  IsAdd:=true;
  EDT_ID.ReadOnly := false;
  EDT_ID.Color := clWindow;
  sbtn_emp.Show;
  EdT_COST.Text:='';
  with adoquery1 do
  begin
    if not Active then
    begin
      sql.Clear;
      sql.Add('select * from hrd_prs_pun  where 1<0');
      Open;
    end;
    append;
  end;
  PanelFlow.Show;
  PanelMain.Enabled:=false;
  SBtn_add.Show;
  Nvg.Hide;
end;

procedure TFormhrd10.PanelFlowTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);
end;

procedure TFormhrd10.TntSpeedButton2Click(Sender: TObject);
begin
  mcd.Show;
  PanelFlow.Enabled :=false;
end;

procedure TFormhrd10.mcdDblClick(Sender: TObject);
begin
  adoquery1.Edit;
  adoquery1.FieldByName('p_p_date').AsDateTime := mcd.Date;
  //p_p_date.Text := DateToStr(mcd.Date);
  mcd.Hide;
  panelFlow.Enabled :=true;
end;

procedure TFormhrd10.sbtn_empClick(Sender: TObject);
var
  AEmpId:string;
begin
  AEmpId := FindEmpId('emp_id');
  if AEmpId<>'' then
  begin
    adoquery1.edit;
    adoquery1.FieldByName('emp_id').AsString := AEmpId;
   // EDT_ID.Text:= AEmpId;
  end;
end;

procedure TFormhrd10.ADOQuery1CalcFields(DataSet: TDataSet);
var
  FldEmp:Tfields;
begin
  if length(adoquery1.FieldByName('emp_id').AsString)<>6 then
    exit;
  FldEmp:= GetEmpInfo(adoquery1.FieldByName('emp_id').Value);
  adoquery1.FieldByName('emp_chs').Value:=FldEmp.fieldbyname('emp_chs').Value;
  adoquery1.FieldByName('dept_code').Value:=FldEmp.fieldbyname('dept_code').Value+' '+FldEmp.fieldbyname('abbr_titl').Value;
end;

procedure TFormhrd10.sb_editClick(Sender: TObject);
begin
  IsAdd:=false;
  EDT_ID.ReadOnly := true;
  EDT_ID.Color := clSkyBlue;
  sbtn_emp.Hide;
  PanelMain.Enabled := true;
  TntGroupBox2.Enabled := false;
  DBGridUPD.Enabled := true;
  PanelAct.Enabled := false;
  PanelFlow.Show;
  SBtn_add.Hide;
  Nvg.Show;
end;

procedure TFormhrd10.sbtn_finishClick(Sender: TObject);
var
  i:integer;
  flag,flag2 :boolean;
begin  
  if adoquery1.State in [dsEdit,dsInsert] then
  begin
      flag:=false;
      flag2:=false;
      if p_p_date.Text='' then
        flag:=true;
      if prs_type.Text='' then
        flag:=true;
      if p_times.Text='' then
        flag:=true;
      if prs_code.Text='' then
        flag:=true;
      if EDT_ID.Text='' then
        flag:=true;        
      for i:=2 to 6 do
      begin
        if (adoquery1.Fields[i].AsString='')  then
          flag:= true;
        if adoquery1.Fields[i].AsString<>'' then
          flag2:=true;
      end;
      if (not flag2) and  (sender.ClassType<>TtntSpeedButton) then
      begin
        adoquery1.Cancel;
        IsAdd:=false;
        PanelMain.Enabled := true;
        PanelFlow.Hide;
        PanelAct.Enabled := true;
        DBGridUPD.Enabled := true;
        TntGroupBox2.Enabled := true;
        exit;
      end;
      if flag then
      begin
        wideshowmessage(GetLangName(ws_words,'hrd10_error7'));
        exit;
      end;  
      if sender.ClassType=TtntSpeedButton then
        adoquery1.Post;
  end;  
  IsAdd:=false;
  PanelMain.Enabled := true;
  PanelFlow.Hide;
  PanelAct.Enabled := true;
  DBGridUPD.Enabled := true;
  TntGroupBox2.Enabled := true;
end;

procedure TFormHrd10.SetActEnabled(Modify_Flag:boolean=true);
var
  status:boolean;
  IsEmpty:boolean;
begin
  status:=adoquery1.Active;
  IsEmpty :=adoquery1.eof;
  sb_Add.Enabled:=Prv[ADD];
  sb_Del.Enabled:=status and Prv[DEL] and Not IsEmpty;
  sb_edit.Enabled:=status and Prv[UPD];
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;
procedure TFormhrd10.ADOQuery1AfterClose(DataSet: TDataSet);
begin
  SetActEnabled(false);
end;

procedure TFormhrd10.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
  SetActEnabled(false);
end;

procedure TFormhrd10.ADOQuery1BeforePost(DataSet: TDataSet);
begin
  with adoquery1 do
  begin
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=GetServerDatetime;
  end;
end;

procedure TFormhrd10.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
begin
  SetActEnabled(true);
end;

procedure TFormhrd10.sb_DelClick(Sender: TObject);
begin
  if not adoquery1.Eof then
    adoquery1.Delete;
end;

procedure TFormhrd10.sb_RecoverClick(Sender: TObject);
begin
  adoquery1.CancelBatch(arAll);
  SetActEnabled(false);
end;

procedure TFormhrd10.sb_SaveClick(Sender: TObject);
begin
  
  adoquery1.UpdateBatch(arAll);
  SetActEnabled(false);
end;

procedure TFormhrd10.sbtn_addClick(Sender: TObject);
var
  i:integer;
  flag:boolean;
begin
  flag:=false;
  for i:=2 to 6 do
  begin
    if adoquery1.Fields[i].AsString='' then
      flag:= true;
  end;
  if flag then
    exit;
  adoquery1.Append;
  EdT_COST.Text:='';
end;

procedure TFormhrd10.prs_codeChange(Sender: TObject);
begin
  with qry_pub do
  begin
    sql.Clear;
    sql.Add('select * from hrd_prscode where prs_code='''+leftstr(prs_code.Text,4)+'''');
    Open;
    EDT_COST.Text := fieldbyname('prs_pay').AsString;
    Close;
  end;
  chs_remark.SetFocus;
end;

procedure TFormhrd10.rp_typeClick(Sender: TObject);
begin
  if rp_type.Checked then
  begin
    cb_rp_s_code.Enabled:=true;
    cb_rp_e_code.Enabled:=true;
  end
  else
  begin
    cb_rp_s_code.Enabled:=false;
    cb_rp_e_code.Enabled:=false;
  end;
  if date_range.Checked then
  begin
    edt_date_s.Enabled:=true;
    edt_date_e.Enabled:=true;
  end
  else
  begin
    edt_date_s.Enabled:=false;
    edt_date_e.Enabled:=false;
  end;
  if code_range.Checked then
  begin
    edt_code_s.Enabled:=true;
    edt_code_e.Enabled:=true;
  end
  else
  begin
    edt_code_s.Enabled:=false;
    edt_code_e.Enabled:=false;
  end;
  if dept_code.Checked then
  begin
    cb_dept_s.Enabled:=true;
    cb_dept_e.Enabled:=true;
  end
  else
  begin
    cb_dept_s.Enabled:=false;
    cb_dept_e.Enabled:=false;
  end;
end;

procedure TFormhrd10.Btn_SearchClick(Sender: TObject);
var
  SqlStr:WideString;
begin
  SqlStr:='select * from hrd_prs_pun where 1>0';
  //2012-09-07 hyt add
  SqlStr:=SqlStr+' and emp_id IN( select emp_id from hrd_emp where '+G_sFactorySql+') ';

  if rp_type.Checked then
    SqlStr:=SqlStr+' and p_p_type>='''+leftstr(cb_rp_s_code.text,1)+''' and p_p_type<='''+leftstr(cb_rp_e_code.text,1)+''' ';
  if date_range.Checked then
    SqlStr:=SqlStr+' and p_p_date>='''+DateToStr(edt_date_s.Date)+''' and p_p_date<='''+DateToStr(edt_date_e.Date)+''' ';
  if code_range.Checked then
    SqlStr:=SqlStr+' and emp_id>='''+edt_code_s.Text+''' and emp_id<='''+edt_code_e.Text+''' ';
  if dept_code.Checked then
    SqlStr:=SqlStr+' and emp_id in(select emp_id from hrd_emp where dept_code>='''+leftstr(cb_dept_s.text,6)+''' and dept_code<='''+leftstr(cb_dept_e.text,6)+''') ';
  with adoquery1 do
  begin
    sql.Clear;
    sql.Add(SqlStr);
    Open;
  end;
  rp_type.Enabled := false;
  date_range.Enabled :=false;
  code_range.Enabled :=false;
  dept_code.Enabled :=false;

  cb_rp_s_code.Enabled :=false;
  cb_rp_e_code.Enabled :=false;
  edt_date_s.Enabled :=false;
  edt_date_e.Enabled :=false;
  edt_code_s.Enabled :=false;
  edt_code_e.Enabled :=false;
  cb_dept_s.Enabled :=false;
  cb_dept_e.Enabled:=false;

  btn_search.Enabled :=false;
  btn_reset.Enabled :=true;
end;

procedure TFormhrd10.Btn_ResetClick(Sender: TObject);
begin
  adoquery1.Close;
  rp_type.Enabled := true;
  date_range.Enabled :=true;
  code_range.Enabled :=true;
  dept_code.Enabled :=true;
  rp_type.Checked := false;
  date_range.Checked :=false;
  code_range.Checked :=false;
  dept_code.Checked :=false;
  btn_search.Enabled :=true;
  btn_reset.Enabled :=false;
end;

procedure TFormhrd10.p_p_dateChange(Sender: TObject);
var
  Adate:Tdate;
  EmpFld:TFields;
begin
  if not (adoquery1.State  in [dsEdit,dsInsert]) then
    exit;
  try
    ADate:=StrToDate(p_p_date.Text);
    EmpFld:=GetEmpInfo(EDT_ID.Text);
    if (EmpFld.FieldByName('epindt').AsDateTime>ADate) or (date<ADate) then
    begin
      WideShowmessage(GetLangName(ws_words,'hrd10_error1'));
      if IsAdd then
        adoquery1.fieldbyname('p_p_date').AsString:=''
      else
        adoquery1.Cancel;
      exit;
    end;
  except
    exit;
  end;
end;

end.
