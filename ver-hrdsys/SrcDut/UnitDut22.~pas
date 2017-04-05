{*************************************************************************
Name：Dut22
Author: anil
Create date:2005-09-06
Modify date:2005-09-08
Commentate:員工加班明細表
*************************************************************************}
unit UnitDut22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils,math,excel97,excel2000;

type
   TExcelThread = class(TThread)
  protected
        procedure execute;override;
  end;
  TFormDut22 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PrintDialog1: TPrintDialog;
    Panel5: TPanel;
    PanelGrid: TPanel;
    TntGroupBox1: TTntGroupBox;
    Label_month: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    Panel2: TPanel;
    BtnQuery: TTntButton;
    BtnPrint: TTntBitBtn;
    DTBegin: TTntDateTimePicker;
    TntLabel1: TTntLabel;
    DTEnd: TTntDateTimePicker;
    ADOQuery2: TADOQuery;
    ADOQuery1wrk_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    TntLabel2: TTntLabel;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1department: TWideStringField;
    ADOQuery2dept_code: TStringField;
    ADOQuery2department: TWideStringField;
    DataSource2: TDataSource;
    ADOQuery2over_date: TDateTimeField;
    ADOQuery2sum: TIntegerField;
    ADOQuery1ot_hour: TFloatField;
    ADOQuery2ot_hour: TFloatField;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TntDBGrid1: TTntDBGrid;
    TabSheet2: TTabSheet;
    TntDBGrid2: TTntDBGrid;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TntDBGrid4: TTntDBGrid;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    TntLabel3: TTntLabel;
    TntLabel4: TTntLabel;
    DBGrid1: TDBGrid;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    TntBitBtn1: TTntBitBtn;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure GetDayEmp();
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure CobDeptBeginChange(Sender: TObject);
  //  procedure TntDBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
   //   DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TntDBGrid4TitleClick(Column: TColumn);
    procedure TntBitBtn1Click(Sender: TObject);
 //   procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  //    DataCol: Integer; Column: TColumn; State: TGridDrawState);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut22: TFormDut22;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12,comobj;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  emp_id:string;
  wrk_date:Tdatetime;
    ExcelThread:TExcelThread;
{$R *.dfm}

procedure TFormDut22.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'dut22');
  InitForm;// Init Form
end;

procedure TFormDut22.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='vietnam_chingluh_company,dut22_titl,date,fld_year,fld_smonth,fld_day,'
   +'not_find_data,total,current_location,print_finish,just_doing_empid,finish,dept_code';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//if userlang='C' then
DBGrid1.Columns.Items[0].Title.Caption :='部門代號';//GetLangName(LangStr,'dept_code');
DBGrid1.Columns.Items[1].Title.Caption :='部門名稱';//GetLangName(LangStr,'dept_code');
DBGrid1.Columns.Items[2].Title.Caption :='工號';//GetLangName(LangStr,'dept_code');
DBGrid1.Columns.Items[3].Title.Caption :='姓名';//GetLangName(LangStr,'dept_code');
DBGrid1.Columns.Items[4].Title.Caption :='加班時數';//GetLangName(LangStr,'dept_code');
end;

procedure TFormDut22.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  DTBegin.Date:=StartOfTheMonth(date);
  DTEnd.Date:=EndOfTheMonth(date);
  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
end;

procedure TFormDut22.GetDayEmp();
var
  TableName,sql_str:string;
