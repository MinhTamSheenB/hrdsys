{*************************************************************************
Name：CosSal01
Author: anil
Create date:2005-09-05
Modify date:2005-09-06
Commentate:員工未領薪資維護
*************************************************************************}
unit UnitCosSal01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt,DateUtils,
  DBClient, Provider;

type
  TFormCosSal01 = class(TForm)
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
    BtnChooseAll: TTntBitBtn;
    BtnChooseNone: TTntBitBtn;
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
    PanelSts1: TPanel;
    Label_dept: TTntLabel;
    Edit_Dept_code: TTntComboBox;
    PanelSts2: TPanel;
    TntLabel3: TTntLabel;
    Edit_User: TTntEdit;
    PanelSts3: TPanel;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    Edit_Dept_code2: TTntComboBox;
    Edit_empid: TTntEdit;
    RbSts3: TTntRadioButton;
    RbSts2: TTntRadioButton;
    RbSts1: TTntRadioButton;
    BtnCancel: TTntSpeedButton;
    BtnSubmit: TTntSpeedButton;
    RbSts4: TTntRadioButton;
    Label_month: TTntLabel;
    edit_month: TMaskEdit;
    TntLabel4: TTntLabel;
    edit_month2: TMaskEdit;
    TntStaticText2: TTntStaticText;
    TntBitBtn1: TTntBitBtn;
    BtnLeEmp: TTntBitBtn;
    RbSts5: TTntRadioButton;
    PanelSts5: TPanel;
    Edit_Month5: TMaskEdit;
    TntLabel5: TTntLabel;
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
  FormCosSal01: TFormCosSal01;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  pre_sts,this_sts,MoneyType:string;
  SpcPri1,SpcPri2,SpcPri3,SpcPri4,SpcPri5,SpcPri9:boolean;
{$R *.dfm}

procedure TFormCosSal01.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(username,'cossal01');
  SpcPri1:=HaveSpcPrv(username,'cossal01');//收回權限
  SpcPri2:=HaveSpcPrv(username,'cossal01A');//收回確認權限
  SpcPri3:=HaveSpcPrv(username,'cossal01B');//發放權限
  SpcPri4:=HaveSpcPrv(username,'cossal01C');//發放確認權限
  SpcPri5:=HaveSpcPrv(username,'cossal01D');//結轉收入權限
  SpcPri9:=HaveSpcPrv(username,'cossal01Z');//收回可修改特別權限
  InitLang;// Init language
  InitForm;// Init Form
end;

procedure TFormCosSal01.InitLang;
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
  +'cossal01_status4,msg_input_dept,msg_cannot_modify_dept,msg_leftemp_imported,';
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

