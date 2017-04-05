{*************************************************************************
Name�Gmed07
Author: anil
Create date:2005-11-5
Modify date:2005-11-5
Commentate:�w�s����
  (�q�w�s���ɤ�Ū����J����������w�s�ƾ�;
  �q�J�w��,�B����,������,���o�ɤ�Ū������_�l��������ƾ���[�����w�s;
  �q�J�w��,�B����,������,���o�ɤ�Ū���_�l�����פ��������ƾڨ�������;
  �ѦC�L,����O�s)
*************************************************************************}
unit UnitMed07;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB, QuickRpt,
  DBClient, Provider,DateUtils;

type
  TRunThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure execute;override;
  public
    { Public declarations }
  end;

type
  TFormMed07 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelQuery: TPanel;
    DBGrid1: TTntDBGrid;
    PanelGrid: TPanel;
    ADOQuery1: TADOQuery;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    Panel2: TPanel;
    ADOQuery1dru_code: TStringField;
    ADOQuery1first_inv: TIntegerField;
    ADOQuery1in_inv: TIntegerField;
    ADOQuery1tun_inv: TIntegerField;
    ADOQuery1dis_inv: TIntegerField;
    ADOQuery1end_inv: TIntegerField;
    ADOQuery1dru_name: TTntWideStringField;
    ADOQuery1unit_name: TTntWideStringField;
    ADOQuery1new_price: TBCDField;
    ADOQuery1inv_out1: TIntegerField;
    ADOQuery1inv_out2: TIntegerField;
    ADOQuery2: TADOQuery;
    DTPickBegin: TTntDateTimePicker;
    DTPickEnd: TTntDateTimePicker;
    BtnQuery: TTntBitBtn;
    BtnPrint: TTntBitBtn;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure GetActQty(FirstFlag:boolean);
    procedure GetOnceQty;
    function IfMonthTrans(ADate:Tdatetime):boolean;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure BtnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  FormMed07: TFormMed07;
  RunThread :TRunThread;
  
implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//�y���r�Ŧ�
  pri_arr:TPrvArr;//�v���Ʋ�
  TransingFlag:boolean;
  Month:string;
  MonthADate,BDate,EDate:TDatetime;
{$R *.dfm}

procedure TFormMed07.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'med07');//Get privilege
  InitForm;// Init Form
end;

