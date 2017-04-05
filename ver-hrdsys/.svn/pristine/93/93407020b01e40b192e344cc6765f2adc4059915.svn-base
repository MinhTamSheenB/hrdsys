unit UnitBus02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, Grids, DBGrids, TntDBGrids, StdCtrls, Buttons,DateUtils,
  TntButtons, TntStdCtrls, Mask, ComCtrls, TntComCtrls, ExtCtrls,
  TntExtCtrls, CheckLst, TntCheckLst, DB, ADODB,StrUtils,TntDialogs,
  DBClient, WSDLIntf,Provider, DBCtrls, TntDbCtrls, TntDB;
type
  TFormBus02 = class(TTntForm)
    TntPanel1: TTntPanel;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    DataSource1: TDataSource;
    TntGroupBox2: TTntGroupBox;
    CobCarNo: TTntComboBox;
    bbtn_search: TTntBitBtn;
    bbtn_reset: TTntBitBtn;
    cb_car_no: TTntCheckBox;
    cb_out_date: TTntCheckBox;
    dtp_out_begin: TDateTimePicker;
    dtp_out_end: TDateTimePicker;
    TntDBGrid1: TTntDBGrid;
    cb_dept_range: TTntCheckBox;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    ADOQuery1: TADOQuery;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1car_no: TStringField;
    ADOQuery1out_date: TDateTimeField;
    ADOQuery1use_dept: TStringField;
    ADOQuery1if_bing: TStringField;
    ADOQuery1dest: TStringField;
    ADOQuery1KM: TIntegerField;
    ADOQuery1over_cate: TStringField;
    ADOQuery1over_time: TIntegerField;
    ADOQuery1repair_pay: TBCDField;
    ADOQuery1road_pay: TBCDField;
    ADOQuery1meal_pay: TBCDField;
    ADOQuery1park_pay: TBCDField;
    qry_driver: TADOQuery;
    ADOQuery1driver_name: TTntWideStringField;
    PanelFlow: TTntPanel;
    TntLabel1: TTntLabel;
    sbtn_add: TTntSpeedButton;
    sbtn_finish: TTntSpeedButton;
    TntPanel3: TTntPanel;
    Image1: TImage;
    TntGroupBox3: TTntGroupBox;
    TntLabel2: TTntLabel;
    TntLabel4: TTntLabel;
    TntLabel6: TTntLabel;
    TntLabel7: TTntLabel;
    sb_out_date: TTntSpeedButton;
    TntDBEdit2: TTntDBEdit;
    TntCobCarNo: TTntDBComboBox;
    CobDriver: TTntDBComboBox;
    Nvg: TDBNavigator;
    CobDept: TTntDBComboBox;
    TntLabel3: TTntLabel;
    CobIfBing: TTntDBComboBox;
    TntLabel5: TTntLabel;
    TntLabel8: TTntLabel;
    TntLabel9: TTntLabel;
    TntLabel10: TTntLabel;
    TntLabel11: TTntLabel;
    TntLabel12: TTntLabel;
    TntLabel13: TTntLabel;
    TntLabel14: TTntLabel;
    TntDBEdit1: TTntDBEdit;
    TntDBEdit3: TTntDBEdit;
    TntDBEdit5: TTntDBEdit;
    TntDBEdit6: TTntDBEdit;
    TntDBEdit7: TTntDBEdit;
    TntDBEdit8: TTntDBEdit;
    TntDBEdit9: TTntDBEdit;
    mcd: TMonthCalendar;
    TntDBComboBox1: TTntDBComboBox;
    ADOQuery1driver: TStringField;
    qry_dept: TADOQuery;
    ADOQuery1dept_name: TTntWideStringField;
    procedure TntFormCreate(Sender: TObject);
    procedure InitLangInfo;
    procedure InitForm;
    procedure SetActEnabled(Modify_Flag:boolean=true);
    procedure CobDeptEndChange(Sender: TObject);
    procedure cb_out_dateClick(Sender: TObject);
    procedure bbtn_searchClick(Sender: TObject);
    procedure bbtn_resetClick(Sender: TObject);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure sb_AddClick(Sender: TObject);
    procedure sbtn_finishClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure sbtn_addClick(Sender: TObject);
    procedure sb_out_dateClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure mcdDblClick(Sender: TObject);
    procedure TntCobCarNoChange(Sender: TObject);
    procedure TntDBComboBox1Change(Sender: TObject);
    procedure TntPanel3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CobDriverChange(Sender: TObject);
    procedure CobDeptChange(Sender: TObject);
    procedure ADOQuery1if_bingGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQuery1over_cateGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBus02: TFormBus02;
  ws_Words:TWideStrings;
  ActiveIndex:integer;
implementation
uses
  UnitDMHrdsys,UnitHrdUtils;
