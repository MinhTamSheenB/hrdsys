{*************************************************************************
Name：Med01(醫藥基本資料建檔)
Author: anil
Create date:2005-10-15
Modify date:2005-10-15
Commentate:醫藥基本資料建檔
*************************************************************************}
unit UnitMed01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,StrUtils, TntDB;

type
  TFormMed01 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelQuery: TPanel;
    EditBCodeDru: TTntEdit;
    EditECodeDru: TTntEdit;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    ADOQuery1: TADOQuery;
    Btn_Search_Dru: TTntBitBtn;
    PageControl1: TTntPageControl;
    TabSheetDru: TTntTabSheet;
    TabSheetSick: TTntTabSheet;
    TabSheetUnit: TTntTabSheet;
    TabSheetUse: TTntTabSheet;
    TabSheetWay: TTntTabSheet;
    PanelDru: TTntPanel;
    TntLabel2: TTntLabel;
    TntLabel5: TTntLabel;
    EditChsDru: TTntEdit;
    TabSheetSymp: TTntTabSheet;
    TntLabel6: TTntLabel;
    EditEngDru: TTntEdit;
    TntLabel7: TTntLabel;
    EditVimDru: TTntEdit;
    PanelSick: TTntPanel;
    TntLabel8: TTntLabel;
    TntLabel9: TTntLabel;
    TntLabel10: TTntLabel;
    TntLabel11: TTntLabel;
    EditECodeSick: TTntEdit;
    EditBCodeSick: TTntEdit;
    Btn_Search_Sick: TTntBitBtn;
    EditChsSick: TTntEdit;
    EditEngSick: TTntEdit;
    EditVimSick: TTntEdit;
    PanelUnit: TTntPanel;
    TntLabel12: TTntLabel;
    TntLabel13: TTntLabel;
    TntLabel14: TTntLabel;
    TntLabel15: TTntLabel;
    EditECodeUnit: TTntEdit;
    EditBCodeUnit: TTntEdit;
    Btn_Search_Unit: TTntBitBtn;
    EditChsUnit: TTntEdit;
    EditEngUnit: TTntEdit;
    EditVimUnit: TTntEdit;
    PanelUse: TTntPanel;
    TntLabel16: TTntLabel;
    TntLabel17: TTntLabel;
    TntLabel18: TTntLabel;
    TntLabel19: TTntLabel;
    EditECodeUse: TTntEdit;
    EditBCodeUse: TTntEdit;
    Btn_Search_Use: TTntBitBtn;
    EditChsUse: TTntEdit;
    EditEngCode: TTntEdit;
    EditVimUse: TTntEdit;
    PanelWay: TTntPanel;
    TntLabel20: TTntLabel;
    TntLabel21: TTntLabel;
    TntLabel22: TTntLabel;
    TntLabel23: TTntLabel;
    EditECodeWay: TTntEdit;
    EditBCodeWay: TTntEdit;
    Btn_Search_Way: TTntBitBtn;
    EditChsWay: TTntEdit;
    EditEngWay: TTntEdit;
    EditVimWay: TTntEdit;
    PanelSymp: TTntPanel;
    TntLabel24: TTntLabel;
    TntLabel25: TTntLabel;
    TntLabel26: TTntLabel;
    TntLabel27: TTntLabel;
    EditECodeSymp: TTntEdit;
    EditBCodeSymp: TTntEdit;
    Btn_Search_Symp: TTntBitBtn;
    EditChsSymp: TTntEdit;
    EditEngSymp: TTntEdit;
    EditVimSymp: TTntEdit;
    ADOQuerySick: TADOQuery;
    ADOQueryUnit: TADOQuery;
    ADOQueryUse: TADOQuery;
    ADOQueryWay: TADOQuery;
    ADOQuerySymp: TADOQuery;
    PanelFlow: TTntPanel;
    TntLabel3: TTntLabel;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    bbtn_ok: TTntBitBtn;
    GroupBoxFlow: TTntGroupBox;
    DBNavigator1: TDBNavigator;
    ADOQuerySickupd_user: TStringField;
    ADOQuerySickupd_date: TDateTimeField;
    ADOQuerySicksick_code: TStringField;
    ADOQuerySicksick_name: TWideStringField;
    ADOQuerySicksick_vim: TWideStringField;
    ADOQuerySicksick_eng: TWideStringField;
    ADOQueryUnitunit_code: TStringField;
    ADOQueryUnitunit_name: TWideStringField;
    ADOQueryUnitunit_vim: TWideStringField;
    ADOQueryUnitunit_eng: TWideStringField;
    ADOQueryUseupd_user: TStringField;
    ADOQueryUseupd_date: TDateTimeField;
    ADOQueryUseuse_code: TStringField;
    ADOQueryUseuse_name: TWideStringField;
    ADOQueryUseuse_vim: TWideStringField;
    ADOQueryUseuse_eng: TWideStringField;
    ADOQueryWayupd_user: TStringField;
    ADOQueryWayupd_date: TDateTimeField;
    ADOQueryWayway_code: TStringField;
    ADOQueryWayway_name: TWideStringField;
    ADOQueryWayway_vim: TWideStringField;
    ADOQueryWayway_eng: TWideStringField;
    ADOQuerySympupd_user: TStringField;
    ADOQuerySympupd_date: TDateTimeField;
    ADOQuerySympsymp_code: TStringField;
    ADOQuerySympsymp_name: TWideStringField;
    ADOQuerySympsymp_vim: TWideStringField;
    ADOQuerySympsymp_eng: TWideStringField;
    ADOQueryDru: TADOQuery;
    ADOQueryDruupd_user: TWideStringField;
    ADOQueryDruupd_date: TDateTimeField;
    ADOQueryDrudru_code: TWideStringField;
    ADOQueryDrudru_name: TWideStringField;
    ADOQueryDrudru_price: TFloatField;
    ADOQueryDruunit_code: TWideStringField;
    ADOQueryDrurul_code: TWideStringField;
    ADOQueryDrupro_code: TFloatField;
    PanelFlowBtn: TTntPanel;
    bbtn_add: TTntBitBtn;
    label_Flow0: TTntLabel;
    edit_Flow0: TTntDBEdit;
    ADOQueryUnitupd_user: TStringField;
    ADOQueryUnitupd_date: TDateTimeField;
    ADOQueryDruunit_name: TTntWideStringField;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    //my define
    procedure InitLang;
    procedure InitForm;
    function GetInitSql:widestring;
    function CheckInputValid():boolean;
    procedure ChangeFlowFlds;
    procedure SetActEnabled(modify_Flag:boolean=true);
    procedure SetActiveFlds;
    procedure ClearOldFlds;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure sb_editClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure PanelFlowTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure sb_PrintClick(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure edit_Flow0KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_Search_DruClick(Sender: TObject);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure bbtn_okClick(Sender: TObject);
    procedure bbtn_addClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure ADOQueryDruCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMed01: TFormMed01;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  page_key:string;//活動頁標誌字符串
//  ADOQuery1:TADOQuery;//活動數據集
{$R *.dfm}

procedure TFormMed01.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
  i:integer;
begin
SetComponentLang(self);//set component language text
with ADOQueryDru do
  for i:=0 to Fieldcount-1 do
    keys:=keys+'fld_'+Fields[i].FieldName+',';
with ADOQuerySick do
  for i:=0 to Fieldcount-1 do
    keys:=keys+'fld_'+Fields[i].FieldName+',';
with ADOQueryUnit do
  for i:=0 to Fieldcount-1 do
    keys:=keys+'fld_'+Fields[i].FieldName+',';
with ADOQueryUse do
  for i:=0 to Fieldcount-1 do
    keys:=keys+'fld_'+Fields[i].FieldName+',';
with ADOQueryWay do
  for i:=0 to Fieldcount-1 do
    keys:=keys+'fld_'+Fields[i].FieldName+',';
with ADOQuerySymp do
  for i:=0 to Fieldcount-1 do
    keys:=keys+'fld_'+Fields[i].FieldName+',';
keys:=keys+'med01_titl,not_find_data,total,current_location,msg_post_record_on_close,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
  +'error_date,error_empid,dut02_choose_clas,error_hour,error_input_hour';
LangStr:=GetLangWideStrs(keys);
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;

procedure TFormMed01.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  PageControl1.ActivePage:=TabSheetDru;
  PageControl1Change(TabSheetDru);
end;

procedure TFormMed01.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'med01');//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;

