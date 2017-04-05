unit UnitHrd20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ADODB, DB, Grids, DBGrids,strutils,
  ComCtrls, TntComCtrls, TntDialogs, Buttons,WSDLIntf, TntExtCtrls,
  TntStdCtrls, DBCtrls, Mask, TntDbCtrls, TntButtons, TntDBGrids, TntDB;


type
  TFormHrd20 = class(TForm)
    Panel3: TPanel;
    StatusBar1: TTntStatusBar;
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel6: TTntLabel;
    TntLabel10: TTntLabel;
    edit_begin: TTntEdit;
    edit_end: TTntEdit;
    Btn_Search: TTntBitBtn;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_Print: TTntSpeedButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1department: TWideStringField;
    PanelFlow: TTntPanel;
    TntPanel2: TTntPanel;
    Image1: TImage;
    TntGroupBox2: TTntGroupBox;
    TntLabel4: TTntLabel;
    TntLabel7: TTntLabel;
    TntLabel9: TTntLabel;
    TntLabel11: TTntLabel;
    TntLabel12: TTntLabel;
    TntLabel13: TTntLabel;
    EditFlow0: TTntDBEdit;
    TntDBEdit1: TTntDBEdit;
    TntDBEdit2: TTntDBEdit;
    TntDBEdit4: TTntDBEdit;
    Panel7: TPanel;
    DBNavigator2: TDBNavigator;
    s_add: TTntBitBtn;
    TntBitBtn2: TTntBitBtn;
    TntDBEdit3: TTntDBEdit;
    TntButton1: TTntButton;
    TntLabel1: TTntLabel;
    ADOQuery1emp_cate: TTntStringField;
    ADOQuery2: TADOQuery;
    emp_cate: TTntDBRadioGroup;
    month1: TMonthCalendar;
    ADOQuery1date_s: TDateTimeField;
    TntLabel2: TTntLabel;
    TntDBEdit5: TTntDBEdit;
    TntButton2: TTntButton;
    ADOQuery1date_e: TDateTimeField;
    TntLabel3: TTntLabel;
    cate: TTntComboBox;
    chk_date_s: TTntCheckBox;
    dtpBegin: TTntDateTimePicker;
    dtpEnd: TTntDateTimePicker;
   
    procedure InitForm;
    procedure InitLang;
    procedure SetActEnabled(modify_Flag:boolean=true);

    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure bbtn_addClick(Sender: TObject);
    procedure bbtn_okClick(Sender: TObject);
    procedure sb_PrintClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure ChangeFlowFlds;
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ImageCloseClick(Sender: TObject);
    procedure TntButton1Click(Sender: TObject);
    procedure Month1DblClick(Sender: TObject);
    procedure TntButton2Click(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd20: TFormHrd20;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  pri_arr:TPrvArr;//權限數組
  Langstr,LangC,LangE,LangV :TWideStrings;//語言字符串
  flag :string ;
{$R *.dfm}


procedure TFormHrd20.DBGrid1TitleClick(Column: TColumn);
var
  sort_key:string;
begin
  if column.Grid.DataSource.DataSet.ClassName='TClientDataset' then
    exit;
  with TADODataset(column.Grid.DataSource.DataSet) do
  begin
    if not active then
      exit;
    if column.fieldname='' then//空欄位時退出
      exit;
    if FieldByName(column.fieldname).FieldKind=fklookup then//lookup欄位
      sort_key:=FieldByName(column.fieldname).KeyFields
    else if FieldByName(column.fieldname).FieldKind=fkdata then
      sort_key:=Column.FieldName
    else  //未知欄位則退出
      exit;
    if Sort=sort_key then
      Sort:=sort_key + ' DESC'
    else
      Sort:=sort_key;
  end;
end;

procedure TFormHrd20.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'hrd20');//Get privilege
  SetComponentLang(self);//set component language text
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql,CobDeptBegin);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql,CobDeptEnd);
  dtpBegin.Date:=GetServerDatetime;//DateOf(GetServerDatetime);//encodedate(YearOf(GetServerDatetime),1,1);
  dtpEnd.Date:=GetServerDatetime;// DateOf(GetServerDatetime);
