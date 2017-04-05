{*************************************************************************
Name：Med12
Author: anil
Create date:2005-10-25
Modify date:2005-10-25
Commentate:統計報表
*************************************************************************}
unit UnitMed12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,StrUtils, TntDB,DateUtils,
  DBClient;

type
  TFormMed12 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PageControl1: TTntPageControl;
    TabSheetSick: TTntTabSheet;
    TabSheetDept: TTntTabSheet;
    TabSheetDru: TTntTabSheet;
    PanelSick: TTntPanel;
    TntLabel11: TTntLabel;
    Btn_Search_Sick: TTntBitBtn;
    PanelUnit: TTntPanel;
    Btn_Search_Dept: TTntBitBtn;
    PanelUse: TTntPanel;
    Btn_Search_Dru: TTntBitBtn;
    MonthSick: TMaskEdit;
    TntLabel1: TTntLabel;
    MonthDept: TMaskEdit;
    Label_month: TTntLabel;
    DatePickerBegin: TTntDateTimePicker;
    DatePickerEnd: TTntDateTimePicker;
    ADOQuerySick2: TADOQuery;
    ADOQuerySick: TADOQuery;
    WideStringField1: TWideStringField;
    TntWideStringField1: TTntWideStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    IntegerField21: TIntegerField;
    IntegerField22: TIntegerField;
    IntegerField23: TIntegerField;
    IntegerField24: TIntegerField;
    IntegerField25: TIntegerField;
    IntegerField26: TIntegerField;
    IntegerField27: TIntegerField;
    IntegerField28: TIntegerField;
    IntegerField29: TIntegerField;
    IntegerField30: TIntegerField;
    IntegerField31: TIntegerField;
    IntegerField32: TIntegerField;
    ADOQueryDept: TADOQuery;
    TntWideStringField2: TTntWideStringField;
    IntegerField33: TIntegerField;
    IntegerField34: TIntegerField;
    IntegerField35: TIntegerField;
    IntegerField36: TIntegerField;
    IntegerField37: TIntegerField;
    IntegerField38: TIntegerField;
    IntegerField39: TIntegerField;
    IntegerField40: TIntegerField;
    IntegerField41: TIntegerField;
    IntegerField42: TIntegerField;
    IntegerField43: TIntegerField;
    IntegerField44: TIntegerField;
    IntegerField45: TIntegerField;
    IntegerField46: TIntegerField;
    IntegerField47: TIntegerField;
    IntegerField48: TIntegerField;
    IntegerField49: TIntegerField;
    IntegerField50: TIntegerField;
    IntegerField51: TIntegerField;
    IntegerField52: TIntegerField;
    IntegerField53: TIntegerField;
    IntegerField54: TIntegerField;
    IntegerField55: TIntegerField;
    IntegerField56: TIntegerField;
    IntegerField57: TIntegerField;
    IntegerField58: TIntegerField;
    IntegerField59: TIntegerField;
    IntegerField60: TIntegerField;
    IntegerField61: TIntegerField;
    IntegerField62: TIntegerField;
    IntegerField63: TIntegerField;
    IntegerField64: TIntegerField;
    ADOQueryDru: TADOQuery;
    ADOQueryDeptdept_code: TStringField;
    ADOQueryDept2: TADOQuery;
    ADOQueryDru2: TADOQuery;
    ADOQueryDrudept_dru_qty: TFloatField;
    ADOQuerynormal_dru_qty: TFloatField;
    ADOQueryDrudept_cate_name: TWideStringField;
    ADOQueryDrudept_cate_code: TStringField;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    Panel2: TPanel;
    DBGrid2: TTntDBGrid;
    Panel3: TPanel;
    DBGrid3: TTntDBGrid;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADOQuerySicktotal: TIntegerField;
    BtnPrintSick: TTntBitBtn;
    BtnPrintDept: TTntBitBtn;
    BtnPrintDru: TTntBitBtn;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure Btn_Search_DruClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ADOQueryDruCalcFields(DataSet: TDataSet);
    procedure Btn_Search_SickClick(Sender: TObject);
    procedure ADOQuerySickCalcFields(DataSet: TDataSet);
    procedure Btn_Search_DeptClick(Sender: TObject);
    procedure ADOQueryDeptCalcFields(DataSet: TDataSet);
    procedure BtnPrintSickClick(Sender: TObject);
    procedure BtnPrintDeptClick(Sender: TObject);
    procedure BtnPrintDruClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMed12: TFormMed12;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  page_key,Month:string;//活動頁標誌字符串
  MonthADate:TDatetime;
{$R *.dfm}

