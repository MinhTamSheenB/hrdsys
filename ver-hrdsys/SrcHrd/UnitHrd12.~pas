unit UnitHrd12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils;
type
  TFormHrd12 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    PanelQuery: TPanel;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    PanelFlow: TTntPanel;
    TntLabel3: TTntLabel;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    TntGroupBox5: TTntGroupBox;
    Label_emp_id: TTntLabel;
    Label_s_ask_h: TTntLabel;
    Label_e_ask_h: TTntLabel;
    TntLabel2: TTntLabel;
    TntLabel5: TTntLabel;
    TntLabel9: TTntLabel;
    EditFlow0: TTntDBEdit;
    TntDBEdit2: TTntDBEdit;
    TntDBEdit4: TTntDBEdit;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    bbtn_add: TTntBitBtn;
    bbtn_ok: TTntBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1department: TWideStringField;
    TntGroupBox1: TTntGroupBox;
    TntLabel6: TTntLabel;
    TntLabel10: TTntLabel;
    edit_begin: TTntEdit;
    edit_end: TTntEdit;
    Btn_Search: TTntBitBtn;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    TntDBEdit3: TTntDBEdit;
    TntLabel1: TTntLabel;
    TntDBEdit1: TTntDBEdit;
    TntDBEdit6: TTntDBEdit;
    TntDBEdit5: TTntDBEdit;
    TntDBEdit7: TTntDBEdit;
    TntDBEdit8: TTntDBEdit;
    TntDBEdit9: TTntDBEdit;
    TntLabel4: TTntLabel;
    TntLabel7: TTntLabel;
    TntLabel11: TTntLabel;
    ADOQuery1cont_date1: TDateTimeField;
    ADOQuery1cont_pay1: TFloatField;
    ADOQuery1cont_date2: TDateTimeField;
    ADOQuery1cont_pay2: TFloatField;
    ADOQuery1cont_date3: TDateTimeField;
    ADOQuery1cont_pay3: TFloatField;
    ADOQuery1pst_name: TTntWideStringField;
    ADOQuery1epbirth: TDateTimeField;
    ADOQuery1birth_addr: TTntWideStringField;
    ADOQuery1tpaddrvim: TTntWideStringField;
    ADOQuery1epidno: TTntWideStringField;
    ADOQuery1epid_date: TDateTimeField;
    ADOQuery1epid_vim: TTntWideStringField;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    MonthCalendar1: TMonthCalendar;
    ADOQuery1epindt: TDateTimeField;
    BtnPreview: TTntButton;
    BtnPrint: TTntBitBtn;
    PrintDialog1: TPrintDialog;
    ADOQuery1name_vim: TTntWideStringField;
    ADOQuery1book_id: TTntWideStringField;
    ADOQuery1book_area: TTntWideStringField;
    ADOQuery1cont_num: TTntWideStringField;
    ADOQuery1cont_date: TDateTimeField;
    ADOQuery1cont_id: TTntWideStringField;
    ADOQuery1country: TTntWideStringField;
    TntLabel12: TTntLabel;
    EditFlow1: TTntDBEdit;
    TntLabel13: TTntLabel;
    ADOQuery1cont_year: TStringField;
    TntLabel8: TTntLabel;
    TntLabel14: TTntLabel;
    edit_cont_year: TTntEdit;
    ADOQuery1book_date: TStringField;
    TntLabel50: TTntLabel;
    CobInfo: TTntComboBox;
    lab_total: TTntLabel;
    TntBitBtn1: TTntBitBtn;
    CobPst: TTntComboBox;
    procedure FormCreate(Sender: TObject);
    procedure InitLang;
    procedure InitForm;
    procedure sb_AddClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure SetActEnabled(modify_Flag:boolean=true);
    procedure ChangeFlowFlds;
    procedure ADOQuery1emp_idChange(Sender: TField);
    procedure EditFlow0KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure MonthCalendar1DblClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ImageCloseClick(Sender: TObject);
    procedure bbtn_addClick(Sender: TObject);
    procedure bbtn_okClick(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    function CheckInputValid():boolean;
    procedure Btn_SearchClick(Sender: TObject);
    procedure BtnPreviewClick(Sender: TObject);
    procedure PrintTip(PrintFlag:boolean;sClass:string);
    procedure TntBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd12: TFormHrd12;

implementation
uses
  UnitHrdUtils,unitDMHrdsys, UnitPrthrd12;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  can_post:boolean;
  Num_M,Num_W:integer;
  AGender:String;
  dFlag :string ;
{$R *.dfm}

procedure TFormHrd12.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'hrd12');//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
  dFlag := '0' ;
  //2011-11-09 hyt add
  edit_cont_year.Text :=formatDatetime('yyyy',getServerDatetime());
  CobInfo.ItemIndex :=0;
