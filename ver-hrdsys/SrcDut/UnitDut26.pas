{*************************************************************************
Namedut02
Author: anil
Create date:2005-08-05
Modify date:2005-08-08
Commentate:疭σ对
insert into hrd_dut_day select distinct updator,up_date+' '+up_time,wrk_date,emp_id,seg_code,clas_code,std_start,std_end,real_start,real_end,wrk_sts,late,early,over_flag,notify  from d060609 where emp_id is not null
*************************************************************************}
unit UnitDut26;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DB, ADODB, TntStdCtrls,
  TntComCtrls, Grids, TntGrids, StrUtils, TntExtCtrls,WSDLIntf, DBGrids,
  TntDBGrids, TntDB, Buttons, TntButtons, DBClient, Provider;

type
  TFormDut26 = class(TForm)
    Panel2: TPanel;
    ADOQuery1: TADOQuery;
    PanelTitle: TTntPanel;
    Panel1: TPanel;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    DTPicker: TDateTimePicker;
    CobDeptBegin: TTntComboBox;
    TntDBGrid1: TTntDBGrid;
    DataSource1: TDataSource;
    ADOQuery1dept_name: TTntWideStringField;
    Btn_Search: TTntBitBtn;
    BtnPrint: TTntBitBtn;
    CobDeptEnd: TTntComboBox;
    TntPanel1: TTntPanel;
    TntLabel3: TTntLabel;
    EditTotal: TTntEdit;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1dept_code: TStringField;
    ClientDataSet1spc_dut_cnt: TIntegerField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1spc_dut_cnt: TIntegerField;
    procedure InitForm;
    procedure InitLang;
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure Btn_SearchClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1BeforeClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut26: TFormDut26;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//粂ē才﹃
  pri_arr:TPrvArr;//舦计舱
  wrk_date:string;
{$R *.dfm}

procedure TFormDut26.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'dut26');//Get privilege
  InitForm;// Init Form
end;

procedure TFormDut26.InitLang;
{*************************************************************************
TO DO:﹍て粂ē
*************************************************************************}
var
  keys:String;             
begin
SetComponentLang(self);//set component language text
keys:='vietnam_chingluh_company,dut26_titl,date,not_find_data,total,current_location,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;

procedure TFormDut26.InitForm;
//﹍てform
var
  SqlStr:string;
begin
  SqlStr:='select dept_code+'' ''+abbr_titl from hrd_dept where dept_code like ''V%''';
  SetComboxList(SqlStr,CobDeptBegin);
  SetComboxList(SqlStr,CobDeptEnd);
end;

procedure TFormDut26.Btn_SearchClick(Sender: TObject);
//琩高
var
  SqlStr,WhereStr,dept_name:string;
  i,sum:integer;
begin
  //reset
  BtnPrint.Enabled:=false;
  EditTotal.Text:='';
  sum:=0;
  //sql text
  wrk_date:=FormatDateTime('yyyy/mm/dd',DTPicker.Date);
  WhereStr:=' where A.emp_id=B.emp_id and B.dept_code like ''V%'''
    +' and A.wrk_date='''+wrk_date+'''';
  if trim(CobDeptBegin.Text)<>'' then
    WhereStr:=WhereStr+' and B.dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if trim(CobDeptEnd.Text)<>'' then
    WhereStr:=WhereStr+' and B.dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  WhereStr:=WhereStr+' and (seg_code=''16'' or seg_code=''36'')';
  SqlStr:='select B.dept_code,count(A.emp_id) as spc_dut_cnt into [dbo].tmp_spc_dut from hrd_dut_day A,hrd_emp B '
   +WhereStr+' group by B.dept_code order by dept_code';
  with DMHrdsys.ADOCommand1 do
  begin
    CommandText:=SqlStr;
    Execute;
  end;
  SqlStr:='select * from tmp_spc_dut order by dept_code';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(SqlStr);
    open;
    DMHrdsys.ADOCommand1.CommandText:='drop table [dbo].tmp_spc_dut';
    DMHrdsys.ADOCommand1.Execute;
    if not Eof then
    begin
      BtnPrint.Enabled:=true;
      while not Eof do
      begin
        sum:=sum+FieldByName('spc_dut_cnt').AsInteger;
        Next;
      end;
      AppendRecord(['',null,null]);
      AppendRecord(['璸',null,sum]);
      First;
    end;
    EditTotal.Text:=IntToStr(sum);
  end;
end;

procedure TFormDut26.ADOQuery1CalcFields(DataSet: TDataSet);
//场嘿
var
  SqlStr:string;
begin
  SqlStr:='select * from hrd_dept where dept_code='''+Dataset.FieldByName('dept_code').AsString+'''';
  with DMHrdsys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add(SqlStr);
    open;
    if not Eof then
      Dataset.FieldByName('dept_name').AsString:=FieldByName('abbr_titl').AsString;
  end;
end;

procedure TFormDut26.BtnPrintClick(Sender: TObject);
//ゴ
var
prt_title,datefmt,flds:widestring;
begin
  prt_title:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
      +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
      +GetLangName(LangC,'dut26_titl')+'<br>'
      +GetLangName(LangV,'dut26_titl')+'<br>'
      +'<left>'+GetLangName(LangC,'date')+':'+wrk_date;
  showPrint(ADOQuery1,prt_title);
end;

procedure TFormDut26.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
//  ClientDataSet1.Active:=true;
end;

procedure TFormDut26.ADOQuery1BeforeClose(DataSet: TDataSet);
begin
//  ClientDataSet1.Active:=false;
end;

end.
 