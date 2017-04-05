{*************************************************************************
Name：dut14(部門月工時統計表)
Author: Leo                          
Create date:2005-10-04
Modify date:2005-10-07
Commentate:部門月工時統計表
*************************************************************************}
unit UnitDut14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,DateUtils,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient,math;
type
  TArr_Data=array [0..5] of double;
type
  TFormDut14 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    TntGroupBox1: TTntGroupBox;
    bb_reset: TTntBitBtn;
    bb_ok: TTntBitBtn;
    TntDBGrid1: TTntDBGrid;
    sb_Print: TTntSpeedButton;
    Label_month: TTntLabel;
    edit_month: TMaskEdit;
    ADOQuery2: TADOQuery;
    ADOQuery1dept_code: TStringField;
    ADOQuery1dept_titl: TWideStringField;
    ADOQuery1peop_num: TIntegerField;
    ADOQuery1normal_duty: TIntegerField;
    ADOQuery1overtime: TIntegerField;
    ADOQuery1total: TIntegerField;
    ADOQuery1average: TIntegerField;
    ADOQuery3: TADOQuery;
    ClientDataSet1: TClientDataSet;
    TntLabel1: TTntLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    me_DateBegin: TMaskEdit;
    me_DateEnd: TMaskEdit;
    sp_pub: TADOStoredProc;
    TntLabel2: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    TntRadioGroup1: TTntRadioGroup;
    rb_dept: TTntRadioButton;
    rb_factory: TTntRadioButton;
    ADOQueryEmp: TADOQuery;
    ADOQuery1stopTime: TIntegerField;
    ADOQuery1askTime: TIntegerField;
    ADOQuery1LeaveTime: TIntegerField;
    ClientDataSet1dept_code: TStringField;
    ClientDataSet1dept_titl: TWideStringField;
    ClientDataSet1act_num: TIntegerField;
    ClientDataSet1normal_duty: TIntegerField;
    ClientDataSet1overtime: TIntegerField;
    ClientDataSet1stopTime: TIntegerField;
    ClientDataSet1askTime: TIntegerField;
    ClientDataSet1LeaveTime: TIntegerField;
    ClientDataSet1total: TIntegerField;
    ClientDataSet1average: TIntegerField;
    ADOQuery1normalTime: TIntegerField;
    ClientDataSet1normalTime: TIntegerField;
    cobType: TTntComboBox;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure ByDeptCalcFields(deptCode,deptTitle,mon:wideString);
    procedure ByFactCalcFields(deptCode,deptTitle,mon,DeptRange:wideString);
    function  GetNDuty(deptCode,mon:string):TArr_Data;
    procedure sb_PrintClick(Sender: TObject);
    procedure GetData;
    function GetDeptTitle(deptcode:string):WideString;
    function GetDeptRange(deptcode:string):String;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure edit_monthChange(Sender: TObject);
    procedure bb_resetClick(Sender: TObject);
    procedure bb_okClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut14: TFormDut14;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  MaxDays:integer;
  Arr_Data:TArr_Data;
{$R *.dfm}

procedure TFormDut14.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
  keys:='while_printing,dut14_titl,print_finish,date_error,read_data_complete'+
     ',Calculating_dept,dut05_depterror';
  LangStr:=GetLangWideStrs(keys);
  SetComponentLang(self);
end;                        

procedure TFormDut14.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  UnitHrdUtils.GetDeptRange(CobDeptBegin);
  UnitHrdUtils.GetDeptRange(CobDeptEnd);
 //
end;

procedure TFormDut14.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(username,'dut14');
  InitLang;// Init language
  InitForm;// Init Form
end;

procedure TFormDut14.edit_monthChange(Sender: TObject);
begin
  if length(edit_month.Text)<>6 then
    exit;
  bb_ok.Enabled := true;
  bb_reset.Enabled := true;
  edit_month.Enabled := false;
  maskedit1.Text :=edit_month.Text;
  maskedit2.Text :=edit_month.Text;
  me_DateBegin.Text :='01';
  MaxDays := DaysInAMonth(strtoint(leftstr(edit_month.Text,4)),strtoint(rightstr(edit_month.Text,2)));
  me_DateEnd.Text := inttostr(MaxDays);

