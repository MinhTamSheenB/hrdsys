{*************************************************************************
Name：sal05(員工工種補貼確認)
Author: anil
Create date:2005-09-05
Modify date:2005-09-06
Commentate:員工工種補貼確認
*************************************************************************}
unit UnitSal05;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt;

type
  TFormSal05 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelPre: TPanel;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    PanelMain: TPanel;
    BtnQuery: TTntBitBtn;
    BtnPrint: TTntBitBtn;
    DataSource1: TDataSource;
    Label_dept: TTntLabel;
    Edit_Dept_code: TTntComboBox;
    PanelQuery: TTntPanel;
    PanelTail: TTntPanel;
    edit_month: TMaskEdit;
    BtnCancel: TTntBitBtn;
    BtnSubmit: TTntBitBtn;
    ADOQuery1: TADOQuery;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1wrk_mon: TStringField;
    ADOQuery1part_code: TStringField;
    ADOQuery1valid_date: TDateTimeField;
    ADOQuery1cate_name: TTntWideStringField;
    ADOQuery1cate_money: TIntegerField;
    ADOQuery1empnamechs: TTntWideStringField;
    ADOQuery1empnamevim: TTntWideStringField;
    ADOQuery1cate_grad: TStringField;
    ADOQuery1valid_flag: TBooleanField;
    BtnChooseAll: TTntBitBtn;
    BtnChooseNone: TTntBitBtn;
    chkunvalidate: TTntCheckBox;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BtnSubmitClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BtnChooseAllClick(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure BtnPrintClick(Sender: TObject);
    procedure chkunvalidateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal05: TFormSal05;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
{$R *.dfm}

procedure TFormSal05.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
  i:integer;
  GetCpt:TComponent;
begin
with ADOquery1 do
  for i:=0 to Fieldcount-1 do                      
    keys:=keys+'fld_'+Fields[i].FieldName+',';
keys:=keys+'sal05_titl,date,month,fld_department,not_find_data,'
  +'query,print,update,save,cancel,search_condition,'
  +'total,current_location,is_valid,choose_all,choose_none,'
  +'msg_confirm_save,msg_confirm_cancel,msg_save_modify_data,unvalidate';
LangStr:=GetLangWideStrs(keys);
PanelTitle.Caption:=GetLangName(LangStr,'sal05_titl');
TntGroupbox1.Caption:=GetLangName(LangStr,'search_condition');
Label_Dept.Caption:=GetLangName(LangStr,'fld_department');
Label_Month.Caption:=GetLangName(LangStr,'month');
BtnQuery.Caption:=GetLangName(LangStr,'query');
BtnPrint.Caption:=GetLangName(LangStr,'print');
BtnSubmit.Caption:=GetLangName(LangStr,'save');
BtnCancel.Caption:=GetLangName(LangStr,'cancel');
BtnChooseAll.Caption:=GetLangName(LangStr,'choose_all');
BtnChooseNone.Caption:=GetLangName(LangStr,'choose_none');
//2014.12.26
chkunvalidate.Caption := GetLangName(Langstr,'unvalidate');
//
with DBGrid1.Columns do// set Columns texts
  begin
    for i:=0 to Count-1 do
    begin
      GetCpt:=self.FindComponent('Label_'+Items[i].FieldName);
      if GetCpt<>nil then
        Ttntlabel(GetCpt).Caption:=GetLangName(LangStr,'fld_'+Items[i].FieldName);
      Items[i].Title.caption:=GetLangName(LangStr,'fld_'+Items[i].FieldName);
    end;
    Items[0].Title.caption:=GetLangName(LangStr,'is_valid');
  end;
end;

procedure TFormSal05.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str,fld_name:string;
begin
  if userLang='E' then
    fld_name:='dept_code+'' ''+eng_abbr'
  else if userLang='V' then
    fld_name:='dept_code+'' ''+vim_abbr'
  else
    fld_name:='dept_code+'' ''+abbr_titl';
  sql_str:='select '+fld_name+' as dept_name,dept_code from hrd_dept where dept_code>=''000000'' and dept_code<=''ZZZZZZ''';
  SetComboxList(sql_str,edit_Dept_code);
  edit_month.Text:= formatdatetime('yyyymm',date);
end;

procedure TFormSal05.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(username,'sal03');
  InitLang;// Init language
  InitForm;// Init Form
end;

procedure TFormSal05.BtnQueryClick(Sender: TObject);
var
  sql_str:string;
begin
  //
  PanelTail.Enabled := True;
  //
  DBGrid1.Columns[0].Visible := True;
  //
  if ADOQuery1.Active then ADOQuery1.Close;
  //
  if not chkunvalidate.Checked then
  begin
    //2012-12-13 hyt add
    if upperCase(leftstr(edit_Dept_code.Text,1))<>G_sFactory then
    begin
      Showmessage('Department is Wrong ');
      exit ;
    end;
    //
    sql_str:='select * from hrd_wrkpart as B,hrd_wrkpay_grad as C where B.part_grad=C.grad_code';
    with DMHrdsys.SQLQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add(sql_str);
      open;
    end;
    //
    sql_str:='select * from hrd_emp where dept_code='''+leftstr(edit_Dept_code.Text,6)+'''';
    with DMHrdsys.SQLQuery2 do
    begin
      Close;
      sql.Clear;
      sql.Add(sql_str);
      open;
    end;
    //
    sql_str:='select * from hrd_wrkpay where emp_id in (select emp_id from hrd_emp where dept_code='''+leftstr(edit_Dept_code.Text,6)+''') and wrk_mon='''+leftstr(edit_month.Text,6)+''' and  part_code <> ''''';
    with ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add(sql_str);
      open;
    end;
    BtnPrint.Enabled:=true;
    BtnChooseAll.Enabled:=true;
    BtnChooseNone.Enabled:=true;
  end
  else begin
    //
    sql_str:='select * from hrd_wrkpart as B,hrd_wrkpay_grad as C where B.part_grad=C.grad_code';
    with DMHrdsys.SQLQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add(sql_str);
      open;
    end;
    //
    sql_str:='select * from hrd_emp';
    with DMHrdsys.SQLQuery2 do
    begin
      Close;
      sql.Clear;
      sql.Add(sql_str);
      open;
    end;
    //
    sql_str:='select * from hrd_wrkpay where wrk_mon='''+leftstr(edit_month.Text,6)+''' and  part_code <> '''' and valid_date is null';
    with ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add(sql_str);
      open;
    end;
    BtnPrint.Enabled:=true;
    //
    PanelTail.Enabled := False;
    //
    DBGrid1.Columns[0].Visible := False;
  end;  
end;

procedure TFormSal05.BtnSubmitClick(Sender: TObject);
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  ADOQuery1.UpdateBatch;
  BtnCancel.Enabled:=false;
  BtnSubmit.Enabled:=false;
end;

procedure TFormSal05.BtnCancelClick(Sender: TObject);
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  ADOQuery1.CancelBatch;
  BtnCancel.Enabled:=false;
  BtnSubmit.Enabled:=false;
end;

procedure TFormSal05.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormSal05.ADOQuery1BeforePost(DataSet: TDataSet);
{*************************************************************************
TO DO:移動前錯誤檢查,改變一些欄位值及狀態
*************************************************************************}
begin
with ADOQuery1 do
  begin
    FieldByName('upd_user').Value:=username;
    FieldByName('upd_date').Value:=GetServerDateTime;
    BtnCancel.Enabled:=true;
    BtnSubmit.Enabled:=true;
  end;
end;

procedure TFormSal05.ADOQuery1AfterScroll(DataSet: TDataSet);
{*************************************************************************
TO DO:移動記錄時在狀態欄顯示提示信息
*************************************************************************}
begin
with ADOQuery1 do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

procedure TFormSal05.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{*************************************************************************
TO DO:快捷鍵設置
*************************************************************************}
begin
if Shift=[ssCtrl] then
  begin
    if key=KEY_S then
      if BtnSubmit.Enabled then
        BtnSubmit.Click;
    if key=KEY_Z then
      if BtnCancel.Enabled then
        BtnCancel.Click;
    if key=VK_F4 then
      begin
        self.Close;
        self.Parent.Hide;
      end;
  end;
if Shift=[] then
  begin
    if key=VK_F2 then
      if BtnSubmit.Enabled then
        BtnSubmit.Click;
    if key=VK_F3 then
      DBGrid1.OnEditButtonClick(nil);
  end;
end;

procedure TFormSal05.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
{*************************************************************************
TO DO:在DBGrid中畫多選框
*************************************************************************}
const
  CtrlState:array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  flag:boolean;
  a:string;
begin
  if Column.Index = 0 then
  begin
    a:=ADOQuery1.FieldByName('valid_date').AsString;
    if (ADOQuery1.FieldByName('valid_date').AsString<>'') then
      flag:= true
    else
      flag:=false;
    DrawFrameControl(DBGrid1.Canvas.Handle,Rect,DFC_BUTTON,CtrlState[FLAG]);
  end;
end;

procedure TFormSal05.DBGrid1CellClick(Column: TColumn);
var
  valid_date:string;
const
  CtrlState:array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  valid_date:=FormatDateTime('yyyy/mm/dd',GetServerDateTime);
  if Column.Index = 0 then
  begin
    with ADOQuery1 do
      begin
        edit;
        FieldByName('valid_flag').AsBoolean:= not FieldByName('valid_flag').AsBoolean;
        if FieldByName('valid_date').AsString='' then
          FieldByName('valid_date').AsString:=valid_date
        else
          FieldByName('valid_date').AsString:='';
        Post;  
      end;    
  end;
end;

procedure TFormSal05.BtnChooseAllClick(Sender: TObject);
{*************************************************************************
TO DO:全選/全不選
*************************************************************************}
var
  valid_date:string;
begin
  valid_date:=FormatDateTime('yyyy/mm/dd',GetServerDateTime);
  with ADOQuery1 do
    begin
      first;
      while not EOF do
        begin
          edit;
          if TTntBitBtn(Sender).name='BtnChooseAll' then
            FieldByName('valid_date').AsString:=valid_date
          else
            FieldByName('valid_date').AsString:='';
          next;
        end;
    end;
end;

procedure TFormSal05.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
  DBGrid1.Enabled:=true;
end;

procedure TFormSal05.ADOQuery1AfterClose(DataSet: TDataSet);
begin
  DBGrid1.Enabled:=false;
end;

procedure TFormSal05.BtnPrintClick(Sender: TObject);
begin
  showPrint(ADOQuery1,'員工工種補貼確認列印');
end;

procedure TFormSal05.chkunvalidateClick(Sender: TObject);
begin
  Edit_Dept_code.Enabled := not chkunvalidate.Checked;
end;

end.
