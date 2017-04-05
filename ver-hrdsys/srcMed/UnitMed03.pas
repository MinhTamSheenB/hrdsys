{*************************************************************************
Name�Gmed03(��u�i��)
Author: anil
Create date:2005-10-18
Modify date:2005-10-18
Commentate:��u�i��
*************************************************************************}
unit UnitMed03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils;

type
  TFormMed03 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelQuery: TPanel;
    DBGrid1: TTntDBGrid;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    DTPickBegin: TTntDateTimePicker;
    DTPickEnd: TTntDateTimePicker;
    PanelGrid: TPanel;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    TntLabel1: TTntLabel;
    edit_dru_begin: TTntEdit;
    edit_dru_end: TTntEdit;
    TntLabel2: TTntLabel;
    edit_acpt_begin: TTntEdit;
    edit_acpt_end: TTntEdit;
    BtnQuery: TTntButton;
    sb_Print: TTntSpeedButton;
    ADOQuery1: TADOQuery;
    ADOQuery1into_date: TDateTimeField;
    ADOQuery1dru_code: TStringField;
    ADOQuery1into_qty: TIntegerField;
    ADOQuery1dru_price: TBCDField;
    ADOQuery1acpt_no: TStringField;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQueryMon: TADOQuery;
    PanelFlow: TTntPanel;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    GroupBoxFlow: TTntGroupBox;
    label_Flow0: TTntLabel;
    edit_Flow0: TTntDBEdit;
    PanelFlowBtn: TTntPanel;
    DBNavigator1: TDBNavigator;
    bbtn_ok: TTntBitBtn;
    bbtn_add: TTntBitBtn;
    ADOQuery1dru_name: TTntWideStringField;
    ADOQuery1item_no: TStringField;
    TntLabel4: TTntLabel;
    edit_Flow1: TTntDBEdit;
    TntLabel5: TTntLabel;
    edit_Flow2: TTntDBEdit;
    TntLabel6: TTntLabel;
    edit_Flow3: TTntDBEdit;
    TntLabel7: TTntLabel;
    edit_Flow4: TTntDBEdit;
    TntLabel8: TTntLabel;
    edit_Flow5: TTntDBEdit;
    TntLabel9: TTntLabel;
    edit_Flow6: TTntDBEdit;
    TntLabel10: TTntLabel;
    edit_Flow7: TTntDBEdit;
    ADOQuery1unit_name: TTntWideStringField;
    ADOQueryDru: TADOQuery;
    sb_choose_date: TTntSpeedButton;
    Calendar1: TTntMonthCalendar;
    //my define
    procedure InitLang;
    procedure InitForm;
    function CheckInputValid():boolean;
    procedure ChangeFlowFlds;
    procedure SetActEnabled(modify_Flag:boolean=true);
    function GetPrice(item_no:string):double;
    function GetExchRate(curr_src,curr_obj:string;cnt_date:Tdatetime):double;
    procedure SaveOtherDataSet;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure sb_PrintClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure bbtn_addClick(Sender: TObject);
    procedure bbtn_okClick(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure PanelFlowTitleMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure edit_Flow0KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADOQuery1BeforeDelete(DataSet: TDataSet);
    procedure sb_choose_dateClick(Sender: TObject);
    procedure Calendar1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMed03: TFormMed03;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//�y���r�Ŧ�
  pri_arr:TPrvArr;//�v���Ʋ�
  TransingFlag:boolean;
{$R *.dfm}

procedure TFormMed03.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'med03');//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;

