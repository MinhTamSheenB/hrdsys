unit UnitDut04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, TntComCtrls, StdCtrls, TntStdCtrls, ExtCtrls,DateUtils,
  TntExtCtrls, Grids, DBGrids, TntDBGrids, CheckLst, TntCheckLst, Buttons,
  TntButtons,StrUtils, DB, ADODB,WSDLIntf,TntDialogs;

type
  TFormDut04 = class(TForm)
    TntPanel1: TTntPanel;
    qry_temp: TADOQuery;
    qry_EmpSeg: TADOQuery;
    ds_EmpSeg: TDataSource;
    qry_SegDtl: TADOQuery;
    ds_SegDtl: TDataSource;
    TntPageControl1: TTntPageControl;
    TntTabSheet1: TTntTabSheet;
    gb_input2: TTntGroupBox;
    TntLabel2: TTntLabel;
    TntLabel3: TTntLabel;
    tp_StpDate2: TTntDateTimePicker;
    cob_StpType2: TTntComboBox;
    BBtn_Confirm2: TTntBitBtn;
    BBtn_Ret2: TTntBitBtn;
    rb_ByEmp2: TTntRadioButton;
    EditEmpId2: TTntEdit;
    rb_ByDept2: TTntRadioButton;
    cob_DeptBeg2: TTntComboBox;
    cob_DeptEnd2: TTntComboBox;
    gb_StpInfo: TTntGroupBox;
    dgd_EmpSeg: TTntDBGrid;
    TntPanel2: TTntPanel;
    BBtn_Close2: TTntBitBtn;
    BBtn_Print: TTntBitBtn;
    gb_SegDtl: TTntGroupBox;
    dgd_SegDtl: TTntDBGrid;
    TntTabSheet2: TTntTabSheet;
    gb_input1: TTntGroupBox;
    TntLabel4: TTntLabel;
    TntLabel5: TTntLabel;
    tp_StpDate: TTntDateTimePicker;
    cob_StpType: TTntComboBox;
    BBtn_Confirm: TTntBitBtn;
    BBtn_Ret: TTntBitBtn;
    rb_ByEmp: TTntRadioButton;
    EditEmpId: TTntEdit;
    rb_ByDept: TTntRadioButton;
    cob_DeptBeg: TTntComboBox;
    cob_DeptEnd: TTntComboBox;
    TntPanel5: TTntPanel;
    BBtn_Save: TTntBitBtn;
    BBtn_Close: TTntBitBtn;
    TntPanel8: TTntPanel;
    gb_emp: TTntGroupBox;
    TntPanel4: TTntPanel;
    BBtn_All: TTntBitBtn;
    BBtn_NotAll: TTntBitBtn;
    TntPanel6: TTntPanel;
    clb_Emp: TTntCheckListBox;
    gb_StpSeg: TTntGroupBox;
    clb_Seg: TTntCheckListBox;
    sb_Emp1: TTntSpeedButton;
    sb_Emp2: TTntSpeedButton;
    qry_pub: TADOQuery;
    procedure BBtn_ConfirmClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cob_DeptBegChange(Sender: TObject);
    procedure BBtn_AllClick(Sender: TObject);
    procedure BBtn_NotAllClick(Sender: TObject);
    procedure rb_ByEmpClick(Sender: TObject);
    procedure rb_ByDeptClick(Sender: TObject);
    procedure BBtn_RetClick(Sender: TObject);
    procedure BBtn_SaveClick(Sender: TObject);
    procedure clb_EmpClick(Sender: TObject);
    procedure BBtn_CloseClick(Sender: TObject);
    procedure BBtn_Confirm2Click(Sender: TObject);
    procedure BBtn_Ret2Click(Sender: TObject);
    procedure cob_DeptBeg2Change(Sender: TObject);
    procedure qry_EmpSegAfterScroll(DataSet: TDataSet);
    procedure rb_ByEmp2Click(Sender: TObject);
    procedure rb_ByDept2Click(Sender: TObject);
    procedure dgd_EmpSegTitleClick(Column: TColumn);
    procedure sb_Emp1Click(Sender: TObject);
    procedure sb_Emp2Click(Sender: TObject);
    procedure BBtn_PrintClick(Sender: TObject);
    procedure clb_SegClickCheck(Sender: TObject);
    procedure clb_EmpClickCheck(Sender: TObject);
    //
    procedure GetEmpSeg;
    procedure GetStpSeg;
    procedure GetSegDetail;
    procedure SetDefEnabled(aValue:boolean);
    procedure SetDefEnabled2(aValue:boolean);
    procedure InitLangInfo;
    Procedure CheckPeriod(SegCode:string;pos:integer;IsSegClick:boolean);    
    procedure GetStat;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut04: TFormDut04;
  PrvAdd,PrvDel:boolean;
  ws_Words:TWideStrings;
  
  