end;

procedure TFormDut14.bb_resetClick(Sender: TObject);
begin
  edit_month.Enabled := true;
  //edit_month.Text :='';
  //bb_ok.Enabled := false;
  bb_ok.Enabled := true;
  bb_reset.Enabled := false;
  rb_dept.Enabled := true;
  rb_factory.Enabled := true;
  //sb_preview.Enabled := false;
  sb_print.Enabled := false;
  {maskedit1.Text :='';
  maskedit2.Text :='';
  me_DateBegin.Text := '';
  me_DateEnd.Text := '';}
  me_DateBegin.Enabled := true;
  me_DateEnd.Enabled := true;
  ClientDataset1.Close;
end;

procedure TFormDut14.bb_okClick(Sender: TObject);
var
  SqlStr,S_Date,E_Date:string;
begin
   {if (me_DateBegin.Text='') or  (me_DateEnd.Text='') or (strtoint(me_DateBegin.Text)>strtoint(me_DateEnd.Text)) or (strtoint(me_DateEnd.Text)>MaxDays) then
  begin
    wideshowmessage(GetLangName(LangStr,'date_error'));//'日期範圍輸入有誤！');
    exit;
  end;}
  if (CobDeptBegin.Text>CobDeptEnd.Text) then
  begin
    wideshowmessage(GetLangName(LangStr,'dut05_depterror'));//'bumen範圍輸入有誤！');
    exit;
  end;
  ClientDataSet1.Close;
  ClientDataSet1.CreateDataSet;
  if rb_dept.Checked then
  begin
    //SqlStr := 'select dept_code,dept_titl from hrd_dept order by dept_code';
    with sp_pub do
    //with ADOQueryEmp do
    begin
      ProcedureName:='proc_dept;1';
      Parameters.ParamByName('@dept_begin').Value := leftstr(CobDeptBegin.Text,6);
      Parameters.ParamByName('@dept_end').Value := leftstr(CobDeptEnd.Text,6);
      Parameters.ParamByName('@year_month').Value := edit_month.Text;
      Open;
      ClientDataSet1.Active := true;
      while not eof do
      begin
        //計算字段函數
        ByDeptCalcFields(fieldbyname('dept_code').Value,fieldbyname('dept_titl').Value,edit_month.Text);
        next;
      end;
      close;
    end;
    DataSource1.DataSet := ClientDataSet1;
  end;
  if rb_factory.Checked then
  begin
    GetData;
    DataSource1.DataSet := ClientDataSet1;
  end;
  rb_dept.Enabled := false;
  rb_factory.Enabled := false;
  bb_Reset.Enabled := true;
  bb_ok.Enabled := false;
  me_DateBegin.Enabled := false;
  me_DateEnd.Enabled := false;
  //sb_preview.Enabled := true;
  sb_print.Enabled := true;
  SetStatusText(GetLangName(LangStr,'read_data_complete'));//'資料讀取完成');
end;

procedure TFormDut14.ByDeptCalcFields(deptCode,deptTitle,mon:wideString);
var
  EmpId,sqlstr,S_Date,E_Date:string;
  NDuty,OTime,Total,Avr:double;
  ActNum:integer;
  ADut:TArr_Data;