procedure TFormMed12.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
  i:integer;
begin
SetComponentLang(self);//set component language text
keys:=keys+'vietnam_chingluh_company,not_find_data,total,current_location,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
  +'error_date,error_empid,error_hour,error_input_hour,date_range,'
  +'med12_bysick_prt,med12_bydept_prt,med12_bydru_prt,';
LangC:=GetLangWideStrs(keys,'C');
LangV:=GetLangWideStrs(keys,'V');
LangE:=GetLangWideStrs(keys,'E');
LangStr:=GetLangWideStrs(keys);
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;

procedure TFormMed12.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  MonthSick.Text:=FormatDatetime('yyyymm',date);
  MonthDept.Text:=FormatDatetime('yyyymm',date);
  DatePickerBegin.Date:=StartOfTheMonth(date);
  DatePickerEnd.Date:=EndOfTheMonth(date);
  PageControl1.ActivePage:=TabSheetDru;
  PageControl1Change(TabSheetDru);
end;

procedure TFormMed12.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'med12');//Get privilege
  InitForm;// Init Form
end;

procedure TFormMed12.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示,及改變編輯區一些欄位
begin
with DataSet do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

procedure TFormMed12.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormMed12.PageControl1Change(Sender: TObject);
var
  tmpstr:string;
//頁面切換后
begin
  tmpstr:=PageControl1.ActivePage.Name;
  delete(tmpstr,1,8);
  page_key:=tmpstr;//當前活動頁關鍵字
  //if not ADOQuery1.Active then
  //  ADOQuery1.Active:=true;
  //SetActiveFlds;//設置欄位
end;

procedure TFormMed12.Btn_Search_SickClick(Sender: TObject);
var
  sql_str:string;
begin
  month:=MonthSick.Text;
  if not TryEncodeDate(StrToInt(LeftStr(month,4)),StrToInt(MidStr(month,5,2)),01,monthAdate) then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_error_month'));
    exit;
  end;
  //按sick_code分組
  sql_str:='select sick_code,med_date,count(*) as num from hrd_med_mast'
    +' where Month(med_date)='+IntToStr(MonthOf(MonthADate))
    +' group by sick_code,med_date order by sick_code,med_date';
  with ADOQuerySick2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  sql_str:='select sick_code,count(*) as total from hrd_med_mast'
    +' where Month(med_date)='+IntToStr(MonthOf(MonthADate))
    +' and Year(med_date)='+IntToStr(YearOf(MonthADate))
    +' group by sick_code order by sick_code';
  with ADOQuerySick do
  begin
    Close;
    sql.Clear;
    sql.Add(sql_str);
    Open;
  end;
  BtnPrintSick.Enabled:=true;
end;

procedure TFormMed12.ADOQuerySickCalcFields(DataSet: TDataSet);
var
  i,days,num:integer;
  sick_code:string;
  med_date:TDatetime;
begin
  sick_code:=Dataset.FieldByName('sick_code').AsString;
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_med_sick where sick_code='''+sick_code+'''');
    open;
    if not Eof then
      Dataset.FieldByName('sick_name').AsString:=FieldByName('sick_name').AsString;
  end;
  for i:=1 to 31 do
  begin
    med_date:=MonthADate+i-1;
    days:=dayof(med_date);
    with ADOQuerySick2 do
    begin
      if Locate('sick_code;med_date',VarArrayOf([sick_code,med_date]),[loCaseInsensitive]) then
        num:=FieldByName('num').AsInteger
      else
        num:=0;
    end;
    Dataset.FieldByName(IntToStr(i)).AsInteger:=num;
  end;
end;

procedure TFormMed12.Btn_Search_DeptClick(Sender: TObject);
var
  sql_str:string;
begin
  month:=MonthDept.Text;
  if not TryEncodeDate(StrToInt(LeftStr(month,4)),StrToInt(MidStr(month,5,2)),01,monthAdate) then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_error_month'));
    exit;
  end;
  //按dept_code分組
  sql_str:='select dept_code,med_date,count(*) as num from hrd_med_mast as A,'
    +' hrd_emp as B where A.emp_id=B.emp_id '
    +' and Month(med_date)='+IntToStr(MonthOf(MonthADate))
    +' group by dept_code,med_date order by dept_code,med_date';
  with ADOQueryDept2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  sql_str:='select dept_code,count(*) as total from hrd_med_mast as A,'
    +'hrd_emp as B where A.emp_id=B.emp_id '
    +' and Month(med_date)='+IntToStr(MonthOf(MonthADate))
    +' group by dept_code,med_date order by dept_code,med_date';
  with ADOQueryDept do
  begin
    Close;
    sql.Clear;
    sql.Add(sql_str);
    Open;
  end;
  BtnPrintDept.Enabled:=true;
