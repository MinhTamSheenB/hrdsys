{*************************************************************************
Name：sal16
Author: anil
Create date:2005-11-10
Modify date:2005-11-10
Commentate:薪資查詢表格
*************************************************************************}
unit UnitSal20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils;

type
  TFormSal20 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    ADOQuery1: TADOQuery;
    Btn_Search: TTntBitBtn;
    BtnPrint: TTntBitBtn;
    TntLabel2: TTntLabel;
    EditMon: TTntEdit;
    ADOQuery1dept_code: TStringField;
    ADOQuery1abbr_titl: TWideStringField;
    ADOQuery1peoplesum: TIntegerField;
    ADOQuery1A_people: TIntegerField;
    ADOQuery1B_people: TIntegerField;
    ADOQuery1C_people: TIntegerField;
    ADOQuery1D_people: TIntegerField;
    ADOQuery1remark: TStringField;
    ADOQuery1A_ratio: TStringField;
    ADOQuery1B_ratio: TStringField;
    ADOQuery1C_ratio: TStringField;
    ADOQuery1D_ratio: TStringField;
    RbHave: TTntRadioButton;
    RbNot: TTntRadioButton;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure Btn_SearchClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure ADOQuery1dept_codeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal20: TFormSal20;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  can_post:boolean;
  SalBaseLvl:TStrings;
const
  TMP_DB='[tempdbf].[dbo].';
  TMP_TABLE='tmp_wrk_sum';
{$R *.dfm}

procedure TFormSal20.FormCreate(Sender: TObject);
//初始化
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'sal20');//Get privilege
  InitForm;// Init Form
end;

procedure TFormSal20.InitLang;
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
  +'cur_emp_id,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;

procedure TFormSal20.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  SqlStr:string;
begin
  EditMon.Text:=formatDateTime('yyyymm',date-12);
end;

procedure TFormSal20.Btn_SearchClick(Sender: TObject);
//查詢數據
var
  sql_str,DateStr,confirm_str,sInDept:string;
  ADate:TDateTime;