function TFormMed01.GetInitSql:widestring;
//返回初始sql語句
var
  table_name,sql_str:widestring;
begin
  //找特定表格
  table_name:='hrd_med_'+page_key;
  if page_key='Dru' then
    table_name:='hrd_dru_mast';
  //sql語句
  sql_str:='select * from '+table_name+' where 2>1 ';
  result:=sql_str;
end;

procedure TFormMed01.Btn_Search_DruClick(Sender: TObject);
var
  sql_str,table_name,code_begin,code_end,c_name,e_name,v_name:widestring;
begin
  //讀輸入條件
  code_begin:=TtntEdit(FindComponent('EditBCode'+page_key)).Text;
  code_end:=TtntEdit(FindComponent('EditECode'+page_key)).Text;
  c_name:=TtntEdit(FindComponent('EditChs'+page_key)).Text;
  e_name:=TtntEdit(FindComponent('EditEng'+page_key)).Text;
  v_name:=TtntEdit(FindComponent('EditVim'+page_key)).Text;
  //找特定表格
  sql_str:=GetInitSql;
  if code_begin<>'' then
    sql_str:=sql_str+' and '+page_key+'_code >='''+code_begin+'''';
  if code_end<>'' then
    sql_str:=sql_str+' and '+page_key+'_code <='''+code_end+'''';
  if c_name<>'' then
    sql_str:=sql_str+' and '+page_key+'_name like ''%'+c_name+'%''';
  if e_name<>'' then
    sql_str:=sql_str+' and '+page_key+'_eng like ''%'+e_name+'%''';
  if v_name<>'' then
    sql_str:=sql_str+' and '+page_key+'_vim like ''%'+v_name+'%''';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if Eof then
      SetStatusText(GetLangName(LangStr,'not_find_data'));
  end;
  SetActiveFlds;//設置欄位
  //Btn_Reset.OnClick(Sender);
