{*************************************************************************
Name：med10
Author: anil
Create date:2005-10-21
Modify date:2005-10-21
Commentate:診斷開方
*************************************************************************}
unit UnitMed10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB, QuickRpt,
  DBClient, Provider,DateUtils,Printers;

type
  TFormMed10 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_Print: TTntSpeedButton;
    ADOQuery1: TADOQuery;
    PanelDetail: TPanel;
    PanelInput: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntGroupBox4: TTntGroupBox;
    DBGrid1: TTntDBGrid;
    PanelMast: TTntPanel;
    TntLabel45: TTntLabel;
    TntLabel42: TTntLabel;
    PanelInputTitl: TPanel;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    DataSource2: TDataSource;
    ADOQueryDetl: TADOQuery;
    PrintDialog1: TPrintDialog;
    PanelSum: TTntPanel;
    TntLabel3: TTntLabel;
    EditTotal: TTntEdit;
    TntLabel4: TTntLabel;
    EditDept: TTntEdit;
    EditName: TTntEdit;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    TntLabel7: TTntLabel;
    ADOQuery1upd_user: TWideStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1med_code: TWideStringField;
    ADOQuery1med_date: TDateTimeField;
    ADOQuery1emp_id: TWideStringField;
    ADOQuery1sikc_code: TWideStringField;
    ADOQuery1apply_code: TWideStringField;
    ADOQuery1if_del: TBooleanField;
    ADOQuery1symp_code: TWideStringField;
    ADOQuery1anap_code: TWideStringField;
    ADOQuery1kindemp: TWideStringField;
    ADOQuery1reason: TWideStringField;
    ADOQueryDetlupd_user: TWideStringField;
    ADOQueryDetlupd_date: TDateTimeField;
    ADOQueryDetlmed_code: TWideStringField;
    ADOQueryDetldru_code: TWideStringField;
    ADOQueryDetlmed_qty: TFloatField;
    ADOQueryDetldru_price: TFloatField;
    ADOQueryDetldose: TFloatField;
    ADOQueryDetluse_code: TWideStringField;
    ADOQueryDetlway_code: TWideStringField;
    TntDBEdit1: TTntDBEdit;
    TntDBEdit3: TTntDBEdit;
    TntDBEdit4: TTntDBEdit;
    TntDBEdit5: TTntDBEdit;
    TntDBEdit6: TTntDBEdit;
    PickerDate: TTntMonthCalendar;
    EditMedCode: TTntEdit;
    ADOQueryDetlunit_name: TTntWideStringField;
    ADOQueryDetldru_name: TTntWideStringField;
    ADOQuery1sick_name: TTntWideStringField;
    TntDBEdit2: TTntDBEdit;
    editEmpid: TTntEdit;
    ADOQuery1doctor: TWideStringField;
    sb_pickdt: TTntSpeedButton;
    ADOQueryDetlsum_money: TFloatField;
    ADOQueryDetlsick_name: TTntWideStringField;
    ADOQueryDetlmoney: TFloatField;
    ADOQueryDetlold_money: TFloatField;
    //my define
    procedure InitLang;
    procedure InitForm;
    function GetSeqCode():string;
    procedure SetPrintObject(PreFlag:boolean);
    function SaveData:boolean;
    procedure OverListDetl(AddFlag:boolean);
    procedure SaveEmpSal(AddFlag:boolean);
    function GetFirstSal:double;
    procedure SetPubVars;
    function GetSumMoney:double;
    function CheckInputValid():boolean;
    procedure SetActEnabled(modify_Flag:boolean=true);
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure sb_PrintClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure EditMedCodeChange(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure CobDeptChange(Sender: TObject);
    procedure PickerDateChange(Sender: TObject);
    procedure ADOQueryDetlBeforePost(DataSet: TDataSet);
    procedure ADOQueryDetlCalcFields(DataSet: TDataSet);
    procedure ADOQueryDetlDRU_CODEChange(Sender: TField);
    procedure EditEmpIdChange(Sender: TObject);
    procedure sb_pickdtClick(Sender: TObject);
    procedure PickerDateDblClick(Sender: TObject);
    procedure ADOQueryDetlAfterOpen(DataSet: TDataSet);
    procedure ADOQueryDetlBeforeClose(DataSet: TDataSet);
    procedure ADOQueryDetlBeforeDelete(DataSet: TDataSet);
    procedure ADOQueryDetlmed_qtyChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMed10: TFormMed10;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  TransingFlag:boolean;
  Month,AMonth,med_code,emp_id,kindemp,Aempid:string;
  ADate,ServerTime:TDatetime;
  total_money:double;
{$R *.dfm}

procedure TFormMed10.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'med10');//Get privilege
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
end;

