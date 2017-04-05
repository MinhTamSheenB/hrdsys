{*************************************************************************
Name：Hrd16
Author: anil
Create date:2005-09-06
Modify date:2005-09-08
Commentate:員工通知面試列印
*************************************************************************}
unit UnitHrd16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils;

type
  TFormHrd16 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PrintDialog1: TPrintDialog;
    Panel5: TPanel;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    Panel2: TPanel;
    BtnQuery: TTntButton;
    BtnPrint: TTntBitBtn;
    DTPickBegin: TTntDateTimePicker;
    DTPickEnd: TTntDateTimePicker;
    ADOStoredProc1: TADOStoredProc;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1data_id: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1epid_no: TStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1mail_date: TDateTimeField;
    ADOQuery1re_date: TDateTimeField;
    ADOQuery1matr_date: TDateTimeField;
    ADOQuery2: TADOQuery;
    StringField2: TStringField;
    WideStringField1: TWideStringField;
    StringField3: TStringField;
    WideStringField2: TWideStringField;
    DataSource2: TDataSource;
    TntGroupBox2: TTntGroupBox;
    TntGroupBox3: TTntGroupBox;
    DBGrid2: TTntDBGrid;
    TntPanel1: TTntPanel;
    BtnAll: TTntButton;
    BtnNone: TTntButton;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BtnAllClick(Sender: TObject);
    procedure ADOQuery1re_dateChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd16: TFormHrd16;
  
implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  PrintFlag:boolean;
{$R *.dfm}

procedure TFormHrd16.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'hrd16');
  InitForm;// Init Form
end;

procedure TFormHrd16.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='sal10_titl,not_find_data,total,current_location,msg_must_same_month,'
  +'while_printing,print_finish,just_doing_empid,finish,msg_confirm_cancel2';
LangStr:=GetLangWideStrs(keys);
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormHrd16.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  DTPickBegin.Date:=date-2;
  DTPickEnd.Date:=date;
//  GetDeptRange(CobDeptBegin);
//  GetDeptRange(CobDeptEnd);
end;

procedure TFormHrd16.BtnPrintClick(Sender: TObject);
//打印內容設置
begin
  ADOQuery1.UpdateBatch();
  showPrint(ADOQuery2,GetLangName(LangStr,'hrd16_titl'));
end;

procedure TFormHrd16.BtnQueryClick(Sender: TObject);
var
  sql_str:string;
begin
  //RunThread := TRunThread.Create(false);
  if monthof(DTPickBegin.Date)<>monthof(DTPickEnd.Date) then
  begin
    WideShowMessage(GetLangName(Langstr,'msg_must_same_month'));
    exit;
  end;
  sql_str:='select * from hrd_person where '
   +' mail_date>='''+FormatDateTime('yyyy/mm/dd',DTPickBegin.date)+''''
   +' and mail_date<='''+FormatDateTime('yyyy/mm/dd',DTPickEnd.date)+'''';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  sql_str:=sql_str+' and re_date is not null';
  with ADOQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  BtnPrint.Enabled:=true;
end;

procedure TFormHrd16.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormHrd16.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
{*************************************************************************
TO DO:在DBGrid中畫多選框
*************************************************************************}
const
  CtrlState:array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  flag:boolean;
  a:string;
begin
  if Column.Index = 0 then
  begin
    PrintFlag:=false;
    a:=ADOQuery1.FieldByName('re_date').AsString;
    if (ADOQuery1.FieldByName('re_date').AsString<>'') then
      flag:= true
    else
      flag:=false;
    DrawFrameControl(DBGrid1.Canvas.Handle,Rect,DFC_BUTTON,CtrlState[FLAG]);
  end;
end;

procedure TFormHrd16.DBGrid1CellClick(Column: TColumn);
const
  CtrlState:array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  if Column.Index = 0 then
  begin
    with ADOQuery1 do
      begin
        edit;
        //FieldByName('valid_flag').AsBoolean:= not FieldByName('valid_flag').AsBoolean;
        if FieldByName('re_date').AsString='' then
        begin
          FieldByName('re_date').AsDateTime:=DateOf(GetServerDatetime);
        end
        else
        begin
          FieldByName('re_date').AsString:='';
        end;
        Post;  
      end;    
  end;
end;

procedure TFormHrd16.BtnAllClick(Sender: TObject);
{*************************************************************************
TO DO:全選/全不選
*************************************************************************}
begin
  with ADOQuery1 do
    begin
      first;
      while not EOF do
        begin
          Edit;
          if TTntBitBtn(Sender).name='BtnAll' then
          begin
            if FieldByName('re_date').AsString='' then
              FieldByName('re_date').AsDateTime:=DateOf(GetServerDatetime);
          end
          else
          begin
            if FieldByName('re_date').AsString<>'' then
              FieldByName('re_date').AsString:='';
          end;
          Next;
        end;
    end;
end;

procedure TFormHrd16.ADOQuery1re_dateChange(Sender: TField);
var
  data_id:string;
begin             
  With ADoQuery1 do
  begin
    data_id:=FieldByName('data_id').AsString;
    if FieldByName('re_date').AsString<>'' then
    begin
      //FieldByName('re_date').AsDateTime:=DateOf(GetServerDatetime);
      AdoQuery2.Append;
      AdoQuery2.FieldByName('data_id').AsString:=data_id;
      AdoQuery2.FieldByName('emp_chs').AsString:=FieldByName('emp_chs').AsString;
      AdoQuery2.FieldByName('name_vim').AsString:=FieldByName('name_vim').AsString;
      AdoQuery2.FieldByName('epid_no').AsString:=FieldByName('epid_no').AsString;
      AdoQuery2.Post;
    end
    else
    begin
      //FieldByName('re_date').AsString:='';
      if AdoQuery2.Locate('data_id',data_id,[loCaseInsensitive]) then
        AdoQuery2.Delete;
    end;
  end;
end;

end.
