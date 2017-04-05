unit uFhrd204;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, Grids, DBGrids, TntDBGrids, StdCtrls, Buttons,DateUtils,
  TntButtons, TntStdCtrls, Mask, ComCtrls, TntComCtrls, ExtCtrls,
  TntExtCtrls, CheckLst, TntCheckLst, DB, ADODB,StrUtils,TntDialogs,
  DBClient, WSDLIntf,Provider;
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
  TFormFhrd204 = class(TForm)
    TntPageControl1: TTntPageControl;
    TntTabSheet1: TTntTabSheet;
    TntGroupBox1: TTntGroupBox;
    TntLabel1: TTntLabel;
    sb_ChoseEmp1: TTntSpeedButton;
    TntLabel5: TTntLabel;
    me_Month1: TMaskEdit;
    rb_ByEmp1: TTntRadioButton;
    EditEmp1: TTntEdit;
    rb_ByDept1: TTntRadioButton;
    cob_DeptBeg1: TTntComboBox;
    cob_DeptEnd1: TTntComboBox;
    bbtn_Confirm1: TTntBitBtn;
    bbtn_Reset1: TTntBitBtn;
    TntStaticText3: TTntStaticText;
    dtp_beg1: TTntDateTimePicker;
    dtp_end1: TTntDateTimePicker;
    TntGroupBox2: TTntGroupBox;
    dbg_emp1: TTntDBGrid;
    TntPanel4: TTntPanel;
    TntGroupBox4: TTntGroupBox;
    lbl_day101: TTntLabel;
    lbl_day102: TTntLabel;
    lbl_day104: TTntLabel;
    lbl_day103: TTntLabel;
    lbl_day105: TTntLabel;
    lbl_day106: TTntLabel;
    lbl_day107: TTntLabel;
    lbl_day108: TTntLabel;
    lbl_day109: TTntLabel;
    lbl_day110: TTntLabel;
    lbl_day111: TTntLabel;
    lbl_day112: TTntLabel;
    lbl_day113: TTntLabel;
    lbl_day114: TTntLabel;
    lbl_day115: TTntLabel;
    lbl_day116: TTntLabel;
    lbl_day117: TTntLabel;
    lbl_day118: TTntLabel;
    lbl_day119: TTntLabel;
    lbl_day120: TTntLabel;
    lbl_day121: TTntLabel;
    lbl_day122: TTntLabel;
    lbl_day123: TTntLabel;
    lbl_day124: TTntLabel;
    lbl_day125: TTntLabel;
    lbl_day126: TTntLabel;
    lbl_day127: TTntLabel;
    lbl_day128: TTntLabel;
    lbl_day129: TTntLabel;
    lbl_day130: TTntLabel;
    lbl_day131: TTntLabel;
    me_day101: TMaskEdit;
    me_day102: TMaskEdit;
    me_day104: TMaskEdit;
    me_day103: TMaskEdit;
    me_day105: TMaskEdit;
    me_day106: TMaskEdit;
    me_day107: TMaskEdit;
    me_day108: TMaskEdit;
    me_day109: TMaskEdit;
    me_day110: TMaskEdit;
    me_day111: TMaskEdit;
    me_day112: TMaskEdit;
    me_day113: TMaskEdit;
    me_day114: TMaskEdit;
    me_day115: TMaskEdit;
    me_day116: TMaskEdit;
    me_day117: TMaskEdit;
    me_day118: TMaskEdit;
    me_day119: TMaskEdit;
    me_day120: TMaskEdit;
    me_day121: TMaskEdit;
    me_day122: TMaskEdit;
    me_day123: TMaskEdit;
    me_day124: TMaskEdit;
    me_day125: TMaskEdit;
    me_day126: TMaskEdit;
    me_day127: TMaskEdit;
    me_day128: TMaskEdit;
    me_day129: TMaskEdit;
    me_day130: TMaskEdit;
    me_day131: TMaskEdit;
    TntGroupBox3: TTntGroupBox;
    dbg_seg1: TTntDBGrid;
    PanelPrint: TTntPanel;
    bbtn_Print: TTntBitBtn;
    bbtn_Close: TTntBitBtn;
    TntTabSheet2: TTntTabSheet;
    TntGroupBox5: TTntGroupBox;
    TntLabel2: TTntLabel;
    sb_ChoseEmp2: TTntSpeedButton;
    TntLabel3: TTntLabel;
    me_Month2: TMaskEdit;
    rb_ByEmp2: TTntRadioButton;
    EditEmp2: TTntEdit;
    rb_ByDept2: TTntRadioButton;
    cob_DeptBeg2: TTntComboBox;
    cob_DeptEnd2: TTntComboBox;
    bbtn_Confirm2: TTntBitBtn;
    bbtn_Reset2: TTntBitBtn;
    TntStaticText2: TTntStaticText;
    dtp_begin: TTntDateTimePicker;
    dtp_end: TTntDateTimePicker;
    TntPanel2: TTntPanel;
    TntGroupBox7: TTntGroupBox;
    sb_WorkDay: TTntSpeedButton;
    sb_Sunday: TTntSpeedButton;
    sb_weekwork: TTntSpeedButton;
    sb_weeksunday: TTntSpeedButton;
    cb_WorkDay: TTntCheckBox;
    me_WorkDay: TMaskEdit;
    cb_Sunday: TTntCheckBox;
    me_Sunday: TMaskEdit;
    bbtn_Set: TTntBitBtn;
    cb_weekwork: TTntCheckBox;
    me_weekwork: TMaskEdit;
    cb_weekSunday: TTntCheckBox;
    me_weeksunday: TMaskEdit;
    bbtn_setw: TTntBitBtn;
    TntGroupBox8: TTntGroupBox;
    lbl_Day208: TTntLabel;
    lbl_Day207: TTntLabel;
    lbl_Day206: TTntLabel;
    lbl_Day205: TTntLabel;
    lbl_Day203: TTntLabel;
    lbl_Day204: TTntLabel;
    lbl_Day231: TTntLabel;
    lbl_Day230: TTntLabel;
    lbl_Day229: TTntLabel;
    lbl_Day202: TTntLabel;
    lbl_Day228: TTntLabel;
    lbl_Day227: TTntLabel;
    lbl_Day226: TTntLabel;
    lbl_Day225: TTntLabel;
    lbl_Day224: TTntLabel;
    lbl_Day223: TTntLabel;
    lbl_Day222: TTntLabel;
    lbl_Day221: TTntLabel;
    lbl_Day220: TTntLabel;
    lbl_Day219: TTntLabel;
    lbl_Day201: TTntLabel;
    lbl_Day218: TTntLabel;
    lbl_Day217: TTntLabel;
    lbl_Day216: TTntLabel;
    lbl_Day215: TTntLabel;
    lbl_Day214: TTntLabel;
    lbl_Day213: TTntLabel;
    lbl_Day212: TTntLabel;
    lbl_Day211: TTntLabel;
    lbl_Day210: TTntLabel;
    lbl_Day209: TTntLabel;
    me_day208: TMaskEdit;
    me_day207: TMaskEdit;
    me_day206: TMaskEdit;
    me_day205: TMaskEdit;
    me_day203: TMaskEdit;
    me_day204: TMaskEdit;
    me_day231: TMaskEdit;
    me_day230: TMaskEdit;
    me_day229: TMaskEdit;
    me_day202: TMaskEdit;
    me_day228: TMaskEdit;
    me_day227: TMaskEdit;
    me_day226: TMaskEdit;
    me_day225: TMaskEdit;
    me_day224: TMaskEdit;
    me_day223: TMaskEdit;
    me_day222: TMaskEdit;
    me_day221: TMaskEdit;
    me_day220: TMaskEdit;
    me_day219: TMaskEdit;
    me_day201: TMaskEdit;
    me_day218: TMaskEdit;
    me_day217: TMaskEdit;
    me_day216: TMaskEdit;
    me_day215: TMaskEdit;
    me_day214: TMaskEdit;
    me_day213: TMaskEdit;
    me_day212: TMaskEdit;
    me_day211: TMaskEdit;
    me_day210: TMaskEdit;
    me_day209: TMaskEdit;
    dbg_seg3: TTntDBGrid;
    TntGroupBox9: TTntGroupBox;
    bbtn_Save: TTntBitBtn;
    bbtn_Close2: TTntBitBtn;
    TntGroupBox6: TTntGroupBox;
    clb_Emp: TTntCheckListBox;
    TntPanel3: TTntPanel;
    sb_All: TTntSpeedButton;
    sb_NotAll: TTntSpeedButton;
    TntTabSheet3: TTntTabSheet;
    TntPanel6: TTntPanel;
    TntGroupBox10: TTntGroupBox;
    TntLabel4: TTntLabel;
    cob_DeptBeg3: TTntComboBox;
    cob_DeptEnd3: TTntComboBox;
    TntBitBtn1: TTntBitBtn;
    TntGroupBox11: TTntGroupBox;
    TntSpeedButton1: TTntSpeedButton;
    TntSpeedButton2: TTntSpeedButton;
    TntDBGrid1: TTntDBGrid;
    TntGroupBox12: TTntGroupBox;
    cb_SetWork: TTntCheckBox;
    MaskEdit1: TMaskEdit;
    cb_SetHol: TTntCheckBox;
    MaskEdit2: TMaskEdit;
    rb_single: TTntRadioButton;
    rb_all: TTntRadioButton;
    TntBitBtn5: TTntBitBtn;
    TntBitBtn6: TTntBitBtn;
    TntBitBtn2: TTntBitBtn;
    TntBitBtn4: TTntBitBtn;
    TntPanel1: TTntPanel;
    PanelFlow: TTntPanel;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    dbg_seg2: TTntDBGrid;
    TntPanel5: TTntPanel;
    bbtn_SegClose: TTntBitBtn;
    bbtn_SegOK: TTntBitBtn;
    qry_emp1: TADOQuery;
    ds_emp1: TDataSource;
    dst_tms1: TADODataSet;
    qry_CurSeg: TADOQuery;
    ds_CurSeg: TDataSource;
    ds_Seg: TDataSource;
    cds_Seg: TClientDataSet;
    cds_Segflag: TBooleanField;
    cds_Segseg_code: TStringField;
    cds_Segclas_code: TStringField;
    cds_Segclas_chs: TWideStringField;
    cds_Segs_start: TStringField;
    cds_Segstart_b: TStringField;
    cds_Segstart_e: TStringField;
    cds_Segs_end: TStringField;
    cds_Segend_b: TStringField;
    cds_Segend_e: TStringField;
    qry_DeptTpl: TADOQuery;
    ds_DeptTpl: TDataSource;
    Timer1: TTimer;
    qry_seg: TADOQuery;
    qry_segupd_user: TStringField;
    qry_segseg_code: TStringField;
    qry_segclas_code: TStringField;
    qry_segclas_chs: TWideStringField;
    qry_segs_start: TStringField;
    qry_segstart_b: TStringField;
    qry_segstart_e: TStringField;
    qry_segs_end: TStringField;
    qry_segend_b: TStringField;
    qry_segend_e: TStringField;
    procedure bbtn_Confirm1Click(Sender: TObject);
    procedure bbtn_Reset1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
   procedure InitLangInfo;
   procedure EnableControl1(Value:Boolean);

    procedure sb_ChoseEmp1Click(Sender: TObject);
    procedure cob_DeptBeg1Change(Sender: TObject);
    procedure bbtn_CloseClick(Sender: TObject);
    procedure bbtn_SegOKClick(Sender: TObject);
    procedure bbtn_SegCloseClick(Sender: TObject);
    procedure bbtn_Confirm2Click(Sender: TObject);
    procedure GetTmsEmp;
    procedure SetEnableControl(Value:Boolean);
    procedure bbtn_Reset2Click(Sender: TObject);
    procedure bbtn_SaveClick(Sender: TObject);
    procedure bbtn_Close2Click(Sender: TObject);
    procedure sb_AllClick(Sender: TObject);
    procedure sb_NotAllClick(Sender: TObject);
    procedure cb_WorkDayClick(Sender: TObject);
      procedure SetSegCode(MaskEditName:String);
    procedure cb_weekworkClick(Sender: TObject);
    procedure cb_SundayClick(Sender: TObject);
    procedure cb_weekSundayClick(Sender: TObject);
    procedure bbtn_SetClick(Sender: TObject);
    procedure bbtn_setwClick(Sender: TObject);
    procedure me_WorkDayChange(Sender: TObject);
    procedure me_WorkDayClick(Sender: TObject);
    procedure me_WorkDayEnter(Sender: TObject);
    procedure me_day101Change(Sender: TObject);
    procedure me_day101Click(Sender: TObject);
    procedure me_day101Enter(Sender: TObject);
    procedure me_day201KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure me_day206DblClick(Sender: TObject);
    procedure dbg_seg3TitleClick(Column: TColumn);
    Procedure SortMaskAndLabel(cat:string);
    procedure DaySegDetail(CurDay:Integer;NowText:String;IsSelect:boolean=true);
    procedure rb_ByDept2Click(Sender: TObject);
    procedure cob_DeptBeg2Change(Sender: TObject);
    procedure rb_ByEmp2Click(Sender: TObject);
    procedure sb_ChoseEmp2Click(Sender: TObject);
    procedure me_Month1Change(Sender: TObject);
    procedure me_Month2Change(Sender: TObject);
    procedure TntRadioButton1Click(Sender: TObject);
    procedure rb_ByEmp1Click(Sender: TObject);
    procedure clb_EmpClick(Sender: TObject);
     function GetInDt(empid:string):TDatetime;
    function GetArrange(empid:string;dt:integer):string;
    procedure dbg_emp1CellClick(Column: TColumn);
    procedure dbg_seg2CellClick(Column: TColumn);
    procedure dbg_seg2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbg_seg2TitleClick(Column: TColumn);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FormFhrd204: TFormFhrd204;
   ws_Words:TWideStrings;
  RunThread :TRunThread;
  WhichLine:integer;
  dept:string;

