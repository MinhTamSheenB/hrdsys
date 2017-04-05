{*************************************************************************
Name：hrd21
Author: anil
Create date:2005-09-06
Modify date:2005-09-08
Commentate:個人考勤明細報表
*************************************************************************}
unit Unithrd21;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils;

type
  TFormHrd21 = class(TForm)
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
    RbEmp: TTntRadioButton;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    RbDept: TTntRadioButton;
    CobDeptBegin: TTntComboBox;
    Panel2: TPanel;
    BtnQuery: TTntButton;
    Panel3: TPanel;
    ADOQuery1emp_id: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1epid_no: TStringField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1epindt: TDateTimeField;
    ADOQuery1pst_code: TStringField;
    ADOQuery1spc_id: TStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery2: TADOQuery;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    Panel6: TPanel;
    TntLabel1: TTntLabel;
    CobNewDept: TTntComboBox;
    BtnIn: TTntBitBtn;
    Panel7: TPanel;
    Rb_out: TTntRadioButton;
    Rb_in: TTntRadioButton;
    ADOQuery3: TADOQuery;
    Panel4: TPanel;
    BtnOut: TTntBitBtn;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure BtnInClick(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure BtnOutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd21: TFormHrd21;
  
implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  n_late,n_early:integer;
  work_time,over_time,left_time,out_time,ab_time:double;
  emp_id,clas_chs,real_start,real_end,ab_code:string;
  wrk_date:Tdatetime;
{$R *.dfm}

procedure TFormHrd21.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
//  pri_arr:=GetPrvArr(username,'hrd21');
  pri_arr:=GetPrvArr(username,'hrd29');
  InitForm;// Init Form
end;

procedure TFormHrd21.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='sal10_titl,not_find_data,total,current_location,msg_must_same_month,'
  +'while_printing,print_finish,just_doing_empid,finish,msg_confirm_cancel2,'
  +'save_success,save_fail,';
LangStr:=GetLangWideStrs(keys);
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormHrd21.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
  GetDeptRange(CobDeptBegin);
//  GetDeptRange(CobDeptEnd);
  GetDeptRange(CobNewDept);
end;

procedure TFormHrd21.BtnQueryClick(Sender: TObject);
var
  sqlstr,upSql,whereStr:string;
begin
  if Rb_out.Checked then//轉出
  begin
    sqlstr:='select * from hrd_emp B where 1=1 ';
    upSql:='select * from hrd_dept_chg_tmp B where 1=2 ';
    if RbEmp.Checked then
      whereStr:=whereStr+' and B.emp_id='''+trim(EditEmpBegin.Text)+'''';
    if RbDept.Checked then
      whereStr:=whereStr+' and B.dept_code='''+LeftStr(CobDeptBegin.Text,6)+'''';
    whereStr:=whereStr+' and B.epledt is null';
    BtnOut.Enabled:=true;
    BtnIn.Enabled:=false;
    CobNewDept.Enabled:=false;
  end
  else//轉入
  begin
    sqlstr:='select * from hrd_dept_chg_tmp B,hrd_emp A where A.emp_id=B.emp_id ';
    upSql:='select * from hrd_emp_upd A where 1=2 ';
    if RbEmp.Checked then
      whereStr:=whereStr+' and B.emp_id='''+trim(EditEmpBegin.Text)+'''';
    if RbDept.Checked then
      whereStr:=whereStr+' and B.dept_code='''+LeftStr(CobDeptBegin.Text,6)+'''';
    with ADOQuery3 do
    begin//待修改hrd_emp檔名單 
      close;
      sql.Clear;
      sql.Add('select * from hrd_emp B where 1=1'+WhereStr);
      open;
    end;
    whereStr:=whereStr+' and getdate()-B.act_date<1';
    BtnOut.Enabled:=false;
    BtnIn.Enabled:=true;
    CobNewDept.Enabled:=true;
  end;
  SqlStr:=SqlStr+whereStr;
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
  end;
  with ADOQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(upSql);
    open;
  end;
end;

procedure TFormHrd21.TntDBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormHrd21.BtnInClick(Sender: TObject);
//轉入
var
  new_dept,emp_id,pst_code,dept_code:string;
  up_date:TdateTime;
begin
  new_dept:=LeftStr(CobNewDept.Text,6);
  up_date:=GetServerDateTime;
  with ADOQuery1 do
  begin
    First;
    while not Eof do
    begin
      //Edit;
      emp_id:=FieldByName('emp_id').AsString;
      pst_code:=FieldByName('pst_code').AsString;
      dept_code:=FieldByName('dept_code').AsString;
      {ieldByName('dept_code').AsString:=new_dept;
      FieldByName('upd_user').AsString:=username;
      FieldByName('upd_date').AsDateTime:=up_date; }
      if ADOQuery3.Locate('emp_id',emp_id,[loCaseInsensitive]) then
      begin//修改hrd_emp
        ADOQuery3.Edit;
        ADOQuery3.FieldByName('dept_code').AsString:=new_dept;
        ADOQuery3.FieldByName('factory').AsString:=LeftStr(new_dept,1);
        ADOQuery3.FieldByName('upd_user').AsString:=username;
        ADOQuery3.FieldByName('upd_date').AsDateTime:=up_date;
        ADOQuery3.Post;
      end;
      //寫入hrd_emp_upd
      ADOQuery2.AppendRecord([username,up_date,emp_id,pst_code,dept_code,
        pst_code,new_dept,up_date]);
      Next;
    end;
    try
      ADOQuery3.UpdateBatch();
      ADOQuery2.UpdateBatch();
      WideShowMessage(GetLangName(LangStr,'save_success'));
    except
      WideShowMessage(GetLangName(LangStr,'save_fail'));
    end;
  end;
end;

procedure TFormHrd21.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  with DataSet do
    setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

procedure TFormHrd21.BtnOutClick(Sender: TObject);
//調出
var
  new_dept,emp_id,pst_code,dept_code:string;
  up_date:TdateTime;
begin
  //new_dept:=LeftStr(CobNewDept.Text,6);
  up_date:=GetServerDateTime;
  with ADOQuery1 do
  begin
    First;
    while not Eof do
    begin
      emp_id:=FieldByName('emp_id').AsString;
      pst_code:=FieldByName('pst_code').AsString;
      dept_code:=FieldByName('dept_code').AsString;
      ADOQuery2.AppendRecord([username,up_date,emp_id,dept_code,'',
        up_date,pst_code]);
      Next;
    end;
  end;
  try
    ADOQuery2.UpdateBatch();
    WideShowMessage(GetLangName(LangStr,'save_success'));
  except
    WideShowMessage(GetLangName(LangStr,'save_fail'));
  end;
end;

end.
