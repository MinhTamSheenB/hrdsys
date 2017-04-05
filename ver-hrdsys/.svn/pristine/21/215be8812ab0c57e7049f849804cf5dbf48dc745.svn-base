unit UnitBus03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, Grids, DBGrids, TntDBGrids, StdCtrls, Buttons,DateUtils,
  TntButtons, TntStdCtrls, Mask, ComCtrls, TntComCtrls, ExtCtrls,
  TntExtCtrls, CheckLst, TntCheckLst, DB, ADODB,StrUtils,TntDialogs,
  DBClient, WSDLIntf,Provider, DBCtrls, TntDbCtrls, TntDB, QuickRpt,
  QRCtrls;
type
  TDeptArr=array of String;
  TFormBus03 = class(TTntForm)
    TntPanel1: TTntPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    TntGroupBox9: TTntGroupBox;
    CobDeptBegin: TTntComboBox;
    bbtn_search: TTntBitBtn;
    bbtn_reset: TTntBitBtn;
    PanelAct: TTntPanel;
    sb_Save: TTntSpeedButton;
    TntGroupBox1: TTntGroupBox;
    TntGroupBox2: TTntGroupBox;
    TntDBGrid1: TTntDBGrid;
    TntDBGrid2: TTntDBGrid;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1use_dept: TStringField;
    ADOQuery1month: TStringField;
    ADOQuery1sal_pay: TBCDField;
    ADOQuery1park_pay: TBCDField;
    ADOQuery1define_pay: TBCDField;
    ADOQuery1road_pay: TBCDField;
    ADOQuery1meal_pay: TBCDField;
    ADOQuery1depreciation: TBCDField;
    ADOQuery1you_pay: TBCDField;
    ADOQuery1repair_pay: TBCDField;
    ADOQuery1picc_pay: TBCDField;
    ADOQuery1tot_pay: TBCDField;
    ADOQuery2upd_user: TStringField;
    ADOQuery2upd_date: TDateTimeField;
    ADOQuery2car_no: TStringField;
    ADOQuery2out_date: TDateTimeField;
    ADOQuery2driver: TStringField;
    ADOQuery2use_dept: TStringField;
    ADOQuery2if_bing: TStringField;
    ADOQuery2dest: TStringField;
    ADOQuery2KM: TIntegerField;
    ADOQuery2over_cate: TStringField;
    ADOQuery2over_time: TIntegerField;
    ADOQuery2repair_pay: TBCDField;
    ADOQuery2road_pay: TBCDField;
    ADOQuery2meal_pay: TBCDField;
    ADOQuery2park_pay: TBCDField;
    CobDeptEnd: TTntComboBox;
    MeMonthBegin: TMaskEdit;
    MeMonthEnd: TMaskEdit;
    qry_driver: TADOQuery;
    ADOQuery2driver_name: TTntWideStringField;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    ADOQuery3: TADOQuery;
    ADOQuery2dept_name: TTntWideStringField;
    ADOQuery1dept_name: TTntWideStringField;
    qry_pub: TADOQuery;
    CDSCarCost: TClientDataSet;
    qry_temp: TADOQuery;
    qry_tempcar_no: TStringField;
    qry_tempamonth: TStringField;
    qry_tempsal_pay: TBCDField;
    qry_temppicc_pay: TBCDField;
    qry_tempyou_pay: TBCDField;
    qry_tempdefine_pay: TBCDField;
    qry_tempfix_pay: TBCDField;
    qry_tempdepreciation: TBCDField;
    qry_templiCheng: TBCDField;
    procedure TntFormCreate(Sender: TObject);
    procedure InitLangInfo;
    procedure InitForm;
    procedure bbtn_searchClick(Sender: TObject);
    procedure ADOQuery2if_bingGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQuery2over_cateGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CobDeptEndChange(Sender: TObject);
    procedure bbtn_resetClick(Sender: TObject);
    procedure MeMonthBeginChange(Sender: TObject);
    procedure GenerateTransData(MonBegin:string;MonEnd:string);
    procedure CalEverCarCost(MonBegin:string;MonEnd:string);
    function GetAllLiCheng(year,mon:integer):integer;
    function GetAllSal(year,mon:integer):integer;
    function GetLiCheng(year,mon:integer;CarNo:String):integer;
    function GetDefine(year,mon:integer;CarNo:String):integer;
    function GetYou(year,mon:integer;CarNo:String):integer;
    function GetFix(year,mon:integer;CarNo:String):integer;
    function GetPicc(year,mon:integer;CarNo:String):integer;
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure sb_SaveClick(Sender: TObject);
    procedure TntDBGrid1Enter(Sender: TObject);
    procedure MeMonthBeginEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBus03: TFormBus03;
  ws_Words:TWideStrings;
  ActiveIndex:integer;