begin
  SetStatustext(GetLangName(LangStr,'Calculating_dept')+deptCode+' '+deptTitle);
  S_Date:=FormatDateTime('yyyy/mm/dd',EncodeDate(StrToInt(LeftStr(MaskEdit1.Text,4)),StrToInt(RightStr(MaskEdit1.Text,2)),StrToInt(me_DateBegin.Text)));
  E_Date:=FormatDateTime('yyyy/mm/dd',EncodeDate(StrToInt(LeftStr(MaskEdit2.Text,4)),StrToInt(RightStr(MaskEdit2.Text,2)),StrToInt(me_DateEnd.Text)));
  sqlstr:='select * from hrd_emp A where A.dept_code='''+DeptCode+''''
      //+' A.dept_code>='''+LeftStr(CobDeptBegin.Text,6)+''''
      //+' and A.dept_code<='''+LeftStr(CobDeptEnd.Text,6)+''''
      +' and epindt<'''+E_date+''' and (epledt is null or epledt>='''+S_date+''')';
  if LeftStr(CobType.Text,1)='1' then
    sqlstr:=sqlstr+' and pst_code=''60''';
  if LeftStr(CobType.Text,1)='2' then
    sqlstr:=sqlstr+' and pst_code<>''60''';
  if LeftStr(CobType.Text,1)='3' then
    sqlstr:=sqlstr+' and pst_code=''60''';
  if LeftStr(CobType.Text,1)='4' then
    sqlstr:=sqlstr+' and pst_code > ''22'' and  pst_code<''60''';
  with adoquery2 do
  begin
    sql.Clear;
    sql.Add(sqlstr);//'select * from hrd_emp where dept_code>='''+
            //leftstr(CobDeptBegin.text,6)+''' and dept_code<='''+
            //leftstr(CobDeptEnd.text,6)+''' and (dept_code='''+deptCode+''')');//    and (epledt is null)
    Open;
    if eof then
    begin
      setstatustext('');
      SetProcessBar;
      exit;
    end;
    NDuty := 0;
    Otime := 0;
    Total := 0;
    Avr := 0;
    ActNum := RecordCount;
    if RecordCount = 0 then
    begin
      with ClientDataSet1 do
      begin
        Append;
        FieldByName('dept_code').Value:=DeptCode;
        FieldByName('dept_titl').Value:=DeptTitle;
        FieldByName('act_num').AsInteger:= 0;//ActNum;
        FieldByName('normal_duty').AsInteger:= 0;//NDuty;
        FieldByName('overtime').AsInteger:= 0;//Otime;
        FieldByName('total').AsInteger:= 0;//Total;
        FieldByName('average').AsInteger:= 0;//Avr;
      end;
      exit;
    end;  
    First;
    SetProcessBar(true,1,RecordCount);
    SetStatustext(GetLangName(LangStr,'Calculating_dept')+deptCode+' '+deptTitle+'  '+inttostr(RecNo)+'/'+inttostr(RecordCount));
    {while not eof do
    begin
      SetProcessBar(false,1);
      SetStatustext(GetLangName(LangStr,'Calculating_dept')+deptCode+' '+deptTitle+'  '+inttostr(RecNo)+'/'+inttostr(RecordCount));
      EmpId := FieldByName('emp_id').Value;
//      NDuty := NDuty+GetNDuty(EmpId,'N',mon);
//      Otime := Otime+GetNDuty(EmpId,'O',mon);
      next;
    end;}
  end;
  ADut:=GetNDuty(DeptCode,mon);
  Total := ADut[0]+ADut[1]+ADut[2]+ADut[3]+ADut[4];
  Avr := int(Total / ActNum);
  with ClientDataSet1 do
  begin
    Append;
    FieldByName('dept_code').Value:=DeptCode;
    FieldByName('dept_titl').Value:=DeptTitle;
    FieldByName('act_num').AsInteger:= ActNum;
    FieldByName('normal_duty').AsFloat:= ADut[0];
    FieldByName('overtime').AsFloat:= ADut[1];
    FieldByName('stoptime').AsFloat:= ADut[2];
    FieldByName('asktime').AsFloat:= ADut[3];
    FieldByName('leavetime').AsFloat:= ADut[4];
    FieldByName('normaltime').AsFloat:= ADut[5];
    FieldByName('total').AsFloat:= Total;
    FieldByName('average').AsFloat:= Avr;
  end;
  SetStatustext('');
  SetProcessBar;
end;

function Tformdut14.GetNDuty(deptCode,mon:string):TArr_Data;
//正常班 "61", "62", "63"
//加班  "65", "66", "67", "68", "69"
//停工  "44", "54", "64"
//請假  "08"--"25"
//曠工  "06"
var
  i,h,m,s_fld,e_fld:integer;
  Adut:TArr_Data;
  OnceTime:double;
  clas_code,SqlStr,pre_emp,empId:string;
  MinDate,MaxDate,SDate,EDate:TDateTime;