end;

procedure TFormMed01.ADOQuery1AfterOpen(DataSet: TDataSet);
//打開數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
  ADOQuery1.FieldByName('upd_user').Visible:=false;
  ADOQuery1.FieldByName('upd_date').Visible:=false;
end;

procedure TFormMed01.ADOQuery1AfterClose(DataSet: TDataSet);
//關閉數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
end;

procedure TFormMed01.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
//改變數據集時設置功能按鈕是否可用
begin
  SetActEnabled(true);
end;

procedure TFormMed01.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示,及改變編輯區一些欄位
begin
ChangeFlowFlds;
with ADOQuery1 do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

procedure TFormMed01.ADOQuery1BeforePost(DataSet: TDataSet);
//數據集Post時,自動追加修改者,修改日期欄位
begin
  if not CheckInputValid then
    abort;
  with ADOQuery1 do
    begin
      FieldByName('upd_user').AsString:=UserName;
      FieldByName('upd_date').AsDateTime:=GetServerDatetime;
    end;
end;

procedure TFormMed01.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

function TFormMed01.CheckInputValid():boolean;
{*************************************************************************
TO DO:提交前檢查輸入的有效性
*************************************************************************}
begin
  result:=true;
end;

procedure TFormMed01.sb_PrintClick(Sender: TObject);
//print dataset
begin
  showPrint(ADOQuery1,'員工請假情況列印');
end;

