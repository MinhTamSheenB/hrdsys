unit UnitBus04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, Grids, DBGrids, TntDBGrids, StdCtrls, Buttons,DateUtils,
  TntButtons, TntStdCtrls, Mask, ComCtrls, TntComCtrls, ExtCtrls,
  TntExtCtrls, CheckLst, TntCheckLst, DB, ADODB,StrUtils,TntDialogs,
  DBClient, WSDLIntf,Provider, DBCtrls, TntDbCtrls, TntDB;
type
  TCarArr=array of String;
  TFormBus04 = class(TTntForm)
    TntPanel1: TTntPanel;
    DataSource1: TDataSource;
    TntGroupBox2: TTntGroupBox;
    CobCarNoBegin: TTntComboBox;
    bbtn_search: TTntBitBtn;
    bbtn_reset: TTntBitBtn;
    qry_pub: TADOQuery;
    TntGroupBox1: TTntGroupBox;
    TntDBGrid2: TTntDBGrid;
    TntGroupBox3: TTntGroupBox;
    TntDBGrid1: TTntDBGrid;
    CDSCarCost: TClientDataSet;
    DataSource2: TDataSource;
    qry_temp: TADOQuery;
    ADOQuery2: TADOQuery;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    StringField2: TStringField;
    DateTimeField2: TDateTimeField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    IntegerField1: TIntegerField;
    StringField6: TStringField;
    IntegerField2: TIntegerField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    BCDField3: TBCDField;
    BCDField4: TBCDField;
    TntWideStringField1: TTntWideStringField;
    StringField7: TStringField;
    TntWideStringField2: TTntWideStringField;
    CDSCarCostcar_no: TStringField;
    CDSCarCostamonth: TStringField;
    CDSCarCostsal_pay: TBCDField;
    CDSCarCostmeal_pay: TBCDField;
    CDSCarCostpark_pay: TBCDField;
    CDSCarCostroad_pay: TBCDField;
    CDSCarCostpicc_pay: TBCDField;
    CDSCarCostyou_pay: TBCDField;
    CDSCarCostdefine_pay: TBCDField;
    CDSCarCostfix_pay: TBCDField;
    CDSCarCostdepreciation: TBCDField;
    CDSCarCosttot_pay: TBCDField;
    CDSCarCostliCheng: TBCDField;
    qry_driver: TADOQuery;
    ADOQuery3: TADOQuery;
    CobCarNoEnd: TTntComboBox;
    TntLabel1: TTntLabel;
    MeMonthBegin: TMaskEdit;
    MeMonthEnd: TMaskEdit;
    lb_car_no: TTntLabel;
    procedure TntFormCreate(Sender: TObject);
    procedure InitLangInfo;
    procedure InitForm;
    procedure CDSCarCostAfterScroll(DataSet: TDataSet);
    procedure bbtn_searchClick(Sender: TObject);
    procedure CalEverCarCost(MonBegin:string;MonEnd:string);
    procedure CobCarNoEndChange(Sender: TObject);
    procedure MeMonthBeginEnter(Sender: TObject);
    procedure bbtn_resetClick(Sender: TObject);
    function GetAllLiCheng(year,mon:integer):integer;
    function GetAllSal(year,mon:integer):integer;
    function GetLiCheng(year,mon:integer;CarNo:String):integer;
    function GetDefine(year,mon:integer;CarNo:String):integer;
    function GetYou(year,mon:integer;CarNo:String):integer;
    function GetFix(year,mon:integer;CarNo:String):integer;
    function GetPicc(year,mon:integer;CarNo:String):integer;
    function GetOther(year,mon:integer;CarNo,other:String):integer;
    procedure StringField4GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure StringField6GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBus04: TFormBus04;
  ws_Words:TWideStrings;
implementation
uses
  UnitDMHrdsys,UnitHrdUtils;
var
  pri_arr:TPrvArr;//權限數組
{$R *.dfm}
{===============================================================================
  多語言語言初始化
===============================================================================}
procedure TFormBus04.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  ThisFormUsedWords:='msg_check_search_condition,bus04_getallcarno,month,fld_car_no,Yes,No,'+
  'hour_over20,fest_overtime,hour_over15,dut17_normal_class';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
  SetComponentLang(self);

end;
{程序初始化}
procedure TFormBus04.TntFormCreate(Sender: TObject);
begin
  InitLangInfo;
  InitForm;
  Pri_arr:=GetPrvArr(username,'bus04');//Get privilege
end;

procedure TFormBus04.InitForm;
var
  fld_name:String;
