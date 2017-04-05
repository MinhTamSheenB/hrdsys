{*************************************************************************
Name：sal16
Author: anil
Create date:2005-11-10
Modify date:2005-11-10
Commentate:薪資查詢表格
*************************************************************************}
unit UnitSal22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,math,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils,
  DBTables;

type
  TRunThread = class(TThread)
    private
      { Private declarations }
    protected
      procedure execute;override;
    public
      { Public declarations }
  end;
  TFormSal22 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    ADOQuery1: TADOQuery;
    Btn_Search: TTntBitBtn;
    TntLabel10: TTntLabel;
    CobDeptBegin: TTntComboBox;
    BtnPrint: TTntBitBtn;
    TntLabel2: TTntLabel;
    EditMon: TTntEdit;
    ADOQuery1dept_code: TStringField;
    ADOQuery1pst_code: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1epindt: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1part_code: TStringField;
    ADOQuery1grad_code: TStringField;
    ADOQuery1grad_money: TBCDField;
    ADOQuery1tr_amt: TBCDField;
    ADOQuery1base_pay: TFloatField;
    ADOQuery1sub_award: TFloatField;
    ADOQuery1tot_sal: TFloatField;
    Btn_Tran: TTntBitBtn;
    Query1: TQuery;
    cobType: TTntComboBox;
    ADODataSet1: TADODataSet;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure Btn_SearchClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure BtnPrintClick(Sender: TObject);
    procedure Btn_TranClick(Sender: TObject);

    function GetSuppPay(EmpId,PayMon:String):Currency;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal22: TFormSal22;
  RunThread:TRunThread;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  can_post:boolean;
  SalBaseLvl:TStrings;
const
  TMP_PATH='C:\temp\';
  TMP_DBF_FILE=TMP_PATH+'tmp_sal_award.dbf';
  SRC_DBF_PATH='G:\SALSYS\SAL05.DBF';
//  SRC_DBF_PATH='L:\SAL05.DBF';
{$R *.dfm}

procedure TFormSal22.FormCreate(Sender: TObject);
//初始化
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'sal22');//Get privilege
  InitForm;// Init Form
end;

procedure TFormSal22.InitLang;
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
  +'cur_emp_id,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;

procedure TFormSal22.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  SqlStr:string;
begin
  {SqlStr:='select dept_code+'' ''+abbr_titl from hrd_dept';
  SetComboxList(sqlStr,CobDeptBegin);
  SetComboxList(sqlStr,CobDeptEnd);}
  GetDeptRange(CobDeptBegin);
  EditMon.Text:=formatDateTime('yyyymm',date-25);
  SalBaseLvl:=GetAllBaseLvl;
end;

procedure TFormSal22.Btn_SearchClick(Sender: TObject);
//查詢數據
var
  sql_str,DateStr,SDate,EDate:string;
  ADate:TDateTime;