implementation
uses
  UnitDMHrdsys,UnitHrdUtils;
var
  pri_arr:TPrvArr;//權限數組
{$R *.dfm}
{===============================================================================
  多語言語言初始化
===============================================================================}
procedure TFormBus03.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  ThisFormUsedWords:='msg_check_search_condition,bus04_getallcarno,month,fld_car_no,Yes,No,'+
    'hour_over20,fest_overtime,hour_over15,dut17_normal_class,dept,month,complete_data,bus04_getallcarno,'+
    'bus04_calcarcost,fld_use_dept,bus03_infor';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
  SetComponentLang(self);

end;
{程序初始化}
procedure TFormBus03.TntFormCreate(Sender: TObject);
begin
  InitLangInfo;
  InitForm;
  Pri_arr:=GetPrvArr(username,'bus03');//Get privilege

end;

procedure TFormBus03.InitForm;
var
  fld_name:String;
begin
  if userLang='E' then
    fld_name:='eng'
  else if userLang='V' then
    fld_name:='vim'
  else
    fld_name:='chs';
  SetComboxList('select dept_code+'' ''+abbr_titl from hrd_dept order by dept_code',CobDeptBegin);
  SetComboxList('select dept_code+'' ''+abbr_titl from hrd_dept order by dept_code',CobDeptEnd);
  CobDeptBegin.ItemIndex := 0;
  CobDeptEnd.ItemIndex := CobDeptEnd.Items.Count - 1 ;
end;

procedure TFormBus03.bbtn_searchClick(Sender: TObject);
begin
  if (CobDeptBegin.Text='') or (CobDeptEnd.Text='') or (MeMonthBegin.Text='') or (MeMonthEnd.Text='')or(MeMonthBegin.Text>MeMonthEnd.Text) then
  begin
    WideShowmessage(GetLangName(ws_Words,'msg_check_search_condition'));
    exit;
  end;

  //車輛所有費用計算
  CalEverCarCost(MeMonthBegin.Text,MeMonthEnd.Text);

  //產生轉檔資料
  GenerateTransData(MeMonthBegin.Text,MeMonthEnd.Text);
  Adoquery1.FieldByName('dept_name').ReadOnly := true;
  CobDeptBegin.Enabled := false;
  CobDeptEnd.Enabled := false;
  MeMonthBegin.Enabled := false;
  MeMonthEnd.Enabled := false;
  bbtn_search.Enabled := false;
  bbtn_reset.Enabled := true;
  sb_save.Enabled := true;
end;

procedure TFormBus03.ADOQuery2if_bingGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.Value='1' then
    text:='1-'+GetLangName(ws_Words,'Yes');
  if Sender.Value='0' then
    text:='0-'+GetLangName(ws_Words,'No');
end;

procedure TFormBus03.ADOQuery2over_cateGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
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

procedure TFormBus03.CobDeptEndChange(Sender: TObject);
begin
  if CobDeptBegin.ItemIndex>CobDeptEnd.ItemIndex then
    CobDeptEnd.ItemIndex:=CobDeptBegin.ItemIndex;
end;

procedure TFormBus03.bbtn_resetClick(Sender: TObject);
begin
  adoquery1.Close;
  adoquery2.Close;
  CobDeptBegin.Enabled := true;
  CobDeptEnd.Enabled := true;
  MeMonthBegin.Enabled := true;
  MeMonthEnd.Enabled := true;
  bbtn_search.Enabled := true;
  bbtn_reset.Enabled :=false;
  sb_save.Enabled := false;
