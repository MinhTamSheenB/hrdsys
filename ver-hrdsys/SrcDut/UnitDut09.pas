unit UnitDut09;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,tntDialogs, ExtCtrls,StrUtils, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, TntExtCtrls, TntDBGrids, TntDbCtrls, TntStdCtrls, TntButtons,
  DB, ADODB, DBClient, Provider,DateUtils,WSDLIntf, TntComCtrls, CheckLst,
  TntCheckLst, Menus, TntMenus, ImgList, TntForms, TntGrids ,qt;

type
  TformDut09 = class(TForm)
    TntPanel1: TTntPanel;
    DataSource1: TDataSource;
    TntPanel2: TTntPanel;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    TntPanel3: TTntPanel;
    TntPanel9: TTntPanel;
    TntLabel3: TTntLabel;
    att_date: TTntDateTimePicker;
    Tbb_reset: TTntBitBtn;
    bb_ok: TTntBitBtn;
    TntDBGrid1: TTntDBGrid;
    TntPopupMenu1: TTntPopupMenu;
    N1: TTntMenuItem;
    ADOQuery4: TADOQuery;
    PanelAdd: TTntPanel;
    TntPanel4: TTntPanel;
    TntPanel5: TTntPanel;
    sg_add: TTntStringGrid;
    sb_Close: TTntSpeedButton;
    TntLabel1: TTntLabel;
    ADOQuery1: TADOQuery;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1wrk_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1seg_code: TStringField;
    ADOQuery1clas_code: TStringField;
    ADOQuery1s_start: TStringField;
    ADOQuery1s_end: TStringField;
    ADOQuery1real_start: TStringField;
    ADOQuery1real_end: TStringField;
    ADOQuery1wrk_sts: TStringField;
    ADOQuery1late: TStringField;
    ADOQuery1early: TStringField;
    ADOQuery1over_flag: TStringField;
    ADOQuery1notify: TStringField;
    ADOQuery1clascode: TStringField;
    TntPanel6: TTntPanel;
    bb_undo: TTntBitBtn;
    bb_save: TTntBitBtn;
    procedure InitLangInfo; //語言初始化
    procedure FormInit;     //界面初始化
    procedure FormCreate(Sender: TObject);
    procedure TntDBGrid1EditButtonClick(Sender: TObject);
    procedure bb_okClick(Sender: TObject);
    procedure Tbb_resetClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PanelAddMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sb_CloseClick(Sender: TObject);
    procedure sg_addDblClick(Sender: TObject);
    procedure TntDBGrid1ColEnter(Sender: TObject);
    procedure sg_addKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bb_saveClick(Sender: TObject);
    procedure bb_undoClick(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1BeforeScroll(DataSet: TDataSet);


  private
    { Private declarations }
  public
    { Public declarations }
  end;


const
  TimeHeader = '1899-12-30 ';
{ seg_code = 0;    // 時段
  clas_code = 1;   // 班別
  s_start = 2;     // 標准上班時間
  s_end =3 ;       // 標准下班時間
  real_start = 4;  // 上班刷卡
  real_end = 5;    // 下班刷卡
  wrk_sts = 6;     // 處理狀態
  late = 7;        // 遲到
  early = 8;       // 早退
  over_flag = 9;   // 超時加班標志
  notify = 10;      // 不處理標志
  start_b = 11;    // 上班刷卡起時
  start_e = 12;    // 上班刷卡止時
  end_b = 13;      // 下班刷卡起時
  end_e =14;       // 下班刷卡止時
 }
var
  formDut09: TformDut09;
  ws_Words:TWideStrings;
  flag:boolean;
  recordno:integer;
implementation

uses
  UnitDMHrdsys,UnitHrdUtils;
{$R *.dfm}

procedure TformDut09.InitLangInfo;
var
  ThisFormUsedWords:String;
  i:integer;
begin
  //定義要用到的語言
 ThisFormUsedWords:='query,find,ok,undo,save,close,reset,save_fail,save_success,seg_info_qry,'+
    'search_condition,fld_emp_id,fld_emp_chs,fld_dept_code,fld_seg_code,dut09_attention,'+
    'save,weihu,dut09_titl,dut10_error1,dut09_warning1,fld_clas_code,fld_s_start,fld_s_end,'+
    'fld_real_start,fld_real_end,fld_wrk_sts,fld_late,fld_early,segament,'+
    'dut09_error1,hrd09_error4,dut09_error2,dut09_error3';
 ws_Words:=GetLangWideStrs(ThisFormUsedWords);
 bb_ok.Caption := GetLangName(ws_Words,'ok');
 bb_undo.Caption := GetLangName(ws_Words,'undo');
 bb_save.Caption := GetLangName(ws_Words,'save');
 tbb_reset.Caption := GetLangName(ws_Words,'reset');
 tntpanel1.Caption := GetLangName(ws_Words,'dut09_titl');
 tntLabel1.Caption := GetLangName(ws_Words,'dut09_attention');
 N1.Caption := GetLangName(ws_Words,'seg_info_qry');
 sg_add.Cells[0,0]:=GetLangName(ws_Words,'segament');
 sg_add.Cells[1,0]:=GetLangName(ws_Words,'fld_clas_code');
 sg_add.Cells[2,0]:=GetLangName(ws_Words,'fld_s_start');
 sg_add.Cells[3,0]:=GetLangName(ws_Words,'fld_s_end');
 for i:=0 to tntdbgrid1.Columns.Count-1 do
   tntdbgrid1.Columns[i].Title.Caption := GetLangName(ws_Words,'fld_'+tntdbgrid1.Columns[i].FieldName);
 tntdbgrid1.Columns[2].Title.Caption := GetLangName(ws_Words,'fld_clas_code');
end;
procedure TformDut09.FormInit;
var
  PrvArr:TPrvArr;
  sqlstr:string;
  i:integer;
begin
  //初始化,取用戶對該畫面擁有的權限
  PrvArr:=GetPrvArr(UserName,'dut05');
  sqlstr := 'select a.*,b.clas_chs '+
    'from hrd_dut_seg as a,hrd_dut_class as b '+
    'where a.clas_code=b.clas_code';
  i:=1;
  with adoquery3 do
  begin
    sql.Clear;
    sql.Add(sqlstr);
    open;
    sg_add.RowCount := RecordCount+1;
    while not eof do
    begin
      sg_add.Cells[0,i]:=fieldbyname('seg_code').value;
      sg_add.Cells[1,i]:=fieldbyname('clas_code').value+' '+fieldbyname('clas_chs').value;
      sg_add.Cells[2,i]:=fieldbyname('s_start').value;
      sg_add.Cells[3,i]:=fieldbyname('s_end').value;
      i := i+1;
      next;
    end;
    close;
  end;
end;

procedure TformDut09.FormCreate(Sender: TObject);
begin
  InitLangInfo;
  FormInit;
  att_date.Date := now;
end;

procedure TformDut09.TntDBGrid1EditButtonClick(Sender: TObject);
var
  EmpId:string;
begin
  EmpID := FindEmpId('emp_id');
  if EmpID<>'' then
  begin
    adoquery1.edit;
    adoquery1.FieldByName('emp_id').asstring := widestring(EmpID);
  end;
end;

procedure TformDut09.bb_okClick(Sender: TObject);
var
  sqlstr:string;
begin
  {with adoquery3 do
  begin
    sqlstr := 'select * from sysobjects where xtype=''U '' and name=''hrd_dut_day'+
      formatdatetime('yymmdd',att_date.date)+''' ';
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if eof then
    begin
      widemessagedlg(GetLangName(ws_Words,'dut10_error1'),mtError,[mbOk],0);
      close;
      exit;
    end;
    close;
  end; }
  with adoquery1 do
  begin
    sql.Clear;
    sql.Add('select * from hrd_dut_day where 1<0 and wrk_date='''+DateToStr(att_date.date)+'''');
    open;
    append;
  end;
  tntdbgrid1.Enabled := true;
  tbb_reset.Enabled := true;
  bb_ok.Enabled := false;
  att_date.Enabled := false;
end;

procedure TformDut09.Tbb_resetClick(Sender: TObject);
begin
  if not bb_save.Enabled then
  begin
    att_date.Enabled := true;
    bb_ok.Enabled := true;
    adoquery1.Close;
    tbb_reset.Enabled := false;
    tntdbgrid1.Enabled := false;
    adoquery1.BeforeScroll := nil;
    exit;
  end;  
  if widemessagedlg(GetLangName(ws_Words,'dut09_warning1'),mtWarning,[mbYes,mbCancel],0)=mrYes then
  begin
    att_date.Enabled := true;
    bb_ok.Enabled := true;
    adoquery1.Close;
    tbb_reset.Enabled := false;
    tntdbgrid1.Enabled := false;
    adoquery1.BeforeScroll := nil;
  end;
end;

procedure TformDut09.N1Click(Sender: TObject);
begin
  PanelAdd.Show;
  tntpanel2.Enabled := false;
  sg_add.SetFocus;
end;

procedure TformDut09.PanelAddMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Paneladd.Perform(WM_SysCommand,$F012,0);
end;

procedure TformDut09.sb_CloseClick(Sender: TObject);
begin
  paneladd.Hide;
  tntPanel2.Enabled := true;
  tntdbgrid1.SetFocus;
  tntdbgrid1.SelectedIndex := 1;
end;

procedure TformDut09.sg_addDblClick(Sender: TObject);
begin
  with adoquery1 do
  begin
    edit;
    fieldbyname('seg_code').asstring := sg_add.Cells[0,sg_add.Row];
    fieldbyname('clas_code').asstring := leftstr(sg_add.Cells[0,sg_add.Row],2);
    fieldbyname('s_start').asstring := trim(sg_add.Cells[2,sg_add.Row]);
    fieldbyname('s_end').asstring := trim(sg_add.Cells[3,sg_add.Row]);
  end;
  paneladd.Hide;
  tntpanel2.Enabled := true;
  tntdbgrid1.SetFocus;
  tntdbgrid1.SelectedIndex := 1;
end;

procedure TformDut09.TntDBGrid1ColEnter(Sender: TObject);
var
  sqlstr:string;
begin
  if (tntDbgrid1.SelectedField.FieldName <> 'emp_id') and (length(trim(adoquery1.FieldByName('emp_id').AsString))<>6) then
  begin
    wideshowmessage(GetLangName(ws_Words,'dut09_error1'));
    tntDbgrid1.SelectedIndex := 0;
    exit;
  end;
  with adoquery3 do
  begin
    if tntDbgrid1.SelectedField.FieldName <> 'emp_id' then
    begin
      sqlstr := 'select * from hrd_emp where emp_id='''+adoquery1.fieldbyname('emp_id').asstring+''' ';
      sql.clear;
      sql.add(sqlstr);
      open;
      if eof then
      begin
        wideshowmessage(GetLangName(ws_words,'hrd09_error4'));
        tntdbgrid1.SelectedIndex := 0;
        close;
        exit;
      end;
    end;
  end;
  if tntDbgrid1.SelectedField.FieldName = 'seg_code' then
    N1.OnClick(sender);
  if (tntDbgrid1.SelectedField.FieldName <> 'seg_code') and (tntDbgrid1.SelectedField.FieldName <> 'emp_id') then
  begin
    if length(adoquery1.FieldByName('seg_code').AsString)<>2 then
    begin
      wideshowmessage(GetLangName(ws_words,'dut09_error3'));
      tntdbgrid1.SelectedIndex := 1;
      close;
      exit;
    end
    else
    begin
      with adoquery3 do
      begin
        sqlstr := 'select * from hrd_dut_seg where seg_code='''+adoquery1.fieldbyname('seg_code').asstring+''' ';
        sql.clear;
        sql.add(sqlstr);
        open;
        if eof then
        begin
          wideshowmessage(GetLangName(ws_words,'dut09_error3'));
          tntdbgrid1.SelectedIndex := 1;
          close;
          exit;
        end;
      end;
      if tntDbgrid1.SelectedField.FieldName <> 'clascode' then
      begin
        with adoquery3 do
        begin
          sqlstr := 'select * from hrd_dut_seg where seg_code='''+adoquery1.fieldbyname('seg_code').asstring+''' ';
          sql.clear;
          sql.add(sqlstr);
          open;
          adoquery1.edit;
          adoquery1.FieldByName('s_start').Value := fieldbyname('s_start').value;
          adoquery1.FieldByName('s_end').Value := fieldbyname('s_end').value;
          close;
        end;// with adoquery3 do
      end; // tntDbgrid1.SelectedField.FieldName <> 'clascode' then
    end;
  end;
  with adoquery1 do
  begin
    if (FieldByName('emp_id').AsString<>'') and (FieldByName('seg_code').AsString<>'')  and (FieldByName('clas_code').AsString<>'') then
    begin
      edit;
      FieldByName('upd_user').Value := UserName;
      FieldByName('upd_date').Value := GetServerDateTime;
      fieldbyname('wrk_date').Value := dateof(att_date.Date);
    end;
  end; //with adoquery1 do
end;

procedure TformDut09.sg_addKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) and	paneladd.Visible then   //按下ESC鍵
    sb_CloseClick(sb_close);
  if (key=13) and	paneladd.Visible then   //按下Enter鍵
    sg_addDblClick(sender);
end;

procedure TformDut09.bb_saveClick(Sender: TObject);
begin
  adoquery1.UpdateBatch(arAll);
  bb_undo.Enabled := false;
  bb_save.Enabled := false;
end;

procedure TformDut09.bb_undoClick(Sender: TObject);
begin
  adoquery1.CancelBatch(arAll);
  bb_undo.Enabled := false;
  bb_save.Enabled := false;
end;

procedure TformDut09.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  tntdbgrid1.SelectedIndex:=0;
  if flag then
  begin
    showmessage('資料輸入有誤');
    adoquery1.MoveBy(recordno);
  end;
end;

procedure TformDut09.ADOQuery1BeforeScroll(DataSet: TDataSet);
begin
bb_undo.Enabled := true;
  bb_save.Enabled := true;
  flag := false;
  recordno := adoquery1.RecNo;
  with adoquery3 do
  begin
    if adoquery1.FieldByName('emp_id').AsString='' then
      exit;
    if (adoquery1.FieldByName('seg_code').AsString='') or (adoquery1.FieldByName('clascode').AsString='') then
    begin
      flag := true;
      exit;
    end
    else
    begin
      sql.Clear;
      sql.add('select * from hrd_emp where emp_id='''+adoquery1.fieldbyname('emp_id').asstring+''' ');
      open;
      if eof then
      begin
        flag := true;
        exit;
      end;
      close;
      sql.Clear;
      sql.add('select * from hrd_dut_seg where seg_code='''+adoquery1.fieldbyname('seg_code').asstring+''' ');
      open;
      if eof then
      begin
        flag := true;
        exit;
      end;
      close;
    end;
  end;
end;

end.
