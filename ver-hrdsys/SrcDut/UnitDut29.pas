{*************************************************************************
Name：hrd23
Author: anil
Create date:2005-11-10
Modify date:2005-11-10
Commentate:離職員工年資統計
*************************************************************************}
unit UnitDut29;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils,
  DBGridEh, DBClient, DBSumLst,DBGridEhImpExp, PrnDbgeh,math;

type
  TFormDut29 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    PanelGrid: TPanel;
    ADOQuery3: TADOQuery;
    Btn_Search: TTntBitBtn;
    TntLabel10: TTntLabel;
    CobDeptBegin: TTntComboBox;
    BtnPrint: TTntBitBtn;
    ClientDataSet1: TClientDataSet;
    ADOQuery1: TADOQuery;
    PrintDBGridEh1: TPrintDBGridEh;
    SaveDialog1: TSaveDialog;
    ADOQuery3dept_code: TStringField;
    ADOQuery3emp_id: TStringField;
    ADOQuery3emp_chs: TWideStringField;
    ADOQuery3name_vim: TWideStringField;
    ClientDataSet1dept_code: TStringField;
    ClientDataSet1emp_id: TStringField;
    ClientDataSet1emp_chs: TWideStringField;
    ClientDataSet1name_vim: TWideStringField;
    ClientDataSet1week7work1: TStringField;
    ClientDataSet1week7work2: TStringField;
    ClientDataSet1week7work3: TStringField;
    ClientDataSet1week1work1: TStringField;
    ClientDataSet1week1work2: TStringField;
    ClientDataSet1week1work3: TStringField;
    ClientDataSet1week2work1: TStringField;
    ClientDataSet1week2work2: TStringField;
    ClientDataSet1week2work3: TStringField;
    ClientDataSet1week3work1: TStringField;
    ClientDataSet1week3work2: TStringField;
    ClientDataSet1week3work3: TStringField;
    ClientDataSet1week4work1: TStringField;
    ClientDataSet1week4work2: TStringField;
    ClientDataSet1week4work3: TStringField;
    ClientDataSet1week5work1: TStringField;
    ClientDataSet1week5work2: TStringField;
    ClientDataSet1week5work3: TStringField;
    ClientDataSet1week6work1: TStringField;
    ClientDataSet1week6work2: TStringField;
    ClientDataSet1week6work3: TStringField;
    ADOQuery3week7: TStringField;
    ADOQuery3week72: TStringField;
    ADOQuery3week73: TStringField;
    ADOQuery3week1: TStringField;
    ADOQuery3week12: TStringField;
    ADOQuery3week13: TStringField;
    ADOQuery3week2: TStringField;
    ADOQuery3week22: TStringField;
    ADOQuery3week23: TStringField;
    ADOQuery3week3: TStringField;
    ADOQuery3week32: TStringField;
    ADOQuery3week33: TStringField;
    ADOQuery3week4: TStringField;
    ADOQuery3week42: TStringField;
    ADOQuery3week43: TStringField;
    ADOQuery3week5: TStringField;
    ADOQuery3week52: TStringField;
    ADOQuery3week53: TStringField;
    ADOQuery3week6: TStringField;
    ADOQuery3week62: TStringField;
    ADOQuery3week63: TStringField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1seq: TIntegerField;
    Btn_SaveAs: TTntBitBtn;
    TntLabel3: TTntLabel;
    EditMon: TMaskEdit;
    TntDBGrid1: TTntDBGrid;
    TntLabel1: TTntLabel;
    EditWeek: TTntEdit;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery3AfterScroll(DataSet: TDataSet);
    procedure Btn_ResetClick(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut29: TFormDut29;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtDut29;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  can_post:boolean;
  SalBaseLvl:TStrings;
const
  TMP_DB='[tempdbf].[dbo].';
  TMP_TABLE='tmp_left_emp_sum';
{$R *.dfm}

procedure TFormDut29.FormCreate(Sender: TObject);
//初始化
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'dut29');//Get privilege
  InitForm;// Init Form
end;

procedure TFormDut29.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='vietnam_chingluh_company,hrd15_titl,total,current_location,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
  +'not_find_data,with_star_cannot_empty,msg_post_record_on_close,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;

procedure TFormDut29.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  GetDeptRange(CobDeptBegin);
  EditMon.Text:=FormatDateTime('yyyymm',date+2);
  EditWeek.Text:='1';
  //第一次創建form
  Application.CreateForm(TFormPrtDut29, FormPrtDut29);