end;
procedure TFormHrd12.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='vietnam_chingluh_company,hrd15_titl,total,current_location,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
  +'not_find_data,with_star_cannot_empty,msg_post_record_on_close,'
  +'sex_man,sex_woman,all_emp,undirect_emp,direct_emp';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');

  CobPst.Items.Add('9-'+GetLangName(LangStr,'all_emp'));
  CobPst.Items.Add('0-'+GetLangName(LangStr,'undirect_emp'));
  CobPst.Items.Add('1-'+GetLangName(LangStr,'direct_emp'));
  CobPst.ItemIndex:=0;
end;

procedure TFormHrd12.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  SqlStr:string;
begin
  SqlStr:='select dept_code+'' ''+abbr_titl from hrd_dept where '+G_sFactorySql;
  SetComboxList(sqlStr,CobDeptBegin);
  SetComboxList(sqlStr,CobDeptEnd);
  SqlStr:='select info_code+'' ''+info_chs from hrd_inwork ';
  SetComboxList(SqlStr,CobInfo,'0');
  CobInfo.Items.Add(GetLangName(LangStr,'all_inwork'));
  CobInfo.Items.Add(GetLangName(LangStr,'all_outwork'));
  CobInfo.Items.Add(GetLangName(LangStr,'all'));
  CobInfo.ItemIndex:=CobInfo.Items.Count-3;
end;
procedure TFormHrd12.sb_AddClick(Sender: TObject);
begin
   with ADOQuery1 do
  begin
    if Active=false then//如果沒有打開數據集， 則重新打開
    begin
      SQL.Clear;
      SQL.Add('select * from hrd_emp_contract where 2=1 ');
      Active:=true;
    end;
    Last;
    Append;
  end;
  ChangeFlowFlds;
  DBNavigator1.Hide;
  bbtn_add.Show;
  PanelFlow.Visible:=true;
  EditFlow0.SetFocus;
  PanelMain.Enabled:=false;
end;

procedure TFormHrd12.sb_DelClick(Sender: TObject);
begin

with ADOQuery1 do
if (RecordCount<>0) or ( not Eof) then
  if wideMessageDlg(GetLangName(LangStr,'msg_del_alert'),mtConfirmation,[mbyes,mbno],0)=mryes then
    Delete;
end;

procedure TFormHrd12.sb_editClick(Sender: TObject);
begin
   ChangeFlowFlds;
  DBNavigator1.Show;
  bbtn_add.Hide;
  PanelFlow.Visible:=true;
  EditFlow0.SetFocus;
  PanelGrid.Enabled:=true;
  PanelAct.Enabled:=false;
  PanelQuery.Enabled:=false;
end;

procedure TFormHrd12.sb_RecoverClick(Sender: TObject);
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormHrd12.sb_SaveClick(Sender: TObject);
begin
   if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.UpdateBatch;
SetActEnabled(false);
end;
procedure TFormHrd12.SetActEnabled(Modify_Flag:boolean=true);
//設置功能按鈕是否可用
var
  status:boolean;
