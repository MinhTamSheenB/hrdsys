unit UnitBus01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, Grids, DBGrids, TntDBGrids, StdCtrls, Buttons,DateUtils,
  TntButtons, TntStdCtrls, Mask, ComCtrls, TntComCtrls, ExtCtrls,
  TntExtCtrls, CheckLst, TntCheckLst, DB, ADODB,StrUtils,TntDialogs,
  DBClient, WSDLIntf,Provider, DBCtrls, TntDbCtrls, TntDB;
type
  TDSetArr = array[1..5] of TADOQuery;
  TTableArr = array[1..5] of String;
  TPanelArr = array[1..5] of Ttntpanel;
  TGBoxArr = array[1..5] of TtntGroupBox;
  TGridArr = array[1..5] of TtntDBGrid;
  TSBtnArr = array[1..5] of TtntSpeedButton;
  TNvgArr = array[1..5] of TDBNavigator;
type
  TFormBus01 = class(TTntForm)
    TntPageControl1: TTntPageControl;
    TntPanel1: TTntPanel;
    qry_carbase: TADOQuery;
    qry_driver: TADOQuery;
    ds_carbase: TDataSource;
    TntTabSheet1: TTntTabSheet;
    TntTabSheet2: TTntTabSheet;
    TntTabSheet3: TTntTabSheet;
    TntTabSheet4: TTntTabSheet;
    TntTabSheet5: TTntTabSheet;
    TntGroupBox1: TTntGroupBox;
    CobCarNo: TTntComboBox;
    Btn_Search: TTntBitBtn;
    Btn_Reset: TTntBitBtn;
    DBGrid1: TTntDBGrid;
    cb_car_no: TTntCheckBox;
    cb_driver: TTntCheckBox;
    cb_car_model: TTntCheckBox;
    EditCarModel: TTntEdit;
    qry_carbaseupd_user: TStringField;
    qry_carbaseupd_date: TDateTimeField;
    qry_carbasecar_no: TStringField;
    qry_carbasedriver: TStringField;
    qry_carbasecar_date: TDateTimeField;
    qry_carbasecar_model: TStringField;
    qry_carbasebuy_local: TStringField;
    qry_carbasedrivername: TStringField;
    CobDriver: TTntComboBox;
    cb_buy_local: TTntCheckBox;
    EditBuyLocal: TTntEdit;
    PanelFlow: TTntPanel;
    TntLabel3: TTntLabel;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    TntGroupBox5: TTntGroupBox;
    Label_car_no: TTntLabel;
    Label_car_model: TTntLabel;
    Label_driver: TTntLabel;
    Label_car_date: TTntLabel;
    EditCarNo: TTntDBEdit;
    edit_car_date: TTntDBEdit;
    edit_car_model: TTntDBEdit;
    label_buy_local: TTntLabel;
    Edit_buy_local: TTntDBEdit;
    DBCobDriver: TTntDBComboBox;
    Nvg1: TDBNavigator;
    sbtn_add: TTntSpeedButton;
    sbtn_finish: TTntSpeedButton;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_GetDate: TTntSpeedButton;
    mcd1: TMonthCalendar;
    TntGroupBox2: TTntGroupBox;
    CobCarNoFix: TTntComboBox;
    bbtn_fix_search: TTntBitBtn;
    bbtn_fix_reset: TTntBitBtn;
    cb_car_no_f: TTntCheckBox;
    cb_repair_date: TTntCheckBox;
    dtp_fix_begin: TDateTimePicker;
    dtp_fix_end: TDateTimePicker;
    ds_fix: TDataSource;
    qry_fix: TADOQuery;
    TntDBGrid1: TTntDBGrid;
    qry_picc: TADOQuery;
    qry_petrol: TADOQuery;
    qry_pass: TADOQuery;
    ds_picc: TDataSource;
    ds_petrol: TDataSource;
    ds_pass: TDataSource;
    PanelFlow2: TTntPanel;
    TntLabel1: TTntLabel;
    sbtn_add2: TTntSpeedButton;
    TntSpeedButton2: TTntSpeedButton;
    TntPanel3: TTntPanel;
    Image1: TImage;
    TntGroupBox3: TTntGroupBox;
    TntLabel2: TTntLabel;
    TntLabel4: TTntLabel;
    TntLabel6: TTntLabel;
    TntLabel7: TTntLabel;
    TntSpeedButton3: TTntSpeedButton;
    TntDBEdit2: TTntDBEdit;
    TntDBEdit4: TTntDBEdit;
    Nvg2: TDBNavigator;
    mcd2: TMonthCalendar;
    TntCobCarNo: TTntDBComboBox;
    TntGroupBox4: TTntGroupBox;
    cobCarNoPicc: TTntComboBox;
    bb_picc_search: TTntBitBtn;
    bb_picc_reset: TTntBitBtn;
    cbCarNoPicc: TTntCheckBox;
    cb_picc_start: TTntCheckBox;
    dtp_s_Start: TDateTimePicker;
    dtp_s_End: TDateTimePicker;
    dtp_e_end: TDateTimePicker;
    dtp_e_start: TDateTimePicker;
    cb_picc_end: TTntCheckBox;
    TntDBGrid2: TTntDBGrid;
    PanelFlow3: TTntPanel;
    TntLabel5: TTntLabel;
    sbtn_add3: TTntSpeedButton;
    TntSpeedButton4: TTntSpeedButton;
    TntPanel4: TTntPanel;
    Image2: TImage;
    TntGroupBox6: TTntGroupBox;
    TntLabel8: TTntLabel;
    TntLabel9: TTntLabel;
    TntLabel10: TTntLabel;
    TntLabel11: TTntLabel;
    TntSpeedButton5: TTntSpeedButton;
    TntDBEdit1: TTntDBEdit;
    TntDBEdit5: TTntDBEdit;
    TntDBEdit6: TTntDBEdit;
    DBCobCarNoPicc: TTntDBComboBox;
    Nvg3: TDBNavigator;
    TntSpeedButton6: TTntSpeedButton;
    mcd3: TMonthCalendar;
    mcd4: TMonthCalendar;
    TntGroupBox7: TTntGroupBox;
    CobCarNoYou: TTntComboBox;
    bbtn_search_you: TTntBitBtn;
    bbtn_reset_you: TTntBitBtn;
    CBCarNoYou: TTntCheckBox;
    cb_you_date: TTntCheckBox;
    dtp_you_begin: TDateTimePicker;
    dtp_you_end: TDateTimePicker;
    CBYouCate: TTntCheckBox;
    CobYouCate: TTntComboBox;
    TntDBGrid3: TTntDBGrid;
    PanelFlow4: TTntPanel;
    TntLabel12: TTntLabel;
    sbtn_add4: TTntSpeedButton;
    TntSpeedButton7: TTntSpeedButton;
    TntPanel5: TTntPanel;
    Image3: TImage;
    TntGroupBox8: TTntGroupBox;
    TntLabel13: TTntLabel;
    TntLabel14: TTntLabel;
    TntLabel16: TTntLabel;
    TntSpeedButton8: TTntSpeedButton;
    TntDBEdit8: TTntDBEdit;
    TntDBEdit9: TTntDBEdit;
    DBCobCarNoYou: TTntDBComboBox;
    Nvg4: TDBNavigator;
    DBCobYouCate: TTntDBComboBox;
    mcd5: TMonthCalendar;
    qry_you_cate: TADOQuery;
    qry_petrolupd_user: TStringField;
    qry_petrolupd_date: TDateTimeField;
    qry_petrolcar_no: TStringField;
    qry_petrolyou_cate: TStringField;
    qry_petrolyou_date: TDateTimeField;
    qry_petrolyou_qty: TIntegerField;
    qry_petrolyou_type: TTntWideStringField;
    TntGroupBox9: TTntGroupBox;
    CobCarNoPass: TTntComboBox;
    bbtn_pass_search: TTntBitBtn;
    bbtn_pass_reset: TTntBitBtn;
    cb_car_no_pass: TTntCheckBox;
    cb_buy_date: TTntCheckBox;
    dtp_buy_begin: TDateTimePicker;
    dtp_buy_end: TDateTimePicker;
    cb_end_date: TTntCheckBox;
    dtp_end_begin: TDateTimePicker;
    dtp_end_end: TDateTimePicker;
    TntDBGrid4: TTntDBGrid;
    PanelFlow5: TTntPanel;
    TntLabel15: TTntLabel;
    sbtn_add5: TTntSpeedButton;
    TntSpeedButton9: TTntSpeedButton;
    TntPanel6: TTntPanel;
    Image4: TImage;
    TntGroupBox10: TTntGroupBox;
    TntLabel17: TTntLabel;
    TntLabel18: TTntLabel;
    TntLabel19: TTntLabel;
    TntLabel20: TTntLabel;
    TntSpeedButton10: TTntSpeedButton;
    TntSpeedButton11: TTntSpeedButton;
    TntDBEdit7: TTntDBEdit;
    TntDBEdit10: TTntDBEdit;
    TntDBEdit11: TTntDBEdit;
    DBCobCarNoPass: TTntDBComboBox;
    Nvg5: TDBNavigator;
    mcd6: TMonthCalendar;
    mcd7: TMonthCalendar;
    qry_repair_cate: TADOQuery;
    qry_fixupd_user: TStringField;
    qry_fixupd_date: TDateTimeField;
    qry_fixserial: TAutoIncField;
    qry_fixcar_no: TStringField;
    qry_fixrepair_date: TDateTimeField;
    qry_fixrepair_cate: TStringField;
    qry_fixrepair_rate: TBCDField;
    qry_fixrep_cate: TTntWideStringField;
    CobRepCate: TTntDBComboBox;
    procedure TntFormCreate(Sender: TObject);
    procedure InitLangInfo;
    procedure InitForm;
    procedure cb_driverClick(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure Btn_ResetClick(Sender: TObject);
    procedure PanelFlowTitleMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sb_AddClick(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure sbtn_finishClick(Sender: TObject);
    procedure SetActEnabled(DataSet1:TDataSet;Modify_Flag:boolean=true);
    procedure qry_carbaseAfterOpen(DataSet: TDataSet);
    procedure qry_carbaseAfterClose(DataSet: TDataSet);
    procedure qry_carbaseWillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure TntPageControl1Change(Sender: TObject);
    procedure sb_GetDateClick(Sender: TObject);
    procedure mcd1DblClick(Sender: TObject);
    procedure sbtn_addClick(Sender: TObject);
    procedure qry_carbaseBeforePost(DataSet: TDataSet);
    procedure bbtn_fix_searchClick(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure bbtn_fix_resetClick(Sender: TObject);
    procedure TntSpeedButton3Click(Sender: TObject);
    procedure mcd2DblClick(Sender: TObject);
    procedure TntCobCarNoChange(Sender: TObject);
    procedure cb_repair_dateClick(Sender: TObject);
    procedure TntSpeedButton5Click(Sender: TObject);
    procedure TntSpeedButton6Click(Sender: TObject);
    procedure mcd3DblClick(Sender: TObject);
    procedure mcd4DblClick(Sender: TObject);
    procedure cbCarNoPiccClick(Sender: TObject);
    procedure bb_picc_searchClick(Sender: TObject);
    procedure bb_picc_resetClick(Sender: TObject);
    procedure TntSpeedButton8Click(Sender: TObject);
    procedure mcd5DblClick(Sender: TObject);
    procedure bbtn_search_youClick(Sender: TObject);
    procedure bbtn_reset_youClick(Sender: TObject);
    procedure CBCarNoYouClick(Sender: TObject);
    procedure TntSpeedButton10Click(Sender: TObject);
    procedure TntSpeedButton11Click(Sender: TObject);
    procedure mcd6DblClick(Sender: TObject);
    procedure bbtn_pass_resetClick(Sender: TObject);
    procedure bbtn_pass_searchClick(Sender: TObject);
    procedure cb_buy_dateClick(Sender: TObject);
    procedure mcd7DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBus01: TFormBus01;
  ws_Words:TWideStrings;
  ActiveIndex:integer;
implementation
uses
  UnitDMHrdsys,UnitHrdUtils;
var
  pri_arr:TPrvArr;//權限數組
  DSetArr:TDSetArr;
  TableArr:TTableArr;
  PanelArr:TPanelArr;
  GBoxArr:TGBoxArr;
  GridArr:TGridArr;
  SBtnArr:TSBtnArr;
  NvgArr:TNvgArr;
{$R *.dfm}
{===============================================================================
  多語言語言初始化
===============================================================================}
procedure TFormBus01.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  ThisFormUsedWords:='';
  //ws_Words:=GetLangWideStrs(ThisFormUsedWords);
  SetComponentLang(self);

end;
{程序初始化}
procedure TFormBus01.TntFormCreate(Sender: TObject);
begin
  InitLangInfo;
  InitForm;
  Pri_arr:=GetPrvArr(username,'bus01');//Get privilege
  ActiveIndex:=TntpageControl1.ActivePageIndex+1;
  DSetArr[ActiveIndex].Close;
  SetActEnabled(DSetArr[ActiveIndex],false);
end;

procedure TFormBus01.InitForm;
var
  fld_name:String;
  i:integer;
begin
  if userLang='E' then
    fld_name:='eng'
  else if userLang='V' then
    fld_name:='vim'
  else
    fld_name:='chs';
  DSetArr[1] := qry_carbase;
  DSetArr[2] := qry_fix;
  DSetArr[3] := qry_picc;
  DSetArr[4] := qry_petrol;
  DSetArr[5] := qry_pass;
  TableArr[1] := 'hrd_car_no';
  TableArr[2] := 'hrd_car_repair';
  TableArr[3] := 'hrd_car_picc';
  TableArr[4] := 'hrd_car_you';
  TableArr[5] := 'hrd_car_buy';
  PanelArr[1] := PanelFlow;
  PanelArr[2] := PanelFlow2;
  PanelArr[3] := PanelFlow3;
  PanelArr[4] := PanelFlow4;
  PanelArr[5] := PanelFlow5;
  GBoxArr[1] := TntGroupBox1;
  GBoxArr[2] := TntGroupBox2;
  GBoxArr[3] := TntGroupBox4;
  GBoxArr[4] := TntGroupBox7;
  GBoxArr[5] := TntGroupBox9;
  GridArr[1] := DBGrid1;
  GridArr[2] := TntDBGrid1;
  GridArr[3] := TntDBGrid2;
  GridArr[4] := TntDBGrid3;
  GridArr[5] := TntDBGrid4;
  SBtnArr[1] := SBtn_add;
  SBtnArr[2] := SBtn_add2;
  SBtnArr[3] := SBtn_add3;
  SBtnArr[4] := SBtn_add4;
  SBtnArr[5] := SBtn_add5;
  NvgArr[1] := Nvg1;
  NvgArr[2] := Nvg2;
  NvgArr[3] := Nvg3;
  NvgArr[4] := Nvg4;
  NvgArr[5] := Nvg5;
  for i:=1 to 5 do
  begin
    PanelArr[i].Top:=72;
    PanelArr[i].Left:=268;
    PanelArr[i].Width:=296;
  end;

  qry_carbase.Close;
  qry_carbase.FieldByName('drivername').LookupResultField := fld_name;
  SetComboxList('select car_no from hrd_car_no order by car_no',CobCarNo);
  SetComboxList('select driver+'' ''+name_'+fld_name+' from hrd_car_driver order by driver',CobDriver);
  SetComboxList('select you_cate+'' ''+you_name from hrd_car_you_cate order by you_cate',CobYouCate);
  with qry_repair_cate do
  begin
    first;
    while not eof do
    begin
      CobRepCate.Items.Add(fieldbyname('name').Value);
      next;
    end;
  end;
  DBCobDriver.Items:=CobDriver.Items;
  CobCarNoFix.Items := CobCarNo.Items;
  TntCobCarNo.Items := CobCarNo.Items;
  DBCobCarNoPicc.Items := CobCarNo.Items;
  cobCarNoPicc.Items := CobCarNo.Items;
  CobCarNoYou.Items := CobCarNo.Items;
  DBCobCarNoYou.Items := CobCarNo.Items;
  CobCarNoPass.Items := CobCarNo.Items;
  DBCobCarNoPass.Items := CobCarNo.Items;
  DBCobYouCate.Items := CobYouCate.Items;
end;

procedure TFormBus01.cb_driverClick(Sender: TObject);
begin
  if cb_car_no.Checked then
    CobCarNo.Enabled := true
  else
    CobCarNo.Enabled := false;
  if cb_driver.Checked then
    CobDriver.Enabled := true
  else
    CobDriver.Enabled := false;
  if cb_car_model.Checked then
    EditCarModel.Enabled := true
  else
    EditCarModel.Enabled := false;
  if cb_buy_local.Checked then
    EditBuyLocal.Enabled := true
  else
    EditBuyLocal.Enabled := false;
end;

procedure TFormBus01.Btn_SearchClick(Sender: TObject);
var
  Sqlstr:string;
begin
  SqlStr:='select * from hrd_car_no where 1>0 ';
  if cb_car_no.Checked then
    SqlStr := SqlStr+' and car_no='''+CobCarNo.Text+''' ';
  if cb_driver.Checked then
    SqlStr := SqlStr+' and driver='''+leftstr(CobDriver.Text,6)+''' ';
  if cb_car_model.Checked then
  begin
    if trim(EditCarModel.Text)<>'' then
      SqlStr := SqlStr+' and car_model like ''%'+trim(EditCarModel.Text)+'%'' '
    else
      SqlStr := SqlStr+' and (car_model is null or car_model like ''%'') ';
  end;
  if cb_buy_local.Checked then
  begin
    if trim(EditBuyLocal.Text)<>'' then
      SqlStr := SqlStr+' and  buy_local like ''%'+trim(EditBuyLocal.Text)+'%'''
    else
      SqlStr := SqlStr+' and (buy_local is null or buy_local like ''%'')';
  end;  
  with qry_carbase do
  begin
    sql.Clear;
    sql.Add(SqlStr);
    Open;
  end;
  cb_car_no.Enabled := false;
  cb_driver.Enabled := false;
  cb_car_model.Enabled := false;
  cb_buy_local.Enabled := false;
  CobCarNo.Enabled := false;
  CobDriver.Enabled := false;
  EditCarModel.Enabled :=false;
  EditBuyLocal.Enabled :=false;
  btn_reset.Enabled :=true;
  btn_search.Enabled := false;
end;

procedure TFormBus01.Btn_ResetClick(Sender: TObject);
begin
  qry_carbase.Close;
  cb_car_no.Checked := false;
  cb_driver.Checked := false;
  cb_car_model.Checked := false;
  cb_buy_local.Checked := false;
  cb_car_no.Enabled := true;
  cb_driver.Enabled := true;
  cb_car_model.Enabled := true;
  cb_buy_local.Enabled := true;
  btn_reset.Enabled := false;
  btn_search.Enabled := true;
end;

procedure TFormBus01.PanelFlowTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PanelArr[ActiveIndex].Perform(WM_SysCommand,$F012,0);
end;

procedure TFormBus01.sb_AddClick(Sender: TObject);
begin
  with DSetArr[ActiveIndex] do
  begin
    if not Active then
    begin
      sql.Clear;
      sql.Add('select * from '+TableArr[ActiveIndex]+' where 1<0');
      Open;
    end;
  end;
  DSetArr[ActiveIndex].Last;
  DSetArr[ActiveIndex].append;
  PanelArr[ActiveIndex].Show;
  GBoxArr[ActiveIndex].Enabled := false;
  GridArr[ActiveIndex].Enabled := false;
  PanelAct.Enabled := false;
  SBtnArr[ActiveIndex].Show;
  NvgArr[ActiveIndex].Hide;
end;

procedure TFormBus01.ImageCloseClick(Sender: TObject);
begin
  GBoxArr[ActiveIndex].Enabled := true;
  GridArr[ActiveIndex].Enabled := true;
  PanelAct.Enabled := true;
  PanelArr[ActiveIndex].Hide;
end;

procedure TFormBus01.sb_editClick(Sender: TObject);
begin
  GBoxArr[ActiveIndex].Enabled := false;
  GridArr[ActiveIndex].Enabled := true;
  PanelAct.Enabled := false;
  PanelArr[ActiveIndex].Show;
  SBtnArr[ActiveIndex].Hide;
  NvgArr[ActiveIndex].Show;
end;

procedure TFormBus01.sbtn_finishClick(Sender: TObject);
var
  i:integer;
  flag :boolean;
begin
  PanelArr[ActiveIndex].Hide;
  PanelAct.Enabled := true;
  GridArr[ActiveIndex].Enabled := true;
  GBoxArr[ActiveIndex].Enabled := true;
  if DSetArr[ActiveIndex].State in [dsEdit,dsInsert] then
  begin
    if DSetArr[ActiveIndex].State = dsInsert then
    begin
      flag:=false;
      for i:=2 to DSetArr[ActiveIndex].FieldCount-1 do
      begin
        if DSetArr[ActiveIndex].Fields[i].AsString<>'' then
          flag:= true;
      end;
      if not flag then
        DSetArr[ActiveIndex].Cancel
      else
        DSetArr[ActiveIndex].Post;
    end    
    else
      DSetArr[ActiveIndex].Post;
  end;
end;

procedure TFormBus01.SetActEnabled(DataSet1:TDataSet;Modify_Flag:boolean=true);
var
  status:boolean;
  IsEmpty:boolean;
begin
  status:=DataSet1.Active;
  IsEmpty :=DataSet1.eof;
  sb_Add.Enabled:=Pri_Arr[ADD];
  sb_Del.Enabled:=status and Pri_Arr[DEL] and Not IsEmpty;
  sb_edit.Enabled:=status and Pri_Arr[UPD];
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;

procedure TFormBus01.qry_carbaseAfterOpen(DataSet: TDataSet);
begin
  SetActEnabled(DSetArr[ActiveIndex],false);
end;

procedure TFormBus01.qry_carbaseAfterClose(DataSet: TDataSet);
begin
  SetActEnabled(DSetArr[ActiveIndex],false);
end;

procedure TFormBus01.qry_carbaseWillChangeRecord(
  DataSet: TCustomADODataSet; const Reason: TEventReason;
  const RecordCount: Integer; var EventStatus: TEventStatus);
begin
  SetActEnabled(DSetArr[ActiveIndex],true);
end;

procedure TFormBus01.sb_RecoverClick(Sender: TObject);
begin
  DSetArr[ActiveIndex].CancelBatch(arAll);
  SetActEnabled(DSetArr[ActiveIndex],false);
end;

procedure TFormBus01.sb_SaveClick(Sender: TObject);
begin
  DSetArr[ActiveIndex].UpdateBatch(arAll);
  SetActEnabled(DSetArr[ActiveIndex],false);
end;

procedure TFormBus01.sb_DelClick(Sender: TObject);
begin
  if not DSetArr[ActiveIndex].Eof then
    DSetArr[ActiveIndex].Delete;
end;

procedure TFormBus01.TntPageControl1Change(Sender: TObject);
begin
  ActiveIndex := TTntPageControl(Sender).ActivePageIndex+1;
  DSetArr[ActiveIndex].Close;
  SetActEnabled(DSetArr[ActiveIndex],false);
end;

procedure TFormBus01.sb_GetDateClick(Sender: TObject);
begin
  panelflow.Enabled := false;
  dbgrid1.Enabled:=false;
  mcd1.Show;
end;

procedure TFormBus01.mcd1DblClick(Sender: TObject);
begin
  qry_carbase.edit;
  qry_carbase.FieldByName('car_date').AsDateTime := mcd1.Date;
  dbgrid1.Enabled:=true;
  PanelFlow.Enabled := true;
  mcd1.Hide;
end;

procedure TFormBus01.sbtn_addClick(Sender: TObject);
begin
  DSetArr[ActiveIndex].Append;
end;

procedure TFormBus01.qry_carbaseBeforePost(DataSet: TDataSet);
begin
  with DSetArr[ActiveIndex] do
  begin
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=GetServerDatetime;
  end;
end;

procedure TFormBus01.bbtn_fix_searchClick(Sender: TObject);
var
  SqlStr:String;
begin
  SqlStr := 'select * from hrd_car_repair where 1>0';
  if cb_car_no_f.Checked then
  begin
    SqlStr := SqlStr + ' and car_no='''+CobCarNoFix.Text+''' ';
  end;
  if cb_repair_date.Checked then
  begin
    SqlStr := SqlStr + ' and repair_date>='''+DateToStr(dtp_fix_begin.date)+''' and repair_date<='''+DateToStr(dtp_fix_end.date)+''' ';
  end;
  with qry_fix do
  begin
    sql.Clear;
    sql.Add(SqlStr);
    Open;
  end;
  bbtn_fix_reset.Enabled := true;
  bbtn_fix_search.Enabled := false;
  cb_car_no_f.Enabled := false;
  cb_repair_date.Enabled := false;
  CobCarNoFix.Enabled := false;
  dtp_fix_begin.Enabled := false;
  dtp_fix_end.Enabled :=false;
  
end;

procedure TFormBus01.TntDBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormBus01.bbtn_fix_resetClick(Sender: TObject);
begin
  qry_fix.Close;
  cb_car_no_f.Checked := false;
  cb_car_no_f.Enabled := true;
  cb_repair_date.Checked := false;
  cb_repair_date.Enabled := true;
  bbtn_fix_search.Enabled := true;
end;

procedure TFormBus01.TntSpeedButton3Click(Sender: TObject);
begin
  panelflow2.Enabled := false;
  TntDbGrid1.Enabled:=false;
  mcd2.Show;
end;

procedure TFormBus01.mcd2DblClick(Sender: TObject);
begin
  qry_fix.edit;
  qry_fix.FieldByName('repair_date').AsDateTime := mcd2.Date;
  PanelFlow2.Enabled := true;
  TntDbGrid1.Enabled:=true;
  mcd2.Hide;
end;

procedure TFormBus01.TntCobCarNoChange(Sender: TObject);
begin
 //DSetArr[ActiveIndex].Edit;
  DSetArr[ActiveIndex].FieldByName('car_no').Value:= TntCobCarNo.Text;
end;

procedure TFormBus01.cb_repair_dateClick(Sender: TObject);
begin
  if cb_car_no_f.Checked then
    CobCarNoFix.Enabled := true
  else
    CobCarNoFix.Enabled := false;
  if cb_repair_date.Checked then
  begin
    dtp_fix_begin.Enabled := true;
    dtp_fix_end.Enabled := true;
  end
  else
  begin
    dtp_fix_begin.Enabled := false;
    dtp_fix_end.Enabled := false;
  end;
end;

procedure TFormBus01.TntSpeedButton5Click(Sender: TObject);
begin
  panelflow3.Enabled := false;
  tntdbgrid2.Enabled:=false;
  mcd3.Show;
end;

procedure TFormBus01.TntSpeedButton6Click(Sender: TObject);
begin
  panelflow3.Enabled := false;
  tntdbgrid2.Enabled:=false;
  mcd4.Show;
end;

procedure TFormBus01.mcd3DblClick(Sender: TObject);
begin
  qry_picc.Edit;
  qry_picc.FieldByName('picc_start').AsDateTime := mcd3.Date;
  PanelFlow3.Enabled := true;
  tntdbgrid2.Enabled:=true;
  mcd3.Hide;
end;

procedure TFormBus01.mcd4DblClick(Sender: TObject);
begin
  qry_picc.Edit;
  qry_picc.FieldByName('picc_end').AsDateTime := mcd4.Date;
  PanelFlow3.Enabled := true;
  tntdbgrid2.Enabled:=true;
  mcd4.Hide;
end;

procedure TFormBus01.cbCarNoPiccClick(Sender: TObject);
begin
  if cbCarNoPicc.Checked then
    cobCarNoPicc.Enabled := true
  else
    cobCarNoPicc.Enabled :=false;
  if cb_picc_start.Checked then
  begin
    dtp_s_Start.Enabled :=true;
    dtp_s_End.Enabled :=true;
  end
  else
  begin
    dtp_s_Start.Enabled :=false;
    dtp_s_End.Enabled :=false;
  end;
  if cb_picc_end.Checked then
  begin
    dtp_e_Start.Enabled :=true;
    dtp_e_End.Enabled :=true;
  end
  else
  begin
    dtp_e_Start.Enabled :=false;
    dtp_e_End.Enabled :=false;
  end;
end;

procedure TFormBus01.bb_picc_searchClick(Sender: TObject);
var
  SqlStr:String;
begin
  SqlStr := 'select * from hrd_car_picc where 1>0 ';
  if cbCarNoPicc.Checked then
    SqlStr:=SqlStr+' and car_no='''+cobCarNoPicc.Text+''' ';
  if cb_picc_start.Checked then
    SqlStr:=SqlStr+' and picc_start>='''+DateToStr(dtp_s_Start.date)+''' and picc_start<='''+DateToStr(dtp_s_End.date)+''' ';
  if cb_picc_end.Checked then
    SqlStr:=SqlStr+' and picc_end>='''+DateToStr(dtp_e_Start.date)+''' and picc_end<='''+DateToStr(dtp_e_End.date)+''' ';
  with qry_picc do
  begin
    sql.Clear;
    sql.Add(SqlStr);
    Open;
  end;
  cbCarNoPicc.Enabled := false;
  cb_picc_start.Enabled := false;
  cb_picc_end.Enabled :=false;
  cobCarNoPicc.Enabled :=false;
  dtp_s_start.Enabled := false;
  dtp_s_end.Enabled := false;
  dtp_e_start.Enabled := false;
  dtp_e_end.Enabled := false;
  bb_picc_search.Enabled := false;
  bb_picc_reset.Enabled := true;
end;

procedure TFormBus01.bb_picc_resetClick(Sender: TObject);
begin
  qry_picc.Close;
  cbCarNoPicc.Enabled := true;
  cb_picc_start.Enabled := true;
  cb_picc_end.Enabled :=true;
  cbCarNoPicc.Checked := false;
  cb_picc_start.Checked := false;
  cb_picc_end.Checked :=false;
  
  bb_picc_search.Enabled := true;
  bb_picc_reset.Enabled := false;
end;

procedure TFormBus01.TntSpeedButton8Click(Sender: TObject);
begin
  panelflow4.Enabled := false;
  tntdbgrid3.Enabled:=false;
  mcd5.Show;
end;

procedure TFormBus01.mcd5DblClick(Sender: TObject);
begin
  qry_petrol.Edit;
  qry_petrol.FieldByName('you_date').Value := mcd5.Date;
  panelflow4.Enabled := true;
  tntdbgrid3.Enabled:=true;
  mcd5.Hide;
end;

procedure TFormBus01.bbtn_search_youClick(Sender: TObject);
Var
  SqlStr:String;
begin
  SqlStr := 'select * from hrd_car_you where 1>0 ';
  if CBCarNoYou.Checked then
    SqlStr := SqlStr+' and car_no='''+CobCarNoYou.Text+''' ';
  if CBYouCate.Checked then
    SqlStr := SqlStr+' and you_cate='''+leftstr(CobYouCate.Text,1)+''' ';
  if cb_you_date.Checked then
    SqlStr := SqlStr+' and you_date>='''+datetostr(dtp_you_begin.Date)+''' and you_date<='''+datetostr(dtp_you_begin.Date)+''' ' ;
  with qry_petrol do
  begin
    Sql.Clear;
    sql.Add(SqlStr);
    Open;
  end;
  CBCarNoYou.Enabled := false;
  cb_you_date.Enabled := false;
  CBYouCate.Enabled := false;
  bbtn_reset_you.Enabled := true;
  bbtn_search_you.Enabled := false;
  
end;

procedure TFormBus01.bbtn_reset_youClick(Sender: TObject);
begin
  qry_petrol.Close;
  CBCarNoYou.Checked := false;
  cb_you_date.Checked := false;
  CBYouCate.Checked := false;
  CBCarNoYou.Enabled := true;
  cb_you_date.Enabled := true;
  CBYouCate.Enabled := true;
  bbtn_reset_you.Enabled := false;
  bbtn_search_you.Enabled := true;
end;

procedure TFormBus01.CBCarNoYouClick(Sender: TObject);
begin
  if CBCarNOYou.Checked then
    CobCarNOYou.Enabled := true
  else
    CobCarNOYou.Enabled := false;
  if CBYouCate.Checked then
    CobYouCate.Enabled := true
  else
    CobYouCate.Enabled := false;
  if cb_you_date.Checked then
  begin
    dtp_you_begin.Enabled := true;
    dtp_you_end.Enabled := true;
  end
  else
  begin
    dtp_you_begin.Enabled := false;
    dtp_you_end.Enabled := false;
  end;
end;

procedure TFormBus01.TntSpeedButton10Click(Sender: TObject);
begin
  panelflow5.Enabled := false;
  tntdbgrid4.Enabled:=false;
  mcd6.Show;
end;

procedure TFormBus01.TntSpeedButton11Click(Sender: TObject);
begin
  panelflow5.Enabled := false;
  tntdbgrid4.Enabled:=false;
  mcd7.Show;
end;

procedure TFormBus01.mcd6DblClick(Sender: TObject);
begin
  qry_pass.Edit;
  qry_pass.FieldByName('buy_date').AsDateTime := mcd6.Date;
  PanelFlow5.Enabled := true;
  tntdbgrid4.Enabled:=true;
  mcd6.Hide;
end;

procedure TFormBus01.bbtn_pass_resetClick(Sender: TObject);
begin
  qry_pass.Close;
  cb_car_no_pass.Checked := false;
  cb_buy_date.Checked := false;
  cb_end_date.Checked := false;
  cb_car_no_pass.Enabled := true;
  cb_buy_date.Enabled := true;
  cb_end_date.Enabled := true;
  bbtn_pass_search.Enabled := true;
  bbtn_pass_reset.Enabled := false;
end;

procedure TFormBus01.bbtn_pass_searchClick(Sender: TObject);
var
  SqlStr:String;
begin
  SqlStr := 'select * from hrd_car_buy where 1>0';
  IF cb_car_no_pass.Checked then
    SqlStr := SqlStr + ' and car_no='''+CobCarNoPass.Text+''' ';
  if cb_buy_date.Checked then
    SqlStr := SqlStr + ' and buy_date>='''+datetostr(dtp_buy_begin.date)+''' and buy_date<='''+datetostr(dtp_buy_end.date)+''' ';
  if cb_end_date.Checked then
    SqlStr := SqlStr + ' and end_date>='''+datetostr(dtp_end_begin.date)+''' and end_date<='''+datetostr(dtp_end_end.date)+''' ';
  with qry_pass do
  begin
    sql.Clear;
    sql.Add(SqlStr);
    Open;
  end;
  cb_car_no_pass.Enabled := false;
  cb_buy_date.Enabled := false;
  cb_end_date.Enabled := false;
  CobCarNoPass.Enabled := false;
  dtp_buy_begin.Enabled := false;
  dtp_buy_end.Enabled := false;
  dtp_end_begin.Enabled := false;
  dtp_end_end.Enabled := false;
  bbtn_pass_search.Enabled := false;
  bbtn_pass_reset.Enabled := true;
end;

procedure TFormBus01.cb_buy_dateClick(Sender: TObject);
begin
  if cb_car_no_pass.Checked then
    CobCarNoPass.Enabled := true
  else
    CobCarNoPass.Enabled := false;
  if cb_buy_date.Checked then
  begin
    dtp_buy_begin.Enabled := true;
    dtp_buy_end.Enabled := true;
  end
  else
  begin
    dtp_end_begin.Enabled := false;
    dtp_end_end.Enabled := false;
  end;
end;

procedure TFormBus01.mcd7DblClick(Sender: TObject);
begin
  qry_pass.Edit;
  qry_pass.FieldByName('end_date').AsDateTime := mcd7.Date;
  PanelFlow5.Enabled := true;
  tntdbgrid4.Enabled:=true;
  mcd7.Hide;
end;

end.