begin
  for i:=0 to 5 do
  begin
    Adut[i]:=0;
  end;
  pre_emp:='';
  SDate:=EncodeDate(StrToInt(LeftStr(MaskEdit1.Text,4)),StrToInt(RightStr(MaskEdit1.Text,2)),StrToInt(me_DateBegin.Text));
  EDate:=EncodeDate(StrToInt(LeftStr(MaskEdit2.Text,4)),StrToInt(RightStr(MaskEdit2.Text,2)),StrToInt(me_DateEnd.Text));
  SqlStr:='select * from hrd_dut_mon A,hrd_emp B where A.emp_id=B.emp_id'
    +' and dut_mon='''+mon+''' and dept_code='''+DeptCode+'''';
  if MaskEdit1.Text<>MaskEdit2.Text then
  begin//跨月數據
  SqlStr:='select * from hrd_dut_mon A,hrd_emp B where A.emp_id=B.emp_id'
    +' and (dut_mon='''+MaskEdit1.Text+''' or dut_mon='''+MaskEdit2.Text+''')'
    +' and dept_code='''+DeptCode+'''';
  end;
  sqlstr:=sqlstr+' and epindt<'''+FormatDateTime('yyyy/mm/dd',Edate)+''''
    +' and (epledt is null or epledt>='''+FormatDateTime('yyyy/mm/dd',Sdate)+''')';
  if LeftStr(CobType.Text,1)='1' then//直接員工
    sqlstr:=sqlstr+' and B.pst_code=''60''';
  if LeftStr(CobType.Text,1)='2' then//閒接員工
    sqlstr:=sqlstr+' and B.pst_code<>''60''';
  sqlstr:=sqlstr+' order by A.emp_id,A.clas_code';
  with adoquery3 do
  begin
    sql.Clear;
    sql.Add(SqlStr);
    Open;
    First;
    h:=0;
    m:=0;
    while not eof do
    begin
      OnceTime:=0;
      clas_code:=FieldByName('clas_code').AsString;//班別代號
      empId:=FieldByName('emp_id').AsString;
      if empId<>pre_emp then
      begin//標準工時
        MinDate:=max(SDate,FieldByName('epindt').AsDateTime);
        if FieldByName('epledt').AsDateTime=0 then
          MaxDate:=EDate
        else
          MaxDate:=min(EDate,FieldByName('epledt').AsDateTime-1);
        Adut[5]:=Adut[5]+(MaxDate-MinDate+1-GetRestDayCount(MinDate,MaxDate))*8;
      end;
      //for i:= 4+strtoint(me_DateBegin.Text) to 4+strtoint(me_DateEnd.Text) do
      s_fld:=4+DayOf(MinDate);
      e_fld:=4+DayOf(MaxDate);
      if MaskEdit1.Text<>MaskEdit2.Text then
      begin//跨月處理
        if FieldByName('dut_mon').AsString=trim(MaskEdit1.Text) then
          e_fld:=4+31;
        if FieldByName('dut_mon').AsString=trim(MaskEdit2.Text) then
          s_fld:=4+1;
      end;
      for i:= s_fld to e_fld do
      begin
        if (fields[i].Value <> null) and (fields[i].Value <> '') then
        begin
          h := strtoint(leftstr(fields[i].AsString,2));
          m := strtoint(rightstr(fields[i].AsString,2));
          OnceTime:=OnceTime + h + (m/60);
        end;
      end;
      OnceTime:=Int(OnceTime);
      if AnsiContainsStr('61|62|63',clas_code) then//正常班
        Adut[0]:=Adut[0]+OnceTime
      else if AnsiContainsStr('65|66|67|68|69',clas_code) then//加班
        Adut[1]:=Adut[1]+OnceTime
      else if AnsiContainsStr('44|54|64',clas_code) then//停工
        Adut[2]:=Adut[2]+OnceTime
      else if (clas_code>='08') and (clas_code<='25') then//請假
        Adut[3]:=Adut[3]+OnceTime
      else if clas_code='06' then//曠工
        Adut[4]:=Adut[4]+OnceTime;
      pre_emp:=empId;
      next;
    end;
  end;
  //Adut[0]:=h+(m div 60);
  result := Adut;
end;


procedure TFormDut14.sb_PrintClick(Sender: TObject);
var
  Title,footer:widestring;