implementation

uses UnitDMHrdsys,UnitHrdUtils;

{$R *.dfm}
{===============================================================================
  多語言語言初始化
===============================================================================}
procedure TFormFhrd204.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  SetComponentLang(self);//set component language text
  ThisFormUsedWords:= 'dut01_error1,dut01_error2,msg_slt_query_conidition,save_fail,'+
    'save_success,not_find_data,msg_month_data_locked,';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
end;
procedure TFormFhrd204.bbtn_Confirm1Click(Sender: TObject);
var
  aSQL:String;
  MonthSDate:TDateTime;
begin
  MonthSDate:=EncodeDate(StrToInt(LeftStr(me_Month1.Text,4)),StrToInt(RightStr(me_Month1.Text,2)),1);
  if rb_ByEmp1.Checked then
 // with DMhrdsys.sqlquery2 do
 // begin
 //   sql.clear;

  //  sql.add('select * from hrd_emp where emp_id='''+EditEmp1.Text+''' and '+UserDeptStr);
  //  open;
  //  if eof then
  //  begin
   //   wideshowmessage('你無權操作該工號！');
   //   close;
   //   exit;
   // end;
  //  close;
//  end;
  //查找員工
  aSQL:='SELECT dept_code,emp_id,emp_name FROM fhrd_emp WHERE '
   +' (emp_ledt IS NULL or emp_ledt>='''+FormatDateTime('yyyy/mm/dd',MonthSDate)+''')';
  if rb_ByEmp1.Checked then
     begin
       aSQL:=aSQL+' AND emp_id='''+EditEmp1.Text+'''';
     //  if Checktempuser(username) = false   then
      //    begin
       //     aSQL:=aSQL + ' and not exists( select *from hrd_deny_emp where emp_id=hrd_emp.emp_id ) '
      //    end;
     end
  else if rb_ByDept1.Checked then
  begin
    aSQL:=aSQL+' AND dept_code>='''+LeftStr(cob_DeptBeg1.Text,6)+
      ''' AND dept_code<='''+LeftStr(cob_DeptEnd1.Text,6)+
      ''' AND emp_indt>='''+formatdatetime('yyyy/mm/dd',dtp_beg1.Date)+
      ''' AND emp_indt<='''+formatdatetime('yyyy/mm/dd',dtp_end1.Date)+'''' ;
   // if Checktempuser(username) = false   then
   //     begin
   //       aSQL:=aSQL + ' and not exists( select *from hrd_deny_emp where emp_id=hrd_emp.emp_id ) '  ;
   //     end;
  end    
  else begin
    WideShowMessage(GetLangName(ws_Words,'msg_slt_query_conidition')); //
    abort;
  end;
  //從表
  with dst_tms1 do
  begin
    Close;
    CommandText:='SELECT * FROM fhrd_dut_tms WHERE tms_mon='''+me_Month1.Text+'''';
    Open;
  end;
  //主表
  with qry_Emp1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
  end;
  if qry_Emp1.Eof then
  begin
    WideShowMessage(GetLangName(ws_Words,'not_find_data'));
    abort;
  end;
  //按鈕狀態
  EnableControl1(false);
end;

procedure TFormFhrd204.bbtn_Reset1Click(Sender: TObject);
var
  i:Integer;
begin
  //重置按鈕狀態
  EnableControl1(true);
  //關閉員工
  qry_Emp1.Close;
  //清空排班明細
  for i:=1 to 31 do
  begin
    TMaskEdit(FindComponent('me_day1'+Format('%.2d',[i]))).Text:='';
  end;
  //關閉時段明細
  qry_CurSeg.Close;
end;

procedure TFormFhrd204.FormCreate(Sender: TObject);
var
  DeptAbbr,sql_str:string;
begin
  InitLangInfo;
  if UserLang='C' then
    DeptAbbr:='abbr_titl'
  else if UserLang='V' then
    DeptAbbr:='vim_titl'
  else
    DeptAbbr:='eng_titl';
  {初始化查詢月份}
  me_Month1.Text:=IntToStr(YearOf(date))+Format('%.2d',[MonthOf(date)]);
  me_Month2.Text:=IntToStr(YearOf(date))+Format('%.2d',[MonthOf(date)]);
  {初始化部門下拉菜單}
  {
  SetComboxList('select dept_code+''-''+'+DeptAbbr+',dept_code from hrd_dept',cob_DeptBeg1);
  SetComboxList('select dept_code+''-''+'+DeptAbbr+',dept_code from hrd_dept',cob_DeptEnd1);
  SetComboxList('select dept_code+''-''+'+DeptAbbr+',dept_code from hrd_dept',cob_DeptBeg2);
  SetComboxList('select dept_code+''-''+'+DeptAbbr+',dept_code from hrd_dept',cob_DeptEnd2);
  SetComboxList('select dept_code+''-''+'+DeptAbbr+',dept_code from hrd_dept',cob_DeptBeg3);
  SetComboxList('select dept_code+''-''+'+DeptAbbr+',dept_code from hrd_dept',cob_DeptEnd3);
  }
  GetDeptRange(cob_DeptBeg1);
  GetDeptRange(cob_DeptEnd1);
  GetDeptRange(cob_DeptBeg2);
  GetDeptRange(cob_DeptEnd2);
  GetDeptRange(cob_DeptBeg3);
  GetDeptRange(cob_DeptEnd3);
  //初始化浮動窗口
  sql_str:='select a.*,b.* from hrd_dut_seg a,hrd_dut_class b where '
    +'a.clas_code=b.clas_code and b.clas_code in (''16'',''60'',''61'',''62'',''63'')';
  with DMHrdsys.SQLQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sql_str);
    Open;
    qry_seg.close;
    qry_seg.Open;
    while not EOF do
    begin
      qry_Seg.AppendRecord(['0',FieldByName('seg_code').AsString,FieldByName('clas_code').AsString,FieldByName('clas_chs').AsString,
        FieldByName('s_start').AsString,FieldByName('start_b').AsString,FieldByName('start_e').AsString,
        FieldByName('s_end').AsString,FieldByName('end_b').AsString,FieldByName('end_e').AsString]);
      {cds_Seg.AppendRecord([false,FieldByName('seg_code').AsString,FieldByName('clas_code').AsString,FieldByName('clas_chs').AsString,
        FieldByName('s_start').AsString,FieldByName('start_b').AsString,FieldByName('start_e').AsString,
        FieldByName('s_end').AsString,FieldByName('end_b').AsString,FieldByName('end_e').AsString]);}
      Next;
    end;
    Close;
    qry_Seg.first;
    //cds_Seg.First;
  end;
  dtp_begin.Date:=encodedate(2000,1,1);
  dtp_end.Date:=DateOf(getserverdatetime);
  dtp_beg1.Date:=encodedate(2000,1,1);
  dtp_end1.Date:=DateOf(getserverdatetime);

end;
{設置查詢確定后組件狀態}
procedure TFormFhrd204.EnableControl1(Value:Boolean);
begin
  me_Month1.Enabled:=Value;
  rb_ByEmp1.Enabled:=Value;
  rb_ByDept1.Enabled:=Value;
  EditEmp1.Enabled:=Value;
  sb_ChoseEmp1.Enabled:=Value;
  cob_DeptBeg1.Enabled:=Value;
  cob_DeptEnd1.Enabled:=Value;
  dtp_beg1.Enabled:=Value;
  dtp_end1.Enabled:=Value;
  bbtn_Confirm1.Enabled:=Value;
  bbtn_Reset1.Enabled:=not Value;
end;
{===============================================================================
  線程運行
===============================================================================}
procedure TRunThread.execute;
var
  Formfhrd204:TFormfhrd204;
  i,j,MaxDay:Integer;
  aSQL,EmpId:String;
  IsDel:Boolean;
  ServerDateTime:TDateTime;
begin
  ServerDateTime:=GetServerDateTime;
  FreeOnTerminate := true;
  Formfhrd204:=TFormfhrd204(Application.FindComponent('Formfhrd204'));
  IsDel:=True;
  MaxDay:=DaysInaMonth(StrToInt(LeftStr(Formfhrd204.me_Month2.Text,4)),StrToInt(MidStr(Formfhrd204.me_Month2.Text,5,2)));
  for i:=1 to MaxDay do
  begin
    if Trim(TMaskEdit(Formfhrd204.FindComponent('me_Day2'+Format('%.2d',[i]))).Text)<>'' then
    begin
      IsDel:=False;
      break;
    end;
  end;
  SetProcessBar(true,1,Formfhrd204.clb_Emp.Count);
  DMHrdsys.conn.BeginTrans;
  for i:=0 to Formfhrd204.clb_Emp.Items.Count-1 do
  begin
    if RunThread.Terminated then
    begin
      DMHrdsys.conn.RollbackTrans;
      SetStatusText(GetLangName(ws_Words,'save_fail'));
      SetProcessBar(true);
      exit;
    end;
    SetProcessBar(false,1);
    SetStatusText(widestring('當前')+inttostr(i+1)+'/'+inttostr(Formfhrd204.clb_Emp.Count)+widestring('筆'));
    EmpId:=LeftStr(Formfhrd204.clb_Emp.Items[i],6);
    {處理資料，現刪除，再新增，排班所有日期都為空視為刪除，不再新增}
    if Formfhrd204.clb_Emp.Checked[i] then
    begin
      {刪除排班資料}
      with DMHrdsys.ADOCommand1 do
      begin
        CommandText:='DELETE FROM fhrd_dut_tms WHERE emp_id='''+EmpId+''''+
          ' AND tms_mon='''+Formfhrd204.me_Month2.Text+'''';
        try
          Execute;
        except
          DMHrdsys.conn.RollbackTrans;
          SetStatusText(GetLangName(ws_Words,'save_fail'));
          SetProcessBar(true);
        end;
      end;
      if not IsDel then
      begin
        {新增排班資料}
        with DMHrdsys.ADOCommand1 do
        begin
           aSQL:='insert into fhrd_dut_tms values ('''+UserName+''','''+FormatDateTime('yyyy/mm/dd hh:nn:ss',ServerDateTime)+''','''+
             EmpId+''','''+Formfhrd204.me_Month2.Text+''',';
           for j:=1 to 30 do
             aSQL:=aSQL+''''+TMaskEdit(Formfhrd204.FindComponent('me_Day2'+Format('%.2d',[j]))).Text+''',';
           aSQL:=aSQL+''''+Formfhrd204.me_day231.Text+''')';
           CommandText:=aSQL;
           try
             Execute;
           except
             DMHrdsys.conn.RollbackTrans;
             SetStatusText(GetLangName(ws_Words,'save_fail'));
             SetProcessBar(true);
           end;
        end;
      end;
    end;
  end;
  DMHrdsys.conn.CommitTrans;
  SetProcessBar(true);
  SetStatusText('');
  formfhrd204.Timer1.Enabled:=true;
  //WideMessageDlg(GetLangName(ws_Words,'save_success'),mtInformation,[mbYes],0);
  //WideShowmessage(GetLangName(ws_Words,'save_success'));