begin
  status:=AdoQuery1.Active;
  BtnPrint.Enabled:=status and Pri_Arr[PRT];
  BtnPreview.Enabled:=status and Pri_Arr[PRT];
  sb_Add.Enabled:=Pri_Arr[ADD];
  sb_Del.Enabled:=status and Pri_Arr[DEL];
  sb_edit.Enabled:=status and Pri_Arr[UPD];
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;
procedure TFormHrd12.ChangeFlowFlds;
//給浮動窗口中某些欄位賦默認值
begin
  with ADOQuery1 do
  begin
    if State=dsInsert then//是否修改
    begin
      EditFlow0.ReadOnly:=false;
      EditFlow0.Color:=clwhite;
    end
    else
    begin
      EditFlow0.ReadOnly:=true;
      EditFlow0.Color:=clBtnface;
    end;
  end;
end;

procedure TFormHrd12.ADOQuery1emp_idChange(Sender: TField);
var
  SqlStr,emp_id:string;
begin
  if Length(trim(EditFlow0.Text))<6 then
    exit;
  SqlStr:='select * from hrd_emp where emp_id='''+EditFlow0.Text+'''';
  With DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(SqlStr);
    Open;
    if Eof then//不存在
    begin
      WideShowMessage('工號不存在');
      EditFlow0.SetFocus;
      Exit;
    end
    else if FieldByName('epledt').AsString<>'' then
    begin
      WideShowMessage('該工號已經離職');
      EditFlow0.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFormHrd12.EditFlow0KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure TFormHrd12.Button1Click(Sender: TObject);
begin
   MonthCalendar1.Visible := true ;
   dFlag :='1' ;
end;

procedure TFormHrd12.Button2Click(Sender: TObject);
begin
   MonthCalendar1.Visible := true ;
   dFlag :='2' ;
end;

procedure TFormHrd12.Button3Click(Sender: TObject);
begin
   MonthCalendar1.Visible := true ;
   dFlag :='3' ;
end;

procedure TFormHrd12.MonthCalendar1DblClick(Sender: TObject);
begin
   if dFlag ='1' then
      begin
        TntDBEdit1.Text :=  formatdatetime('yyyy/mm/dd',MonthCalendar1.date ) ;
        dFlag := '0' ;
        MonthCalendar1.Visible := false ;
      end;
    if dFlag ='2' then
      begin
        TntDBEdit5.Text :=  formatdatetime('yyyy/mm/dd',MonthCalendar1.date ) ;
        dFlag := '0' ;
        MonthCalendar1.Visible := false ;
      end;
     if dFlag ='3' then
      begin
        TntDBEdit8.Text :=  formatdatetime('yyyy/mm/dd',MonthCalendar1.date ) ;
        dFlag := '0' ;
        MonthCalendar1.Visible := false ;
      end;
end;

procedure TFormHrd12.ADOQuery1CalcFields(DataSet: TDataSet);
var
  SqlStr,emp_id:string;
begin
  emp_id:=dataset.FieldByName('emp_id').AsString;
  SqlStr:='select a.*, b.pst_vim from hrd_emp as a, hrd_prof as b  where a.emp_id='''+emp_id+''' and a.pst_code=b.pst_code ';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(SqlStr);
    open;
    if not Eof then
    begin
      DataSet.FieldByName('epindt').AsDateTime :=FieldByName('epindt').AsDateTime ;
      DataSet.FieldByName('name_vim').Value :=FieldByName('name_vim').Value ;
      DataSet.FieldByName('department').AsString:=FieldByName('dept_code').AsString;
      DataSet.FieldByName('epbirth').AsDateTime :=FieldByName('epbirth').AsDateTime ;
      DataSet.FieldByName('birth_addr').Value :=FieldByName('birth_addr').Value ;
      DataSet.FieldByName('tpaddrvim').Value :=FieldByName('tpaddrvim').Value ;
      DataSet.FieldByName('epidno').AsString:=FieldByName('epid_no').AsString;
      DataSet.FieldByName('epid_vim').Value :=FieldByName('epid_vim').Value ;
      DataSet.FieldByName('epid_date').AsDateTime :=FieldByName('epid_date').AsDateTime ;
      DataSet.FieldByName('pst_name').Value :=FieldByName('pst_vim').Value ;
    end;
  end;
  SqlStr:='select top 1  * from hrd_emp_manual   where emp_id='''+emp_id+''' order by book_date desc ';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(SqlStr);
    open;
    if not Eof then
    begin
      DataSet.FieldByName('book_id').AsString  :=FieldByName('book_id').AsString  ;
      //DataSet.FieldByName('book_date').AsDateTime  :=FieldByName('book_date').AsDateTime  ;
      //2011-11-11 hyt add
      if FieldByName('book_date').AsString <>'' then
        DataSet.FieldByName('book_date').AsString   :=formatDatetime('yyyy/mm/dd',FieldByName('book_date').AsDateTime)  ;

      DataSet.FieldByName('book_area').Value :=FieldByName('book_area').Value ;
      DataSet.FieldByName('cont_num').AsString  :=FieldByName('cont_num').AsString  ;
      //DataSet.FieldByName('cont_date').AsDateTime  :=FieldByName('cont_date').AsDateTime  ;
      //2011-11-09 hyt add
      //showmessage(FieldByName('cont_date').AsString);
      if FieldByName('cont_date').AsString <>'' then
        DataSet.FieldByName('cont_date').AsString   :=formatDatetime('yyyy/mm/dd',FieldByName('cont_date').AsDateTime)  ;


      DataSet.FieldByName('cont_id').Value :=FieldByName('cont_id').Value ;
      DataSet.FieldByName('country').Value :=FieldByName('country').Value ;
     end;
  end;
  if DataSet.FieldByName('cont_year').AsString='' then
      DataSet.FieldByName('cont_year').AsString:=formatDatetime('yyyy',getServerDatetime());
end;
procedure TFormHrd12.ImageCloseClick(Sender: TObject);
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

procedure TFormHrd12.bbtn_addClick(Sender: TObject);
begin
     ADOQuery1.Append;
  ChangeFlowFlds;
  EditFlow0.SetFocus;
end;

procedure TFormHrd12.bbtn_okClick(Sender: TObject);
begin
    if ADOQuery1.State in [dsedit,dsinsert] then
    ADOQuery1.post;
  ImageClose.OnClick(Sender);
end;

procedure TFormHrd12.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
   SetActEnabled(false);
end;

procedure TFormHrd12.ADOQuery1AfterClose(DataSet: TDataSet);
begin
    SetActEnabled(false);
end;

procedure TFormHrd12.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
begin
    SetActEnabled(true);
end;

procedure TFormHrd12.ADOQuery1BeforePost(DataSet: TDataSet);
begin
   if not CheckInputValid then
    abort;
  with ADOQuery1 do
  begin
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=GetServerDatetime;
    if FieldByName('cont_year').AsString='' then
      FieldByName('cont_year').AsString:=formatDatetime('yyyy',getServerDatetime());
  end;
end;
function TFormHrd12.CheckInputValid():boolean;
{*************************************************************************
TO DO:提交前檢查輸入的有效性
*************************************************************************}
begin
  if (trim(EditFlow0.Text)='') or (trim(EditFlow1.Text)='') then
  begin
    WideMessageDlg(GetLangName(LangStr,'with_star_cannot_empty'),mterror,[mbOK],0);
    EditFlow0.SetFocus;
    result:=false;
    exit;
  end;
  result:=true;
end;

procedure TFormHrd12.Btn_SearchClick(Sender: TObject);
var
  sql_str,where_str:string;
begin
  sql_str:='select * from hrd_emp_contract A where 1=1 ';
  sql_str:=sql_str+' and emp_id in (select emp_id from hrd_emp where 1=1';
  //2012-09-07 hyt add
  sql_str:=sql_str+' and '+G_sFactorySql+' ';

  //***<<<2011-11-09 hyt add
  //if CobInfo.ItemIndex=CobInfo.Items.Count-3 then//全部在職
  //  sql_str:=sql_str+' and epledt is null'
  //else if CobInfo.ItemIndex=CobInfo.Items.Count-2 then//全部離職
  //  sql_str:=sql_str+' and epledt is not null'
  //else
  //  sql_str:=sql_str+' and info_code='''+LeftStr(CobInfo.Text,1)+'''';
  //2011-11-30 hyt add
  if LeftStr(CobPst.Text,1)='0' then//幹部
    sql_str:=sql_str+' and pst_code<=''50'''
  else if LeftStr(CobPst.Text,1)='1' then//作業員
    sql_str:=sql_str+' and pst_code in(''60'',''61'',''62'',''63'') ';
  //***>>>

  if trim(edit_begin.text)<>'' then
    where_str:=where_str+' and emp_id>=''' +trim(edit_begin.text)+'''';
  if trim(edit_end.text)<>'' then
    where_str:=where_str+' and emp_id<=''' +trim(edit_end.text)+'''';
  if CobDeptBegin.Text<>'' then
    where_str:=where_str+' and dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if CobDeptEnd.Text<>'' then
    where_str:=where_str+' and dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';

  sql_str:=sql_str+where_str+')';

  if trim(edit_cont_year.text)<>'' then
    sql_str:=sql_str+' and cont_year=''' +trim(edit_cont_year.text)+'''';

  with Adoquery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  if Adoquery1.Eof then
  begin
    SetStatusText(GetLangName(LangStr,'not_find_data'));
    DBGrid1.Enabled:=false;
  end
  else
  begin
    DBGrid1.Enabled:=true;
  end;

  //2011-11-09 hyt add
  lab_total.Caption :='Total:'+ IntToStr(Adoquery1.RecordCount );
end;

procedure TFormHrd12.BtnPreviewClick(Sender: TObject);
begin
   //打印(預覽)
  if TtntButton(Sender).Name='BtnPrint' then
  begin
    if PrintDialog1.Execute then
    PrintTip(true,'1');
  end
  else
    PrintTip(false,'1');
end;
procedure TFormhrd12.PrintTip(PrintFlag:boolean;sClass:string);
begin
  with ADOQuery1 do
  begin
    first;
    if EOF then
    begin
      WideMessageDlg(GetLangName(LangStr,'not_find_data'),mtConfirmation,[mbok],0);
      exit;
    end
    else
    begin
      if PrintFlag then
        SetStatusText(GetLangName(LangStr,'while_printing')+GetLangName(LangStr,'fld_emp_id')+FieldByName('emp_id').AsString);
     // if (TntRadioButton_face.Checked) or (edit_month.Text>='200611') then
     // begin  //鞋廠
         with FormPrthrd12.QuickRep1 do
         begin
           FormPrthrd12.QRLabel53.Caption   :=formatDatetime('yyyy',getServerDatetime);
           FormPrthrd12.QRLabel36.Caption   :=formatDatetime('dd',getServerDatetime);
           FormPrthrd12.QRLabel37.Caption   :=formatDatetime('mm',getServerDatetime);
           FormPrthrd12.QRLabel55.Caption   :=formatDatetime('yyyy',getServerDatetime);
           if adoQuery1.FieldByName('cont_date3').AsString <> '' then
              FormPrthrd12.QRDBText14.DataField :='cont_date3'
           else
             begin
               if adoQuery1.FieldByName('cont_date2').AsString <> '' then
                 FormPrthrd12.QRDBText14.DataField :='cont_date2'
              else
                 FormPrthrd12.QRDBText14.DataField :='cont_date1'
             end ;

           if PrintFlag then
              Print
           else
              Preview;
          end;
     // end

    end;
  end;
  if PrintFlag then
    SetStatusText(GetLangName(LangStr,'print_finish'));
end;
//2011-11-11 hyt add
procedure TFormHrd12.TntBitBtn1Click(Sender: TObject);
begin
    showPrint(ADOQuery1,'員工基本薪資調整明細','','');
end;

end.
