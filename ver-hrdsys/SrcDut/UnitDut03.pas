unit UnitDut03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,tntDialogs, ExtCtrls,StrUtils, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, TntExtCtrls, TntDBGrids, TntDbCtrls, TntStdCtrls, TntButtons,
  DB, ADODB, DBClient, Provider,DateUtils,WSDLIntf, TntComCtrls, CheckLst,
  TntCheckLst, Menus, TntMenus, ImgList, TntForms,math;

type
  //0: Day 1: Week 2: Month 3: Year
  TAryHours = array[0..3] of Double;
  //
  TformDut03 = class(TForm)
    privilege: TTntPageControl;
    select: TTntTabSheet;
    maintenance: TTntTabSheet;
    TntPanel1: TTntPanel;
    DataSource1: TDataSource;
    TntPanel2: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    CB_DEPT: TTntComboBox;
    bb_search: TTntBitBtn;
    Pmenu1: TTntPopupMenu;
    pmenu2: TTntPopupMenu;
    N1: TTntMenuItem;
    N2: TTntMenuItem;
    N3: TTntMenuItem;
    TntGroupBox4: TTntGroupBox;
    TntLabel3: TTntLabel;
    TntLabel4: TTntLabel;
    TCB_DEPT: TTntComboBox;
    tbb_search: TTntBitBtn;
    bb_reset: TTntBitBtn;
    Tbb_reset: TTntBitBtn;
    N4: TTntMenuItem;
    ImageList1: TImageList;
    PanelAdd: TTntPanel;
    ADOQuery1: TADOQuery;
    TntPanel3: TTntPanel;
    TntGroupBox6: TTntGroupBox;
    TntPanel5: TTntPanel;
    sb_Close: TTntSpeedButton;
    sb_Add: TTntSpeedButton;
    N5: TTntMenuItem;
    ADOQuery2: TADOQuery;
    TEDT_DATE: TTntDateTimePicker;
    EDT_DATE: TTntDateTimePicker;
    sqlQuery1: TADOQuery;
    sqlQuery2: TADOQuery;
    sqlQuery3: TADOQuery;
    TntPanel6: TTntPanel;
    TntPanel4: TTntPanel;
    Image1: TImage;
    TntPanel7: TTntPanel;
    TntPanel8: TTntPanel;
    TntPanel9: TTntPanel;
    TntPanel10: TTntPanel;
    TntGroupBox3: TTntGroupBox;
    LV_bs: TTntListView;
    TntGroupBox2: TTntGroupBox;
    CLB_dtl: TTntCheckListBox;
    TntButton1: TTntButton;
    TntButton2: TTntButton;
    TntButton3: TTntButton;
    TntButton4: TTntButton;
    TntButton5: TTntButton;
    sb_save: TTntSpeedButton;
    qry_check: TADOQuery;
    qry_stat: TADOQuery;
    lb_select: TTntListBox;
    TntPanel11: TTntPanel;
    TntPanel12: TTntPanel;
    TntDBGrid1: TTntDBGrid;
    DataSource2: TDataSource;
    procedure InitLangInfo;
    procedure FormCreate(Sender: TObject);
    procedure bb_searchClick(Sender: TObject);
    procedure LV_bsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure bb_resetClick(Sender: TObject);
    procedure CLB_CHECK(ovrdate,dept,seg_code:string);
    procedure privilegeChange(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure sb_CloseClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure Pmenu1Popup(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure PanelAddMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LB_addKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function CheckOvertime(empid,DeptCode,Period:String;Adate:TDate;IsWeek:boolean=true;IsMonth:Boolean=False):boolean;
    function GetHours(time1,time2:string):double;
    procedure CLB_dtlClickCheck(Sender: TObject);
    procedure GetStat(IsSelect:boolean);
    procedure GetEmps;
    function CheckAPeriod(Adate:Tdate;Dept,EmpId,SegCode:String):boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure selectitem;
    function CheckSegTms(emp_id,seg_code:string;wrkdate:Tdatetime):boolean;//檢查加班時段是否已經排班

    function CheckDayOvertime(empid,DeptCode,Seg_code:String;Adate:TDate):boolean;
    function Checkchanjia(empid:String;Adate:TDate):boolean;
    procedure TntDBGrid1TitleClick(Column: TColumn);
  private
    //得到限制的最大加班時數
    function GetSpecialHours(const EmpID: string; const OverDate: TDate): TAryHours;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formDut03: TformDut03;
  ws_Words:TWideStrings;
  PanelX,PanelY :integer;
  
implementation

uses
  UnitDMHrdsys,UnitHrdUtils;
{$R *.dfm}
var
  PreEmpList:Tstrings;//記錄工號選擇改變前的狀態
  dept_code:string;

  //允許加班的最大時數：天->3.5，周->10，月->25，年->300

const
  //允許的最大加班時數********************************************************>>
  //天
  MAX_HOURS_DAY   = 4.0;   //3.5 -> 4.0  
  //周
  MAX_HOURS_WEEK  = 30.0;  //不限制周加班，不要月不超過30就好  12.0->30.0
  //月
  MAX_HOURS_MONTH = 30.0;   //2016.03.08 25 -> 30
  //年
  MAX_HOURS_YEAR  = 300.0;
  //允許的最大加班時數********************************************************<<


procedure TformDut03.selectitem;
var
  i:integer;
begin
  if LV_bs.Selected<>nil then
    exit;
  for i:=0 to LV_bs.Items.Count-1 do
  begin
    if LV_bs.Items[i].ImageIndex<>-1 then
    begin
      LV_bs.Items[i].Selected:=true;
      break;
    end;
  end;
end;

procedure TFormDut03.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  //定義要用到的語言
 ThisFormUsedWords:='peoplesum,peopleovr,save_fail,save_success,begin,end,'+
    'fld_clas_code,select_all,unselect_all,reset,period,current_period,'+
    'classperiod,addclassperiod,deleteclassperiod,dut03_dateerror,dut03_depterror,'+
    'dut03_warning1,dut03_weekerror,dut03_yearerror,dut03_perioderror,'
    +'msg_year_over,emp_id,msg_overtime_same,msg_month_data_locked,';
 ws_Words:=GetLangWideStrs(ThisFormUsedWords);
 pmenu1.Items[0].Caption :=  GetLangName(ws_Words,'addclassperiod');
 pmenu1.Items[1].Caption :=  GetLangName(ws_Words,'deleteclassperiod');
 pmenu2.Items[0].Caption :=  GetLangName(ws_Words,'select_all');
 pmenu2.Items[1].Caption :=  GetLangName(ws_Words,'reset');
 pmenu2.Items[2].Caption :=  GetLangName(ws_Words,'unselect_all'); 
 LV_bs.Columns[0].Caption := GetLangName(ws_Words,'period');
 LV_bs.Columns[1].Caption := GetLangName(ws_Words,'fld_clas_code');
 LV_bs.Columns[2].Caption := GetLangName(ws_Words,'begin');
 LV_bs.Columns[3].Caption := GetLangName(ws_Words,'end');  

 SetComponentLang(self);
end;

procedure TformDut03.CLB_CHECK(ovrdate,dept,seg_code:string);
var
  sqlstr:string;
  i:integer;
begin

  with SQLQuery1 do
  begin
    sqlstr := 'select a.* from hrd_dut_ovrdtl as a ,hrd_dut_ovrmst as b '+
              ' where a.batch_no=b.batch_no and b.over_date='''+ovrdate+''' and '+
              ' b.dept_code='''+dept+''' and b.seg_code='''+seg_code+'''';
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    for i:=0 to clb_dtl.Count-1 do
      clb_dtl.Checked[i]:=false;
    while not eof do
    begin
      for i:=0 to clb_dtl.Count-1 do
      begin
        if leftstr(clb_dtl.items.Strings[i],6) = fieldbyname('emp_id').Value then
        begin
          clb_dtl.Checked[i]:=true;
          break;
        end ;
      end;
      next;
    end;
  end;
end;


procedure TformDut03.FormCreate(Sender: TObject);
var
  prvArr:TPrvArr;
begin
  edt_date.date := now;
  tedt_date.Date := now;
  prvArr:=GetPrvArr(userName,'Dut03');
  if prvArr[inq] then
  begin
    privilege.Pages[0].TabVisible := true;
  end  
  else
  begin
    privilege.Pages[0].TabVisible := false;
  end;  
  {with SQLQuery1 do
  begin
    sql.Clear;
    sql.Add('select * from hrd_dept order by dept_code');
    open;
    while not eof do
    begin
      cb_dept.AddItem(fieldbyname('dept_code').Value+'-'+fieldbyname('abbr_titl').value,sender);
      Tcb_dept.AddItem(fieldbyname('dept_code').Value+'-'+fieldbyname('abbr_titl').value,sender);
      next;
    end;
  end; }
  GetDeptRange(cb_dept);
  GetDeptRange(Tcb_dept);
  if privilege.ActivePageIndex = 0 then
  begin
    clb_dtl.Color := CLSkyBlue;
    tntPanel6.Hide;
    tntPanel7.Hide;
    lb_select.Show;
    clb_dtl.Hide;
  end
  else
  begin
    lv_bs.PopupMenu := Pmenu1;
    CLb_dtl.PopupMenu := Pmenu2;
    clb_dtl.Color := CLWindow;
    tntPanel6.Show;
    tntPanel7.Show;
    lb_select.Hide;
    clb_dtl.Show;
  end;
  PreEmpList:=TStringList.Create;//初始化PreEmpList
  InitLangInfo;
end;

procedure TformDut03.bb_searchClick(Sender: TObject);
var
  lv_item:TtntListitem;
  datestr :Tdate;
  i:integer;
  sqlstr,sSql_1,sSql_2:string;
  deptstr:string;
begin
  try
    if privilege.ActivePageIndex = 0 then
    begin
      datestr := EDT_DATE.date;
      deptstr := leftstr(CB_dept.Text,6);
    end
    else
    begin
      datestr:=TEDT_DATE.date;
      deptstr := leftstr(TCB_dept.Text,6);
    end;
  except
    wideshowmessage(GetLangName(ws_Words,'dut03_dateerror'));
    exit;
  end;
  dept_code:=deptstr;

  with SQLQuery1 do
  begin
    sql.Clear;
    close;
    sql.Add('select * from hrd_dept where dept_code='''+deptstr+'''');
    open;
    if eof then
    begin
      wideshowmessage(GetLangName(ws_Words,'dut03_depterror'));
      exit;
    end;
    if privilege.ActivePageIndex = 0 then
    begin
      EDT_date.Enabled := false;
      cb_dept.Enabled := false;
      bb_search.Enabled :=false;
    end
    else
    begin
      TEDT_date.Enabled := false;
      Tcb_dept.Enabled := false;
      Tbb_search.Enabled :=false;
    end;
    close;
    sql.clear;
    //sqlstr:='select * from hrd_emp where epledt is null and dept_code='''+deptstr+'''';
    {sqlstr:='select distinct A.* from hrd_emp A left join hrd_dut_ovrdtl B '
      +' on A.emp_id=B.emp_id where A.dept_code='''+deptstr+''''
      +' and a.emp_id not in ( select emp_id from hrd_emp_chan where emp_id=a.emp_id  '
      +' and date_s>'''+FormatDateTime('yyyy/mm/dd',datestr)+ ''' and Date_e <'''+FormatDateTime('yyyy/mm/dd',datestr)+''')'
      +' and (epledt is null or (epledt>'''+FormatDateTime('yyyy/mm/dd',datestr)+'''))'
      +' or B.batch_no in (select batch_no from hrd_dut_ovrmst C where dept_code='''+deptstr+''''
      +' and over_date='''+FormatDateTime('yyyy/mm/dd',datestr)+''')'   ; }

    sSql_1:='select  A.* from hrd_emp A left join hrd_dut_ovrdtl B '
      +' on A.emp_id=B.emp_id where A.dept_code='''+deptstr+''''
      +' and not exists ( select emp_id from hrd_emp_chan where emp_id=a.emp_id  '
      +' and date_s>'''+FormatDateTime('yyyy/mm/dd',datestr)+ ''' and Date_e <'''+FormatDateTime('yyyy/mm/dd',datestr)+''')'
      +' and (epledt is null or (epledt>'''+FormatDateTime('yyyy/mm/dd',datestr)+'''))';

    sSql_2:='select distinct A.* from hrd_emp A left join hrd_dut_ovrdtl B '
      +' on A.emp_id=B.emp_id where exists (select batch_no from hrd_dut_ovrmst C where dept_code='''+deptstr+''''
      +' and batch_no=B.batch_no and over_date='''+FormatDateTime('yyyy/mm/dd',datestr)+''')'   ;

    sqlstr:='select  emp_id, name_vim, name_vim_en from (('+sSql_1+') union ('+sSql_2+')) as dfs '+
            'GROUP BY  emp_id, name_vim, name_vim_en' ;

    sql.Add(sqlstr);
    open;
    CLB_dtl.Items.Clear;
    CLB_dtl.Visible := false;
    i:=0; 
    CLB_dtl.Items.NameValueSeparator:='-';
    while not eof do
    begin
      //CLB_dtl.Items.Add(widestring(fieldbyname('emp_id').Value+'-'+fieldbyname('emp_chs').Value));
      if fieldbyname('name_vim_en').AsString ='' then    //2011-10-12 hyt upd
        CLB_dtl.Items.Add(widestring(fieldbyname('emp_id').Value+'-'+fieldbyname('name_vim').Value))
      else
        CLB_dtl.Items.Add(widestring(fieldbyname('emp_id').Value+'-'+fieldbyname('name_vim_en').Value));
      next;
      i := i + 1;
    end;
    
    CLB_dtl.Visible := true;
    sql.Clear;
    sqlstr := 'select a.*,b.clas_code,b.s_start,b.s_end,c.clas_chs '
      +' from hrd_dut_ovrmst as a ,hrd_dut_seg as b,hrd_dut_class as c '+
      ' where a.dept_code='''+deptstr+
      ''' and a.over_date='''+datetostr(datestr)+
      ''' and a.seg_code=b.seg_code and b.clas_code=c.clas_code order by a.seg_code';
    sql.Add(sqlstr);
    open;
    first;
    while not eof do
    begin
      lv_item := LV_bs.Items.Add;
      lv_item.Caption := fieldbyname('seg_code').Value;
      lv_item.SubItems.Add('');
      lv_item.SubItems.Add('');
      lv_item.SubItems.Add('');
      lv_item.SubItems.Strings[0]:= widestring(fieldbyname('clas_code').Value+'-'+fieldbyname('clas_chs').Value);
      lv_item.SubItems.Strings[1]:= fieldbyname('s_start').Value;
      lv_item.SubItems.Strings[2]:= fieldbyname('s_end').Value;
      next;
    end;
  end;
  for i := 0 to LV_bs.Items.Count-1 do
  begin
    LV_bs.Items[i].ImageIndex := -1;
  end;
  if TTntBitBtn(sender).Name='tbb_search' then
  begin
    TntButton1.Enabled := true;
    TntButton2.Enabled := true;
    TntButton3.Enabled := true;
    TntButton4.Enabled := true;
    TntButton5.Enabled := true;
  end;
  if TtntBitbtn(sender).name='bb_search' then
  begin
    GetStat(true);
  end  
  else
    GetStat(false);
  if lv_bs.Items.Count>0 then
  begin
    lv_bs.Items[0].Selected:=true;
    lv_bs.Items[0].ImageIndex:=0;
  end;
  PreEmpList.Clear;
end;

procedure TformDut03.LV_bsSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  i:integer;
begin
  if privilege.ActivePageIndex = 0 then
    CLB_CHECK(datetostr(edt_date.date),leftstr(cb_dept.Text,6),item.Caption)
  else
    CLB_CHECK(datetostr(tedt_date.date),leftstr(tcb_dept.Text,6),item.Caption);
  for i := 0 to LV_bs.Items.Count-1 do
  begin
    LV_bs.Items[i].ImageIndex := -1;
  end;
  item.ImageIndex:= 0;
  GetEmps;
  if privilege.ActivePage=maintenance then
    GetStat(false)
  else
    GetStat(true);  
end;

procedure TformDut03.bb_resetClick(Sender: TObject);
begin
  if privilege.ActivePageIndex = 0 then
  begin
    EDT_date.Enabled := true;
    cb_dept.Enabled := true;
    bb_search.Enabled :=true;
  end
  else
  begin
    TEDT_date.Enabled := true;
    Tcb_dept.Enabled := true;
    Tbb_search.Enabled :=true;
  end;
  LV_bs.Items.Clear;
  CLB_DTL.Clear;
  lb_select.Clear;
end;

procedure TformDut03.privilegeChange(Sender: TObject);
begin
  bb_resetClick(Sender);
  bb_resetClick(Sender);
  SetStatusText('');
  if privilege.ActivePageIndex = 1 then
  begin
    lv_bs.PopupMenu := Pmenu1;
    CLb_dtl.PopupMenu := Pmenu2;
    CLB_DTL.Color := CLWindow;
    TntButton1.Enabled := false;
    TntButton2.Enabled := false;
    TntButton3.Enabled := false;
    TntButton4.Enabled := false;
    TntButton5.Enabled := false;
    tntPanel6.Show;
    tntPanel7.Show;
    lb_select.Hide;
    clb_dtl.Show;
  end
  else
  begin
    lv_bs.PopupMenu := nil;
    CLb_dtl.PopupMenu := nil;
    CLB_DTL.Color := CLSkyBlue;
    tntPanel6.Hide;
    tntPanel7.Hide;
    lb_select.Show;
    clb_dtl.Hide;
    TntButton1.Enabled := false;
    TntButton2.Enabled := false;
    TntButton3.Enabled := false;
    TntButton4.Enabled := false;
    TntButton5.Enabled := false;
  end;
end;

procedure TformDut03.sb_SaveClick(Sender: TObject);
var
 i,Acount:integer;
 sqlstr:string;
 datestr:tdate;
 deptstr:string;
begin
  datestr:=TEDT_DATE.date;
  //該月資料已經鎖定
  if ((FormatDateTime('yyyymm',datestr))<=LockMonthPart) and (UserName<>DebugUser) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
    exit;
  end;
  selectitem;
  deptstr := leftstr(TCB_dept.Text,6);
  if lv_bs.Selected = nil then
  exit;
  if not tbb_search.Enabled  then
  begin
    Acount := 0;
    for i:=0 to CLB_DTL.count-1 do
    begin
      if CLB_DTL.State[i]=cbChecked then
      begin
        with SQLQuery2 do
        begin
          inc(Acount);
          close;
          sql.Clear;
          sqlstr := 'select a.* from hrd_dut_ovrdtl as a ,hrd_dut_ovrmst as b '+
                ' where a.batch_no=b.batch_no and b.over_date='''+datetostr(datestr)+''' and '+
                ' b.dept_code='''+deptstr+''' and b.seg_code='''+LV_bs.Selected.Caption+''' and '+
                ' a.emp_id='''+midstr(CLB_DTL.Items.Strings[i],1,pos('-',CLB_DTL.Items.Strings[i])-1)+'''';
          sql.Add(sqlstr);                 
          open;
          if  eof then
          begin
            close;
            sql.Clear;
            sqlstr := 'select * from hrd_dut_ovrmst '+
                ' where over_date='''+datetostr(datestr)+''' and '+
                ' dept_code='''+deptstr+''' and seg_code='''+LV_bs.Selected.Caption+'''';
            sql.add(sqlstr);
            open;
            DMHRDsys.ADOCommand1.CommandText := 'insert into hrd_dut_ovrdtl(upd_user,batch_no,emp_id) values('''+
                  UserName+''','+inttostr(fieldbyname('batch_no').value)+','''+
                  midstr(CLB_DTL.Items.Strings[i],1,pos('-',CLB_DTL.Items.Strings[i])-1)+''')';
            //showmessage(DMHRDsys.ADOCommand1.CommandText);
            try
              DMHRDsys.ADOCommand1.Execute;
            except
              wideshowmessage(GetLangName(ws_Words,'save_fail'));
            end;
          end;
        end;
      end
      else
      begin
        with SQLQuery2 do
        begin
          close;
          sql.Clear;
          sqlstr := 'select a.* from hrd_dut_ovrdtl as a ,hrd_dut_ovrmst as b '+
                ' where a.batch_no=b.batch_no and b.over_date='''+datetostr(datestr)+''' and '+
                ' b.dept_code='''+deptstr+''' and b.seg_code='''+LV_bs.Selected.Caption+''' and '+
                ' a.emp_id='''+midstr(CLB_DTL.Items.Strings[i],1,pos('-',CLB_DTL.Items.Strings[i])-1)+'''';
          sql.Add(sqlstr);
          open;
          if not eof then
          begin
            DMHRDSYS.ADOCommand1.CommandText := 'delete from hrd_dut_ovrdtl where batch_no='+fieldbyname('batch_no').AsString+
                ' and emp_id='''+midstr(CLB_DTL.Items.Strings[i],1,pos('-',CLB_DTL.Items.Strings[i])-1)+'''';
            try
              DMHRDsys.ADOCommand1.Execute;
            except
              wideshowmessage(GetLangName(ws_Words,'save_fail'));
            end;
          end;
        end;  
      end;
    end;
    if Acount=0 then
    begin
      DMHRDSYS.ADOCommand1.CommandText := 'delete from hrd_dut_ovrmst where dept_code='''+leftstr(tcb_dept.Text,6)
        +''' and over_date='''+datetostr(tedt_date.Date)+''' and seg_code='''+lv_bs.Selected.Caption+''' ';
      DMHRDSYS.ADOCommand1.execute;
      lv_bs.Selected.Delete;
    end;  
    wideshowmessage(GetLangName(ws_Words,'save_success'));
  end;
  GetStat(false);
end;

procedure TformDut03.N1Click(Sender: TObject);
var
  sqlstr:string;
  item:widestring;
begin
  if  tbb_search.Enabled  then
    exit;
  sqlstr := 'select a.*,b.clas_chs '+
    'from hrd_dut_seg as a,hrd_dut_class as b '+
    'where a.clas_code=b.clas_code and '+
    ' a.clas_code>=''65'' and a.clas_code<=''76''  and a.clas_code<>''73'' and '+
    'a.seg_code not in '+
    '(select seg_code from hrd_dut_ovrmst where dept_code='''+leftstr(TCB_DEPT.Text,6)+''' and '+
    'over_date='''+trim(datetostr(TEDT_DATE.date))+''') ';
  with SQLQuery3 do
  begin
    close;
    sql.clear;
    sql.Add(sqlstr);
    open;
   { while not eof do
    begin
      item :=format('%-10s%2s-%-15s%10s%10s%20s%20s%20s%20s',[fieldbyname('seg_code').value,fieldbyname('clas_code').value,fieldbyname('clas_chs').value,fieldbyname('s_start').value,fieldbyname('s_end').value,fieldbyname('start_b').value,fieldbyname('start_e').value,fieldbyname('end_b').value,fieldbyname('end_e').value]);
      lb_add.AddItem(item,sender);
      next;
    end;  }
  end;
  paneladd.Left := 100;
  paneladd.Top := 146;
  paneladd.Show;
  privilege.Enabled := false;
  tntpanel2.Enabled :=false;
end;

procedure TformDut03.N2Click(Sender: TObject);
var
  i:integer;
begin
  selectitem;
  if LV_BS.Selected<>nil then
    for i:=0 to clb_dtl.Count-1 do
    begin
      clb_dtl.Checked[i]:=true;
      //時段重複檢查
      if not CheckAPeriod(TEdt_date.Date,leftstr(tcb_dept.Text,6),leftStr(clb_dtl.Items[i],6),lv_bs.Selected.Caption) then
      begin
        wideshowmessage(GetLangName(ws_Words,'msg_overtime_same'));
        clb_dtl.Checked[i]:=false;
      end;
      //周加班工時
      if not CheckOvertime(leftstr(clb_dtl.Items[i],6),leftstr(tcb_dept.Text,6),LV_bs.Selected.Caption,TEDT_DATE.Date) then
      begin
          showmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_weekerror'));
          clb_dtl.Checked[i]:=false;
      end;
      //月加班超時
      if not CheckOvertime(leftstr(clb_dtl.Items[i],6),leftstr(tcb_dept.Text,6),LV_bs.Selected.Caption,TEDT_DATE.Date, False, True) then
      begin
        showmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_montherror'));
        clb_dtl.Checked[i]:=false;
        Continue;
      end;
      //
      if not CheckOvertime(leftstr(clb_dtl.Items[i],6),leftstr(tcb_dept.Text,6),LV_bs.Selected.Caption,TEDT_DATE.Date,false) then
      begin
        showmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_yearerror'));
        clb_dtl.Checked[i]:=false;
      end;
      //***<< 檢查日加班時數  2011-05-25
      if not CheckDayOvertime(leftstr(clb_dtl.Items[i],6),leftstr(tcb_dept.Text,6),'',TEDT_DATE.Date) then
      begin
       showmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_dayerror'));
       clb_dtl.Checked[i]:=false;
      end;
     //>>
     //***<< 檢查是否產假人員  2011-05-25
      if not Checkchanjia(leftstr(clb_dtl.Items[i],6),TEDT_DATE.Date) then
      begin
     //  showmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_dayerror'));
       clb_dtl.Checked[i]:=false;
      end;
    end;  
end;

procedure TformDut03.N3Click(Sender: TObject);
var
  i:integer;
begin
  selectitem;
  if LV_BS.Selected<>nil then
    for i:=0 to clb_dtl.Count-1 do
      clb_dtl.Checked[i]:=false;
end;

procedure TformDut03.N4Click(Sender: TObject);
begin
  selectitem;
  if LV_BS.Selected<>nil then
    CLB_CHECK(datetostr(tedt_date.date),leftstr(tcb_dept.Text,6),LV_BS.Selected.Caption);
end;

procedure TformDut03.sb_CloseClick(Sender: TObject);
begin
  //lb_add.Clear;
  sqlQuery3.Close;
  paneladd.Hide;
  privilege.Enabled:=true;
  tntpanel2.Enabled :=true;
end;

procedure TformDut03.sb_AddClick(Sender: TObject);
var
  i:integer;
  seg_code :string;
  sqlstr:string;
  dept_code:string;
  over_date:string;
  lv_item:TtntListitem;
begin
  dept_code := leftstr(TCB_DEPT.Text,6);
  over_date := trim(datetostr(Tedt_date.date));
  with tntdbgrid1.SelectedRows do
  begin
    for i:=0 to count-1 do
    begin
      if indexof(items[i])<>-1 then
      begin
        TntDBGrid1.Datasource.Dataset.Bookmark:= Items[i];
        seg_code :=TntDBGrid1.Datasource.Dataset.fieldbyname('seg_code').asstring;
        //showmessage(seg_code);
        sqlstr := 'insert into hrd_dut_ovrmst(upd_user,dept_code,over_date,seg_code)'+
                  ' values('''+UserName+''','''+dept_code+''','''+over_date+''','''+seg_code+''')';
        DMHRDSYS.ADOCommand1.commandtext := sqlstr;
        DMHRDSYS.ADOCommand1.execute;
      end;
    end;
  end;
  {for i:=0 to lb_add.Count-1 do
  begin
    if lb_add.Selected[i] then
    begin
      seg_code := leftstr(lb_add.Items.Strings[i],2);
      sqlstr := 'insert into hrd_dut_ovrmst(upd_user,dept_code,over_date,seg_code)'+
        ' values('''+UserName+''','''+dept_code+''','''+over_date+''','''+seg_code+''')';
      with DMHRDSYS.ADOCommand1 do
      begin
        commandtext := sqlstr;
        execute;
      end;
    end;
  end;  }
  with adoquery1 do
  begin
    sql.Clear;
    sqlstr := 'select a.*,b.clas_code,b.s_start,b.s_end,c.clas_chs '
      +' from hrd_dut_ovrmst as a ,hrd_dut_seg as b,hrd_dut_class as c '+
      ' where a.dept_code='''+dept_code+
      ''' and a.over_date='''+over_date+
      ''' and a.seg_code=b.seg_code and b.clas_code=c.clas_code order by a.seg_code';
    sql.Add(sqlstr);
    open;
    first;
    LV_bs.Clear;
    while not eof do
    begin
      lv_item := LV_bs.Items.Add;
      lv_item.Caption := fieldbyname('seg_code').Value;
      if seg_code=fieldbyname('seg_code').Value then
        lv_item.Selected:=true;
      lv_item.SubItems.Add('');
      lv_item.SubItems.Add('');
      lv_item.SubItems.Add('');
      lv_item.SubItems.Strings[0]:= fieldbyname('clas_code').Value+'-'+fieldbyname('clas_chs').Value;
      lv_item.SubItems.Strings[1]:= fieldbyname('s_start').Value;
      lv_item.SubItems.Strings[2]:= fieldbyname('s_end').Value;
      next;
    end;
  end;
  //lb_add.DeleteSelected;
  //sqlQuery3.Close;
  for i := 0 to LV_bs.Items.Count-1 do
  begin
    if lv_bs.Items[i].Selected then
      LV_bs.Items[i].ImageIndex := 0
    else
      LV_bs.Items[i].ImageIndex := -1;
  end;
  sb_CloseClick(Sender);  
end;

procedure TformDut03.Pmenu1Popup(Sender: TObject);
begin
  if LV_bs.Selected <> nil then
    N5.Visible := true
  else
    N5.Visible := false;
end;

procedure TformDut03.N5Click(Sender: TObject);
var
  index,i:integer;
begin
  selectitem;
  if LV_bs.Selected=nil then
   exit;
  if widemessagedlg(GetLangName(ws_Words,'dut03_warning1'),mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    index:=lv_bs.Selected.Index;
    DMHRDSYS.conn.BeginTrans;
    with DMHRDSYS.ADOCommand1 do
    begin
      adoquery2.SQL.Clear;
      adoquery2.SQL.add('select * from hrd_dut_ovrmst where over_date='''+
         trim(datetostr(tedt_date.date))+''' and dept_code='''+
         leftstr(tcb_dept.Text,6)+''' and seg_code='''+
         lv_bs.Selected.Caption+'''');
      adoquery2.open;
      commandtext := 'delete from hrd_dut_ovrdtl where batch_no='+adoquery2.fieldbyname('batch_no').AsString;
      execute;
      commandtext := 'delete from hrd_dut_ovrmst where batch_no='+adoquery2.fieldbyname('batch_no').AsString;
      execute;
    end;
    lv_bs.Selected.Delete;
    if index>1 then
    begin
      lv_bs.Items[index-1].Selected:=true;
      lv_bs.Items[index-1].ImageIndex:=0;
    end
    else
    begin
      if lv_bs.Items.Count>0 then
      begin
        lv_bs.Items[0].Selected:=true;
        lv_bs.Items[0].ImageIndex:=0;
      end;
    end;
    //wideshowmessage(GetLangName(ws_Words,'delete_success'));
    DMHRDSYS.conn.CommitTrans;
  end;
end;

procedure TformDut03.PanelAddMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Paneladd.Perform(WM_SysCommand,$F012,0);
end;

procedure TformDut03.LB_addKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    sb_AddClick(Sender);
    
end;

function TformDut03.CheckOvertime(empid,DeptCode,Period:String;Adate:TDate;IsWeek:boolean=true;
  IsMonth:Boolean=False):boolean;
//檢查加班是否超時
var
  StartDate,EndDate:TDate;
  SqlStr:WideString;
  OvrHours,MaxHour,ShowHour:double;
  timeBegin,timeEnd:string;
  //
  SpecHours: TAryHours;
begin
  //特殊加班時數 2014.05.09 LX
  SpecHours := GetSpecialHours(empid, Adate);
  //
  timeBegin:=LV_bs.Selected.SubItems.Strings[1];//時段開始時間
  timeEnd:=LV_bs.Selected.SubItems.Strings[2];//時段結束時間
  OvrHours:=0.0;
  if IsWeek then
  begin
    StartDate:=StartOfTheWeek(Adate)-1;
    EndDate:=EndOfTheWeek(Adate)-1;
    MaxHour:= MAX_HOURS_WEEK;
    //是否為特殊員工 2014.05.09 LX
    if SpecHours[1]> MaxHour then
      MaxHour := SpecHours[1];
  end
  else if IsMonth then
  begin
    StartDate := StartOfTheMonth(Adate);
    EndDate := EndOfTheMonth(Adate);
    //2013.08.24
    MaxHour := MAX_HOURS_MONTH;
    //是否為特殊員工 2014.05.09 LX
    if SpecHours[2]> MaxHour then
      MaxHour := SpecHours[2];
  end
  else begin
    StartDate:=StartOfTheYear(Adate);
    EndDate:=EndOfTheYear(Adate);
    MaxHour:= MAX_HOURS_YEAR;
    //是否為特殊員工 2014.05.09 LX
    if SpecHours[3]> MaxHour then
      MaxHour := SpecHours[3];
    if YearOf(Adate)=2006 then
    begin//2006年1-7月資料從匯總檔統計
      SqlStr:='select (january+february+march+april+may+june+july) as tot '
        +' from hrd_dut_empovr where emp_id='''+empid+''' and [year]=''2006''';
      with DMHrdsys.SQLQuery2 do
      begin
        close;
        sql.Clear;
        sql.Add(SqlStr);
        open;
        if not Eof then
          OvrHours:=OvrHours+FieldByName('tot').AsFloat;
      end;
      StartDate:=StartOfAMonth(2006,8);
    end;
    //showmessage(datetostr(StartDate)+DatetoStr(EndDate));
  end;
  //2013.08.24 LX 一般加班
  SQLStr:= 'SELECT A.EMP_ID, B.OVER_DATE, B.SEG_CODE, C.S_START, C.S_END'
         + '  FROM HRD_DUT_OVRDTL A, HRD_DUT_OVRMST B, HRD_DUT_SEG C'
         + ' WHERE A.EMP_ID = '+QuotedStr(empid)
         + '   AND A.BATCH_NO = B.BATCH_NO'
         + '   AND B.SEG_CODE = C.SEG_CODE'
         + '   AND B.OVER_DATE >= '+QuotedStr(FormatDateTime('YYYY/MM/DD', StartDate))
         + '   AND B.OVER_DATE <= '+QuotedStr(FormatDateTime('YYYY/MM/DD', EndDate))
         + '   AND CONVERT(VARCHAR(8), B.OVER_DATE, 112) <> '+QuotedStr(FormatDateTime('YYYYMMDD', Adate));
  with qry_check do
  begin
    Close;
    SQL.Clear;
    SQL.Add(SQLStr);
    Open;
    //
    First;
    while not Eof do
    begin
      //
      OvrHours:= OvrHours + GetHours(FieldByName('s_start').AsString, FieldByName('s_end').AsString);
      //
      Next;
    end;
    //
    Close;
  end;
  //2013.08.24 LX 特殊加班
  SQLStr:= 'SELECT SUM(TOT_HOUR) AS TOT_HOUR'
         + '  FROM HRD_DUT_SPE_OVERWORK'
         + ' WHERE EMP_ID = '+QuotedStr(empid)
         + '   AND OVER_DATE >= '+QuotedStr(FormatDateTime('YYYY/MM/DD', StartDate))
         + '   AND OVER_DATE <= '+QuotedStr(FormatDateTime('YYYY/MM/DD', EndDate))
         + '   AND CONVERT(VARCHAR(8), OVER_DATE, 112) <> '+QuotedStr(FormatDateTime('YYYYMMDD', Adate));
  with qry_check do
  begin
    Close;
    SQL.Clear;
    SQL.Add(SQLStr);
    Open;
    //
    First;
    while not Eof do
    begin
      //
      OvrHours:= OvrHours + FieldByName('TOT_HOUR').AsFloat;
      //
      Next;
    end;
    //
    Close;
  end;
  //
  OvrHours:= OvrHours + GetHours(timeBegin, timeEnd);
  //
  ShowHour:= OvrHours;
  //檢查模式
  if RunMode= '2' then
    ShowHour:= Min(OvrHours, MaxHour);
  //
  SetStatusText(GetLangName(ws_Words,'emp_id')+empid+GetLangName(ws_Words,'msg_year_over')+floattostr(ShowHour));
  //超時
  if OvrHours> MaxHour then
    Result:= False
  else
    Result:= True;
end;

function TformDut03.GetHours(time1,time2:string):double;
var
  h,m:integer;
begin
  h:=StrToInt(leftstr(time2,2))-StrToInt(leftstr(time1,2));
  m:=StrToInt(Rightstr(time2,2))-StrToInt(Rightstr(time1,2));
  result:=h+m/60;
end;

procedure TformDut03.CLB_dtlClickCheck(Sender: TObject);
//選中工號事件
var
  i:integer;
  seg_code,emp_id:string;
begin
  if  privilege.ActivePageIndex = 0 then
  begin//查詢
    if lv_bs.Selected=nil then
    begin
      for i:=0 to CLB_dtl.Items.Count-1 do
      begin
        CLB_dtl.Checked[i]:=false;
      end;
    end      
    else
    begin
      LV_bsSelectItem(Sender,lv_bs.Selected,true);
    end;
  end
  else
  begin//維護
 // selectitem;
  if LV_bs.Selected<>nil then
  begin
    if PreEmpList.Count=0 then
    begin//首次選擇
      PreEmpList.Clear;
      for i:=0 to clb_dtl.Count-1 do
      begin
        //PreEmpList.Add(BoolToStr(clb_dtl.Selected[i]));
        PreEmpList.Add('false');
      end;
    end;
    for i:=0 to clb_dtl.Count-1 do
    begin
      if (clb_dtl.Checked[i]) and (BoolToStr(clb_dtl.Checked[i])<>PreEmpList.Strings[i]) then
      begin//選中事件發生項目檢查
        {if not CheckSegTms(emp_id,seg_code,wrkdate:Tdatetime) then
        begin//該時段已經正常排班
          wideshowmessage(GetLangName(ws_Words,'msg_tms_have_seg'));
          clb_dtl.Checked[i]:=false;
        end;}
        emp_id:=leftStr(clb_dtl.Items[i],6);
        seg_code:=lv_bs.Selected.Caption;
        if not CheckAPeriod(TEdt_date.Date,dept_code,emp_id,seg_code) then
        begin//時段重復檢查
          wideshowmessage(GetLangName(ws_Words,'msg_overtime_same'));
          clb_dtl.Checked[i]:=false;
          Exit;
        end;
        if not CheckOvertime(emp_id,dept_code,seg_code,TEDT_DATE.Date) then
        begin//周加班超時
          wideshowmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_weekerror'));
          clb_dtl.Checked[i]:=false;
          Exit;
        end;
        if not CheckOvertime(emp_id,dept_code,seg_code,TEDT_DATE.Date,false,True) then
        begin   // 月加班工時超時檢查
          wideshowmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_montherror'));
          clb_dtl.Checked[i]:=false;
          Exit;
        end;
        if not CheckOvertime(emp_id,dept_code,seg_code,TEDT_DATE.Date,false) then
        begin//年加班超時
          wideshowmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_yearerror'));
          clb_dtl.Checked[i]:=false;
          Exit;
        end;
          //***<< 檢查日加班時數  2011-05-25
        if not CheckDayOvertime(emp_id,dept_code,Seg_code,TEDT_DATE.Date) then
        begin
          wideshowmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_dayerror'));
          clb_dtl.Checked[i]:=false;
          Exit;
        end;
          //***<< 檢查是否產假人員  2011-05-25
      if not Checkchanjia(leftstr(clb_dtl.Items[i],6),TEDT_DATE.Date) then
        begin
          showmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_dayerror'));
          clb_dtl.Checked[i]:=false;
          Exit;
        end;
        //>>
      end;
    end;//end for
    //保存改變后的狀態
    PreEmpList.Clear;
    for i:=0 to clb_dtl.Count-1 do
    begin
      PreEmpList.Add(BoolToStr(clb_dtl.Checked[i]));
    end;
  end;
  end;
end;

procedure Tformdut03.GetStat(IsSelect:boolean);
var
  i:integer;
  hintStr:widestring;
  Adate:Tdate;
  DeptStr:WideString;
  SqlStr:String;
begin
  if IsSelect then
  begin
    ADate:=Edt_date.Date;
    DeptStr:=cb_dept.Text;
  end
  else
  begin
    ADate:=TEdt_date.Date;
    DeptStr:=Tcb_dept.Text;
  end;
  hintStr:=DeptStr+': '+
      GetLangName(ws_words,'peoplesum')+' '+inttostr(clb_dtl.Items.Count)+'  '+
      GetLangName(ws_words,'peopleovr')+' ';
  with qry_stat do
  begin
    SqlStr:='select count(*) as c '+
            'from hrd_dut_ovrmst a,hrd_dut_ovrdtl b '+
            'where a.batch_no=b.batch_no and a.dept_code='''+leftstr(DeptStr,6)+
            ''' and a.over_date='''+FormatDateTime('yyyy/mm/dd',DateOf(ADate))+'''';
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;
    hintStr:=hintStr+inttostr(fieldbyname('c').AsInteger);
    if LV_bs.Selected<>nil then
    begin
      Close;
      hintStr:=hintStr+'  '+GetLangName(ws_Words,'current_period')+' '+LV_bs.Selected.Caption;
      hintStr:=hintStr+' '+GetLangName(ws_words,'peopleovr')+' ';
      SqlStr:='select count(*) as c '+
              'from hrd_dut_ovrmst a,hrd_dut_ovrdtl b '+
              'where a.seg_code='''+LV_bs.Selected.Caption+''' and a.batch_no=b.batch_no and a.dept_code='''+leftstr(DeptStr,6)+
              ''' and a.over_date='''+FormatDateTime('yyyy/mm/dd',DateOf(ADate))+'''';
      Sql.Clear;
      Sql.Add(SqlStr);
      Open;
      hintStr:=hintStr+inttostr(fieldbyname('c').AsInteger);
    end;
    Close;
  end;
  SetStatusText(hintStr);
end;

function TformDut03.CheckAPeriod(Adate:Tdate;Dept,EmpId,SegCode:String):boolean;
//檢查排班時間是否重復
var
  SqlStr:WideString;
  TimeBegin,TimeEnd:string;
begin
  //result:=true;
  //exit;//not check one seg
  TimeBegin:=LV_bs.Selected.SubItems.Strings[1];
  TimeEnd:=LV_bs.Selected.SubItems.Strings[2];
  with qry_stat do
  begin
    SqlStr:='select * from hrd_dut_ovrmst a,hrd_dut_ovrdtl b,hrd_dut_seg C'
      +' where a.batch_no=b.batch_no and A.seg_code=C.seg_code '
      +' and a.dept_code='''+Dept+''' and a.over_date='''+FormatDateTime('yyyy/mm/dd',DateOf(ADate))+''''
      +' and b.emp_id='''+EmpId+''' and a.seg_code<>'''+SegCode+''''
      +' and ((C.s_start<'''+TimeBegin+''' and C.s_end>'''+TimeBegin+''')'
      +' or (C.s_start<'''+TimeEnd+''' and C.s_end>'''+TimeEnd+''')'
      +' or (C.s_start>='''+TimeBegin+''' and C.s_end<='''+TimeEnd+'''))';
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;
    if not eof then        
      result:=false
    else
      result:=true;
  end;
end;
procedure TformDut03.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry_check.Close;
  qry_stat.Close;
  adoquery1.Close;
  adoquery2.Close;
  sqlQuery1.Close;
  sqlQuery2.Close;
  sqlQuery3.Close;
  
  SetStatusText('');
end;

procedure TformDut03.GetEmps;
var
  i:integer;
begin
  if privilege.ActivePageIndex=1 then
    exit;
  lb_select.Items.Clear;
  lb_select.Clear;
  for i:=0 to clb_dtl.Count-1 do
  begin
    if clb_dtl.Checked[i] then
      lb_select.Items.Add(clb_dtl.Items[i]);
  end;
end;

function TformDut03.CheckSegTms(emp_id,seg_code:string;wrkdate:Tdatetime):boolean;
begin
  //
end;


function TformDut03.CheckDayOvertime(empid,DeptCode,Seg_code:String;Adate:TDate):boolean;
//檢查日加班是否超時 2010-12-06
var
  SQLStr: WideString;
  //
  OvrHours, MaxHours: Double;
  //
  timeBegin,timeEnd: string;
  //
  fHours: Double;
  //
  SpecHours: TAryHours;
begin
//8月份，允許警衛超過25小時
  if (FormatDateTime('YYYYMM', Adate)= '201308') and (DeptCode= 'V05033') then
  begin
    Result:= True;
    Exit;
  end;
  //2016.10.03 週末不限制加班時數
  if DayOfWeek(Adate)= 1 then
  begin
    Result := True;
    Exit;
  end;
  //時段開始時間
  timeBegin:= LV_bs.Selected.SubItems.Strings[1];
  //時段結束時間
  timeEnd  := LV_bs.Selected.SubItems.Strings[2];
  //
  fHours:= GetHours(timeBegin, timeEnd);
  //
  OvrHours:=0.0;
  //取得日加班時數
  //一般加班 2013.08.24 LX
  SQLStr:= 'SELECT A.EMP_ID, B.OVER_DATE, B.SEG_CODE, C.S_START, C.S_END'
         + '  FROM HRD_DUT_OVRDTL A, HRD_DUT_OVRMST B, HRD_DUT_SEG C'
         + ' WHERE A.EMP_ID = '+QuotedStr(empid)
         + '   AND A.BATCH_NO = B.BATCH_NO'
         + '   AND B.SEG_CODE = C.SEG_CODE'
         + '   AND B.OVER_DATE = '+QuotedStr(FormatDateTime('YYYY/MM/DD', Adate));
  //
  with qry_check do
  begin
    Close;
    SQL.Clear;
    SQL.Add(SQLStr);
    Open;
    //
    First;
    while not Eof do
    begin
      //
      if (FieldByName('S_START').AsString<> timeBegin) or
         (FieldByName('S_END').AsString<> timeEnd) then
        OvrHours:= OvrHours + GetHours(FieldByName('S_START').AsString, FieldByName('S_END').AsString);
      //
      Next;
    end;
    //
    Close;
  end;
  //特殊加班 2013.08.24 LX
  SQLStr:= 'SELECT SUM(TOT_HOUR) AS TOT_HOUR'
         + '  FROM HRD_DUT_SPE_OVERWORK'
         + ' WHERE EMP_ID = '+QuotedStr(empid)
         + '   AND OVER_DATE = '+QuotedStr(FormatDateTime('YYYY/MM/DD', Adate));
  with qry_check do
  begin
    Close;
    SQL.Clear;
    SQL.Add(SQLStr);
    Open;
    //
    First;
    while not Eof do
    begin
      //
      OvrHours:= OvrHours + FieldByName('TOT_HOUR').AsFloat;
      //
      Next;
    end;
    //
    Close;
  end;
  //
  OvrHours:= OvrHours + fHours;
  //
  MaxHours := MAX_HOURS_DAY;
  //特殊加班時數 2014.05.09 LX
  SpecHours := GetSpecialHours(empid, Adate);
  //
  if MaxHours < SpecHours[0] then
    MaxHours := SpecHours[0];
  //
  Result:= OvrHours <= MaxHours;
end;

function TFormDut03.Checkchanjia(empid:String;Adate:TDate):boolean;
var
  sql,dates, datee :string ;
begin
  dates := FormatDateTime('yyyy/mm/dd',Adate) ;
  result := true;
  sql :='select emp_id from hrd_emp_chan where emp_id='''+empid  +''' and Date_s>='''+ dates + ''' and Date_e <= ''' + dates + '''' ;
  DMHrdsys.SQLQuery1.close;
    DMHrdsys.SQLQuery1.sql.Clear;
    DMHrdsys.SQLQuery1.sql.Add( sql );
    DMHrdsys.SQLQuery1.open;
    if not DMHrdsys.SQLQuery1.eof then
       begin
        result := false ;
        wideshowmessage('該員工目前產假中, 不可以輸入加班 ！');
        DMHrdsys.SQLQuery1.close;
      //  abort;
        exit ;
       end;
 // end;


end;

procedure TformDut03.TntDBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);
end;

function TformDut03.GetSpecialHours(const EmpID: string;
  const OverDate: TDate): TAryHours;
var
  sSQL: string;
begin
  //天 -> 3.5
  Result[0] := 0;
  //周 -> 10.0
  Result[1] := 0;
  //月 -> 25.0
  Result[2] := 0;
  //年 -> 300.0
  Result[3] := 0;
  //
  {
  sSQL := 'SELECT MAX_HOURS_DAY, MAX_HOURS_WEEK, MAX_HOURS_MONTH, MAX_HOURS_YEAR'
        + '  FROM HRD_DUT_OVER_SPECIAL'
        + ' WHERE OVER_DAY = '+QuotedStr(FormatDateTime('YYYY/MM/DD', OverDate))
        + '   AND EMP_ID = '+QuotedStr(EmpID);
  }
  //
  sSQL := 'SELECT MAX_HOURS_DAY, MAX_HOURS_WEEK, MAX_HOURS_MONTH, MAX_HOURS_YEAR'
        + '  FROM HRD_DUT_OVER_SPECIAL'
        + ' WHERE OVER_MONTH = '+QuotedStr(FormatDateTime('YYYYMM', OverDate));
  //
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //特定員工
    if not IsEmpty then
    begin
      //天
      Result[0] := FieldByName('MAX_HOURS_DAY').AsFloat;
      //周
      Result[1] := FieldByName('MAX_HOURS_WEEK').AsFloat;
      //月
      Result[2] := FieldByName('MAX_HOURS_MONTH').AsFloat;
      //年
      Result[3] := FieldByName('MAX_HOURS_YEAR').AsFloat;
    end;
    //
    Close;
  end;
end;

end.