begin
  if userLang='E' then
    fld_name:='eng'
  else if userLang='V' then
    fld_name:='vim'
  else
    fld_name:='chs';
  SetComboxList('select car_no from hrd_car_no order by car_no',CobCarNoBegin);
  SetComboxList('select car_no from hrd_car_no order by car_no',CobCarNoEnd);

  CobCarNoBegin.ItemIndex:=0;
  CobCarNoEnd.ItemIndex:=CobCarNoEnd.Items.Count-1;
 
end;

procedure TFormBus04.CDSCarCostAfterScroll(DataSet: TDataSet);
var
  year,mon:Integer;
  SqlStr:WideString;
begin
  if CDSCarCost.State<>dsBrowse then
    exit;
  year:=StrToInt(leftstr(CDSCarCost.fieldbyname('amonth').AsString,4));
  mon:=StrToInt(rightstr(CDSCarCost.fieldbyname('amonth').AsString,2));
  SqlStr:='select * from hrd_car_out where car_no='''+CDSCarCost.fieldbyname('car_no').AsString+''' ';
  SqlStr:=SqlStr+' and out_date>='''+DateToStr(EncodeDate(year,mon,1))+''' and out_date<='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''' ';
  with adoquery2 do
  begin
    Close;
    sql.Clear;
    sql.Add(SqlStr);
    Open;
  end;
end;

procedure TFormBus04.bbtn_searchClick(Sender: TObject);
begin
  if (CobCarNoBegin.Text='')or(CobCarNoEnd.Text='')or(MeMonthBegin.Text='')or(MeMonthEnd.Text='')or(MeMonthBegin.Text>MeMonthEnd.Text) then
  begin
    WideShowmessage(GetLangName(ws_Words,'msg_check_search_condition'));
    exit;
  end;

  CDSCarCost.Close;
  CDSCarCost.CreateDataSet;
  //車輛所有費用計算
  CalEverCarCost(MeMonthBegin.Text,MeMonthEnd.Text);
  
  CobCarNoBegin.Enabled:=false;
  CobCarNoEnd.Enabled :=false;
  MeMonthBegin.Enabled :=false;
  MeMonthEnd.Enabled :=false;
  bbtn_reset.Enabled :=true;
  bbtn_search.Enabled :=false;
end;
procedure TFormBus04.CalEverCarCost(MonBegin:string;MonEnd:string);
var
  MonCount,i,j,AllSal:Integer;
  AllLiCheng,LiCheng:Integer;
  year,mon:integer;
  CarArr:TCarArr;
  SalPay,DefinePay,DeprePay,YouPay,FixPay,PiccPay,ParkPay,RoadPay,MealPay:integer;