begin
  SetStatusText(GetLangName(LangStr,'while_printing'));
  Title := leftstr(edit_month.text,4)+'/'+rightstr(edit_month.text,2)+GetLangName(LangStr,'dut14_titl');//'月工時統計表';
  footer:='列印時間:'+formatDatetime('yyyy/mm/dd hh:nn:ss',getserverdatetime);
  ShowPrint(TCustomADODataset(Clientdataset1),Title,footer);
  SetStatusText(GetLangName(LangStr,'print_finish'));
end;

procedure TFormDut14.GetData;
var
  DeptRange:String;
  DeptTitle:WideString;
  i:integer;
begin
  //協理室
  DeptRange :='''V00016'',''V00017'',''V00020''';
  DeptTitle := GetDeptTitle('V00016');
  ByFactCalcFields('V00016',DeptTitle,edit_month.Text,DeptRange);
  //工會
  DeptRange :='''V00018''';
  DeptTitle := GetDeptTitle('V00018');
  ByFactCalcFields('V00018',DeptTitle,edit_month.Text,DeptRange);
  //V00100 ~ V00800
  for i:=1 to 8 do
  begin
    if i=7 then
      continue;
    DeptRange := GetDeptRange('V00'+inttostr(i)+'00');
    if i=2 then
      DeptTitle := leftstr(GetDeptTitle('V00'+inttostr(i)+'00'),5)
    else
      DeptTitle := GetDeptTitle('V00'+inttostr(i)+'00');
    ByFactCalcFields('V00'+inttostr(i)+'00',DeptTitle,edit_month.Text,DeptRange);
  end;
  //V09000 越南業務技術課
  DeptRange := GetDeptRange('V09');
  DeptTitle := GetDeptTitle('V09000');
  ByFactCalcFields('V09000',DeptTitle,edit_month.Text,DeptRange);
  //V06300 越南業務課
  DeptRange := GetDeptRange('V063');
  DeptTitle := leftstr(GetDeptTitle('V06300'),5);
  ByFactCalcFields('V06300',DeptTitle,edit_month.Text,DeptRange);
  //V07000  越南采購課
  DeptRange := GetDeptRange('V070');
  DeptTitle := GetDeptTitle('V07000');
  ByFactCalcFields('V07000',DeptTitle,edit_month.Text,DeptRange);
  //V10 V2管理部
  DeptRange := GetDeptRange('V1');
  DeptTitle := GetDeptTitle('V10000');
  ByFactCalcFields('V10000',DeptTitle,edit_month.Text,DeptRange);
  //V20000 財務
  DeptRange := GetDeptRange('V2');
  DeptTitle := GetDeptTitle('V20000');
  ByFactCalcFields('V20000',DeptTitle,edit_month.Text,DeptRange);
  //V30000《V4 生管
  DeptRange := GetDeptRange('V3');
  DeptTitle := GetDeptTitle('V30000');
  ByFactCalcFields('V30000',DeptTitle,edit_month.Text,DeptRange);
  //V40000  LIEAN管制課
  DeptRange := GetDeptRange('V4');
  DeptTitle := GetDeptTitle('V40000');
  ByFactCalcFields('V40000',DeptTitle,edit_month.Text,DeptRange);
  //V50000 《V60000  廠務經理室
  DeptRange := GetDeptRange('V5');
  DeptTitle := GetDeptTitle('V50000');
  ByFactCalcFields('V50000',DeptTitle,edit_month.Text,DeptRange);
  //VA VB VC VD VE
  DeptRange := GetDeptRange('VA');
  DeptTitle := GetDeptTitle('VA0000');
  ByFactCalcFields('VA0000',DeptTitle,edit_month.Text,DeptRange);

  DeptRange := GetDeptRange('VB');
  DeptTitle := GetDeptTitle('VB0000');
  ByFactCalcFields('VB0000',DeptTitle,edit_month.Text,DeptRange);

  DeptRange := GetDeptRange('VC');
  DeptTitle := GetDeptTitle('VC0000');
  ByFactCalcFields('VC0000',DeptTitle,edit_month.Text,DeptRange);

  DeptRange := GetDeptRange('VD');
  DeptTitle := GetDeptTitle('VD4000');
  ByFactCalcFields('VD4000',DeptTitle,edit_month.Text,DeptRange);

  DeptRange := GetDeptRange('VE');
  DeptTitle := GetDeptTitle('VE0000');
  ByFactCalcFields('VE0000',DeptTitle,edit_month.Text,DeptRange);