procedure TFormCosSal01.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str,fld_name:string;
begin
  MoneyType:='1';//類別為1-薪資
  edit_month.Text:= formatdatetime('yyyymm',date-30);
  edit_month2.Text:= formatdatetime('yyyymm',date-30);
  edit_month5.Text:= formatdatetime('yyyymm',date-110);
  {if userLang='E' then
    fld_name:='dept_code+'' ''+eng_abbr'
  else if userLang='V' then
    fld_name:='dept_code+'' ''+vim_abbr'
  else}
  fld_name:='dept_code+'' ''+abbr_titl';
  sql_str:='select '+fld_name+' as dept_name,dept_code from hrd_dept where is_del=''0''';
  {if not SpcPri9 then//沒有修改已收回部門的權限
    sql_str:=sql_str+' and dept_code not in (select dept_code from cos_sal_no_put'
      +' where sal_mon='''+edit_month.Text+''')'; }
  sql_str:=sql_str+' order by dept_code';
  SetComboxList(sql_str,edit_Dept_code);
  SetComboxList(sql_str,edit_Dept_code2);
  if SpcPri5 then//有結轉收入權限
  begin
    RbSts5.Checked:=true;
    RbSts5.Enabled:=true;
  end;
  if SpcPri4 then//有發放確認權限
  begin
    RbSts4.Checked:=true;
    RbSts4.Enabled:=true;
  end;
  if SpcPri3 then//有發放權限
  begin
    RbSts3.Checked:=true;
    RbSts3.Enabled:=true;
  end;
  if SpcPri2 then//有收回確認權限
  begin
    RbSts2.Checked:=true;
    RbSts2.Enabled:=true;
  end;
  if SpcPri1 then//有收回權限
  begin                  
    RbSts1.Checked:=true;
    RbSts1.Enabled:=true;
  end;
end;

procedure TFormCosSal01.BtnQueryClick(Sender: TObject);
var
  sql_str,upd_date,DateStr:string;
  ADate:TDateTime;
begin
Edit_tot.Text:='';
upd_date:=FormatDateTime('yyyy/mm/dd hh:nn:ss',GetServerDateTime);
if RbSts1.Checked then
begin//收回 status='1'
  if trim(Edit_Dept_code.Text)='' then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_input_dept'));
    exit;
  end;
  {if not SpcPri5 then
  begin //沒有修改部門權限時檢查部門
    sql_str:='select * from cos_sal_no_put where sal_mon='''+edit_month.Text+''''
      +' and dept_code='''+LeftStr(Edit_Dept_code.Text,6)+''' ';
    if CheckRecordExist(sql_str) then
    begin
      WideShowMessage(GetLangName(LangStr,'msg_cannot_modify_dept'));
      exit;
    end;
  end;}
  pre_sts:='0';
  this_sts:='1';
  ADate:=EnCodeDate(StrToInt(LeftStr(edit_month.Text,4)),StrToInt(RightStr(edit_month.Text,2)),1);
  ADate:=EndOfTheMonth(ADate);
  DateStr:=FormatDateTime('yyyy/mm/dd',ADate);
  sql_str:='insert into cos_sal_no_put(upd_user,upd_date,type,sal_mon,'
   +' dept_code,emp_id,name_vim,info_code,full_salary,status) '
   +' select '''+username+''','''+upd_date+''','''+MoneyType+''',A.pay_mon,'
   +' A.dept_code,A.emp_id,B.name_vim,A.info_code,A.full_sal,'''+pre_sts+''' '
//  +' from hrd_sal_paymt A,hrd_sal_currency B'
   +' from hrd_sal_currency A,hrd_emp B'
//  +' where A.pay_mon=B.pay_mon and A.emp_id=B.emp_id and A.pay_mon='''+edit_month.Text+''''
   +' where A.emp_id=B.emp_id and A.info_code=''0''  and A.pay_mon='''+edit_month.Text+''''
   +' and A.dept_code='''+LeftStr(Edit_Dept_code.Text,6)+''' and A.salary>0'
//   +' and A.emp_id in (select emp_id from hrd_emp where '
//    +' dept_code='''+LeftStr(trim(Edit_Dept_code.Text),6)+''''
//   +' (epledt is null or epledt>'''+DateStr+'''))'
   +' and A.emp_id not in (select emp_id from cos_sal_no_put where'
   +' type='''+MoneyType+''' and sal_mon='''+edit_month.Text+''')';
  with DMHrdSys.ADOCommand1 do
  begin
    CommandText:=sql_str;
    Execute;
  end;
  sql_str:='select * from cos_sal_no_put where type='''+MoneyType+''' and'
    +' sal_mon='''+edit_month.Text+''' and status='''+pre_sts+''''
    +' and dept_code='''+LeftStr(trim(Edit_Dept_code.Text),6)+''''
    +' and emp_id in (select emp_id from hrd_emp where '
//    +' dept_code='''+LeftStr(trim(Edit_Dept_code.Text),6)+''''
    +' (epledt is null or epledt>'''+DateStr+'''))';
end
else if RbSts2.Checked then//收回確認 status='2'
begin
  pre_sts:='1';
  this_sts:='2';
  sql_str:='select * from cos_sal_no_put where  type='''+MoneyType+''' and'
    +' sal_mon='''+edit_month2.Text+''' and status='''+pre_sts+'''';
  if Edit_User.Text<>'' then
    sql_str:=sql_str+' and upd_user='''+trim(Edit_User.Text)+'''';
end
else if RbSts3.Checked then//發放 status='3'
begin
  pre_sts:='2';
  this_sts:='3';
  sql_str:='select * from cos_sal_no_put where type='''+MoneyType+''' and status='''+pre_sts+'''';
    //+' and sal_mon='''+edit_month.Text+''' ';
  if Edit_Dept_code2.Text<>'' then
    sql_str:=sql_str+' and dept_code='''+LeftStr(trim(Edit_Dept_code2.Text),6)+'''';
  if Edit_empid.Text<>'' then
    sql_str:=sql_str+' and emp_id='''+trim(Edit_empid.Text)+'''';
end
else if RbSts4.Checked then//發放確認 status='4'
begin
  pre_sts:='3';
  this_sts:='4';
  sql_str:='select * from cos_sal_no_put where type='''+MoneyType+''' and status='''+pre_sts+'''';
    //+' and sal_mon='''+edit_month.Text+''' ';
  if Edit_Dept_code2.Text<>'' then
    sql_str:=sql_str+' and dept_code='''+LeftStr(trim(Edit_Dept_code2.Text),6)+'''';
  if Edit_empid.Text<>'' then
    sql_str:=sql_str+' and emp_id='''+trim(Edit_empid.Text)+'''';
end
else if RbSts5.Checked then//結轉確認 status='9'
begin
  pre_sts:='2';
  this_sts:='9';
  sql_str:='select * from cos_sal_no_put where type='''+MoneyType+''' and status='''+pre_sts+''''
    +' and sal_mon='''+edit_month5.Text+''' ';
end;
with ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  //EditTot.Text:=ClientDataSet1.FieldByName('tot_money').AsString;
//if this_sts='9' then//結轉確認 status='9'
//   BtnChooseAll.Click;
//BtnPrint.Enabled:=true;
BtnChooseAll.Enabled:=true;
BtnChooseNone.Enabled:=true;
end;

procedure TFormCosSal01.BtnSubmitClick(Sender: TObject);
var
  sql_str:string;
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  if this_sts='9' then//結轉確認 status='9'
  begin
  sql_str:='update cos_sal_no_put set status='''+this_sts+''' where type='''+MoneyType+''''
    +' and status='''+pre_sts+''' and sal_mon='''+edit_month5.Text+''' ';
  with DMHrdSys.ADOCommand1 do
  begin
    CommandText:=sql_str;
    Execute;
  end;
  end
  else
    ADOQuery1.UpdateBatch;
  BtnCancel.Enabled:=false;
  BtnSubmit.Enabled:=false;
end;

procedure TFormCosSal01.BtnCancelClick(Sender: TObject);
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  ADOQuery1.CancelBatch;
  BtnCancel.Enabled:=false;
  BtnSubmit.Enabled:=false;
end;

procedure TFormCosSal01.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormCosSal01.ADOQuery1BeforePost(DataSet: TDataSet);
{*************************************************************************
TO DO:移動前錯誤檢查,改變一些欄位值及狀態
*************************************************************************}
var
  up_date:TDatetime;
begin
  up_date:=GetServerDateTime;
  with ADOQuery1 do
  begin
    FieldByName('upd_user').Value:=username;
    FieldByName('upd_date').Value:=up_date;
    if FieldByName('status').AsString=this_sts then
    begin
      FieldByName('user_sts'+this_sts).AsString:=username;
      FieldByName('date_sts'+this_sts).Value:=up_date;
    end
    else
    begin
      FieldByName('user_sts'+this_sts).AsString:='';
      FieldByName('date_sts'+this_sts).AsString:='';
    end;
    BtnCancel.Enabled:=true;
    BtnSubmit.Enabled:=true;
  end;
end;

procedure TFormCosSal01.ADOQuery1AfterScroll(DataSet: TDataSet);
{*************************************************************************
TO DO:移動記錄時在狀態欄顯示提示信息
*************************************************************************}
begin
with ADOQuery1 do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

procedure TFormCosSal01.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFormCosSal01.DBGrid1DrawColumnCell(Sender: TObject;
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
    a:=ADOQuery1.FieldByName('status').AsString;
    if (ADOQuery1.FieldByName('status').AsString<>pre_sts) then
      flag:= true
    else
      flag:=false;
    DrawFrameControl(DBGrid1.Canvas.Handle,Rect,DFC_BUTTON,CtrlState[FLAG]);
  end;
end;

procedure TFormCosSal01.DBGrid1CellClick(Column: TColumn);
var
  valid_date:string;
const
  CtrlState:array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  if Column.Index = 0 then
  begin
    with ADOQuery1 do
      begin
        edit;
        if FieldByName('status').AsString= pre_sts then
        begin
          FieldByName('status').AsString:= this_sts;//IntToStr(StrToInt(pre_sts)+1);
          //FieldByName('upd_user').AsString:= username;
        end
        else if FieldByName('status').AsString=this_sts then //IntToStr(StrToInt(pre_sts)+1) then
          FieldByName('status').AsString:= pre_sts;
        Post;  
      end;    
  end;
end;

procedure TFormCosSal01.BtnChooseAllClick(Sender: TObject);
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
          begin
            if FieldByName('status').AsString=pre_sts then
            begin
              FieldByName('status').AsString:= this_sts;//IntToStr(StrToInt(pre_sts)+1);
              FieldByName('upd_user').AsString:= username;
            end;
          end
          else if FieldByName('status').AsString=this_sts then//IntToStr(StrToInt(pre_sts)+1) then
            FieldByName('status').AsString:= pre_sts;
          next;
        end;
    end;
end;

procedure TFormCosSal01.ADOQuery1AfterOpen(DataSet: TDataSet);
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

procedure TFormCosSal01.ADOQuery1AfterClose(DataSet: TDataSet);
begin
  DBGrid1.Enabled:=false;
end;

procedure TFormCosSal01.BtnPrintClick(Sender: TObject);
begin
  showPrint(ADOQuery1,'員工工種補貼確認列印');
end;

procedure TFormCosSal01.ADOQuery1CalcFields(DataSet: TDataSet);
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

procedure TFormCosSal01.RbSts1Click(Sender: TObject);
var
  CntName:string;
  Acnt:Tcomponent;
begin
  PanelSts1.Visible:=false;
  PanelSts2.Visible:=false;
  PanelSts3.Visible:=false;
  PanelSts5.Visible:=false;
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
  if CntName='PanelSts2' then
    BtnLeEmp.Enabled:=true
  else
    BtnLeEmp.Enabled:=false;
  BtnQuery.Enabled:=true;
end;

procedure TFormCosSal01.BtnLeEmpClick(Sender: TObject);
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
    +' from hrd_sal_currency A,hrd_emp B '
    +' where A.emp_id=B.emp_id'
    +' and A.salary>0 and A.info_code<>''0'' and A.pay_mon='''+edit_month2.Text+'''';
    //+' and B.epledt<='''+DateStr+''' ';
  with DMHrdSys.ADOCommand1 do
  begin
    CommandText:=sql_str;
    try
      Execute;
      WideShowMessage(GetLangName(langStr,'success'));
    except
      WideShowMessage(GetLangName(langStr,'msg_leftemp_imported'));
    end;
  end;
end;

procedure TFormCosSal01.ADOQuery1full_salaryGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  //Text :=formatfloat(',0',Sender.DataSet.fieldbyname(TField(Sender).FieldName).Asfloat);
  Text :=formatfloat(',0',Sender.Asfloat);
end;

procedure TFormCosSal01.ADOQuery1info_codeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if (Sender.AsString='2') or (Sender.AsString='6') then
    Text:='離職'
  else
    Text:='在職';
end;

procedure TFormCosSal01.ADOQuery1statusGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:=GetLangName(LangStr,'cossal01_status'+Sender.AsString);
end;

end.