begin
  MonCount := 12*(StrToInt(leftstr(MonEnd,4))-StrToInt(leftstr(MonBegin,4)))+(StrToInt(RightStr(MonEnd,2))-StrToInt(RightStr(MonBegin,2)))+1;
  //得到所有車號
  SetStatusText(GetLangName(ws_Words,'bus04_getallcarno'));//得到所有車號
  with qry_pub do
    begin
      sql.Clear;
      Sql.Add('select * from hrd_car_no where car_no>='''+CobCarNoBegin.Text+''' and car_no<='''+CobCarNoEnd.Text+'''');
      Open;
      SetLength(CarArr,RecordCount);
      first;
      i:=0;
      while not eof do
      begin
        CarArr[i]:=fieldbyname('car_no').Value;
        inc(i);
        next;
      end;
    end;
  //按月計算
  SetStatusText(GetLangName(ws_Words,'bus04_calcarcost'));//按月計算每輛車的相關費用
  SetProcessBar(true,1,MonCount*length(CarArr));
  for i:=0 to MonCount-1 do
  begin
    year:=StrToInt(LeftStr(MonBegin,4));
    mon :=StrToInt(RightStr(MonBegin,2))+i;
    if mon>12 then
    begin
      if mon mod 12 <> 0 then
      begin
        year := year + mon div 12;
        mon  := mon  - 12*(mon div 12);
      end
      else
      begin
        year := year+(mon div 12)-1;
        mon  := 12;
      end;
    end;
    AllLiCheng := GetAllLiCheng(year,mon);
    AllSal :=  GetAllSal(year,mon);
    for j:=0 to length(CarArr)-1 do
    begin
      SetProcessBar(false);
      SetStatusText(GetLangName(ws_Words,'month')+':'+IntToStr(year)+'/'+IntToStr(mon)+GetLangName(ws_Words,'fld_car_no')+':'+CarArr[j]);
      //得到單車的里程
      LiCheng:=GetLiCheng(year,mon,CarArr[j]);
      //每輛車分擔的司機工資
      if (AllLiCheng=0) or (LiCheng=0) then
        SalPay:=0
      else
        SalPay := (AllSal div AllLiCheng)*LiCheng ;
      //得到單車的固定過路費
      DefinePay := GetDefine(year,mon,CarArr[j]);
      //折舊費暫時沒有
      DeprePay:=0;
      //加油費
      YouPay := GetYou(year,mon,CarArr[j]);
      //修理費
      FixPay := GetFix(year,mon,CarArr[j]);
      //保險費
      PiccPay:= GetPicc(year,mon,CarArr[j]);
      //停車費
      ParkPay:= GetOther(year,mon,CarArr[j],'park');
      //過路費
      RoadPay:= GetOther(year,mon,CarArr[j],'road');
      //誤餐費
      MealPay:= GetOther(year,mon,CarArr[j],'meal');
      with CDSCarCost do
      begin
        Append;
        fieldbyname('car_no').AsString := CarArr[j];
        fieldbyname('amonth').AsString := format('%4d%.2d',[year,mon]);
        fieldbyname('sal_pay').AsInteger := SalPay;
        fieldbyname('picc_pay').AsInteger := PiccPay;
        fieldbyname('you_pay').AsInteger := YouPay;
        fieldbyname('define_pay').AsInteger := DefinePay;
        fieldbyname('fix_pay').AsInteger := FixPay;
        fieldbyname('depreciation').AsInteger := DeprePay;
        fieldbyname('park_pay').AsInteger := ParkPay;
        fieldbyname('road_pay').AsInteger := RoadPay;
        fieldbyname('meal_pay').AsInteger := MealPay;
        fieldbyname('tot_pay').AsInteger := SalPay+PiccPay+YouPay+DefinePay+MealPay+FixPay+DeprePay+ParkPay+RoadPay;
        fieldbyname('liCheng').AsInteger := LiCheng;
      end;
    end;
  end;
end;
procedure TFormBus04.CobCarNoEndChange(Sender: TObject);
begin
  if CobCarNoBegin.ItemIndex>CobCarNoEnd.ItemIndex then
    CobCarNoEnd.ItemIndex:=CobCarNoBegin.ItemIndex;
end;

procedure TFormBus04.MeMonthBeginEnter(Sender: TObject);
begin
  if TMaskEdit(sender).Text='' then
  begin
    TMaskEdit(sender).Text:=IntToStr(yearof(Date))+IntToStr(monthof(Date));
  end;
end;

procedure TFormBus04.bbtn_resetClick(Sender: TObject);
begin
  CobCarNoBegin.Enabled:=true;
  CobCarNoEnd.Enabled :=true;
  MeMonthBegin.Enabled :=true;
  MeMonthEnd.Enabled :=true;
  bbtn_reset.Enabled :=false;
  bbtn_search.Enabled :=true;
end;

function TFormBus04.GetAllLiCheng(year,mon:integer):integer;
begin
  with qry_pub do
  begin
    Sql.Clear;
    Sql.Add('select * from hrd_car_out where out_date>='''+DateToStr(EncodeDate(year,mon,1))+''' and out_date<='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''' ');
    Open;
    result:=0;
    first;
    while not eof do
    begin
      result:=result+fieldbyname('KM').AsInteger;
      next;
    end;
    close;
  end;
end;

function TFormBus04.GetAllSal(year,mon:integer):integer;
begin
  with qry_pub do
  begin
    Sql.Clear;
    Sql.Add('select * from hrd_sal_paymt where emp_id in (select driver from hrd_car_driver) and pay_mon='''+format('%4d%.2d',[year,mon])+''' ');
    Open;
    result:=0;
    first;
    while not eof do
    begin
      result:=result+fieldbyname('actu_pay').AsInteger;
      next;
    end;
    close;
  end;
end;

function TFormBus04.GetLiCheng(year,mon:integer;CarNo:String):integer;
begin
  with qry_pub do
  begin
    Sql.Clear;
    Sql.Add('select * from hrd_car_out where  car_no='''+CarNo+''' and out_date>='''+DateToStr(EncodeDate(year,mon,1))+''' and out_date<='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''' ');
    Open;
    result:=0;
    first;
    while not eof do
    begin
      result:=result+fieldbyname('KM').AsInteger;
      next;
    end;
    close;
  end;
end;

function TFormBus04.GetDefine(year,mon:integer;CarNo:String):integer;
var
  SqlStr:WideString;
begin
  SqlStr:='select * from hrd_car_buy where  car_no='''+CarNo+''' and ';
  SqlStr:=SqlStr+'((buy_date<='''+DateToStr(EncodeDate(year,mon,1))+''' and end_date>='''+DateToStr(EncodeDate(year,mon,1))+''' ) or ';
  SqlStr:=SqlStr+'(buy_date<='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''' and end_date>='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''') or ';
  SqlStr:=SqlStr+'(buy_date<='''+DateToStr(EncodeDate(year,mon,1))+''' and end_date>='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''') or';
  SqlStr:=SqlStr+'(buy_date>='''+DateToStr(EncodeDate(year,mon,1))+''' and end_date<='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+'''))';
  with qry_pub do
  begin
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;
    result:=0;
    first;
    while not eof do
    begin
      //以後再細算
      result:=result+fieldbyname('road_fee').AsInteger;
      next;
    end;
    close;
  end;
