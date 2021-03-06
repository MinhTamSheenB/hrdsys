{*************************************************************************
Name：Hrd18
Author: anil
Create date:2005-09-06
Modify date:2005-09-08
Commentate:正式錄用員工
*************************************************************************}
unit UnitHrd18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils;

type
  TFormHrd18 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Panel5: TPanel;
    PanelGrid: TPanel;
    TntDBGrid1: TTntDBGrid;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    DTPickBegin: TTntDateTimePicker;
    DTPickEnd: TTntDateTimePicker;
    BtnQuery: TTntButton;
    TntLabel1: TTntLabel;
    ADOQuery1data_id: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1epid_no: TStringField;
    ADOQuery1epbirth: TDateTimeField;
    ADOQuery1epsexd: TStringField;
    ADOQuery1ifmarry: TStringField;
    ADOQuery1epAddrchs: TWideStringField;
    ADOQuery1tpAddrchs: TWideStringField;
    ADOQuery1edu_code: TStringField;
    ADOQuery1chs_status: TStringField;
    ADOQuery1eng_status: TStringField;
    ADOQuery1epid_date: TDateTimeField;
    ADOQuery1epid_area: TWideStringField;
    ADOQuery1name_eng: TWideStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1epAddrvim: TWideStringField;
    ADOQuery1epAddreng: TWideStringField;
    ADOQuery1tpAddrvim: TWideStringField;
    ADOQuery1tpAddreng: TWideStringField;
    ADOQuery1epid_vim: TWideStringField;
    ADOQuery1epid_eng: TWideStringField;
    ADOQuery1emp_phone: TStringField;
    ADOQuery1nation: TWideStringField;
    ADOQuery1country: TWideStringField;
    ADOQuery1work_year: TWideStringField;
    ADOQuery1hope_salary: TBCDField;
    ADOQuery1speciality: TWideStringField;
    ADOQuery1mail_date: TDateTimeField;
    ADOQuery1re_date: TDateTimeField;
    ADOQuery1matr_date: TDateTimeField;
    Panel2: TPanel;
    Panel3: TPanel;
    BtnSave: TTntBitBtn;
    TntGroupBox3: TTntGroupBox;
    TntLabel45: TTntLabel;
    TntLabel47: TTntLabel;
    TntLabel46: TTntLabel;
    TntLabel48: TTntLabel;
    TntLabel49: TTntLabel;
    sb_epledt: TTntSpeedButton;
    TntLabel11: TTntLabel;
    TntLabel12: TTntLabel;
    TntLabel13: TTntLabel;
    TntLabel15: TTntLabel;
    TntLabel16: TTntLabel;
    TntLabel50: TTntLabel;
    DBEditSpcId: TTntDBEdit;
    DTPickEpindt: TTntDateTimePicker;
    DBEditLedt: TTntDBEdit;
    TntDBEdit1: TTntDBEdit;
    CobInfo: TTntComboBox;
    CobDept: TTntComboBox;
    CobProf: TTntComboBox;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    TntLabel2: TTntLabel;
    TntDBEdit2: TTntDBEdit;
    TntLabel3: TTntLabel;
    TntDBEdit3: TTntDBEdit;
    //my define
    procedure InitLang;
    procedure InitForm;
    function CheckInputValid():boolean;
    //function getNewEmpId():string;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd18: TFormHrd18;
  
implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  n_late,n_early:integer;
  work_time,over_time,left_time,out_time,ab_time:double;
  emp_id,clas_chs,real_start,real_end,ab_code:string;
  wrk_date:Tdatetime;
{$R *.dfm}

procedure TFormHrd18.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'hrd18');
  InitForm;// Init Form
end;

procedure TFormHrd18.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='not_find_data,total,current_location,msg_must_same_month,'
  +'while_printing,print_finish,just_doing_empid,finish,'
  +'save_success,save_fail,with_star_cannot_empty,hrd08_dept_null,'
  +'hrd08_input_leftdate,hrd08_leftdate_must_null,hrd08_leftdate_great_indate,';