begin
  ADate:=EnCodeDate(StrToInt(LeftStr(editMon.Text,4)),StrToInt(RightStr(editMon.Text,2)),1);
  SDate:=FormatDateTime('yyyy/mm/dd',ADate);
  ADate:=EndOfTheMonth(ADate);
  EDate:=FormatDateTime('yyyy/mm/dd',ADate+1);
  DateStr:=FormatDateTime('yyyy/mm/dd',ADate);
  sql_str:='select A.dept_code,A.pst_code,A.emp_chs,A.epindt,B.* from hrd_emp A,'
    +' (select case when L.emp_id<>null then L.emp_id else M.emp_id end as emp_id,'
    +'  part_code,grad_code,grad_money,tr_amt from hrd_sal_award L full join'
    +'  (select emp_id,wrk_mon,D.part_code,E.grad_code,grad_money'
    +'   from hrd_wrkpay C,hrd_wrkpart D,hrd_wrkpay_grad E'
    +'   where C.part_code=D.part_code and D.part_grad=E.grad_code) as M'
    +'  on L.emp_id=M.emp_id and L.tr_month=M.wrk_mon '
    +'  where (M.wrk_mon='''+EditMon.Text+''' or L.tr_month='''+EditMon.Text+''')) as B'
    +' where A.emp_id=B.emp_id and A.dept_code='''+LeftStr(CobDeptBegin.Text,6)+''''
    +' order by A.emp_id';
    with Adoquery1 do
    begin
      close;
      sql.Clear;
      sql.Add(sql_str);
      open;
    end;
  if Adoquery1.Eof then
  begin
    SetStatusText(GetLangName(LangStr,'not_find_data'));
    BtnPrint.Enabled:=false;
  end
  else
    BtnPrint.Enabled:=true;
end;

procedure TFormSal22.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示,及改變編輯區一些欄位
var
  AText:string;
begin
with ADOQuery1 do
  AText:=GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+'; '
    +GetLangName(LangStr,'total')+':'+inttostr(RecordCount)+'; '
    +GetLangName(LangStr,'cur_emp_id')+':'+FieldByName('emp_id').AsString;
  setStatusText(AText);
end;

procedure TFormSal22.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormSal22.ADOQuery1CalcFields(DataSet: TDataSet);
var
  SqlStr,emp_id,pst_code,edu_code,dept_code,PstCode, clmon :string;
  EmpInDate:TDateTime;
  nlSuppPay :Currency;
begin
  emp_id:=DataSet.FieldByName('emp_id').AsString;
  PstCode:=DataSet.FieldByName('pst_code').AsString;
  EmpInDate:=DataSet.FieldByName('epindt').AsDateTime;
  with DataSet do
  begin
   // if emp_id = '062090' then
   //    emp_id := emp_id ;
    nlSuppPay := getSuppPay(emp_id, EditMon.Text  );
    clmon :=  copy( editmon.Text, 1, 4 ) + copy( editmon.text , 6, 2 ) ;
    if copy( editmon.Text, 1, 4 ) + copy( editmon.text , 6, 2 ) < '200801' then
       FieldByName('base_pay').AsFloat:=GetNormalBase(emp_id, clmon, PstCode,'',EmpInDate,SalBaseLvl)
    else
       FieldByName('base_pay').AsFloat:=GetNormalBase(emp_id, clmon, PstCode,'',EmpInDate,SalBaseLvl) + 92300;
    FieldByName('sub_award').AsFloat:=max(FieldByName('tr_amt').AsFloat
             -FieldByName('grad_money').AsFloat + nlSuppPay ,0);
    FieldByName('tot_sal').AsFloat:=max(FieldByName('sub_award').AsFloat+
         FieldByName('grad_money').AsFloat,0 );
     // 2007.09.26 <<
   //  FieldByName('sub_award').AsFloat:=max(FieldByName('tr_amt').AsFloat
   //   -(FieldByName('base_pay').AsFloat+FieldByName('grad_money').AsFloat) + nlSuppPay ,0);
   // FieldByName('tot_sal').AsFloat:=max(FieldByName('tr_amt').AsFloat+ nlSuppPay,
   //   (FieldByName('base_pay').AsFloat+FieldByName('grad_money').AsFloat) );
   // 2007.09.26  >>
  end;
end;

procedure TFormSal22.BtnPrintClick(Sender: TObject);
begin
  ShowPrint(ADOQuery1,'員工薪資查詢');
end;

procedure TFormSal22.Btn_TranClick(Sender: TObject);
var
  mon:string;
begin
  mon:=EditMon.Text;
  if mon='' then
  begin
    wideShowMessage('請輸入月份.');
    exit;
  end;
  if mon<=LockMonth then
  begin
    wideShowMessage('該月資料已經鎖定.');
    exit;
  end;
  if not FileExists(SRC_DBF_PATH) then
  begin
    wideShowMessage('還沒有連接到dos網絡.');
    exit;
  end;
  if not DirectoryExists(TMP_PATH) then
    mkdir(TMP_PATH);
  CopyFile(SRC_DBF_PATH,TMP_DBF_FILE,false);
  RunThread := TRunThread.Create(false);
end;

procedure TRunThread.execute;
var
  sql_str,pay_mon,emp_id,sal,whereStr:String;
  i,cnt:Integer;
  Formsal22:TFormsal22;
begin
  FreeOnTerminate := true;
  Formsal22:=TFormsal22(Application.FindComponent('Formsal22'));
  with Formsal22 do
  begin
    Btn_Tran.Enabled:=false;
    SetStatusText('開始轉檔');
    sleep(1000);
    pay_mon:=EditMon.Text;
    sql_str:='select [month],emp_id,sum(salary) as tr_amt from '
      +ExtractFileName(TMP_DBF_FILE);
    whereStr:=' [month]='''+pay_mon+'''';
    if LeftStr(cobType.Text,1)='1' then//結算
      whereStr:=whereStr+' and [flag]=1';
    if LeftStr(cobType.Text,1)='0' then//試算
      whereStr:=whereStr+' and [flag]=0';
    sql_str:=sql_str+' where '+whereStr+' group by [month],emp_id';
    //sql_str:=sql_str+' group by [month],emp_id';
    with ADODataSet1 do
    begin
      close;
      ConnectionString:='MSDASQL.1;Persist Security Info=False;Data Source=dBASE Files;Initial Catalog='+ExtractFileDir(TMP_DBF_FILE);
      CommandText:=sql_str;
      try
        Open;
      except
        SetStatusText('打開數據失敗,轉檔結束');
        Btn_tran.Enabled:=true;
        Terminate;
        Exit;
      end;
    {with Query1 do
    begin
      DatabaseName:=ExtractFileDir(TMP_DBF_FILE);
      Close;
      sql.Clear;
      sql.Add(sql_str);
      try
        Open;
      except
        SetStatusText('打開數據失敗,轉檔結束');
        Btn_tran.Enabled:=true;
        Terminate;
        Exit;
      end;}
      Filtered:=false;
      Filter:='month = '''+pay_mon+'''';
      Filtered:=true;
      sql_str:='delete from hrd_sal_award where tr_class=''01'''
          +' and tr_month='''+pay_mon+'''';
      with DMHrdsys.ADOCommand1 do
      begin
        CommandText:=sql_str;
        Execute;
      end;
      i:=1;
      cnt:=RecordCount;
      while not Eof do
      begin
        if FieldByName('month').AsString=pay_mon then
        begin
         emp_id:=RightStr(FieldByName('emp_id').AsString,6);
         sal:=FieldByName('tr_amt').AsString;
         //sal:=FieldByName('salary').AsString;
         SetStatusText('正在轉工號:'+emp_id+',第'+IntToStr(i)+'/'+IntToStr(cnt)+'筆');
         //sql_str:='delete from hrd_sal_award where tr_class=''01'''
         // +' and tr_month='''+pay_mon+''' and emp_id='''+emp_id+''';'
         sql_str:='insert into hrd_sal_award(tr_month,tr_class,emp_id,tr_amt)'
          +' values('''+pay_mon+''',''01'','''+emp_id+''','+sal+');';
         with DMHrdsys.ADOCommand1 do
         begin
          CommandText:=sql_str;
          Execute;
         end;
        end;
        inc(i);
        next;
      end;
      
      close;
    end;
    Btn_tran.Enabled:=true;
  end;
  SetStatusText('轉檔完成');
  Terminate;
end;
function  TFormSal22.GetSuppPay(EmpId,PayMon:String):Currency;
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
    sql.Add('select supp_pay from hrd_sal_award_supp '+
            ' where tr_month= '''+PayMon+
            ''' and emp_id='''+EmpId+'''');
    open;
    if not Eof then
      lcCurVal:=lcCurVal+FieldByName('supp_pay').AsCurrency ;
  end;
  Result:=lcCurVal;
end;
end.
