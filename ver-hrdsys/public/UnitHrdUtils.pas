{************************************************************************
 功    能：人事系統公共函數及變量
 作用範圍:人事系統
*************************************************************************}
unit UnitHrdUtils;

interface
uses
   Controls, dialogs,SysUtils,Classes,WSDLIntf,DBGrids,adodb,db,variants,
   StrUtils,Forms,DBClient,TntStdCtrls,TntButtons,TntExtCtrls,TntDBGrids,
   TntComCtrls,IniFiles,stdCtrls,dateutils;
type
  TPrvArr = array[0..5] of boolean;
  TBasepay= array[0..2] of Currency;
  //已休年假，0:普通年假，1:春節
  TAnnualLeaveDays= array[0..1] of Double;
const
  INQ = 0;
  ADD = 1;
  UPD = 2;
  DEL = 3;
  PRT = 4;
  TRAN = 5;
{全局函數}
{*******************Start DLL文件中公共函數***********************}
function GetDBString(IsLangDB,NotCLVC:boolean): Pchar;stdcall; external 'others\PubFunc.dll';
function GetUserIP: Pchar;stdcall; external 'others\PubFunc.dll';
function StrSplit(const Source,ch:string):TStringList;stdcall; external 'others\PubFunc.dll';
function WideStrSplit(const Source,ch:widestring):TWideStrings;stdcall; external 'others\PubFunc.dll';
{*******************End DLL文件中公共函數*************************}
function InitConnStr(IsLangDB:boolean=false;NotCLVC:boolean=true):widestring;
  //返回數據庫連接字符串
function ShortstrToTime(str:string):Tdatetime;//將無分隔符的字符串轉為時間
function GetPrvArr(user_id,form_id:string):TPrvArr;//獲得用戶訪問某程序權限
function HaveSpcPrv(user_id,form_id:string):boolean;//判斷用戶是否有特殊權限
function GetLangWideStrs(UsedWords:string;lang_cate:string=''):TWideStrings;
  //取語言列表
function GetLangName(LangWStrs:TWideStrings;lang_id:String):WideString;
  //返回語言列表中指定的文字
procedure SetStatusText(text:wideString);//設定狀態欄提示文字
procedure SetProcessBar(IsInit:boolean=true;step:integer=1;MaxNum:integer=100;MinNum:integer=0);
  //設置狀態欄的進度條
function GetServerDateTime:TDateTime;//取服務器端日期時間
procedure SetComboxList(sqlstr:widestring;comboBoxName:TtntComboBox;DefaultKey:widestring='-1');
  //根據Sql語句生成ComboBox的下拉列表,並可根據DefaultKey設定初始選中項
procedure SetComboxIndex(comboBoxName:TtntComboBox;key:widestring;FirstPos:boolean=true);
  //設定ComboBox的選中項
procedure DBGridSortByTitle(Column: TColumn);//單擊DBGrid表頭排序
function CheckRecordExist(CheckSql:string):boolean;//檢查數據是否存在
function GetEmpInfo(EmpId:string;EmpMonth:string=''):Tfields;
  //根據輸入工號和月份或日期,返回工號相關信息(員工主檔和部門檔中所有欄位)
function FindEmpId(FindCol:String;EmpMonth:string=''):String;
  //彈出工號選擇的畫面,選擇一個工號
procedure ShowPrint(dataset1:TCustomADODataset;Title1:widestring;Footer1:widestring='';DefFlds:string='');
  //調用打印頁面()
procedure SetComponentLang(FormName:TForm);
  //根據原始的caption值,自動查找某個form的元件,設定元件的語言文字
procedure AddMiniTotalToDataSet(SourceDataSet:TCustomADODataset;ObjectDataSet:TClientDataset;MiniWords:WideString='subtotal';InWhichField:integer=0;fieldGroupBy:string='';fieldsStat:wideString='';IsSplit:boolean=true);
 //轉換數據集加入小計和總計
procedure GetDeptRange(comboBoxName:TtntComboBox;WithCombo:boolean=true);   //取得部門範圍
function GetRestDayCount(SDate,EDate:TDateTime;AEmpId:string=''):Integer;//取得兩日期之間的休息日數(周日)
//******************************人事部分**************************
function getNewEmpId(Factory:string='V'):string;
//2016.07.13 按年份產生新工號
function getNewEmpId_New(EpInDT: TDateTime):string;

//******************************考勤部分**************************
function GetYearHol(AEmpId,AYear:string):Tstrings;
//******************************薪資部分**************************
function GetAllBaseLvl:TStrings;
function IsTestEmp(epindt,ADate:TDateTime;PstCode:string):boolean;
function GetNormalBase(Empid, paymon, PstCode,EduCode:String;EmpInDate:TDateTime;SalBaseLvl:TStrings;WithTestDay:boolean=true;ValidDate:TDateTime=0):Currency;
function GetSalBaoBu(EmpId,PayMon:String):Currency;
function GetLongWork( InDate,CurDate:TDateTime;pstcode:string=''):real;

function GetVNDBigAMT(amt:double;QianWei:boolean=true):widestring;
procedure ChangeSalDept(mon:String);
function GetBasePay(EmpId:String):Currency;
function  Get45s(EpIndt:TDateTime; Empid,PstCode,PayMon:String;basepay:double ):Currency;
function GetLongWorkLvl:TStrings;
function  GetLongWorkPay(EpIndt:TDateTime;empid, PstCode,PayMon:String):Currency;
function GetSalBase(EmpId, paymon,  NewPstCode,EduCode:String;EmpInDate,EmpLvDate:TDateTime;SalBaseLvl:TStrings; OldPstCode:String ):TBasepay;
 function getholiday(empid, Ayear:string):Double;

 //2011-11-02 hyt add
function DB_Run_Sql(sSql:WideString ; sDBFlag:string=''):Boolean;
function DB_SeekRecord(aSql:WideString ):Boolean;
function DB_GetSRecord(aSql:WideString ):WideString;

//2011-12-01 hyt add
function str_IfMonth(aMonth:string):Boolean;
function str_NextMonth(aMonth:string):String;
function str_PreMonth(aMonth:string):String;
//2012-02-15 hyt add
function Checktempuser(userid:string):boolean;//檢查數據是否存在
function GetSunDayCount(DayBeg,DayEnd:Integer;YearMonth:String):Integer;
//2012-09-07 hyt add
function AnalysisFactory():string;
function AnalysisFactorySql(sAria:string=''):string;
function AnalysisEmpFactory(sEmp_id:string;sShowMsg:Boolean=true;bFhrd:Boolean=false):boolean;
//2015.04.02 四捨五入取整
function RoundEx(R: Real): Int64;
//2015.04.11 Sanjin 計算兩個日期相差的月數
function MonthsBetweenEx(const ANow, AThen: TDateTime): Integer;
//2015.04.21 Sanjin 計算兩個日期相差的年數
function YearsBetweenEx(const ANow, AThen: TDateTime): Integer;

//年假天數 2013.09.20 LX ADD
function GetYearHolEx(AEmpID, AYear: string): TStrings;
//得到年假可休天數 2013.09.25 LX ADD
function GetKXTS(AEmpID, AYear: string): Double;
//得到已休年假天數
function GetYXTS(AEmpID, AYear: string): TAnnualLeaveDays;

//2017.02.07 得到已休年假天數
function GetYXTSEx(AEmpID, AYear, AMonth: string): TAnnualLeaveDays;

//得到特殊員工在原公司已休的年假天數 2013.09.26 LX ADD
function GetSpecYXTS(AEmpID, AYear: string): Double;
//2016.3.19
function GetPiccBase(const AMonth, AEmpID: string): Double;
//2016.05.19得到除基本工資外的標準薪資 
function GetStdPay(const AEmpID: string): Double;
//2016.10.18 由新工號得到舊工號
function GetEmpID(const ANewEmpID: string): string;


var
{全局變量}
  UserName,//用戶密碼
  UserLang,//用戶語言
  UserDeptStr,//用戶存取部門條件範圍
  RunMode,//運行模式 取值 '1'-正式運行模式;'2'-檢查模式;
  IsDebug,//是否調試狀態  取值 '0'-正式；'1'-部分調試;'2'-完全調試;
  LockMonth,//資料鎖定月份(薪資)
  LockMonthPart,//部分資料鎖定月份(考勤)
  DebugUser,//調試賬號
  G_sFactory,//廠別   ==> F:fuluh,V:adidas
  G_sFactorySql,//對應條件
  LockLeaveDate //離職鎖定日期
  :string;
  function GetBase45s(EmpId,PayMon,PstCode:String;EmpInDate:TDateTime; basepay:Double ):Currency;
implementation
uses
  UnitDMhrdsys,UnitHrdMain,UnitEmp,UnitPrtSet,UnitPrtTpl;
//  function GetBase45s(EmpId,PayMon,PstCode:String;EmpInDate:TDateTime; basepay:Double ):Currency;
function InitConnStr(IsLangDB:boolean=false;NotCLVC:boolean=true):widestring;
begin
  result:=GetDBString(IsLangDB,NotCLVC);
end;

function ShortstrToTime(str:string):Tdatetime;
{*************************************************************************
To Do: 將字符串轉換為時間(無分隔符的,如0800)
Param: str-欲轉換的字符串(格式:hh,hhnn,hhnnss)
Return:時間類型
Create date: 2005-10-12
*************************************************************************}
var
  hh,nn,ss:integer;
  TmpTime:Tdatetime;
begin
  TryStrToInt(leftstr(str,2),hh);
  if hh>=24 then
  begin
    hh:=hh-24;
    TmpTime:=1;
  end
  else
    TmpTime:=0;
  TryStrToInt(midstr(str,3,2),nn);
  TryStrToInt(midstr(str,5,2),ss);
  TmpTime:=TmpTime+EncodeTime(hh,nn,ss,0);
  result:=TmpTime;
end;

{===============================================================================
  函數名稱：GetPrvArr(user_id,form_id:string)：TPrvArr
  功    能：取得user_id對於form_id的權限數組
  編 寫 者: leo  編寫日期：2005-07-19   最後修改日期：2005-07-20
  輸入參數: user_id:用戶代號   form_id:form的代號 如hrd01,hrd02等
  輸出參數: 權限數組TPrvArr(boolean類型)
            0 - 5 分別為 查詢,新增,修改,?除,列印,??
===============================================================================}
function GetPrvArr(user_id,form_id:string): TPrvArr;
var
  PrvArr:TPrvArr;
  i:integer;
begin
  with Dmhrdsys.sqlquery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from user_form where user_id='''+user_id+''' and lower(form_id)='''+LowerCase(form_id)+'''');
    try
      open;
    except
      exit;
    end;
    if not Eof then
    begin
      for i:=2 to 7 do     {2-inq,3-add,4-upd,5-del,6-prt,7-tran}
        if fields[i].AsInteger=1 then
          PrvArr[i-2]:=true
        else
          PrvArr[i-2]:=false;
    end
  end;
  result:=PrvArr;
  Dmhrdsys.sqlquery1.Close;