end;
procedure TFormFhrd204.sb_ChoseEmp1Click(Sender: TObject);
var
  aEmpId:String;
begin
  aEmpId:=FindEmpId('emp_id',me_Month1.Text);
  if aEmpId<>'' then
    EditEmp1.Text:=aEmpId;
end;
procedure TFormFhrd204.cob_DeptBeg1Change(Sender: TObject);
begin
  SetComboxIndex(cob_DeptEnd1,LeftStr(cob_DeptBeg1.Text,6));
end;


procedure TFormFhrd204.bbtn_CloseClick(Sender: TObject);
begin
    TForm(TntPanel1.Parent).Close;
end;

procedure TFormFhrd204.bbtn_SegOKClick(Sender: TObject);
var
  SegStr:String;
begin
  PanelFlow.Visible:=false;
  SegStr:='';
  qry_Seg.First;
  //cds_Seg.First;
  {while not cds_Seg.Eof do
  begin
    if cds_Seg.FieldByName('flag').AsBoolean then
      SegStr:=SegStr+cds_Seg.FieldValues['seg_code'];
    cds_Seg.Next;
  end; }
  while not qry_Seg.Eof do
  begin
    if qry_Seg.FieldByName('flag').AsString='1' then
      SegStr:=SegStr+qry_Seg.FieldValues['seg_code'];
    qry_Seg.Next;
  end;
  TMaskEdit(FindComponent(PanelFlow.Hint)).Text:=LeftStr(SegStr,8);
