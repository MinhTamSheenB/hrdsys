{*************************************************************************
Name：CosSal03
Author: anil
Create date:2005-09-05
Modify date:2005-09-06
Commentate:離職補助金發放
*************************************************************************}
unit UnitCosSal05;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt,DateUtils,
  DBClient, Provider;

type
  TFormCosSal05 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelPre: TPanel;
    GrpBoxQuery: TTntGroupBox;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    PanelMain: TPanel;
    BtnQuery: TTntBitBtn;
    DataSource1: TDataSource;
    PanelQuery: TTntPanel;
    PanelTail: TTntPanel;
    ADOQuery1: TADOQuery;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1sal_mon: TStringField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1full_salary: TFloatField;
    ADOQuery1status: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1name_vim: TWideStringField;
    PanelInput: TPanel;
    RbSts3: TTntRadioButton;
    RbSts2: TTntRadioButton;
    RbSts1: TTntRadioButton;
    RbSts4: TTntRadioButton;
    RbSts5: TTntRadioButton;
    ADOQuery1info_code: TStringField;
    ADOQuery1user_sts1: TStringField;
    ADOQuery1date_sts1: TDateTimeField;
    ADOQuery1user_sts2: TStringField;
    ADOQuery1date_sts2: TDateTimeField;
    ADOQuery1user_sts3: TStringField;
    ADOQuery1date_sts3: TDateTimeField;
    ADOQuery1user_sts4: TStringField;
    ADOQuery1date_sts4: TDateTimeField;
    ADOQuery1user_sts9: TStringField;
    ADOQuery1date_sts9: TDateTimeField;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1upd_user: TStringField;
    ClientDataSet1upd_date: TDateTimeField;
    ClientDataSet1sal_mon: TStringField;
    ClientDataSet1dept_code: TStringField;
    ClientDataSet1emp_id: TStringField;
    ClientDataSet1emp_chs: TWideStringField;
    ClientDataSet1name_vim: TWideStringField;
    ClientDataSet1info_code: TStringField;
    ClientDataSet1full_salary: TFloatField;
    ClientDataSet1status: TStringField;
    ClientDataSet1user_sts1: TStringField;
    ClientDataSet1date_sts1: TDateTimeField;
    ClientDataSet1user_sts2: TStringField;
    ClientDataSet1date_sts2: TDateTimeField;
    ClientDataSet1user_sts3: TStringField;
    ClientDataSet1date_sts3: TDateTimeField;
    ClientDataSet1user_sts4: TStringField;
    ClientDataSet1date_sts4: TDateTimeField;
    ClientDataSet1user_sts9: TStringField;
    ClientDataSet1date_sts9: TDateTimeField;
    ClientDataSet1tot_money: TAggregateField;
    Edit_tot: TMaskEdit;
    TntLabel3: TTntLabel;
    Edit_User: TTntEdit;
    TntLabel4: TTntLabel;
    edit_month: TMaskEdit;
    BtnAll: TTntRadioButton;
    CobType: TTntComboBox;
    ADOQuery1type: TStringField;
    TntLabel1: TTntLabel;
    Dt_begin: TTntDateTimePicker;
    Dt_end: TTntDateTimePicker;
    BtnPrint: TTntBitBtn;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure BtnPrintClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure RbSts1Click(Sender: TObject);
    procedure BtnLeEmpClick(Sender: TObject);
    procedure ADOQuery1full_salaryGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQuery1info_codeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQuery1statusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCosSal05: TFormCosSal05;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  pre_sts,this_sts,MoneyType:string;
  SpcPri1,SpcPri2,SpcPri3,SpcPri4,SpcPri5,SpcPri9:boolean;
Const
  FORM_KEY = 'cossal05';
{$R *.dfm}

procedure TFormCosSal05.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(username,FORM_KEY);
  //SpcPri1:=HaveSpcPrv(username,FORM_KEY);//收回權限
  SpcPri2:=HaveSpcPrv(username,FORM_KEY+'A');//收回確認權限
  SpcPri3:=HaveSpcPrv(username,FORM_KEY+'B');//發放權限
  SpcPri4:=HaveSpcPrv(username,FORM_KEY+'C');//發放確認權限
  //SpcPri5:=HaveSpcPrv(username,FORM_KEY+'D');//結轉收入權限
  SpcPri9:=HaveSpcPrv(username,FORM_KEY+'Z');//收回可修改特別權限
  InitLang;// Init language
  InitForm;// Init Form
end;

procedure TFormCosSal05.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
  i:integer;
  GetCpt:TComponent;
begin
SetComponentLang(self);
with ADOquery1 do
  for i:=0 to Fieldcount-1 do                      
    keys:=keys+'fld_'+Fields[i].FieldName+',';