var
  pri_arr:TPrvArr;//權限數組
  WhichDate:String;
{$R *.dfm}
{===============================================================================
  多語言語言初始化
===============================================================================}
procedure TFormBus02.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  ThisFormUsedWords:='hour_over20,fest_overtime,hour_over15,dut17_normal_class,Yes,No';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
  SetComponentLang(self);

end;
{程序初始化}
procedure TFormBus02.TntFormCreate(Sender: TObject);
begin
  InitLangInfo;
  InitForm;
  Pri_arr:=GetPrvArr(username,'bus02');//Get privilege
end;

procedure TFormBus02.InitForm;
var
  fld_name:String;
begin
  if userLang='E' then
    fld_name:='eng'
  else if userLang='V' then
    fld_name:='vim'
  else
    fld_name:='chs';
  SetComboxList('select car_no from hrd_car_no order by car_no',CobCarNo);
  SetComboxList('select dept_code+'' ''+abbr_titl from hrd_dept',CobDeptBegin);
  SetComboxList('select dept_code+'' ''+abbr_titl from hrd_dept',CobDeptEnd);
  CobDeptBegin.ItemIndex:=0;
  CobDeptEnd.ItemIndex:=CobDeptEnd.Items.Count-1;
  CobDept.Items := CobDeptBegin.Items;
  TntCobCarNo.Items := CobCarNo.Items;
  with qry_driver do
  begin
    sql.Clear;
    sql.Add('select driver,driver+'' ''+name_'+fld_name+' as driver_name from hrd_car_driver order by driver');
    Open;
    first;
    while not eof do
    begin
      CobDriver.Items.Add(fieldbyname('driver_name').Value);
      next;
    end;
  end;
  PanelFlow.Width:=297;
end;

procedure TFormBus02.SetActEnabled(Modify_Flag:boolean=true);
var
  status:boolean;
  IsEmpty:boolean;
begin
  status:=ADOQuery1.Active;
  IsEmpty :=ADOQuery1.eof;
  sb_Add.Enabled:=Pri_Arr[ADD];
  sb_Del.Enabled:=status and Pri_Arr[DEL] and Not IsEmpty;
  sb_edit.Enabled:=status and Pri_Arr[UPD];
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;

procedure TFormBus02.CobDeptEndChange(Sender: TObject);
begin
  if CobDeptEnd.ItemIndex<CobDeptBegin.ItemIndex then
    CobDeptEnd.ItemIndex:=CobDeptBegin.ItemIndex
end;

procedure TFormBus02.cb_out_dateClick(Sender: TObject);
begin
  if cb_car_no.Checked then
    CobCarNo.Enabled := true
  else
    CobCarNo.Enabled := false;
  if cb_out_date.Checked then
  begin
    dtp_out_begin.Enabled :=true;
    dtp_out_end.Enabled :=true;
  end
  else
  begin
    dtp_out_begin.Enabled := false;
    dtp_out_end.Enabled := false;
  end;
  if cb_dept_range.Checked then
  begin
    CobDeptBegin.Enabled :=true;
    CobDeptEnd.Enabled :=true;
  end
  else
  begin
    CobDeptBegin.Enabled :=false;
    CobDeptEnd.Enabled :=false;
  end;

end;

procedure TFormBus02.bbtn_searchClick(Sender: TObject);
var
  SqlStr:String;