end;

function TformDut14.GetDeptTitle(deptcode:string):WideString;
begin
  with AdoQuery3 do
  begin
    Sql.clear;
    sql.add('select dept_titl from hrd_dept where dept_code='''+deptcode+''' ');
    Open;
    if not eof then
      result := fieldbyname('dept_titl').value
    else
      result :=' ';
    close;
  end;
end;

function TformDut14.GetDeptRange(deptcode:string):String;
var
  i:integer;
begin
  i:=length(deptcode);
  with AdoQuery3 do
  begin
    Sql.clear;
    sql.add('select dept_code from hrd_dept where dept_code>='''+
        leftstr(CobDeptBegin.Text,6)+''' and dept_code<='''+
        leftstr(CobDeptEnd.Text,6)+''' and left(dept_code,'+
        inttostr(i)+')='''+deptcode+'''');
    Open;
    if eof then
    begin
      result:='';
      close;
      exit;
    end;
    while not eof do
    begin
      if RecNo=1 then
        result := ''''+fieldbyname('dept_code').value+''''
      else
        result := result+','''+fieldbyname('dept_code').value+'''';
      next;
    end;
    close;
  end;
end;

procedure TFormDut14.ByFactCalcFields(deptCode,DeptTitle,mon,DeptRange:wideString);
var
  EmpId:string;
  ActNum,NDuty,OTime,Total,Avr:integer;
begin
  if DeptRange='' then
    exit;
  with adoquery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_emp where dept_code>='''+leftstr(CobDeptBegin.Text,6)+''' and dept_code<='''+leftstr(CobDeptEnd.Text,6)+''' and dept_code in ('+DeptRange+')  ');  //    and epledt is null
    //tntedit1.Text := sql.Text;
    Open;
    if eof then
    begin
      SetStatustext('');
      SetProcessBar;
      exit;
    end;
   //exit;
    NDuty := 0;
    Otime := 0;
    Total := 0;
    Avr := 0;
    ActNum := RecordCount;
    if RecordCount = 0 then
    begin
      with ClientDataSet1 do
      begin
        Append;
        FieldByName('dept_code').Value:=DeptCode;
        FieldByName('dept_titl').Value:=DeptTitle;
        FieldByName('act_num').AsInteger:= ActNum;
        FieldByName('normal_duty').AsInteger:= NDuty;
        FieldByName('overtime').AsInteger:= Otime;
        FieldByName('total').AsInteger:= Total;
        FieldByName('average').AsInteger:= Avr;
      end;
      exit;
    end;
    First;
    SetProcessBar(true,1,RecordCount);
    SetStatustext(GetLangName(LangStr,'Calculating_dept')+deptCode+' '+deptTitle+'  '+inttostr(RecNo)+'/'+inttostr(RecordCount));
    while not eof do
    begin
      SetProcessBar(false,1);
      SetStatustext(GetLangName(LangStr,'Calculating_dept')+deptCode+' '+deptTitle+'  '+inttostr(RecNo)+'/'+inttostr(RecordCount));
      EmpId := FieldByName('emp_id').Value;
      {NDuty := NDuty+GetNDuty(EmpId,mon);
      Otime := Otime+GetNDuty(EmpId,,mon);}
      next;
    end;
  end;
  Total := NDuty + Otime;
  Avr := Total div ActNum;
  with ClientDataSet1 do
  begin
    Append;
    FieldByName('dept_code').Value:=DeptCode;
    FieldByName('dept_titl').Value:=DeptTitle;
    FieldByName('act_num').AsInteger:= ActNum;
    FieldByName('normal_duty').AsInteger:= NDuty;
    FieldByName('overtime').AsInteger:= Otime;
    FieldByName('total').AsInteger:= Total;
    FieldByName('average').AsInteger:= Avr;
  end;
  SetStatustext('');
  SetProcessBar;
end;

procedure TFormDut14.FormDestroy(Sender: TObject);
begin
  setStatusText('');
  SetProcessBar;
end;

end.