end;

procedure TFormFhrd204.bbtn_SegCloseClick(Sender: TObject);
begin
   PanelFlow.Visible:=false;
end;

procedure TFormFhrd204.bbtn_Confirm2Click(Sender: TObject);
var
  AMonth:string;
begin
  //該月資料已經鎖定
 // if (me_Month2.Text<=LockMonthPart) and (UserName<>DebugUser) then
//  begin
 //   WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
 //   exit;
 // end;
  if rb_byemp2.Checked then
  with DMhrdsys.sqlquery2 do
  begin
    sql.clear;
  //  if Checktempuser(username)  = false  then
   //    sql.add('select * from fhrd_emp where emp_id='''+EditEmp2.Text+''' and '+UserDeptStr + ' and not exists( select *from hrd_deny_emp where emp_id=hrd_emp.emp_id ) ' )
  //  else
    sql.add('select * from fhrd_emp where emp_id='''+EditEmp2.Text+''' and '+UserDeptStr);
    open;
    if eof then
    begin
      wideshowmessage('你無權操作該工號！');
      close;
      exit;
    end;
    close;
  end;
  GetTmsEmp;
  SetEnableControl(true);
  SetStatustext('合計人數:'+IntToStr(clb_Emp.Items.Count));
end;
procedure TFormfhrd204.GetTmsEmp;
//得到排班員工
var
  aSQL:String;
begin
  if Checktempuser( username)  then
     begin
       if rb_ByEmp2.Checked then
          aSQL:='SELECT emp_id,emp_name FROM fhrd_emp WHERE emp_ledt IS  NULL AND emp_id='''+ EditEmp2.Text+''''
       else if rb_ByDept2.Checked then
          begin
            aSQL:='SELECT emp_id,emp_name FROM fhrd_emp WHERE emp_ledt IS  NULL AND dept_code>='''+LeftStr(cob_DeptBeg2.Text,6)+
                  ''' AND dept_code <='''+LeftStr(cob_DeptEnd2.Text,6)+
                  ''' AND emp_gvdt>='''+formatdatetime('yyyy/mm/dd',dtp_begin.Date)+
                  ''' AND emp_gvdt<='''+formatdatetime('yyyy/mm/dd',dtp_end.Date)+
                  ''' ORDER BY emp_id'
           end
       else begin
            WideShowMessage(GetLangName(ws_Words,'msg_slt_query_conidition')); //
            abort;
            end;
     end
 else
   begin
       if rb_ByEmp2.Checked then
          aSQL:='SELECT emp_id,emp_name FROM fhrd_emp WHERE emp_ledt IS  NULL AND emp_id='''+ EditEmp2.Text+''' and not exists( select *from hrd_deny_emp where hrd_emp.emp_id=emp_id ) '
       else if rb_ByDept2.Checked then
          begin
            aSQL:='SELECT emp_id,emp_name FROM fhrd_emp WHERE emp_ledt IS  NULL AND dept_code>='''+LeftStr(cob_DeptBeg2.Text,6)+
                  ''' AND dept_code <='''+LeftStr(cob_DeptEnd2.Text,6)+
                  ''' AND emp_gvdt>='''+formatdatetime('yyyy/mm/dd',dtp_begin.Date)+
                  ''' AND emp_gvdt<='''+formatdatetime('yyyy/mm/dd',dtp_end.Date)+
                  '''   ) ORDER BY emp_id'
           end 
        else begin
            WideShowMessage(GetLangName(ws_Words,'msg_slt_query_conidition')); //
            abort;
            end;    

  end;

  with DMHrdsys.SQLQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    if EOF then
    begin
      //WideMessageDlg('該範圍內沒有員工存在！',mtError,[mbYes],0);
      WideMessageDlg(GetLangName(ws_Words,'not_find_data'),mtError,[mbYes],0);
      abort;
    end;
    clb_Emp.Clear;
    while not EOF do
    begin
      clb_Emp.Items.Add(FieldByName('emp_id').Value+' -- '+FieldByName('emp_name').Value);
      Next;
    end;
  end;
end;
procedure TFormfhrd204.SetEnableControl(Value:Boolean);
var
  i:Integer;
begin
  //
  me_Month2.Enabled:=not Value;
  rb_ByEmp2.Enabled:=not Value;
  rb_ByDept2.Enabled:=not Value;
  EditEmp2.Enabled:=not Value;

  cob_DeptBeg2.Enabled:=not Value;
  cob_DeptEnd2.Enabled:=not Value;
  dtp_begin.Enabled:=not Value;
  dtp_end.Enabled:=not Value;

  sb_ChoseEmp2.Enabled:=not Value;
  bbtn_Confirm2.Enabled:=not Value;
  bbtn_Reset2.Enabled:=Value;
  clb_Emp.Enabled:=Value;

  cb_WorkDay.Enabled:=Value;
  cb_Sunday.Enabled:=Value;
  me_WorkDay.Enabled:=Value;
  me_SunDay.Enabled:=Value;
  sb_WorkDay.Enabled:=Value;
  sb_Sunday.Enabled:=Value;

  cb_weekWork.Enabled:=Value;
  cb_weekSunday.Enabled:=Value;
  me_weekWork.Enabled:=Value;
  me_weekSunDay.Enabled:=Value;
  sb_weekWork.Enabled:=Value;
  sb_weekSunday.Enabled:=Value;

  sb_All.Enabled:=Value;
  sb_NotAll.Enabled:=Value;
  bbtn_Set.Enabled:=Value;
  bbtn_Setw.Enabled:=Value;
  bbtn_Save.Enabled:=Value;
  bbtn_Close2.Enabled:=Value;
  for i:=1 to 31 do
    TMaskEdit(FindComponent('me_Day2'+Format('%.2d',[i]))).Enabled:=Value;
end;
procedure TFormFhrd204.bbtn_Reset2Click(Sender: TObject);
var
  i:Integer;
begin
  SetEnableControl(false);
  clb_Emp.Clear;
  for i:=1 to 31 do
    TMaskEdit(FindComponent('me_Day2'+Format('%.2d',[i]))).Text:='';
  SetStatustext('');
end;

procedure TFormFhrd204.bbtn_SaveClick(Sender: TObject);
begin
   {新開線程}
  RunThread := TRunThread.Create(false);
end;

procedure TFormFhrd204.bbtn_Close2Click(Sender: TObject);
begin
   if not RunThread.Terminated then
  RunThread.Terminate;
end;

procedure TFormFhrd204.sb_AllClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to clb_Emp.Items.Count-1 do
  begin
    clb_Emp.Checked[i]:=true;
  end;
end;

procedure TFormFhrd204.sb_NotAllClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to clb_Emp.Items.Count-1 do
  begin
    clb_Emp.Checked[i]:=false;
  end;
end;

procedure TFormFhrd204.cb_WorkDayClick(Sender: TObject);
begin
  if cb_WorkDay.Checked then
  begin
    if G_sFactory='F' then
      me_WorkDay.Text:='0102' //Mizuno
    else
      me_WorkDay.Text:='A1A2'; //Adidas
  end
  else
    me_WorkDay.Text:='';
end;

procedure TFormFhrd204.cb_weekworkClick(Sender: TObject);
begin
  if cb_weekWork.Checked then
  begin
    //me_Weekwork.Text:='0102'
    if G_sFactory='F' then
      me_Weekwork.Text:='0102' //Mizuno
    else
      me_Weekwork.Text:='A1A2'; //Adidas
  end
  else
    me_Weekwork.Text:='';
end;

procedure TFormFhrd204.cb_SundayClick(Sender: TObject);
begin
  if cb_SunDay.Checked then
    me_SunDay.Text:='90'
  else
    me_SunDay.Text:='';
end;

procedure TFormFhrd204.cb_weekSundayClick(Sender: TObject);
begin
  if cb_weekSunDay.Checked then
    me_weekSunDay.Text:='90'
  else
    me_weekSunDay.Text:='';
end;
procedure TFormFhrd204.bbtn_SetClick(Sender: TObject);
var
  i:Integer;
  aDay:TDateTime;
begin
  for i:=1 to 31 do
  begin
    if TryEnCodeDate(StrToInt(LeftStr(me_Month2.Text,4)),StrToInt(MidStr(me_Month2.Text,5,2)),i,aDay) then
      if (DayOfWeek(aDay)=1) and (cb_Sunday.Checked) then
        TMaskEdit(FindComponent('me_Day2'+Format('%.2d',[i]))).Text:=me_Sunday.Text
      else if (DayOfWeek(aDay)<>1) and (cb_WorkDay.Checked) then
        TMaskEdit(FindComponent('me_Day2'+Format('%.2d',[i]))).Text:=me_WorkDay.Text;
  end;
end;

procedure TFormFhrd204.bbtn_setwClick(Sender: TObject);
var
  i,y,m,select,day,startday,endday:Integer;
  aDay:TDateTime;
  Acomponent:TComponent;
begin
  for i:=1 to 7 do
  begin
    Acomponent:=nil;
    Acomponent:= findcomponent('rb_'+inttostr(i));
    if Acomponent<>nil then
    begin
      if TtntRadioButton(Acomponent).Checked then
      begin
        select:=i;
        break;
      end;
    end;
  end;
  y:=strtoint(me_month2.text) div 100;
  m:=strtoint(me_month2.text) mod 100;
  day:=dayOfWeek(EncodeDate(y,m,1));
  startday:=2+(select-1)*7-day;
  if startday<1 then
    startday:=1;
  endday:=(select)*7-day+1;
  if endday>daysInAmonth(y,m) then
    endday:=daysInAmonth(y,m);
  for i:=startday to endday do
  begin
    if TryEnCodeDate(y,m,i,aDay) then
      if (DayOfWeek(aDay)=1) and (cb_weekSunday.Checked) then
        TMaskEdit(FindComponent('me_Day2'+Format('%.2d',[i]))).Text:=me_weekSunday.Text
      else if (DayOfWeek(aDay)<>1) and (cb_weekWork.Checked) then
        TMaskEdit(FindComponent('me_Day2'+Format('%.2d',[i]))).Text:=me_weekWork.Text;
  end;
end;
procedure TFormFhrd204.me_WorkDayChange(Sender: TObject);
var
  IsSelect:boolean;
begin
  if not TMaskEdit(Sender).Focused then
    exit
  else
  begin
    if midstr(TMaskEdit(Sender).Name,7,1)='2' then
      IsSelect:=false
    else
      IsSelect:=true;
    DaySegDetail(TMaskEdit(Sender).Tag,trim(TMaskEdit(Sender).Text),IsSelect);
  end;
end;

procedure TFormFhrd204.me_WorkDayClick(Sender: TObject);
begin
  TMaskEdit(Sender).SelectAll;
end;

procedure TFormFhrd204.me_WorkDayEnter(Sender: TObject);
var
  IsSelect:boolean;
begin
  if midstr(TMaskEdit(Sender).Name,7,1)='2' then
    IsSelect:=false
  else
    IsSelect:=true;
  DaySegDetail(TMaskEdit(Sender).Tag,trim(TMaskEdit(Sender).Text),IsSelect);
end;

procedure TFormFhrd204.me_day101Change(Sender: TObject);
var
  IsSelect:boolean;
begin
  if not TMaskEdit(Sender).Focused then
    exit
  else
  begin
    if midstr(TMaskEdit(Sender).Name,7,1)='2' then
      IsSelect:=false
    else
      IsSelect:=true;
    DaySegDetail(TMaskEdit(Sender).Tag,trim(TMaskEdit(Sender).Text),IsSelect);
  end;
end;

procedure TFormFhrd204.me_day101Click(Sender: TObject);
begin
  TMaskEdit(Sender).SelectAll;
end;

procedure TFormFhrd204.me_day101Enter(Sender: TObject);
var
  IsSelect:boolean;
begin
  if midstr(TMaskEdit(Sender).Name,7,1)='2' then
    IsSelect:=false
  else
    IsSelect:=true;
  DaySegDetail(TMaskEdit(Sender).Tag,trim(TMaskEdit(Sender).Text),IsSelect);
end;

procedure TFormFhrd204.me_day201KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then// key_enter
    self.FindNextControl(TwinControl(Sender),true,true,false).SetFocus;
  if (Sender.ClassType = TtntcomboBox) or (Sender.ClassType =TTntDatetimePicker) then
    exit;//while key up and down on comboBox or DatetimePicker,not continue;
  if (key=40) then//key_down
    self.FindNextControl(TwinControl(Sender),true,true,false).SetFocus;
  if (key=38) and (TwinControl(Sender).TabOrder>0) then//key_up
    self.FindNextControl(TwinControl(Sender),false,true,false).SetFocus;
end;

procedure TFormFhrd204.me_day206DblClick(Sender: TObject);
begin
   SetSegCode(TMaskEdit(Sender).Name);
end;

procedure TFormFhrd204.dbg_seg3TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;
{==============================================================================
  過程名稱: DaySegDetail;
  過程功能: 顯示當前日期時段詳細內容
===============================================================================}
procedure TFormFhrd204.DaySegDetail(CurDay:Integer;NowText:String;IsSelect:boolean=true);
var
  aSQL,ClassName:String;
begin
  if UserLang='C' then
    ClassName:='clas_chs'
  else if UserLang='V' then
    ClassName:='clas_vim'
  else
    ClassName:='clas_eng';
  aSQL:='select '''+IntToStr(CurDay)+''' as now_day,a.clas_code,b.'+ClassName+' as clas_name,'+
    'a.s_start,a.start_b,a.start_e,a.s_end,a.end_b,a.end_e from hrd_dut_seg as a,hrd_dut_class as b where seg_code in('''+
    MidStr(NowText,1,2)+''','''+MidStr(NowText,3,2)+''','''+
    MidStr(NowText,5,2)+''','''+MidStr(NowText,7,2)+''') and a.clas_code=b.clas_code';
  qry_CurSeg.SQL.Clear;
  qry_CurSeg.SQL.Add(aSQL);
  qry_CurSeg.Open;
  if qry_CurSeg.Eof then
    qry_CurSeg.Close;
  if IsSelect then
  begin
    dbg_seg1.DataSource:=ds_CurSeg;
    dbg_seg3.DataSource:=nil;
  end
  else
  begin
    dbg_seg1.DataSource:=nil;
    dbg_seg3.DataSource:=ds_CurSeg;
  end;
end;
{設置Seg選擇面板}
procedure TFormfhrd204.SetSegCode(MaskEditName:String);
begin
  //cds_Seg.First;
  qry_seg.First;
 // while not cds_Seg.Eof do
  while not qry_Seg.Eof do
  begin
    {cds_Seg.Edit;
    cds_Seg.FieldByName('flag').AsBoolean:=false;
    cds_Seg.Post;
    cds_Seg.Next;}
    qry_Seg.Edit;
    qry_Seg.FieldByName('flag').AsBoolean:=false;
    qry_Seg.Post;
    qry_Seg.Next;
  end;
  qry_seg.First;
  //cds_Seg.First;
  PanelFlow.Left:=180;
  PanelFlow.Top:=136;
  PanelFlow.Hint:=MaskEditName;
  PanelFlow.Visible:=true;
end;
procedure TFormFhrd204.rb_ByDept2Click(Sender: TObject);
begin
   EditEmp2.Enabled:=false;
  sb_ChoseEmp2.Enabled:=false;
  cob_DeptBeg2.Enabled:=true;
  cob_DeptEnd2.Enabled:=true;
  dtp_begin.Enabled:=true;
  dtp_end.Enabled:=true;
end;

procedure TFormFhrd204.cob_DeptBeg2Change(Sender: TObject);
begin
   SetComboxIndex(cob_DeptEnd2,LeftStr(cob_DeptBeg2.Text,6));
end;

procedure TFormFhrd204.rb_ByEmp2Click(Sender: TObject);
begin
    EditEmp2.Enabled:=true;
  sb_ChoseEmp2.Enabled:=true;
  cob_DeptBeg2.Enabled:=false;
  cob_DeptEnd2.Enabled:=false;
  dtp_begin.Enabled:=false;
  dtp_end.Enabled:=false;
end;

procedure TFormFhrd204.sb_ChoseEmp2Click(Sender: TObject);
var
  aEmpId:String;
begin
  aEmpId:=FindEmpId('emp_id',me_Month2.Text);
  if aEmpId<>'' then
    EditEmp2.Text:=aEmpId;
end;

procedure TFormFhrd204.me_Month1Change(Sender: TObject);
var
  aDay:TDateTime;
  i:Integer;
begin
  {檢查輸入}
  if Length(TMaskEdit(Sender).Text)<>6 then exit;
  if Length(TMaskEdit(Sender).Text)=6 then
  begin
    if not TryEnCodeDate(StrToInt(LeftStr(TMaskEdit(Sender).Text,4)),StrToInt(MidStr(TMaskEdit(Sender).Text,5,2)),1,aDay) then
    begin
      //WideMessageDlg('您輸入的月份有誤，請重輸！',mtError,[mbYes],0);
      WideMessageDlg(GetLangName(ws_Words,'dut01_error1'),mtError,[mbYes],0);
      abort;
    end;
  end;
  for i:=1 to 31 do
  begin
    TTntLabel(FindComponent('lbl_Day1'+Format('%.2d',[i]))).Color:=clBtnFace;
    {是否為合法日期}
    if TryEnCodeDate(StrToInt(LeftStr(me_Month1.Text,4)),StrToInt(MidStr(me_Month1.Text,5,2)),i,aDay) then
    begin
      TTntLabel(FindComponent('lbl_Day1'+Format('%.2d',[i]))).Visible:=true;
      TMaskEdit(FindComponent('me_Day1'+Format('%.2d',[i]))).Visible:=true;
      if DayOfWeek(aDay)=1 then
        TTntLabel(FindComponent('lbl_Day1'+Format('%.2d',[i]))).Color:=clRed;
    end
    else begin
      TTntLabel(FindComponent('lbl_Day1'+Format('%.2d',[i]))).Visible:=false;
      TMaskEdit(FindComponent('me_Day1'+Format('%.2d',[i]))).Visible:=false;
    end;
  end;
  SortMaskAndLabel('1');
end;

procedure TFormFhrd204.me_Month2Change(Sender: TObject);

  var
  aDay:TDateTime;
  i:Integer;
begin
  {檢查輸入}
  if Length(TMaskEdit(Sender).Text)<>6 then exit;
  if Length(TMaskEdit(Sender).Text)=6 then
  begin
    if not TryEnCodeDate(StrToInt(LeftStr(TMaskEdit(Sender).Text,4)),StrToInt(MidStr(TMaskEdit(Sender).Text,5,2)),1,aDay) then
    begin
      //WideMessageDlg('您輸入的月份有誤，請重輸！',mtError,[mbYes],0);
      WideMessageDlg(GetLangName(ws_Words,'dut01_error1'),mtError,[mbYes],0);
      abort;
    end;
  end;
  for i:=1 to 31 do
  begin
    TTntLabel(FindComponent('lbl_Day2'+Format('%.2d',[i]))).Color:=clBtnFace;
    {是否為合法日期}
    if TryEnCodeDate(StrToInt(LeftStr(me_Month2.Text,4)),StrToInt(MidStr(me_Month2.Text,5,2)),i,aDay) then
    begin
      TTntLabel(FindComponent('lbl_Day2'+Format('%.2d',[i]))).Visible:=true;
      TMaskEdit(FindComponent('me_Day2'+Format('%.2d',[i]))).Visible:=true;
      {星期天判斷}
      if DayOfWeek(aDay)=1 then
      begin
        TTntLabel(FindComponent('lbl_Day2'+Format('%.2d',[i]))).Color:=clRed;
      end;
    end
    else begin
      TTntLabel(FindComponent('lbl_Day2'+Format('%.2d',[i]))).Visible:=false;
      TMaskEdit(FindComponent('me_Day2'+Format('%.2d',[i]))).Visible:=false;
    end;
  end;
  SortMaskAndLabel('2');
end;

Procedure TFormfhrd204.SortMaskAndLabel(cat:string);
var
  y,m,day,i,j,pos:integer;
  ADate:TDate;
  tmprb:TtntRadioButton;
  months:string;
begin
  if cat='2' then
  begin
    months:=me_month2.text;
    pos:=41;
  end
  else
  begin
    months:=me_month1.text;
    pos:=4;
  end;
  try
    y:=strtoint(months) div 100;
    m:=strtoint(months) mod 100;
  except
    ADate:=GetServerDateTime;
    y:=yearof(ADate);
    m:=monthof(ADate);
  end;
  day:=dayOfWeek(EncodeDate(y,m,1));
  j:=0;
  //for i:=1 to 6 do
  //begin
    if cat='2' then
    begin
      if findcomponent('rb_1')<>nil then
        findcomponent('rb_1').Free;
      tmprb:=TtntRadiobutton.Create(self);
      tmprb.Parent:=TntGroupbox8;
      tmprb.Name:='rb_1';
      tmprb.Caption:='';
      tmprb.Width:=17;
      tmprb.Height:=17;
      tmprb.Left:=17;
      tmprb.Top:=20;
      tmprb.onClick:=Tntradiobutton1Click;
    end;
//  end;
  for i:=0 to 30 do
  begin
    TtntLabel(findcomponent('lbl_day'+cat+Format('%.2d',[i+1]))).Left:=pos+0+((i+day-1) mod 7)*83;
    TtntLabel(findcomponent('lbl_day'+cat+Format('%.2d',[i+1]))).Top:=21+j*21;
    TMaskEdit(findcomponent('me_day'+cat+Format('%.2d',[i+1]))).Left:=pos+17+((i+day-1) mod 7)*83;
    TMaskEdit(findcomponent('me_day'+cat+Format('%.2d',[i+1]))).Top:=16+j*21;
    if ((i+1)<daysInAMonth(y,m)) and (((i+day-1) mod 7)=6) then
    begin
      inc(j);
      if (cat='1') then
        continue;
      if findcomponent('rb_'+inttostr(j+1))<>nil then
        findcomponent('rb_'+inttostr(j+1)).Free;
      tmprb:=TtntRadiobutton.Create(self);
      tmprb.Parent:=TntGroupbox8;
      tmprb.Name:='rb_'+inttostr(j+1);
      tmprb.Caption:='';
      tmprb.Width:=17;
      tmprb.Height:=17;
      tmprb.Left:=17;
      tmprb.Top:=20+21*(j);
      tmprb.OnClick:=Tntradiobutton1Click;
    end;
  end;
  //
end;

procedure TFormfhrd204.Tntradiobutton1Click(Sender: TObject);
begin
  WhichLine:=strtoint(rightstr(Ttntradiobutton(sender).name,1));
end;
procedure TFormFhrd204.rb_ByEmp1Click(Sender: TObject);
begin
   EditEmp1.Enabled:=true;
  sb_ChoseEmp1.Enabled:=true;
  cob_DeptBeg1.Enabled:=false;
  cob_DeptEnd1.Enabled:=false;
  dtp_beg1.Enabled:=false;
  dtp_end1.Enabled:=false;
end;

procedure TFormFhrd204.clb_EmpClick(Sender: TObject);
var
  i:Integer;
  IsHoliday:boolean;
  ADate,epinDt:TDatetime;
  y,m,d:word;
  Arrange,empid:string;
begin
  empid:=leftstr(clb_emp.Items[clb_Emp.ItemIndex],6);
  epinDt:=GetInDt(empid);
  for i:=1 to 31 do
  begin
    y:=strtoint(leftstr(me_month2.Text,4));
    m:=strtoint(rightstr(me_month2.Text,2));
    d:=i;
    if not tryEncodeDate(y,m,d,ADate) then
      exit;
    if epinDt>ADate then
    begin
      TMaskEdit(FindComponent('me_Day2'+Format('%.2d',[i]))).Text:='';
      continue;
    end;
    Arrange:=GetArrange(empid,i);
   // if Arrange='' then
   // begin
     // begin
   //     if DayOfWeek(ADate)=1 then
   //       Isholiday:=true
   //     else
   //       Isholiday:=false;
   //     TMaskEdit(FindComponent('me_Day2'+Format('%.2d',[i]))).Text:=GetArr(dept,IsHoliday);
     // end;
  //  end
  //  else
    TMaskEdit(FindComponent('me_Day2'+Format('%.2d',[i]))).Text:=Arrange;
  end;
  DaySegDetail(1,me_day201.Text,false);
end;
function Tformfhrd204.GetInDt(empid:string):TDatetime;
begin
  with DMHrdSys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from fhrd_emp where emp_id='''+empid+'''');
    Open;
    if not eof then
    begin
      dept:=fieldbyname('dept_code').AsString;
      result:=fieldbyname('emp_gvdt').AsDateTime;
    end
    else
    begin
      dept:='';
      result:=encodedate(2000,1,1);
    end;
  end;
end;

function TFormfhrd204.GetArrange(empid:string;dt:integer):string;
var
  SqlStr:String;
begin
  with DMhrdsys.SQLQuery4 do
  begin
    SqlStr:='select * from fhrd_dut_tms where emp_id='''+empid+''' and tms_mon='''+me_month2.text+''' ';
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if not eof then
      result:=fieldbyname('day'+Format('%.2d',[dt])+'_tms').AsString
    else
      result:='';  
  end;
end;
//2012-10-30 hyt add
procedure TFormFhrd204.dbg_emp1CellClick(Column: TColumn);
var
  i:Integer;
  IsHoliday:boolean;
  ADate,epinDt:TDatetime;
  y,m,d:word;
  Arrange,empid,sSql:string;
begin
  if qry_emp1.Eof then
    exit;

  empid:=qry_emp1.FieldByName('emp_id').AsString ;
  epinDt:=GetInDt(empid);
  for i:=1 to 31 do
  begin
    y:=strtoint(leftstr(me_Month1.Text,4));
    m:=strtoint(rightstr(me_Month1.Text,2));
    d:=i;
    if not tryEncodeDate(y,m,d,ADate) then
      exit;
    if epinDt>ADate then
    begin
      TMaskEdit(FindComponent('me_Day2'+Format('%.2d',[i]))).Text:='';
      continue;
    end;
    sSql:='select '+'day'+Format('%.2d',[i])+'_tms'+' from fhrd_dut_tms '+
          'where emp_id='''+empid+''' and tms_mon='''+me_month1.text+''' ';
    Arrange:=DB_GetSRecord(sSql);
 

    TMaskEdit(FindComponent('me_Day1'+Format('%.2d',[i]))).Text:=Arrange;
  end;
  DaySegDetail(1,me_day101.Text,false);
end;
procedure TFormFhrd204.dbg_seg2CellClick(Column: TColumn);
const
  CtrlState:array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  if Column.Index = 0 then
  begin
    with qry_Seg do
      begin
        edit;
        if FieldByName('flag').AsString='1' then
          FieldByName('flag').AsString:='0'
        else
          Fieldbyname('flag').AsString:='1';
        //FieldByName('flag').asboolean := not FieldByName('flag').asboolean;
        post;
      end;
  end;
end;

procedure TFormFhrd204.dbg_seg2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
  CtrlState:array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  flag:boolean;
begin
  if Column.Index = 0 then
  begin
    if qry_Seg.FieldByName('flag').AsString='1' then
      flag:=true
    else
      flag:=false;  
    //flag:=cds_Seg.FieldByName('flag').AsBoolean;
    DrawFrameControl(dbg_seg2.Canvas.Handle,Rect,DFC_BUTTON,CtrlState[FLAG]);
  end;
end;

procedure TFormFhrd204.dbg_seg2TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

end.