procedure TFormMed07.InitLang;
{*************************************************************************
TO DO:��l�ƻy��
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='med07_titl,vietnam_chingluh_company,qreport,date_range,'
  +'not_find_data,total,current_location,finish,reading_data,'
  +'msg_must_same_month,msg_date_e_great_b,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormMed07.InitForm;
{*************************************************************************
TO DO:��l��Form
*************************************************************************}
begin
 DTPickBegin.Date:=StartOfTheMonth(date);
 DTPickEnd.Date:=EndOfTheMonth(date);
end;

function TFormMed07.IfMonthTrans(ADate:Tdatetime):boolean;
var
  sql_str,Month,NextMonth:string;
begin
  Month:=FormatDatetime('yyyymm',ADate);
  NextMonth:=FormatDatetime('yyyymm',IncMonth(ADate));
  sql_str:='select * from hrd_med_glid where month='''+NextMonth+'''';
  if CheckRecordExist(sql_str) then
  begin
    WideShowMessage(GetLangName(LangStr,'msg_month_over_readonly'));
    result:=false;
    exit;
  end;
  result:=true;
end;

procedure TFormMed07.BtnQueryClick(Sender: TObject);
var
  sql_str,TmpTable:string;
begin
  BDate:=DTPickBegin.Date;
  EDate:=DTPickEnd.Date;
  month:=FormatDatetime('yyyymm',BDate);
  //����ˬd
  if Month<>FormatDatetime('yyyymm',EDate) then
  begin//���O�P�@�Ӥ�
    WideShowMessage(GetLangName(LangStr,'msg_must_same_month'));
    exit;
  end;
  if BDate>EDate then
  begin//�_�l����j��פ���
    WideShowMessage(GetLangName(LangStr,'msg_date_e_great_b'));
    exit;
  end;
  TryEncodeDate(StrToInt(LeftStr(month,4)),StrToInt(MidStr(month,5,2)),01,monthAdate);
  TmpTable:='Tmp'+FormatDatetime('yymmdd',date)+'Med08';
  if not CheckRecordExist('select * from sysobjects where name='''+TmpTable+'''') then
  begin//�p�G�{�ɪ��s�b�h���{�ɪ�
    sql_str:='create table '+TmpTable+'(dru_code varchar(10) PRIMARY KEY,inv_out1 int,inv_out2 int);'
      +'insert into '+TmpTable+' select dru_code,0,0 from hrd_med_mon where month='''+month+''';';
    with DMHrdsys.ADOCommand1 do
    begin
      CommandText:=sql_str;
      Execute;
    end;
  end;
  sql_str:='select * from hrd_med_mon as A,'+TmpTable+' as B'
    +' where month='''+month+''' and A.dru_code=B.dru_code';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  ADOQuery2.Clone(ADOQuery1);
  //�b�u�{���B�z�w�s�ƶq
  if not ((DayOf(Bdate)=1) and (DayOf(Edate)=DaysInMonth(Edate))) then
    RunThread := TRunThread.Create(false)
  else
    BtnPrint.Enabled:=true;
end;

procedure TFormMed07.GetOnceQty;
begin
  if (DayOf(Bdate)<>1) then
    GetActQty(true);//�B�z�_�l����w�s
  GetActQty(false);//�B�z�פ����w�s
end;

procedure TFormMed07.GetActQty(FirstFlag:boolean);
//Ū����ڼƶq
var
  sql_str,dru_code,Tdate1,Tdate2:string;
  in_inv,inv_out1,inv_out2,tun_inv:double;
begin
  dru_code:=ADOQuery2.FieldByName('dru_code').AsString;
  //�]�wŪ���ƾڤ���d��
  if FirstFlag then
  begin
    Tdate1:=FormatDatetime('yyyy/mm/dd',MonthADate);
    Tdate2:=FormatDatetime('yyyy/mm/dd',BDate);
  end
  else
  begin
    Tdate1:=FormatDatetime('yyyy/mm/dd',BDate);
    Tdate2:=FormatDatetime('yyyy/mm/dd',EDate);
  end;
  //�E�_�}���
  sql_str:='select sum(med_qty) as qty from hrd_med_mast as A,'
    +' hrd_med_detl as B where A.med_code=B.med_code and dru_code='''+dru_code+''''
    +' and med_date>='''+Tdate1+''' and med_date<='''+Tdate2+'''';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      inv_out1:=FieldByName('qty').AsFloat;
  end;
  //�������Ӽ�
  sql_str:='select sum(med_qty) as qty from hrd_mdp_mast as A,'
    +' hrd_mdp_detl as B where A.mdp_code=B.mdp_code and dru_code='''+dru_code+''''
    +' and mdp_date>='''+Tdate1+''' and mdp_date<='''+Tdate2+'''';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      inv_out2:=FieldByName('qty').AsFloat;
  end;
  //�i�ܼ�
  sql_str:='select sum(into_qty) as qty from hrd_med_into where'
    +' into_date>='''+Tdate1+''' and into_date<='''+Tdate2+''' and dru_code='''+dru_code+'''';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      in_inv:=FieldByName('qty').AsFloat;
  end;
  //���o��
  sql_str:='select sum(tun_qty) as qty from hrd_med_tun where'
    +' tun_date>='''+Tdate1+''' and tun_date<='''+Tdate2+''' and dru_code='''+dru_code+'''';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
      tun_inv:=FieldByName('qty').AsFloat;
  end;
  //�ק�ƾ�
  with ADOQuery2 do
  begin
    Edit;
    if FirstFlag then
    begin//����w�s
      FieldByName('first_inv').AsFloat:=FieldByName('first_inv').AsFloat
        +in_inv+FieldByName('dis_inv').AsFloat-(inv_out1+inv_out2+tun_inv);
    end
    else
    begin//�������ʮw�s�δ����w�s
      FieldByName('in_inv').AsFloat:=in_inv;
      FieldByName('inv_out1').AsFloat:=inv_out1;
      FieldByName('inv_out2').AsFloat:=inv_out2;
      FieldByName('out_inv').AsFloat:=inv_out1+inv_out2;
      FieldByName('tun_inv').AsFloat:=tun_inv;
      FieldByName('end_inv').AsFloat:=FieldByName('first_inv').AsFloat
        +in_inv+FieldByName('dis_inv').AsFloat-(inv_out1+inv_out2+tun_inv);
    end;
  end;
end;

procedure TFormMed07.ADOQuery1CalcFields(DataSet: TDataSet);
//�p�����
var
  dru_code,item_no,rea_code,sql_str:string;
  unit_str,rea_str,dru_name:widestring;
  dru_price:double;
begin
  dru_code:=DataSet.FieldByName('dru_code').AsString;
  if dru_code<>'' then
  begin
    with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from hrd_dru_mast as A,hrd_med_unit as B where '
        +' A.unit_code=B.unit_code and A.dru_code='''+dru_code+'''');
      open;
      if not Eof then
      begin
        dru_name:=FieldByName('dru_name').Value;
        item_no:=FieldByName('rul_code').AsString;
        unit_str:=FieldByName('unit_name').Value+'/'+FieldByName('unit_vim').Value;
      end;
    end;
    with DataSet do
    begin
      FieldByName('unit_name').Value:=unit_str;
      FieldByName('dru_name').Value:=dru_name;
    end;
  end;
end;

procedure TFormMed07.ADOQuery1AfterScroll(DataSet: TDataSet);
//�ƾڶ����ʮ�,���ܪ��A�洣��
begin
if not TransingFlag then
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(DataSet.RecNo)
    +' '+GetLangName(LangStr,'total')+':'+inttostr(DataSet.RecordCount));
end;

procedure TFormMed07.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:�I�������Y���ܱƧǤ覡
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TRunThread.execute;
{*************************************************************************
TO DO:�b�u�{��Ū����ڼƾ�
*************************************************************************}
var
  FormMed07:TFormMed07;
begin
  FreeOnTerminate := true;
  FormMed07:=TFormmed07(Application.FindComponent('Formmed07'));
  with FormMed07 do
  begin
    BtnPrint.Enabled:=false;
    PanelGrid.Enabled:=false;
    with ADOQuery2 do
    begin
      SetProcessBar(true,1,RecordCount,0);
      while not Eof do
      begin
        SetStatusText(GetLangName(LangStr,'reading_data')+inttostr(RecNo)
          +' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
        SetProcessBar(false,1);
        Synchronize(GetOnceQty);
        next;
      end;
      SetProcessBar(true,1);
    end;
    ADOQuery1.Clone(ADOQuery2);
    PanelGrid.Enabled:=true;
    BtnPrint.Enabled:=true;
  end;
end;

procedure TFormMed07.BtnPrintClick(Sender: TObject);
var
  titl:widestring;
begin
  titl:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangStr,'med07_titl')+GetLangName(LangStr,'qreport')+'<br>'
    +'<left>'+GetLangName(LangC,'date_range')
    +'('+GetLangName(LangV,'date_range')+'):'
    +formatdatetime('yyyy/mm/dd',BDate)+'--'+formatdatetime('yyyy/mm/dd',EDate);
  showPrint(ADOQuery1,titl);
end;

end.