end;

function TFormBus04.GetYou(year,mon:integer;CarNo:String):integer;
begin
  with qry_pub do
  begin
    Sql.Clear;
    Sql.Add('select a.*,b.you_price from hrd_car_you a,hrd_car_you_cate b where a.you_cate=b.you_cate and a.car_no='''+CarNo+''' and a.you_date>='''+DateToStr(EncodeDate(year,mon,1))+''' and a.you_date<='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''' ');
    Open;
    result:=0;
    first;
    while not eof do
    begin
      result:=result+fieldbyname('you_qty').Value*fieldbyname('you_price').Value;
      next;
    end;
    close;
  end;
end;

function TFormBus04.GetFix(year,mon:integer;CarNo:String):integer;
begin
  with qry_pub do
  begin
    Sql.Clear;
    Sql.Add('select * from hrd_car_repair where  car_no='''+CarNo+''' and repair_date>='''+DateToStr(EncodeDate(year,mon,1))+''' and repair_date<='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''' ');
    Open;
    result:=0;
    first;
    while not eof do
    begin
      result:=result+fieldbyname('repair_rate').Value;
      next;
    end;
    close;
  end;
end;


function TFormBus04.GetPicc(year,mon:integer;CarNo:String):integer;
var
  SqlStr:WideString;
begin
  SqlStr:='select * from hrd_car_picc where car_no='''+CarNo+''' and ';
  SqlStr:=SqlStr+'((picc_start<='''+DateToStr(EncodeDate(year,mon,1))+''' and picc_end>='''+DateToStr(EncodeDate(year,mon,1))+''' ) or ';
  SqlStr:=SqlStr+'(picc_start<='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''' and picc_end>='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''') or ';
  SqlStr:=SqlStr+'(picc_start<='''+DateToStr(EncodeDate(year,mon,1))+''' and picc_end>='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''') or';
  SqlStr:=SqlStr+'(picc_start>='''+DateToStr(EncodeDate(year,mon,1))+''' and picc_end<='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+'''))';
  with qry_pub do
  begin
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;
    result:=0;
    first;
    if not eof then
      result:=fieldbyname('picc_rate').Value div 12;
    close;
  end;
end;

function TformBus04.GetOther(year,mon:integer;CarNo,other:String):integer;
begin
  with qry_pub do
  begin
    Sql.Clear;
    Sql.Add('select * from hrd_car_out where  car_no='''+CarNo+''' and out_date>='''+DateToStr(EncodeDate(year,mon,1))+''' and out_date<='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''' ');
    Open;
    result:=0;
    first;
    while not eof do
    begin
      if (other='park') and (fieldbyname('park_pay').AsString<>'') then
        result:=result+fieldbyname('park_pay').Value;
      if (other='road') and (fieldbyname('road_pay').AsString<>'') then
        result:=result+fieldbyname('road_pay').Value;
      if (other='meal') and (fieldbyname('meal_pay').AsString<>'') then
        result:=result+fieldbyname('meal_pay').Value;
      next;
    end;
    close;
  end;
end;

procedure TFormBus04.StringField4GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.Value='1' then
    text:='1-'+GetLangName(ws_Words,'Yes');
  if Sender.Value='0' then
    text:='0-'+GetLangName(ws_Words,'No');
end;

procedure TFormBus04.StringField6GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if sender.Value=0 then
    text := '0-'+GetLangName(ws_Words,'dut17_normal_class');
  if sender.Value=1 then
    text := '1-'+GetLangName(ws_Words,'hour_over15');
  if sender.Value=2 then
    text := '2-'+GetLangName(ws_Words,'hour_over20');
  if sender.Value=3 then
    text := '3-'+GetLangName(ws_Words,'fest_overtime');
end;

end.
