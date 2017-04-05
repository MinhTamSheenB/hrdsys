{*************************************************************************
Name：Fhrd217 (copy from dut16)
Author: anil
Create date:2005-09-06
Modify date:2005-09-08
Commentate:個人考勤明細報表
*************************************************************************}
unit ufhrd217;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
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
   TExcelThread = class(TThread)
  protected
        procedure execute;override;
  end;
type
  TFormFhrd217 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PrintDialog1: TPrintDialog;
    Panel5: TPanel;
    PanelGrid: TPanel;
    TntDBGrid1: TTntDBGrid;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    RbEmp: TTntRadioButton;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    RbDept: TTntRadioButton;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    Panel2: TPanel;
    BtnQuery: TTntButton;
    BtnPrint: TTntBitBtn;
    DTPickBegin: TTntDateTimePicker;
    DTPickEnd: TTntDateTimePicker;
    BtnCancel: TTntButton;
    ADOQuery1emp_id: TWideStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1department: TWideStringField;
    ADOQuery1work_date: TDateTimeField;
    ADOQuery1week_day: TWideStringField;
    ADOQuery1clas_chs: TWideStringField;
    ADOQuery1casting_b: TStringField;
    ADOQuery1casting_e: TStringField;
    ADOQuery1late: TStringField;
    ADOQuery1early: TStringField;
    ADOQuery1work_time: TStringField;
    ADOQuery1over_time: TStringField;
    ADOQuery1left_time: TStringField;
    ADOQuery1out_time: TStringField;
    ADOQuery1ab_time: TStringField;
    ADOQuery1ab_code: TStringField;
    BtnPrtExcel: TTntBitBtn;
    ADOStoredProc1: TADOStoredProc;
    TntRadioGroup1: TTntRadioGroup;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure SetPrintDataset;
    procedure PrintTip(PrintFlag:boolean);
    procedure GetEmp();
    procedure GetDayTable();
    procedure GetDayEmp();
    procedure SetTime();
    procedure AppendMastRecord();
    procedure CreateTmpDB(table_name:string;is_drop:boolean=false);
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure sb_FindEmpClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure BtnQueryClick(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure CobDeptBeginChange(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure ADOQuery1week_dayGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BtnPrtExcelClick(Sender: TObject);
    procedure EditEmpBeginChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFhrd217: TFormFhrd217;
  RunThread :TRunThread;
  
implementation
uses
  UnitHrdUtils,unitDMHrdsys, comobj;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  n_late,n_early:integer;
  work_time,over_time,left_time,out_time,ab_time:double;
  emp_id,clas_chs,real_start,real_end,ab_code:string;
  wrk_date:Tdatetime;
  ExcelThread:TExcelThread;
{$R *.dfm}

procedure TFormFhrd217.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'fhrd17');
  InitForm;// Init Form
end;

procedure TFormFhrd217.InitLang;
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

procedure TFormFhrd217.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  DTPickBegin.Date:=StartOfTheMonth(date);
  DTPickEnd.Date:=EndOfTheMonth(date);
  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
end;

procedure TFormFhrd217.GetEmp();
begin
  with ADOStoredProc1 do
  begin
    close;
    with Parameters do
    begin
      ParamByName('@year_month').Value:=formatdatetime('yyyymm',DTPickBegin.date);
      if rbemp.Checked then
      begin
        ParamByName('@dept_begin').Value:='';
        ParamByName('@dept_end').Value:='';
        if EditEmpBegin.Text<>'' then
          ParamByName('@emp_begin').Value:=EditEmpBegin.Text
        else
          ParamByName('@emp_begin').Value:='';
        if EditEmpEnd.Text<>'' then
          ParamByName('@emp_end').Value:=EditEmpEnd.Text
        else
          ParamByName('@emp_end').Value:='';
      end;
      if (rbDept.Checked) and ((CobDeptBegin.Text<>'') or (CobDeptEnd.Text<>'')) then
      begin
        ParamByName('@emp_begin').Value:='';
        ParamByName('@emp_end').Value:='';
        if CobDeptBegin.Text<>'' then
          ParamByName('@dept_begin').Value:=CobDeptBegin.Text
        else
          ParamByName('@dept_begin').Value:='';
        if CobDeptEnd.Text<>'' then
          ParamByName('@dept_end').Value:=CobDeptEnd.Text
        else
          ParamByName('@dept_end').Value:='';
      end;
    end;
    open;
    First;
    SetProcessBar(true,1,recordcount);
    while not Eof do
    begin
      emp_id:=FieldByName('emp_id').AsString;
      GetDayEmp;//GetDayTable();
      SetProcessBar(false,1);
      SetStatusText(IntToStr(RecNo)+'/'+IntToStr(RecordCount)+' '+GetLangName(LangStr,'just_doing_empid')+':'+emp_id);
      next;
    end;
    SetStatusText(GetLangName(LangStr,'finish'));
    SetProcessBar();
  end;
end;

procedure TFormFhrd217.GetDayTable();
var
  sql_str:string;
begin
{  sql_str:='SELECT * FROM sysobjects WHERE (name LIKE ''hrd_dut_day%'')'
    +' and name>=''hrd_dut_day'+formatdatetime('yymmdd',DTPickBegin.date)+''''
    +' and name<=''hrd_dut_day'+formatdatetime('yymmdd',DTPickEnd.date)+'''';
  with DMHrdsys.SQLQuery4 do
  begin//打開範圍內日檔
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    first;
    while not Eof do
    begin
      GetDayEmp();
      next;
    end;
  end; }
end;

procedure TFormFhrd217.GetDayEmp();
var
  TableName,sql_str,pre_date:string;
begin
    //TableName:='hrd_dut_day';//FieldByName('name').AsString;
  if TntRadioGroup1.ItemIndex  = 0 then
     begin
       sql_str:='select * from fhrd_dut_day as A,hrd_dut_class as B where '
                +'A.clas_code=B.clas_code and A.emp_id='''+emp_id+''''
                +' and A.wrk_date>='''+FormatDatetime('yyyy/mm/dd',DTPickBegin.Date)+''''
                +' and A.wrk_date<='''+FormatDatetime('yyyy/mm/dd',DTPickEnd.Date)+''''
                +' order by A.wrk_date';
     end;
   if TntRadioGroup1.ItemIndex = 1 then
     begin
       sql_str:='select * from fhrd_dut_day_bak as A,hrd_dut_class as B where '
                +'A.clas_code=B.clas_code and A.emp_id='''+emp_id+''''
                +' and A.wrk_date>='''+FormatDatetime('yyyy/mm/dd',DTPickBegin.Date)+''''
                +' and A.wrk_date<='''+FormatDatetime('yyyy/mm/dd',DTPickEnd.Date)+''''
                +' order by A.wrk_date';
     end;
  if Checktempuser(username)  = false  then
     begin
       sql_str:=sql_str + ' and  not exists( select *from hrd_deny_emp where emp_id=a.emp_id ) '
     end;
  with DMHrdsys.SQLQuery3 do
  begin//在日檔中查找對應的工號
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then
    begin
      pre_date:='';
      while not EOF do
      begin
        if pre_date<>FieldByName('wrk_date').AsString then
          if pre_date<>'' then
            AppendMastRecord();
        SetTime();
        pre_date:=FieldByName('wrk_date').AsString;
        next;
      end;
      AppendMastRecord();
    end;
  end;
end;

procedure TFormFhrd217.SetTime();
var
  class_code:string;
  once_time:double;
  e_time,s_time:Tdatetime;
begin
  with DMHrdsys.SQLQuery3 do
  begin
    if (FieldByName('real_start').AsString<>'****') and (FieldByName('real_start').AsString<>'') then
      real_start:=FieldByName('real_start').AsString;
    if (FieldByName('real_end').AsString<>'****') and (FieldByName('real_end').AsString<>'') then
      real_end:=FieldByName('real_end').AsString;
    class_code:=FieldByName('clas_code').AsString;
    if clas_chs='' then
      clas_chs:=FieldByName('clas_chs').AsString;
    wrk_date:=FieldByName('wrk_date').AsDatetime;
    //once_time:=FieldByName('s_end').AsInteger-FieldByName('s_start').AsInteger;
    //if (real_start<>'') or (real_end<>'') then
    begin
      s_time:=ShortstrToTime(FieldByName('s_start').AsString);
      e_time:=ShortstrToTime(FieldByName('s_end').AsString);
    end;
    once_time:=e_time-s_time;
    {if (s_time<=12/24) and (e_time>=13/24) then
      once_time:=once_time-1/24;}
    //once_time:=ShortstrToTime(FieldByName('s_end').AsString)-ShortstrToTime(FieldByName('s_start').AsString);
    once_time:=once_time*24;
    if once_time=9 then
      once_time:=8;
    if FieldByName('late').AsString<>'' then
      n_late:=n_late+1;//遲到
    if FieldByName('early').AsString<>'' then
      n_early:=n_early+1;//早退
    if FieldByName('wrk_sts').AsString='06' then
    begin
      left_time:=left_time+once_time;//曠工
      ab_code:=class_code;
    end;  
  end;
  if AnsiContainsStr('61|62|63',class_code) then//正常班
  begin
    if (real_start<>'') or (real_end<>'') then
      work_time:=work_time+once_time;
  end
  else if AnsiContainsStr('65|66|68|69|72|82',class_code) then//加班
  //else if (class_code>='65') or (class_code<='72') then//加班
  begin
    if (real_start<>'') or (real_end<>'') then
      over_time:=over_time+once_time;
  end
  else if (class_code='07') then//公出
    out_time:=out_time+once_time
  else if ((class_code>='08') and (class_code<='15')) or (class_code='64') then
  begin
    ab_time:=ab_time+once_time;//異常
    ab_code:=class_code;
  end;  
end;

procedure TFormFhrd217.AppendMastRecord();
begin
  with ADOQuery1 do
  begin
    Append;
    FieldByName('emp_id').AsString:=emp_id;
    FieldByName('clas_chs').AsString:=clas_chs;
    FieldByName('casting_b').AsString:=real_start;
    FieldByName('casting_e').AsString:=real_end;
    FieldByName('emp_chs').AsString:=ADOStoredProc1.FieldByName('emp_name').AsString;
    FieldByName('department').AsString:=ADOStoredProc1.FieldByName('dept_code').AsString+' '+ADOStoredProc1.FieldByName('abbr_titl').AsString;
    FieldByName('work_date').AsDateTime:=wrk_date;
    FieldByName('week_day').AsString:=inttostr(DayOfTheWeek(wrk_date));
    FieldByName('late').AsInteger:=n_late;
    FieldByName('early').AsInteger:=n_early;
    if work_time<>0 then
      FieldByName('work_time').AsFloat:=work_time;
    if over_time<>0 then
      FieldByName('over_time').AsFloat:=over_time;
    if left_time<>0 then
      FieldByName('left_time').AsFloat:=left_time;
    if out_time<>0 then
      FieldByName('out_time').AsFloat:=out_time;
    if ab_time<>0 then
      FieldByName('ab_time').AsFloat:=ab_time;
    FieldByName('ab_code').AsString:=ab_code;
    post;
  end;
  n_early:=0;
  n_late:=0;
  work_time:=0;
  over_time:=0;
  left_time:=0;
  out_time:=0;
  ab_time:=0;
  ab_code:='';
  real_start:='';
  real_end:='';
  clas_chs:='';
end;

procedure TFormFhrd217.SetPrintDataset;
//設置打印數據集
begin
  with ADOQuery1 do
  begin
    close;
    open;
  end;
  GetEmp();
end;

procedure TFormFhrd217.PrintTip(PrintFlag:boolean);
begin
  with ADOQuery1 do
  begin
    first;
    if EOF then
    begin
      WideMessageDlg(GetLangName(LangStr,'not_find_data'),mtConfirmation,[mbok],0);
      exit;
    end
    else
    begin
      if PrintFlag then
        SetStatusText(GetLangName(LangStr,'while_printing')+GetLangName(LangStr,'fld_emp_id')+FieldByName('emp_id').AsString);
      {with FormPrtSal12.QuickRep1 do
      begin
        if PrintFlag then
          Print
        else
          Preview;
      end;} //2012-02-25 hyt delete
    end;
  end;
  if PrintFlag then
    SetStatusText(GetLangName(LangStr,'print_finish'));
end;

procedure TFormFhrd217.BtnPrintClick(Sender: TObject);
//打印內容設置
begin
  showPrint(ADOQuery1,formatdatetime('yyyy"年"mm"月"',DTPickBegin.Date)+'個人考勤明細列印')

end;
procedure TExcelThread.execute;
{-----------轉資料線程-----------}
var
  Excelid: Variant;
  i,j:integer ;
  ColStr:string ;
  AQry:TADOQuery;
  Str1,Str2,Str3,Str4:widestring;
  FormFhrd217:TFormFhrd217;
  trunggian,pur_no,sqlstr:string;
  sohang,cuoitaptin:Longint;
begin
  ColStr:='N';//xac dinh xem cot co bao nhieu cot
  FormFhrd217:=TFormFhrd217(application.FindComponent('FormFhrd217')); //注意:此處一定要註冊窗体(要不,認不到)
with FormFhrd217 do
  begin
    try
      Excelid:=CreateOleObject( 'Excel.Application' );
    except
      on Exception do raise exception.Create('無法創建Xls文件，請確認是否安裝EXCEL')
    end;

    Excelid.Visible := True;
     Excelid.displayaLERTS := false ;
    Excelid.WorkBooks.Add;

    Excelid.worksheets[1].range['A1:'+'O1'].Merge(True);
    Excelid.worksheets[1].range['A1:'+'O1'].FONT.UNDERLINE:=TRUE;

    Excelid.WorkSheets[1].Cells[1,1].Value :=formatdatetime('yyyy"年"mm"月"',DTPickBegin.Date)+'個人考勤明細列印';
 //   Excelid.worksheets[1].range['A1:G1'].VerticalAlignment := xlCenter;
    Excelid.worksheets[1].Range['A1:O1'].font.size:=12;
    Excelid.worksheets[1].Range['A1:O1'].font.bold:=true;
    Excelid.worksheets[1].pagesetup.topmargin := 0 ;
    Excelid.worksheets[1].pagesetup.leftmargin := 0 ;
    Excelid.worksheets[1].pagesetup.rightmargin := 0 ;
    Excelid.worksheets[1].pagesetup.bottommargin := 0 ;
    Excelid.worksheets[1].Columns[1].ColumnWidth := 8;
    Excelid.worksheets[1].Columns[2].ColumnWidth := 10;
    Excelid.worksheets[1].Columns[3].ColumnWidth := 25;
    Excelid.worksheets[1].Columns[4].ColumnWidth := 12;
    Excelid.worksheets[1].Columns[5].ColumnWidth := 8;
    Excelid.worksheets[1].Columns[6].ColumnWidth := 8;
    Excelid.worksheets[1].Columns[7].ColumnWidth := 10;
    Excelid.worksheets[1].Columns[8].ColumnWidth := 6;
    Excelid.worksheets[1].Columns[9].ColumnWidth := 6;
    Excelid.worksheets[1].Columns[10].ColumnWidth := 6;
    Excelid.worksheets[1].Columns[11].ColumnWidth := 6;
    Excelid.worksheets[1].Columns[12].ColumnWidth := 6;
    Excelid.worksheets[1].Columns[13].ColumnWidth := 6;
    Excelid.worksheets[1].Columns[14].ColumnWidth := 6;

    Excelid.WorkSheets[1].Cells[2,1].Value :='工號' ;
    Excelid.WorkSheets[1].Cells[2,2].Value :='中文姓名' ;
    Excelid.WorkSheets[1].Cells[2,3].Value :='部門' ;
    Excelid.WorkSheets[1].Cells[2,4].Value :='日期' ;
    Excelid.WorkSheets[1].Cells[2,5].Value :='班別' ;
    Excelid.WorkSheets[1].Cells[2,6].Value :='刷卡起' ;
    Excelid.WorkSheets[1].Cells[2,7].Value :='刷卡止' ;

    Excelid.WorkSheets[1].Cells[2,8].Value :='遲到' ;
    Excelid.WorkSheets[1].Cells[2,9].Value :='早退' ;
    Excelid.WorkSheets[1].Cells[2,10].Value :='出勤時' ;
    Excelid.WorkSheets[1].Cells[2,11].Value :='加班' ;
    Excelid.WorkSheets[1].Cells[2,12].Value :='曠工' ;
    Excelid.WorkSheets[1].Cells[2,13].Value :='公出' ;
    Excelid.WorkSheets[1].Cells[2,14].Value :='異常時' ;
    Excelid.WorkSheets[1].Cells[2,15].Value :='異常類' ;

    Excelid.worksheets[1].Range['A2:O2'].Borders.LineStyle := 1 ;
  //  Excelid.worksheets[1].range['A2:O2'].VerticalAlignment := xlCenter;
    Excelid.worksheets[1].Range['A2:O2'].font.size:=10;
    Excelid.worksheets[1].Range['A2:O2'].font.bold:=true;
    i := 3 ;
    adoQuery1.First ;
    while  not AdoQuery1.Eof   do
        begin
            ColStr :='A'+ inttostr( i) +':'+'O' + inttostr(i);
         //   Excelid.worksheets[1].range[ColStr].VerticalAlignment := xlCenter;
            Excelid.worksheets[1].Range[colStr].font.size:=8;
            Excelid.worksheets[1].Range[colStr].Font.Name := 'Arial';
            for j := 0 to adoQuery1.FieldCount -2 do
               begin
                 Excelid.WorkSheets[1].Cells[i,j+1].Value := ''''+AdoQuery1.Fields.Fields[j].AsString     ;
               end;
            Excelid.worksheets[1].Range[colStr].Borders.LineStyle := 1 ;
            i := i +1 ;
            adoQuery1.Next ;
        end;
  end;
  terminate;
  //Excelid.worksheets[1].printpreview;
  //Excelid.worksheets[1].PageSetup.Orientation := 2;
  //Excelid.worksheets[1].printout;
 // Excelid.workbooks.close ;
 // Excelid.quit ;
//  sb_email
end;
procedure TFormFhrd217.sb_FindEmpClick(Sender: TObject);
begin
  editempbegin.Text:=FindEmpId('emp_id');
end;

procedure TFormFhrd217.ADOQuery1CalcFields(DataSet: TDataSet);
//計算字段
begin
  with ADOQuery1 do
  begin
    
  end;
end;

procedure TFormFhrd217.BtnQueryClick(Sender: TObject);
begin
  //RunThread := TRunThread.Create(false);
  if monthof(DTPickBegin.Date)<>monthof(DTPickEnd.Date) then
  begin
    WideShowMessage(GetLangName(Langstr,'msg_must_same_month'));
    exit;
  end;
  CreateTmpDB('Tmp_hrd_fhrd217_report');//創建臨時表
  //SetPrintDataset;
  RunThread := TRunThread.Create(false);
  //BtnPrint.Enabled:=true;
  BtnPrtExcel.Enabled := true; 
end;

procedure TFormFhrd217.TntDBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormFhrd217.CobDeptBeginChange(Sender: TObject);
begin
  CobDeptEnd.text:=CobDeptBegin.text;
end;

procedure TRunThread.execute;
{*************************************************************************
TO DO:在線程中讀取實際數據
*************************************************************************}
var
  FormFhrd217:TFormFhrd217;
begin
  FreeOnTerminate := true;
  FormFhrd217:=TFormFhrd217(Application.FindComponent('FormFhrd217'));
  with FormFhrd217 do
  begin
    BtnPrint.Enabled:=false;
    PanelGrid.Enabled:=false;
    TntDBGrid1.DataSource:=nil;
    SetPrintDataset;
    //Synchronize(SetPrintDataset);
    TntDBGrid1.DataSource:=DataSource1;
    CreateTmpDB('Tmp_hrd_fhrd217_report',true);
    PanelGrid.Enabled:=true;
    BtnPrint.Enabled:=true;
  end;
end;

procedure TFormFhrd217.BtnCancelClick(Sender: TObject);
begin
  if (RunThread<>nil) and (not RunThread.Terminated) then
  begin
    RunThread.Suspend;
    if MessageDlg(GetLangName(langstr,'msg_confirm_cancel2'),mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      RunThread.Resume;
      RunThread.Terminate;
      SetStatusText(GetLangName(LangStr,'Cancel'));
      SetProcessBar();
      ADOQuery1.CancelUpdates;
    end
    else
      RunThread.Resume;
  end;
end;

procedure TFormFhrd217.ADOQuery1week_dayGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsString='' then
    exit;
  case Sender.AsInteger of
    1:text:='一';
    2:text:='二';
    3:text:='三';
    4:text:='四';
    5:text:='五';
    6:text:='六';
    7:text:='日';
  end;
end;

procedure TFormFhrd217.CreateTmpDB(table_name:string;is_drop:boolean=false);
//創建臨時表
var
  fld_name,sql_str:string;
  i:integer;
begin
sql_str:='if exists (select * from [tempdbf].dbo.sysobjects where name = '''+table_name+''')'
+'drop table [tempdbf].[dbo].['+table_name+']';
if not is_drop then
sql_str:=sql_str+'CREATE TABLE [tempdbf].[dbo].['+table_name+'] ('
+'[emp_id] [nvarchar] (6) NULL ,'
+'[emp_chs] [nvarchar] (20) NULL ,'
+'[department] [nvarchar] (50) NULL ,'
+'[work_date] [datetime] NULL ,'
+'[week_day] [nvarchar] (2) NULL ,'
+'[clas_chs] [nvarchar] (8) NULL ,'
+'[casting_b] [varchar] (4) NULL ,'
+'[casting_e] [varchar] (4) NULL ,'
+'[late] [char] (1) NULL ,'
+'[early] [char] (1) NULL ,'
+'[work_time] [varchar] (4) NULL ,'
+'[over_time] [varchar] (4) NULL ,'
+'[left_time] [varchar] (4) NULL ,'
+'[out_time] [varchar] (4) NULL ,'
+'[ab_time] [varchar] (4) NULL ,'
+'[ab_code] [varchar] (4) NULL '
+')';
  with DMHrdSys.ADOCommand1 do
  begin
    CommandText:=sql_str;
    execute;
  end;
end;

procedure TFormFhrd217.BtnPrtExcelClick(Sender: TObject);
begin
   if (ExcelThread=nil) or (ExcelThread.Terminated) then
      ExcelThread := TExcelThread.Create(false);
end;

procedure TFormFhrd217.EditEmpBeginChange(Sender: TObject);
begin
  EditEmpEnd.Text :=EditEmpBegin.Text ;
  RbEmp.Checked :=true;
end;

end.