end;
{===============================================================================
  函數名稱: HaveSpcPrv(user_id,form_id:string):boolean
  函數功能: 判斷用戶user_id對form_id是否有特殊權限
  編 寫 者: hunter    編寫日期:2005-07-21
  輸入參數: user_id:用戶代號   form_id:form的代號 如hrd01,hrd02等
  返 回 值: 有該權限--true 沒有該權限--false
===============================================================================}
function HaveSpcPrv(user_id,form_id:string):boolean;
begin
  with Dmhrdsys.sqlquery1 do
  begin
    close;
    SQL.Clear;
    SQL.Add('select * from user_form_spc where user_id='''+user_id+''' and form_id='''+form_id+'''');
    try
      open;
    except
      Result:=false;
      exit;
    end;
    if Eof then
      Result:=false
    else
      Result:=true;
    close;
  end;
end;
{===============================================================================
  函數名稱: GetLangWideStrs(UsedWords:string):TWideStrings;
  函數功能: 得到語言lang_id 与對應語言的WideStrings
  編 寫 者: hunter    編寫日期:2005-07-26
  輸入參數: UsedWords:用戶代號   需要查詢的id字符串
            lang_cate:語言種類 ('C','V','E'),為空時為用戶登陸語言
  返 回 值: TWideStrings
===============================================================================}
function GetLangWideStrs(UsedWords:string;lang_cate:string=''):TWideStrings;
var
  QuerySQL,QuerySQL1:String;
  ws_Ret:TWideStrings;
  sl_UsedWords:TStringList;
  i:Integer;
  t_UsedWords,langCate:string;
begin
  if lang_cate='' then
    langCate:=UserLang
  else
    langCate:=lang_cate;
  //切分字符串
  sl_UsedWords:=StrSplit(UsedWords,',');
  if sl_UsedWords.Count<>0 then
    t_UsedWords:=''''+sl_UsedWords.Strings[0]+'''';
  for i:=1 to sl_UsedWords.Count-1 do
  begin
    t_UsedWords:=t_UsedWords+','''+sl_UsedWords.Strings[i]+'''';
  end;
  QuerySQL:='select * from [languages].[dbo].'+SYS_NAME+' where lang_id in ('+t_UsedWords+')';
  QuerySQL1:='select * from [languages].[dbo].publang where lang_id in ('+t_UsedWords+')';
  with DMHrdsys.lang_Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add(QuerySQL);
    try
      Open;
    except
      exit;
    end;
    ws_Ret:=TWideStrings.Create;
    while not Eof do
    begin
      if langCate='V' then
      begin
        ws_Ret.Add(LowerCase(FieldByName('lang_id').Value));
        ws_Ret.Add(FieldByName('v_name').Value);
      end
      else if langCate='E' then
      begin
        ws_Ret.Add(LowerCase(FieldByName('lang_id').Value));
        ws_Ret.Add(FieldByName('e_name').Value);
      end
      else
      begin
        ws_Ret.Add(LowerCase(FieldByName('lang_id').Value));
        ws_Ret.Add(FieldByName('c_name').Value);
      end;
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add(QuerySQL1);
    try
      Open;
    except
      exit;
    end;
    while not Eof do
    begin
      if langCate='V' then
      begin
        ws_Ret.Add(LowerCase(FieldByName('lang_id').Value));
        ws_Ret.Add(FieldByName('v_name').Value);
      end
      else if langCate='E' then
      begin
        ws_Ret.Add(LowerCase(FieldByName('lang_id').Value));
        ws_Ret.Add(FieldByName('e_name').Value);
      end
      else
      begin
        ws_Ret.Add(LowerCase(FieldByName('lang_id').Value));
        ws_Ret.Add(FieldByName('c_name').Value);
      end;
      Next;
    end;
  end;
  Result:=ws_Ret;
  DMHrdsys.lang_Query.Close;
end;

{==============================================================================
  函數名稱: GetLangName
  函數功能: 取lang_id對應的語言名稱
===============================================================================}
function GetLangName(LangWStrs:TWideStrings;lang_id:String):WideString;
var
  i:Integer;
begin
  lang_id:=LowerCase(lang_id);
  i:=LangWStrs.IndexOf(lang_id);
  if i mod 2 =0 then
    Result:=LangWStrs[i+1]
  else
    Result:='';
end;

procedure SetStatusText(text:widestring);
{*************************************************************************
To Do: 在主畫面的狀態欄顯示提示信息
Param: text-需顯示的文字信息,如text=''則清除提示信息
Create date: 2005-08-01
*************************************************************************}
begin
  hrdMainForm.StatusBar1.SimpleText:=text;
end;

procedure SetProcessBar(IsInit:boolean=true;step:integer=1;MaxNum:integer=100;MinNum:integer=0);
{*************************************************************************
To Do: 設置狀態欄的進度條
Param: IsInit-是否初始值設置(默認為初始設置)
       Step-每次移動進度條的步長(默認為1)
       MaxNum-初始設置進度條的最大值(默認為100)
       MinNum-初始設置進度條的最小值(默認為0)
Create date: 2005-08-30
*************************************************************************}
begin
with hrdMainForm.ProgressBar1 do
  begin
    if IsInit then
      begin
        Max:=MaxNum;
        Position:=MinNum;
      end
    else
      StepBy(step);
  end;
end;

{===============================================================================
  函數名稱:GetServerDateTime
===============================================================================}
function GetServerDateTime:TDateTime;
begin
  with Dmhrdsys.sqlquery1 do
  begin
    close;
    SQL.clear;
    SQL.Add('select GetDate() AS ServerDateTime');
    try
      open;
    except
      Result:=now;
      exit;
    end;
    Result:=FieldByName('ServerDateTime').AsDateTime;
    Close;
  end;
end;

procedure SetComboxList(sqlstr:widestring;comboBoxName:TtntComboBox;DefaultKey:widestring='-1');
{*************************************************************************
TO DO:根據Sql語句初始化ComboBox的下拉列表
Param: sqlstr-產生下拉選項的sql語句;
       comboBoxName-下拉框
       DefaultKey-comboBox默認選中項(可選,為空時則都不選中)
Author:anil
Create date: 2005-08-10
*************************************************************************}
begin
comboBoxName.Clear;
With DMHrdsys.SQLQuery1 do
  begin
    close;
    SQL.Clear;
    SQL.Add(sqlstr);
    try
      open;
    except
      exit;
    end;
    while not Eof do
      begin
        if (Fields.Fields[0].Value <> null) then
          comboBoxName.Items.Add(Fields.Fields[0].Value)
        else if Fields.Count>1 then
          comboBoxName.Items.Add(Fields.Fields[1].Value);
        next;
      end;
  end;
if DefaultKey<>'-1' then
  SetComboxIndex(comboBoxName,DefaultKey);
end;

procedure SetComboxIndex(comboBoxName:TtntComboBox;key:widestring;FirstPos:boolean=true);
{*************************************************************************
TO DO:設定ComboBox的選中項,沒找到則都不選中
Param: comboBoxname-下拉選擇框;
       key-查找的關鍵字;
       FirstPos-關鍵字key是否必須位于首位,(可選,為空時默認為true)
Author:anil
Create date: 2005-08-11
*************************************************************************}
var
  FindFlag:boolean;
  i:integer;
begin
  FindFlag:=false;
  comboBoxName.ItemIndex:=-1;
  with comboBoxName.Items do
  begin
    for i:=0 to count do
    begin
      if FirstPos then
      begin
        if pos(key,Strings[i])=1 then
          FindFlag:=true;
      end
      else if pos(key,Strings[i])>0 then
        FindFlag:=true;
      if FindFlag then
      begin
        comboBoxName.ItemIndex:=i;
        break;
      end;
    end;
    if not FindFlag then//沒有找到，直接返回文本
      comboBoxName.Text:=key;
  end;
end;

procedure DBGridSortByTitle(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
Param: Column-點擊DBGrid的標題欄位
Author:anil
Create date: 2005-08-10
*************************************************************************}
var
  sort_key:string;
begin
  if column.Grid.DataSource.DataSet.ClassName='TClientDataset' then
    exit;
  with TADODataset(column.Grid.DataSource.DataSet) do
  begin
    if not active then
      exit;
    if column.fieldname='' then//空欄位時退出
      exit;
    if FieldByName(column.fieldname).FieldKind=fklookup then//lookup欄位
      sort_key:=FieldByName(column.fieldname).KeyFields
    else if FieldByName(column.fieldname).FieldKind=fkdata then
      sort_key:=Column.FieldName
    else  //未知欄位則退出
      exit;
{    close;
    with IndexDefs do begin
      Clear;
      with AddIndexDef do begin
        Name := sort_key;
        Fields := sort_key;
        Options := [ixCaseInsensitive];
      end;
    end;
    open;         }
    if Sort=sort_key then
      Sort:=sort_key + ' DESC'
    else
      Sort:=sort_key;
  end;    
end;

function CheckRecordExist(CheckSql:string):boolean;
{*************************************************************************
TO DO:檢查數據庫中某行資料是否存在
Param:CheckSql-檢查SQL語句
Return:true-存在;false-不存在
Author:anil
Create Date:2005-8-6       
*************************************************************************}
begin
  with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add(CheckSql);
      try
        open;
      except
        result:=false;
        exit;
      end;
      if EOF then
        result:=false
      else
        result:=true;
    end;
end;

function GetEmpInfo(EmpId:string;EmpMonth:string=''):Tfields;
{*************************************************************************
TO DO:取得工號相關信息(姓名和部門)
Param:EmpId-工號
  EmpMonth-所查月份/日期
    (可接受類型yyyymm,yyyy-mm,yyyymmdd,yyyy/mm/dd,yyyy-mm-dd)
Return:Tfields類型,該工號所對應主檔和部門檔的所有相關欄位
    e.g.：Tfield1.FieldByName('emp_chs').Value(取中文姓名,Tfield1為返回值)
Author:anil
Create Date:2005-8-6
Modify Date:2005-8-17
*************************************************************************}
var
  TmpField:Tfields;
  tmpmonth:string;
begin
if length(EmpMonth)=10 then
  tmpmonth:=leftstr(EmpMonth,4)+midstr(EmpMonth,6,2);
if length(EmpMonth)=8 then
  tmpmonth:=leftstr(EmpMonth,4)+midstr(EmpMonth,5,2);
if length(EmpMonth)=7 then
  tmpmonth:=leftstr(EmpMonth,4)+rightstr(EmpMonth,2);
if length(EmpMonth)=6 then
  tmpmonth:=EmpMonth;
with DMHrdsys.ADOStoredProc1 do
  begin
    Active:=false;
    ProcedureName:='proc_emp_info';
    Parameters.Clear;
    Parameters.CreateParameter('@emp_id',ftString,pdInput,6,EmpId);
    if trim(EmpMonth)<>'' then
      Parameters.CreateParameter('@year_month',ftString,pdInput,6,tmpmonth);
    Prepared:=true;
    try
      Active:=true;
    except
      result:=nil;
      exit;
    end;
    TmpField:=Fields;
  end;
  result:=TmpField;
end;

function FindEmpId(FindCol:String;EmpMonth:string=''):String;
{*************************************************************************
TO DO:選擇一個工號
Param:FindCol-欲返回的欄位
      EmpMonth-查找月份
Return:欲返回的欄位值
Create Date:2005-8-27
*************************************************************************}
var
  tmpFindForm:TComponent;
begin
  //第一次創建form
  tmpFindForm:=application.FindComponent('FormEmp');
  if tmpFindForm=nil then
    Application.CreateForm(TFormEmp, FormEmp);
  FormEmp.YearMonth:=EmpMonth;
  FormEmp.sp_Emp.Close;
  FormEmp.ShowModal;
  if FormEmp.ModalResult=mrOk then
    Result:=FormEmp.sp_Emp.FieldValues[FindCol];
  FormEmp.sp_Emp.Close;
  FormEmp.qry_dept.Close;
  FormEmp.qry_pst.Close;
end;

procedure ShowPrint(dataset1:TCustomADODataset;Title1:widestring;Footer1:widestring='';DefFlds:string='');
{*************************************************************************
TO DO:調用打印頁面
Param:dataset1-打印的數據集來源
  Title1-打印報表的標題(含表頭文字)
  Footer1-頁腳文字(為空時默認顯示分頁信息)
  DefFlds-默認列印的欄位
Author:anil
Create Date:2005-9-16
Modify Date:2005-9-30
*************************************************************************}
var
  i,j,maxline:integer;
  TitleText:widestring;
  KeyList:string;
  LangStr,TitleList:TWideStrings;
  tmpFindForm:TComponent;
begin
  //第一次創建form
  tmpFindForm:=application.FindComponent('FormPrtSet');
  if tmpFindForm=nil then
    Application.CreateForm(TFormPrtSet, FormPrtSet);
  tmpFindForm:=application.FindComponent('FormPrtTpl');
  if tmpFindForm=nil then
    Application.CreateForm(TFormPrtTpl, FormPrtTpl);
  with FormPrtSet do
  begin
    DataSource1.DataSet:=dataset1;
    CobGroupFld.Clear;
    ChkFieldList.Clear;
    //標頭設置
    MemoTitle.Clear;
    TitleList:=WideStrSplit(title1,'<br>');
    for i:=0 to TitleList.count-1 do
      MemoTitle.Lines.Add(TitleList.Strings[i]);
    maxline:=TitleList.count;
    //頁腳設置
    if footer1<>'' then
    begin
      RbMyDefine.Checked:=true;
      MemoFooter.Clear;
      TitleList:=WideStrSplit(footer1,'<br>');
      for i:=0 to TitleList.count-1 do
        MemoFooter.Lines.Add(TitleList.Strings[i]);
    end;
    //欄位設置
    j:=0;
    with DataSource1.DataSet do
    begin
      KeyList:='';
      for i:=0 to FieldCount-1 do
      begin
        KeyList:=KeyList+'fld_'+Fields[i].DisplayLabel+',';
        KeyList:=KeyList+Fields[i].DisplayLabel+',';
      end;
      LangStr:=GetLangWideStrs(KeyList);
      for i:=0 to FieldCount-1 do
      begin
        if not Fields[i].Visible then
          continue;
        PrintFlds.Add(Fields[i].FieldName);
        with DBGrid1.Columns[j] do
        begin
          titleText:=GetLangName(LangStr,'fld_'+Fields[i].DisplayLabel);
          if titleText='' then
            titleText:=GetLangName(LangStr,Fields[i].DisplayLabel);
          Title.Caption:=titleText;
          Title.Font:=FontDialog2.Font;
          Font:=FontDialog1.Font;
          ChkFieldList.Items.Add(titleText);
          CobGroupFld.Items.Add(titleText);
          if (Fields[i].FieldName ='abbr_titl') and (Fields[i].FieldKind=fkData) then
            CobGroupFld.ItemIndex:=j
          else if (Fields[i].FieldName ='department') and (Fields[i].FieldKind=fkData) then
            CobGroupFld.ItemIndex:=j
          else if (Fields[i].FieldName ='dept_code') and (Fields[i].FieldKind=fkData) then
            CobGroupFld.ItemIndex:=j;
        end;
        inc(j);
      end;
    end;
    if DefFlds='' then
      DefPrintFlds:=PrintFlds
    else
      DefPrintFlds:=strsplit(DefFlds,',');
    BtnChooseDef.OnClick(BtnChooseDef);
    ShowModal;
    WindowState:=wsMaximized;
  end;
end;

procedure SetComponentLang(FormName:TForm);
{*************************************************************************
TO DO:根據原始的caption值,自動查找某個form的元件,設定元件的語言文字
Param:FormName-要設定的form名(可以傳遞self進來)
Create Date:2005-9-29
Modify Date:2005-9-30
*************************************************************************}
var
  i,j:integer;
  Keys,KeyList:widestring;
  LangStr:TWideStrings;
begin              
KeyList:='';
with FormName do
begin
  for i:=0 to ComponentCount-1 do
  begin    
    if Components[i].ClassName='TTntDBGrid' then
    begin//TTntDBGrid
      with TTntDBGrid(Components[i]).Columns do
        for j:=0 to count-1 do
        begin
          KeyList:=KeyList+'fld_'+Items[j].Title.Caption+',';
          KeyList:=KeyList+Items[j].Title.Caption+',';
        end;
    end
    else if Components[i].ClassName='TTntLabel' then
      KeyList:=KeyList+TtntLabel(Components[i]).Caption+','
    else if Components[i].ClassName='TTntButton' then
      KeyList:=KeyList+TTntButton(Components[i]).Caption+','
    else if Components[i].ClassName='TTntBitBtn' then
      KeyList:=KeyList+TTntBitBtn(Components[i]).Caption+','
    else if Components[i].ClassName='TTntSpeedButton' then
      KeyList:=KeyList+TTntSpeedButton(Components[i]).Caption+','
    else if Components[i].ClassName='TTntPanel' then
      KeyList:=KeyList+TTntPanel(Components[i]).Caption+','
    else if Components[i].ClassName='TTntGroupBox' then
      KeyList:=KeyList+TTntGroupBox(Components[i]).Caption+','
    else if Components[i].ClassName='TTntCheckBox' then
      KeyList:=KeyList+TTntCheckBox(Components[i]).Caption+','
    else if Components[i].ClassName='TTntRadioButton' then
      KeyList:=KeyList+TTntRadioButton(Components[i]).Caption+','
    else if Components[i].ClassName='TTntTabSheet' then
      KeyList:=KeyList+TTntTabSheet(Components[i]).Caption+','
    else if Components[i].ClassName='TTntStaticText' then
      KeyList:=KeyList+TTntStaticText(Components[i]).Caption+','
  end;
  LangStr:=GetLangWideStrs(KeyList);
  for i:=0 to ComponentCount-1 do
  begin    
    if Components[i].ClassName='TTntDBGrid' then
    begin//TTntDBGrid
      with TTntDBGrid(Components[i]).Columns do
        for j:=0 to count-1 do
        begin
          keys:=Items[j].Title.Caption;
          if GetLangName(LangStr,'fld_'+keys)<>'' then
            Items[j].Title.Caption:=GetLangName(LangStr,'fld_'+keys)
          else if GetLangName(LangStr,keys)<>'' then
            Items[j].Title.Caption:=GetLangName(LangStr,keys);
        end;
    end
    else if Components[i].ClassName='TTntLabel' then
    begin//TTntLabel
      keys:=TtntLabel(Components[i]).Caption;
      if GetLangName(LangStr,keys)<>'' then
        TtntLabel(Components[i]).Caption:=GetLangName(LangStr,keys)
      else if GetLangName(LangStr,'fld_'+keys)<>'' then
        TtntLabel(Components[i]).Caption:=GetLangName(LangStr,'fld_'+keys);
    end
    else if Components[i].ClassName='TTntButton' then
    begin//TTntButton
      keys:=TTntButton(Components[i]).Caption;
      if GetLangName(LangStr,keys)<>'' then
        TTntButton(Components[i]).Caption:=GetLangName(LangStr,keys);
    end
    else if Components[i].ClassName='TTntBitBtn' then
    begin//TTntBitBtn
      keys:=TTntBitBtn(Components[i]).Caption;
      if GetLangName(LangStr,keys)<>'' then
        TTntBitBtn(Components[i]).Caption:=GetLangName(LangStr,keys);
    end
    else if Components[i].ClassName='TTntSpeedButton' then
    begin//TTntSpeedButton
      keys:=TTntSpeedButton(Components[i]).Caption;
      if GetLangName(LangStr,keys)<>'' then
        TTntSpeedButton(Components[i]).Caption:=GetLangName(LangStr,keys);
    end
    else if Components[i].ClassName='TTntPanel' then
    begin//TtntPanel
      keys:=TtntPanel(Components[i]).Caption;
      if GetLangName(LangStr,keys)<>'' then
        TtntPanel(Components[i]).Caption:=GetLangName(LangStr,keys);
    end
    else if Components[i].ClassName='TTntGroupBox' then
    begin//TTntGroupBox
      keys:=TTntGroupBox(Components[i]).Caption;
      if GetLangName(LangStr,keys)<>'' then
        TTntGroupBox(Components[i]).Caption:=GetLangName(LangStr,keys);
    end
    else if Components[i].ClassName='TTntCheckBox' then
    begin//TTntCheckBox
      keys:=TTntCheckBox(Components[i]).Caption;
      if GetLangName(LangStr,keys)<>'' then
        TTntCheckBox(Components[i]).Caption:=GetLangName(LangStr,keys);
    end
    else if Components[i].ClassName='TTntRadioButton' then
    begin//TTntRadioButton
      keys:=TTntRadioButton(Components[i]).Caption;
      if GetLangName(LangStr,keys)<>'' then
        TTntRadioButton(Components[i]).Caption:=GetLangName(LangStr,keys);
    end
    else if Components[i].ClassName='TTntTabSheet' then
    begin//TTntTabSheet
      keys:=TTntTabSheet(Components[i]).Caption;
      if GetLangName(LangStr,keys)<>'' then
        TTntTabSheet(Components[i]).Caption:=GetLangName(LangStr,keys);
    end
    else if Components[i].ClassName='TTntStaticText' then
    begin//TntStaticText
      keys:=TtntStaticText(Components[i]).Caption;
      if GetLangName(LangStr,keys)<>'' then
        TtntStaticText(Components[i]).Caption:=GetLangName(LangStr,keys);
    end
  end;
end;
end;

procedure AddMiniTotalToDataSet(SourceDataSet:TCustomADODataset;ObjectDataSet:TClientDataset;MiniWords:WideString='subtotal';InWhichField:integer=0;fieldGroupBy:string='';fieldsStat:wideString='';IsSplit:boolean=true);
{*************************************************************************
TO DO:根據原DataSet及分組字段fieldGroupBy和需要統計的字段fieldsStat 得到新的數據集
Param:SourceDataSet -源數據集
      ObjectDataSet -目標數據集
      MiniWords     -小計名稱的語言代號 默認'subtotal'   輸出為'小計'
      InWhichField  -'小計'寫在第幾個欄位 默認0是第一個
      fieldGroupBy  -小計分組的字段 省略為第一個字段
      fieldsStat    -統計的字段 默認為所有數字integer,float,currency字段
                    -用','把他們隔開  如'ind_no,cut_model,out_model'
      IsSplit       -分組后是否空一行隔開 默認為隔開
attention: 請務必使SourceDataSet 与 ObjectDataSet 的欄位保持一致      
Create by Leo      
Create Date:2005-11-5
Modify Date:2005-11-5
*************************************************************************}
type
  TArrData=array of WideString;
  TFieldStat=array of boolean;
var
  MiniTotal,AllTotal:TArrData;
  FieldStat:TFieldStat;//欄位是否統計
  PreField,GroupBy:String;
  i,j:integer;
  sl_fields:TStringList;
  //mini,all:WideString;
  lang:TWideStrings;
begin
  lang:=GetLangWideStrs(MiniWords+',sumtotal',UserLang);
  if FieldGroupBy='' then  //小計分組的字段 省略為第一個字段
    GroupBy:=SourceDataSet.fields[0].FieldName
  else
    GroupBy:=FieldGroupBy;
  SetLength(FieldStat,SourceDataSet.FieldCount);
  SetLength(MiniTotal,SourceDataSet.FieldCount);
  SetLength(AllTotal,SourceDataSet.FieldCount);

  if fieldsStat='' then //需要統計的字段 默認為所有數字integer,float,currency字段
  begin
    for i:=0 to SourceDataSet.FieldCount-1 do
    begin
      MiniTotal[i]:='0';
      AllTotal[i]:='0';
      if SourceDataSet.Fields[i].DataType in [ftCurrency,ftSmallint,ftInteger,ftFloat,ftBCD] then
        FieldStat[i]:=true
      else
        FieldStat[i]:=false;  
    end;
  end
  else
  begin
    for i:=0 to SourceDataSet.FieldCount-1 do
    begin
      FieldStat[i]:=false;
    end;
    sl_fields:=StrSplit(fieldsStat,',');
    for i:=0 to SourceDataSet.FieldCount-1 do
    begin
      for j:=0 to sl_fields.Count-1 do
      begin
        if SourceDataSet.fields[i].FieldName=trim(sl_fields.Strings[j]) then
        begin
           FieldStat[i]:=true;
           break;
        end;
      end;
    end;
  end;
  //ObjectDataSet.Close;
  //ObjectDataSet.Assign(SourceDataSet.da);
  ObjectDataSet.close;
  ObjectDataSet.CreateDataSet;
  ObjectDataSet.Active:=true;
  with SourceDataSet do
  begin
    first;
    PreField := fieldbyname(GroupBy).AsString;
    while not eof do
    begin
      if PreField=fieldbyname(GroupBy).AsString then
      begin
        ObjectDataSet.Append;
        for i:=0 to FieldCount-1 do
        begin
          ObjectDataSet.Fields[i].AsString:=fields[i].asstring;
          if FieldStat[i] then
          begin
            case fields[i].DataType of
              ftSmallint,ftInteger,ftLargeint:
                begin
                  MiniTotal[i]:=inttostr(strtoInt(MiniTotal[i])+fields[i].AsInteger);
                  AllTotal[i]:=inttostr(strtoInt(AllTotal[i])+fields[i].AsInteger);
                end;
              ftCurrency,ftFloat,ftBCD:
                begin
                  MiniTotal[i]:=floattostr(strtofloat(MiniTotal[i])+fields[i].AsFloat);
                  AllTotal[i]:=floattostr(strtofloat(AllTotal[i])+fields[i].AsFloat);
                end;
              ftString,ftWideString:
                begin
                  if AnsiContainsStr(MiniTotal[i],'.') or AnsiContainsStr(AllTotal[i],'.') or AnsiContainsStr(Fields[i].AsString,'.') then
                  begin
                    if trim(fields[i].AsString)='' then
                    MiniTotal[i]:=floattostr(strtofloat(MiniTotal[i])+fields[i].AsFloat);
                    AllTotal[i]:=floattostr(strtofloat(AllTotal[i])+fields[i].AsFloat);
                  end
                  else
                  begin
                    MiniTotal[i]:=inttostr(strtoInt(MiniTotal[i])+fields[i].AsInteger);
                    AllTotal[i]:=inttostr(strtoInt(AllTotal[i])+fields[i].AsInteger);
                  end;
                end;
            end;//end case
          end;//if FieldStat[i]
        end;//   end for
      end//if PreField=fieldbyname(GroupBy).AsString
      else    //新的一組  加入小計
      begin
        {if IsSplit then//是否空一行
        begin
          ObjectDataSet.Append;
          ObjectDataSet.Fields[InWhichField].AsString:='  ';
        end;   }
        //輸出小計
        ObjectDataSet.Append;
        for i:=0 to FieldCount-1 do
        begin
          if FieldStat[i] then
            ObjectDataSet.Fields[i].AsString:=MiniTotal[i]
          else
            ObjectDataSet.Fields[i].AsString:='';
        end;
        ObjectDataSet.Fields[InWhichField].AsString:=GetLangName(lang,MiniWords);

        if IsSplit then//是否空一行
        begin
          ObjectDataSet.Append;
          ObjectDataSet.Fields[InWhichField].AsString:='  ';
        end;
        //接著統計
        PreField := fieldbyname(GroupBy).AsString;
        ObjectDataSet.Append;
        for i:=0 to FieldCount-1 do
        begin
          ObjectDataSet.Fields[i].AsString:=fields[i].asstring;
          if FieldStat[i] then
          begin
            case fields[i].DataType of
              ftSmallint,ftInteger:
                begin
                  MiniTotal[i]:=fields[i].AsString;
                  AllTotal[i]:=inttostr(strtoInt(AllTotal[i])+fields[i].AsInteger);
                end;
              ftCurrency,ftFloat,ftBCD:
                begin
                  MiniTotal[i]:=fields[i].AsString;
                  AllTotal[i]:=floattostr(strtofloat(AllTotal[i])+fields[i].AsFloat);
                end;
              ftString,ftWideString:
                begin
                  if AnsiContainsStr(AllTotal[i],'.') or AnsiContainsStr(Fields[i].AsString,'.') then
                  begin
                    if trim(fields[i].AsString)='' then
                    MiniTotal[i]:=fields[i].AsString;
                    AllTotal[i]:=floattostr(strtofloat(AllTotal[i])+fields[i].AsFloat);
                  end
                  else
                  begin
                    MiniTotal[i]:=fields[i].AsString;
                    AllTotal[i]:=inttostr(strtoInt(AllTotal[i])+fields[i].AsInteger);
                  end;
                end;
            end;//end case
          end;//if FieldStat[i]
        end;//   end for

      end;
      next;
    end;//end while

    if IsSplit then//是否空一行
    begin
      ObjectDataSet.Append;
      ObjectDataSet.Fields[InWhichField].AsString:='  ';
    end;
    //輸出小計
    ObjectDataSet.Append;
    for i:=0 to FieldCount-1 do
    begin
      if FieldStat[i] then
        ObjectDataSet.Fields[i].AsString:=MiniTotal[i]
      else
        ObjectDataSet.Fields[i].AsString:='';
    end;
    ObjectDataSet.Fields[InWhichField].AsString:=GetLangName(lang,MiniWords);

    if IsSplit then//是否空一行
    begin
      ObjectDataSet.Append;
      ObjectDataSet.Fields[InWhichField].AsString:='  ';
    end;
    
    //總計
    ObjectDataSet.Append;
    for i:=0 to FieldCount-1 do
    begin
      if FieldStat[i] then
        ObjectDataSet.Fields[i].AsString:=AllTotal[i]
      else
        ObjectDataSet.Fields[i].AsString:='';
    end; //end 總計
    ObjectDataSet.Fields[InWhichField].AsString:=GetLangName(lang,'sumtotal');
  end;
end;

procedure GetDeptRange(comboBoxName:TtntComboBox;WithCombo:boolean=true);
var
  sql_str,where_str,dept_code,dept_list:string;
begin

  sql_str:='select * from user_dept where sys_code=''hrd'' and user_id='''+username+'''';
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    where_str:='1=2';
    if Eof then
    begin //沒有部門紀錄
      //if ( copy( username,1,1) ='V' ) or ( copy(username,1,1)='v') then
      //  sql_str:='select dept_code+'' ''+abbr_titl from hrd_dept where is_del=''0'' and dept_code like ''S%'''
     //else //2012-06-13 hyt delete
      sql_str:='select dept_code+'' ''+abbr_titl from hrd_dept where is_del=''0''';
      if WithCombo then
        SetComboxList(sql_str,comboBoxName);
    end
    else
    begin
      while not Eof do
      begin
        dept_code:=trim(FieldByName('dept_code').AsString);
        if dept_code='' then    //2012-09-07 hyt add
        begin
          dept_code:='[F|S]'
        end;
        if length(dept_code)<6 then
        begin //添加一個部門範圍
          where_str:=where_str+' or dept_code like '''+dept_code+'%''';
          next;
        end
        else
        begin //添加一個部門
          dept_list:=dept_list+''''+dept_code+''''+',';
          next;
        end;
      end;
      dept_list:=leftstr(dept_list,length(dept_list)-1);
      if dept_list<>'' then
        where_str:=where_str+' or dept_code in ('+dept_list+')';
       //if ( copy( username,1,1) ='V' ) or ( copy( username,1,1) ='v' )  then
       //     sql_str:='select dept_code+'' ''+abbr_titl from hrd_dept where '
       // +'('+where_str+') and is_del=''0'' and dept_code like ''S%'''
       //else //2012-06-13 hyt delete

      sql_str:='select dept_code+'' ''+abbr_titl from hrd_dept where '
              +'('+where_str+') and is_del=''0''';
      //***<<<2012-10-17 hyt upd
      if (G_sFactory='V') and (userLang='V') then
      begin
        sql_str:='select dept_code+'' ''+vim_titl from hrd_dept where '
                +'('+where_str+') and is_del=''0''';
      end;
      //***>>>

      if WithCombo then
        SetComboxList(sql_str,comboBoxName);
    end;
    UserDeptStr:='('+where_str+')';
    if WithCombo then
    begin
    if comboBoxName.Items.Count<100 then
      comboBoxName.Style:=csDropDownList
    else
      comboBoxName.Style:=csDropDown;
    if LowerCase(RightStr(comboBoxName.Name,3))='end' then
      comboBoxName.ItemIndex:=comboBoxName.Items.Count-1
    else if LowerCase(RightStr(comboBoxName.Name,5))='begin' then
      comboBoxName.ItemIndex:=0
    else
      comboBoxName.ItemIndex:=-1;
    end;
  end;
end;

function GetNormalBase( Empid, paymon, PstCode,EduCode:String;EmpInDate:TDateTime;SalBaseLvl:TStrings;WithTestDay:boolean=true;ValidDate:TDateTime=0):Currency;
//取得某職稱正式薪資基數
var
  PayNormal:double;
  edu_no:integer;
  lcdValidDate:TDateTime;
begin
//if paymon < '200905'  then
  //   begin
  if ValidDate=0 then
    lcdValidDate:=date
  else
    lcdValidDate:=ValidDate;

  PayNormal:= GetBasepay( Empid ) ;
  if PayNormal <=0  then
  begin
       if SalBaseLvl.IndexOf(PstCode)>=0 then
          PayNormal:=StrToFloat(SalBaseLvl.Strings[SalBaseLvl.IndexOf(PstCode)+1]);
          if( pstcode ='60' )  then
             PayNormal:=PayNormal + 170000 ;   //2008.01 起職員作業員薪資上浮190000
          if ( pstCode ='50' ) then
             PayNormal:=PayNormal + 190000 ;   //2008.01 起職員作業員薪資上浮190000
          if ( pstCode ='46' ) or ( pstcode ='41' ) or ( pstcode ='42' )  then
             PayNormal:=PayNormal + 172000 ;  // 2008.01 起班長級薪資上浮172000
          if ( pstCode ='33' ) or ( pstcode ='37' )  then
             PayNormal:=PayNormal + 242000 ;  // 2008.01 起組長級薪資上浮242000
          if ( pstCode ='22' ) or ( pstcode ='26' ) or ( pstcode ='28' )  then
             PayNormal:=PayNormal + 342000 ;  // 2008.01 起課長級薪資上浮342000
          if ( pstCode ='18' ) or ( pstcode ='19' )   then
             PayNormal:=PayNormal + 442000 ;  // 2008.01 起主任級薪資上浮90000
  //   end;
       if WithTestDay then//返回試用期薪資
          begin
            if IsTestEmp(EmpInDate,lcdValidDate,PstCode) then
               begin//試用期薪資
                 if paymon <= '200809'  then
                    PayNormal:=StrToFloat(SalBaseLvl.Strings[1] ) + 90000
                 else
                   begin
                     if paymon < '200901'  then
                        PayNormal:=StrToFloat(SalBaseLvl.Strings[1] ) + 150000
                     else
                        PayNormal:=StrToFloat(SalBaseLvl.Strings[1] ) + 150000;
                   end;
               end;
          end;
 // if paymon >='200901'  then
   //  PayNormal := PayNormal + 150000;
  //if paymon >='200810'  then
     PayNormal:= PayNormal + Get45s(EmpInDate,Empid, PstCode,'200812',PayNormal ) +GetLongWorkPay(EmpInDate,empid,PstCode,'200812');
     if paymon >='200901' then
        begin
          PayNormal :=PayNormal + 150000 ;
          result:=PayNormal + Get45s(EmpInDate,Empid, PstCode,paymon,PayNormal ) ; //+GetLongWorkPay(EmpInDate,empid,PstCode,paymon);
        end
     else
          result:=PayNormal ;
  end

  else
//   begin
   result:=PayNormal ;
//   end;
 //  GetLongWorkPay( EmpInDate,empid,PstCode,PayMon)
end;

function GetAllBaseLvl:TStrings;
//取得所有基本薪資,職位對應金額
var
  re_sal:TStrings;
begin
  re_sal:=TstringList.Create;
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_sal_lvl_base order by pst_code desc');
    open;
    //SalBaseLvl:=TstringList.Create;
    while not Eof do
    begin
      re_sal.Add(FieldByName('pst_code').AsString);
      re_sal.Add(FieldByName('money').AsString);
      Next;
    end;
  end;
  result:=re_sal;
end;

function GetYearHol(AEmpId,AYear:string):TStrings;
//取得年假數
var
  //FestDays_17 安排年休
  AllDays,HasDays,FestDays, HasDays_17, RestDays,WorkMinu,WorkHour, work_time,HasTime:double;
  Flds:TFields;
  epindt,s_time,e_time,t_time,s_date,e_date,the_date:TDateTime;
  SqlStr,pst_code,factory,AFestDay,FestMon,FestMon1,FestDay:string;
  RDays:TStrings;
  i:integer;
  //
  sSQL, sFieldName: string;
begin
  RDays:=TStringList.Create;
  AllDays:=12;
  HasDays:=0;
  FestDays:=0;
  HasDays_17:= 0;
  //計算一年共可請假天數
  Flds:=GetEmpInfo(AEmpId);
  epindt:=Flds.FieldByName('epindt').AsDateTime;
  pst_code:=Flds.FieldByName('pst_code').AsString;
  factory:=Flds.FieldByName('factory').AsString;
  //當年進廠
  if yearof(epindt)=StrToInt(AYear) then
  begin
    if MonthOf(epindt-10)<>12 then
      AllDays:=AllDays-MonthOf(epindt-10);
  end;
  //先前進廠
  if yearof(epindt)< StrToInt(AYear) then
  begin
    if int( ( StrToInt(AYear) - yearof(epindt) ) /5 ) > 0  then
      AllDays:=12 + int( ( StrToInt(AYear) - yearof(epindt) ) /5 );
  end;
  //最多15天
  if AllDays > 15 then AllDays := 15 ;
  //
  AllDays:=AllDays + getholiday(AEmpId,AYear) ;


  {2017.02.18 改從月考勤抓資料
  //取得已經請假天數
  if AYear = '2010' then
    SqlStr:='select * from hrd_dut_ask where emp_id='''+AEmpId+''''
    +' and clas_code=''16'' and year(s_ask_d)='''+AYear+''' and month(s_ask_d) >=''2'''
  else
    SqlStr:='select * from hrd_dut_ask where emp_id='''+AEmpId+''''
    +' and clas_code=''16'' and year(s_ask_d)='''+AYear+'''';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(SqlStr);
    Open;
    while not Eof do
    begin
      s_date:=DateOf(FieldByName('s_ask_d').AsDateTime);
      e_date:=DateOf(FieldByName('e_ask_d').AsDateTime);
      if s_date<>e_date then//起至日期相同不考慮
        HasDays:=HasDays+e_date-s_date-GetRestDayCount(S_Date,E_Date,AEmpId);
      s_time:=ShortstrToTime(FieldByName('s_ask_h').AsString+FieldByName('s_ask_t').AsString);
      e_time:=ShortstrToTime(FieldByName('e_ask_h').AsString+FieldByName('e_ask_t').AsString);
      t_time:=e_time-s_time;
       ////////////////////////////////////////////////////////////////////////////
      if  StrToInt(LeftStr(FieldByName('e_ask_h').AsString,2))-StrToInt(LeftStr(FieldByName('s_ask_h').AsString,2) ) = 9 then
        WorkHour:=WorkHour+ 8
      else
        WorkHour:=WorkHour+( StrToIntDef(LeftStr(FieldByName('e_ask_h').AsString,2), 0)-
                             StrToIntDef(LeftStr(FieldByName('s_ask_h').AsString,2), 0)); //-1;
      workhour := ( e_date - s_date )*8  + workhour ;
      WorkMinu:=WorkMinu+ StrToIntDef(RightStr(FieldByName('e_ask_t').AsString,2), 0)-
                          StrToIntDef(RightStr(FieldByName('s_ask_t').AsString,2), 0);
      //
      if WorkMinu<0 then
      begin
        WorkHour:=WorkHour-1;
        WorkMinu:=WorkMinu+60;
      end;
      WorkMinu:=WorkMinu/60;

      //////////////////////////////////////////////////////////////////////////////
      Hastime := WorkHour + WorkMinu ; 
      if Abs(24*t_time-4)<1.2 then
        t_time:=4/24;//3,5個小時調整為半天
      if Abs(24*t_time-8)<1.2 then
        t_time:=8/24;//7,9個小時調整為一天
      HasDays:=HasDays+t_time*3;
      Next;
    end;
  end;
  }
  
  //2017.02.18 取得員工個人已休的年假天數
  sSQL := 'SELECT *'
        + '  FROM HRD_DUT_MON'
        + ' WHERE SUBSTRING(DUT_MON, 1, 4) = '+QuotedStr(AYear)
        + '   AND CLAS_CODE = ''16'''
        + '   AND EMP_ID = '+QuotedStr(AEmpId);
  with DMHrdsys.SQLQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    HasDays := 0;
    while not Eof do
    begin
      //
      for I := 1 to 31 do
      begin
        sFieldName := Format('day%.2d', [I]);
        //
        if (not FieldByName(sFieldName).IsNull) and (Trim(FieldByName(sFieldName).AsString)<> '') then
          HasDays := HasDays + StrToInt(Copy(FieldByName(sFieldName).AsString, 1, 2)) + StrToInt(Copy(FieldByName(sFieldName).AsString, 3, 2))/60.
      end;
      //
      Next;
    end;
    Close;
  end;
  //小時轉換為天
  HasDays := HasDays / 8;

  //取得春節休假天數
  //AFestDay:='2011/01/31';//當年春節日期第一天
  {if leftStr(AEmpId,1)='8' then
    AFestDay:='2012/01/20'
  else
    AFestDay:='2012/01/21';//當年春節日期第一天  2012-01-18 hyt upd==20=>21(2012-03-22)
    }       //2013-02-20 hyt delete
  //AFestDay:='2013/02/08';//當年春節日期第一天     2013-02-20 hyt add 7==>8 2013-03-02 hyt upd
   //2014-02-19 hyt delete
  //AFestDay:='2014/01/27';//當年春節日期第一天     2013-02-20 hyt add 7==>8 2013-03-02 hyt upd
  //2015.01.13
  AFestDay:='2015/02/16';//當年春節日期第一天

  //
  FestMon:=midStr(AFestDay,6,2);
  FestDay:=RightStr(AFestDay,2);
  if ( AYear + FestMon='201102') or (AYear + FestMon='201101') then
  begin
    FestMon1:= inttostr( strtoint( FestMon ) -1 )  ;
    if FestMon ='01'  then
    begin
      FestMon1 :='01'  ;
      FestMon :='02' ;
    end ;
    //
    if Length(FestMon1 ) < 2 then
      FestMon1 :='0' + FestMon1 ;
  end;

  //SUBSTRING(DUT_MON, 1, 4)

  //
  {
  if ( AYear + FestMon='201102' ) or (AYear + FestMon='201101') then
      SqlStr:='select * from hrd_dut_mon where dut_mon >='''+ AYear+FestMon1 + ''' and dut_mon<='''+AYear+FestMon+''''
    +' and emp_id='''+AEmpId+''' and ( clas_code=''17'' or  clas_code=''18'')'
  else if (AYear='2014' )  then   //2014-02-19 hyt add
    SqlStr:='select * from hrd_dut_mon where dut_mon >=''201401'' and dut_mon<=''201402'''
    +' and emp_id='''+AEmpId+''' and ( clas_code=''17'' or  clas_code=''18'')'
  else
    SqlStr:='select * from hrd_dut_mon where dut_mon='''+AYear+FestMon+''''
           +' and emp_id='''+AEmpId+''' and ( clas_code=''17'' or  clas_code=''18'')'; //2012-01-31 hyt upd
  }

  if ( AYear + FestMon='201102' ) or (AYear + FestMon='201101') then
      SqlStr:='select * from hrd_dut_mon where SUBSTRING(DUT_MON, 1, 4) = '+QuotedStr(AYear)
    +' and emp_id='''+AEmpId+''' and ( clas_code=''17'' or  clas_code=''18'')'
  else if (AYear='2014' )  then   //2014-02-19 hyt add
    SqlStr:='select * from hrd_dut_mon where SUBSTRING(DUT_MON, 1, 4) = '+QuotedStr(AYear)
    +' and emp_id='''+AEmpId+''' and ( clas_code=''17'' or  clas_code=''18'')'
  else
    SqlStr:='select * from hrd_dut_mon where SUBSTRING(DUT_MON, 1, 4) = '+QuotedStr(AYear)
           +' and emp_id='''+AEmpId+''' and ( clas_code=''17'' or  clas_code=''18'')'; //2012-01-31 hyt upd
  //         
  with DMHrdsys.SQLQuery2 do
  begin//查月檔是否春節年假
    close;
    sql.Clear;
    sql.Add(SqlStr);
    Open;
    if ( AYear + FestMon='201102' ) or ( AYear + FestMon='201101' )  or ( AYear ='2014' ) then      //2014-02-19 hyt add 2014
    begin
      while not Eof do
      begin
        //安排年休 2015.01.13 sanjin
        if FieldByName('CLAS_CODE').AsString='17' then
        begin
          for i:=1 to 31  do //+11 do
          begin
            if FieldByName('day'+Format('%.2d', [i])).AsString='0800' then
              HasDays_17:= HasDays_17+1;
            if FieldByName('day'+Format('%.2d', [i])).AsString='0400' then
              HasDays_17:= HasDays_17+0.5;
          end;
        end
        else begin
          for i:=1 to 31  do //+11 do
          begin
            if FieldByName('day'+Format('%.2d', [i])).AsString='0800' then
              FestDays:=FestDays+1;
            if FieldByName('day'+Format('%.2d', [i])).AsString='0400' then
              FestDays:=FestDays+0.5;
          end;
        end;
        Next ;
      end;
    end
    else begin
      {
      if not Eof then
      begin
        for i:=StrToInt(FestDay) to StrToInt(FestDay)+10 do //8==>10 2013-02-20 hyt upd
        begin
          if i>=32 then    //2014-02-19 hyt add
            continue ;
          //if FieldByName('day'+Format('%.2d', [i])).AsString<>'' then
          //   FestDays:=FestDays+1;
          //2013-07-23 hyt upd

          //安排年休 2015.01.13 sanjin
          if FieldByName('CLAS_CODE').AsString='17' then
          begin
            if FieldByName('day'+Format('%.2d', [i])).AsString='0800' then
               HasDays_17:= HasDays_17+1;
            if FieldByName('day'+Format('%.2d', [i])).AsString='0400' then
               HasDays_17:= HasDays_17+0.5;
          end
          else begin
            if FieldByName('day'+Format('%.2d', [i])).AsString='0800' then
               FestDays:=FestDays+1;
            if FieldByName('day'+Format('%.2d', [i])).AsString='0400' then
               FestDays:=FestDays+0.5;
          end;
        end;
      end
      else
        FestDays:=0;
      }
      First;
      while not Eof do
      begin
        //安排年休 2015.01.13 sanjin
        if FieldByName('CLAS_CODE').AsString='17' then
        begin
          //
          for I:= 1 to 31 do
          begin
            if FieldByName('day'+Format('%.2d', [i])).AsString='0800' then
               HasDays_17:= HasDays_17+1;
            if FieldByName('day'+Format('%.2d', [i])).AsString='0400' then
               HasDays_17:= HasDays_17+0.5;
          end;
        end
        else begin
          for I := 1 to 31 do
          begin
            if FieldByName('day'+Format('%.2d', [i])).AsString='0800' then
               FestDays:=FestDays+1;
            if FieldByName('day'+Format('%.2d', [i])).AsString='0400' then
               FestDays:=FestDays+0.5;
          end;
        end;
        Next;
      end;
    end;
  end;
  //
  if (FestDays<>0) then
  begin//查是否按正常請假請春節年假
    if AYear + FestMon='201201' then //2012-07-03 hyt add
    begin
      if leftStr(AEmpId,1)='8' then
        AFestDay:='2012/01/21'
    end;
    //
    SqlStr:='select * from hrd_dut_ask where emp_id='''+AEmpId+''''
      +' and clas_code=''16'' and '''+AFestDay+''' between s_ask_d and e_ask_d';
    if CheckRecordExist(SqlStr) then
      FestDays:=0;
  end;
  //這三人是從V2進出口轉過來的，他們在V2已休部分年假。
  if AYear= '2016' then
  begin
    if AEmpId= '079521' then
      HasDays := HasDays + 3;
    if AEmpId= '079762' then
      HasDays := HasDays + 7.5;
    if AEmpId= '810582' then
      HasDays := HasDays + 1;  
  end;



  //2015.01.13 sanjin HasDays_17:安排年休
  RestDays:=AllDays-HasDays-FestDays - HasDays_17;//取得剩餘可請假天數
  //0
  RDays.Add(FloatToStr(AllDays));//總計可請年假天數
  //1
  RDays.Add(FloatToStr(HasDays));//已請年假天數
  //2
  RDays.Add(FloatToStr(FestDays));//春節年假天數
  //3
  RDays.Add(FloatToStr(RestDays));//剩餘年假天數
  //4
  RDays.Add(FloatToStr(HasTime));//剩餘年假小時
  //5 安排年休 2015.01.13 sanjin
  RDays.Add(FloatToStr(HasDays_17));
  result:=RDays;
end;

function GetRestDayCount(SDate,EDate:TDateTime;AEmpId:string=''):Integer;
{===============================================================================
  函數名稱:GetRestDayCount -- 得到輸入範圍內的休息日數
  參數:    SDate --開始日期 EDate --結束日期 AEmpId --工號(無工號按星期天統計)
===============================================================================}
var
  i,Count:Integer;
  ADate:TDateTime;
  sqlstr,dut_mon,dut_day:string;
begin
  Count:=0;
  ADate:=SDate;
  dut_mon:=FormatDateTime('yyyymm',SDate);
  if AEmpId='' then//默認無工號按周日加一天
  while DateOf(ADate)<=DateOf(EDate) do
  begin
    if DayOfWeek(ADate)=1 then
      Inc(Count);
    ADate:=ADate+1;
  end
  else//有工號查排班是公休加一天
  begin
    SqlStr:='select * from hrd_dut_tms A'
      +' where A.emp_id='''+AEmpId+'''  and A.tms_mon='''+dut_mon+'''';
    with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add(SqlStr);
      Open;
      while DateOf(ADate)<=DateOf(EDate) do
      begin
        dut_day:=FormatDateTime('dd',ADate);
        if not Eof then
        begin//排公休班加一天
          if trim(FieldByName('day'+dut_day+'_tms').AsString)<>'' then
          begin//該日有排班資料
            if trim(FieldByName('day'+dut_day+'_tms').AsString)='90' then
              Inc(Count);
          end
          else
          begin//該日無排班資料
            if DayOfWeek(ADate)=1 then
              Inc(Count);
          end;
        end
        else
        begin//星期天加一天
          if DayOfWeek(ADate)=1 then
            Inc(Count);
        end;
        ADate:=ADate+1;
      end;
    end;
  end;
  Result:=Count;
end;

function getNewEmpId(Factory:string='V'):string;
//get emp_id
var
  emp_no:integer;
  emp_str,sqlstr:string;
begin
 if Factory='B' then//大陸 mizuno
    sqlstr:='SELECT MAX(emp_id) as emp_id FROM fhrd_emp  where emp_id <=''109999'''
 else if Factory='A' then//大陸 adidas
    sqlstr:='SELECT MAX(emp_id) as emp_id FROM fhrd_emp where emp_id >=''600000'' and emp_id <''699999'''
 else if Factory='L' then//越籍adidas
    //sqlstr:='SELECT MAX(emp_id) as emp_id FROM hrd_emp where  emp_id >=''810000''' //emp_id<''030000'' or emp_id>=''080000''' //hyt upd 2008-07-14
    sqlstr:='SELECT MAX(emp_id) as emp_id FROM hrd_emp where emp_id >=''200000'' and emp_id <''299999'''
 else//越籍鞋廠 fuluh mizuno
    sqlstr:='SELECT MAX(emp_id) as emp_id FROM hrd_emp where emp_id <=''109999''';  //

//  sqlstr:='SELECT MAX(emp_id) as emp_id FROM hrd_emp';
  with DMHrdsys.SQLQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    emp_no:=FieldByName('emp_id').asinteger;
    {if emp_no=59999 then
      emp_no:=69999;//鞋廠工號段從050000跳到070000}
    emp_no := emp_no + 1;
    emp_str := Format('%.6d', [emp_no]);
  end;
result:=emp_str;
end;

//2016.07.13 按年份產生新工號
function getNewEmpId_New(EpInDT: TDateTime):string;
var
  sSQL, sYear: string;
begin
  sYear := FormatDateTime('YY', EpInDT);
  sYear := Copy(sYear, 1, 2);
  sSQL := 'select max(emp_id_new) as emp_id_new from hrd_emp where emp_id_new like '+QuotedStr(sYear+'%');
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    if (IsEmpty) or (FieldByName('emp_id_new').IsNull) then
      Result := sYear + Format('%.4d', [1])
    else
      Result := sYear + Format('%.4d', [StrToInt(Copy(FieldByName('emp_id_new').AsString, 3, 4))+1]);
    Close;
  end;
end;


function IsTestEmp(epindt,ADate:TDateTime;PstCode:string):boolean;
//判斷是否試用期
var
  diffDate:TDatetime;
begin
  DiffDate:=ADate-epindt;
  if (DiffDate<30) or ((DiffDate<60) and (PstCode<='50')) then
    result:=true
  else
    result:=false;
end;

function  GetSalBaoBu(EmpId,PayMon:String):Currency;
//員工 病假補貼(保險公司)   hyt add 2006-08-18
var
  lcsMonSDate,lcsMonEDate:string;
  lcCurVal:Currency;
begin
  lcCurVal:=0;
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select bao_amt from hrd_sal_bao '+
            ' where sal_mon='''+PayMon+
            ''' and emp_id='''+EmpId+'''');
    open;
    if not Eof then
      lcCurVal:=lcCurVal+FieldByName('bao_amt').AsCurrency ;
  end;
  Result:=lcCurVal;
end;

procedure  ChangeSalDept(mon:String);
//修正到月末的部門，職稱
var
  sqlstr,DateStr:string;
  ADate:TDatetime;
begin
  ADate:=EnCodeDate(StrToInt(LeftStr(mon,4)),StrToInt(RightStr(mon,2)),1);
  ADate:=EndOfTheMonth(ADate)+1;//下月第一天
  DateStr:=FormatDateTime('yyyy/mm/dd',ADate);
  sqlStr:='update hrd_sal_paymt set dept_code=A.dept_code,pst_code=A.pst_code '
    +' from hrd_emp_log A,hrd_sal_paymt B where A.emp_id=B.emp_id and B.pay_mon='''+mon+''''
    +' and this_date>'''+DateStr+''' and last_date<'''+DateStr+''' and A.operate_action=''Before_Upd'''
    +' and (A.dept_code <>B.dept_code or A.pst_code<>B.pst_code)';
  with DMHrdsys.ADOCommand1 do
  begin
    CommandText:=sqlStr;
    Execute;
  end;
end;
function GetLongWork( InDate,CurDate:TDateTime;pstcode:string=''):real;
{===============================================================================
  函數名稱:GetRestDayCount -- 得到輸入範圍內的休息日數
  參數:    SDate --開始日期 EDate --結束日期 AEmpId --工號(無工號按星期天統計)
===============================================================================}
var
  i :integer;
  clsql, clYear, clfield :string ;
  LongWorkPay, nlYear,nYear : real ;
begin
  LongWorkPay := 0;
  nYear := CurDate - InDate ;
  if int ( nYear/365 ) > 0 then
     nlYear := int( nYear/365 )
  else
     nlYear := 1 ;
  if length( floattostr( nlYear ) ) < 2 then
     clYear := '0'+floattostr( nlYear )
  else
     clYear := floattostr( nlYear );
  with DMHrdsys.SQLQuery1 do
  begin
    clsql :='select * from hrd_sal_lvl_longwork where pst_code=''' + pstcode + '''';
    close;
    sql.Clear;
    sql.Add( clsql );
    open;
    //SalBaseLvl:=TstringList.Create;
    if not Eof then
    begin
      for i := 0 to DMHrdsys.SQLQuery1.FieldCount -1 do
         begin
           clfield := DMHrdsys.SQLQuery1.Fields.Fields[i].DisplayName  ;
           clfield := copy( clfield, 5, 2 ) ;
           if clfield = clYear then
              begin
                clfield := 'Year'+clYear ;
                LongWorkPay := nlYear * DMHrdsys.SQLQuery1.fieldbyname(clfield).AsCurrency;

              end;
         end;
     end;
  end;
  result:=LongWorkPay ;
end;
//取 轉越文的數字.
function GetVNDBigAMT(amt:double;QianWei:boolean=true):widestring;
type
  TVNDArr=array [1..9] of widestring;
var
  BanChu,SoDoI,Un:widestring;
  VNDLang:TWideStrings;
  UseWord:string;
  Kong,Dong,MaxCurrency,
  One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten,
  Mao,
  Million,Billion,Thousand,hundred,
  Zero,Five1,One1,Zheng,Ten1:widestring;
  amtstr,
  THBLLN,BLLN,MLLN,TH,DNG,Fen:string; //萬億，十億，百萬，千，盾,分
  I,tram,Muoi,Donvi:integer;
  VNDArr:TVNDArr;
begin
  amtstr:=floattostr(amt);
  VNDLang:=TWideStrings.Create;
  UseWord:='kong,MaxCurrency,one,two,three,four,five,six,seven,eight,nine,ten,mao,dong,million,billion,thousand,hundred,zero,five1,one1,zheng,ten1';
  VNDLang:=GetLangWideStrs(UseWord,'V');
  Kong:= GetLangName(VNDLang,'kong');
  Dong:=GetLangName(VNDLang,'dong');
  MaxCurrency:= GetLangName(VNDLang,'MaxCurrency');
  One:=GetLangName(VNDLang,'One');
  Two:=GetLangName(VNDLang,'Two');
  Three:=GetLangName(VNDLang,'Three');
  Four:=GetLangName(VNDLang,'Four');
  Five:=GetLangName(VNDLang,'Five');
  Six:=GetLangName(VNDLang,'Six');
  Seven:=GetLangName(VNDLang,'Seven');
  Eight:=GetLangName(VNDLang,'Eight');
  Nine:=GetLangName(VNDLang,'Nine');
  Ten:=GetLangName(VNDLang,'Ten');
  Mao:=GetLangName(VNDLang,'Mao');
  Million:=GetLangName(VNDLang,'Million');
  Billion:=GetLangName(VNDLang,'Billion');
  Thousand:=GetLangName(VNDLang,'Thousand');
  hundred:=GetLangName(VNDLang,'hundred');
  Zero:=GetLangName(VNDLang,'Zero');
  Five1:=GetLangName(VNDLang,'Five1');
  One1:=GetLangName(VNDLang,'One1');
  Zheng:=GetLangName(VNDLang,'Zheng');
  Ten1:=GetLangName(VNDLang,'Ten1');
  VNDArr[1]:=One;
  VNDArr[2]:=Two;
  VNDArr[3]:=Three;
  VNDArr[4]:=Four;
  VNDArr[5]:=Five;
  VNDArr[6]:=Six;
  VNDArr[7]:=Seven;
  VNDArr[8]:=Eight;
  VNDArr[9]:=Nine;
  if amt=0 then
  begin
    result:=widestring(Kong)+' '+widestring(Dong);
    exit;
  end;
  if amt>922337203685477 then
  begin
    result:=GetLangName(VNDLang,'MaxCurrency');
    exit;
  end;
  FEN:='0';
  if Ansicontainstext(amtstr,'.') then
  begin
    FEN:=strsplit(AmtStr,'.')[1];
    AmtStr:=strsplit(AmtStr,'.')[0];
    if FEN='' then
      FEN:='0';
  end;
  if length(AmtStr)<=3 then
  begin
    THBLLN:='0';
    BLLN:='0';
    MLLN:='0';
    TH:='0';
    DNG:=AmtStr;
  end
  else if (length(AmtStr)<=6) and (length(AmtStr)>3) then
  begin
    THBLLN:='0';
    BLLN:='0';
    MLLN:='0';
    TH:=leftstr(AmtStr,length(AmtStr)-3);
    DNG:=rightstr(AmtStr,3);
  end
  else if (length(AmtStr)<=9) and (length(AmtStr)>6) then
  begin
    THBLLN:='0';
    BLLN:='0';
    MLLN:=leftstr(AmtStr,length(AmtStr)-6);
    TH:=midstr(AmtStr,length(AmtStr)-5,3);
    DNG:=rightstr(AmtStr,3);
  end
  else if (length(AmtStr)<=12) and (length(AmtStr)>9) then
  begin
    THBLLN:='0';
    BLLN:=leftstr(AmtStr,length(AmtStr)-9);
    MLLN:=midstr(AmtStr,length(AmtStr)-8,3);
    TH:=midstr(AmtStr,length(AmtStr)-5,3);
    DNG:=rightstr(AmtStr,3);
  end
  else if (length(AmtStr)<=15) and (length(AmtStr)>12) then
  begin
    THBLLN:=leftstr(AmtStr,length(AmtStr)-12);
    BLLN:=midstr(AmtStr,length(AmtStr)-11,3);
    MLLN:=midstr(AmtStr,length(AmtStr)-8,3);
    TH:=midstr(AmtStr,length(AmtStr)-5,3);
    DNG:=rightstr(AmtStr,3);
  end;
  if (THBLLN='0') and (BLLN='0') and(MLLN='0') and(TH='0') and(DNG='0') then
  begin
    BanChu:=widestring(Kong)+' '+widestring(Dong)+' ';
    I:=5;
  end
  else
    I:=0;
  while I<=5 do
  begin
    Case I of
      0:begin
          SoDoI:=THBLLN;
          Un:=widestring(Thousand)+' '+widestring(Billion);
        end;
      1:begin
          SoDoI:=BLLN;
          Un:=Billion;
        end;
      2:begin
          SoDoI:=MLLN;
          Un:=Million;
        end;
      3:begin
          SoDoI:=TH;
          Un:=Thousand;
        end;
      4:begin
          SoDoI:=DNG;
          Un:=Dong;
        end;
      5:begin
          SoDoI:=FEN;
          Un:=Mao;
        end;
    end;
    if (SoDoI<>'0') and (SoDoI<>'') then
    begin
      Tram:=strtoint(SoDoI) div 100;
      Muoi:=(strtoint(SoDoI)-(Tram*100)) div 10;
      Donvi:=strtoint(SoDoI)-(Tram*100)-(Muoi*10);
      if (BanChu<>'') and (QianWei) then //hyt upd 2006-09-20
        BanChu:=BanChu+',';
      //百位
      if tram<>0 then
        BanChu:=BanChu+' '+VNDArr[tram]+' '+hundred+' ';
      //十位
      if (Muoi=0) and (Tram<>0)  and (Donvi<>0) then
        BanChu:=BanChu+Zero+' '
      else if Muoi<>0 then
      begin
        if Muoi<>1 then
          BanChu:=BanChu+VNDArr[Muoi]+' '+ten+' '
        else
          BanChu:=BanChu+ten1+' ';
      end;
      //個位
      if (Muoi<>0) and (DonVi=5) then
        BanChu:=BanChu+five1+' '+Un+' '
      else if (Muoi>1) and (DonVi=1) then
        BanChu:=BanChu+one1+' '+Un+' '
      else
      begin
        if Donvi<>0 then
          BanChu:=BanChu+VNDArr[Donvi]+' '+Un+' '
        else
          BanChu:=BanChu+Un+' '
      end;
    end
    else
    begin
      if I=4 then
        BanChu:=BanChu+Dong+' ';
    end;
    inc(I);
  end;
  if (FEN='0') or (FEN='') then
  begin
    BanChu:=BanChu+zheng;
  end;
  result:=BanChu;
end;
 //計算久任獎金
function  Get45s(EpIndt:TDateTime;empid, PstCode,PayMon:String;basepay:double ):Currency;
var
  InMon:String;
  years,AIndex:integer;
begin
  InMon:=FormatDateTime('yyyymm',EpIndt);
  years:=(StrToInt(PayMon)-StrToInt(InMon)) Div 100;
  if years > 10 then
     years :=10 ;
  if years>=1 then
  begin
     if paymon <'200901'  then
        result:=( Int(years ) -1 )*45000
     else
        result:= basepay*0.05 ;

    if ( empid='005172' )  and  ( empid='006514' )    then
       begin
         if paymon <'200901'  then
            result:=( Int(years ) -3 )*45000
         else
            result:= basepay*0.05 ;
       end;
  end
  else
    result:=0;

end;
//取得久任獎金基數
function GetLongWorkLvl:TStrings;
var
  re_sal:TStrings;
  i:integer;
begin
  re_sal:=TstringList.Create;
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_sal_lvl_longwork order by pst_code desc');
    open;
    //SalBaseLvl:=TstringList.Create;
    while not Eof do
    begin
      for i:=0 to FieldCount -1 do
        re_sal.Add(Fields[i].AsString);
      Next;
    end;
  end;
  result:=re_sal;
end;

//計算久任獎金
function GetLongWorkPay(EpIndt:TDateTime;empid,PstCode,PayMon:String):Currency;
var
  InMon:String;
  years,AIndex:integer;
  SalLongWorkLvl:TStrings;//久任獎金等級額
begin
  SalLongWorkLvl:=GetLongWorkLvl;//取得所有久任獎金等級額
  InMon:=FormatDateTime('yyyymm',EpIndt);
  years:=(StrToInt(PayMon)-StrToInt(InMon)) Div 100;
  if  years >= 10 then
     years := 10 ;
//  years:=min(years,10);
  if years>0 then
  begin
    years := 1 ;
    if ( empid='005172' )  and  ( empid='006514' )    then
       years := 3 ;
    AIndex:= SalLongWorkLvl.IndexOf(PstCode) +years;
    result:=StrToFloat(SalLongWorkLvl.Strings[AIndex]);
  end
  else
    result:=0;
end;
{===============================================================================
  Name:GetBseSpcLanuPay(EmpId,PayMon:String):Currency;
  得到 SAL_Base Spc
===============================================================================}
function GetBasePay(EmpId:String):Currency;
begin
  with DMHrdsys.SQLQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_sal_base WHERE emp_id='''+EmpId+'''');
    Open;
    if not Eof then
    begin
      Result:=fieldbyname('base_pay').AsCurrency;
      {
      //2017.01.13 重算2016.12個人所得稅使用
      if FormatDateTime('YYYYMMDD', FieldByName('valid_date').AsDateTime) >= '20170101' then
        Result:=fieldbyname('last_base_pay').AsCurrency
      else
        Result:=fieldbyname('base_pay').AsCurrency
      }    
    end
    else
      Result:=0;
    Close;
  end;
end;

function GetSalBase( EmpId,paymon,  NewPstCode,EduCode:String;EmpInDate,EmpLvDate:TDateTime;SalBaseLvl:TStrings; oldPstCode:String ):TBasepay;
//取得某職稱正式薪資基數
var
 newPayNormal, oldPayNormal,PayTest:double;
 edu_no, nlYear, nlMon :integer;
 TestDays,                     //試用期工作天數
 NormalDays,                   //試用期滿工作天數
 SunDayCount,                  //星期天數
 BasePay:TBasePay;
begin
  if SalBaseLvl.IndexOf(NewPstCode)>=0 then
     newPayNormal:=StrToFloat(SalBaseLvl.Strings[SalBaseLvl.IndexOf(NewPstCode)+1]);
  if( NewPstCode ='60' )  then
     newPayNormal:=1198000 ; //1080000 ;//newPayNormal + 170000 ;   //2008.01 起職員作業員薪資上浮190000
  if ( NewPstCode ='50' ) then
     newPayNormal:=1218000 ; //1100000 ;//newPayNormal + 190000 ;   //2008.01 起職員作業員薪資上浮190000
  if ( NewPstCode ='46' ) or ( NewPstCode ='41' ) or ( NewPstCode ='42' )  then
     newPayNormal:=1240000 ; //1130000 ;//newPayNormal + 172000 ;  // 2008.01 起班長級薪資上浮172000
  if ( NewPstCode ='33' ) or ( NewPstCode ='37' )  then
     newPayNormal:=1310000 ; //1200000 ; //newPayNormal + 242000 ;  // 2008.01 起組長級薪資上浮242000
  if ( NewPstCode ='22' ) or ( NewPstCode ='26' ) or ( NewPstCode ='28' )  then
     newPayNormal:=1410000 ; ////1300000; //newPayNormal + 342000 ;  // 2008.01 起課長級薪資上浮342000
  if ( NewPstCode ='18' ) or ( NewPstCode ='19' )   then
     newPayNormal:=newPayNormal + 442000 ;  // 2008.01 起主任級薪資上浮90000

  if SalBaseLvl.IndexOf(oldPstCode)>=0 then
     oldPayNormal:=StrToFloat(SalBaseLvl.Strings[SalBaseLvl.IndexOf(oldPstCode)+1]);
  if( oldPstCode ='60' )  then
     oldPayNormal:=1198000 ; //1080000; // oldPayNormal+ 170000 ;   //2008.01 起職員作業員薪資上浮190000
  if ( oldPstCode ='50' ) then
     oldPayNormal:=1218000 ;  //1100000; //oldPayNormal + 190000 ;   //2008.01 起職員作業員薪資上浮190000
  if ( oldPstCode ='46' ) or ( oldPstCode ='41' ) or ( oldPstCode ='42' )  then
     oldPayNormal:=1240000 ; //1130000; //oldPayNormal + 172000 ;  // 2008.01 起班長級薪資上浮172000
  if ( oldPstCode ='33' ) or ( oldPstCode ='37' )  then
     oldPayNormal:=1310000 ; //1200000 ;//oldPayNormal + 242000 ;  // 2008.01 起組長級薪資上浮242000
  if ( oldPstCode ='22' ) or ( oldPstCode ='26' ) or ( oldPstCode ='28' )  then
     oldPayNormal:=1410000 ; //1300000 ;//oldPayNormal + 342000 ;  // 2008.01 起課長級薪資上浮342000
  if ( oldPstCode ='18' ) or ( oldPstCode ='19' )   then
     oldPayNormal:=oldPayNormal + 442000 ;  // 2008.01 起主任級薪資上浮90000

  Basepay[0]:= NewPayNormal - OldPayNormal  ;
  Basepay[1] := NewPayNormal ;
  Basepay[2] := NewPayNormal + 150000 ;
  Result:=Basepay ;//(NormalDays/26)*PayNormal+(TestDays/26)*PayTest;
end;

//
function GetBase45s(Empid, PayMon, PstCode:String;EmpInDate:TDateTime; basepay:Double):Currency;
//取得某職稱正式薪資基數
var
  PayNormal:double;
  edu_no, nlYear, nlMon :integer;
  lcdValidDate:TDateTime;
   nlInMonth, nlInday, nlInYear  :integer;
  clsql, clInMonth, clInDate :string ;
begin
  nlInMonth :=  Monthof( empIndate ) ;
  nlInDay :=   dayof( empIndate );
  nlInYear :=  Yearof( empIndate );
  if paymon < '200901'  then
  begin
    with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      clsql :='select top 1 a.pst_code  from ( select pst_code from  hrd_emp_log  where  emp_id='''+EmpId+''' union all select pst_code from hrd_saltran where emp_id=''' + EmpId + ''' ) as a  order by a.pst_code desc' ;
      sql.Add(clsql );
      open;
      if not Eof then
        pstCode:=FieldByName('pst_code').AsString  ;
      close ;
    end;
    //
    nlInMonth :=  Monthof( empIndate ) ;
    nlInDay :=   dayof( empIndate );
    nlInYear :=  Yearof( empIndate );
    if Yearof( empIndate ) < ( strtoint( copy( paymon , 1, 4 ) ) )  then
    begin
      //
      if pstcode < '60'  then  //職員以上
      begin
        if nlInday <= 10 then
          nlInMonth := nlInMonth  // 判斷當月10號前進廠則取當月
        else
          nlInmonth := nlInmonth + 1 ;
        //
        nlInMonth := nlInMonth + 2;
        if nlInMonth  = 13 then
          nlInMonth := 1;
        if nlInMonth  = 14 then
          nlInMonth := 2;
        if nlInMonth  = 15 then
          nlInMonth := 3;
        clInMonth :=  inttostr( nlInMonth  ) ;
        if length( clInMonth )  < 2  then
          clInMonth := '0' + clInMonth  //inttostr( nlInMonth )
        else
          clInMonth :=  clInMonth ;
        //
        if clInMonth = copy( paymon, 5, 2 )  then
          result:= 45000
        else
          result:= 0;
      end;
      if pstcode >='60'  then
      begin
        if nlInday <= 10 then
          nlInMonth := nlInMonth  // 判斷當月10號前進廠則取當月
        else
          nlInmonth := nlInmonth + 1 ;
        nlInMonth := nlInMonth + 1;
        if nlInMonth  = 13 then
          nlInMonth := 1;
        if nlInMonth  = 14 then
          nlInMonth := 2;
        clInMonth :=  inttostr( nlInMonth ) ;
        if length( clInMonth ) < 2  then
          clInMonth := '0' + clInMonth
        else
          clInMonth :=  clInMonth ;
        clInDate :=inttostr( nlInYear ) + clInMonth ;
        if clInMonth = copy( paymon, 5, 2 )  then
          result:=  45000
        else
          result:= 0;
      end;
    end;
  end
  else begin
    nlInMonth :=  Monthof( empIndate ) ;
    nlInDay :=   dayof( empIndate );
    if Yearof( empIndate ) < ( strtoint( copy( paymon , 1, 4 ) ) )  then
    begin
      if pstcode < '60'  then  //職員以上
      begin
        if nlInday <= 10 then
          nlInMonth := nlInMonth  // 判斷當月10號前進廠則取當月
        else
          nlInmonth := nlInmonth + 1 ;
          // nlInMonth := nlInMonth + 2;
        if nlInMonth  = 13 then
        begin
          nlInMonth := 1;
          nlInYear := nlInYear + 1;
        end;
        //
        clInMonth :=  inttostr( nlInMonth  ) ;
        if length( clInMonth )  < 2  then
          clInMonth := '0' + clInMonth  //inttostr( nlInMonth )
        else
          clInMonth :=  clInMonth ;
        //
        if ( clInMonth = copy( paymon, 5, 2 )) and (  strtoint( copy( paymon , 1, 4 ) ) -  nlInYear >= 1 )    then
          result:=  basepay*0.05
        else
          result:= 0 ;
      end;
      //
      if pstcode >='60'  then
      begin
        if nlInday <= 10 then
          nlInMonth := nlInMonth  // 判斷當月10號前進廠則取當月
        else
          nlInmonth := nlInmonth + 1 ;
    //    nlInMonth := nlInMonth + 1;
        if nlInMonth  = 13 then
        begin
          nlInMonth := 1;
          nlInYear := nlInYear + 1;
        end;
        //
        clInMonth :=  inttostr( nlInMonth ) ;
        if length( clInMonth ) < 2  then
          clInMonth := '0' + clInMonth
        else
          clInMonth :=  clInMonth ;
        clInDate :=inttostr( nlInYear ) + clInMonth ;
        if (  copy( paymon, 5, 2 ) = clInMonth ) and (  strtoint( copy( paymon , 1, 4 ) ) -  nlInYear >= 1 )   then
          result:=  basepay*0.05
        else
          result:= 0 ;
      end;
    end;
  end;
end;

//
function getholiday(empid, Ayear:string):Double;
{*************************************************************************
TO DO:檢查數據庫中某行資料是否存在
Param:CheckSql-檢查SQL語句
Return:true-存在;false-不存在
Author:anil
Create Date:2005-8-6
*************************************************************************}
var
  sql :string ;
begin
  result:=0;
  with DMHrdsys.SQLQuery1  do
  begin
    // sql := 'select emp_id from hrd_temp_user where emp_id ='''+ userid+'''' ;
    close;
    sql.Clear;
    sql.Add('select dut_day from hrd_dut_emp_holiday where emp_id ='''+ empid+''' and dut_year='''+Ayear+'''');
    open;
    if EOF then
    begin
      result:=0;
      exit ;
    end
    else begin
      result:=DMHrdsys.SQLQuery1.fieldbyname('dut_day').asfloat;
      exit ;
    end;
  end;
end;

//2011-11-02 hyt add
//執行SQL 語句
function DB_Run_Sql(sSql:WideString ; sDBFlag:string=''):Boolean;
begin
  with DMHrdsys.ADOCommand1 do
  begin
    CommandText:='';
    CommandText:=sSql;
    try
      Execute;
      Result:=true;
    except
      ShowMessage('sql出錯:其信息是:'+sSql);
      Result:=false;
    end;
  end;
end;

//查詢 是否存在 記錄
function DB_SeekRecord(aSql:WideString ):Boolean;
begin
  with DMHrdsys.qry_pub do
  begin
    Close;
    SQL.Clear ;
    SQL.Add(aSql);
    try
      Open;
      //
      if not Eof then
        Result := True
      else
        Result := False;
      //
      Close;  
    except
      Result :=false;
      exit;
    end;
  end;
end;

//取 當筆資料的 第一個 子段值
function DB_GetSRecord(aSql:WideString ):WideString;
var
  lcFieldName:string;
begin

    with DMHrdsys.qry_pub do
    begin
      SQL.Clear ;
      SQL.Add(aSql);
      Result :='';
      try
        Open ;
      except
        exit;
      end;

      lcFieldName:=Fields[0].FieldName ;
      if not Eof then
        Result :=FieldByName(lcFieldName).AsString ;
    end;
end;
//////////////////////////////////////////////////
//2011-12-01 hyt add
//判斷 該字符串 是否是標準的月份，如：200603 或 2006/03
function str_IfMonth(aMonth:string):Boolean;
var
  lcnMonth,lcnYear:integer;
begin
  if (length(trim(aMonth))=6) or (length(trim(aMonth))=7) then
  begin
    try
      lcnYear :=strToInt(leftStr(aMonth ,4));
      lcnMonth:=strToInt(rightStr(aMonth ,2));
      if (lcnMonth<=0) or (lcnMonth>12) or (lcnYear<1900) or (lcnYear>3000) then
        Result:=false
      else
        Result:=true;
    except
      Result:=false;
    end;
  end
  else
    Result:=false;
end;
//取 該字符串 的下個月份，如：200603 ==>200604
function str_NextMonth(aMonth:string):String;
var
  lcnMonth,lcnYear:integer;
begin
  if not str_IfMonth(aMonth) then
  begin
    ShowMessage('對不起，該月份不規範: '+aMonth);
    Result:=aMonth;
    exit;
  end;
  lcnYear :=strToInt(leftStr(aMonth ,4));
  lcnMonth:=strToInt(rightStr(aMonth ,2));
  //取下個月的月份
  if lcnMonth<12 then
  begin
    lcnMonth:=lcnMonth+1;
  end
  else
  begin
    lcnYear :=lcnYear+1;
    lcnMonth:=01;
  end;
  if length(aMonth)=7 then
    Result:=formatFloat('0000',lcnYear)+copy(aMonth,5,1)+formatFloat('00',lcnMonth)
  else
    Result:=formatFloat('0000',lcnYear)+formatFloat('00',lcnMonth);
end;
//取 該字符串 的上個(previous)月份，如：200603 ==>200604
function str_PreMonth(aMonth:string):String;
var
  lcnMonth,lcnYear:integer;
begin
  if not str_IfMonth(aMonth) then
  begin
    ShowMessage('對不起，該月份不規範: '+aMonth);
    Result:=aMonth;
    exit;
  end;
  lcnYear :=strToInt(leftStr(aMonth ,4));
  lcnMonth:=strToInt(rightStr(aMonth ,2));
  //取下個月的月份
  if lcnMonth>1 then
  begin
    lcnMonth:=lcnMonth-1;
  end
  else
  begin
    lcnYear :=lcnYear-1;
    lcnMonth:=12;
  end;
  if length(aMonth)=7 then
    Result:=formatFloat('0000',lcnYear)+copy(aMonth,5,1)+formatFloat('00',lcnMonth)
  else
    Result:=formatFloat('0000',lcnYear)+formatFloat('00',lcnMonth);
end;

//2012-02-15 hyt add
 function Checktempuser(userid:string):boolean;
{*************************************************************************
TO DO:檢查數據庫中某行資料是否存在
Param:CheckSql-檢查SQL語句
Return:true-存在;false-不存在
Author:anil
Create Date:2005-8-6
*************************************************************************}
var
  sql :string ;
begin
  result:=true;  
  with DMHrdsys.SQLQuery1 do
    begin
     // sql := 'select emp_id from hrd_temp_user where emp_id ='''+ userid+'''' ;
      close;
      sql.Clear;
      sql.Add('select emp_id from hrd_temp_user where emp_id ='''+ userid+'''');
      open;
      if EOF then
         begin
           result:=true;
           exit ;
         end
      else
         begin
           result:=false;
           exit ;
         end;
   end;
end;
{===============================================================================
  函數名稱:GetSunDayCount -- 得到輸入範圍內的星期天數
  參數:    DayBeg -- 開始日期 DayEnd -- 結束日期 YearMonth -- 年月
===============================================================================}
function GetSunDayCount(DayBeg,DayEnd:Integer;YearMonth:String):Integer;
var
  i,Count:Integer;
  SDate,EDate:TDateTime;
begin
  TryEnCodeDate(StrToInt(LeftStr(YearMonth,4)),StrToInt(RightStr(YearMonth,2)),DayBeg,SDate);
  TryEnCodeDate(StrToInt(LeftStr(YearMonth,4)),StrToInt(RightStr(YearMonth,2)),DayEnd,EDate);
  Count:=GetRestDayCount(SDate,EDate);

  Result:=Count;
end;
{===============================================================================
  函數名稱: hyt add 2012-09-07
  參數:
===============================================================================}
function AnalysisFactory():string;
var
  sDept_code,sLimitedDept:string;
begin
  sLimitedDept:=DB_GetSRecord('select dept_code from user_dept where sys_code=''hrd'' and user_id='''+username+'''');
  if Trim(sLimitedDept)='' then
  begin
    Result:='F';
    G_sFactorySql:=' dept_code like ''[F|S]%'' '
  end
  else
  begin
    Result:=leftStr(sLimitedDept,1);
    G_sFactorySql:=' dept_code like ''V%'' '
  end;
end;

function AnalysisFactorySql(sAria:string=''):string;
begin
  if G_sFactorySql='' then
    Result:=''
  else
  begin
    if G_sFactory='F' then
      Result:='dept_code like ''[F|S]%'' '
    else
      Result:='dept_code like ''[V]%'' ' ;

    if sAria<>'' then
      Result:=' '+sAria+'.'+Result    ;
  end;

end;

function AnalysisEmpFactory(sEmp_id:string;sShowMsg:Boolean=true;bFhrd:Boolean=false):boolean;
var
  sDept_code,sLimitedDept, sEmpID:string;
begin
  //
  sEmpID := sEmp_id;
  //
  if bFhrd then
    sDept_code:=DB_GetSRecord('select dept_code from fhrd_emp where emp_id='''+sEmp_id+''' ')
  else begin
    sDept_code:=DB_GetSRecord('select dept_code from hrd_emp where emp_id='''+sEmp_id+''' ');
    if sDept_code= '' then
    begin
      sEmpID := GetEmpID(sEmp_id);
      sDept_code:=DB_GetSRecord('select dept_code from hrd_emp where emp_id='''+sEmpId+''' ');
    end;
  end;

  sLimitedDept:=G_sFactory;//DB_GetSRecord('select dept_code from user_dept where sys_code=''hrd'' and user_id='''+username+'''');
  if sLimitedDept='' then
  begin   //default mizuno
    if leftStr(sDept_code,1)='V' then
    begin
      if sShowMsg then
        showMessage('Do not have limits of this program');
      Result:=false;
    end
    else
    begin
      Result:=true;
    end;
  end
  else
  begin
    if leftStr(sDept_code,1)='S' then // 特殊處理 
      sDept_code:='F';

    if leftStr(sDept_code,1)<>leftStr(sLimitedDept,1) then
    begin
      if sShowMsg then
        showMessage('Do not have limits of this program');
      Result:=false;
    end
    else
      Result:=true;
  end;
end;

//2015.04.02 四捨五入取整
function RoundEx(R: Real): Int64;
begin
  Result := Trunc(R);
  //
  if Frac(R) >= 0.5 then
    Result := Result + 1;
end;

//2015.04.11 Sanjin 計算兩個日期相差的月數
function MonthsBetweenEx(const ANow, AThen: TDateTime): Integer;
var
  iYear, iYear2, iMonth, iMonth2, iDay, iDay2: Word;
  //
  dBegin, dEnd: TDateTime;
begin
  //
  if ANow< AThen then
  begin
    dBegin := ANow;
    dEnd   := AThen;
  end
  else begin
    dBegin := AThen;
    dEnd   := ANow;
  end;
  //
  DecodeDate(dBegin, iYear, iMonth, iDay);
  //
  DecodeDate(dEnd, iYear2, iMonth2, iDay2);
  //
  Result := (iYear2 - iYear)*12;
  //
  Result := Result + (iMonth2 - iMonth);
  //
  if iDay2 < iDay then
    Result := Result - 1;
end;

//2015.04.21 Sanjin 計算兩個日期相差的年數
function YearsBetweenEx(const ANow, AThen: TDateTime): Integer;
var
  iYear, iYear2, iMonth, iMonth2, iDay, iDay2: Word;
  //
  DaysCount, MonthsCount, YearsCount: Integer;
  //
  dBegin, dEnd: TDateTime;
begin
  //
  if ANow< AThen then
  begin
    dBegin := ANow;
    dEnd   := AThen;
  end
  else begin
    dBegin := AThen;
    dEnd   := ANow;
  end;
  //
  DecodeDate(dBegin, iYear, iMonth, iDay);
  //
  DecodeDate(dEnd, iYear2, iMonth2, iDay2);
  //
  DaysCount := iDay2 - iDay;
  //
  MonthsCount := iMonth2 - iMonth;
  //
  YearsCount := iYear2 - iYear;
  //
  if DaysCount< 0 then
    MonthsCount := MonthsCount - 1;
  //
  if MonthsCount< 0 then
    YearsCount := YearsCount - 1;
  //
  if YearsCount< 0 then
    YearsCount := 0;
  //
  Result := YearsCount;      
end;



//年假天數 2013.09.20 LX ADD
function GetYearHolEx(AEmpID, AYear: string): TStrings;
var
  //全部天數
  AllDays, HasDays, FestDays, RestDays, RestHours: Double;
  //
  DateList: TStringList;
  //
  aryYixiu: TAnnualLeaveDays;
begin
  //
  DateList:= TStringList.Create;
  try
    //
    AllDays:= 12;
    //得到可休天數
    AllDays:= GetKXTS(AEmpID, AYear);
    //已休天數
    aryYixiu:= GetYXTS(AEmpID, AYear);
    //
    HasDays := aryYixiu[0];
    //
    FestDays:= aryYixiu[1];
    //剩餘可請天數
    RestDays:= AllDays - HasDays - FestDays;
    //剩餘年假小時數
    RestHours:= RestDays * 8;
    //可請年假
    DateList.Add(FloatToStr(AllDays));
    //已請年假
    DateList.Add(FloatToStr(HasDays));
    //春節年假天數
    DateList.Add(FloatToStr(FestDays));
    //剩餘天數
    DateList.Add(FloatToStr(RestDays));
    //剩餘小時數
    DateList.Add(FloatToStr(RestHours));
    //
    Result:= DateList;
  finally
    //
    //DateList.Free;
  end;  
end;

//得到年假可休天數 2013.09.25 LX ADD
function GetKXTS(AEmpID, AYear: string): Double;
var
  //全部天數
  AllDays: Double;
  //
  UserFields: TFields;
  //
  dEpInDt, dEpLeDt: TDateTime;
  //
  sSQL: string;
  //
  dInDay: Integer;
  //
  sEpLeYear: string;
  //繁重工種
  _Fanzhong: Double;
begin
  //
  AllDays:= 12;
  //
  UserFields:= GetEmpInfo(AEmpID);
  //進廠日期
  dEpInDt:= UserFields.FieldByName('EPINDT').AsDateTime;
  //離職日期
  dEpLeDt:= UserFields.FieldByName('EPLEDT').AsDateTime;
  //其他廠轉入
  sSQL:= 'SELECT OLD_EPINDT FROM HRD_EMP_SPC_SET WHERE EMP_ID = '+QuotedStr(AEmpID);
  //
  with DMHrdsys.SQLQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //特殊員工保留原進廠日期
    if not IsEmpty then
      dEpInDt:= FieldByName('OLD_EPINDT').AsDateTime;
    //
    Close;
  end;
  //離職年份
  sEpLeYear:= FormatDateTime('YYYY', dEpLeDt);
  //是否繁重工種
  _Fanzhong:= GetHoliDay(AEmpID, AYear);
  //在職
  if (sEpLeYear> AYear) or (dEpLeDt= 0) then
  begin
    //當年進廠
    if YearOf(dEpInDt)= StrToInt(AYear) then
    begin
      //10號及以前進公司，當月有年休
      if MonthOf(dEpInDt-10)<> 12 then
        AllDays:= AllDays - MonthOf(dEpInDt - 10)
      //12月10號以後進公司的  
      else if MonthOf(dEpInDt)= 12 then
        AllDays:= 0;
    end;
    //每滿5年多一天年休
    if IntToStr(YearOf(dEpInDt)) < AYear then
      AllDays:= AllDays + (StrToInt(AYear) - YearOf(dEpInDt)) div 5;
    //繁重工種
    AllDays:= AllDays + _Fanzhong;
  end
  //本年離職
  else if sEpLeYear= AYear then
  begin
    //離職當年進公司的
    if FormatDateTime('YYYY', dEpInDt)= AYear then
    begin
      //1號
      AllDays:= MonthsBetweenEx(StartOfTheMonth(dEpLeDt), dEpInDt);
      //
      dInDay:= DayOf(dEpInDt);
      //
      if AllDays< 0 then
        AllDays:= 0;
      //2-10日進公司，當月有一天年休
      if ((dInDay<= 10) and (dInDay<> 1)
            and(FormatDateTime('YYYYMM',dEpInDt)<>FormatDateTime('YYYYMM',dEpLeDt))) then
        AllDays:= AllDays + 1;
      //繁重工種
      AllDays:= AllDays + _Fanzhong;
      //2015.04.22 進廠日期和離職日期非同一月份
      if FormatDateTime('YYYYMM',dEpInDt)<>FormatDateTime('YYYYMM',dEpLeDt) then
      begin
        //2015.04.21 2015年4月1日起，離職當月工作滿三周即21天者有一天年休
        if DayOf(dEpLeDt)>= 22 then
          AllDays := AllDays + 1;
      end
      //2015.04.22 當月進廠，當月離職
      else begin
        //離職當月上班滿三周，有一天年休
        if DaysBetween(dEpLeDt, dEpInDt) > 21 then
          AllDays := AllDays + 1;
      end;
    end
    //以前進公司的
    else begin
      //離職當月沒有年假
      AllDays:= MonthOf(dEpLeDt) -1;
      //2015.04.21 2015年4月1日起，離職當月工作滿三周即21天者有一天年休
      if DayOf(dEpLeDt)>= 22 then
        AllDays := AllDays + 1;
      //繁重工種
      AllDays:= AllDays + _Fanzhong;
      //每5年，多一天年休
      AllDays:= AllDays + YearsBetween(dEpLeDt - 1, dEpInDt) div 5;
    end;
  end
  //前幾年離職
  else AllDays:= 0;
  //
  Result:= AllDays;
end;

//得到已休年假天數
function GetYXTS(AEmpID, AYear: string): TAnnualLeaveDays;
var
  //全部天數
  HasDays, FestDays: Double;
  //
  sSQL: string;
  //
  _16Hours, _16Minutes, _18Hours, _18Minutes, dHours, dMinutes: Double;
  //
  sFieldName: string;
  //
  I: Integer;
begin
  //********************已休年假 2013.09.23 LX ADD******************************
  _16Hours  := 0;
  //
  _16Minutes:= 0;
  //
  sSQL:= 'SELECT *'
       + '  FROM HRD_DUT_MON'
       //三種年假 2014.02.27
       + ' WHERE (CLAS_CODE = ''16'' OR CLAS_CODE = ''17'')'
       + '   AND EMP_ID = '+QuotedStr(AEmpID)
       + '  AND SUBSTRING(DUT_MON, 1, 4) = '+QuotedStr(AYear);
  //
  with DMHrdsys.SQLQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    First;
    while not Eof do
    begin
      //
      for I:= 1 to 31 do
      begin
        //
        sFieldName:= 'day'+Format('%.2d', [I]);
        //
        if Trim(FieldByName(sFieldName).AsString)= '' then
          Continue;
        //
        dHours  := StrToFloat(Copy(FieldByName(sFieldName).AsString, 1, 2));
        //
        dMinutes:= StrToFloat(Copy(FieldByName(sFieldName).AsString, 3, 2));
        //
        if dHours>= 8 then
        begin
          dHours  := 8;
          dMinutes:= 0;
        end;
        //
        _16Hours  := _16Hours + dHours;
        //
        _16Minutes:= _16Minutes + dMinutes;
      end;
      //
      Next;
    end;
    //
    _16Hours  := _16Hours + _16Minutes/60;
    //
    HasDays   := _16Hours/8;
    //
    Close;
  end;
  //特殊進廠人員
  HasDays:= HasDays + GetSpecYXTS(AEmpID, AYear);
  //取得春節休假天數************************************************************
  _18Hours  := 0;
  //
  _18Minutes:= 0;
  //
  sSQL:= 'SELECT *'
       + '  FROM HRD_DUT_MON'
       + ' WHERE SUBSTRING(DUT_MON, 1, 4) = '+QuotedStr(AYear)
       + '   AND EMP_ID = '+QuotedStr(AEmpId)
       + '   AND CLAS_CODE = ''18''';
  //
  with DMHrdsys.SQLQuery2 do
  begin//查月檔是否春節年假
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    while not Eof do
    begin
      //
      for I:= 1 to 31 do
      begin
        //
        sFieldName:= 'day'+Format('%.2d', [I]);
        //
        if Trim(FieldByName(sFieldName).AsString)= '' then
          Continue;
        //
        dHours  := StrToFloat(Copy(FieldByName(sFieldName).AsString, 1, 2));
        //
        dMinutes:= StrToFloat(Copy(FieldByName(sFieldName).AsString, 3, 2));
        //
        if dHours>= 8 then
        begin
          dHours  := 8;
          dMinutes:= 0;
        end;
        //
        _18Hours  := _18Hours   + dHours;
        //
        _18Minutes:= _18Minutes + dMinutes;
      end;  
      //
      Next;
    end;
    //
    _18Hours:= _18Hours + _18Minutes/60;
    //
    FestDays:= _18Hours/8;
  end;
  //
  Result[0]:= HasDays;
  //
  Result[1]:= FestDays;
end;

//2017.02.07 得到已休年假天數
function GetYXTSEx(AEmpID, AYear, AMonth: string): TAnnualLeaveDays;
var
  //全部天數
  HasDays, FestDays: Double;
  //
  sSQL: string;
  //
  _16Hours, _16Minutes, _18Hours, _18Minutes, dHours, dMinutes: Double;
  //
  sFieldName: string;
  //
  I: Integer;
begin
  //********************已休年假 2013.09.23 LX ADD******************************
  _16Hours  := 0;
  //
  _16Minutes:= 0;
  //
  sSQL:= 'SELECT *'
       + '  FROM HRD_DUT_MON'
       //三種年假 2014.02.27
       + ' WHERE (CLAS_CODE = ''16'' OR CLAS_CODE = ''17'')'
       + '   AND EMP_ID = '+QuotedStr(AEmpID)
       + '  AND SUBSTRING(DUT_MON, 1, 4) = '+QuotedStr(AYear)
       + '  AND DUT_MON = '+QuotedStr(AMonth);
  //
  with DMHrdsys.SQLQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    First;
    while not Eof do
    begin
      //
      for I:= 1 to 31 do
      begin
        //
        sFieldName:= 'day'+Format('%.2d', [I]);
        //
        if Trim(FieldByName(sFieldName).AsString)= '' then
          Continue;
        //
        dHours  := StrToFloat(Copy(FieldByName(sFieldName).AsString, 1, 2));
        //
        dMinutes:= StrToFloat(Copy(FieldByName(sFieldName).AsString, 3, 2));
        //
        if dHours>= 8 then
        begin
          dHours  := 8;
          dMinutes:= 0;
        end;
        //
        _16Hours  := _16Hours + dHours;
        //
        _16Minutes:= _16Minutes + dMinutes;
      end;
      //
      Next;
    end;
    //
    _16Hours  := _16Hours + _16Minutes/60;
    //
    HasDays   := _16Hours/8;
    //
    Close;
  end;
  //特殊進廠人員
  HasDays:= HasDays + GetSpecYXTS(AEmpID, AYear);
  //取得春節休假天數************************************************************
  _18Hours  := 0;
  //
  _18Minutes:= 0;
  //
  sSQL:= 'SELECT *'
       + '  FROM HRD_DUT_MON'
       + ' WHERE SUBSTRING(DUT_MON, 1, 4) = '+QuotedStr(AYear)
       + '   AND EMP_ID = '+QuotedStr(AEmpId)
       + '   AND CLAS_CODE = ''18'''
       + '   AND DUT_MON = '+QuotedStr(AMonth);
  //
  with DMHrdsys.SQLQuery2 do
  begin//查月檔是否春節年假
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    while not Eof do
    begin
      //
      for I:= 1 to 31 do
      begin
        //
        sFieldName:= 'day'+Format('%.2d', [I]);
        //
        if Trim(FieldByName(sFieldName).AsString)= '' then
          Continue;
        //
        dHours  := StrToFloat(Copy(FieldByName(sFieldName).AsString, 1, 2));
        //
        dMinutes:= StrToFloat(Copy(FieldByName(sFieldName).AsString, 3, 2));
        //
        if dHours>= 8 then
        begin
          dHours  := 8;
          dMinutes:= 0;
        end;
        //
        _18Hours  := _18Hours   + dHours;
        //
        _18Minutes:= _18Minutes + dMinutes;
      end;  
      //
      Next;
    end;
    //
    _18Hours:= _18Hours + _18Minutes/60;
    //
    FestDays:= _18Hours/8;
  end;
  //
  Result[0]:= HasDays;
  //
  Result[1]:= FestDays;
end;
  
//得到特殊員工在原公司已休的年假天數 2013.09.26 LX ADD
function GetSpecYXTS(AEmpID, AYear: string): Double;
var
  sSQL: string;
begin
  //
  sSQL:= 'SELECT TAKE_DAYS'
       + '  FROM HRD_EMP_SPC_SET'
       + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
       + '   AND SUBSTRING(SET_MONTH, 1, 4)= '+QuotedStr(AYear);
  //
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    Result:= FieldByName('TAKE_DAYS').AsFloat;
    //
    Close;
  end;
end;


//2016.03.19
function GetPiccBase(const AMonth, AEmpID: string): Double;
var
  sSQL: string;
begin
  Result := 0;

  sSQL := 'SELECT *'
        + '  FROM HRD_SALTRAN'
        + ' WHERE EMP_ID = '+QuotedStr(AEmpID)
        + '   AND CONVERT(VARCHAR(8),VALID_DATE,112) <= '+QuotedStr(AMonth+'15')
        + ' ORDER BY VALID_DATE DESC';
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    Result := FieldByName('SAL_MGMT').AsFloat +
              FieldByName('SAL_TECH').AsFloat +
              FieldByName('PST_PAY').AsFloat +
              FieldByName('GRADE_PAY').AsFloat +
              FieldByName('SAL_SPEC').AsFloat;
    Close;
  end;
end;

//2016.05.19得到除基本工資外的標準薪資 
function GetStdPay(const AEmpID: string): Double;
var
  sSQL: string;
begin
  sSQL := 'SELECT (isnull(sal_mgmt, 0)'
        + '       +isnull(sal_tech, 0)'
        + '       +isnull(pst_pay, 0)'
        + '       +isnull(grade_pay, 0)'
        + '       +isnull(envir_pay, 0)'
        + '       +isnull(sal_spec, 0)'
        + '       +isnull(sal_achi, 0)'
        + '       +isnull(other_pay, 0)) as tot_pay'
        + '  FROM hrd_saltran where emp_id= '+QuotedStr(AEmpID)+' order by valid_date desc';
  with DMHrdsys.QryPublic do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    Result := FieldByName('tot_pay').AsFloat;
    Close;
  end;
end;

//2016.10.18 由新工號得到舊工號
function GetEmpID(const ANewEmpID: string): string;
var
  sSQL : string;
begin
  sSQL := 'select emp_id from hrd_emp where emp_id_new = '+QuotedStr(ANewEmpID);
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    Result := FieldByName('emp_id').AsString;
    Close;
  end;
end;

end.