implementation
uses
  UnitDMHrdsys,UnitHrdUtils;
{$R *.dfm}
{===============================================================================
  InitLangInfo
  ��l�ƻy���H��
===============================================================================}
procedure TFormDut04.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  //�w�q�n�Ψ쪺�y��
  ThisFormUsedWords:='dut04_titl,query,weihu,search_condition,stpwrk_type,dut02_with_emp,'+
    'dut02_with_dept,fld_stp_date,stpwrk_info,seg_detail,ok,reset,print,close,save,'+
    'select_all,unselect_all,choose_emp,stpwrk_seg,fld_emp_id,fld_emp_name,fld_dept_code,'+
    'fld_seg_code,fld_clas_code,fld_clas_name,fld_s_start,fld_s_end,dut04_no_stpwrk_type,'+
    'not_find_data,save_success,stp_work_print,dut04_one_period,'+
    'half_sal_stp,no_sal_stp,full_sal_stp,peoplesum,stopwork,msg_month_data_locked';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
  //GetLangName(ws_Words,'')
  TntPanel1.Caption:=GetLangName(ws_Words,'dut04_titl');
  TntTabSheet1.Caption:=GetLangName(ws_Words,'query');
  TntTabSheet2.Caption:=GetLangName(ws_Words,'weihu');
  gb_input1.Caption:=GetLangName(ws_Words,'search_condition');
  gb_input2.Caption:=GetLangName(ws_Words,'search_condition');
  gb_StpInfo.Caption:=GetLangName(ws_Words,'stpwrk_info');
  gb_SegDtl.Caption:=GetLangName(ws_Words,'seg_detail');
  gb_Emp.Caption:=GetLangName(ws_Words,'choose_emp');
  gb_StpSeg.Caption:=GetLangName(ws_Words,'stpwrk_seg');
  TntLabel2.Caption:=GetLangName(ws_Words,'fld_stp_date')+'�G';
  TntLabel3.Caption:=GetLangName(ws_Words,'stpwrk_type')+'�G';
  TntLabel4.Caption:=GetLangName(ws_Words,'fld_stp_date')+'�G';
  TntLabel5.Caption:=GetLangName(ws_Words,'stpwrk_type')+'�G';
  rb_ByEmp.Caption:=GetLangName(ws_Words,'dut02_with_emp')+'�G';
  rb_ByEmp2.Caption:=GetLangName(ws_Words,'dut02_with_emp')+'�G';
  rb_ByDept.Caption:=GetLangName(ws_Words,'dut02_with_dept')+'�G';
  rb_ByDept2.Caption:=GetLangName(ws_Words,'dut02_with_dept')+'�G';
  BBtn_Confirm.Caption:=GetLangName(ws_Words,'ok');
  BBtn_Confirm2.Caption:=GetLangName(ws_Words,'ok');
  BBtn_Ret.Caption:=GetLangName(ws_Words,'reset');
  BBtn_Ret2.Caption:=GetLangName(ws_Words,'reset');
  BBtn_Print.Caption:=GetLangName(ws_Words,'print');
  BBtn_Save.Caption:=GetLangName(ws_Words,'save');
  BBtn_Close.Caption:=GetLangName(ws_Words,'close');
  BBtn_Close2.Caption:=GetLangName(ws_Words,'close');
  BBtn_All.Caption:=GetLangName(ws_Words,'select_all');
  BBtn_NotAll.Caption:=GetLangName(ws_Words,'unselect_all');
  dgd_EmpSeg.Columns[0].Title.Caption:=GetLangName(ws_Words,'fld_emp_id');
  dgd_EmpSeg.Columns[1].Title.Caption:=GetLangName(ws_Words,'fld_emp_name');
  dgd_EmpSeg.Columns[2].Title.Caption:=GetLangName(ws_Words,'fld_dept_code');
  dgd_EmpSeg.Columns[3].Title.Caption:=GetLangName(ws_Words,'stpwrk_seg');
  dgd_SegDtl.Columns[0].Title.Caption:=GetLangName(ws_Words,'fld_seg_code');
  dgd_SegDtl.Columns[1].Title.Caption:=GetLangName(ws_Words,'fld_clas_code');
  dgd_SegDtl.Columns[2].Title.Caption:=GetLangName(ws_Words,'fld_clas_name');
  dgd_SegDtl.Columns[3].Title.Caption:=GetLangName(ws_Words,'fld_s_start');
  dgd_SegDtl.Columns[4].Title.Caption:=GetLangName(ws_Words,'fld_s_end');