end;

procedure TFormHrd20.InitForm;
var
  lcFrom_FileName,lcTo_FileName:string;
begin
 // date_s.Date:=date;
//  date_e.Date:=date-1;

end;

procedure TFormHrd20.Btn_SearchClick(Sender: TObject);
//查詢數據
var
  sql_str,where_str:string;
begin
//  sql_str:='select * from hrd_lanu A,hrd_emp B where A.emp_id=B.emp_id ';
  sql_str:='select * from hrd_emp_chan A where 1=1 ';

  sql_str:=sql_str+' and emp_id in (select emp_id from hrd_emp where 1=1';
  //2012-09-07 hyt add
  sql_str:=sql_str+' and '+G_sFactorySql+' ';

  if trim(edit_begin.text)<>'' then
    where_str:=where_str+' and emp_id>=''' +trim(edit_begin.text)+'''';
  if trim(edit_end.text)<>'' then
    where_str:=where_str+' and emp_id<=''' +trim(edit_end.text)+'''';
  if CobDeptBegin.Text<>'' then
    where_str:=where_str+' and dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if CobDeptEnd.Text<>'' then
    where_str:=where_str+' and dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  if copy( cate.Text,1,1)  ='1' then
     where_str:=where_str+' and emp_cate ='''+copy( cate.Text,1,1 ) +'''';
   if copy( cate.Text,1,1)  ='2' then
     where_str:=where_str+' and emp_cate ='''+copy( cate.Text,1,1 ) +'''';
   if chk_date_s.Checked then
     where_str:=where_str+' and date_s >='''+formatdatetime('yyyy/mm/dd',dtpBegin.Date)+''' '+
                          ' and date_s <='''+formatdatetime('yyyy/mm/dd',dtpEnd.Date)+''' ';


 sql_str:=sql_str+where_str+')';

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
    sb_edit.Enabled := true;
    sb_del.Enabled := true;
    sb_save.Enabled := true;
    sb_print.Enabled := true ;
    StatusBar1.SimpleText := ' Total : ' + inttostr( adoQuery1.RecordCount )  + ' 人 ';
  end;

end;

procedure TFormHrd20.bbtn_addClick(Sender: TObject);
begin
   ADOQuery1.Append;
   PanelFlow.Visible:=true;
 // ChangeFlowFlds;
  EditFlow0.SetFocus;
end;

procedure TFormHrd20.bbtn_okClick(Sender: TObject);
var
  sql_str, cate  :string ;
begin
   cate := '' ;
   if emp_cate.ItemIndex = 0 then
      cate := '1'  ;
   if emp_cate.ItemIndex = 1 then
      cate := '2' ;
   sql_str:='select * from hrd_emp_chan A where emp_id =''' + EditFlow0.text + ''' and emp_cate=''' + cate + ''' and date_s='''+ TntDBEdit3.Text  + '''';

    Adoquery2.close;
    Adoquery2.sql.Clear;
    Adoquery2.sql.Add(sql_str);
    Adoquery2.open;
    if not Adoquery2.eof then
       showmessage( '該員工資料已存在' )
    else
      begin
        if ADOQuery1.State in [dsedit,dsinsert] then
           ADOQuery1.post;
      end ;
   PanelFlow.Visible:=false ;
   sb_save.Enabled := true ;
    PanelAct.Enabled:=true;
  PanelQuery.Enabled:=true;
 SetActEnabled(true) ;
end;

procedure TFormHrd20.sb_PrintClick(Sender: TObject);
var
  titl:widestring;
begin
  titl:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangC,'obas05_titl')+'<br>';
  showPrint(ADOQuery1,titl);
end;

procedure TFormHrd20.sb_AddClick(Sender: TObject);
//add record
begin
  with ADOQuery1 do
  begin
    if Active=false then//如果沒有打開數據集， 則重新打開
    begin
      SQL.Clear;
      SQL.Add('select * from hrd_emp_chan where 2=1 ');
      Active:=true;
    end;
    Last;
    Append;
    ADOQuery1.FieldByName('up_user').Value := username ;
    ADOQuery1.FieldByName('up_date').AsDateTime  := GetServerDateTime ;
  end;
  ChangeFlowFlds;
  PanelFlow.Visible:=true;
  EditFlow0.Enabled := true ;
  EditFlow0.SetFocus;
  PanelFlow.Enabled :=true;
  PanelMain.Enabled:=true;
end;


procedure TFormHrd20.sb_DelClick(Sender: TObject);
begin
with ADOQuery1 do
if (RecordCount<>0) or ( not Eof) then
  if wideMessageDlg(GetLangName(LangStr,'msg_del_alert'),mtConfirmation,[mbyes,mbno],0)=mryes then
    Delete;
end;

procedure TFormHrd20.sb_editClick(Sender: TObject);
begin
  ChangeFlowFlds;
  PanelFlow.Visible:=true;
  EditFlow0.SetFocus;
  PanelGrid.Enabled:=true;
  PanelAct.Enabled:=false;
  PanelQuery.Enabled:=false;
  sb_save.Enabled := true ;

end;

procedure TFormHrd20.sb_RecoverClick(Sender: TObject);
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormHrd20.sb_SaveClick(Sender: TObject);
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.UpdateBatch;
SetActEnabled(false);
end;
procedure TFormHrd20.ChangeFlowFlds;
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
procedure TFormHrd20.InitLang;
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
  +'sex_man,sex_woman';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;
procedure TFormHrd20.SetActEnabled(Modify_Flag:boolean=true);
//設置功能按鈕是否可用
var
  status:boolean;
begin
  status:=AdoQuery1.Active;
  sb_print.Enabled:=status and Pri_Arr[PRT];
  sb_Add.Enabled:=Pri_Arr[ADD];
  sb_Del.Enabled:=status and Pri_Arr[DEL];
  sb_edit.Enabled:=status and Pri_Arr[UPD];
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;
procedure TFormHrd20.ADOQuery1CalcFields(DataSet: TDataSet);
var
  emp, sql, dept, cate  :string ;
begin
  emp := dataset.fieldbyname('emp_id').AsString ;
  sql := 'select a.emp_id, a.emp_chs, a.name_vim, b.dept_code + '' - '' + b.abbr_titl as department  from hrd_emp as a, hrd_dept as b where a.emp_id='''+ emp +''' and a.dept_code=b.dept_code';
  dmhrdsys.SQLQuery1.SQL.Clear ;
  dmhrdsys.SQLQuery1.SQL.Add(sql);
  dmhrdsys.SQLQuery1.Open ;
//  dept := dmhrdsys.SQLQuery1.fieldbyname('dept_code').AsString ;
  if not dmhrdsys.SQLQuery1.Eof then
     begin
       dataset.FieldByName('emp_chs').Value := dmhrdsys.SQLQuery1.fieldbyname('emp_chs').Value ;
       dataset.FieldByName('name_vim').Value := dmhrdsys.SQLQuery1.fieldbyname('name_vim').Value ;
       dataset.FieldByName('department').Value := dmhrdsys.SQLQuery1.fieldbyname('department').Value ;
     end;
//  cate := dataset.fieldbyname('emp_cate').AsString ;
 // if cate = '1' then
 //    emp_cate1.Checked := true ;
 // if cate = '2' then
 //    emp_cate2.Checked := true ;
end;

procedure TFormHrd20.ImageCloseClick(Sender: TObject);
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

procedure TFormHrd20.TntButton1Click(Sender: TObject);
begin
   flag := 'S' ;
   month1.Visible := true ;
end;

procedure TFormHrd20.Month1DblClick(Sender: TObject);
begin
  adoQuery1.Edit ;
  if flag = 'S' then
     tntdbedit3.Text := formatdatetime('yyyy-mm-dd',Month1.date ) ;
  if flag = 'E' then
     tntdbedit5.Text := formatdatetime('yyyy-mm-dd',Month1.date ) ;
  flag := '' ;
  month1.Visible := false ;
end;

procedure TFormHrd20.TntButton2Click(Sender: TObject);
begin
   flag := 'E' ;
   month1.Visible := true ;
end;

end.