procedure TFormMed01.sb_AddClick(Sender: TObject);
//add record
begin
  with ADOQuery1 do
  begin
    if Active=false then//如果沒有打開數據集， 則重新打開
    begin
      SQL.Clear;
      SQL.Add(GetInitSql);
      Active:=true;
    end;
    Last;
    Append;
  end;
  ChangeFlowFlds;
  DBNavigator1.Hide;
  bbtn_add.Show;
  PanelFlow.Visible:=true;
  //edit_Flow0.SetFocus;
  PanelMain.Enabled:=false;
end;

procedure TFormMed01.sb_editClick(Sender: TObject);
//modify record
begin
  ChangeFlowFlds;
  DBNavigator1.Show;
  bbtn_add.Hide;
  PanelFlow.Visible:=true;
  //edit_Flow0.SetFocus;
  PanelGrid.Enabled:=true;
  PanelAct.Enabled:=false;
  PanelQuery.Enabled:=false;
end;

procedure TFormMed01.sb_DelClick(Sender: TObject);
//delete record
begin
with ADOQuery1 do
if (RecordCount<>0) or ( not Eof) then
  if wideMessageDlg(GetLangName(LangStr,'msg_del_alert'),mtConfirmation,[mbyes,mbno],0)=mryes then
    Delete;
end;

procedure TFormMed01.sb_RecoverClick(Sender: TObject);
//cancel all dataset modify
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormMed01.sb_SaveClick(Sender: TObject);
//save all dataset
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.UpdateBatch;
SetActEnabled(false);
end;

procedure TFormMed01.bbtn_addClick(Sender: TObject);
//繼續新增
begin
  ADOQuery1.Append;
  ChangeFlowFlds;
  //edit_Flow0.SetFocus;
end;

procedure TFormMed01.bbtn_okClick(Sender: TObject);
//單筆資料修改后post，並關閉編輯區
begin
  if ADOQuery1.State in [dsedit,dsinsert] then
    ADOQuery1.post;
  ImageClose.OnClick(Sender);
end;

procedure TFormMed01.ImageCloseClick(Sender: TObject);
//關閉浮動窗口,其他panel可用
begin
  if ADOQuery1.State in [dsedit,dsinsert] then
  begin
    if wideMessageDlg(GetLangName(LangStr,'msg_post_record_on_close'),mtConfirmation,[mbyes,mbno],0)=mryes then
      ADOQuery1.Post
    else
      ADOQuery1.Cancel;
  end;
  PanelFlow.Visible:=false;
  PanelMain.Enabled:=true;
  PanelQuery.Enabled:=true;
  PanelGrid.Enabled:=true;
  PanelAct.Enabled:=true;
end;

procedure TFormMed01.PanelFlowTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//拖動浮動窗口
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);
end;

procedure TFormMed01.ChangeFlowFlds;
//給浮動窗口中某些欄位賦默認值
var
  DefDate,CurDate:Tdatetime;
begin
  with ADOQuery1 do
    begin
      if State=dsInsert then//工號是否可編輯
        begin
          edit_Flow0.ReadOnly:=false;
          edit_Flow0.Color:=clwhite;
        end
      else
        begin
          edit_Flow0.ReadOnly:=true;
          edit_Flow0.Color:=clBtnface;
        end;
    end;
end;

procedure TFormMed01.SetActEnabled(Modify_Flag:boolean=true);
//設置功能按鈕是否可用
var
  status:boolean;
begin
  status:=AdoQuery1.Active;
  sb_Add.Enabled:=Pri_Arr[ADD];
  sb_Del.Enabled:=status and Pri_Arr[DEL];
  sb_edit.Enabled:=status and Pri_Arr[UPD];
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;

procedure TFormMed01.edit_Flow0KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//浮動Panel的輸入框中快捷移動設置  
begin
  if (key=13) then// key_enter
    self.FindNextControl(TwinControl(Sender),true,true,false).SetFocus;
  if (Sender.ClassType = TtntcomboBox) or (Sender.ClassType =TTntDatetimePicker) then
    exit;//while key up and down on comboBox or DatetimePicker,not continue;
  if (key=40) then//key_down
    self.FindNextControl(TwinControl(Sender),true,true,false).SetFocus;
  if (key=38) and (TwinControl(Sender).TabOrder>0) then//key_up
    self.FindNextControl(TwinControl(Sender),false,true,false).SetFocus;