keys:=keys+'sal05_titl,date,month,fld_department,not_find_data,'
  +'query,print,update,save,cancel,search_condition,choose,'
  +'total,current_location,is_valid,choose_all,choose_none,success,'
  +'msg_confirm_save,msg_confirm_cancel,msg_save_modify_data,'
  +'cossal01_status0,cossal01_status1,cossal01_status2,cossal01_status3,'
  +'cossal01_status4,msg_input_dept,msg_cannot_modify_dept,msg_leftemp_add_imported,';
LangStr:=GetLangWideStrs(keys);
{PanelTitle.Caption:=GetLangName(LangStr,'sal05_titl');
TntGroupbox1.Caption:=GetLangName(LangStr,'search_condition');
Label_Dept.Caption:=GetLangName(LangStr,'fld_department');
Label_Month.Caption:=GetLangName(LangStr,'month');
BtnQuery.Caption:=GetLangName(LangStr,'query');
BtnPrint.Caption:=GetLangName(LangStr,'print');
BtnSubmit.Caption:=GetLangName(LangStr,'save');
BtnCancel.Caption:=GetLangName(LangStr,'cancel');
BtnChooseAll.Caption:=GetLangName(LangStr,'choose_all');
BtnChooseNone.Caption:=GetLangName(LangStr,'choose_none');}
with DBGrid1.Columns do// set Columns texts
  begin
    for i:=0 to Count-1 do
    begin
      GetCpt:=self.FindComponent('Label_'+Items[i].FieldName);
      if GetCpt<>nil then
        Ttntlabel(GetCpt).Caption:=GetLangName(LangStr,'fld_'+Items[i].FieldName);
      Items[i].Title.caption:=GetLangName(LangStr,'fld_'+Items[i].FieldName);
    end;
    Items[0].Title.caption:=GetLangName(LangStr,'choose');
  end;
end;

procedure TFormCosSal05.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str,fld_name:string;
begin
//  edit_month.Text:= formatdatetime('yyyymm',date-30);
  dt_begin.Date:= date-30;
  dt_end.Date:= date;
end;

procedure TFormCosSal05.BtnQueryClick(Sender: TObject);
var
  sql_str,upd_date,DateStr,fld_user,fld_date:string;
  ADate:TDateTime;
begin
BtnPrint.Enabled:=false;
Edit_tot.Text:='';
MoneyType:=LeftStr(CobType.Text,1);//類別
if RbSts1.Checked then
begin//收回 status='1'
  this_sts:='1';
  fld_user:='user_sts1';
  fld_date:='date_sts1';
end
else if RbSts2.Checked then//收回確認 status='2'
begin
  this_sts:='2';
  fld_user:='user_sts2';
  fld_date:='date_sts2';
end
else if RbSts3.Checked then//發放 status='3'
begin
  this_sts:='3';
  fld_user:='user_sts3';
  fld_date:='date_sts3';
end
else if RbSts4.Checked then//發放確認 status='4'
begin
  this_sts:='4';
  fld_user:='user_sts4';
  fld_date:='date_sts4';
end
else if RbSts5.Checked then//結轉確認 status='9'
begin
  this_sts:='9';
  fld_user:='user_sts9';
  fld_date:='date_sts9';
end;
if BtnAll.Checked then
begin//全部
  fld_user:='upd_user';
  fld_date:='upd_date';
end;
sql_str:='select '+fld_user+' as upd_user,'+fld_date+' as upd_date,'
  +'* from cos_sal_no_put where type='''+MoneyType+''''
  +' and '+fld_date+'>='''+FormatDateTime('yyyy/mm/dd',dt_begin.Date)+''''
  +' and '+fld_date+'<'''+FormatDateTime('yyyy/mm/dd',dt_end.Date+1)+'''';
if edit_month.Text<>'' then
  sql_str:=sql_str+' and sal_mon='''+trim(edit_month.Text)+'''';
if Edit_User.Text<>'' then
  sql_str:=sql_str+' and '+fld_user+'='''+trim(Edit_User.Text)+'''';
if BtnAll.Checked then//全部狀態
  sql_str:=sql_str+' and status>''0'''
