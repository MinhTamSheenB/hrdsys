{*************************************************************************
Name：hrd15
Author: anil
Create date:2005-11-10
Modify date:2005-11-10
Commentate:工團作業
*************************************************************************}
unit UFhrd201;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils;

type
  TArrGrid = array of array of string;//  array[1..1,1..1]   of   boolean;
type//時段信息
  TSegInfo = record
    SegId:string;
    SegText:string;
    money:double;
end;
type
  TArrSegInfo = array[0..4] of TSegInfo;//  array[1..1,1..1]   of   boolean;

type
  TFormFhrd201 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel6: TTntLabel;
    edit_begin: TTntEdit;
    edit_end: TTntEdit;
    PanelGrid: TPanel;
    PanelAct: TTntPanel;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    ADOQuery1: TADOQuery;
    Btn_Search: TTntBitBtn;
    TntLabel10: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    EditMon: TTntEdit;
    TntLabel7: TTntLabel;
    StringGrid1: TStringGrid;
    TntPanel1: TTntPanel;
    Rb02: TRadioButton;
    Rb03: TRadioButton;
    Rb04: TRadioButton;
    Rb00: TRadioButton;
    bbtn_Set: TTntBitBtn;
    Rb01: TRadioButton;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure InitArrGrid;
    function GetSegInfo(ASegId:string='';Atext:string=''):TSegInfo;
    procedure SetActEnabled(modify_Flag:boolean=true);
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure bbtn_SetClick(Sender: TObject);
    procedure Rb00Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFhrd201: TFormFhrd201;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  can_post:boolean;
  TheMoney:double;
  TheSegId,TheSegText,TheMon:string;
  ArrGrid :TArrGrid;
  ArrSegInfo:TArrSegInfo;
{$R *.dfm}

procedure TFormFhrd201.FormCreate(Sender: TObject);
//初始化
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'fhrd201');//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;

procedure TFormFhrd201.InitLang;
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
  +'sex_man,sex_woman';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');     
LangV:=GetLangWideStrs(keys,'V');        
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;

procedure TFormFhrd201.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  SqlStr:string;
  i:integer;
begin
  SqlStr:='select dept_code+'' ''+abbr_titl from hrd_dept ';
  SetComboxList(sqlStr,CobDeptBegin);
  SetComboxList(sqlStr,CobDeptEnd);
  CobDeptBegin.ItemIndex:=0;
  CobDeptEnd.ItemIndex:=CobDeptEnd.Items.Count-1;
  EditMon.Text :=FormatDateTime('yyyymm',date);
  with StringGrid1 do
  begin
    ColWidths[0]:=80;
    Cells[0,0]:='工號(姓名)';
    for i:=1 to 31 do
    begin
      Cells[i,0]:=intToStr(i);
    end;
  end;
  ArrSegInfo[0].SegId:='';
  ArrSegInfo[0].SegText:='';
  ArrSegInfo[0].money:=0;
  ArrSegInfo[1].SegId:='01';
  ArrSegInfo[1].SegText:='白';
  ArrSegInfo[1].money:=0;
  ArrSegInfo[2].SegId:='02';
  ArrSegInfo[2].SegText:='中';
  ArrSegInfo[2].money:=0.8;
  ArrSegInfo[3].SegId:='03';
  ArrSegInfo[3].SegText:='晚';
  ArrSegInfo[3].money:=1.6;
  ArrSegInfo[4].SegId:='04';
  ArrSegInfo[4].SegText:='夜';
  ArrSegInfo[4].money:=2.4;
  TheSegid:='';
  TheSegText:='';
  Themoney:=0;
end;

procedure TFormFhrd201.Btn_SearchClick(Sender: TObject);
//查詢數據
var
  sql_str,where_str,SDate,EDate,emp_id:string;
  ADate:TDateTime;
  TheDay,i,j:integer;
