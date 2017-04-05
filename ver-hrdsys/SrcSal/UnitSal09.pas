{*************************************************************************
Name：sal09(員工薪資封裝作業)
Author: anil
Create date:2005-09-06
Modify date:2005-09-08
Commentate:員工薪資封裝作業
*************************************************************************}
unit UnitSal09;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt,DateUtils;

type TCurrNum = record//各種面額的薪資記錄
  FieldName:string;//數據庫對應欄位
  CurrText:string;//文字標簽
  CurrUnit:integer;//面額大小
  CurrPieces:integer;//錢幣張數
end;

type
  TRunThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure execute;override;
  public
    { Public declarations }
  end;

type
  TFormSal09 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelPre: TPanel;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelTail: TTntPanel;
    BtnSubmit: TTntBitBtn;
    ADOQuery1: TADOQuery;
    PanelAction: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    RbUpd: TTntRadioButton;
    RbQuery: TTntRadioButton;
    PanelQuery: TTntPanel;
    TntGroupBox2: TTntGroupBox;
    TntLabel7: TTntLabel;
    TntLabel2: TTntLabel;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    BtnQuery: TTntBitBtn;
    BtnPrint: TTntBitBtn;
    rbEmp: TTntRadioButton;
    rbDept: TTntRadioButton;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    PanelData: TPanel;
    PanelEdit: TPanel;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1pay_mon: TStringField;
    ADOQuery1salary: TBCDField;
    ADOQuery1full_sal: TBCDField;
    ADOQuery1if_full: TStringField;
    ADOQuery1curr_qty: TIntegerField;
    ADOQuery1sal50w: TIntegerField;
    ADOQuery1sal10w: TIntegerField;
    ADOQuery1sal5w: TIntegerField;
    ADOQuery1sal2w: TIntegerField;
    ADOQuery1sal1w: TIntegerField;
    ADOQuery1sal5s: TIntegerField;
    ADOQuery1sal2s: TIntegerField;
    ADOQuery1sal1s: TIntegerField;
    ADOQuery1sal5h: TIntegerField;
    ADOQuery1sal2h: TIntegerField;
    TntDBEdit1: TTntDBEdit;
    TntDBEdit2: TTntDBEdit;
    TntDBEdit3: TTntDBEdit;
    TntDBEdit4: TTntDBEdit;
    TntDBEdit5: TTntDBEdit;
    TntDBEdit6: TTntDBEdit;
    TntDBEdit7: TTntDBEdit;
    TntDBEdit8: TTntDBEdit;
    TntDBEdit9: TTntDBEdit;
    TntDBEdit10: TTntDBEdit;
    TntLabel50w: TTntLabel;
    TntLabel10w: TTntLabel;
    TntLabel5w: TTntLabel;
    TntLabel2w: TTntLabel;
    TntLabel1w: TTntLabel;
    TntLabel5s: TTntLabel;
    TntLabel2s: TTntLabel;
    TntLabel1s: TTntLabel;
    TntLabel5h: TTntLabel;
    TntLabel2h: TTntLabel;
    TntLabelcount: TTntLabel;
    TntDBEdit11: TTntDBEdit;
    TntLabelUnit1: TTntLabel;
    TntLabelUnit2: TTntLabel;
    TntLabelUnit3: TTntLabel;
    TntLabelUnit4: TTntLabel;
    TntLabelUnit5: TTntLabel;
    TntLabelUnit6: TTntLabel;
    TntLabelUnit7: TTntLabel;
    TntLabelUnit8: TTntLabel;
    TntLabelUnit9: TTntLabel;
    TntLabelUnit10: TTntLabel;
    TntLabelUnit11: TTntLabel;
    Label_month: TTntLabel;
    edit_month: TMaskEdit;
    Edit_total1: TTntEdit;
    edit_total2: TTntEdit;
    Label1: TLabel;
    Label_emp_chs: TTntLabel;
    edit_emp_chs: TTntEdit;
    Label_department: TTntLabel;
    edit_department: TTntEdit;
    TntDBEdit12: TTntDBEdit;
    Label_full_sal: TTntLabel;
    BtnReset: TTntBitBtn;
    btn_alldept: TTntButton;
    qry_alldept: TADOQuery;
    rb_in: TTntRadioButton;
    rb_left: TTntRadioButton;
    ADOQuery1dept_code: TStringField;
    ADOQuery1info_code: TStringField;
    ADOQueryEmp: TADOQuery;
    ADOQuery1pst_code: TStringField;
    lab_lock_msg: TTntLabel;
    btn_lock_date: TTntButton;
    lblLink: TTntLabel;
    chk_epledt: TTntCheckBox;
    dtp_epledt_bgn: TTntDateTimePicker;
    dtp_epledt_end: TTntDateTimePicker;
    cbChange: TTntCheckBox;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure TransData;
    procedure CountCurrNum();//統計
    procedure UpdateMonDept();//部門修正
    function SetMoneyUnit(fld_name:string;Money,MoneyUnit,k:integer):integer;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BtnSubmitClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RbUpdClick(Sender: TObject);
    procedure RbQueryClick(Sender: TObject);
    procedure rbEmpClick(Sender: TObject);
    procedure rbDeptClick(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure EditEmpBeginDblClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnResetClick(Sender: TObject);
    procedure btn_alldeptClick(Sender: TObject);
    procedure EditEmpBeginChange(Sender: TObject);
    procedure btn_lock_dateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal09: TFormSal09;
  RunThread: TRunThread;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  CurrTotal:array [0..10] of integer;//薪資各種面額張數統計
  CurrCur:array [0..10] of TCurrNum;//當前紀錄薪資各種面額張數
  WhereStr,TheMon:string;
  is_tran:boolean;//是否轉檔中
{$R *.dfm}

procedure TFormSal09.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
  i:integer;
  GetCpt:TComponent;
begin
with ADOquery1 do
  for i:=0 to Fieldcount-1 do                      
    keys:=keys+'fld_'+Fields[i].FieldName+',';
keys:=keys+'sal09_titl,not_find_data,while_doing,total,current_location,'
  +'date,month,fld_department,fld_dept_code,fld_emp_chs,sal09_count_num,'
  +'query,weihu,print,update,transferfiles,save,cancel,search_condition,'
  +'unit_wan,unit_qian,unit_bai,unit_zhang,unit_currency_num,'
  +'dut02_with_emp,dut02_with_dept,while_doing,cur_emp_id,in_work,,left_work,btn_alldept,'
  +'msg_confirm_save,msg_confirm_cancel,msg_save_modify_data,msg_month_data_locked';
LangStr:=GetLangWideStrs(keys);
PanelTitle.Caption:=GetLangName(LangStr,'sal09_titl');
Label_Month.Caption:=GetLangName(LangStr,'month');
rbupd.Caption:=GetLangName(LangStr,'transferfiles');
rbquery.Caption:=GetLangName(LangStr,'query');
rbemp.Caption:=GetLangName(LangStr,'dut02_with_emp');
rbdept.Caption:=GetLangName(LangStr,'dut02_with_dept');
TntGroupBox1.Caption:=GetLangName(LangStr,'choose');
TntGroupBox2.Caption:=GetLangName(LangStr,'search_condition');
BtnQuery.Caption:=GetLangName(LangStr,'query');
BtnPrint.Caption:=GetLangName(LangStr,'print');
BtnSubmit.Caption:=GetLangName(LangStr,'save');
TntLabel50w.Caption:= '50'+GetLangName(LangStr,'unit_wan');
TntLabel10w.Caption:= '10'+GetLangName(LangStr,'unit_wan');
TntLabel5w.Caption:= '5'+GetLangName(LangStr,'unit_wan');
TntLabel2w.Caption:= '2'+GetLangName(LangStr,'unit_wan');
TntLabel1w.Caption:= '1'+GetLangName(LangStr,'unit_wan');
TntLabel5s.Caption:= '5'+GetLangName(LangStr,'unit_qian');
TntLabel2s.Caption:= '2'+GetLangName(LangStr,'unit_qian');
TntLabel1s.Caption:= '1'+GetLangName(LangStr,'unit_qian');
TntLabel5h.Caption:= '5'+GetLangName(LangStr,'unit_bai');
TntLabel2h.Caption:= '2'+GetLangName(LangStr,'unit_bai');
TntLabelCount.Caption:= GetLangName(LangStr,'unit_currency_num');
Label_full_sal.Caption:=GetLangName(LangStr,'fld_full_sal');
Label_emp_chs.Caption:=GetLangName(LangStr,'fld_emp_chs');
Label_department.Caption:=GetLangName(LangStr,'fld_department');
rb_in.Caption:=GetLangName(LangStr,'in_work');
rb_left.Caption:=GetLangName(LangStr,'left_work');
btn_alldept.Caption:=GetLangName(LangStr,'btn_alldept');

//Label_emp_id.Caption:=GetLangName(LangStr,'fld_emp_id');
//Label_dept_code.Caption:=GetLangName(LangStr,'fld_dept_code');
for i:=0 to 11 do
  begin
    GetCpt:=self.FindComponent('TntLabelUnit'+inttostr(i));
    if GetCpt<>nil then
      TTntLabel(GetCpt).Caption:=GetLangName(LangStr,'unit_zhang');
  end;
with DBGrid1.Columns do// set Columns texts
  begin
    for i:=0 to Count-1 do
    begin
      GetCpt:=self.FindComponent('Label_'+Items[i].FieldName);
      if GetCpt<>nil then
        Ttntlabel(GetCpt).Caption:=GetLangName(LangStr,'fld_'+Items[i].FieldName);
      Items[i].Title.caption:=GetLangName(LangStr,'fld_'+Items[i].FieldName);
    end;
  end;
end;

procedure TFormSal09.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str,fld_name:string;
  slDate:TStringList;
begin
  is_tran:=false;
  if not pri_arr[TRAN] then
    rbupd.Enabled:=false;
  edit_month.Text:=formatdatetime('yyyymm',date-10);
  if userLang='E' then
    fld_name:='dept_code+'' ''+eng_abbr'
  else if userLang='V' then
    fld_name:='dept_code+'' ''+vim_abbr'
  else
    fld_name:='dept_code+'' ''+abbr_titl';
  sql_str:='select '+fld_name+' as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,CobDeptBegin);
  SetComboxList(sql_str,CobDeptEnd);
  //edit_month.Text:= formatdatetime('yyyymm',date);
  //薪資記錄數組
  CurrCur[1].FieldName:='sal50w';
  CurrCur[1].CurrText:='50'+GetLangName(LangStr,'unit_wan');
  CurrCur[1].CurrUnit:=500000;
  CurrCur[2].FieldName:='sal10w';
  CurrCur[2].CurrText:='10'+GetLangName(LangStr,'unit_wan');
  CurrCur[2].CurrUnit:=100000;
  CurrCur[3].FieldName:='sal5w';
  CurrCur[3].CurrText:='5'+GetLangName(LangStr,'unit_wan');
  CurrCur[3].CurrUnit:=50000;
  CurrCur[4].FieldName:='sal2w';
  CurrCur[4].CurrText:='2'+GetLangName(LangStr,'unit_wan');
  CurrCur[4].CurrUnit:=20000;
  CurrCur[5].FieldName:='sal1w';
  CurrCur[5].CurrText:='1'+GetLangName(LangStr,'unit_wan');
  CurrCur[5].CurrUnit:=10000;
  CurrCur[6].FieldName:='sal5s';
  CurrCur[6].CurrText:='5'+GetLangName(LangStr,'unit_qian');
  CurrCur[6].CurrUnit:=5000;
  CurrCur[7].FieldName:='sal2s';
  CurrCur[7].CurrText:='2'+GetLangName(LangStr,'unit_qian');
  CurrCur[7].CurrUnit:=2000;
  //anil modify 2007/2/5 封裝最小截至2000
  CurrCur[8].FieldName:='sal1s';
  CurrCur[8].CurrText:='1'+GetLangName(LangStr,'unit_qian');
  CurrCur[8].CurrUnit:=1000;
  CurrCur[9].FieldName:='sal5h';
  CurrCur[9].CurrText:='5'+GetLangName(LangStr,'unit_bai');
  CurrCur[9].CurrUnit:=500;
  CurrCur[10].FieldName:='sal2h';
  CurrCur[10].CurrText:='2'+GetLangName(LangStr,'unit_bai');
  CurrCur[10].CurrUnit:=200;

  //計算離職薪資
  lab_lock_msg.Caption := 'Lock leave date:'+LockLeaveDate;
  slDate := TStringList.Create;
  try
    slDate := StrSplit(LockLeaveDate,'/');
    //dtp_epledt_bgn.Date := StrToDate(LockLeaveDate)+1;
    dtp_epledt_bgn.Date := EncodeDate(StrToInt(slDate[0]),StrToInt(slDate[1]),StrToInt(slDate[2]))+1;
    dtp_epledt_end.Date := GetServerDateTime;
  finally
//    slDate.Free;
  end;
end;

procedure TFormSal09.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(username,'sal09');
  InitLang;// Init language
  InitForm;// Init Form
end;

procedure TFormSal09.BtnQueryClick(Sender: TObject);
var
  sql_str:string;
begin
  TheMon:=trim(Edit_month.Text);
  WhereStr:='';
  if rbQuery.Checked then
  begin //查詢
    sql_str:='select * from hrd_sal_currency as A where 2>1 ';
    WhereStr:=WhereStr+' and pay_mon='''+TheMon+'''';
    if rbdept.Checked then
    begin
      if trim(CobDeptBegin.Text)<>'' then
        WhereStr:=WhereStr+' and dept_code>='''+leftstr(CobDeptBegin.Text,6)+'''';
      if trim(CobDeptEnd.Text)<>'' then
        WhereStr:=WhereStr+' and dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';
    end
    else
    begin
      if trim(EditEmpBegin.Text)<>'' then
        WhereStr:=WhereStr+' and emp_id>='''+trim(EditEmpBegin.Text)+'''';
      if trim(EditEmpEnd.Text)<>'' then
        WhereStr:=WhereStr+' and emp_id<='''+trim(EditEmpEnd.Text)+'''';
    end;

    //
    if cbChange.Checked then
      WhereStr := WhereStr + ' and emp_id in (select emp_id from hrd_emp_change where change_month = '+QuotedStr(TheMon)+')';

    sql_str:=sql_str+WhereStr;
  end
  else//轉檔
  begin
    //***<<<該月資料已經鎖定 2011-10-04 hyt add
    if (TheMon<=LockMonth)  then
    begin
      WideMessageDlg(GetLangName(LangStr,'msg_month_data_locked'),mtError,[mbYes],0);
      exit;
    end;
    //***>>>

    sql_str:='select * from hrd_sal_currency as A where 1>2 ';
  end;
  with ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  BtnSubmit.Enabled:=false;
  if rbupd.Checked then
  begin//轉檔
    sql_str:='select A.upd_user,A.upd_date,A.emp_id,pay_mon,actu_pay as salary, '
      +'A.dept_code,A.pst_code,A.info_code from hrd_sal_paymt A where 1=1';
    WhereStr:=WhereStr+' and pay_mon='''+trim(Edit_month.Text)+'''';
    if rbdept.Checked then
    begin
      //WhereStr:=WhereStr+' and emp_id in(select emp_id from hrd_sal_paymt where 1=1 '
      //  +' and pay_mon='''+trim(Edit_month.Text)+'''';
      if trim(CobDeptBegin.Text)<>'' then
        WhereStr:=WhereStr+' and dept_code>='''+leftstr(CobDeptBegin.Text,6)+'''';
      if trim(CobDeptEnd.Text)<>'' then
        WhereStr:=WhereStr+' and dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';
      //WhereStr:=WhereStr+')';
    end
    else
    begin
      if trim(EditEmpBegin.Text)<>'' then
        WhereStr:=WhereStr+' and emp_id>='''+trim(EditEmpBegin.Text)+'''';
      if trim(EditEmpEnd.Text)<>'' then
        WhereStr:=WhereStr+' and emp_id<='''+trim(EditEmpEnd.Text)+'''';
      //WhereStr:=WhereStr+' and emp_id in(select emp_id from tempdbf.dbo.aa_00) '; //test 2011-09-21 hyt add
    end;
    //
    if cbChange.Checked then
      WhereStr := WhereStr + ' and emp_id in (select emp_id from hrd_emp_change where change_month = '+QuotedStr(TheMon)+')';

    sql_str:=sql_str+WhereStr;
    with ADOQueryEmp do
      begin
        Close;
        sql.Clear;
        sql.Add(sql_str);
        open;
      end;  
    //TransData;//轉檔
  end;
RunThread := TRunThread.Create(false);
//CountCurrNum;//統計
//BtnPrint.Enabled:=true;
end;

procedure TFormSal09.TransData();
{*************************************************************************
TO DO:轉檔(薪資封裝過程)
*************************************************************************}
var
  sql_str,emp_id,dept_code,info_code,pst_code,pay_mon:string;
  i,k,sal_num,salary:integer;
  up_date:TDateTime;
begin
  up_date:=GetServerDateTime;
  k:=0;
  with ADOQueryEmp do
  begin
    SetProcessBar(true,1,recordCount);
    first;
    while not EOF do
      begin
        if RunThread.Terminated then
        begin//進程結束
          exit;
        end;
        pay_mon:=FieldByName('pay_mon').AsString;
        emp_id:=FieldByName('emp_id').AsString;
        dept_code:=FieldByName('dept_code').AsString;
        info_code:=FieldByName('info_code').AsString;
        pst_code:=FieldByName('pst_code').AsString;
        {if AnsiContainsStr('1|2|7',info_code) then
          info_code:='2'
        else if AnsiContainsStr('3|4|5|6',info_code) then
          info_code:='6';
        if FormatDateTime('yyyymm',FieldByName('epledt').AsDateTime)>pay_mon then
          info_code:='0';//薪資月份在職}
        salary:=FieldByName('salary').AsInteger;
        k:=k+1;
        SetProcessBar(false,1);
        SetStatusText(GetLangName(LangStr,'while_doing')+inttostr(k)+'/'+IntToStr(recordCount)+'; '+GetLangName(LangStr,'cur_emp_id')+':'+emp_id);
        //刪除舊資料
        sql_str:='delete from hrd_sal_currency where emp_id='''+emp_id+''' and pay_mon='''+FieldByName('pay_mon').AsString+'''';
        DMHrdsys.ADOCommand1.CommandText:=sql_str;
        DMHrdsys.ADOCommand1.Execute;
        //if not CheckRecordExist(sql_str) then
          begin//新增資料處理
            ADOQuery1.AppendRecord([username,up_date,pay_mon,emp_id,dept_code,pst_code,info_code,salary]);
            sal_num:=FieldByName('salary').Value;
      
            for i:=0 to 10 do
              CurrCur[i].CurrPieces:=0;
            ADOQuery1.Edit;
            //for i:=1 to 7 do//計算各種面額張數
            //hyt modify 2013/05/25 封裝最小截至200 7->10
            //for i:=1 to 10 do//計算各種面額張數
            //hyt modify 2013/07/01 封裝最小截至200 10->9 細到 500vnd
            for i:=1 to 9 do//計算各種面額張數
              sal_num:=SetMoneyUnit(CurrCur[i].FieldName,sal_num,CurrCur[i].CurrUnit,i);
             // 2008.02.15 <<
               ADOQuery1.FieldByName('full_sal').Value:=FieldByName('salary').Value-sal_num;
         //  ADOQuery1.FieldByName('full_sal').Value:=ADOQuery1.FieldByName('full_sal').Value-sal_num;
          // 2008.02.15 >>
          //  if edit_month.Text  ='200801'  then
           //    ADOQuery1.FieldByName('full_sal').Value:= int( ADOQuery1.FieldByName('full_sal').Value/50000 ) * 50000 ;

            ADOQuery1.FieldByName('curr_qty').AsInteger:=CurrCur[0].CurrPieces;
            if sal_num=0 then
              ADOQuery1.FieldByName('if_full').Value:='1'
            else
              ADOQuery1.FieldByName('if_full').Value:='0';
            ADOQuery1.Post;
          end;
        next;
      end;
  end;
SetProcessBar;
SetStatusText('');
end;

procedure TFormSal09.CountCurrNum();
{*************************************************************************
TO DO:資料統計
*************************************************************************}
var
  i,n:integer;
  full_sals,cnt_sals:double;
  sql_str:string;
begin
for i:=0 to 10 do
  CurrTotal[i]:=0;
n:=0;
full_sals:=0;//合計封裝后薪資
cnt_sals:=0;//合計實際計算薪資
sql_str:='select sum(salary),sum(full_sal),sum(curr_qty),'
  +'sum(sal50w),sum(sal10w),sum(sal5w),sum(sal2w),sum(sal1w),'
  +'sum(sal5s),sum(sal2s),sum(sal1s),sum(sal5h),sum(sal2h)'
  +' from hrd_sal_currency as A where 2>1 '+WhereStr;
With DMHrdsys.SQLQuery3 do
begin          
  close;
  sql.Clear;
  sql.Add(sql_str);
  open;
  if not Eof then
  begin
    cnt_sals:=Fields[0].AsCurrency;
    full_sals:=Fields[1].AsCurrency;
    //CurrTotal[0]:=Fields[2].AsInteger;
    for i:=0 to 10 do
      CurrTotal[i]:=Fields[i+2].AsInteger;
  end;
end;
{with ADOQuery1 do
begin
  first;
  while not EOF do
    begin
      n:=n+1;
      for i:=1 to 10 do
        CurrTotal[i]:=CurrTotal[i]+FieldByName(CurrCur[i].fieldName).AsInteger;
      cnt_sals:=cnt_sals+FieldByName('salary').AsInteger;
      next;
    end;
end;}
n:=ADOQuery1.RecordCount;
edit_total1.Text:=GetLangName(LangStr,'total')+':   ';
for i:=1 to 10 do
  begin
    edit_total1.Text:=edit_total1.Text+CurrCur[i].CurrText +':'+inttostr(CurrTotal[i])+GetLangName(LangStr,'unit_zhang')+';   ';
//    CurrTotal[0]:=CurrTotal[0]+CurrTotal[i];
//    full_sals:=full_sals+CurrTotal[i]*CurrCur[i].CurrUnit;
  end;
edit_total2.Text:=GetLangName(LangStr,'sal09_count_num')+':'+inttostr(n)+';   ';
edit_total2.Text:=edit_total2.Text+GetLangName(LangStr,'unit_currency_num')+':'+inttostr(CurrTotal[0])+';   ';
edit_total2.Text:=edit_total2.Text+GetLangName(LangStr,'fld_salary')+':'+floattostr(cnt_sals)+';   ';
edit_total2.Text:=edit_total2.Text+GetLangName(LangStr,'fld_full_sal')+':'+floattostr(full_sals);
end;

function TFormSal09.SetMoneyUnit(fld_name:string;Money,MoneyUnit,k:integer):integer;
{*************************************************************************
TO DO:薪資封裝,計算某貨幣面額的張數
*************************************************************************}
begin
  if (MoneyUnit=500000) then
    CurrCur[k].CurrPieces:=0
  //else if (MoneyUnit=500) and ((money div 100) mod 2 =0) then    //2013-07-05 hyt delete
  //  CurrCur[k].CurrPieces:=0
  else
    CurrCur[k].CurrPieces:=Money div MoneyUnit;
  ADOQuery1.FieldByName(fld_name).Value:=CurrCur[k].CurrPieces;
  CurrCur[0].CurrPieces:=CurrCur[0].CurrPieces+CurrCur[k].CurrPieces;
  result:=Money - MoneyUnit*CurrCur[k].CurrPieces;
end;

procedure TFormSal09.BtnSubmitClick(Sender: TObject);
{*************************************************************************
TO DO:保存數據
*************************************************************************}
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  ADOQuery1.UpdateBatch;
  BtnSubmit.Enabled:=false;
end;

procedure TFormSal09.BtnCancelClick(Sender: TObject);
{*************************************************************************
TO DO:取消改變
*************************************************************************}
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  ADOQuery1.close;
  ADOQuery1.open;
//  ADOQuery1.CancelBatch;
  BtnSubmit.Enabled:=false;
end;

procedure TFormSal09.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormSal09.ADOQuery1BeforePost(DataSet: TDataSet);
{*************************************************************************
TO DO:移動前錯誤檢查,改變一些欄位值及狀態
*************************************************************************}
begin
with ADOQuery1 do
  begin
    FieldByName('upd_user').Value:=username;
    FieldByName('upd_date').Value:=GetServerDateTime;
    BtnSubmit.Enabled:=true;
  end;
end;

procedure TFormSal09.ADOQuery1AfterScroll(DataSet: TDataSet);
{*************************************************************************
TO DO:移動記錄時提示
*************************************************************************}
var
  EmpInfo:Tfields;
begin
if is_tran then
  exit;//轉檔中不執行
with ADOQuery1 do
  begin
    setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
    //根據工號調出姓名,部門
    if length(FieldByName('emp_id').AsString)=6 then
      begin
        EmpInfo:=GetEmpInfo(FieldByName('emp_id').AsString,FieldByName('pay_mon').value );
        if EmpInfo.FieldByName('emp_id').AsString<>'' then
          begin
            Edit_emp_chs.Text:=EmpInfo.FieldByName('emp_chs').Value;
            Edit_department.Text:=EmpInfo.FieldByName('dept_code').Value+' '+EmpInfo.FieldByName('abbr_titl').Value;
         end;
     end;    
  end;
end;

procedure TFormSal09.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{*************************************************************************
TO DO:快捷鍵設置
*************************************************************************}
begin
if Shift=[ssCtrl] then
  begin
    if key=KEY_S then
      if BtnSubmit.Enabled then
        BtnSubmit.Click;
  end;
if Shift=[] then
  begin
    if key=VK_F2 then
      if BtnSubmit.Enabled then
        BtnSubmit.Click;
    if key=VK_F3 then
      DBGrid1.OnEditButtonClick(nil);
  end;
end;

procedure TFormSal09.RbUpdClick(Sender: TObject);
begin
  BtnQuery.Caption:=GetLangName(LangStr,'transferfiles');
end;

procedure TFormSal09.RbQueryClick(Sender: TObject);
begin
  BtnQuery.Caption:=GetLangName(LangStr,'query');
end;

procedure TFormSal09.rbEmpClick(Sender: TObject);
//按工號查詢
begin
  CobDeptBegin.Enabled:=false;
  CobDeptEnd.Enabled:=false;
  CobDeptBegin.Color:=clBtnface;
  CobDeptEnd.Color:=clBtnface;
  EditEmpBegin.Enabled:=true;
  EditEmpEnd.Enabled:=true;
  EditEmpBegin.Color:=clwhite;
  EditEmpEnd.Color:=clwhite;
  EditEmpBegin.SetFocus;
end;

procedure TFormSal09.rbDeptClick(Sender: TObject);
//按部門查詢
begin
  EditEmpBegin.Enabled:=false;
  EditEmpEnd.Enabled:=false;
  EditEmpBegin.Color:=clBtnface;
  EditEmpEnd.Color:=clBtnface;
  CobDeptBegin.Enabled:=true;
  CobDeptEnd.Enabled:=true;
  CobDeptBegin.Color:=clwhite;
  CobDeptEnd.Color:=clwhite;
  CobDeptBegin.SetFocus;
end;

procedure TFormSal09.EditEmpBeginDblClick(Sender: TObject);
//選擇工號
begin
  TtntEdit(Sender).Text:=FindEmpId('emp_id');
end;

procedure TFormSal09.BtnPrintClick(Sender: TObject);
begin
  showPrint(ADOQuery1,'員工封裝薪資列印');
end;

procedure TRunThread.execute;
{*************************************************************************
TO DO:在線程中讀取實際數據
*************************************************************************}
var
  FormSal09:TFormSal09;
begin
  FreeOnTerminate := true;
  FormSal09:=TFormSal09(Application.FindComponent('FormSal09'));
  with FormSal09 do
  begin
    is_tran:=true;
    BtnQuery.Enabled:=false;
    BtnPrint.Enabled:=false;
    PanelGrid.Enabled:=false;
    BtnReset.Enabled:=true;
    DBGrid1.DataSource:=nil;
    if RBUpd.Checked then
    begin
      TransData;//轉檔
//      UpdateMonDept;//修正部門
    end;
    CountCurrNum;//統計
    //Synchronize(SetPrintDataset);
    DBGrid1.DataSource:=DataSource1;
    PanelGrid.Enabled:=true;
    BtnPrint.Enabled:=true;
    BtnQuery.Enabled:=true;
    BtnReset.Enabled:=false;
    is_tran:=false;
  end;
end;

procedure TFormSal09.BtnResetClick(Sender: TObject);
begin
  if (RunThread<>nil) and (not RunThread.Terminated) then
  begin
    RunThread.Suspend;
    if MessageDlg('您確定要取消?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      RunThread.Resume;
      RunThread.Terminate;
    end
    else
      RunThread.Resume;
  end;
end;

procedure TFormSal09.btn_alldeptClick(Sender: TObject);
var
  sqlstr,datestr:string;
  ADate:TDateTime;
begin
  {sqlstr:='select b.dept_code,c.abbr_titl,sum(a.salary) as salary,sum(a.full_sal) as full_sal,count(*) as peoplesum,'+
         'sum(sal50w) as sal50w,sum(sal10w) as sal10w,sum(sal5w) as sal5w,'+
         'sum(sal2w) as sal2w,sum(sal1w) as sal1w,sum(sal5s) as sal5s,'+
         'sum(sal2s) as sal2s,sum(sal1s) as sal1s,sum(sal5h) as sal5h,sum(sal2h) as sal2h '+

         'from hrd_sal_currency as A,hrd_emp as B,hrd_dept as C'+
         '  where a.salary>0 and a.emp_id=b.emp_id and c.dept_code=b.dept_code and a.pay_mon='''+edit_month.text+''' '+
         ' '+

         ' group by b.dept_code,c.abbr_titl order by b.dept_code ';}
  ADate:=EnCodeDate(StrToInt(LeftStr(edit_month.Text,4)),StrToInt(RightStr(edit_month.Text,2)),1);
  ADate:=EndOfTheMonth(ADate);
  DateStr:=FormatDateTime('yyyy/mm/dd',ADate);
  if rb_in.Checked then
    sqlstr:='select A.dept_code,c.abbr_titl,sum(a.salary) as salary,'+
         'sum(a.full_sal) as full_sal,count(*) as peoplesum,'+
         'sum(sal50w) as sal50w,sum(sal10w) as sal10w,sum(sal5w) as sal5w,'+
         'sum(sal2w) as sal2w,sum(sal1w) as sal1w,sum(sal5s) as sal5s,'+
         'sum(sal2s) as sal2s,sum(sal1s) as sal1s,sum(sal5h) as sal5h,sum(sal2h) as sal2h '+
         'from hrd_sal_currency as A,hrd_dept as C '+
         ' where a.salary>0 and c.dept_code=A.dept_code '+
         ' and A.emp_id not in (select emp_id from hrd_sal_bankcard) '+   // 2010.02.27 <<
         ' and A.info_code=''0'' and a.pay_mon='''+edit_month.text+''''+
         ' group by A.dept_code,c.abbr_titl order by A.dept_code '

         {'from hrd_sal_currency as A,hrd_emp as B,hrd_dept as C,hrd_sal_paymt d '+
         '  where a.salary>0 and d.emp_id=a.emp_id and d.pay_mon=a.pay_mon and a.emp_id=b.emp_id and c.dept_code=d.dept_code and a.pay_mon='''+edit_month.text+''' '+
         ' and (b.epledt is null or b.epledt>'''+DateStr+''')'+

         ' group by d.dept_code,c.abbr_titl order by d.dept_code '}
    {sqlstr:='select b.dept_code,c.abbr_titl,sum(a.salary) as salary,sum(a.full_sal) as full_sal,count(*) as peoplesum,'+
         'sum(sal50w) as sal50w,sum(sal10w) as sal10w,sum(sal5w) as sal5w,'+
         'sum(sal2w) as sal2w,sum(sal1w) as sal1w,sum(sal5s) as sal5s,'+
         'sum(sal2s) as sal2s,sum(sal1s) as sal1s,sum(sal5h) as sal5h,sum(sal2h) as sal2h '+

         'from hrd_sal_currency as A,hrd_emp as B,hrd_dept as C,hrd_sal_paymt d '+
         '  where a.salary>0 and d.emp_id=a.emp_id and d.pay_mon=a.pay_mon and a.emp_id=b.emp_id and c.dept_code=d.dept_code and a.pay_mon='''+edit_month.text+''' '+
         ' and (b.epledt is null or b.epledt>'''+DateStr+''')'+

         ' group by b.dept_code,c.abbr_titl order by b.dept_code '}
  else
  sqlstr:='select A.dept_code,c.abbr_titl,sum(a.salary) as salary,'+
         'sum(a.full_sal) as full_sal,count(*) as peoplesum,'+
         'sum(sal50w) as sal50w,sum(sal10w) as sal10w,sum(sal5w) as sal5w,'+
         'sum(sal2w) as sal2w,sum(sal1w) as sal1w,sum(sal5s) as sal5s,'+
         'sum(sal2s) as sal2s,sum(sal1s) as sal1s,sum(sal5h) as sal5h,sum(sal2h) as sal2h '+
         'from hrd_sal_currency as A,hrd_dept as C '+
         ' where a.salary>0 and c.dept_code=A.dept_code '+
         ' and A.emp_id not in (select emp_id from hrd_sal_bankcard) '+  //2010.02.27 <<
         ' and a.pay_mon='''+edit_month.text+''' and A.info_code<>''0'''+
         ' group by A.dept_code,c.abbr_titl order by A.dept_code ';
  with qry_alldept do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
  end;

 if rb_in.Checked then
    showPrint(qry_alldept,'部門薪資封裝統計(在職)'+edit_month.Text)
  else
    showPrint(qry_alldept,'部門薪資封裝統計(离職)'+edit_month.Text); 
end;

procedure TFormSal09.UpdateMonDept();
//修正部門
var
  sqlstr,DateStr:string;
  ADate:TDatetime;
begin
{  ADate:=EnCodeDate(StrToInt(LeftStr(TheMon,4)),StrToInt(RightStr(TheMon,2)),1);
  ADate:=EndOfTheMonth(ADate)+1;//下月第一天
  DateStr:=FormatDateTime('yyyy/mm/dd',ADate);
  sqlstr:='update hrd_sal_currency set dept_code=A.dept_old'
    +' from hrd_emp_upd A,hrd_sal_currency B'
    +' where A.id in (select min(id) from hrd_emp_upd'
    +' where up_date>='''+DateStr+''' and dept_old<>dept_new group by emp_id)'
    +' and A.emp_id=B.emp_id and pay_mon='''+TheMon+''' and B.dept_code<>A.dept_old';
  with DMHrdsys.ADOCommand1 do
  begin
    CommandText:=sqlstr;
    Execute;
  end;}
end;
//2012-02-04 hyt add
procedure TFormSal09.EditEmpBeginChange(Sender: TObject);
begin
  EditEmpEnd.Text :=EditEmpBegin.Text ;
end;

procedure TFormSal09.btn_lock_dateClick(Sender: TObject);
var
  sLeaveDate,sSql,sNowDate : string;
  dDate:TDateTime;
  slDate:TStringList;
  sDate:string;
begin
  sLeaveDate := FormatDateTime('yyyy/mm/dd',dtp_epledt_end.Date);
  sNowDate := FormatDateTime('yyyy/mm/dd',GetServerDateTime);
  if sNowDate <= sLeaveDate then
  begin
    ShowMessage('Error: The leave date is greater than current date. '+sLeaveDate);
    Exit;
  end;
  sLeaveDate := InputBox('Please input date','Please input the Lock Leave Date:',sLeaveDate);
  try
    slDate := StrSplit(sLeaveDate,'/');
    dDate := EncodeDate(StrToInt(slDate[0]),StrToInt(slDate[1]),StrToInt(slDate[2]));
    sDate := FormatDateTime('YYYY/MM/DD',dDate);
    if WideMessageDlg('Are you sure to lock it?'+sLeaveDate,mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      sSql := 'update hrd_basic set name_cn='''+sDate+''',up_user='''+username+''',up_date=getdate() '
                +' where class=''lock_leave_date'' and code=''0'' and name_cn<'''+sDate+'''';
      if DB_Run_Sql(sSql) then
      begin
        ShowMessage('Deal OK :'+sDate);
        LockLeaveDate:=DB_GetSRecord('SELECT name_cn FROM hrd_basic WHERE class=''lock_leave_date'' and code=''0''');
        lab_lock_msg.Caption := 'Lock leave date:'+LockLeaveDate;
      end else begin
        ShowMessage('Deal error :'+sDate);
      end;
    end;
  except
    ShowMessage('Date is error :'+sDate);
  end;
end;

end.