LangStr:=GetLangWideStrs(keys);
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormHrd18.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str:string;
begin
  DTPickBegin.Date:=date-2;
  DTPickEnd.Date:=date;
  sql_str:='select dept_code+'' ''+abbr_titl as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,CobDept);
  sql_str:='select info_code+'' ''+info_chs as info_name,info_code from hrd_inwork';
  SetComboxList(sql_str,CobInfo);
  sql_str:='select pst_code+'' ''+pst_chs as pst_name,pst_code from hrd_prof where pst_code>=''12''';
  SetComboxList(sql_str,CobProf);
end;

procedure TFormHrd18.BtnQueryClick(Sender: TObject);
var
  sqlstr:string;
begin
  sqlstr:='select * from hrd_person where 1=1 ';
  if EditEmpBegin.Text<>'' then
    sqlstr:=sqlstr+' and data_id>='''+trim(EditEmpBegin.Text)+'''';
  if EditEmpEnd.Text<>'' then
    sqlstr:=sqlstr+' and data_id<='''+trim(EditEmpEnd.Text)+'''';
  sqlstr:=sqlstr+' and mail_date>='''+FormatDateTime('yyyy/mm/dd',DTPickBegin.Date)+'''';
  sqlstr:=sqlstr+' and mail_date<='''+FormatDateTime('yyyy/mm/dd',DTPickEnd.Date)+'''';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
  end;
  if (pri_arr[ADD]) or (pri_arr[UPD]) then//有寫的權限
    BtnSave.Enabled:=true;
end;

procedure TFormHrd18.TntDBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormHrd18.ADOQuery1AfterScroll(DataSet: TDataSet);
//check when person's record scroll
var
  sql_str:string;
begin
  with DataSet do
    setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
  sql_str:='select * from hrd_emp where epid_no='''+DataSet.FieldByName('epid_no').AsString+'''';
  with ADOQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if Eof then
    begin
      Append;
      FieldByName('emp_chs').Value:=DataSet.FieldByName('emp_chs').Value;
      FieldByName('epid_no').AsString:=DataSet.FieldByName('epid_no').AsString;
      FieldByName('name_vim').Value:=DataSet.FieldByName('name_vim').Value;
      FieldByName('epbirth').AsString:=DataSet.FieldByName('epbirth').AsString;
      FieldByName('epsexd').AsString:=DataSet.FieldByName('epsexd').AsString;
      FieldByName('ifmarry').AsString:=DataSet.FieldByName('ifmarry').AsString;
      FieldByName('edu_code').AsString:=DataSet.FieldByName('edu_code').AsString;
      FieldByName('chs_status').AsString:=DataSet.FieldByName('chs_status').AsString;
      FieldByName('eng_status').AsString:=DataSet.FieldByName('eng_status').AsString;
      FieldByName('epid_date').AsString:=DataSet.FieldByName('epid_date').AsString;
      FieldByName('epid_area').Value:=DataSet.FieldByName('epid_area').Value;
      FieldByName('tpAddrVim').Value:=DataSet.FieldByName('tpAddrVim').Value;
      FieldByName('info_code').AsString:='0';
      Post;
    end;
    //SetComboxIndex(CobDept,FieldByName('dept_code').AsString);
    CobDept.Text:=FieldByName('dept_code').AsString;;
    SetComboxIndex(CobProf,FieldByName('pst_code').AsString);
    SetComboxIndex(CobInfo,FieldByName('info_code').AsString);
    if FieldByName('epindt').AsString<>'' then
      DTPickEpindt.Date:=FieldByName('epindt').AsDateTime;
  end;
end;

function TFormHrd18.CheckInputValid():boolean;
{*************************************************************************
TO DO:提交前檢查輸入的有效性
*************************************************************************}
begin
  if trim(CobDept.Text)='' then
    begin//部門代號
      WideMessageDlg(GetLangName(LangStr,'hrd08_dept_null'),mterror,[mbOK],0);
      CobDept.SetFocus;
      result:=false;
      exit;
    end;
  {if trim(DBEditSpcId.Text)='' then
    begin//識別卡號
      WideMessageDlg(GetLangName(LangStr,'hrd08_SpcId_null'),mterror,[mbOK],0);
      DBEditSpcId.SetFocus;
      result:=false;
      exit;
    end;}
{  if (DTPickEpindt.Date-DTPickepBirth.Date<5840) then
    begin//進廠未滿16周歲
      WideMessageDlg(GetLangName(LangStr,'hrd08_emp_age_erorr'),mterror,[mbOK],0);
      DTPickepBirth.SetFocus;
      result:=false;
      exit;
    end;}
{  if trim(CobFactory.Text)='' then
    begin//廠區
      WideMessageDlg(GetLangName(LangStr,'hrd08_factory_null'),mterror,[mbOK],0);
      CobFactory.SetFocus;
      result:=false;
      exit;
    end;}
  if ((leftstr(CobInfo.Text,1)='0') or (leftstr(CobInfo.Text,1)='B')) and (DBeditLedt.Text<>'') then
    begin//不能輸入離職日期
      WideMessageDlg(GetLangName(LangStr,'hrd08_leftdate_must_null'),mterror,[mbOK],0);
      DBeditLedt.SetFocus;
      result:=false;
      exit;
    end;
  if ((leftstr(CobInfo.Text,1)<>'0') and (leftstr(CobInfo.Text,1)<>'B')) and (DBeditLedt.Text='') then
    begin//請輸入離職日期
      WideMessageDlg(GetLangName(LangStr,'hrd08_input_leftdate'),mterror,[mbOK],0);
      DBeditLedt.SetFocus;
      result:=false;
      exit;
    end;
  if (DBeditLedt.Text<>'') and (strtodatetime(DBeditLedt.Text)<DTPickepInDt.Date) then
    begin//離職日期需大於進廠日期
      WideMessageDlg(GetLangName(LangStr,'hrd08_leftdate_great_indate'),mterror,[mbOK],0);
      DBeditLedt.SetFocus;
      result:=false;
      exit;
    end;
  result:=true;
end;

{function TFormHrd18.getNewEmpId():string;
//get new emp_id
var
  emp_no:integer;
  temp_str,emp_str,date_str:string;
begin
  date_str:=FormatDateTime('yymmdd',GetServerDateTime);
  with DMHrdsys.SQLQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT MAX(emp_id) as emp_id FROM hrd_emp ');
    open;
    if not Eof then
    begin
      temp_str:=FieldByName('emp_id').AsString;
      if temp_str='' then
        temp_str:='060000';
      emp_no:=StrToInt(temp_str);
    end
    else
      emp_no:=60000;
    emp_no := emp_no + 1;
    emp_str := Format('%.6d', [emp_no]);
  end;
result:=emp_str;
end;
}
procedure TFormHrd18.BtnSaveClick(Sender: TObject);
//save data
var
  up_date:TDateTime;
begin
  if not CheckInputValid then
    exit;
  up_date:=GetServerDateTime;
  with ADOQuery2 do
  begin
    Edit;
    if FieldByName('emp_id').AsString='' then//產生工號
    begin
      FieldByName('emp_id').AsString:=GetNewEmpId;
      FieldByName('epindt').AsDateTime:=DateOf(DTPickEpindt.Date);//進廠日期不能修改
      ADOQuery1.Edit;
      ADOQuery1.FieldByName('upd_user').AsString:=userName;
      ADOQuery1.FieldByName('upd_date').AsDateTime:=up_date;
      ADOQuery1.FieldByName('matr_date').AsDateTime:=DateOf(up_date);
      ADOQuery1.Post;
    end;
    FieldByName('dept_code').AsString:=LeftStr(CobDept.Text,6);
    FieldByName('pst_code').AsString:=LeftStr(CobProf.Text,2);
    FieldByName('info_code').AsString:=LeftStr(CobInfo.Text,2);
    FieldByName('upd_user').AsString:=userName;
    FieldByName('upd_date').AsDateTime:=up_date;
    Post;
    try
      UpdateBatch;
      ADOQuery1.UpdateBatch;
      WideShowMessage(GetLangName(LangStr,'save_success'));
    except
      WideShowMessage(GetLangName(LangStr,'save_fail'));
    end;
  end;
end;

end.