end;

procedure TFormMed01.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
//頁面切換前
begin
ClearOldFlds;//清除舊欄位
end;

procedure TFormMed01.PageControl1Change(Sender: TObject);
var
  tmpstr:string;
//頁面切換后
begin
  tmpstr:=PageControl1.ActivePage.Name;
  delete(tmpstr,1,8);
  page_key:=tmpstr;//當前活動頁關鍵字
  ADOQuery1:=TADOQuery(FindComponent('ADOQuery'+page_key));
  DataSource1.DataSet:=ADOQuery1;
  if not ADOQuery1.Active then
    ADOQuery1.Active:=true;
  SetActiveFlds;//設置欄位
end;

procedure TFormMed01.ClearOldFlds;
//清除舊欄位
var
  i,toppos:integer;
  tmpLabel:TtntLabel;
  tmpDBEdit:TtntDBEdit;
begin
  with ADOQuery1 do
  begin
    for i:=0 to FieldCount-1 do
    begin
      tmpDBEdit:=TtntDBEdit(self.FindComponent('edit_Flow'+inttostr(i)));
      tmpLabel:=TtntLabel(self.FindComponent('label_Flow'+inttostr(i)));
      if tmpDBEdit<>nil then tmpDBEdit.DataField:='';
      if tmpLabel<>nil then tmpLabel.Caption:='';
    end;
  end;
end;

procedure TFormMed01.SetActiveFlds;
//設置新欄位
var
  k,i,toppos:integer;
  tmpLabel:TtntLabel;
  tmpColumn:TtntColumn;
  tmpDBEdit:TtntDBEdit;
begin
  toppos:=15;
  k:=0;
  with ADOQuery1 do
  begin
    for i:=0 to FieldCount-1 do
    begin
      if (Fields[i].FieldName='upd_date') or (Fields[i].FieldName='upd_user') then
        continue;
      tmpDBEdit:=TtntDBEdit(self.FindComponent('edit_Flow'+inttostr(k)));
      tmpLabel:=TtntLabel(self.FindComponent('label_Flow'+inttostr(k)));
      if tmpDBEdit=nil then//不存在則創建數據字段
        tmpDBEdit:=TtntDBEdit.Create(self);
      with tmpDBEdit do
        begin
          parent:=GroupBoxFlow;
          name:='edit_Flow'+inttostr(k);
          DataSource:=DataSource1;
          DataField:=Fields[i].FieldName;
          left:=110;
          width:=10*(Fields[i].DisplayWidth);
          if width>120 then width:=120;
          if width<50 then width:=50;
          top:=toppos;
          height:=21;
        end;
      if tmpLabel=nil then//不存在則創建文本標簽
        tmpLabel:=TtntLabel.Create(self);
      with tmpLabel do
        begin
          parent:=GroupBoxFlow;
          name:='label_Flow'+inttostr(k);
          left:=5;
          width:=100;
          top:=toppos+4;
          height:=13;
          Alignment:=taRightJustify;
          font.Color:=clblue;
        end;
      tmpLabel.Caption:=GetLangName(LangStr,'fld_'+Fields[i].FieldName);
      //DBGrid標題設置
      DBGrid1.Columns[k].Title.Caption:=tmpLabel.Caption;
      DBGrid1.Columns[k].Title.Color:=clskyblue;
      toppos:=toppos+30;
      k:=k+1;
    end;
  end;
  GroupBoxFlow.Height:=toppos;
  PanelFlow.Height:=toppos+80;
end;

procedure TFormMed01.ADOQueryDruCalcFields(DataSet: TDataSet);
begin
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_med_unit where unit_code='''+ADOQueryDru.FieldByName('unit_code').AsString+'''');
    open;
    if not Eof then
      ADOQueryDru.FieldByName('unit_name').AsString:=FieldByName('unit_name').AsString;
  end;
end;

end.