begin
  SqlStr:='select * from hrd_car_out where 1>0';
  if cb_car_no.Checked then
    SqlStr := SqlStr+' and car_no='''+CobCarNo.Text+'''';
  if cb_out_date.Checked then
    SqlStr := SqlStr+' and out_date>='''+datetostr(dtp_out_begin.Date)+''' and out_date<='''+datetostr(dtp_out_end.Date)+'''';  
  if cb_dept_range.Checked then
    SqlStr := SqlStr+' and use_dept>='''+leftstr(CobDeptBegin.Text,6)+''' and use_dept<='''+leftstr(CobDeptEnd.Text,6)+'''';
  with ADOquery1 do
  begin
    sql.Clear;
    sql.Add(SqlStr);
    open;
  end;
  cb_car_no.Enabled :=false;
  cb_out_date.Enabled :=false;
  cb_dept_range.Enabled :=false;
  bbtn_search.Enabled :=false;
  bbtn_reset.Enabled := true;
  CobCarNo.Enabled :=false;
  dtp_out_begin.Enabled:=false;
  dtp_out_end.Enabled :=false;
  CobDeptBegin.Enabled :=false;
  CobDeptEnd.Enabled :=false;
end;

procedure TFormBus02.bbtn_resetClick(Sender: TObject);
begin
  adoquery1.Close;
  cb_car_no.Checked :=false;
  cb_out_date.Checked :=false;
  cb_dept_range.Checked :=false;
  cb_car_no.Enabled :=true;
  cb_out_date.Enabled :=true;
  cb_dept_range.Enabled :=true;
  bbtn_search.Enabled :=true;
  bbtn_reset.Enabled := false;  
end;

procedure TFormBus02.ADOQuery1AfterClose(DataSet: TDataSet);
begin
  SetActEnabled(false);
end;

procedure TFormBus02.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
  SetActEnabled(false);
end;

procedure TFormBus02.ADOQuery1BeforePost(DataSet: TDataSet);
begin
  with ADOquery1 do
  begin
    Edit;
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=GetServerDatetime;
  end;
end;

procedure TFormBus02.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
begin
  SetActEnabled(true);
end;

procedure TFormBus02.sb_AddClick(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    if not Active then
    begin
      sql.Clear;
      sql.Add('select * from hrd_car_out where 1<0');
      Open;
    end;
    append;
  end;
  PanelFlow.Show;
  tntgroupbox2.Enabled := false;
  TntDBGrid1.Enabled := false;
  PanelAct.Enabled := false;
  SBtn_add.Show;
  Nvg.Hide;
end;

procedure TFormBus02.sbtn_finishClick(Sender: TObject);
var
  i:integer;
  flag:boolean;
begin
  PanelFlow.Hide;
  PanelAct.Enabled := true;
  TntDBGrid1.Enabled := true;
  TntGroupBox2.Enabled := true;
  if ADOQuery1.State in [dsEdit,dsInsert] then
  begin
    if ADOQuery1.State = dsInsert then
    begin
      flag:=false;
      for i:=2 to ADOQuery1.FieldCount-1 do
      begin
        if ADOQuery1.Fields[i].AsString<>'' then
          flag:= true;
      end;
      if not flag then
        ADOQuery1.Cancel
      else
        ADOQuery1.Post;
    end    
    else
      ADOQuery1.Post;
  end;
end;

procedure TFormBus02.sb_editClick(Sender: TObject);
begin
  TntGroupBox2.Enabled := false;
  TntDBGrid1.Enabled := true;
  PanelAct.Enabled := false;
  PanelFlow.Show;
  SBtn_add.Hide;
  Nvg.Show;
end;

procedure TFormBus02.sb_DelClick(Sender: TObject);
begin
  if not ADOQuery1.eof then
    ADOQuery1.Delete;
end;

procedure TFormBus02.sb_RecoverClick(Sender: TObject);
begin
  adoquery1.CancelBatch(arAll);
  SetActEnabled(false);
end;

procedure TFormBus02.sb_SaveClick(Sender: TObject);
begin
  adoquery1.UpdateBatch(arAll);
  SetActEnabled(false);
end;

procedure TFormBus02.sbtn_addClick(Sender: TObject);
begin
  adoquery1.Append;
end;

procedure TFormBus02.sb_out_dateClick(Sender: TObject);
var
  str:string;
begin
  str:= TTntSpeedButton(sender).Name;
  WhichDate:=midStr(str,4,length(str)-3);
  mcd.Show;
  panelflow.Enabled := false;
  tntdbgrid1.Enabled:=false;
end;

procedure TFormBus02.Image1Click(Sender: TObject);
begin
  TntGroupBox2.Enabled := true;
  TntDBGrid1.Enabled := true;
  PanelAct.Enabled := true;
  PanelFlow.Hide;
end;

procedure TFormBus02.mcdDblClick(Sender: TObject);
begin
  adoquery1.Edit;
  adoquery1.FieldByName(WhichDate).Value :=mcd.Date;
  mcd.Hide;
  panelflow.Enabled := true;
  tntdbgrid1.Enabled:=true;
end;

procedure TFormBus02.TntCobCarNoChange(Sender: TObject);
begin
  adoquery1.Edit;
  adoquery1.FieldByName('car_no').Value:= TntCobCarNo.Text;
end;

procedure TFormBus02.TntDBComboBox1Change(Sender: TObject);
begin
  adoquery1.Edit;
  adoquery1.fieldbyname('over_cate').Value:=leftstr(TntDBComboBox1.Text,1);
end;

procedure TFormBus02.TntPanel3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);
end;

procedure TFormBus02.CobDriverChange(Sender: TObject);
begin
  adoquery1.Edit;
  adoquery1.FieldByName('driver').AsString := leftstr(CobDriver.Text,6);
end;

procedure TFormBus02.CobDeptChange(Sender: TObject);
begin
  adoquery1.Edit;
  adoquery1.FieldByName('use_dept').AsString := leftstr(CobDriver.Text,6);
end;

procedure TFormBus02.ADOQuery1if_bingGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if sender.value='1' then
    text:='1-'+GetLangName(ws_Words,'Yes');
  if sender.value='0' then
    text:='0-'+GetLangName(ws_Words,'No');
end;

procedure TFormBus02.ADOQuery1over_cateGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if sender.Value=0 then
    text := '0-'+GetLangName(ws_Words,'dut17_normal_class');
  if sender.Value=1 then
    text := '1-'+GetLangName(ws_Words,'hour_over15');
  if sender.Value=2 then
    text := '2-'+GetLangName(ws_Words,'hour_over20');
  if sender.Value=3 then
    text := '3-'+GetLangName(ws_Words,'fest_overtime');
end;

end.
