unit uFhrd205;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,tntDialogs, ExtCtrls,StrUtils, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, TntExtCtrls, TntDBGrids, TntDbCtrls, TntStdCtrls, TntButtons,
  DB, ADODB, DBClient, Provider,DateUtils,WSDLIntf, TntComCtrls, CheckLst,
  TntCheckLst, Menus, TntMenus, ImgList, TntForms,math;

type
  TFormfhrd205 = class(TForm)
    privilege: TTntPageControl;
    select: TTntTabSheet;
    TntGroupBox1: TTntGroupBox;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    CB_DEPT: TTntComboBox;
    bb_search: TTntBitBtn;
    bb_reset: TTntBitBtn;
    EDT_DATE: TTntDateTimePicker;
    maintenance: TTntTabSheet;
    TntGroupBox4: TTntGroupBox;
    TntLabel3: TTntLabel;
    TntLabel4: TTntLabel;
    TCB_DEPT: TTntComboBox;
    tbb_search: TTntBitBtn;
    Tbb_reset: TTntBitBtn;
    TEDT_DATE: TTntDateTimePicker;
    TntPanel1: TTntPanel;
    TntPanel2: TTntPanel;
    TntPanel7: TTntPanel;
    TntPanel8: TTntPanel;
    TntButton1: TTntButton;
    TntButton2: TTntButton;
    TntPanel9: TTntPanel;
    TntButton3: TTntButton;
    TntButton4: TTntButton;
    TntButton5: TTntButton;
    TntPanel10: TTntPanel;
    TntGroupBox3: TTntGroupBox;
    LV_bs: TTntListView;
    TntGroupBox2: TTntGroupBox;
    CLB_dtl: TTntCheckListBox;
    lb_select: TTntListBox;
    PanelAdd: TTntPanel;
    TntPanel3: TTntPanel;
    TntGroupBox6: TTntGroupBox;
    TntDBGrid1: TTntDBGrid;
    TntPanel5: TTntPanel;
    sb_Close: TTntSpeedButton;
    sb_Add: TTntSpeedButton;
    TntPanel11: TTntPanel;
    TntPanel12: TTntPanel;
    TntPanel4: TTntPanel;
    Image1: TImage;
    TntPanel6: TTntPanel;
    sb_save: TTntSpeedButton;
    DataSource1: TDataSource;
    Pmenu1: TTntPopupMenu;
    N1: TTntMenuItem;
    N5: TTntMenuItem;
    pmenu2: TTntPopupMenu;
    N2: TTntMenuItem;
    N4: TTntMenuItem;
    N3: TTntMenuItem;
    ImageList1: TImageList;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    sqlQuery1: TADOQuery;
    sqlQuery2: TADOQuery;
    sqlQuery3: TADOQuery;
    qry_check: TADOQuery;
    qry_stat: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery3: TADOQuery;
    ADOStoredProc1: TADOStoredProc;

    procedure FormCreate(Sender: TObject);
    procedure InitLangInfo;
    procedure tbb_searchClick(Sender: TObject);
     procedure GetStat(IsSelect:boolean);
    procedure Tbb_resetClick(Sender: TObject);
    procedure sb_saveClick(Sender: TObject);
     procedure selectitem;
    procedure LV_bsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
     procedure CLB_CHECK(ovrdate,dept,seg_code:string);
     procedure GetEmps;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    function CheckAPeriod(Adate:Tdate;Dept,EmpId,SegCode:String):boolean;
    function CheckOvertime(empid,DeptCode,Period:String;Adate:TDate;IsWeek:boolean=true):boolean;
    procedure sb_AddClick(Sender: TObject);
    procedure sb_CloseClick(Sender: TObject);
    procedure CLB_dtlClickCheck(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd205: TFormfhrd205;
  ws_Words:TWideStrings;
  PanelX,PanelY :integer;
implementation
uses
  UnitDMHrdsys,UnitHrdUtils;
{$R *.dfm}
var
  PreEmpList:Tstrings;//記錄工號選擇改變前的狀態
  dept_code:string;

procedure TFormfhrd205.InitLangInfo;
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
procedure TFormfhrd205.FormCreate(Sender: TObject);
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

procedure TFormfhrd205.tbb_searchClick(Sender: TObject);
var
  lv_item:TtntListitem;
  datestr :Tdate;
  i:integer;
  sqlstr:string;
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
    CLB_dtl.Items.Clear;
    CLB_dtl.Visible := false;
    i:=0; 
    CLB_dtl.Items.NameValueSeparator:='-';
    //已經排好加班但是調動部門工號
    sqlstr:='select * from hrd_emp A,fhrd_dut_ovrmst B, fhrd_dut_ovrdtl C'
      +' where A.emp_id=C.emp_id and B.batch_no=C.batch_no'
      +' and B.dept_code='''+deptstr+''' and B.dept_code<>A.dept_code '
      +' and over_date='''+FormatDateTime('yyyy/mm/dd',datestr)+'''';

    close;
    sql.clear;
    sql.Add(sqlstr);
    open;
    while not eof do
    begin
      //CLB_dtl.Items.Add(widestring(fieldbyname('emp_id').Value+'-'+fieldbyname('emp_chs').Value));
      CLB_dtl.Items.Add(widestring(fieldbyname('emp_id').Value+'-'+fieldbyname('name_vim_en').Value));
      next;
      i := i + 1;
    end;
    //該部門所有工號
    close;
    sql.clear;
    sqlstr:='select * from hrd_emp where dept_code='''+deptstr+''''
      +' and (epledt is null or (epledt>'''+FormatDateTime('yyyy/mm/dd',datestr)+'''))';
    if Checktempuser(username) = false   then
     begin
       sqlstr:=sqlstr + ' and  not exists( select *from hrd_deny_emp where emp_id=hrd_emp.emp_id ) '
     end;
    {sqlstr:='select distinct A.* from hrd_emp A left join hrd_dut_ovrdtl B '
      +' on A.emp_id=B.emp_id where A.dept_code='''+deptstr+''''
      +' and (epledt is null or (epledt>'''+FormatDateTime('yyyy/mm/dd',datestr)+'''))'
      +' or B.batch_no in (select batch_no from hrd_dut_ovrmst C where dept_code='''+deptstr+''''
      +' and over_date='''+FormatDateTime('yyyy/mm/dd',datestr)+''')';}
    sql.Add(sqlstr);
    open;
    while not eof do
    begin
      //CLB_dtl.Items.Add(widestring(fieldbyname('emp_id').Value+'-'+fieldbyname('emp_chs').Value));
      CLB_dtl.Items.Add(widestring(fieldbyname('emp_id').Value+'-'+fieldbyname('name_vim_en').Value));
      next;
      i := i + 1;
    end;

    CLB_dtl.Visible := true;
    sql.Clear;
    sqlstr := 'select a.*,b.clas_code,b.s_start,b.s_end,c.clas_chs '
      +' from fhrd_dut_ovrmst as a ,hrd_dut_seg as b,hrd_dut_class as c '+
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
procedure Tformfhrd205.GetStat(IsSelect:boolean);
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
            'from fhrd_dut_ovrmst a,fhrd_dut_ovrdtl b '+
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
              'from fhrd_dut_ovrmst a,fhrd_dut_ovrdtl b '+
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

procedure TFormfhrd205.Tbb_resetClick(Sender: TObject);
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

procedure TFormfhrd205.sb_saveClick(Sender: TObject);
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
          sqlstr := 'select a.* from fhrd_dut_ovrdtl as a ,fhrd_dut_ovrmst as b '+
                ' where a.batch_no=b.batch_no and b.over_date='''+datetostr(datestr)+''' and '+
                ' b.dept_code='''+deptstr+''' and b.seg_code='''+LV_bs.Selected.Caption+''' and '+
                ' a.emp_id='''+midstr(CLB_DTL.Items.Strings[i],1,pos('-',CLB_DTL.Items.Strings[i])-1)+'''';
          sql.Add(sqlstr);                 
          open;
          if  eof then
          begin
            close;
            sql.Clear;
            sqlstr := 'select * from fhrd_dut_ovrmst '+
                ' where over_date='''+datetostr(datestr)+''' and '+
                ' dept_code='''+deptstr+''' and seg_code='''+LV_bs.Selected.Caption+'''';
            sql.add(sqlstr);
            open;
            DMHRDsys.ADOCommand1.CommandText := 'insert into fhrd_dut_ovrdtl(upd_user,batch_no,emp_id) values('''+
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
          sqlstr := 'select a.* from fhrd_dut_ovrdtl as a ,fhrd_dut_ovrmst as b '+
                ' where a.batch_no=b.batch_no and b.over_date='''+datetostr(datestr)+''' and '+
                ' b.dept_code='''+deptstr+''' and b.seg_code='''+LV_bs.Selected.Caption+''' and '+
                ' a.emp_id='''+midstr(CLB_DTL.Items.Strings[i],1,pos('-',CLB_DTL.Items.Strings[i])-1)+'''';
          sql.Add(sqlstr);
          open;
          if not eof then
          begin
            DMHRDSYS.ADOCommand1.CommandText := 'delete from fhrd_dut_ovrdtl where batch_no='+fieldbyname('batch_no').AsString+
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
      DMHRDSYS.ADOCommand1.CommandText := 'delete from fhrd_dut_ovrmst where dept_code='''+leftstr(tcb_dept.Text,6)
        +''' and over_date='''+datetostr(tedt_date.Date)+''' and seg_code='''+lv_bs.Selected.Caption+''' ';
      DMHRDSYS.ADOCommand1.execute;
      lv_bs.Selected.Delete;
    end;
    // 2009-02-19 <<
  //  GetOvrTot;
    // 2009-02-19 >>
    wideshowmessage(GetLangName(ws_Words,'save_success'));
  end;
  GetStat(false);
end;
procedure Tformfhrd205.selectitem;
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

procedure TFormfhrd205.LV_bsSelectItem(Sender: TObject; Item: TListItem;
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
procedure Tformfhrd205.CLB_CHECK(ovrdate,dept,seg_code:string);
var
  sqlstr:string;
  i:integer;
begin

  with SQLQuery1 do
  begin
    sqlstr := 'select a.* from fhrd_dut_ovrdtl as a ,fhrd_dut_ovrmst as b '+
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
procedure Tformfhrd205.GetEmps;
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
procedure TFormfhrd205.N1Click(Sender: TObject);
var
  sqlstr:string;
  item:widestring;
begin
  if  tbb_search.Enabled  then
    exit;
  sqlstr := 'select a.*,b.clas_chs '+
    'from hrd_dut_seg as a,hrd_dut_class as b '+
    'where a.clas_code=b.clas_code and '+
    ' a.clas_code>=''65'' and a.clas_code<=''72'' and '+
    'a.seg_code not in '+
    '(select seg_code from fhrd_dut_ovrmst where dept_code='''+leftstr(TCB_DEPT.Text,6)+''' and '+
    'over_date='''+trim(datetostr(TEDT_DATE.date))+''')';
  with SQLQuery3 do
  begin
    close;
    sql.clear;
    sql.Add(sqlstr);
    open;
 
  end;
  paneladd.Left := 100;
  paneladd.Top := 146;
  paneladd.Show;
  privilege.Enabled := false;
  tntpanel2.Enabled :=false;
end;


procedure TFormfhrd205.N2Click(Sender: TObject);
var
  i:integer;
begin
  selectitem;
  if LV_BS.Selected<>nil then
    for i:=0 to clb_dtl.Count-1 do
    begin
      clb_dtl.Checked[i]:=true;
      if not CheckAPeriod(TEdt_date.Date,leftstr(tcb_dept.Text,6),leftStr(clb_dtl.Items[i],6),lv_bs.Selected.Caption) then
        begin
          wideshowmessage(GetLangName(ws_Words,'msg_overtime_same'));
          clb_dtl.Checked[i]:=false;
        end;
      if not CheckOvertime(leftstr(clb_dtl.Items[i],6),leftstr(tcb_dept.Text,6),LV_bs.Selected.Caption,TEDT_DATE.Date) then
      begin
          showmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_weekerror'));
          clb_dtl.Checked[i]:=false;
      end;
     // 2008-08-12 << 暫時關閉檢查加班時數
      if not CheckOvertime(leftstr(clb_dtl.Items[i],6),leftstr(tcb_dept.Text,6),LV_bs.Selected.Caption,TEDT_DATE.Date,false) then
      begin
       showmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_yearerror'));
       clb_dtl.Checked[i]:=false;
      end;
     // 2008-08-12 >>
    end;
end;

procedure TFormfhrd205.N3Click(Sender: TObject);
var
  i:integer;
begin
  selectitem;
  if LV_BS.Selected<>nil then
    for i:=0 to clb_dtl.Count-1 do
      clb_dtl.Checked[i]:=false;
end;

procedure TFormfhrd205.N4Click(Sender: TObject);
begin
  selectitem;
  if LV_BS.Selected<>nil then
    CLB_CHECK(datetostr(tedt_date.date),leftstr(tcb_dept.Text,6),LV_BS.Selected.Caption);
end;
procedure TFormfhrd205.N5Click(Sender: TObject);
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
      adoquery2.SQL.add('select * from fhrd_dut_ovrmst where over_date='''+
         trim(datetostr(tedt_date.date))+''' and dept_code='''+
         leftstr(tcb_dept.Text,6)+''' and seg_code='''+
         lv_bs.Selected.Caption+'''');
      adoquery2.open;
      commandtext := 'delete from fhrd_dut_ovrdtl where batch_no='+adoquery2.fieldbyname('batch_no').AsString;
      execute;
      commandtext := 'delete from fhrd_dut_ovrmst where batch_no='+adoquery2.fieldbyname('batch_no').AsString;
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
 function Tformfhrd205.CheckAPeriod(Adate:Tdate;Dept,EmpId,SegCode:String):boolean;
//檢查排班時間是否重復
var
  SqlStr:WideString;
  TimeBegin,TimeEnd:string;
begin
  TimeBegin:=LV_bs.Selected.SubItems.Strings[1];
  TimeEnd:=LV_bs.Selected.SubItems.Strings[2];
  with qry_stat do
  begin
    SqlStr:='select * from fhrd_dut_ovrmst a,fhrd_dut_ovrdtl b,hrd_dut_seg C'
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
 function Tformfhrd205.CheckOvertime(empid,DeptCode,Period:String;Adate:TDate;IsWeek:boolean=true):boolean;
//檢查加班是否超時
var
  StartDate,EndDate:TDate;
  SqlStr:WideString;
  OvrHours,MaxHour,ShowHour:double;
  timeBegin,timeEnd:string;
begin
  timeBegin:=LV_bs.Selected.SubItems.Strings[1];//時段開始時間
  timeEnd:=LV_bs.Selected.SubItems.Strings[2];//時段結束時間
  OvrHours:=0.0;
  if IsWeek then
  begin
    StartDate:=StartOfTheWeek(Adate);
    EndDate:=EndOfTheWeek(Adate);
    MaxHour:=12.0;

  ADOStoredProc1.ProcedureName := 'fproc_ot_year' ;
  ADOStoredProc1.Parameters.Clear ;
  ADOStoredProc1.Parameters.AddParameter.Name := 'empid';
  ADOStoredProc1.Parameters.ParamByName('empid').Value :=empid ;
  ADOStoredProc1.Parameters.AddParameter.Name := 'dates';
  ADOStoredProc1.Parameters.ParamByName('dates').Value :=FormatDateTime('yyyy/mm/dd',StartDate) ;
  ADOStoredProc1.Parameters.AddParameter.Name := 'datee';
  ADOStoredProc1.Parameters.ParamByName('datee').Value :=FormatDateTime('yyyy/mm/dd',EndDate) ;
  ADOStoredProc1.Close;
  ADOStoredProc1.Open   ;

  with ADOStoredProc1  do
       begin

         if not Eof then
            OvrHours:=OvrHours+FieldByName('ot_hour').AsFloat;
         close;
        end;
      end
  else
   begin
    StartDate:=StartOfTheYear(Adate);
    EndDate:=EndOfTheYear(Adate);
    MaxHour:=300.0;

    ADOStoredProc1.ProcedureName := 'fproc_ot_year' ;
    ADOStoredProc1.Parameters.Clear ;
    ADOStoredProc1.Parameters.AddParameter.Name := 'empid';
    ADOStoredProc1.Parameters.ParamByName('empid').Value :=empid ;
    ADOStoredProc1.Parameters.AddParameter.Name := 'dates';
    ADOStoredProc1.Parameters.ParamByName('dates').Value :=FormatDateTime('yyyy/',StartDate)+'01/01' ;
    ADOStoredProc1.Parameters.AddParameter.Name := 'datee';
    ADOStoredProc1.Parameters.ParamByName('datee').Value :=FormatDateTime('yyyy/',StartDate) + '12/31' ;
    //  with DMHrdsys.SQLQuery2 do

    with ADOStoredProc1   do
      begin
        close;

        open;
        if not Eof then
          OvrHours:=OvrHours+FieldByName('ot_hour').AsFloat;
      end;
      StartDate:=StartOfAMonth(YearOf(Adate),MonthOf(Adate));
 //   end;
    //showmessage(datetostr(StartDate)+DatetoStr(EndDate));
  end;

    if RunMode='2' then//檢查模式
      ShowHour:=min(OvrHours,MaxHour);
    SetStatusText(GetLangName(ws_Words,'emp_id')+empid+GetLangName(ws_Words,'msg_year_over')+floattostr(ShowHour));
    if OvrHours>MaxHour then//超時
    begin
      result:=false;
    end
    else//未超
    begin
      result:=true;
    end;

end;

procedure TFormfhrd205.sb_AddClick(Sender: TObject);
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
        sqlstr := 'insert into fhrd_dut_ovrmst(upd_user,dept_code,over_date,seg_code)'+
                  ' values('''+UserName+''','''+dept_code+''','''+over_date+''','''+seg_code+''')';
        DMHRDSYS.ADOCommand1.commandtext := sqlstr;
        DMHRDSYS.ADOCommand1.execute;
      end;
    end;
  end;

  with adoquery1 do
  begin
    sql.Clear;
    sqlstr := 'select a.*,b.clas_code,b.s_start,b.s_end,c.clas_chs '
      +' from fhrd_dut_ovrmst as a ,hrd_dut_seg as b,hrd_dut_class as c '+
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

procedure TFormfhrd205.sb_CloseClick(Sender: TObject);
begin
    //lb_add.Clear;
  sqlQuery3.Close;
  paneladd.Hide;
  privilege.Enabled:=true;
  tntpanel2.Enabled :=true;
end;

procedure TFormfhrd205.CLB_dtlClickCheck(Sender: TObject);
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
        if not CheckOvertime(emp_id,dept_code,seg_code,TEDT_DATE.Date,false) then
        begin//年加班超時
          wideshowmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_yearerror'));
          clb_dtl.Checked[i]:=false;
          Exit;
        end;
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
end.