end;

procedure TFormDut29.Btn_SearchClick(Sender: TObject);
//查詢數據
var
  sqlstr,SDates,EDates:string;
  i:integer;
  SDate,EDate,ADate:TDateTime;
begin
    {+' '' '' as [week7|上],'' '' as [week7|下],'' '' as [week7|加],'
    +' '' '' as [week1|上],'' '' as [week1|下],'' '' as [week1|加],'
    +' '' '' as [week2|上],'' '' as [week2|下],'' '' as [week2|加],'
    +' '' '' as [week3|上],'' '' as [week3|下],'' '' as [week3|加],'
    +' '' '' as [week4|上],'' '' as [week4|下],'' '' as [week4|加],'
    +' '' '' as [week5|上],'' '' as [week5|下],'' '' as [week5|加],'
    +' '' '' as [week6|上],'' '' as [week6|下],'' '' as [week6|加]'}
  BtnPrint.Enabled:=false;
  Btn_Saveas.Enabled:=false;
  ADate:=EnCodeDate(StrToInt(LeftStr(EditMon.Text,4)),StrToInt(RightStr(EditMon.Text,2)),1);
  ADate:=ADate+7*(StrToInt(EditWeek.Text)-1);
  SDate:=max(StartOfTheMonth(ADate),StartOfTheWeek(ADate));
  EDate:=min(EndOfTheMonth(ADate),EndOfTheWeek(ADate));
  //CountEmpNum;
  sqlstr:='select dept_code,emp_id,emp_chs,name_vim'
    +' from hrd_emp where dept_code='''+LeftStr(CobDeptBegin.Text,6)+''''
    +' and epledt is null order by emp_id';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    for i:=(RecordCount mod 26)+1 to 26 do //27-->26 hyt upd
    begin
      Append;
      FieldByName('dept_code').AsString:=LeftStr(CobDeptBegin.Text,6);
      Post;
    end;
    First;
  end;
  with FormPrtDut29 do
  begin
    QRDeptCode.Caption:=LeftStr(CobDeptBegin.Text,6);
    QRDeptName.Caption:=MidStr(CobDeptBegin.Text,8,Length(CobDeptBegin.Text)-7);
    QRMonth.Caption:=EditMon.Text;
    QRWeek.Caption:=EditWeek.Text;
    QRSDate.Caption:=FormatDateTime('yyyy/mm/dd',SDate);
    QREDate.Caption:=FormatDateTime('yyyy/mm/dd',EDate);
    QRWeek1.Caption:=FormatDateTime('yyyy/mm/dd',StartOfTheWeek(ADate));
    QRWeek2.Caption:=FormatDateTime('yyyy/mm/dd',StartOfTheWeek(ADate)+1);
    QRWeek3.Caption:=FormatDateTime('yyyy/mm/dd',StartOfTheWeek(ADate)+2);
    QRWeek4.Caption:=FormatDateTime('yyyy/mm/dd',StartOfTheWeek(ADate)+3);
    QRWeek5.Caption:=FormatDateTime('yyyy/mm/dd',StartOfTheWeek(ADate)+4);
    QRWeek6.Caption:=FormatDateTime('yyyy/mm/dd',StartOfTheWeek(ADate)+5);
    QRWeek7.Caption:=FormatDateTime('yyyy/mm/dd',StartOfTheWeek(ADate)+6);
    QRPage.Caption:=IntToStr(ADOQuery1.RecordCount div 27);
  end;                                         
  BtnPrint.Enabled:=true;
  Btn_Saveas.Enabled:=true;  
end;

procedure TFormDut29.Btn_ResetClick(Sender: TObject);
//重置查詢條件
var
  status:boolean;
begin
if TtntBitBtn(Sender).Name='Btn_Reset' then
  status:=true
else
  status:=false;
Btn_search.Enabled:=status;
//if status=true then
ADOQuery1.Active:= not status;
end;

procedure TFormDut29.ADOQuery3AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示,及改變編輯區一些欄位
begin
with DataSet do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

procedure TFormDut29.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormDut29.BtnPrintClick(Sender: TObject);
begin
  {if not PrintDBGridEh1.PrinterSetupDialog then
    exit;}
  // PrintDBGridEh1.Preview;
  FormPrtDut29.QuickRep1.Preview;
end;

end.