else
  sql_str:=sql_str+' and status='''+this_sts+'''';
with ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
BtnPrint.Enabled:=true;
end;

procedure TFormCosSal05.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormCosSal05.ADOQuery1AfterScroll(DataSet: TDataSet);
{*************************************************************************
TO DO:移動記錄時在狀態欄顯示提示信息
*************************************************************************}
begin
with ADOQuery1 do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

procedure TFormCosSal05.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{*************************************************************************
TO DO:快捷鍵設置
*************************************************************************}
begin
  if Shift=[] then
  begin
    if key=VK_SPACE then //選中
    begin
      with ADOQuery1 do
      begin
        edit;
        if FieldByName('status').AsString= pre_sts then
        begin
          FieldByName('status').AsString:= this_sts;//IntToStr(StrToInt(pre_sts)+1);
        end
        else if FieldByName('status').AsString=this_sts then//IntToStr(StrToInt(pre_sts)+1) then
          FieldByName('status').AsString:= pre_sts;
        Post;  
      end;
    end;
  end;
end;

procedure TFormCosSal05.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
  if DataSet.Eof then
  begin
    SetStatusText(GetLangName(LangStr,'not_find_data'));
    Dataset.Close;
    exit;
  end;
  DBGrid1.DataSource:=nil;
  ClientDataSet1.Active:=false;
  ClientDataSet1.Active:=true;
  DBGrid1.DataSource:=DataSource1;
  DBGrid1.Enabled:=true;
  Edit_tot.Text:=ClientDataSet1.FieldByName('tot_money').AsString;
end;

procedure TFormCosSal05.ADOQuery1AfterClose(DataSet: TDataSet);
begin
  DBGrid1.Enabled:=false;
end;

procedure TFormCosSal05.BtnPrintClick(Sender: TObject);
var
  fld:string;
begin
  fld:='upd_user,Upd_date,sal_mon,emp_id,dept_code,name_vim,full_salary';
  ShowPrint(ADOQuery1,'','',fld);
end;

procedure TFormCosSal05.ADOQuery1CalcFields(DataSet: TDataSet);
var
  flds:Tfields;
  sqlstr,key:string;
begin
{  key:=DataSet.FieldByName('emp_id').AsString;
  sqlstr:='select * from hrd_emp where emp_id='''+key+'''';
  with DMSys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if not Eof then
      DataSet.FieldByName('name_vim').AsString:=FieldByName('name_vim').AsString;
  end;}
  {with DataSet do
  begin
    flds:=GetEmpInfo(FieldByName('emp_id').AsString);
    FieldByName('emp_chs').AsString:=flds.FieldByName('emp_chs').AsString;
    FieldByName('name_vim').AsString:=flds.FieldByName('name_vim').AsString;
  end;}
end;

procedure TFormCosSal05.RbSts1Click(Sender: TObject);
var
  CntName:string;
  Acnt:Tcomponent;
begin
//  PanelSts4.Visible:=false;
  CntName:='PanelSts'+RightStr(TtntRadioButton(Sender).Name,1);
  if CntName='PanelSts4' then
    CntName:='PanelSts3';
  Acnt:=self.FindComponent(CntName);
  if Acnt<>nil then
  begin
    TtntPanel(Acnt).Top:=17;
    TtntPanel(Acnt).Visible:=true;
  end;
  PanelInput.Height:=50;
  PanelPre.Height:=70;
  BtnQuery.Enabled:=true;
end;

procedure TFormCosSal05.BtnLeEmpClick(Sender: TObject);
var
  sql_str,DateStr:string;
  ADate:TDatetime;
begin
  //ADate:=EnCodeDate(StrToInt(LeftStr(edit_month.Text,4)),StrToInt(RightStr(edit_month.Text,2)),1);
  //ADate:=EndOfTheMonth(ADate);
//  DateStr:=FormatDateTime('yyyy/mm/dd',ADate);
  DateStr:=FormatDateTime('yyyy/mm/dd',GetServerDateTime);
  //upd_date:=FormatDateTime('yyyy/mm/dd hh:nn:ss',GetServerDateTime);
  sql_str:='insert into cos_sal_no_put(upd_user,upd_date,type,sal_mon,dept_code,'
    +' emp_id,name_vim,info_code,full_salary,status,user_sts2,date_sts2)'
    +' select '''+username+''',getdate(),'''+MoneyType+''',A.pay_mon,A.dept_code,A.emp_id,'
    +' B.name_vim,A.info_code,A.full_sal,''2'','''+username+''','''+DateStr+''''
    +' from hrd_sal_cur_leave A,hrd_emp B '
    +' where A.emp_id=B.emp_id'
    +' and A.salary>0 and A.info_code<>''0'' and A.pay_mon='''+edit_month.Text+'''';
    //+' and B.epledt<='''+DateStr+''' ';
  with DMHrdSys.ADOCommand1 do
  begin
    CommandText:=sql_str;
    try
      Execute;
      WideShowMessage(GetLangName(langStr,'success'));
    except
      WideShowMessage(GetLangName(langStr,'msg_leftemp_add_imported'));
    end;
  end;
end;

procedure TFormCosSal05.ADOQuery1full_salaryGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  //Text :=formatfloat(',0',Sender.DataSet.FieldByName(TField(Sender).FieldName).Asfloat);
  Text :=formatfloat(',0',Sender.Asfloat);
end;

procedure TFormCosSal05.ADOQuery1info_codeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if (Sender.AsString='2') or (Sender.AsString='6') then
    Text:='離職'
  else
    Text:='在職';
end;

procedure TFormCosSal05.ADOQuery1statusGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:=GetLangName(LangStr,'cossal01_status'+Sender.AsString);
end;

end.