procedure TFormMed10.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='med05_titl,not_find_data,total,current_location,finish,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_from_db,'
  +'msg_inv_lower_zero,msg_save_mdp_code,'
  +'hrd08_dept_null,msg_this_month_finished,msg_last_month_not_finish,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormMed10.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str:string;
begin
  PickerDate.Date:=date;
  sql_str:='select dept_code+'' ''+abbr_titl as dept_name,dept_code from hrd_dept';
  //SetComboxList(sql_str,CobDept);
  //EditUser.Text:=username;
  //sb_Add.OnClick(self);
end;

function TFormMed10.GetSeqCode():string;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str,next_code,the_code:string;
  next_no:integer;
begin
  with DMHrdsys.SQLQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT glideno as MaxCode FROM hrd_med_glid where month = '''+month+'''');
    open;
    the_code:=FieldByName('MaxCode').AsString;
    if not TryStrToInt(the_code,next_no) then//序號
      next_no:=0;
    next_no:= next_no + 1;
    next_code :=  Format('%.5d', [next_no]);
  end;
result:=next_code;
end;

procedure TFormMed10.BtnQueryClick(Sender: TObject);
var
  sql_str:string;
begin
  sql_str:='select * from hrd_mdp_mast where mdp_code='''+Amonth+'''';
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
end;

procedure TFormMed10.ADOQuery1CalcFields(DataSet: TDataSet);
//計算欄位
var
  dru_code,sick_code,rea_code,Aempid,sql_str:string;
  unit_str,rea_str,sick_name:widestring;
  Flds:TFields;
begin
  SetPubVars;
  with DataSet do
  begin
    sick_code:=FieldByName('sick_code').AsString;
    //Flds:=GetEmpInfo(FieldByName('emp_id').AsString);
  end;
  //EditEmpId.Text:=Aempid;
  //EditName.Text:=Flds.FieldByName('emp_chs').AsString;
  //EditDept.Text:=Flds.FieldByName('dept_code').AsString+' '+Flds.FieldByName('abbr_titl').AsString;
  if sick_code<>'' then
  begin
    sql_str:='select * from hrd_med_sick where sick_code='''+sick_code+'''';
    with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;              
      sql.Add(sql_str);
      open;
      if not Eof then
        sick_name:=FieldByName('sick_name').Value+'/'+FieldByName('sick_vim').Value;
    end;
    //DataSet.Edit;
    DataSet.FieldByName('sick_name').Value:=sick_name;
  end;
end;

procedure TFormMed10.ADOQuery1AfterOpen(DataSet: TDataSet);
//打開數據集時設置功能按鈕是否可用
var
  sql_str:string;
begin
  SetActEnabled(false);
  with DataSet do
  if not Eof then
  begin//查詢
    med_code:=FieldByName('med_code').AsString;
    Aempid:=FieldByName('kindemp').AsString+FieldByName('emp_id').AsString;
    //SetComboxIndex(CobDept,FieldByName('dept_code').AsString);
    PickerDate.Date:=FieldByName('med_date').AsDateTime;
  end
  else
  begin//新增
    AempId:='';
  end;
  EditEmpId.text:=AempId;
  sql_str:='select * from hrd_med_detl where med_code='''+med_code+'''';
  with ADOQueryDetl do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
//    CommandText:=sql_str;
    open;
  end;
end;

procedure TFormMed10.ADOQuery1AfterClose(DataSet: TDataSet);
//關閉數據集時設置功能按鈕是否可用
begin
  SetActEnabled(false);
end;

procedure TFormMed10.ADOQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
//改變數據集時設置功能按鈕是否可用
begin
  SetActEnabled(true);
end;

procedure TFormMed10.ADOQuery1AfterScroll(DataSet: TDataSet);
//數據集移動時,改變狀態欄提示
begin
if not TransingFlag then
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(DataSet.RecNo)
    +' '+GetLangName(LangStr,'total')+':'+inttostr(DataSet.RecordCount));
end;

procedure TFormMed10.ADOQuery1BeforePost(DataSet: TDataSet);
//數據集Post時,自動追加修改者,修改日期欄位
begin
  with DataSet do
    begin
      FieldByName('upd_user').AsString:=UserName;
      FieldByName('upd_date').AsDateTime:=GetServerDatetime;
    end;
end;

procedure TFormMed10.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormMed10.SetPrintObject(PreFlag:boolean);
//設置打印的元件
begin
  PanelAct.Visible:=not PreFlag;
//  CobDept.Visible:=not PreFlag;
//  EditDept.Text:=CobDept.Text;
  EditDept.Visible:=PreFlag;
  PickerDate.Enabled:=PreFlag;
end;

procedure TFormMed10.sb_PrintClick(Sender: TObject);
//print dataset
begin
  if ADOQuery1.Eof then
    exit;
  if not PrintDialog1.Execute then
    exit;
  SetPrintObject(true);
  self.PrintScale:=poPrintToFit;
  self.Print;
  SetPrintObject(false);
//  showPrint(ADOQuery1,AMonth+GetLangName(LangStr,'med11_titl'));
end;

procedure TFormMed10.sb_RecoverClick(Sender: TObject);
//cancel all dataset modify
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
ADOQueryDetl.CancelBatch;
SetActEnabled(false);
end;

procedure TFormMed10.sb_SaveClick(Sender: TObject);
//save all dataset
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  if not CheckInputValid then
    exit;
  if not SaveData then//保存數據
    exit;
  SetActEnabled(false);
  WideShowMessage(GetLangName(LangStr,'msg_save_mdp_code')+med_code);
  EditMedCode.Text:=med_code;//顯示該筆資料
  //sb_Add.OnClick(self);//新增新的一筆空資料
end;

function TFormMed10.CheckInputValid():boolean;
//檢查輸入是否合法
begin
{  if trim(CobDept.Text)='' then
  begin
    WideShowMessage(GetLangName(LangStr,'hrd08_dept_null'));
    CobDept.SetFocus;
    result:=false;
    exit;
  end;}
  result:=true;
end;

procedure TFormMed10.OverListDetl(AddFlag:boolean);
//遍歷明細表,修改庫存月檔
var
  dru_code:string;
  med_qty:double;
  ServerTime:Tdatetime;
begin
  Month:=FormatDatetime('yyyymm',ADate);
  ServerTime:=GetServerDatetime;
  //ClientDataSetDetl.ApplyUpdates(-1);
  ADOQueryDetl.First;
  total_money:=0;
  while not ADOQueryDetl.Eof do
  begin
    with ADOQueryDetl do
    begin
      Edit;
      dru_code:=FieldByName('dru_code').AsString;
      med_qty:=FieldByName('med_qty').AsFloat;
      total_money:=total_money+FieldByName('money').AsFloat;
      if not AddFlag then//刪除時變為負數
      begin
        med_qty:=0-med_qty;
        Delete;
      end
      else
        Post;//新增時給明細檔mdp_code重賦值
    end;
    with DMHrdsys.SQLQuery4 do//保存到庫存月檔(hrd_med_mon)
    begin
      close;
      sql.Clear;
      sql.Add('select * from hrd_med_mon where dru_code='''+dru_code+''' and month='''+month+'''');
      open;
      if not Eof then
      begin
        Edit;
        FieldByName('upd_date').AsDateTime:=ServerTime;
        FieldByName('upd_user').AsString:=username;
        FieldByName('end_inv').AsFloat:=FieldByName('end_inv').AsFloat-med_qty;
        FieldByName('out_inv').AsFloat:=FieldByName('out_inv').AsFloat+med_qty;
        Post;
      end;
    end;
    if AddFlag then//新增時往下移動
      ADOQueryDetl.Next;
  end;
end;

procedure TFormMed10.SaveEmpSal(AddFlag:boolean);
//保存到員工月用藥纍計檔
var
  sql_str:string;
  sub_total_money,first_money:double;
begin
  if AddFlag then//新增
    sub_total_money:=total_money
  else//刪除
    sub_total_money:=0-total_money;
  sql_str:='SELECT * FROM hrd_med_sal where month= '''+month+''''
    +' and emp_id='''+emp_id+''' and kindemp='''+kindemp+'''';
  with DMHrdsys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    if not Eof then//有本月資料
    begin
      Edit;
      FieldByName('use_sal').AsFloat:=FieldByName('use_sal').AsFloat+sub_total_money;
      FieldByName('end_sal').AsFloat:=FieldByName('end_sal').AsFloat-sub_total_money;
      Post;
    end
    else//無本月資料
    begin
      first_money:=GetFirstSal;//得到本月起始金額
      Append;
      FieldByName('month').AsString:=month;
      FieldByName('emp_id').AsString:=emp_id;
      FieldByName('kindemp').AsString:=kindemp;
      FieldByName('first_sal').AsFloat:=first_money;
      FieldByName('use_sal').AsFloat:=sub_total_money;
      FieldByName('end_sal').AsFloat:=first_money-sub_total_money;
      Post;
    end;
  end;
end;

function TFormMed10.GetFirstSal:double;
//得到該月起始金額
var
  i,TYear:integer;
  TmpMonth,sql_str:string;
  t_sal:double;
begin
  TYear:=yearof(Adate);
  i:=monthof(Adate);
  t_sal:=0;
  while i>1 do
  begin
    i:=i-1;
    TmpMonth:=FormatDatetime('yyyymm',EncodeDate(TYear,i,1));
    sql_str:='SELECT * FROM hrd_med_sal where month= '''+tmpmonth+''''
      +' and emp_id='''+emp_id+''' and kindemp='''+kindemp+'''';
    with DMHrdsys.SQLQuery3 do
    begin
      close;
      sql.Clear;
      sql.Add(sql_str);
      open;
      if Eof then
        t_sal:=t_sal+8000//每月醫藥補助額
      else
      begin
        t_sal:=t_sal+FieldByName('end_sal').AsFloat;
        result:=t_sal;
        exit;
      end;
    end;
  end;
  result:=t_sal;  
end;

function TFormMed10.SaveData:boolean;
//保存數據
var
  seq_no:string;
begin
  SetPubVars;
  if length(trim(EditMedCode.Text))<10 then
  begin
    seq_no:=GetSeqCode;//產生領藥批號
    med_code:='V'+AMonth+seq_no;
  end;
  with DMHrdsys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM hrd_med_glid where month= '''+month+'''');
    open;
    if Eof then//上月資料未月結
    begin
      WideShowMessage(GetLangName(LangStr,'msg_last_month_not_finish'));
      result:=false;
      exit;
    end
    else if FieldByName('if_end').AsString='T' then//該月資料已月結
    begin
      WideShowMessage(GetLangName(LangStr,'msg_this_month_finished'));
      result:=false;
      exit;
    end
    else//保存到月結檔(hrd_med_glid)
    begin
      Edit;
      FieldByName('upd_date').AsDateTime:=ServerTime;
      FieldByName('upd_user').AsString:=username;
      FieldByName('glideno').AsString:=seq_no;
      Post;
    end;
  end;
  OverListDetl(true);//遍歷明細檔,保存到月檔
  SaveEmpSal(true);//保存到員工月用藥纍計檔
  with ADOQuery1 do//保存到主檔(hrd_med_mast)
  begin
    Edit;
    FieldByName('med_code').AsString:=med_code;
    FieldByName('if_del').AsBoolean:=false;
//    FieldByName('med_date').AsDateTime:=PickerDate.Date;
    UpdateBatch;
  end;
  ADOQueryDetl.UpdateBatch;//保存到明細檔(hrd_met_detl)
  result:=true;
end;

procedure TFormMed10.SetPubVars;
begin
  with ADOQuery1 do
  begin
    ADate:=FieldByName('med_date').AsDateTime;
    emp_id:=FieldByName('emp_id').asstring;
    KindEmp:=FieldByName('kindemp').asstring;
  end;
  Aempid:=KindEmp+emp_id;
  ServerTime:=GetServerDatetime;
  AMonth:=FormatDatetime('yymm',ADate);
  Month:=FormatDatetime('yyyymm',ADate);
end;

procedure TFormMed10.SetActEnabled(Modify_Flag:boolean=true);
//設置功能按鈕是否可用
var
  status:boolean;
begin
  status:=AdoQuery1.Active;
  sb_Print.Enabled:=status and Pri_Arr[Prt];
  sb_Add.Enabled:=Pri_Arr[ADD];
  sb_Del.Enabled:=status and Pri_Arr[DEL];
  sb_edit.Enabled:=status and Pri_Arr[UPD];
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;

procedure TFormMed10.sb_AddClick(Sender: TObject);
var
  sql_str:string;
begin
  PickerDate.Date:=date;
  ADate:=PickerDate.Date;
  AMonth:=FormatDatetime('yymm',ADate);
  med_code:='AAAA';
  sql_str:='select * from hrd_med_mast where 1=2';
  with ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.Add(sql_str);
    open;
    Append;
    FieldByName('med_code').AsString:=med_code;
    FieldByName('doctor').AsString:=username;
    FieldByName('med_date').AsDateTime:=date;
  end;
  if trim(EditMedCode.Text)<>'' then
    EditMedCode.Text:='';
//  CobDept.SetFocus;
  SetActEnabled(true);
end;

procedure TFormMed10.EditMedCodeChange(Sender: TObject);
//輸入mdp_code則查詢
var
  sql_str:string;
begin
  ADate:=PickerDate.Date;
  AMonth:=FormatDatetime('yymm',ADate);
  med_code:=trim(EditMedCode.Text);
  if length(med_code)<10 then
  begin
    if med_code='' then
    begin
      PickerDate.Enabled:=true;
      with DBGrid1 do
      begin
        Columns[0].Color:=clWhite;
        Columns[4].Color:=clWhite;
        Columns[0].ReadOnly:=false;
        Columns[4].ReadOnly:=false;
      end;
    end;  
    exit;
  end;
  sql_str:='select * from hrd_med_mast where med_code='''+med_code+'''';
  with ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.Add(sql_str);
    open;
  end;
//  CobDept.Enabled:=false;
  ADate:=ADOQuery1.FieldByName('med_date').AsDateTime;
  AMonth:=FormatDatetime('yymm',ADate);
  Month:=FormatDatetime('yyyymm',ADate);
  PickerDate.Enabled:=false;
  with DBGrid1 do
  begin
    Columns[0].Color:=cl3DLight;
    Columns[4].Color:=cl3DLight;
    Columns[0].ReadOnly:=true;
    Columns[4].ReadOnly:=true;
  end;  
  SetActEnabled(false);
end;

procedure TFormMed10.sb_DelClick(Sender: TObject);
//刪除
begin
  if ADOQuery1.Eof then
    exit;
  if wideMessageDlg(GetLangName(LangStr,'msg_del_from_db'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  SetPubVars;
  OverListDetl(false);//遍歷明細檔,保存到月檔
  SaveEmpSal(false);//保存到員工月用藥纍計檔
  ADOQueryDetl.UpdateBatch;
  ADOQuery1.Delete;
  ADOQuery1.UpdateBatch;
  EditMedCode.Text:='';
  SetActEnabled(false);
end;

procedure TFormMed10.CobDeptChange(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Edit;
//    FieldByName('dept_code').AsString:=LeftStr(CobDept.Text,6);
    Post;
  end;
end;

procedure TFormMed10.PickerDateChange(Sender: TObject);
begin
  ADate:=PickerDate.Date;
  AMonth:=FormatDatetime('yymm',ADate);
  Month:=FormatDatetime('yyyymm',ADate);
  with ADOQuery1 do
  begin
    Edit;
    FieldByName('mdp_date').AsDateTime:=ADate;
    Post;
  end;
end;

procedure TFormMed10.ADOQueryDetlBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    Edit;
    FieldByName('med_code').AsString:=med_code;
    FieldByName('upd_user').AsString:=username;
    FieldByName('upd_date').AsDateTime:=GetServerDatetime;
  end;
end;

procedure TFormMed10.ADOQueryDetlCalcFields(DataSet: TDataSet);
//計算欄位(藥品單位,藥品名,藥品庫存)
var
  dru_code:string;
  unit_str,dru_name:widestring;
  old_m,new_m:double;
begin
  ADate:=ADOQuery1.FieldByName('med_date').AsDateTime;
  AMonth:=FormatDatetime('yymm',ADate);
  Month:=FormatDatetime('yyyymm',ADate);
  dru_code:=DataSet.FieldByName('dru_code').AsString;
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
      unit_str:=FieldByName('unit_name').Value+'/'+FieldByName('unit_vim').Value;
    end;
  end;
  with DataSet do
  begin
    FieldByName('dru_name').Value:=dru_name;
    FieldByName('unit_name').Value:=unit_str;
    FieldByName('money').AsCurrency:=FieldByName('med_qty').AsFloat*FieldByName('dru_price').AsFloat;
//    FieldByName('sum_money').AsCurrency:=FieldByName('sum_money').AsCurrency+FieldByName('money').AsCurrency;
    //total_money:=total_money+FieldByName('money').AsCurrency;
  end;//fkAggregate
  //ClientDataSetDetl.Aggregates[0].Expression:='sum(ADOQuerydetl)';
  //if ClientDataSetDetl.Aggregates[0].Value<>null then
    //total_money:=ClientDataSetDetl.Aggregates[0].Value;
  EditTotal.Text:=FloatToStr(total_money);
end;

procedure TFormMed10.ADOQueryDetlDRU_CODEChange(Sender: TField);
//藥品單價
begin
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_dru_mast where dru_code='''+Sender.AsString+'''');
    open;
    if not Eof then
      Sender.DataSet.FieldByName('dru_price').AsFloat:=FieldByname('dru_price').AsFloat;
  end;
end;

procedure TFormMed10.EditEmpIdChange(Sender: TObject);
//工號拆分
var
  flds:TFields;
  len:integer;
  TEmpId,TKindEmp:string;
begin
  len:=length(EditEmpId.Text);
  if len<7 then
  begin
    EditName.Text:='';
    EditDept.Text:='';
    exit;
  end;
  TEmpId:=EditEmpId.Text;
  TKindemp:=leftstr(TEmpId,1);
  delete(TEmpId,1,1);
  with ADOQuery1 do
  begin
    Edit;
    FieldByName('emp_id').AsString:=TEmpId;
    FieldByName('kindemp').AsString:=TKindemp;
  end;
  Flds:=GetEmpInfo(TEmpId);
  EditName.Text:=Flds.FieldByName('emp_chs').AsString;
  EditDept.Text:=Flds.FieldByName('dept_code').AsString+' '+Flds.FieldByName('abbr_titl').AsString;
end;

procedure TFormMed10.sb_pickdtClick(Sender: TObject);
begin
  if ADOQuery1.Active then
    PickerDate.Visible:=true;
end;

procedure TFormMed10.PickerDateDblClick(Sender: TObject);
begin
  ADate:=PickerDate.Date;
  AMonth:=FormatDatetime('yymm',ADate);
  Month:=FormatDatetime('yyyymm',ADate);
  ADOQuery1.Edit;
  ADOQuery1.FieldByName('med_date').AsDateTime:=ADate;
  PickerDate.Visible:=false;  
end;

function TFormMed10.GetSumMoney:double;
//金額總計
var
  tmp_money:double;
begin
  tmp_money:=0;
  with ADOQueryDetl do
  begin
    First;
    while not Eof do
    begin
      tmp_money:=tmp_money+FieldByName('money').AsFloat;
      next;
    end;
  end;
  result:=tmp_money;
end;

procedure TFormMed10.ADOQueryDetlAfterOpen(DataSet: TDataSet);
begin
  total_money:=0;
//  ClientDataSetDetl.Open;
end;

procedure TFormMed10.ADOQueryDetlBeforeClose(DataSet: TDataSet);
begin
//  ClientDataSetDetl.Close;
end;

procedure TFormMed10.ADOQueryDetlBeforeDelete(DataSet: TDataSet);
begin
  SetActEnabled(true);
end;

procedure TFormMed10.ADOQueryDetlmed_qtyChange(Sender: TField);
var
  new_m,old_m:double;
begin
{  if ADOQueryDetl.FieldByName('old_money').Value<>null then
    old_m:=ADOQueryDetl.FieldByName('old_money').Value
  else
    old_m:=0;
  if ADOQueryDetl.FieldByName('money').Value<>null then
    new_m:=ADOQueryDetl.FieldByName('money').Value
  else
    new_m:=0;
  ADOQueryDetl.FieldByName('old_money').AsFloat:=new_m;
  total_money:=total_money+new_m-old_m;}
end;

end.