begin
  TableName:='hrd_dut_day';//+formatdatetime('yymmdd',wrk_date);
  sql_str:='select * from '+TableName+' as A,hrd_dut_class as B where '
    +' A.clas_code=B.clas_code and A.emp_id ='''+emp_id+''''
    +' and A.wrk_date='''+FormatDatetime('yyyy/mm/dd',wrk_date)+''''
    +' and (A.real_start='''' or A.real_start is null or A.real_end='''' or A.real_end is null)';
  if false then //if Checktempuser(username)  = false  then
     begin
       sql_str:=sql_str + ' and  not exists( select *from hrd_deny_emp where emp_id=a.emp_id ) '
     end;
  with DMHrdsys.SQLQuery4 do
  begin//在日檔中查找對應的工號
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    while not EOF do
    begin
      next;
    end;
  end;
end;

procedure TFormDut22.BtnPrintClick(Sender: TObject);
//打印內容設置
var
  prt_title,datefmt,monthfmt,flds:widestring;
  ADate:TDateTime;
begin
  ADate:=GetServerDateTime;
 // showPrint(ADOQuery1,formatdatetime('yyyy"年"mm"月"',DTPickBegin.Date)+'個人考勤明細列印')
 if PageControl1.ActivePageIndex = 0 then
    showPrint(ADOQuery1,'員工加班明細表');
 if PageControl1.ActivePageIndex = 1 then
    showPrint(ADOQuery2,'部門日加班明細表');
 if PageControl1.ActivePageIndex = 2 then
    showPrint(ADOQuery3,'員工加班匯總表');
 if PageControl1.ActivePageIndex = 3 then
    showPrint(ADOQuery4,'部門加班匯總表');
end;

procedure TFormDut22.BtnQueryClick(Sender: TObject);
var
  sqlstr,dut_mon:string;                  
begin
  if PageControl1.ActivePageIndex = 0 then
     begin
       SqlStr:=' select f.over_date,f.dept_code, t.abbr_titl, f.emp_id, k.emp_chs, f.ot_hour + isnull( y.spe_ot, 0 ) as ot_hour '+
               '  from  (SELECT  b.emp_id, a.dept_code,a.over_date, CONVERT(float, LEFT(c.s_end, 2)) - CONVERT(float, LEFT(c.s_start, 2)) + (CONVERT(float, RIGHT(c.s_end, 2)) - CONVERT(float, RIGHT(c.s_start, 2))) / 60 AS ot_hour '+
               ' FROM hrd_dut_ovrmst a INNER JOIN   hrd_dut_ovrdtl b ON a.batch_no = b.batch_no INNER JOIN hrd_dut_seg c ON a.seg_code = c.seg_code '+
               ' WHERE  a.over_date >='''+FormatDateTime('yyyy/mm/dd',DTBegin.date ) +''' and a.over_date <=''' +FormatDateTime('yyyy/mm/dd',DTEnd.date ) +'''';

      if EditEmpBegin.Text<>'' then
         SqlStr:=SqlStr+' and b.emp_id>='''+EditEmpBegin.Text+''' ';
      if EditEmpEnd.Text<>'' then
         SqlStr:=SqlStr+' and b.emp_id<='''+EditEmpEnd.Text+''' ';
      if CobDeptBegin.Text<>'' then
         SqlStr:=SqlStr+' and a.dept_code>='''+leftstr(CobDeptBegin.Text,6)+''' ';
      if CobDeptEnd.Text<>'' then
         SqlStr:=SqlStr+' and a.dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';
      sqlstr :=sqlstr+ ' GROUP BY   b.emp_id, a.dept_code, a.over_date, c.s_start, c.s_end ) f INNER JOIN '+
                       ' hrd_emp k ON f.emp_id = k.emp_id INNER JOIN  hrd_dept t ON f.dept_code = t.dept_code ' +
                       ' left JOIN  ( select emp_id , over_date, sum(tot_hour ) as spe_ot from hrd_dut_spe_overwork where '+
                       ' over_date >='''+FormatDateTime('yyyy/mm/dd',DTBegin.date ) +'''and over_date '+
                       ' <='''+ FormatDateTime('yyyy/mm/dd',DTEnd.date ) +''' group by emp_id,over_date ) y ON y.emp_id = f.emp_id ' +
                       ' order by  f.over_date ,f.dept_code, f.emp_id ' ;
      adoQuery1.SQL.Clear ;
      adoQuery1.SQL.Add(sqlstr);
      adoQuery1.Open ;
      DataSource1.DataSet :=adoQuery1;
    end;
   if PageControl1.ActivePageIndex = 1 then
      begin
        SqlStr:=' select f.over_date,f.dept_code, t.abbr_titl, count( f.emp_id ) as sum , isnull(sum( f.ot_hour ),0) + + isnull( sum(y.spe_ot), 0 ) as  ot_hour'+
                '  from  (SELECT  b.emp_id, a.dept_code,a.over_date, CONVERT(float, LEFT(c.s_end, 2)) - CONVERT(float, LEFT(c.s_start, 2)) + (CONVERT(float, RIGHT(c.s_end, 2)) - CONVERT(float, RIGHT(c.s_start, 2))) / 60 AS ot_hour '+
                ' FROM hrd_dut_ovrmst a INNER JOIN   hrd_dut_ovrdtl b ON a.batch_no = b.batch_no INNER JOIN hrd_dut_seg c ON a.seg_code = c.seg_code '+
                ' WHERE  a.over_date >='''+FormatDateTime('yyyy/mm/dd',DTBegin.date ) +''' and a.over_date <=''' +FormatDateTime('yyyy/mm/dd',DTEnd.date ) +'''';

       if EditEmpBegin.Text<>'' then
          SqlStr:=SqlStr+' and b.emp_id>='''+EditEmpBegin.Text+''' ';
       if EditEmpEnd.Text<>'' then
          SqlStr:=SqlStr+' and b.emp_id<='''+EditEmpEnd.Text+''' )';
       if CobDeptBegin.Text<>'' then
          SqlStr:=SqlStr+' and a.dept_code>='''+leftstr(CobDeptBegin.Text,6)+''' ';
       if CobDeptEnd.Text<>'' then
          SqlStr:=SqlStr+' and a.dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';
       sqlstr :=sqlstr+ '   GROUP BY   b.emp_id, a.dept_code, a.over_date, c.s_start, c.s_end ) f INNER JOIN '+
                        ' hrd_emp k ON f.emp_id = k.emp_id INNER JOIN  hrd_dept t ON f.dept_code = t.dept_code '+
                        ' left JOIN  ( select emp_id ,over_date, sum(tot_hour ) as spe_ot from hrd_dut_spe_overwork where '+
                        ' over_date >='''+FormatDateTime('yyyy/mm/dd',DTBegin.date ) +'''and over_date '+
                        ' <='''+ FormatDateTime('yyyy/mm/dd',DTEnd.date ) +''' group by emp_id,over_date ) y ON y.emp_id = f.emp_id ' +
                        ' group by f.over_date, f.dept_code,t.abbr_titl order by f.over_date, f.dept_code' ;
       adoQuery2.SQL.Clear ;
       adoQuery2.SQL.Add(sqlstr);
       adoQuery2.Open ;
       DataSource2.DataSet :=adoQuery2;
    end;
    if PageControl1.ActivePageIndex = 2 then
     begin
       SqlStr:=' SELECT  k.dept_code, h.abbr_titl, j.emp_id, k.emp_chs, j.ot_hour ' ;
       SqlStr:=SqlStr+' FROM (SELECT  p.emp_id, p.ot_hour + ISNULL(y.spe_ot, 0) AS ot_hour ' ;
       SqlStr:=SqlStr+' FROM (SELECT  emp_id, SUM(ISNULL(ot_hour, 0)) AS ot_hour ' ;
       SqlStr:=SqlStr+' FROM (SELECT  b.emp_id, a.dept_code,  ' ;
       SqlStr:=SqlStr+' SUM(CONVERT(float, LEFT(c.s_end, 2))  ' ;
       SqlStr:=SqlStr+' - CONVERT(float, LEFT(c.s_start, 2))  ' ;
       SqlStr:=SqlStr+' + (CONVERT(float, RIGHT(c.s_end, 2))  ' ;
       SqlStr:=SqlStr+' - CONVERT(float, RIGHT(c.s_start, 2))) ' ;
       SqlStr:=SqlStr+' / 60) AS ot_hour ' ;
       SqlStr:=SqlStr+' FROM  hrd_dut_ovrmst a INNER JOIN ' ;
       SqlStr:=SqlStr+' hrd_dut_ovrdtl b ON   ' ;
       SqlStr:=SqlStr+' a.batch_no = b.batch_no INNER JOIN ' ;
       SqlStr:=SqlStr+' hrd_dut_seg c ON ' ;
       SqlStr:=SqlStr+' a.seg_code = c.seg_code ' ;
       SqlStr:=SqlStr+' WHERE a.over_date >= '''+FormatDateTime('yyyy/mm/dd',DTBegin.date ) +''' AND ' ;
       SqlStr:=SqlStr+' a.over_date <= '''+ FormatDateTime('yyyy/mm/dd',DTEnd.date ) +''' ' ;
       if EditEmpBegin.Text<>'' then
         SqlStr:=SqlStr+' and b.emp_id>='''+EditEmpBegin.Text+''' ';
       if EditEmpEnd.Text<>'' then
         SqlStr:=SqlStr+' and b.emp_id<='''+EditEmpEnd.Text+''' ';
         //***2010-10-09 hyt upd
       {if CobDeptBegin.Text<>'' then
         SqlStr:=SqlStr+' and a.dept_code>='''+leftstr(CobDeptBegin.Text,6)+''' ';
       if CobDeptEnd.Text<>'' then
         SqlStr:=SqlStr+' and a.dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';}

       SqlStr:=SqlStr+' GROUP BY   b.emp_id, a.dept_code, c.s_start, ' ;
       SqlStr:=SqlStr+' c.s_end) f  ' ;
       SqlStr:=SqlStr+' GROUP BY   emp_id) p LEFT OUTER JOIN ' ;
       SqlStr:=SqlStr+' (SELECT         emp_id, SUM(tot_hour) AS spe_ot ' ;
       SqlStr:=SqlStr+' FROM              hrd_dut_spe_overwork  ' ;
       SqlStr:=SqlStr+' WHERE          over_date >= '''+FormatDateTime('yyyy/mm/dd',DTBegin.date ) +''' AND ' ;
       SqlStr:=SqlStr+' over_date <= '''+ FormatDateTime('yyyy/mm/dd',DTEnd.date ) +''' ' ;
       SqlStr:=SqlStr+' GROUP BY   emp_id) y ON y.emp_id = p.emp_id) j INNER JOIN  ' ;
       SqlStr:=SqlStr+' hrd_emp k ON j.emp_id = k.emp_id INNER JOIN  ' ;
       SqlStr:=SqlStr+' hrd_dept h ON k.dept_code = h.dept_code   ' ;
      if trim( EditEmpBegin.Text)<>''  then
         SqlStr:=SqlStr+' and j.emp_id>='''+EditEmpBegin.Text+''' ';
      if trim( EditEmpEnd.Text)<>'' then
         SqlStr:=SqlStr+' and j.emp_id<='''+EditEmpEnd.Text+''' ';
      if trim( CobDeptBegin.Text ) <>'' then
         SqlStr:=SqlStr+' and k.dept_code>='''+leftstr(CobDeptBegin.Text,6)+''' ';
      if trim( CobDeptEnd.Text ) <>'' then
         SqlStr:=SqlStr+' and k.dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';

      adoQuery3.SQL.Clear ;
      adoQuery3.SQL.Add(sqlstr);
      adoQuery3.Open ;
      DataSource3.DataSet :=adoQuery3;
    end;
    if PageControl1.ActivePageIndex = 3 then
     begin
        SqlStr:=' SELECT  k.dept_code, h.abbr_titl, count( j.emp_id ) as mans , sum(j.ot_hour ) as ot_hour ' ;
       SqlStr:=SqlStr+' FROM (SELECT  p.emp_id, p.ot_hour + ISNULL(y.spe_ot, 0) AS ot_hour ' ;
       SqlStr:=SqlStr+' FROM (SELECT  emp_id, SUM(ISNULL(ot_hour, 0)) AS ot_hour ' ;
       SqlStr:=SqlStr+' FROM (SELECT  b.emp_id, a.dept_code,  ' ;
       SqlStr:=SqlStr+' SUM(CONVERT(float, LEFT(c.s_end, 2))  ' ;
       SqlStr:=SqlStr+' - CONVERT(float, LEFT(c.s_start, 2))  ' ;
       SqlStr:=SqlStr+' + (CONVERT(float, RIGHT(c.s_end, 2))  ' ;
       SqlStr:=SqlStr+' - CONVERT(float, RIGHT(c.s_start, 2))) ' ;
       SqlStr:=SqlStr+' / 60) AS ot_hour ' ;
       SqlStr:=SqlStr+' FROM  hrd_dut_ovrmst a INNER JOIN ' ;
       SqlStr:=SqlStr+' hrd_dut_ovrdtl b ON   ' ;
       SqlStr:=SqlStr+' a.batch_no = b.batch_no INNER JOIN ' ;
       SqlStr:=SqlStr+' hrd_dut_seg c ON ' ;
       SqlStr:=SqlStr+' a.seg_code = c.seg_code ' ;
       SqlStr:=SqlStr+' WHERE a.over_date >= '''+FormatDateTime('yyyy/mm/dd',DTBegin.date ) +''' AND ' ;
       SqlStr:=SqlStr+' a.over_date <= '''+ FormatDateTime('yyyy/mm/dd',DTEnd.date ) +''' ' ;
       if EditEmpBegin.Text<>'' then
         SqlStr:=SqlStr+' and b.emp_id>='''+EditEmpBegin.Text+''' ';
       if EditEmpEnd.Text<>'' then
         SqlStr:=SqlStr+' and b.emp_id<='''+EditEmpEnd.Text+''' ';
       if CobDeptBegin.Text<>'' then
         SqlStr:=SqlStr+' and a.dept_code>='''+leftstr(CobDeptBegin.Text,6)+''' ';
       if CobDeptEnd.Text<>'' then
         SqlStr:=SqlStr+' and a.dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';

       SqlStr:=SqlStr+' GROUP BY   b.emp_id, a.dept_code, c.s_start, ' ;
       SqlStr:=SqlStr+' c.s_end) f  ' ;
       SqlStr:=SqlStr+' GROUP BY   emp_id) p LEFT OUTER JOIN ' ;
       SqlStr:=SqlStr+' (SELECT         emp_id, SUM(tot_hour) AS spe_ot ' ;
       SqlStr:=SqlStr+' FROM              hrd_dut_spe_overwork  ' ;
       SqlStr:=SqlStr+' WHERE          over_date >= '''+FormatDateTime('yyyy/mm/dd',DTBegin.date ) +''' AND ' ;
       SqlStr:=SqlStr+' over_date <= '''+ FormatDateTime('yyyy/mm/dd',DTEnd.date ) +''' ' ;
       SqlStr:=SqlStr+' GROUP BY   emp_id) y ON y.emp_id = p.emp_id) j INNER JOIN  ' ;
       SqlStr:=SqlStr+' hrd_emp k ON j.emp_id = k.emp_id INNER JOIN  ' ;
       SqlStr:=SqlStr+' hrd_dept h ON k.dept_code = h.dept_code    ' ;
      if EditEmpBegin.Text<>'' then
         SqlStr:=SqlStr+' and j.emp_id>='''+EditEmpBegin.Text+''' ';
      if EditEmpEnd.Text<>'' then
         SqlStr:=SqlStr+' and j.emp_id<='''+EditEmpEnd.Text+''' ';
      if CobDeptBegin.Text<>'' then
         SqlStr:=SqlStr+' and k.dept_code>='''+leftstr(CobDeptBegin.Text,6)+''' ';
      if CobDeptEnd.Text<>'' then
         SqlStr:=SqlStr+' and k.dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';
      SqlStr:=SqlStr+' group by  k.dept_code, h.abbr_titl ';

      { SqlStr:='select p.dept_code,p.abbr_titl,count( p.emp_id ) as mans ,sum(p.ot_hour ) ot_hour  from ( select f.dept_code, t.abbr_titl, f.emp_id, k.emp_chs, f.ot_hour + isnull( y.spe_ot, 0 ) as ot_hour '+
               '  from  (SELECT  b.emp_id, a.dept_code, sum(CONVERT(float, LEFT(c.s_end, 2)) - CONVERT(float, LEFT(c.s_start, 2)) + (CONVERT(float, RIGHT(c.s_end, 2)) - CONVERT(float, RIGHT(c.s_start, 2))) / 60 ) AS ot_hour '+
               ' FROM hrd_dut_ovrmst a INNER JOIN   hrd_dut_ovrdtl b ON a.batch_no = b.batch_no INNER JOIN hrd_dut_seg c ON a.seg_code = c.seg_code '+
               ' WHERE  a.over_date >='''+FormatDateTime('yyyy/mm/dd',DTBegin.date ) +''' and a.over_date <=''' +FormatDateTime('yyyy/mm/dd',DTEnd.date ) +'''';

      if EditEmpBegin.Text<>'' then
         SqlStr:=SqlStr+' and b.emp_id>='''+EditEmpBegin.Text+''' ';
      if EditEmpEnd.Text<>'' then
         SqlStr:=SqlStr+' and b.emp_id<='''+EditEmpEnd.Text+''' ';
      if CobDeptBegin.Text<>'' then
         SqlStr:=SqlStr+' and a.dept_code>='''+leftstr(CobDeptBegin.Text,6)+''' ';
      if CobDeptEnd.Text<>'' then
         SqlStr:=SqlStr+' and a.dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';
      sqlstr :=sqlstr+ ' GROUP BY   b.emp_id, a.dept_code, c.s_start, c.s_end ) f INNER JOIN '+
                       ' hrd_emp k ON f.emp_id = k.emp_id INNER JOIN  hrd_dept t ON f.dept_code = t.dept_code ' +
                       ' left JOIN  ( select emp_id , sum(tot_hour ) as spe_ot from hrd_dut_spe_overwork where '+
                       ' over_date >='''+FormatDateTime('yyyy/mm/dd',DTBegin.date ) +'''and over_date '+
                       ' <='''+ FormatDateTime('yyyy/mm/dd',DTEnd.date ) +''' group by emp_id ) y ON y.emp_id = f.emp_id ' +
                       '  ) as p group by dept_code, abbr_titl order by p.dept_code ' ; }
      adoQuery4.SQL.Clear ;
      adoQuery4.SQL.Add(sqlstr);
      adoQuery4.Open ;
      DataSource4.DataSet :=adoQuery4;
    end;
  BtnPrint.Enabled:=true;
end;

procedure TFormDut22.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormDut22.CobDeptBeginChange(Sender: TObject);
begin
  CobDeptEnd.text:=CobDeptBegin.text;
end;


procedure TFormDut22.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  p, k:Integer;
  tot :real ;
begin

       if ( DBGrid1.Fields[4].IsNull  ) or ( DBGrid1.Fields[4].value = 0 )  then
       else
          begin
       tot :=Strtofloat(DBGrid1.Fields[4].value);
        IF ( tot >=150 )  and ( tot < 200)   then   // 這行顯示錯誤
          begin
            DBGrid1.Canvas.Brush.Color:=clyellow;
            DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
          end;
       IF ( tot >=200 )  and ( tot < 250)   then   // 這行顯示錯誤
          begin
            DBGrid1.Canvas.Brush.Color:=clFuchsia;
            DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
          end;
          IF ( tot >=250 )    then   // 這行顯示錯誤
          begin
            DBGrid1.Canvas.Brush.Color:=clred;
            DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
          end;
         end;   

end;

procedure TFormDut22.TntDBGrid4TitleClick(Column: TColumn);
begin
  // DBGridSortByTitle(column);
end;

procedure TFormDut22.TntBitBtn1Click(Sender: TObject);
begin
  if  ( PageControl1.ActivePageIndex = 0 ) or ( PageControl1.ActivePageIndex = 2 ) then
      if (ExcelThread=nil) or (ExcelThread.Terminated) then
          ExcelThread := TExcelThread.Create(false);
end;
procedure TExcelThread.execute;
{-----------轉資料線程-----------}
var
  Excelid: Variant;
  i,j, k:integer ;
  ColStr:string ;
  AQry:TADOQuery;
  Str1,Str2,Str3,Str4:widestring;
  Formdut22:TFormdut22;
  trunggian,pur_no,sqlstr:string;
  sohang,cuoitaptin:Longint;
begin
  ColStr:='N';//xac dinh xem cot co bao nhieu cot
  Formdut22:=TFormdut22(application.FindComponent('Formdut22')); //注意:此處一定要註冊窗体(要不,認不到)
with Formdut22 do
  begin

    try
      Excelid:=CreateOleObject( 'Excel.Application' );
    except
      on Exception do raise exception.Create('無法創建Xls文件，請確認是否安裝EXCEL')
    end;

    Excelid.Visible := True;
    Excelid.WorkBooks.Add;

    Excelid.worksheets[1].range['A1:'+'E1'].Merge(True);
    Excelid.worksheets[1].range['A1:'+'E1'].FONT.UNDERLINE:=TRUE;

    Excelid.WorkSheets[1].Cells[1,1].Value :='員工加班匯總表 ';
    Excelid.worksheets[1].range['A1:E1'].VerticalAlignment := xlCenter;
    Excelid.worksheets[1].Range['A1:E1'].font.size:=10;
    Excelid.worksheets[1].Range['A1:E1'].font.bold:=true;
    Excelid.worksheets[1].Columns[1].ColumnWidth := 10;
    Excelid.worksheets[1].Columns[2].ColumnWidth := 20;
    Excelid.worksheets[1].Columns[3].ColumnWidth := 10;
    Excelid.worksheets[1].Columns[4].ColumnWidth := 20;
    Excelid.worksheets[1].Columns[5].ColumnWidth := 20;
    if PageControl1.ActivePageIndex = 0 then
     begin
       Excelid.WorkSheets[1].Cells[2,1].Value :='加班日期' ;
       Excelid.WorkSheets[1].Cells[2,2].Value :='部門代號' ;
       Excelid.WorkSheets[1].Cells[2,3].Value :='部門名稱' ;
       Excelid.WorkSheets[1].Cells[2,4].Value :='工號' ;
       Excelid.WorkSheets[1].Cells[2,5].Value :='姓名' ;
       Excelid.WorkSheets[1].Cells[2,6].Value :='加班時數';
     end;
     if PageControl1.ActivePageIndex = 2 then
     begin
       Excelid.WorkSheets[1].Cells[2,1].Value :='部門代號' ;
       Excelid.WorkSheets[1].Cells[2,2].Value :='部門名稱' ;
       Excelid.WorkSheets[1].Cells[2,3].Value :='工號' ;
       Excelid.WorkSheets[1].Cells[2,4].Value :='姓名' ;
       Excelid.WorkSheets[1].Cells[2,5].Value :='加班時數';
     end;

    Excelid.worksheets[1].Range['A2:E2'].Borders.LineStyle := 1 ;
    Excelid.worksheets[1].range['A2:E2'].VerticalAlignment := xlCenter;
    Excelid.worksheets[1].Range['A2:E2'].font.size:=10;
    Excelid.worksheets[1].Range['A2:E2'].font.bold:=true;
    i := 3; j := 0 ; k :=0;
    if PageControl1.ActivePageIndex = 0 then
     begin
       adoQuery1.First ;
          while  not AdoQuery1.Eof   do
        begin

            for j := 0 to adoQuery1.FieldCount -1 do
               begin
                 Excelid.WorkSheets[1].Cells[i,j+1].Value :=adoQuery1.Fields.Fields[j].Value ;
               end;

          //  Excelid.worksheets[1].Range[colStr].Borders.LineStyle := 1 ;
            i := i +1 ;
            adoQuery1.Next ;
        end;
      end;
    if PageControl1.ActivePageIndex = 2 then
     begin
       adoQuery3.First ;
          while  not AdoQuery3.Eof   do
        begin

            for j := 0 to adoQuery3.FieldCount -1 do
               begin
                 Excelid.WorkSheets[1].Cells[i,j+1].Value :=adoQuery3.Fields.Fields[j].Value ;
               end;

          //  Excelid.worksheets[1].Range[colStr].Borders.LineStyle := 1 ;
            i := i +1 ;
            adoQuery3.Next ;
        end;
      end;
  end;
  terminate;
//  sb_email
end;
end.