begin
  if G_sFactory='F' then
    sInDept:='''F'',''S'''
  else
    sInDept:='''V''';

  if RbHave.Checked then
    confirm_str:=' and valid_date is not null';
  if RBNot.Checked then
    confirm_str:=' and valid_date is null';
  Sql_Str:='if exists (select * from '+TMP_DB+'sysobjects where name='''+TMP_TABLE+''')'
    +'drop table '+TMP_DB+TMP_TABLE+';';
  //寫入臨時匯總檔
  Sql_Str:=Sql_Str+'select dept_code,part_grad,count(A.emp_id) as tot,'
    +' case part_grad when ''A'' then count(A.emp_id) end as A ,'
    +' case part_grad when ''B'' then count(A.emp_id) end as B ,'
    +' case part_grad when ''C'' then count(A.emp_id) end as C ,'
    +' case part_grad when ''D'' then count(A.emp_id) end as D '
    +' into '+TMP_DB+TMP_TABLE+' from hrd_wrkpay A,hrd_emp B,hrd_wrkpart C'
    +' where wrk_mon='''+EditMon.Text+''''+confirm_str
    +' and A.emp_id=B.emp_id and A.part_code=C.part_code'
    +' and left(B.dept_code,1) in('+sInDept+')'
    +' group by dept_code,part_grad order by dept_code,part_grad;';
  //分廠合計
  {Sql_Str:=Sql_Str+'insert into '+TMP_DB+TMP_TABLE
    +' select ''V09ZZZ'',''Z'',sum(A)+sum(B)+sum(C)+sum(D) as peoplesum,'
    +' sum(A) as A_people,sum(B) as B_people,sum(C) as C_people,sum(D) as D_people'
    +' from '+TMP_DB+TMP_TABLE+' where part_grad<>''Z'' and dept_code like ''V09%'';';
  Sql_Str:=Sql_Str+'insert into '+TMP_DB+TMP_TABLE
    +' select ''VAZZZZ'',''Z'',sum(A)+sum(B)+sum(C)+sum(D) as peoplesum,'
    +' sum(A) as A_people,sum(B) as B_people,sum(C) as C_people,sum(D) as D_people'
    +' from '+TMP_DB+TMP_TABLE+' where part_grad<>''Z'' and dept_code like ''VA%'';';
  Sql_Str:=Sql_Str+'insert into '+TMP_DB+TMP_TABLE
    +' select ''VBZZZZ'',''Z'',sum(A)+sum(B)+sum(C)+sum(D) as peoplesum,'
    +' sum(A) as A_people,sum(B) as B_people,sum(C) as C_people,sum(D) as D_people'
    +' from '+TMP_DB+TMP_TABLE+' where part_grad<>''Z'' and dept_code like ''VB%'';';
  Sql_Str:=Sql_Str+'insert into '+TMP_DB+TMP_TABLE
    +' select ''VCZZZZ'',''Z'',sum(A)+sum(B)+sum(C)+sum(D) as peoplesum,'
    +' sum(A) as A_people,sum(B) as B_people,sum(C) as C_people,sum(D) as D_people'
    +' from '+TMP_DB+TMP_TABLE+' where part_grad<>''Z'' and dept_code like ''VC%'';';
  Sql_Str:=Sql_Str+'insert into '+TMP_DB+TMP_TABLE
    +' select ''VDZZZZ'',''Z'',sum(A)+sum(B)+sum(C)+sum(D) as peoplesum,'
    +' sum(A) as A_people,sum(B) as B_people,sum(C) as C_people,sum(D) as D_people'
    +' from '+TMP_DB+TMP_TABLE+' where part_grad<>''Z'' and dept_code like ''VD%'';';}
  //全廠合計
  Sql_Str:=Sql_Str+'insert into '+TMP_DB+TMP_TABLE
    +' select ''FZZZZZ'',''Z'',sum(A)+sum(B)+sum(C)+sum(D) as peoplesum,'
    +' sum(A) as A_people,sum(B) as B_people,sum(C) as C_people,sum(D) as D_people'
    +' from '+TMP_DB+TMP_TABLE+' where part_grad<>''Z'';';
  with DMHrdsys.ADOCommand1 do
  begin
    CommandText:=Sql_Str;
    Execute;
  end;
  sql_str:='select A.dept_code,sum(tot) as peoplesum,'
   +' isnull(sum(A),0) as A_people,isnull(sum(B),0) as B_people,'
   +' isnull(sum(C),0) as C_people,isnull(sum(D),0) as D_people,'
   +' cast(isnull(sum(A)*100/sum(tot),0) as varchar)+''%'' as A_ratio,'
   +' cast(isnull(sum(B)*100/sum(tot),0) as varchar)+''%'' as B_ratio,'
   +' cast(isnull(sum(C)*100/sum(tot),0) as varchar)+''%'' as C_ratio,'
   +' cast(isnull(sum(D)*100/sum(tot),0) as varchar)+''%'' as D_ratio,'' '' as remark'
   +' from '+TMP_DB+TMP_TABLE+' A '
   +' group by A.dept_code order by A.dept_code';
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
    BtnPrint.Enabled:=false;
  end
  else
    BtnPrint.Enabled:=true;
end;

procedure TFormSal20.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示,及改變編輯區一些欄位
var
  AText:string;
begin
with ADOQuery1 do
  AText:=GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+'; '
    +GetLangName(LangStr,'total')+':'+inttostr(RecordCount)+'; ';
    //+GetLangName(LangStr,'cur_emp_id')+':'+FieldByName('emp_id').AsString;
  setStatusText(AText);
end;

procedure TFormSal20.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormSal20.BtnPrintClick(Sender: TObject);
var
  titl_str,fld_str,footer_str:string;
begin
  titl_str:='部門等級人員匯總表('+LeftStr(editmon.text,4)+'年'+RightStr(editmon.text,2)+'月)'
    +'<br><right>Date:  '+FormatDateTime('yyyy/mm/dd',GetServerDateTime)+'        ';
  footer_str:='副協理:                                                        '
    +'IE主管:                                                       '
    +'制表:                       <br><br><br>';
  ShowPrint(ADOQuery1,titl_str,footer_str);
end;

procedure TFormSal20.ADOQuery1dept_codeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if RightStr(Sender.AsString,3)<>'ZZZ' then
  begin
    Text:=Sender.AsString;
  end;                            
end;

procedure TFormSal20.ADOQuery1CalcFields(DataSet: TDataSet);
var
  key:string;
begin
  key:=DataSet.FieldByName('dept_code').AsString;
  if RightStr(key,3)='ZZZ' then
  begin//合計
    with DataSet do
    begin
      if key='V09ZZZ' then
        FieldByName('abbr_titl').AsString:='技術課合計:';
      if key='VAZZZZ' then
        FieldByName('abbr_titl').AsString:='一廠合計:';
      if key='VBZZZZ' then
        FieldByName('abbr_titl').AsString:='二廠合計:';
      if key='VCZZZZ' then
        FieldByName('abbr_titl').AsString:='三廠合計:';
      if key='VDZZZZ' then
        FieldByName('abbr_titl').AsString:='底加工合計:';
      if key='VZZZZZ' then
        FieldByName('abbr_titl').AsString:='全廠合計:';
    end;
  end
  else
  begin //按部門
    With DMHrdsys.SQLQuery2 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from hrd_dept where dept_code='''+key+'''');
      open;
      if not Eof then
        DataSet.FieldByName('abbr_titl').AsString:=FieldByName('abbr_titl').AsString;
    end;
  end;
end;

end.