begin
  TheMon:=trim(editMon.Text);
  ADate:=EnCodeDate(StrToInt(LeftStr(TheMon,4)),StrToInt(RightStr(TheMon,2)),1);
  SDate:=FormatDateTime('yyyy/mm/dd',ADate);
  ADate:=EndOfTheMonth(ADate);
  EDate:=FormatDateTime('yyyy/mm/dd',ADate);
  StringGrid1.ColCount:=DayOf(ADate)+1;//grid列數
  sql_str:='select * from fhrd_emp A where emp_etdt<='''+EDate+''''
    +' and (emp_ledt is null or emp_ledt>'''+SDate+''')';
  if trim(edit_begin.text)<>'' then
    where_str:=where_str+' and emp_id>=''' +trim(edit_begin.text)+'''';
  if trim(edit_end.text)<>'' then
    where_str:=where_str+' and emp_id<=''' +trim(edit_end.text)+'''';
  if CobDeptBegin.Text<>'' then
    where_str:=where_str+' and dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if CobDeptEnd.Text<>'' then
    where_str:=where_str+' and dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  sql_str:=sql_str+where_str;
  with Adoquery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  StringGrid1.RowCount:=Adoquery1.RecordCount+1;//grid行數
  for i:=1 to StringGrid1.RowCount do//重置stringgrid
    for j:=1 to StringGrid1.ColCount do
      StringGrid1.Cells[j,i]:='';
  SetProcessBar(true,1,Adoquery1.RecordCount);
  while not Adoquery1.Eof do//stringgrid填充數據
  begin
    SetProcessBar(false,1);
    emp_id:=Adoquery1.FieldByName('emp_id').AsString;
    StringGrid1.Cells[0,Adoquery1.RecNo]:=emp_id+'-'+Adoquery1.FieldByName('emp_name').AsString;
    sql_str:='select * from fhrd_arr where emp_id='''+emp_id+''''
      +' and arr_date>='''+SDate+''' and arr_date<='''+EDate+''' order by arr_date';
    with DMHrdsys.SQLQuery3 do
    begin
      close;
      sql.Clear;
      sql.Add(sql_str);
      open;
      while not Eof do
      begin
        TheDay:=DayOf(FieldByName('arr_date').AsDateTime);
        StringGrid1.Cells[TheDay,Adoquery1.RecNo]:=GetSegInfo(FieldByName('seg_id').AsString).SegText;
        Next;
      end;
      Adoquery1.next;
    end;
  end;
  setStatusText(GetLangName(LangStr,'total')+':'+inttostr(StringGrid1.RowCount-1));
  SetProcessBar;
  setlength(ArrGrid,StringGrid1.RowCount+1,StringGrid1.ColCount+1);
  InitArrGrid;
end;

procedure TFormFhrd201.SetActEnabled(Modify_Flag:boolean=true);
//設置功能按鈕是否可用
var
  status:boolean;
begin
  status:=true;
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;

procedure TFormFhrd201.bbtn_SetClick(Sender: TObject);
//改變選中cell值
var
  i,j:integer;
begin
  with StringGrid1 do
  begin
    for i:=Selection.Left to Selection.Right do
      for j:=Selection.Top to Selection.Bottom do
      begin
       Cells[i,j]:=TheSegText;
      end;
  end;
  SetActEnabled(true);       
end;

procedure TFormFhrd201.Rb00Click(Sender: TObject);
//取得選擇的時段
var
  TheSeg:TSegInfo;
begin
  TheSegid:=RightStr(TRadioButton(Sender).Name,2);
  TheSegText:='';
  Themoney:=0;
  TheSeg:=GetSegInfo(TheSegId);
  TheSegText:=TheSeg.SegText;
  Themoney:=TheSeg.money;
end;

procedure TFormFhrd201.InitArrGrid;
//記錄grid初始值
var
  i,j:integer;
begin
  for i:=1 to StringGrid1.RowCount do
    for j:=1 to StringGrid1.ColCount do
      ArrGrid[i,j]:=StringGrid1.Cells[j,i];
end;

procedure TFormFhrd201.sb_RecoverClick(Sender: TObject);
//cancel all dataset modify
var
  i,j:integer;
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  for i:=1 to StringGrid1.RowCount do
    for j:=1 to StringGrid1.ColCount do
      StringGrid1.Cells[j,i]:=ArrGrid[i,j];
  SetActEnabled(false);
end;

procedure TFormFhrd201.sb_SaveClick(Sender: TObject);
//save all dataset
var
  i,j,count:integer;
  AStr,emp_id,seg_id,arr_date:string;
  money:double;
  ADate:TDateTime;
  TheSeg:TSegInfo;
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  SetStatusText('正在保存數據,請等待...');
  AStr:='';
  count:=0;
  SetProcessBar(true,1,StringGrid1.RowCount*StringGrid1.ColCount);
  for i:=1 to StringGrid1.RowCount do
    for j:=1 to StringGrid1.ColCount do
    begin
      SetProcessBar(false,1);
      if ArrGrid[i,j]<>StringGrid1.Cells[j,i] then
      begin
        count:=count+1;
        emp_id:=LeftStr(StringGrid1.Cells[0,i],6);
        ADate:=EnCodeDate(StrToInt(LeftStr(TheMon,4)),StrToInt(RightStr(TheMon,2)),j);
        arr_date:=formatDateTime('yyyy/mm/dd',ADate);
        TheSeg:=GetSegInfo('',StringGrid1.Cells[j,i]);//根據顯示標簽取時段信息
        AStr:=AStr+'delete from fhrd_arr where emp_id='''+emp_id+''''
          +' and arr_date='''+arr_date+''';';
        if TheSeg.SegId<>'' then
         AStr:=AStr+'insert into fhrd_arr(upd_user,emp_id,seg_id,arr_date,money)'
          +' values('''+username+''','''+emp_id+''','''+TheSeg.SegId+''','
          +' '''+arr_date+''','+floatToStr(TheSeg.money)+');';
        if (count mod 50 =0) and (count>0) then
        begin
          with DMHrdsys.ADOCommand1 do
          begin
            CommandText:=AStr;
            Execute;
          end;
          AStr:='';
        end;
      end;
    end;
  if AStr<>'' then
    with DMHrdsys.ADOCommand1 do
    begin
      CommandText:=AStr;
      Execute;
    end;
  WideShowMessage('保存完成');
  InitArrGrid;
  SetActEnabled(false);
  SetProcessBar;
  SetStatusText('');
end;

function TFormFhrd201.GetSegInfo(ASegId:string='';Atext:string=''):TSegInfo;
//取時段信息
var
  i:integer;
  isFind:boolean;
begin
  isFind:=false;
  for i:=1 to 4 do
  begin
    if ASegId<>'' then
    begin
      if ArrSegInfo[i].SegId=ASegId then
      begin
        isFind:=true;
        break;
      end;
    end;
    if Atext<>'' then
    begin
      if ArrSegInfo[i].SegText=Atext then
      begin
        isFind:=true;
        break;
      end;
    end;
  end;
  if isFind then
    result:=ArrSegInfo[i]
  else
    result:=ArrSegInfo[0];
end;

procedure TFormFhrd201.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
//標誌星期天
var
  TheDate:TDateTime;
begin
  if Length(TheMon)=6 then
   if TryEnCodeDate(StrToInt(LeftStr(TheMon,4)),StrToInt(RightStr(TheMon,2)),ACol,TheDate) then
    if (ACol <> 0) and (ARow <> 0 ) and (DayOfWeek(TheDate)=1) then
    begin
      StringGrid1.Canvas.Brush.Color := clMoneyGreen;
      StringGrid1.Canvas.TextRect(Rect,Rect.Left + 1, Rect.Top + 2,StringGrid1.Cells[ACol,ARow]);
     end;
end;

end.
