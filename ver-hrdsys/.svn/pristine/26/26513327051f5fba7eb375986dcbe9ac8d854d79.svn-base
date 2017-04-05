{*************************************************************************
Name：dut20(員工加班資料匯總轉檔)
Author: Leo
Create date:2005-11-19
Modify date:2005-11-19
Commentate:員工加班資料匯總轉檔
*************************************************************************}
unit UnitDut20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,DateUtils,
  TntComCtrls,WSDLIntf,QRPrntr, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient,QRCtrls,QRExport,math;

type
  TFormDut20 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    qry_pub: TADOQuery;
    pc1: TTntPageControl;
    TntTabSheet1: TTntTabSheet;
    TntTabSheet2: TTntTabSheet;
    TntGroupBox1: TTntGroupBox;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    bb_reset: TTntBitBtn;
    bb_ok: TTntBitBtn;
    Btn_Print: TTntBitBtn;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    TntCheckBox1: TTntCheckBox;
    TntCheckBox2: TTntCheckBox;
    TntDBGrid1: TTntDBGrid;
    TntLabel2: TTntLabel;
    me_year: TMaskEdit;
    TntPanel3: TTntPanel;
    TntPanel4: TTntPanel;
    TntGroupBox2: TTntGroupBox;
    TntLabel17: TTntLabel;
    TntLabel18: TTntLabel;
    sb_EmpBeg: TTntSpeedButton;
    sb_EmpEnd: TTntSpeedButton;
    rb_ByEmp_T: TTntRadioButton;
    rb_ByDept_T: TTntRadioButton;
    cob_DeptBeg: TTntComboBox;
    EditEmpBeg_T: TTntEdit;
    EditEmpEnd_T: TTntEdit;
    cob_DeptEnd: TTntComboBox;
    TntStaticText1: TTntStaticText;
    BBtn_Tran: TTntBitBtn;
    me_month: TMaskEdit;
    TntLabel1: TTntLabel;
    ADOQuery1remaindays: TFloatField;
    ADOQuery2: TADOQuery;
    ADOQuery1emp_id: TStringField;
    ADOQuery1year: TStringField;
    ADOQuery1january: TFloatField;
    ADOQuery1february: TFloatField;
    ADOQuery1march: TFloatField;
    ADOQuery1april: TFloatField;
    ADOQuery1may: TFloatField;
    ADOQuery1june: TFloatField;
    ADOQuery1july: TFloatField;
    ADOQuery1august: TFloatField;
    ADOQuery1september: TFloatField;
    ADOQuery1october: TFloatField;
    ADOQuery1november: TFloatField;
    ADOQuery1december: TFloatField;
    ADOQuery1tot_hour: TFloatField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1dept_code: TWideStringField;
    ADOCommand1: TADOCommand;
    PanelShow: TTntPanel;
    TntPanel2: TTntPanel;
    Image1: TImage;
    TntDBGrid2: TTntDBGrid;
    qry_detail: TADOQuery;
    DataSource2: TDataSource;
    qry_detailemp_id: TStringField;
    qry_detaildut_mon: TStringField;
    qry_detailclas_code: TStringField;
    qry_detailday01: TStringField;
    qry_detailday02: TStringField;
    qry_detailday03: TStringField;
    qry_detailday04: TStringField;
    qry_detailday05: TStringField;
    qry_detailday06: TStringField;
    qry_detailday07: TStringField;
    qry_detailday08: TStringField;
    qry_detailday09: TStringField;
    qry_detailday10: TStringField;
    qry_detailday11: TStringField;
    qry_detailday12: TStringField;
    qry_detailday13: TStringField;
    qry_detailday14: TStringField;
    qry_detailday15: TStringField;
    qry_detailday16: TStringField;
    qry_detailday17: TStringField;
    qry_detailday18: TStringField;
    qry_detailday19: TStringField;
    qry_detailday20: TStringField;
    qry_detailday21: TStringField;
    qry_detailday22: TStringField;
    qry_detailday23: TStringField;
    qry_detailday24: TStringField;
    qry_detailday25: TStringField;
    qry_detailday26: TStringField;
    qry_detailday27: TStringField;
    qry_detailday28: TStringField;
    qry_detailday29: TStringField;
    qry_detailday30: TStringField;
    qry_detailday31: TStringField;
    ADOQuery3: TADOQuery;
    ClientDataSet1: TClientDataSet;
    ADOQuery3emp_id: TStringField;
    ADOQuery3over_date: TDateTimeField;
    ADOQuery3clas_code: TStringField;
    ADOQuery3time_count: TStringField;
    RbInWork: TTntRadioButton;
    RbLeftWork: TTntRadioButton;
    Rball: TTntRadioButton;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure TranAEmp(EmpId:string);
    procedure Showdetail(empid:String;Ayear,Amonth:integer);
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure bb_okClick(Sender: TObject);
    procedure bb_resetClick(Sender: TObject);
    procedure CobDeptBeginChange(Sender: TObject);
    procedure EditEmpBeginDblClick(Sender: TObject);
    procedure TntCheckBox1Click(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure Btn_PrintClick(Sender: TObject);
    procedure rb_ByEmp_TClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure BBtn_TranClick(Sender: TObject);
    procedure cob_DeptBegChange(Sender: TObject);
    procedure me_yearClick(Sender: TObject);
    procedure me_monthClick(Sender: TObject);
    procedure pc1Change(Sender: TObject);
    procedure TntDBGrid1CellClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure TntPanel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ADOQuery1emp_idGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQuery1emp_chsGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut20: TFormDut20;
  matNum,affNum,wedNum,funNum,injNum,allNum:integer;
  matDays,affDays,wedDays,funDays,injDays,allDays:Double;
  InDate,LvDate:TDate;
  UpMode:boolean;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
const
  TMP_DB='[tempdbf].[dbo].';
  TMP_TABLE='tmp_dut_empovr';
{$R *.dfm}

procedure TFormDut20.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(UserName,'dut19');
  InitLang;// Init language
  InitForm;// Init Form
end;

procedure TFormDut20.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
  keys:='dut18_error1,just_doing_empid,msg_date_e_great_b,tran_success,'+
        'dut20_error1,dut20_print,tran_fail,current_location';
  LangStr:=GetLangWideStrs(keys);
  SetComponentLang(self);
end;                        

procedure TFormDut20.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str,fld_name:string;
begin
  pri_arr:=GetPrvArr(UserName,'dut20');
  if pri_arr[INQ] then
    TntTabSheet1.TabVisible:=true
  else
    TntTabSheet1.TabVisible:=false;
  if pri_arr[TRAN] then
    TntTabSheet2.TabVisible:=true
  else
    TntTabSheet2.TabVisible:=false;    
  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
  GetDeptRange(Cob_DeptBeg);
  GetDeptRange(Cob_DeptEnd);
  CobDeptBegin.ItemIndex:=0;
  CobDeptEnd.ItemIndex:=CobDeptEnd.Items.Count-1;
  Cob_DeptBeg.ItemIndex:=0;
  Cob_DeptEnd.ItemIndex:=Cob_DeptEnd.Items.Count-1;
end;

procedure TFormDut20.bb_okClick(Sender: TObject);
var
  SqlStr:wideString;
begin
  if (length(trim(me_year.Text))<>4) or (StrToInt(me_year.text)>yearof(GetServerDateTime))then
  begin
    wideshowmessage(GetLangName(LangStr,'dut18_error1'));
    exit;
  end;
  SqlStr:='if exists (select * from '+TMP_DB+'sysobjects where name='''+TMP_TABLE+''')'
    +'drop table '+TMP_DB+TMP_TABLE+';';
  SqlStr:=SqlStr+'select a.*,b.emp_chs,b.dept_code+'' ''+c.abbr_titl as dept_code '+
     ' into '+TMP_DB+TMP_TABLE+' from hrd_dut_empovr a,hrd_emp b,hrd_dept c  '+
     'where a.emp_id=b.emp_id and b.dept_code=c.dept_code '+
     ' and a.year='''+me_year.text+'''';
  if TntCheckBox1.Checked then
  begin
    if EditEmpBegin.Text<>'' then
      SqlStr:=SqlStr+' and a.emp_id>='''+EditEmpBegin.Text+''' ';
    if EditEmpEnd.Text<>'' then
      SqlStr:=SqlStr+' and a.emp_id<='''+EditEmpEnd.Text+''' ';
  end; 
  if TntCheckBox2.Checked then
  begin
    if CobDeptBegin.Text<>'' then
      SqlStr:=SqlStr+' and b.dept_code>='''+leftstr(CobDeptBegin.Text,6)+''' ';
    if CobDeptEnd.Text<>'' then
      SqlStr:=SqlStr+' and b.dept_code<='''+leftstr(CobDeptEnd.Text,6)+''' ';
  end;
  if RbInWork.Checked then//在職
    SqlStr:=SqlStr+' and b.epledt is null';
  if RbLeftWork.Checked then//離職
    SqlStr:=SqlStr+' and b.epledt is not null';
  with DMHrdsys.ADOCommand1 do
  begin
    CommandText:=sqlstr;
    Execute;
  end;
  if RunMode='2' then//檢查模式
  begin
    SqlStr:='update '+TMP_DB+TMP_TABLE+' set tot_hour=300,'
     +' april=april-(tot_hour-300) WHERE tot_hour > 300 ';
    with DMHrdsys.ADOCommand1 do
    begin
      CommandText:=sqlstr;
      Execute;
    end;
  end;
  SqlStr:='select * from '+TMP_DB+TMP_TABLE;
  bb_ok.Enabled:=false;
  with adoquery1 do
  begin
    close;
    sql.clear;
    sql.Add(SqlStr);
    Open;
  end;
  bb_reset.Enabled := true;
  btn_print.Enabled := true;
end;

procedure TFormDut20.bb_resetClick(Sender: TObject);
begin
  adoquery1.Close;

  TntCheckBox1.Enabled:=true;
  TntCheckBox2.Enabled:=true; 

  
  TntCheckBox1.Checked:=false;
  TntCheckBox2.Checked:=false; 
 
  
  bb_ok.Enabled := true;
  bb_reset.Enabled := false;
  btn_print.Enabled := false;
 
end;

procedure TFormDut20.CobDeptBeginChange(Sender: TObject);
begin
  if CobDeptBegin.ItemIndex>CobDeptEnd.ItemIndex then
  begin
    CobDeptEnd.ItemIndex:=CobDeptBegin.ItemIndex;
  end;
end;

procedure TFormDut20.EditEmpBeginDblClick(Sender: TObject);
var
  empid:string;
begin
  empid:=FindEmpId('emp_id');
  if empid<>'' then
  begin
    if sender.ClassName='TTntEdit' then
      TEdit(sender).Text:=empid
    else
    begin
      if TTntSpeedbutton(sender).Name='sb_EmpBeg' then
        EditEmpBeg_T.Text:=empid
      else  
        EditEmpEnd_T.Text:=empid
    end;  
  end;
end;

procedure TFormDut20.TntCheckBox1Click(Sender: TObject);
begin
  if tntCheckBox1.Checked then
  begin
    EditEmpBegin.Enabled:=true;
    EditEmpEnd.Enabled:=true;
  end
  else
  begin
    EditEmpBegin.Enabled:=false;
    EditEmpEnd.Enabled:=false;
  end;
  if TntCheckbox2.Checked then
  begin
    CobDeptBegin.Enabled:=true;
    CobDeptEnd.Enabled:=true;
  end
  else
  begin
    CobDeptBegin.Enabled:=false;
    CobDeptEnd.Enabled:=false;
  end;


end;

procedure TFormDut20.TntDBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;

procedure TFormDut20.Btn_PrintClick(Sender: TObject);
var
  Title:widestring;
begin
  SetStatusText(GetLangName(LangStr,'while_printing'));
  Title :=GetLangName(LangStr,'dut20_print');
  ShowPrint(adoquery1,Title);
  SetStatusText(GetLangName(LangStr,'print_finish'));
end;

procedure TFormDut20.rb_ByEmp_TClick(Sender: TObject);
begin
  if rb_byEmp_T.Checked then
  begin
    EditEmpBeg_T.Enabled:=true;
    EditEmpEnd_T.Enabled:=true;
    sb_EmpBeg.Enabled:=true;
    sb_EmpEnd.Enabled:=true;
  end
  else
  begin
    EditEmpBeg_T.Enabled:=false;
    EditEmpEnd_T.Enabled:=false;
    sb_EmpBeg.Enabled:=false;
    sb_EmpEnd.Enabled:=false;
  end;
  if rb_byDept_T.Checked then
  begin
    Cob_DeptBeg.Enabled:=true;
    Cob_DeptEnd.Enabled:=true;
  end
  else
  begin
    Cob_DeptBeg.Enabled:=false;
    Cob_DeptEnd.Enabled:=false;
  end;
end;

procedure TFormDut20.ADOQuery1CalcFields(DataSet: TDataSet);
var
  i:integer;
  dif_hour,per_hour:double;
begin
  adoquery1.FieldByName('remainhours').Value:=300-adoquery1.fieldbyname('tot_hour').Value;
end;

procedure TFormDut20.BBtn_TranClick(Sender: TObject);
var
  SqlStr:wideString;
begin
  if (length(trim(me_month.Text))<>6) or (me_month.Text>formatDateTime('yyyymm',GetServerDateTime)) then
  begin
    wideshowmessage(GetLangName(langstr,'dut20_error1'));
    exit;
  end; 
  SqlStr:='select emp_id from hrd_emp where (epledt is null or epledt>='''+DateToStr(Dateof(EndofTheMonth(encodeDate(strtoint(leftstr(me_month.Text,4)),strtoint(rightstr(me_month.Text,2)),1))))+''')';
  if rb_byemp_t.Checked then
  begin
    if trim(EditEmpBeg_t.Text)<>'' then
      SqlStr:=SqlStr+' and emp_id>='''+trim(EditEmpBeg_t.Text)+''' ';
    if trim(EditEmpEnd_t.Text)<>'' then
      SqlStr:=SqlStr+' and emp_id<='''+trim(EditEmpEnd_t.Text)+''' ';  
  end;
  if rb_byDept_t.Checked then
  begin
    if trim(Cob_DeptBeg.Text)<>'' then
      SqlStr:=SqlStr+' and dept_code>='''+leftstr(Cob_DeptBeg.Text,6)+''' ';
    if trim(Cob_DeptEnd.Text)<>'' then
      SqlStr:=SqlStr+' and dept_code<='''+leftstr(Cob_DeptEnd.Text,6)+''' ';
  end;
  with adoquery2 do
  begin
    sql.Clear;
    sql.Add(sqlstr);
    open;
    SetProcessBar(true,1,RecordCount);      
    try
      DMHrdsys.conn.BeginTrans;
      while not eof do
      begin
        SetProcessBar(false);
        SetStatusText(GetLangName(langstr,'just_doing_empid')+fieldbyname('emp_id').AsString+'  '+inttostr(recno)+'/'+inttostr(recordcount));
        TranAEmp(fieldbyname('emp_id').AsString);
        next;
      end;
      DMHrdsys.conn.CommitTrans;
    except
      DMHrdsys.conn.RollbackTrans;
      SetStatusText(GetLangName(langstr,'tran_fail'));
      exit;
    end;
    SetProcessBar(true);
    SetStatusText(GetLangName(langstr,'tran_success'));
  end;
end;

procedure TFormDut20.TranAEmp(EmpId:string);
var
  SqlStr,fName:String;
  total,addup:double;
  i,tmp:integer;
begin  
  total:=0.0;
  SqlStr:='select * from hrd_dut_mon where dut_mon='''
      +me_month.text+''' and emp_id='''+empid+
      ''' and clas_code in(''65'',''66'',''67'',''68'',''69'',''72'',''80'',''82'',''85'',''90'',''92'',''95'')';
  with qry_pub do
  begin
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;
    while not eof do
    begin
      for i:=5 to FieldCount-1 do
      begin
        if trim(fields[i].AsString)<>'' then
        begin
          tmp:=fields[i].AsInteger;
          total:=total+(tmp mod 100)/60+(tmp div 100);
        end;  
      end;
      next;
    end;
    Close;
    SqlStr:='select * from hrd_dut_empovr where emp_id='''+empid+
            ''' and [year]='''+leftstr(me_month.text,4)+''' ';
    sql.Clear;
    sql.Add(SqlStr);
    Open;
    fName:=fields[StrToInt(rightStr(me_month.text,2))+3].FieldName;
    if eof then//需要新增資料
    begin
      adoCommand1.CommandText:='insert into hrd_dut_empovr(up_user,up_date,emp_id,[year],'+
           fName+',tot_hour) values('''+UserName+''',{fn now()},'''+empid+''','''+
           leftstr(me_month.text,4)+ ''','+floatToStr(total)+','+floatToStr(total)+')';
      adoCommand1.Execute;     
    end
    else  //需要修改資料
    begin
      addup:=0.0;
      for i:=4 to fieldcount-2 do
      begin
        if i=StrToInt(rightStr(me_month.text,2))+3 then
          continue;
        addup:=addup+fields[i].value;           
      end;
      addup:=addup+total;
      adoCommand1.CommandText:='update hrd_dut_empovr '+
                               'set up_user='''+UserName+''','+
                               'up_date={fn now()},'+
                               fName+'='+floatToStr(total)+
                               ',tot_hour='+floatToStr(addup)+
                               ' where emp_id='''+empid+''' and [year]='''+
                               leftstr(me_month.text,4)+'''';
      adoCommand1.Execute;                          
    end;
    Close;
  end;
end;
procedure TFormDut20.cob_DeptBegChange(Sender: TObject);
begin
  if Cob_DeptBeg.ItemIndex>Cob_DeptEnd.ItemIndex then
  begin
    Cob_DeptEnd.ItemIndex:=Cob_DeptBeg.ItemIndex;
  end;
end;

procedure TFormDut20.me_yearClick(Sender: TObject);
begin
  me_year.Text:=formatDatetime('yyyy',GetServerdatetime);
  me_year.SelStart:=0;
  me_year.SelLength:=4;
end;

procedure TFormDut20.me_monthClick(Sender: TObject);
begin
  me_month.Text:=formatdatetime('yyyymm',GetServerDateTime);
  me_month.SelStart:=0;
  me_month.SelLength:=7;
end;

procedure TFormDut20.pc1Change(Sender: TObject);
begin
   bb_reset.Click;
   panelshow.hide;
   qry_detail.close;
end;

procedure TFormDut20.TntDBGrid1CellClick(Column: TColumn);
var
  fno:integer;
begin
  if RunMode='2' then
    exit;
  fno:= adoquery1.FieldByName(Column.FieldName).FieldNo;
  if (fno<5) or (fno>16) then
    exit;
  Showdetail(adoquery1.FieldByName('emp_id').AsString,adoquery1.fieldbyname('year').AsInteger,column.Grid.SelectedIndex-3);
end;

procedure TFormDut20.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(adoquery1.RecNo)+'/'+inttostr(adoquery1.RecordCount));
end;

procedure TFormDut20.TntPanel2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Panelshow.Perform(WM_SysCommand,$F012,0);
end;
procedure TFormDut20.Showdetail(empid:String;Ayear,Amonth:integer);
var
  SqlStr:WideString;
  dutmon:string;
  i,hours:integer;
begin
  dutmon:=IntToStr(Ayear)+format('%.2d',[Amonth]);
  SqlStr:='select * from hrd_dut_mon where dut_mon='''
      +dutmon+''' and emp_id='''+empid+
      ''' and clas_code in(''65'',''66'',''67'',''68'',''69'',''72'',''80'',''82'',''85'',''90'',''92'',''95'')';       
  with qry_detail do
  begin
    sql.Clear;
    sql.Add(SqlStr);
    Open;
    if eof then
    begin
     // wideshowmessage(LangStr,);
      exit;
    end;
    clientdataset1.Active:=false;
    clientdataset1.CreateDataSet;
    clientdataset1.Active:=true;
    while not eof do
    begin
      for i:=1 to 31 do
      begin
        if fieldbyname('day'+format('%.2d',[i])).AsString<>'' then
        begin
          hours:=fieldbyname('day'+format('%.2d',[i])).AsInteger;
          clientdataset1.Append;
          clientdataset1.FieldByName('emp_id').Asstring:=empid;
          clientdataset1.FieldByName('over_date').AsDateTime:=encodedate(ayear,amonth,i);
          clientdataset1.FieldByName('clas_code').AsString:=fieldbyname('clas_code').AsString;
          clientdataset1.FieldByName('time_count').AsFloat:=(hours div 100)+(hours mod 100)/60;
        end;
      end;
      next;
    end;
  end;
  panelshow.show;
end;

procedure TFormDut20.Image1Click(Sender: TObject);
begin
  panelshow.Hide;
  qry_detail.Close;
end;

procedure TFormDut20.FormDestroy(Sender: TObject);
begin
  SetStatustext('');
  SetProcessBar;
end;

procedure TFormDut20.ADOQuery1emp_idGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  i:integer;
  dif_hour,per_hour:double;
begin
  //
end;

procedure TFormDut20.ADOQuery1emp_chsGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  i:integer;
  dif_hour,per_hour:double;
begin
  {if RunMode='2' then//檢查模式
    with ADOQuery1 do
      if FieldByName('tot_hour').AsFloat>300 then
      begin
        dif_hour:=FieldByName('tot_hour').AsFloat-300.0;
        Edit;
        FieldByName('tot_hour').AsFloat:=300;
        for i:=4 to 15 do
        begin
          per_hour:=min(Fields[i].AsFloat-24,dif_hour);
          per_hour:=max(per_hour,0);
          Fields[i].AsFloat:=Fields[i].AsFloat-per_hour;
          dif_hour:=dif_hour-per_hour;
          if dif_hour<=0 then
            break;
        end;
        Post;
      end;}
  text:=Sender.Value;
end;

end.