end;

procedure TFormBus03.MeMonthBeginChange(Sender: TObject);
begin
 { if length(MeMonthBegin.Text)=6 then
    MeMonthEnd.SetFocus;  }
end;

procedure TFormBus03.GenerateTransData(MonBegin:string;MonEnd:string);
var
  SqlStr:string;
  MonCount,i,j:Integer;
  DeptArr:TDeptArr;
  year,mon,day,LiCheng,ALC:integer;
  ParkPay,PassPay,MealPay,SalPay,DefinePay,DeprePay,YouPay,FixPay,PiccPay:Integer;
begin
  MonCount := 12*(StrToInt(leftstr(MonEnd,4))-StrToInt(leftstr(MonBegin,4)))+(StrToInt(RightStr(MonEnd,2))-StrToInt(RightStr(MonBegin,2)))+1;
  SqlStr := 'select use_dept from hrd_car_out ';
  SqlStr := SqlStr + ' where use_dept>='''+leftstr(CobDeptBegin.Text,6)+''' and use_dept<='''+leftstr(CobDeptEnd.Text,6)+''' ';
  SqlStr := SqlStr + ' and out_date>='''+DateToStr(EncodeDate(strtoint(LeftStr(MeMonthBegin.text,4)),strtoint(RightStr(MeMonthBegin.text,2)),1))+''' and out_date<='''+DateToStr(EncodeDate(strtoint(LeftStr(MeMonthEnd.text,4)),strtoint(RightStr(MeMonthEnd.text,2)),DaysInAMonth(strtoint(LeftStr(MeMonthEnd.text,4)),strtoint(RightStr(MeMonthEnd.text,2)))))+''' ';
  SqlStr := SqlStr + ' Group by use_dept';
  with qry_pub do
  begin
    sql.Clear;
    sql.Add(SqlStr);
    Open;
    SetLength(DeptArr,RecordCount);
    First;
    i:=0;
    while not eof do
    begin
      //取出所有滿足條件有資料的部門
      DeptArr[i]:=fields[0].AsString;
      inc(i);
      next;
    end;
    Close;
  end;
  with adoquery1 do
  begin
    Sql.Clear;
    Sql.Add('select * from hrd_car_dept where 1<0');
    Open;
    FieldByName('dept_name').ReadOnly := false;
  end;
  SetProcessBar(true,1,length(DeptArr)*MonCount);
  for i:=0 to length(DeptArr)-1 do
  begin
    year:=StrToInt(LeftStr(MonBegin,4));
    mon :=StrToInt(RightStr(MonBegin,2));
    for j:=0 to MonCount-1 do
    begin
      SetProcessBar(false);
      mon:=mon+j;
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
          mon  := mon-12*((mon div 12)-1);
        end;
      end;
      day := DaysInAMonth(year,mon);
      SetStatusText(GetLangName(ws_words,'dept')+':'+DeptArr[i]+GetLangName(ws_words,'month')+':'+IntToStr(year)+'/'+IntToStr(mon));
      ParkPay:=0;
      PassPay:=0;
      MealPay:=0;
      SalPay:=0;
      DefinePay:=0;
      DeprePay:=0;
      YouPay:=0;
      FixPay:=0;
      PiccPay:=0;
      SqlStr:='select * from hrd_car_out where use_dept='''+DeptArr[i]+''' and out_date>='''+DateToStr(EncodeDate(year,mon,1))+''' and out_date<='''+DateToStr(EncodeDate(year,mon,day))+'''';
      with qry_pub do
      begin
        Sql.Clear;
        Sql.Add(SqlStr);
        Open;
        first;
        while Not eof do
        begin
          ParkPay := ParkPay+fieldbyname('park_pay').AsInteger;
          PassPay := PassPay+fieldbyname('road_pay').AsInteger;
          MealPay := MealPay+fieldbyname('meal_pay').AsInteger;
          LiCheng := fieldbyname('KM').AsInteger;
          CDSCarCost.First;
          while not CDSCarCost.Eof do
          begin
            if (CDSCarCost.FieldByName('car_no').AsString=fieldbyname('car_no').Value) and (CDSCarCost.FieldByName('amonth').AsString=(IntToStr(year)+IntToStr(mon))) then
            begin
              ALC:=CDSCarCost.FieldByName('liCheng').AsInteger;
              if ALC>0 then
              begin
                SalPay:=SalPay+LiCheng*(CDSCarCost.FieldByName('sal_pay').AsInteger div ALC);
                DefinePay:=DefinePay+(LiCheng*CDSCarCost.FieldByName('define_pay').AsInteger div ALC);
                DeprePay:=DeprePay+LiCheng*(CDSCarCost.FieldByName('depreciation').AsInteger div ALC);
                YouPay:=YouPay+LiCheng*(CDSCarCost.FieldByName('you_pay').AsInteger div ALC);
                FixPay:=FixPay+LiCheng*(CDSCarCost.FieldByName('fix_pay').AsInteger div ALC);
                PiccPay:=PiccPay+LiCheng*(CDSCarCost.FieldByName('picc_pay').AsInteger div ALC);
              end;
              break;
            end;
            CDSCarCost.next;
          end;
          next;
        end;
      end;
      with adoquery1 do
      begin
        append;
        fieldbyname('use_dept').AsString:=DeptArr[i];
        fieldbyname('month').AsString:=format('%4d%.2d',[year,mon]);
        fieldbyname('sal_pay').AsInteger:=SalPay;
        fieldbyname('park_pay').AsInteger:=ParkPay;
        fieldbyname('define_pay').AsInteger:=DefinePay;
        fieldbyname('road_pay').AsInteger:=PassPay;
        fieldbyname('meal_pay').AsInteger:=MealPay;
        fieldbyname('you_pay').AsInteger:=YouPay;
        fieldbyname('repair_pay').AsInteger:=FixPay;
        fieldbyname('picc_pay').AsInteger:=PiccPay;
        fieldbyname('depreciation').AsInteger:=DeprePay;
        fieldbyname('tot_pay').AsInteger :=SalPay+ParkPay+DefinePay+PassPay+MealPay+YouPay+FixPay+PiccPay+DeprePay;
      end;
    end;
  end;
  SetStatusText(GetLangName(ws_words,'complete_data'));//'資料計算完成！');
  SetProcessBar(true);
end;

procedure TFormBus03.CalEverCarCost(MonBegin:string;MonEnd:string);
var
  MonCount,i,j,AllSal:Integer;
  AllLiCheng,LiCheng:Integer;
  year,mon:integer;
  CarArr:TDeptArr;
  SalPay,DefinePay,DeprePay,YouPay,FixPay,PiccPay:integer;
begin
  MonCount := 12*(StrToInt(leftstr(MonEnd,4))-StrToInt(leftstr(MonBegin,4)))+(StrToInt(RightStr(MonEnd,2))-StrToInt(RightStr(MonBegin,2)))+1;
  //得到所有車號
  SetStatusText(GetLangName(ws_words,'bus04_getallcarno'));//得到所有車號');
  with qry_pub do
    begin
      sql.Clear;
      Sql.Add('select * from hrd_car_no ');
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
  SetStatusText(GetLangName(ws_words,'bus04_calcarcost'));//按月計算每輛車的相關費用');
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
      SetStatusText(GetLangName(ws_words,'month')+':'+IntToStr(year)+'/'+IntToStr(mon)+GetLangName(ws_words,'fld_car_no')+':'+CarArr[j]);
      //得到單車的里程
      LiCheng:=GetLiCheng(year,mon,CarArr[j]);
      //每輛車分擔的司機工資
      if (AllLiCheng=0) or (LiCheng=0) then
        SalPay:=0
      else
        SalPay := (AllSal*LiCheng) div AllLiCheng;
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
        fieldbyname('liCheng').AsInteger := LiCheng;
      end;
    end;
  end;
end;


function TFormBus03.GetAllLiCheng(year,mon:integer):integer;
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

function TFormBus03.GetAllSal(year,mon:integer):integer;
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

function TFormBus03.GetLiCheng(year,mon:integer;CarNo:String):integer;
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

function TFormBus03.GetDefine(year,mon:integer;CarNo:String):integer;
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

function TformBus03.GetYou(year,mon:integer;CarNo:String):integer;
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

function TformBus03.GetFix(year,mon:integer;CarNo:String):integer;
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

function TformBus03.GetPicc(year,mon:integer;CarNo:String):integer;
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
    //tntedit1.text := SqlStr;
    Open;
    result:=0;
    first;
    if not eof then
      result:=fieldbyname('picc_rate').Value div 12;
    close;
  end;
end;

procedure TFormBus03.ADOQuery1BeforePost(DataSet: TDataSet);
begin
  adoquery1.Edit;
  adoquery1.FieldByName('upd_user').AsString:=UserName;
  adoquery1.FieldByName('upd_date').AsDateTime:=GetServerDatetime;
end;

procedure TFormBus03.ADOQuery1AfterScroll(DataSet: TDataSet);
var
  SqlStr:WideString;
  year,mon:Integer;
begin
  if Adoquery1.State<>dsBrowse then
    exit;
  if adoquery1.FieldByName('month').AsString='' then
    exit;
  year:=StrToInt(leftstr(Adoquery1.fieldbyname('month').AsString,4));
  mon:=StrToInt(rightstr(Adoquery1.fieldbyname('month').AsString,2));
  SqlStr:='select * from hrd_car_out where use_dept='''+Adoquery1.fieldbyname('use_dept').AsString+''' ';
  SqlStr:=SqlStr+' and out_date>='''+DateToStr(EncodeDate(year,mon,1))+''' and out_date<='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''' ';
  with adoquery2 do
  begin
    Close;
    sql.Clear;
    sql.Add(SqlStr);
    Open;
  end;