procedure TFormMed03.InitLang;
{*************************************************************************
TO DO:��l�ƻy��
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='not_find_data,total,current_location,finish,save_success,'
  +'msg_confirm_save,msg_confirm_cancel,msg_del_alert,msg_valid_into_date,'
  +'msg_valid_dru_code,msg_valid_into_qty,msg_valid_acpt_no,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormMed03.InitForm;
{*************************************************************************
TO DO:��l��Form
*************************************************************************}
begin
  DTPickBegin.Date:=StartOfTheMonth(date);
  DTPickEnd.Date:=EndOfTheMonth(date);
end;

procedure TFormMed03.BtnQueryClick(Sender: TObject);
var
  sql_str,where_str:string;
begin
  sql_str:='select distinct * from hrd_med_into as A ';
  where_str:='where A.into_date>='''+datetimetostr(DTPickBegin.date)+'''';
  where_str:=where_str+' and A.into_date<='''+datetimetostr(DTPickEnd.date)+'''';
  if trim(edit_dru_begin.Text)<>'' then
    where_str:=where_str+' and A.dru_code>='''+trim(edit_dru_begin.Text)+'''';
  if trim(edit_dru_end.Text)<>'' then
    where_str:=where_str+' and A.dru_code<='''+trim(edit_dru_end.Text)+'''';
  if trim(edit_acpt_begin.Text)<>'' then
    where_str:=where_str+' and A.acpt_no>='''+trim(edit_acpt_begin.Text)+'''';
  if trim(edit_acpt_end.Text)<>'' then
    where_str:=where_str+' and A.acpt_no<='''+trim(edit_acpt_end.Text)+'''';
  sql_str:=sql_str+where_str;
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
end;

function TFormMed03.GetPrice(item_no:string):double;
{*************************************************************************
TO DO:�p����
*************************************************************************}
var
  sql_str,currency:string;
  exch_rate,nlPrice:double;
  in_date:Tdatetime;
begin
  with DMHrdsys.SQLQuery3 do
  begin//�������
    sql_str:='select * from pur_unit where item_no='''+item_no+'''';
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    nlPrice:=FieldByName('deal_price').AsCurrency;
    currency:=FieldByName('currency').AsString;
  end;
  //exch_rate:=GetExchRate(currency,'VND',into_date);//�p��ײv
  //nlPrice:=nlPrice*exch_rate;//�ন�V�ަZ�����
  result:=nlPrice;
end;


function TFormMed03.GetExchRate(curr_src,curr_obj:string;cnt_date:Tdatetime):double;
{*************************************************************************
TO DO:�p��ײv
*************************************************************************}
var
  datestr,sql_str:string;
  rate1,rate2:double;
begin
  if curr_src=curr_obj then
  begin
    result:=1;
    exit;
  end;
  datestr:=formatdatetime('yyyymmdd',cnt_date);
  sql_str:='select * from cos_exch where currency1='''+curr_src+''' and cnt_date='''+datestr+'''';
  with DMHrdsys.SQLQuery3 do
  begin//�������
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      rate1:=FieldByName('exchg_rate').AsFloat
    else
      rate1:=1;
    sql_str:='select * from cos_exch where currency1='''+curr_obj+''' and cnt_date='''+datestr+'''';
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      rate2:=FieldByName('exchg_rate').AsFloat
    else
      rate2:=1;
  end;
  result:=rate2/rate1;
end;

procedure TFormMed03.ADOQuery1CalcFields(DataSet: TDataSet);
//�p�����
var
  dru_code,item_no:string;
  unit_str,dru_name:widestring;
  dru_price:double;
begin
  dru_code:=DataSet.FieldByName('dru_code').AsString;
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_dru_mast as A,hrd_med_unit as B where '
      +' A.unit_code=B.unit_code and A.dru_code='''+dru_code+'''');
    open;
    if not Eof then
    begin
      dru_name:=FieldByName('dru_name').Value;
      item_no:=FieldByName('rul_code').AsString;
      unit_str:=FieldByName('unit_name').Value+'/'+FieldByName('unit_vim').Value;
      if DataSet.State in [dsinsert] then//�s�W�ɱq���ʳ���ɤ���o���
        dru_price:=FieldByName('dru_price').AsFloat
      else
        dru_price:=DataSet.FieldByName('dru_price').AsFloat;
    end;
    with DataSet do
    begin                                
      FieldByName('item_no').AsString:=item_no;
      FieldByName('unit_name').Value:=unit_str;
      FieldByName('dru_name').Value:=dru_name;
      FieldByName('dru_price').AsFloat:=dru_price;
    end;
  end;
end;

procedure TFormMed03.ADOQuery1AfterOpen(DataSet: TDataSet);
//���}�ƾڶ��ɳ]�m�\����s�O�_�i��
begin
  SetActEnabled(false);
  with ADOQueryMon do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_med_mon');
    open;
  end;
  with ADOQueryDru do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_dru_mast ');
    open;
  end;
end;

procedure TFormMed03.ADOQuery1AfterClose(DataSet: TDataSet);
//�����ƾڶ��ɳ]�m�\����s�O�_�i��
begin
  SetActEnabled(false);
end;

procedure TFormMed03.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
//���ܼƾڶ��ɳ]�m�\����s�O�_�i��
begin
  SetActEnabled(true);
end;

procedure TFormMed03.ADOQuery1AfterScroll(DataSet: TDataSet);
//�ƾڶ����ʮ�,���ܪ��A�洣��
begin
ChangeFlowFlds;
if not TransingFlag then
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(DataSet.RecNo)
    +' '+GetLangName(LangStr,'total')+':'+inttostr(DataSet.RecordCount));
end;

procedure TFormMed03.ADOQuery1BeforePost(DataSet: TDataSet);
//�ƾڶ�Post��,�۰ʰl�[�ק��,�ק������
begin
  with DataSet do
    begin
      FieldByName('upd_user').AsString:=UserName;
      FieldByName('upd_date').AsDateTime:=GetServerDatetime;
    end;
  SaveOtherDataSet;
end;

procedure TFormMed03.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:�I�������Y���ܱƧǤ覡
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormMed03.sb_PrintClick(Sender: TObject);
//print dataset
begin
  showPrint(ADOQuery1,'�J�w��ƦC�L');
end;

procedure TFormMed03.sb_AddClick(Sender: TObject);
//add record
begin
  with ADOQuery1 do
  begin
    if Active=false then//�p�G�S�����}�ƾڶ��A �h���s���}
    begin
      SQL.Clear;
      SQL.Add('select * from hrd_med_into where 1=2');
      Active:=true;
    end;
    Last;
    Append;
  end;
  ChangeFlowFlds;
  DBNavigator1.Hide;
  bbtn_add.Show;
  PanelFlow.Visible:=true;
  edit_Flow0.SetFocus;
  PanelMain.Enabled:=false;
end;

procedure TFormMed03.sb_DelClick(Sender: TObject);
//delete record
begin
with ADOQuery1 do
if not Eof then
  if wideMessageDlg(GetLangName(LangStr,'msg_del_alert'),mtConfirmation,[mbyes,mbno],0)=mryes then
    Delete;
end;

procedure TFormMed03.sb_editClick(Sender: TObject);
//modify record
begin
  ChangeFlowFlds;
  DBNavigator1.Show;
  bbtn_add.Hide;
  PanelFlow.Visible:=true;
  edit_Flow0.SetFocus;
  PanelGrid.Enabled:=true;
  PanelAct.Enabled:=false;
  PanelQuery.Enabled:=false;
end;

procedure TFormMed03.sb_RecoverClick(Sender: TObject);
//cancel all dataset modify
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
ADOQueryMon.CancelBatch;
ADOQueryDru.CancelBatch;
SetActEnabled(false);
end;

procedure TFormMed03.sb_SaveClick(Sender: TObject);
//save all dataset
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.UpdateBatch;
ADOQueryMon.UpdateBatch;
ADOQueryDru.UpdateBatch;
SetActEnabled(false);
end;

procedure TFormMed03.bbtn_addClick(Sender: TObject);
//�~��s�W
begin
  if not CheckInputValid then
    exit;
  ADOQuery1.Append;
  ChangeFlowFlds;
  edit_Flow0.SetFocus;
end;

procedure TFormMed03.bbtn_okClick(Sender: TObject);
//�浧��ƭק�Zpost�A�������s���
begin
  if not CheckInputValid then
    exit;
  if ADOQuery1.State in [dsedit,dsinsert] then
    ADOQuery1.post;
  ImageClose.OnClick(Sender);
end;

procedure TFormMed03.ImageCloseClick(Sender: TObject);
//�����B�ʵ��f,��Lpanel�i��
begin
  Calendar1.Visible:=false;
  PanelFlow.Visible:=false;
  PanelMain.Enabled:=true;
  PanelQuery.Enabled:=true;
  PanelGrid.Enabled:=true;
  PanelAct.Enabled:=true;
  ADOQuery1.Cancel;
end;

procedure TFormMed03.PanelFlowTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//��ʯB�ʵ��f
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);
end;

procedure TFormMed03.edit_Flow0KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//�B��Panel����J�ؤ��ֱ����ʳ]�m  
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

function TFormMed03.CheckInputValid():boolean;
{*************************************************************************
TO DO:����e�ˬd��J�����ĩ�
*************************************************************************}
begin
  if trim(edit_Flow0.Text)='' then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_valid_into_date'));
    edit_Flow0.SetFocus;
    result:=false;
    exit;
  end;
  if trim(edit_Flow1.Text)='' then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_valid_dru_code'));
    edit_Flow1.SetFocus;
    result:=false;
    exit;
  end;
  if trim(edit_Flow6.Text)='' then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_valid_into_qty'));
    edit_Flow6.SetFocus;
    result:=false;
    exit;
  end;
  if trim(edit_Flow7.Text)='' then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_valid_acpt_no'));
    edit_Flow7.SetFocus;
    result:=false;
    exit;
  end;
  result:=true;
end;

procedure TFormMed03.ChangeFlowFlds;
//���B�ʵ��f���Y�������q�{��
var
  DefDate,CurDate:Tdatetime;
begin
  with ADOQuery1 do
    begin
      if State=dsInsert then//�O�_�ק窱�A
        begin
          edit_Flow0.ReadOnly:=false;
          edit_Flow0.Color:=clwhite;
          edit_Flow1.ReadOnly:=false;
          edit_Flow1.Color:=clwhite;
          sb_choose_date.Enabled:=true;
        end
      else
        begin
          edit_Flow0.ReadOnly:=true;
          edit_Flow0.Color:=clBtnface;
          edit_Flow1.ReadOnly:=true;
          edit_Flow1.Color:=clBtnFace;
          sb_choose_date.Enabled:=false;
        end;
    end;
end;

procedure TFormMed03.SetActEnabled(Modify_Flag:boolean=true);
//�]�m�\����s�O�_�i��
var
  status:boolean;
begin
  status:=AdoQuery1.Active;
  sb_Print.Enabled:=status and Pri_Arr[Prt];
  sb_Add.Enabled:=Pri_Arr[ADD];
  sb_Del.Enabled:=status and Pri_Arr[DEL];
  sb_edit.Enabled:=status and Pri_Arr[UPD];
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;

procedure TFormMed03.SaveOtherDataSet;
//�O�s����ɩM�ī~�s���ɤ�
var
  month,dru_code:string;
  ServerDate:TDatetime;
  into_qty,into_price,new_price,old_price,old_qty:double;
begin
  ServerDate:=GetServerDatetime;
  with ADOQuery1 do
  begin
    month:=FormatDatetime('yyyymm',FieldByName('into_date').AsDateTime);
    dru_code:=FieldByName('dru_code').AsString;
    if State=dsInsert then//�s�W
      into_qty:=FieldByName('into_qty').AsFloat
    else if State=dsBrowse then//�R��
      into_qty:=0-FieldByName('into_qty').AsFloat
    else if FieldByName('into_qty').Value<>FieldByName('into_qty').OldValue then//�ק�ƶq
      into_qty:=FieldByName('into_qty').Value-FieldByName('into_qty').OldValue
    else//�ƶq���ק�ɰh�X
      exit;  
    into_price:=FieldByName('dru_price').AsFloat;
  end;
  with ADOQueryMon do//�B�z����
  begin
    if Locate('month;dru_code',VarArrayOf([month,dru_code]),[loCaseInsensitive]) then//�ק�
    begin//�ק����
      old_price:=FieldByname('new_price').AsFloat;
      old_qty:=FieldByname('end_inv').AsFloat;
      if old_qty+into_qty=0 then
        new_price:=old_price
      else
        new_price:=(old_price*old_qty+into_price*into_qty )/(old_qty+into_qty );
      Edit;
    end
    else//�s�W�����
    begin
      old_price:=into_price;
      old_qty:=0;
      new_price:=into_price;
      Append;
      FieldByName('dru_code').AsString:=dru_code;
      FieldByName('month').AsString:=month;
    end;
    FieldByname('upd_user').Value:=username;
    FieldByname('upd_date').Value:=ServerDate;
    FieldByName('old_price').AsFloat:=old_price;
    FieldByName('new_price').AsFloat:=new_price;
    FieldByName('in_inv').AsFloat:=FieldByName('in_inv').AsFloat+into_qty;
    FieldByName('end_inv').AsFloat:=old_qty+into_qty;
    Post;
  end;
  with ADOQueryDru do//�B�z�ī~�s����
  begin
    Locate('dru_code',dru_code,[loCaseInsensitive]);
    Edit;
    FieldByName('upd_user').AsString:=username;
    FieldByName('upd_date').AsDateTime:=ServerDate;
    FieldByName('dru_price').Value:=new_price;
    post;
  end;
end;

procedure TFormMed03.ADOQuery1BeforeDelete(DataSet: TDataSet);
begin
  SaveOtherDataSet;
end;

procedure TFormMed03.sb_choose_dateClick(Sender: TObject);
begin
  Calendar1.Visible:=true;
end;

procedure TFormMed03.Calendar1DblClick(Sender: TObject);
begin
  Calendar1.Visible:=false;
  ADOQuery1.Edit;
  ADOQuery1.FieldByName('into_date').AsDateTime:=Calendar1.Date;
end;

end.