end;

procedure TFormMed12.ADOQueryDeptCalcFields(DataSet: TDataSet);
var
  i,days,num:integer;
  dept_code:string;
  med_date:TDatetime;
begin
  dept_code:=Dataset.FieldByName('dept_code').AsString;
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_dept where dept_code='''+dept_code+'''');
    open;
    if not Eof then
      Dataset.FieldByName('dept_name').AsString:=FieldByName('abbr_titl').AsString;
  end;
  for i:=1 to 31 do
  begin
    med_date:=MonthADate+i-1;
    days:=dayof(med_date);
    with ADOQueryDept2 do
    begin
      if Locate('dept_code;med_date',VarArrayOf([dept_code,med_date]),[loCaseInsensitive]) then
        num:=FieldByName('num').AsInteger
      else
        num:=0;
    end;
    Dataset.FieldByName(IntToStr(i)).AsInteger:=num;
  end;
end;

procedure TFormMed12.Btn_Search_DruClick(Sender: TObject);
var
  sql_str,table_name,code_begin,code_end,c_name,e_name,v_name:widestring;
begin
  sql_str:='select * from hrd_dept_cate where dept_cate_code like ''V%''';
  with ADOQueryDru do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  BtnPrintDru.Enabled:=true;
  //Btn_Reset.OnClick(Sender);
end;

procedure TFormMed12.ADOQueryDruCalcFields(DataSet: TDataSet);
var
  cate_code,sql_str,dept_str:string;
begin
  cate_code:=ADOQueryDru.FieldByName('dept_cate_code').AsString;
  dept_str:=' and A.dept_code like '''+cate_code+'%''';
  if cate_code='V000' then
    dept_str:=dept_str+' and A.dept_code <> ''V00018''';
  if cate_code='V1' then
    dept_str:=dept_str+' and A.dept_code<>''V10100'' and A.dept_code<>''V10600''';
  sql_str:='select sum(med_qty*dru_price) as qty from hrd_mdp_mast as A,'
    +' hrd_mdp_detl as B where A.mdp_code=B.mdp_code '
    +' and A.mdp_date>='''+DatetimeToStr(DatePickerBegin.date)+''''
    +' and A.mdp_date<='''+DatetimeToStr(DatePickerEnd.date)+'''';
  sql_str:=sql_str+dept_str;
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      ADOQueryDru.FieldByName('dept_dru_qty').AsFloat:=FieldByName('qty').AsFloat;
  end;
  sql_str:='select sum(med_qty*dru_price) as qty from hrd_med_mast as B,'
    +'hrd_med_detl as C,hrd_emp as A where A.emp_id=B.emp_id'
    +' and B.med_code=C.med_code'
    +' and B.med_date>='''+DatetimeToStr(DatePickerBegin.date)+''''
    +' and B.med_date<='''+DatetimeToStr(DatePickerEnd.date)+'''';
  sql_str:=sql_str+dept_str;
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      ADOQueryDru.FieldByName('normal_dru_qty').AsFloat:=FieldByName('qty').AsFloat;
  end;
end;

procedure TFormMed12.BtnPrintSickClick(Sender: TObject);
var
  titl:widestring;
begin
  titl:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
    +formatdatetime('yyyy"年"mm"月"',MonthAdate)+GetLangName(LangC,'med12_bysick_prt');
  showPrint(ADOQuerySick,titl);
end;

procedure TFormMed12.BtnPrintDeptClick(Sender: TObject);
var
  titl:widestring;
begin
  titl:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
    +formatdatetime('yyyy"年"mm"月"',MonthAdate)+GetLangName(LangC,'med12_bydept_prt');
  showPrint(ADOQueryDept,titl);
end;

procedure TFormMed12.BtnPrintDruClick(Sender: TObject);
var
  titl:widestring;
begin
  titl:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangStr,'med12_bydru_prt')+'<br>'
    +'<left>'+GetLangName(LangC,'date_range')
    +'('+GetLangName(LangV,'date_range')+'):'
    +formatdatetime('yyyy/mm/dd',datepickerBegin.Date)
    +'--'+formatdatetime('yyyy/mm/dd',datepickerEnd.Date);
  showPrint(ADOQueryDru,titl);
end;

end.
