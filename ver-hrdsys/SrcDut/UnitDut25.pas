{*************************************************************************
Name：Dut22
Author: anil
Create date:2005-09-06
Modify date:2005-09-08
Commentate:員工加班明細表
*************************************************************************}
unit UnitDut25;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils,math;

type
  TFormDut25 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Panel5: TPanel;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    TntGroupBox1: TTntGroupBox;
    Panel2: TPanel;
    BtnQuery: TTntButton;
    BtnPrint: TTntBitBtn;
    EditBegin: TTntEdit;
    EditEnd: TTntEdit;
    TntLabel2: TTntLabel;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1seg_code: TStringField;
    ADOQuery1clas_code: TStringField;
    ADOQuery1s_start: TStringField;
    ADOQuery1s_end: TStringField;
    ADOQuery1start_b: TStringField;
    ADOQuery1start_e: TStringField;
    ADOQuery1end_b: TStringField;
    ADOQuery1end_e: TStringField;
    ADOQuery1clas_name: TWideStringField;
    btnEdit: TTntButton;
    BtnSave: TTntButton;
    btndel: TTntButton;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure GetDayEmp();
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure btnEditClick(Sender: TObject);
    procedure btndelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut25: TFormDut25;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  emp_id:string;
  wrk_date:Tdatetime;
{$R *.dfm}

procedure TFormDut25.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'dut25');
  InitForm;// Init Form
end;

procedure TFormDut25.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='vietnam_chingluh_company,dut25_titl,date,fld_year,fld_smonth,fld_day,'
   +'not_find_data,total,current_location,print_finish,just_doing_empid,finish';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormDut25.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
if ( pri_arr[DEL])  then
    btnDel.Enabled := true
 else
   btnDel.Enabled := false;
 if pri_arr[UPD] = true then
    //  btnSave.Enabled := true ;
      btnEdit.Enabled := true
 else
   btnEdit.Enabled := false ;
end;

procedure TFormDut25.GetDayEmp();
var
  TableName,sql_str:string;
begin
  TableName:='hrd_dut_day';//+formatdatetime('yymmdd',wrk_date);
  sql_str:='select * from '+TableName+' as A,hrd_dut_class as B where '
    +' A.clas_code=B.clas_code and A.emp_id ='''+emp_id+''''
    +' and A.wrk_date='''+FormatDatetime('yyyy/mm/dd',wrk_date)+''''
    +' and (A.real_start='''' or A.real_start is null or A.real_end='''' or A.real_end is null)';
  with DMHrdsys.SQLQuery4 do
  begin//在日檔中查找對應的工號
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    while not EOF do
    begin
      next;
    end;
  end;

end;

procedure TFormDut25.BtnPrintClick(Sender: TObject);
//打印內容設置
var
prt_title,datefmt,flds:widestring;
begin
  datefmt:=IntToStr(YearOf(wrk_date))+GetLangName(LangC,'fld_year')+'('+GetLangName(LangV,'fld_year')+')'
    +IntToStr(MonthOf(wrk_date))+GetLangName(LangC,'fld_smonth')+'('+GetLangName(LangV,'fld_smonth')+')'
    +IntToStr(DayOf(wrk_date))+GetLangName(LangC,'fld_day')+'('+GetLangName(LangV,'fld_day')+')';
  prt_title:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
      +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
      +GetLangName(LangC,'dut25_titl')+'<br>'
      +GetLangName(LangV,'dut25_titl')+'<br>';
      //+'<left>'+GetLangName(LangC,'date')+'('+GetLangName(LangV,'date')+'):'+datefmt;
  //flds:='department,spc_id,emp_id,emp_chs,name_vim,clas_chs,seg_code,s_start,s_end,real_start,real_end,early,late,left_time';
  //showPrint(ADOQuery2,prt_title,'',flds);
  showPrint(ADOQuery1,prt_title);
end;

procedure TFormDut25.BtnQueryClick(Sender: TObject);
var
  sql_str,dut_mon:string;
begin
  sql_str:='select * from hrd_dut_seg A where 1=1 ';
  if EditBegin.Text<>'' then
    sql_str:=sql_str+' and A.seg_code>=''' +Trim(EditBegin.Text)+'''';
  if EditEnd.Text<>'' then
    sql_str:=sql_str+' and A.seg_code<=''' +Trim(EditEnd.Text)+'''';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  //SetPrintDataset;
  BtnPrint.Enabled:=true;
end;

procedure TFormDut25.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormDut25.ADOQuery1CalcFields(DataSet: TDataSet);
var
  sql_str,key,clas_name:string;
  Flds:TFields;
  left_time:double;
  std_start,std_end:TDatetime;
begin
  key:=Dataset.FieldByName('clas_code').AsString;
  sql_str:='select * from hrd_dut_class where clas_code='''+key+'''';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      clas_name:=FieldByName('clas_chs').AsString;
  end;
  with DataSet do
  begin
    FieldByName('clas_name').AsString:=clas_name;
  end;
end;

procedure TFormDut25.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
with ADOQuery1 do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

procedure TFormDut25.btnEditClick(Sender: TObject);
var
  sql_str,dut_mon:string;
begin
  DBGrid1.ReadOnly := false;
  sql_str:='select * from hrd_dut_seg A where 1=1 ';
  if EditBegin.Text<>'' then
    sql_str:=sql_str+' and A.seg_code>=''' +Trim(EditBegin.Text)+'''';
  if EditEnd.Text<>'' then
    sql_str:=sql_str+' and A.seg_code<=''' +Trim(EditEnd.Text)+'''';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  //SetPrintDataset;
 //// BtnPrint.Enabled:=false;
  BtnSave.Enabled:=true;
  Btndel.Enabled:=true;

end;

procedure TFormDut25.btndelClick(Sender: TObject);
begin
     AdoQuery1.Delete ;
  showmessage('Delete  OK !! ') ;
end;

procedure TFormDut25.BtnSaveClick(Sender: TObject);
begin
    adoQuery1.UpdateBatch();
   showmessage('Save OK !! ') ;
   btnSave.Enabled := false ;
end;

end.