end;
{===============================================================================
  �L�{�W��: FormCreate
  �L�{�\��: ��l��
===============================================================================}
procedure TFormDut04.FormCreate(Sender: TObject);
const
  FORM_ID='dut04';
var
  DeptAbbr:string;
  PrvArr:TPrvArr;
begin
  //��l��,���Τ��ӵe���֦����v��
  PrvArr:=GetPrvArr(UserName,FORM_ID);
  if (not PrvArr[ADD]) and (not PrvArr[ADD]) and (not PrvArr[UPD]) then
    TntTabSheet2.TabVisible:=false;  //���@
  if not PrvArr[INQ] then
    TntTabSheet1.TabVisible:=false;  //�d��
  //��l�ƻy���H��
  InitLangInfo;
{  //��l�ƤU�Ե��
  if UserLang='C' then
    DeptAbbr:='abbr_titl'
  else if UserLang='V' then
    DeptAbbr:='vim_titl'
  else
    DeptAbbr:='eng_titl';
  SetComboxList('select dept_code+''-''+'+DeptAbbr+',dept_code from hrd_dept',cob_DeptBeg);
  SetComboxList('select dept_code+''-''+'+DeptAbbr+',dept_code from hrd_dept',cob_DeptEnd);
  SetComboxList('select dept_code+''-''+'+DeptAbbr+',dept_code from hrd_dept',cob_DeptBeg2);
  SetComboxList('select dept_code+''-''+'+DeptAbbr+',dept_code from hrd_dept',cob_DeptEnd2);}
  GetDeptRange(cob_DeptBeg);
  GetDeptRange(cob_DeptEnd);
  GetDeptRange(cob_DeptBeg2);
  GetDeptRange(cob_DeptEnd2);
  //��l�Ƥ��
  tp_StpDate.Date:=DateOf(now);
  tp_StpDate2.Date:=DateOf(now);
  //��l�ƪ��󪬺A
  SetDefEnabled(true);
  SetDefEnabled2(true);
end;

procedure TFormDut04.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  setStatusText('');
  SetProcessBar;
end;
{===============================================================================
  �L�{�W��: GetStpSeg
  �L�{�\��: ���o�������u�������ɬq�H���]���@�^
===============================================================================}
procedure TFormDut04.GetStpSeg;
var
  StpClas,aSQL:String;
begin
  if LeftStr(cob_StpType.Text,1)='A' then
    StpClas:='64'  //���u����
  else if LeftStr(cob_StpType.Text,1)='B' then
    StpClas:='44'  //���u���b
  else
    StpClas:='54'; //���u����
  aSQL:='SELECT a.*,b.clas_chs FROM hrd_dut_seg AS a,hrd_dut_class AS b '+
    'WHERE a.clas_code=b.clas_code and b.clas_code='''+StpClas+'''';
  with qry_temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    if EOF then
    begin
      //WideMessageDlg('�S���z��ܪ����u���O�I',mtError,[mbYes],0);
      WideMessageDlg(GetLangName(ws_Words,'dut04_no_stpwrk_type'),mtError,[mbYes],0);
      abort;
    end;
    clb_seg.Clear;
    while not Eof do
    begin
      clb_seg.Items.Add(FieldByName('seg_code').Value+' -- '+FieldByName('clas_chs').Value+
        '( '+FieldByName('s_start').Value+' -- '+FieldByName('s_end').Value+' )');
      Next;
    end;
  end;
end;
{===============================================================================
  �L�{�W��: GetEmpSeg
  �L�{�\��: ���o��J�d�򤺪����u�]���@�^
===============================================================================}
procedure TFormDut04.GetEmpSeg;
var
  aSQL,OtherClas:string;
begin
  if LeftStr(cob_StpType.Text,1)='A' then
    OtherClas:='64'//'(''44'',''54'')'  //���u����(64)
  else if LeftStr(cob_StpType.Text,1)='B' then
    OtherClas:='44'//'(''54'',''64'')'  //���u���b(44)
  else
    OtherClas:='54';//'(''44'',''64'')'; //���u����(54)
  if rb_ByEmp.Checked then
    aSQL:='SELECT emp_id,emp_chs FROM hrd_emp WHERE '
     +'emp_id='''+EditEmpId.Text+''' AND epledt IS NULL  '  // and '+UserDeptStr
  else if rb_ByDept.Checked then
    aSQL:='SELECT emp_id,emp_chs FROM hrd_emp WHERE  epledt IS NULL '
     +' AND dept_code>='''+LeftStr(cob_DeptBeg.Text,6)+''''
     +' AND dept_code<='''+LeftStr(cob_DeptEnd.Text,6)+'''';
  aSQL:=aSQL+' and emp_id not in(select emp_id from hrd_dut_stpwrk A,'
    +' hrd_dut_seg B where Left(A.wrk_segs,2)=B.seg_code '
    +' and A.stp_date='''+FormatDateTime('yyyy/mm/dd',tp_StpDate.Date)+''''
    +' and B.clas_code <> '+OtherClas+')';
  {aSQL:=aSQL+' and emp_id not in(select emp_id from hrd_dut_stpwrk '
    +' and stp_date='''+FormatDateTime('yyyy/mm/dd',tp_StpDate.Date)+''''
    +' and wrk_segs not in '+OtherClas+')';}
  aSQL:=aSQL+' ORDER BY emp_id';
  with qry_temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    if EOF then
    begin
      //WideMessageDlg('�ӽd�򤺨S�����u�s�b�I',mtError,[mbYes],0);
      WideMessageDlg(GetLangName(ws_Words,'not_find_data'),mtError,[mbYes],0);
      abort;
    end;
    clb_Emp.Clear;
    while not EOF do
    begin
      clb_Emp.Items.Add(FieldByName('emp_id').Value+' -- '+FieldByName('emp_chs').Value);
      Next;
    end;
  end;
end;
{===============================================================================
  �L�{�W��: SetDefEnabled
  �L�{�\��: �]�m���s���A�]���@�^
===============================================================================}
procedure TFormDut04.SetDefEnabled(aValue:boolean);
begin
  cob_StpType.Enabled:=aValue;
  tp_StpDate.Enabled:=aValue;
  rb_ByEmp.Enabled:=aValue;
  rb_ByDept.Enabled:=aValue;
  if rb_ByEmp.Checked then
  begin
    EditEmpId.Enabled:=aValue;
    sb_Emp1.Enabled:=aValue;
  end
  else begin
    cob_DeptBeg.Enabled:=aValue;
    cob_DeptEnd.Enabled:=aValue;
  end;
  BBtn_Confirm.Enabled:=aValue;
  BBtn_All.Enabled:=not aValue;
  BBtn_NotAll.Enabled:=not aValue;
  BBtn_Save.Enabled:=not aValue;
end;
{===============================================================================
  �L�{�W��: SetDefEnabled2
  �L�{�\��: �]�m���s���A�]�d�ߡ^
===============================================================================}
procedure TFormDut04.SetDefEnabled2(aValue:boolean);
begin
  cob_StpType2.Enabled:=aValue;
  tp_StpDate2.Enabled:=aValue;
  rb_ByEmp2.Enabled:=aValue;
  rb_ByDept2.Enabled:=aValue;
  if rb_ByEmp2.Checked then
  begin
    EditEmpId2.Enabled:=aValue;
    sb_Emp2.Enabled:=aValue;
  end
  else begin
    cob_DeptBeg2.Enabled:=aValue;
    cob_DeptEnd2.Enabled:=aValue;
  end;
  BBtn_Confirm2.Enabled:=aValue;
  BBtn_Print.Enabled:=not aValue;
end;
{===============================================================================
    cob_DeptBegChange
===============================================================================}
procedure TFormDut04.cob_DeptBegChange(Sender: TObject);
begin
  //�]�m���������O�}�l�����@�P
  SetComboxIndex(cob_DeptEnd,LeftStr(cob_DeptBeg.Text,6));
end;
{===============================================================================
    cob_DeptBeg2Change
===============================================================================}
procedure TFormDut04.cob_DeptBeg2Change(Sender: TObject);
begin
  //�]�m���������O�}�l�����@�P
  SetComboxIndex(cob_DeptEnd2,LeftStr(cob_DeptBeg2.Text,6));
end;
{===============================================================================
  BBtn_AllClick
  ����]���@�^
===============================================================================}
procedure TFormDut04.BBtn_AllClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to clb_Emp.Items.Count-1 do
  begin
    clb_Emp.Checked[i]:=true;
  end;
  clb_EmpClickCheck(Sender);
end;
{===============================================================================
  ������]���@�^
===============================================================================}
procedure TFormDut04.BBtn_NotAllClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to clb_Emp.Items.Count-1 do
  begin
    clb_Emp.Checked[i]:=false;
  end;
end;
{===============================================================================
   rb_ByEmpClick
   �����u�d��
===============================================================================}
procedure TFormDut04.rb_ByEmpClick(Sender: TObject);
begin
  EditEmpId.Enabled:=true;
  sb_Emp1.Enabled:=true;
  cob_DeptBeg.Enabled:=false;
  cob_DeptEnd.Enabled:=false;
end;
{===============================================================================
   rb_ByDeptClick
   �������d��
===============================================================================}
procedure TFormDut04.rb_ByDeptClick(Sender: TObject);
begin
  EditEmpId.Enabled:=false;
  sb_Emp1.Enabled:=false;
  cob_DeptBeg.Enabled:=true;
  cob_DeptEnd.Enabled:=true;
end;
{===============================================================================
  BBtn_ConfirmClick
  �T�w�d�ߡ]���@�^
===============================================================================}
procedure TFormDut04.BBtn_ConfirmClick(Sender: TObject);
begin
  if rb_byemp.Checked then
  with DMhrdsys.sqlquery2 do
  begin
    sql.clear;
    //sql.add('select * from hrd_emp where emp_id='''+EditEmpid.Text+''' and '+UserDeptStr);
     sql.add('select * from hrd_emp where emp_id='''+EditEmpid.Text+''' ');
    open;
    if eof then
    begin
      wideshowmessage('�A�L�v�ާ@�Ӥu���I');
      close;
      exit;
    end;
    close;
  end;
  //�o����u���
  GetEmpSeg;
  //�o�찱�u�ɬq
  GetStpSeg;
  SetDefEnabled(false);
  GetStat;
end;
{===============================================================================
  BBtn_RetClick
  ���]�d�ߡ]���@�^
===============================================================================}
procedure TFormDut04.BBtn_RetClick(Sender: TObject);
begin
  SetDefEnabled(true);
  clb_Emp.Clear;
  clb_Seg.Clear;
  SetStatusText('');
end;
{===============================================================================
  BBtn_ConfirmClick2
  �T�w�d�ߡ]�d�ߡ^
===============================================================================}
procedure TFormDut04.BBtn_Confirm2Click(Sender: TObject);
var
  aSQL:String;
begin

  aSQL:='SELECT a.emp_id,a.emp_chs,a.dept_code+''-''+c.abbr_titl as dept_name,b.wrk_segs FROM hrd_emp a,hrd_dut_stpwrk b ,hrd_dept c '+
    ' WHERE a.emp_id=b.emp_id AND a.dept_code=c.dept_code AND a.epledt IS NULL AND b.stp_date='''+
    FormatDateTime('yyyy/mm/dd',tp_StpDate2.Date)+'''';
  if rb_ByEmp2.Checked then
  begin
    with DMhrdsys.sqlquery2 do
    begin
      sql.clear;
    //  sql.add('select * from hrd_emp where emp_id='''+EditEmpid2.Text+''' and '+UserDeptStr);
       sql.add('select * from hrd_emp where emp_id='''+EditEmpid2.Text+'''');
      open;
      if eof then
      begin
        wideshowmessage('�A�L�v�ާ@�Ӥu���I');
        close;
        exit;
      end;
      close;
    end;
    aSQL:=aSQL+' AND a.emp_id='''+EditEmpId2.Text+'''';
  end
  else if rb_ByDept2.Checked then
    aSQL:=aSQL+' AND a.dept_code>='''+LeftStr(cob_DeptBeg2.Text,6)+''' AND a.dept_code<='''+LeftStr(cob_DeptEnd2.Text,6)+'''';
    
  with qry_EmpSeg do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    if EOF then
    begin
      //WideMessageDlg('�ӽd�򤺨S�����u�s�b�I',mtError,[mbYes],0);
      WideMessageDlg(GetLangName(ws_Words,'not_find_data'),mtError,[mbYes],0);
      abort;
    end;
  end;
  SetDefEnabled2(false);
  GetStat;
end;
{===============================================================================
  GetSegDetail
  �o��������u�����u�ɬq�H���]�d�ߡ^
===============================================================================}
procedure TFormDut04.GetSegDetail;
var
  SegStr,aSQL:String;
begin
  SegStr:='''''';
  if not qry_EmpSeg.Eof then
  begin
    if trim(MidStr(qry_EmpSeg.FieldByName('wrk_segs').AsString,1,2))<>'' then
      SegStr:=SegStr+','''+trim(MidStr(qry_EmpSeg.FieldByName('wrk_segs').AsString,1,2))+'''';
    if trim(MidStr(qry_EmpSeg.FieldByName('wrk_segs').AsString,3,2))<>'' then
      SegStr:=SegStr+','''+trim(MidStr(qry_EmpSeg.FieldByName('wrk_segs').AsString,3,2))+'''';
    if trim(MidStr(qry_EmpSeg.FieldByName('wrk_segs').AsString,5,2))<>'' then
      SegStr:=SegStr+','''+trim(MidStr(qry_EmpSeg.FieldByName('wrk_segs').AsString,5,2))+'''';
    if trim(MidStr(qry_EmpSeg.FieldByName('wrk_segs').AsString,7,2))<>'' then
      SegStr:=SegStr+','''+trim(MidStr(qry_EmpSeg.FieldByName('wrk_segs').AsString,7,2))+'''';
  end;
  aSQL:='SELECT a.seg_code,a.clas_code,b.clas_chs,a.s_start,a.s_end FROM  hrd_dut_seg a,hrd_dut_class b'+
    ' WHERE a.clas_code=b.clas_code and a. seg_code in ('+SegStr+')';
  With qry_SegDtl do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
  end;
end;
{===============================================================================
  BBtn_Ret2Click
  ���]�d�ߡ]�d�ߡ^
===============================================================================}
procedure TFormDut04.BBtn_Ret2Click(Sender: TObject);
begin
  SetDefEnabled2(true);
  qry_EmpSeg.Close;
  qry_SegDtl.Close;
  SetStatusText('');
end;
{===============================================================================
  BBtn_SaveClick
  �O�s���G�]���@�^
===============================================================================}
procedure TFormDut04.BBtn_SaveClick(Sender: TObject);
var
  i:Integer;
  aSQL,SegStr:String;
  CurDateTime:TDateTime;
begin
  //�Ӥ��Ƥw�g��w
  if ((FormatDateTime('yyyymm',tp_StpDate.Date))<=LockMonthPart) and (UserName<>DebugUser) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_month_data_locked'),mtError,[mbYes],0);
    exit;
  end;
  CurDateTime:=GetServerDateTime;
  for i:=0 to clb_Seg.Items.Count-1 do
  begin
    if clb_Seg.Checked[i] then
    SegStr:=SegStr+LeftStr(clb_Seg.Items.Strings[i],2);
  end;
  for i:=0 to clb_Emp.Items.Count-1 do
  begin
    if clb_Emp.Checked[i] then
    begin
      aSQL:='SELECT * FROM hrd_dut_stpwrk WHERE emp_id='''+LeftStr(clb_Emp.Items.Strings[i],6)+
        ''' AND stp_date='''+FormatDateTime('yyyy/mm/dd',tp_StpDate.Date)+'''';
      with qry_Temp do
      begin
        Close;
        SQL.Clear;
        SQL.Add(aSQL);
        Open;
        if not Eof then
        begin
          if Trim(SegStr)='' then
            Delete
          else
          begin
            Edit;
            FieldByName('upd_user').Value:=UserName;
            FieldByName('upd_date').Value:=CurDateTime;
            FieldByName('wrk_segs').Value:=SegStr;
            Post;
          end;
        end
        else
        begin
          if Trim(SegStr)<>'' then
          begin
            Append;
            FieldByName('upd_user').Value:=UserName;
            FieldByName('upd_date').Value:=CurDateTime;
            FieldByName('emp_id').Value:=LeftStr(clb_Emp.Items.Strings[i],6);
            FieldByName('stp_date').AsDateTime:=DateOf(tp_StpDate.Date);
            //showmessage(LeftStr(clb_Emp.Items.Strings[i],6)+DateToStr(DateOf(CurDateTime)));
            FieldByName('wrk_segs').Value:=SegStr;
            Post;
          end;//if
        end;//else
      end;//with
    end;//if checked
  end;//for
  //WideMessageDlg('�O�s���\!',mtInformation,[mbYes],0);
  WideMessageDlg(GetLangName(ws_Words,'save_success'),mtInformation,[mbYes],0);
  GetStat;
end;
{===============================================================================
   clb_EmpClick
   �]�m�������u�����u�ɬq���
===============================================================================}
procedure TFormDut04.clb_EmpClick(Sender: TObject);
var
  aSQL:String;
  i:Integer;
  sl_Segs:TStringList;
begin
  sl_Segs:=TStringList.Create;
  aSQL:='SELECT * FROM hrd_dut_stpwrk WHERE emp_id='''+LeftStr(clb_Emp.Items.Strings[clb_Emp.ItemIndex],6)+
    ''' AND stp_date='''+FormatDateTime('yyyy/mm/dd',tp_StpDate.Date)+'''';
  with qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    if not EOF then
    begin
      if trim(MidStr(FieldByName('wrk_segs').AsString,1,2))<>'' then
        sl_Segs.Add(MidStr(FieldByName('wrk_segs').AsString,1,2));
      if trim(MidStr(FieldByName('wrk_segs').AsString,3,2))<>'' then
        sl_Segs.Add(MidStr(FieldByName('wrk_segs').AsString,3,2));
      if trim(MidStr(FieldByName('wrk_segs').AsString,5,2))<>'' then
        sl_Segs.Add(MidStr(FieldByName('wrk_segs').AsString,5,2));
      if trim(MidStr(FieldByName('wrk_segs').AsString,7,2))<>'' then
        sl_Segs.Add(MidStr(FieldByName('wrk_segs').AsString,7,2));
    end;
    Close;
  end;
  for i:=0 to clb_Seg.Items.Count-1 do
  begin
    if sl_Segs.IndexOf(LeftStr(clb_Seg.Items.Strings[i],2))<>-1 then
      clb_Seg.Checked[i]:=true
    else
      clb_Seg.Checked[i]:=false;
  end;
  sl_Segs.Free;
end;
{===============================================================================
  close
  �����{��
===============================================================================}
procedure TFormDut04.BBtn_CloseClick(Sender: TObject);
begin
  SetDefEnabled(true);
  SetDefEnabled2(true);
  qry_EmpSeg.Close;
  qry_SegDtl.Close;
  clb_Emp.Clear;
  clb_Seg.Clear;
  TForm(TntPanel1.Parent).Close;
end;

procedure TFormDut04.qry_EmpSegAfterScroll(DataSet: TDataSet);
begin
  if not qry_EmpSeg.Eof then
    GetSegDetail; 
end;

procedure TFormDut04.rb_ByEmp2Click(Sender: TObject);
begin
  EditEmpId2.Enabled:=true;
  sb_Emp2.Enabled:=true;
  cob_DeptBeg2.Enabled:=false;
  cob_DeptEnd2.Enabled:=false;
end;

procedure TFormDut04.rb_ByDept2Click(Sender: TObject);
begin
  EditEmpId2.Enabled:=false;
  sb_Emp2.Enabled:=false;
  cob_DeptBeg2.Enabled:=true;
  cob_DeptEnd2.Enabled:=true;
end;

procedure TFormDut04.dgd_EmpSegTitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;

procedure TFormDut04.sb_Emp1Click(Sender: TObject);
var
  aEmpId:String;
begin
  aEmpId:=FindEmpId('emp_id');
  if aEmpId<>'' then
    EditEmpId.Text:=aEmpId;
end;

procedure TFormDut04.sb_Emp2Click(Sender: TObject);
var
  aEmpId:String;
begin
  aEmpId:=FindEmpId('emp_id');
  if aEmpId<>'' then
    EditEmpId2.Text:=aEmpId;
end;

procedure TFormDut04.BBtn_PrintClick(Sender: TObject);
var
  aStr:String;
begin
  if rb_ByEmp2.Checked then
    aStr:=GetLangName(ws_Words,'fld_emp_id')+':'+EditEmpId2.Text+'  '
  else
    aStr:=GetLangName(ws_Words,'fld_dept_code')+':'+cob_DeptBeg2.Text+' -- '+cob_DeptEnd2.Text;
  showPrint(qry_EmpSeg,GetLangName(ws_Words,'stp_work_print')+';;<left>'+GetLangName(ws_Words,'fld_stp_date')+':'+
    FormatDateTime('yyyy/mm/dd',tp_StpDate2.DateTime)+aStr);
end;

procedure TFormDut04.clb_SegClickCheck(Sender: TObject);
var
  i,j,cou,pos:integer;
  SegCode:String;
begin
{  cou:=0;
  for i:=0 to clb_seg.Items.Count-1 do
  begin
    if clb_seg.Checked[i]=true then
    begin
      inc(cou);
      SegCode:=leftstr(clb_seg.Items[i],2);
      pos:=i;
    end;  
  end;
  if cou>1 then
  begin
    for i:=0 to clb_seg.Items.Count-1 do
      clb_seg.Checked[i]:=false;
    wideShowmessage(GetLangName(ws_words,'dut04_one_period'));
  end
  else
  begin
    if cou=0 then
      exit;
    CheckPeriod(SegCode,pos,true);
  end;}
end;

Procedure TformDut04.CheckPeriod(SegCode:string;pos:integer;IsSegClick:boolean);
var
  SqlStr,empstr,SegStr:wideString;
  i,j:integer;
  flag:boolean;
begin
  flag:=false;
  for i:=0 to clb_seg.Items.Count-1 do
  begin
    if clb_seg.Checked[i] then
    begin
      SqlStr:='select * from hrd_dut_stpwrk where stp_date='''+DateTimeToStr(tp_StpDate.date)+''' ';
      EmpStr:='';
      for j:=0 to clb_emp.Items.Count-1 do
      begin
        if clb_emp.Checked[j] then
        begin
          EmpStr:=EmpStr+''''+leftstr(clb_emp.Items[j],6)+''',';
        end;
      end;
      if EmpStr<>'' then
        SqlStr:=SqlStr+' and emp_id in ('+leftstr(EmpStr,Length(EmpStr)-1)+')'
      else
        exit;
      with qry_pub do
      begin
        sql.Clear;
        sql.Add(SqlStr);
        Open;
        while not Eof do
        begin
          SegStr:=trim(fieldbyname('wrk_segs').AsString);
          if not AnsiContainsText(SegStr,SegCode) then
          begin
            if IsSegClick then
              clb_Seg.Checked[pos]:=false
            else
            begin
              for j:=0 to clb_emp.Items.Count do
              begin
                if clb_emp.Checked[j] then
                begin
                  if leftstr(clb_emp.Items[j],6)=fieldbyname('emp_id').asstring then
                    clb_emp.Checked[j]:=false;
                  break;
                end;
              end;
            end;
            flag:=true;
          end;
          next;
        end;
        Close;
      end;
      break;
    end;
  end;
  if flag then
    wideshowmessage(GetLangName(ws_words,'dut04_one_period'));
end;

procedure TFormDut04.clb_EmpClickCheck(Sender: TObject);
var
 i,cou,pos:integer;
 SegCode:String;
 flag:boolean;
begin
{  flag:=false;
  cou:=0;
  for i:=0 to clb_seg.Items.Count-1 do
  begin
    if clb_seg.Checked[i]=true then
    begin
      inc(cou);
      SegCode:=leftstr(clb_seg.Items[i],2);
      pos:=i;
    end;
  end;
  if cou>1 then
  begin
    for i:=0 to clb_seg.Items.Count-1 do
      clb_seg.Checked[i]:=false;
    flag:=true;
    //wideShowmessage(GetLangName(ws_words,'dut04_one_period'));
  end
  else
  begin
    if cou=0 then
      exit;
    CheckPeriod(SegCode,pos,false);
  end;
  if flag then
    wideShowmessage(GetLangName(ws_words,'dut04_one_period'));}
end;

procedure TformDut04.GetStat;
var
  totNum,StpNum,Pnum,Snum,Tnum:integer;
  SqlStr:WideString;
  Adate:TDate;
  SegStr:String;
begin
  if TntPageControl1.ActivePageIndex=0 then
  begin
    ADate:=tp_stpDate2.Date;
    if rb_ByEmp2.Checked then     //�u���@�ӭ��u
    begin
      totNum:=1;
      SqlStr:='';
    end
    else    //�h���u
    begin
      SqlStr:='select emp_id from hrd_emp where epledt is null and dept_code>='''+
              leftstr(cob_deptbeg2.Text,6)+''' and dept_code<='''+
              leftstr(cob_deptend2.Text,6)+'''';
    end;
  end
  else
  begin
    ADate:=tp_stpDate.Date;
    if rb_ByEmp.Checked then     //�u���@�ӭ��u
    begin
      totNum:=1;
      SqlStr:='';
    end
    else    //�h���u
    begin
      SqlStr:='select emp_id from hrd_emp where epledt is null and dept_code>='''+
              leftstr(cob_deptbeg.Text,6)+''' and dept_code<='''+
              leftstr(cob_deptend.Text,6)+'''';
    end;
  end;
  with qry_pub do
  begin
    if SqlStr<>'' then
    begin
      Sql.Clear;
      Sql.Add(SqlStr);
      Open;
      totNum:=recordcount;
    end;
    close;
    Sql.Clear;
    if SqlStr='' then
      SqlStr:=EditEmpId.Text;
    Sql.Add('select * from hrd_dut_stpwrk where stp_date='''+DatetimeToStr(Adate)+''' and emp_id in('+SqlStr+')');
    Open;
    StpNum:= recordcount;
    first;
    Pnum:=0;
    Snum:=0;
    Tnum:=0;
    while not eof do
    begin
      SegStr:= fieldbyname('wrk_segs').AsString;
      if ansiContainstext(SegStr,'P') then
        inc(Pnum);
      if ansiContainstext(SegStr,'S') then
        inc(Snum);
      if ansiContainstext(SegStr,'T') then
        inc(Tnum);    
      next;
    end;
  end;
  SetStatusText(GetLangName(ws_words,'peoplesum')+':'+IntToStr(totNum)+' '+
                GetLangName(ws_words,'stopwork')+GetLangName(ws_words,'peoplesum')+':'+
                IntToStr(stpNum)+' '+
                GetLangName(ws_words,'full_sal_stp')+':'+inttostr(SNum)+GetLangName(ws_words,'men')+'  '+
                GetLangName(ws_words,'half_sal_stp')+':'+inttostr(PNum)+GetLangName(ws_words,'men')+'  '+
                GetLangName(ws_words,'no_sal_stp')+':'+inttostr(TNum)+GetLangName(ws_words,'men'));
end;


end.