end;

procedure TFormBus03.sb_SaveClick(Sender: TObject);
begin
  adoquery1.First;
  while not adoquery1.Eof do
  begin
    with qry_pub do
    begin
      close;
      sql.Clear;
      sql.Add('select * from hrd_car_dept where use_dept='''+adoquery1.fieldbyname('use_dept').AsString+''' and [month]='''+adoquery1.fieldbyname('month').AsString+'''');
      Open;
      if not eof then
      begin
        if wideMessageDlg(GetLangName(ws_Words,'fld_use_dept')+adoquery1.fieldbyname('dept_name').AsString+adoquery1.fieldbyname('month').AsString+GetLangName(ws_words,'bus03_infor'),mtConfirmation,[mbyes,mbno],0)=mryes	then
        begin
          delete;
          adoquery1.Next;
        end
        else
        begin          
          if adoquery1.RecNo=adoquery1.RecordCount then
          begin
            adoquery1.Delete;
            break;
          end
          else
            adoquery1.Delete;
        end;  
      end
      else
        adoquery1.next;
    end;
  end;
  if adoquery1.RecordCount<>0 then
  adoquery1.UpdateBatch(arAll);
  sb_save.Enabled:= false;
end;

procedure TFormBus03.TntDBGrid1Enter(Sender: TObject);
var
  SqlStr:WideString;
  year,mon:Integer;
begin
  if Adoquery1.State<>dsBrowse then
    exit;
  year:=StrToInt(leftstr(Adoquery1.fieldbyname('month').AsString,4));
  mon:=StrToInt(rightstr(Adoquery1.fieldbyname('month').AsString,2));
  SqlStr:='select * from hrd_car_out where use_dept='''+Adoquery1.fieldbyname('use_dept').AsString+''' ';
  SqlStr:=SqlStr+' and out_date>='''+DateToStr(EncodeDate(year,mon,1))+''' and out_date<='''+DateToStr(EncodeDate(year,mon,DaysInAMonth(year,mon)))+''' ';
  with adoquery2 do
  begin
    Close;
    sql.Clear;
    sql.Add(SqlStr);
    Open;
  end;
end;

procedure TFormBus03.MeMonthBeginEnter(Sender: TObject);
begin
  if TMaskEdit(sender).Text='' then
  begin
    TMaskEdit(sender).Text:=IntToStr(yearof(Date))+IntToStr(monthof(Date));
  end;
end;

end.
