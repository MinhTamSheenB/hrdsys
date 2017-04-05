{******************************************************************************
name：fhrd402(考勤查詢)
author: tristan
create date:2005-08-24
commentate: 考勤查詢
*******************************************************************************}

unit uFhrd402;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, ExtCtrls, TntExtCtrls, Grids, DBGrids,
  TntDBGrids, Buttons, TntButtons, DBCtrls, DB,StrUtils,WSDLIntf, Mask,
  TntDbCtrls, ComCtrls,TntComCtrls, ADODB,tntDialogs, DateUtils,TntGrids,
  CheckLst, TntCheckLst;

type
  TFormfhrd402 = class(TForm)
    TntPanel1: TTntPanel;
    TntPanel2: TTntPanel;
    selArrange: TTntPageControl;
    selArr: TTntTabSheet;
    selMonDuty: TTntTabSheet;
    selHol: TTntTabSheet;
    TntGroupBox1: TTntGroupBox;
    TntGroupBox2: TTntGroupBox;
    TntGroupBox3: TTntGroupBox;
    TntGroupBox4: TTntGroupBox;
    TntGroupBox5: TTntGroupBox;
    TntGroupBox6: TTntGroupBox;
    TntLabel1: TTntLabel;
    aDeptRadio: TTntRadioButton;
    aEmpRadio: TTntRadioButton;
    aDeptBegCob: TTntComboBox;
    aDeptEndCob: TTntComboBox;
    aEmpBegId: TTntEdit;
    aEmpEndId: TTntEdit;
    aSelData: TTntBitBtn;
    aPrnData: TTntBitBtn;
    aExitSubForm: TTntBitBtn;
    arrQry: TADOQuery;
    dutyQry: TADOQuery;
    holQry: TADOQuery;
    dutyDataSource: TDataSource;
    holDataSource: TDataSource;
    holGrid: TTntDBGrid;
    TntLabel4: TTntLabel;
    dMonth: TTntEdit;
    dDeptRadio: TTntRadioButton;
    dEmpRadio: TTntRadioButton;
    dDeptBegCob: TTntComboBox;
    dEmpBegId: TTntEdit;
    dDeptEndCob: TTntComboBox;
    dEmpEndId: TTntEdit;
    dSelData: TTntBitBtn;
    dExitSubForm: TTntBitBtn;
    TntLabel7: TTntLabel;
    hDeptRadio: TTntRadioButton;
    hEmpRadio: TTntRadioButton;
    hDeptBegCob: TTntComboBox;
    hEmpBegId: TTntEdit;
    hDeptEndCob: TTntComboBox;
    hEmpEndId: TTntEdit;
    hSelData: TTntBitBtn;
    hPrnData: TTntBitBtn;
    hExitSubForm: TTntBitBtn;
    arrangeGrid: TTntStringGrid;
    dutyGrid: TTntStringGrid;
    dateBeg: TTntDateTimePicker;
    dateEnd: TTntDateTimePicker;
    aDateBeg: TTntDateTimePicker;
    aDateEnd: TTntDateTimePicker;
    dataQry: TADOQuery;
    aClsChkBox: TTntCheckBox;
    aClsCob: TTntComboBox;
    arrPrnQry: TADOQuery;

    // user create function and procedure

    procedure InitLang;
    procedure setDeptCob;
    procedure setClsCob;
    procedure fetchDutyData;

    // system create proceudre

    procedure FormCreate(Sender: TObject);
    procedure hDeptBegCobChange(Sender: TObject);
    procedure hDeptEndCobChange(Sender: TObject);
    procedure hEmpBegIdChange(Sender: TObject);
    procedure hEmpEndIdChange(Sender: TObject);
    procedure hSelDataClick(Sender: TObject);
    procedure hExitSubFormClick(Sender: TObject);
    procedure dSelDataClick(Sender: TObject);
    procedure selMonDutyShow(Sender: TObject);
    procedure dExitSubFormClick(Sender: TObject);
    procedure aExitSubFormClick(Sender: TObject);
    procedure dEmpBegIdChange(Sender: TObject);
    procedure dEmpEndIdChange(Sender: TObject);
    procedure dDeptBegCobChange(Sender: TObject);
    procedure dDeptEndCobChange(Sender: TObject);
    procedure aSelDataClick(Sender: TObject);
    procedure aEmpBegIdChange(Sender: TObject);
    procedure aEmpEndIdChange(Sender: TObject);
    procedure aDeptBegCobChange(Sender: TObject);
    procedure aDeptEndCobChange(Sender: TObject);
    procedure aClsCobChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure hPrnDataClick(Sender: TObject);
    procedure aPrnDataClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd402: TFormfhrd402;

implementation

uses
  UnitHrdUtils,unitDMHrdsys,UnitHrdMain,uFhrd402ReportH,uFhrd402ReportA;

{$R *.dfm}

{***定義全局變量***}
var
  g_sLangStr : TWideStrings;

{*****************************************
Name: InitLang
Func: 初始化語言變量
Args:
    sKeys->語言變量
*****************************************}

procedure TFormfhrd402.InitLang;
var
  sKeys : string;
begin

  sKeys:='fhrd402,emp_id,fld_department,button_query,fhrd104_condition,'+
  'print,quit,browsedata,class_code,time_count,dut03_dateerror,msg_month_null,'+
  'confirm_close,date,fld_wrk_mon,arrange_qry,mdut_qry,holiday_qry,c_name,'+
  'fld_s_ask_d,fld_e_ask_d,fld_s_ask_h,fld_e_ask_h,hol_reason,hol_type,'+
  'msg_set_cls,msg_set_dept,msg_query_error,dut05_dateerror,msg_empid_null,'+
  'msg_cho_dept,msg_no_mduty,emp_date_header';

  g_sLangStr:=GetLangWideStrs(sKeys);

  TntPanel1.Caption:=GetLangName(g_sLangStr,'fhrd402');
  aExitSubForm.Caption:=GetLangName(g_sLangStr,'quit');
  aPrnData.Caption := GetLangName(g_sLangStr,'print');
  aSelData.Caption := GetLangName(g_sLangStr,'button_query');
  dExitSubForm.Caption:=GetLangName(g_sLangStr,'quit');
  dSelData.Caption := GetLangName(g_sLangStr,'button_query');
  hExitSubForm.Caption:=GetLangName(g_sLangStr,'quit');
  hPrnData.Caption := GetLangName(g_sLangStr,'print');
  hSelData.Caption := GetLangName(g_sLangStr,'button_query');
  aEmpRadio.Caption := GetLangName(g_sLangStr,'emp_id');
  aDeptRadio.Caption := GetLangName(g_sLangStr,'fld_department');
  dEmpRadio.Caption := GetLangName(g_sLangStr,'emp_id');
  dDeptRadio.Caption := GetLangName(g_sLangStr,'fld_department');
  hEmpRadio.Caption := GetLangName(g_sLangStr,'emp_id');
  hDeptRadio.Caption := GetLangName(g_sLangStr,'fld_department');
  TntLabel1.Caption := GetLangName(g_sLangStr,'date');
  TntLabel7.Caption := GetLangName(g_sLangStr,'date');
  TntLabel4.Caption := GetLangName(g_sLangStr,'fld_wrk_mon');
  selArrange.Pages[0].Caption := GetLangName(g_sLangStr,'arrange_qry');
  selArrange.Pages[1].Caption := GetLangName(g_sLangStr,'mdut_qry');
  selArrange.Pages[2].Caption := GetLangName(g_sLangStr,'holiday_qry');

  TntGroupBox1.Caption:=GetLangName(g_sLangStr,'fhrd104_condition');
  TntGroupBox3.Caption:=GetLangName(g_sLangStr,'fhrd104_condition');
  TntGroupBox5.Caption:=GetLangName(g_sLangStr,'fhrd104_condition');
  TntGroupBox2.Caption:=GetLangName(g_sLangStr,'browsedata');
  TntGroupBox4.Caption:=GetLangName(g_sLangStr,'browsedata');
  TntGroupBox6.Caption:=GetLangName(g_sLangStr,'browsedata');

  holGrid.Columns[0].Title.caption := GetLangName(g_sLangStr,'emp_id');
  holGrid.Columns[1].Title.caption := GetLangName(g_sLangStr,'c_name');
  holGrid.Columns[2].Title.caption := GetLangName(g_sLangStr,'fld_department');
  holGrid.Columns[3].Title.caption := GetLangName(g_sLangStr,'hol_type');
  holGrid.Columns[4].Title.caption := GetLangName(g_sLangStr,'fld_s_ask_d');
  holGrid.Columns[5].Title.caption := GetLangName(g_sLangStr,'fld_e_ask_d');
  holGrid.Columns[6].Title.caption := GetLangName(g_sLangStr,'fld_s_ask_h');
  holGrid.Columns[7].Title.caption := GetLangName(g_sLangStr,'fld_e_ask_h');
  holGrid.Columns[8].Title.caption := GetLangName(g_sLangStr,'hol_reason');
end;

{*****************************************
Name: setClsCob
Func: 初始化班別資料
Args:
******************************************}

procedure TFormFhrd402.setClsCob;
begin
  try
    with DMHrdsys.SQLQuery2 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from fhrd_clsid where '+
      'cls_type='''+IntToStr(1)+''' order by cls_id');
      open;
      while Not Eof do
      begin
        aClsCob.Items.Add(FieldByName('cls_id').Value+'/'+
        FieldByName('cls_name').Value);
        next;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_set_cls'),
    mtError,[mbyes],1);
  end;
end;

{*****************************************
Name: setDeptCob
Func: 初始化部門資料
Args:
******************************************}

procedure TFormFhrd402.setDeptCob;
begin
  try
    with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from fhrd_dept order by dept_code');
      open;
      while Not Eof do
      begin
        aDeptBegCob.Items.Add(FieldByName('dept_code').Value+'/'+
        FieldByName('dept_abbr').Value);
        aDeptEndCob.Items.Add(FieldByName('dept_code').Value+'/'+
        FieldByName('dept_abbr').Value);
        dDeptBegCob.Items.Add(FieldByName('dept_code').Value+'/'+
        FieldByName('dept_abbr').Value);
        dDeptEndCob.Items.Add(FieldByName('dept_code').Value+'/'+
        FieldByName('dept_abbr').Value);
        hDeptBegCob.Items.Add(FieldByName('dept_code').Value+'/'+
        FieldByName('dept_abbr').Value);
        hDeptEndCob.Items.Add(FieldByName('dept_code').Value+'/'+
        FieldByName('dept_abbr').Value);
        next;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_set_dept'),
    mtError,[mbyes],1);
  end;
end;


procedure TFormfhrd402.FormCreate(Sender: TObject);
begin
  InitLang;
  setDeptCob;
  setClsCob;
  dateBeg.Date := Date;
  dateEnd.Date := Date;
  aDateBeg.Date := Date;
  aDateEnd.Date := Date;
  aPrnData.Enabled := false;
  hPrnData.Enabled := false;
end;

{********狀態控制********BEGIN********}

procedure TFormfhrd402.hDeptBegCobChange(Sender: TObject);
begin
  hDeptRadio.Checked := true;
  hEmpBegId.Text := '';
  hEmpEndId.Text := '';
end;

procedure TFormfhrd402.hDeptEndCobChange(Sender: TObject);
begin
  if hdeptBegCob.Text<>'' then
  begin
    hDeptRadio.Checked := true;
    hEmpBegId.Text := '';
    hEmpEndId.Text := '';
  end;
end;

procedure TFormfhrd402.hEmpBegIdChange(Sender: TObject);
begin
  if Length(hEmpBegId.Text)=6 then
  begin
    hEmpRadio.Checked := true;
    hDeptBegCob.Text := '';
    hDeptEndCob.Text := '';
  end;
end;

procedure TFormfhrd402.hEmpEndIdChange(Sender: TObject);
begin
  if (Length(hEmpEndId.Text)=6) and (hEmpEndId.Text<>'') then
  begin
    hEmpRadio.Checked := true;
    hDeptBegCob.Text := '';
    hDeptEndCob.Text := '';
  end;
end;

{*********狀態控制********END******}

{***********************************
Name: hSelDataClick
Func: 按條件查詢請假資料
Args:
    sSelStr : string->查詢語句
***********************************}

procedure TFormfhrd402.hSelDataClick(Sender: TObject);
var
  sSelStr : string;
begin

  if DateBeg.Date>DateEnd.Date then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'dut05_dateerror'),mtError,[mbyes],1);
    DateBeg.SetFocus;
    exit;
  end;

  try
    with holQry do
    begin
      close;
      sql.Clear;
      sSelStr := 'select v.emp_id,v.emp_name,v.dept_abbr,(select cls_name '+
      'from fhrd_clsid where cls_id=h.cls_id) as cls_name,'+
      'h.up_date,h.down_date,'+
      'h.up_time,h.down_time,h.hol_reason from fhrd_hol as h,vfhrdemp as v'+
      ' where h.emp_id=v.emp_id ';
      sSelStr := sSelStr+' and up_date>='''+DateToStr(dateBeg.Date)+''' and '+
        'down_date<='''+DateToStr(dateEnd.Date)+''' ';
      if hEmpRadio.Checked then
      begin
        if (hEmpBegId.Text='') or (hEmpEndId.Text='') then
        begin
          widemessagedlg(GetLangName(g_sLangStr,'msg_empid_null'),
          mtError,[mbyes],1);
          exit;
        end;
        sSelStr := sSelStr+' and h.emp_id between '''+hEmpBegId.Text+''' '+
        'and '''+hEmpEndId.Text+''' ';
      end;
      if hDeptRadio.Checked then
      begin
        if (hDeptBegCob.Text='') or (hDeptEndCob.Text='') then
        begin
          widemessagedlg(GetLangName(g_sLangStr,'msg_cho_dept'),
          mtError,[mbyes],1);
          exit;
        end;
        sSelStr := sSelStr+' and v.dept_code '+
        'between '''+LeftStr(hDeptBegCob.Text,6)+''' '+
        'and '''+LeftStr(hDeptEndCob.Text,6)+''' ';
      end;
      sSelStr := sSelStr+' order by v.emp_id ';
      sql.Add(sSelStr);
      open;
      hPrnData.Enabled := true;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_query_error'),
    mtError,[mbyes],1);
  end;
end;

procedure TFormfhrd402.hExitSubFormClick(Sender: TObject);
begin
  close;
end;

{*************************************
Name: fetchDutyData
Func: 取考勤資料
Args:
*************************************}

procedure TFormFhrd402.fetchDutyData;
var
  sYear,sMon,sBegDay,sEndDay,sDays,sFetStr : string;
  i,j,k,idays,iTimeCount,lcYear,lcMonth : integer;
begin

  if dmonth.Text='' then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_month_null'),mtError,[mbyes],1);
    dmonth.SetFocus;
    exit;
  end
  else
  begin
    if length(dmonth.Text )<>6 then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'dut03_dateerror'),mtError,[mbyes],1);
      exit;
    end;
    try
      lcYear:=StrToInt(LeftStr(dmonth.Text,4));
      lcMonth:=StrToInt(RightStr(dmonth.Text,2));
    except
      exit;
    end;
    if (lcMonth>12) or (lcMonth<1) or (lcYear>2100) or (lcYear<1900) then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'dut03_dateerror'),mtError,[mbyes],1);
      exit;
    end;
  end;

  {***處理日期***}

  sYear := LeftStr(dmonth.Text,4);
  sMon := RightStr(dmonth.Text,2);
  if LeftStr(sMon,1)='0' then
    sMon := RightStr(sMon,1);
  sDays := DateToStr(StartOfAMonth(strToInt(sYear),strToInt(sMon)));
  sBegDay := sDays;
  idays := DaysInAMonth(strToInt(sYear),strToInt(sMon));
  sEndDay := DateToStr(EndOfAMonth(strToInt(sYear),strToInt(sMon)));

  try
    with dutyQry do
    begin
      close;
      sql.Clear;
      sFetStr := 'select * from fhrd_mdut as d,fhrd_emp as e where '+
      'd.dut_mon='''+dmonth.Text+''' and d.emp_id=e.emp_id ';
      if dEmpRadio.Checked then
      begin
        if (dEmpBegId.Text='') or (dEmpEndId.Text='') then
        begin
          widemessagedlg(GetLangName(g_sLangStr,'msg_empid_null'),mtError,[mbyes],1);
          exit;
        end;
        sFetStr := sFetStr+' and d.emp_id between '''+dEmpBegId.Text+''' '+
        'and '''+dEmpEndId.Text+''' ';
      end;
      if dDeptRadio.Checked then
      begin
        if (dDeptBegCob.Text='') or (dDeptEndCob.Text='') then
        begin
          widemessagedlg(GetLangName(g_sLangStr,'msg_cho_dept'),mtError,[mbyes],1);
          exit;
        end;
        sFetStr := sFetStr+' and e.dept_code '+
        'between '''+LeftStr(dDeptBegCob.Text,6)+''' '+
        'and '''+LeftStr(dDeptEndCob.Text,6)+''' ';
      end;
      sFetStr := sFetStr+' order by d.emp_id,d.cls_id ';
      sql.Add(sFetStr);
      open;
      if RecordCount<=0 then
      begin
        widemessagedlg(GetLangName(g_sLangStr,'msg_no_mduty'),mtError,[mbyes],1);
        exit;
      end;

      {***初始化表格***}

      dutyGrid.FixedCols := 1;
      dutyGrid.FixedRows := 1;
      dutyGrid.DefaultColWidth := 19;
      dutyGrid.ColCount := idays+3;
      dutyGrid.ColWidths[0] := 94;
      dutyGrid.ColWidths[1] := 28;
      dutyGrid.ColWidths[2] := 28;
      dutyGrid.RowCount := dutyQry.RecordCount+1;
      dutyGrid.Cells[0,0]:= GetLangName(g_sLangStr,'emp_date_header');
      dutyGrid.Cells[1,0]:= GetLangName(g_sLangStr,'class_code');
      dutyGrid.Cells[2,0]:= GetLangName(g_sLangStr,'time_count');;

      For i:=1 to idays do
      begin
        if DayOfWeek(strToDate(sYear+'/'+sMon+'/'+IntToStr(i)))=1 then
        begin
          dutyGrid.Cols[i+2].Text := 'S';
          dutyGrid.ColWidths[i+2] := 15;
        end
        else
          dutyGrid.Cols[i+2].Text := IntToStr(i);
      end;

      First;
      j := 1;
      SetProcessBar(true,1,RecordCount);
      while Not Eof do
      begin
        SetProcessBar(false,1);
        with DMHrdsys.SQLQuery1 do
        begin
          close;
          sql.Clear;
          sql.Add('select emp_name from fhrd_emp where '+
          'emp_id='''+dutyQry.FieldByName('emp_id').Value+'''');
          open;
        end;

        dutyGrid.Rows[j].Text := FieldByName('emp_id').value+'/'+
        DMHrdsys.SQLQuery1.FieldValues['emp_name'];
        iTimeCount := 0;
        For K:=1 to idays do
        begin
          if VarIsNull(dutyQry.Fields.Fields[k+4].Value) then
            dutyGrid.Cells[k+2,j] := ''
          else
          begin
            dutyGrid.Cells[k+2,j]:=dutyQry.Fields.Fields[k+4].Value;
            iTimeCount :=
            iTimeCount+StrToInt(trim(dutyQry.Fields.Fields[k+4].Value));
          end;
        end;
        dutyGrid.Cells[2,j] := IntToStr(iTimeCount);
        with DMHrdsys.SQLQuery2 do
        begin
          close;
          sql.Clear;
          sql.Add('select cls_name from fhrd_clsid where '+
          'cls_id='''+dutyQry.FieldValues['cls_id']+''' ');
          open;
        end;
        dutyGrid.Cells[1,j] := DMHrdsys.SQLQuery2.FieldValues['cls_name'];
        j := j+1;
        next;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_query_error'),mtError,[mbyes],1);
  end;
  SetProcessBar(true);
end;

procedure TFormfhrd402.dSelDataClick(Sender: TObject);
begin
  fetchDutyData;
end;

procedure TFormfhrd402.selMonDutyShow(Sender: TObject);
begin
  dmonth.SetFocus;
end;

procedure TFormfhrd402.dExitSubFormClick(Sender: TObject);
begin
  close;
end;

procedure TFormfhrd402.aExitSubFormClick(Sender: TObject);
begin
  close;
end;

{***控制月考勤選擇框狀態********BEGIN*******}

procedure TFormfhrd402.dEmpBegIdChange(Sender: TObject);
begin
  if Length(dEmpBegID.Text)=6 then
  begin
    dEmpRadio.Checked := true;
    dDeptBegCob.Text := '';
    dDeptEndCob.Text := '';
  end;
end;

procedure TFormfhrd402.dEmpEndIdChange(Sender: TObject);
begin
  if (Length(dEmpEndId.Text)=6) and (dEmpBegId.Text<>'') then
  begin
    dEmpRadio.Checked := true;
    dDeptBegCob.Text := '';
    dDeptEndCob.Text := '';
  end;
end;

procedure TFormfhrd402.dDeptBegCobChange(Sender: TObject);
begin
  if dDeptBegCob.Text<>'' then
  begin
    dDeptRadio.Checked := true;
    dEmpBegId.Text := '';
    dEmpEndId.Text := '';
  end;
end;

procedure TFormfhrd402.dDeptEndCobChange(Sender: TObject);
begin
  if (dDeptBegCob.Text<>'') and (dDeptEndCob.Text<>'') then
  begin
    dDeptRadio.Checked := true;
    dEmpBegId.Text := '';
    dEmpEndId.Text := '';
  end;
end;

{***控制月考勤選擇框狀態********END*******}

{****************************************
Name: aSelDataClick
Func: 查詢排班資料並顯示在表格
Args:
    sSelEmpStr->查詢員工號語句
    i,j-> 循環變量
    iDays->天數
*****************************************}

procedure TFormfhrd402.aSelDataClick(Sender: TObject);
var
  i,j,iDays : integer;
  sSelEmpStr,sSelClsStr: string;
begin

  if aDateBeg.Date>aDateEnd.Date then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'dut05_dateerror'),mtError,[mbyes],1);
    aDateBeg.SetFocus;
    exit;
  end;

  {***處理查詢天數***}

  iDays := 0;
  for i:=0 to 365 do
  begin
    if (aDateBeg.Date+i)>aDateEnd.Date then
    begin
      break;
    end
    else
      iDays := i+1;
  end;

  {***取範圍中的員工號***}

  with arrQry do
  begin
    close;
    sql.Clear;
    sSelEmpStr := 'select distinct a.emp_id,(select emp_name from fhrd_emp '+
    'where emp_id=a.emp_id) as emp_name from fhrd_arr as a,fhrd_emp as e '+
    'where a.arr_date between '''+DateToStr(aDateBeg.Date)+''' '+
    'and '''+DateToStr(aDateEnd.Date)+''' ';

    if aEmpRadio.Checked then
    begin
      if (aEmpBegId.Text='') or (aEmpEndId.Text='') then
      begin
        widemessagedlg(GetLangName(g_sLangStr,'msg_empid_null'),mtError,[mbyes],1);
        exit;
      end;
      sSelEmpStr := sSelEmpStr+' and a.emp_id '+
      'between '''+aEmpBegId.Text+''' and '''+aEmpEndId.Text+'''';
    end;

    if aDeptRadio.Checked then
    begin
      if (aDeptBegCob.Text='') or (aDeptEndCob.Text='') then
      begin
        widemessagedlg(GetLangName(g_sLangStr,'msg_cho_dept'),mtError,[mbyes],1);
        exit;
      end;
      sSelEmpStr := sSelEmpStr+' and e.dept_code '+
      'between '''+LeftStr(aDeptBegCob.Text,6)+''' '+
      'and '''+LeftStr(aDeptEndCob.Text,6)+''' and '+
      'a.emp_id=e.emp_id ';
    end;
    sSelEmpStr := sSelEmpStr+' order by a.emp_id';
    sql.Add(sSelEmpStr);
    open;
    aPrnData.Enabled := true;
  end;

  {***初始化表格屬性***}

  arrangeGrid.FixedCols := 1;
  arrangeGrid.FixedRows := 1;
  arrangeGrid.DefaultColWidth := 33;
  arrangeGrid.ColCount := idays+1;
  arrangeGrid.ColWidths[0] := 85;
  arrangeGrid.RowCount := arrQry.RecordCount+1;
  arrangeGrid.Cells[0,0]:= GetLangName(g_sLangStr,'emp_date_header');

  {***填充行列表頭***}

  For i:=1 to iDays do
  begin
    if DayOfWeek(aDateBeg.Date+i-1)=1 then
      arrangeGrid.Cols[i].Text := '  sun'
    else
      arrangeGrid.Cols[i].Text := RightStr(FormatDateTime('yyyy/mm/dd',aDateBeg.Date+i-1),length(FormatDateTime('yyyy/mm/dd',aDateBeg.Date+i-1))-5);
  end;

  arrQry.First;

  For i:=1 to arrQry.RecordCount do
  begin
    arrangeGrid.Rows[i].Text := arrQry.FieldValues['emp_id']+'/'+
    arrQry.FieldValues['emp_name'];
    arrQry.Next;
  end;

  {***將條件範圍的排班資料寫入表格***}

  arrQry.First;

  try
    j := 1;
    SetProcessBar(true,1,arrQry.RecordCount);
    while Not arrQry.Eof do
    begin
      SetProcessBar(false,1);
      For i:=1 to iDays do
      begin
        with dataQry do
        begin
          close;
          sql.Clear;
          sSelClsStr := 'select distinct cls_id,(select cls_name from fhrd_clsid '+
          'where cls_id=fhrd_arr.cls_id) as cls_name from fhrd_arr where '+
          'emp_id='''+arrQry.FieldValues['emp_id']+''' and '+
          'arr_date='''+DateToStr(aDateBeg.Date+i-1)+''' ';

          if aClsChkBox.Checked then
            sSelClsStr := sSelClsStr+' and cls_id='''+LeftStr(aClsCob.Text,2)+''' ';

          sql.Add(sSelClsStr);
          open;
          if RecordCount>0 then
          begin
            arrangeGrid.Cells[i,j]:=FieldByName('cls_name').Value;
          end
        end;
      end;
      j := j+1;
      arrQry.Next;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_query_error'),mtError,[mbyes],1);
  end;
  SetProcessBar(true);
end;

{***控制排班選擇框狀態***BEGIN***}

procedure TFormfhrd402.aEmpBegIdChange(Sender: TObject);
begin
  if Length(aEmpBegId.Text)=6 then
  begin
    aEmpRadio.Checked := true;
    aDeptBegCob.Text := '';
    aDeptEndCob.Text := '';
  end;
end;

procedure TFormfhrd402.aEmpEndIdChange(Sender: TObject);
begin
  if (Length(aEmpEndId.Text)=6) and (aEmpBegId.Text<>'') then
  begin
    aEmpRadio.Checked := true;
    aDeptBegCob.Text := '';
    aDeptEndCob.Text := '';
  end;
end;

procedure TFormfhrd402.aDeptBegCobChange(Sender: TObject);
begin
  if aDeptBegCob.Text<>'' then
  begin
    aDeptRadio.Checked := true;
    aEmpEndId.Text := '';
    aEmpBegId.Text := '';
  end;
end;

procedure TFormfhrd402.aDeptEndCobChange(Sender: TObject);
begin
  if aDeptEndCob.Text<>'' then
  begin
    aDeptRadio.Checked := true;
    aEmpEndId.Text := '';
    aEmpBegId.Text := '';
  end;
end;

{***控制排班選擇框狀態***END***}

procedure TFormfhrd402.aClsCobChange(Sender: TObject);
begin
  if aClsCob.Text<>'' then
    aClsChkBox.Checked := true;
end;

procedure TFormfhrd402.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFormfhrd402.hPrnDataClick(Sender: TObject);
begin
  Application.CreateForm(TFhrd402ReportH,Fhrd402ReportH);
  Fhrd402ReportH.Fhrd402QRep.Prepare;
  Fhrd402reportH.QRLabel24.Caption := DateTostr(Date);
  Fhrd402ReportH.Fhrd402QRep.Preview;
end;

procedure TFormfhrd402.aPrnDataClick(Sender: TObject);
var
  sselStr : string;
begin
  with arrPrnQry do
  begin
    close;
    sql.Clear;
    sselStr := 'select emp_id,'+
    '(select emp_name from vfhrdemp where emp_id=a.emp_id) as emp_name,'+
    '(select dept_abbr from vfhrdemp where emp_id=a.emp_id) as dept_abbr,'+
    '(select dept_code from vfhrdemp where emp_id=a.emp_id) as dept_code,'+
    'cls_id,seg_id,'+
    '(select start_t from fhrd_segment where seg_id=a.seg_id) as start_t,'+
    '(select stop_t from fhrd_segment where seg_ID=a.seg_id) as stop_t,'+
    'arr_date from fhrd_arr as a '+
    'where arr_date between '''+FormatDateTime('yyyy/mm/dd',aDateBeg.date)+''' '+
    'and '''+FormatDateTime('yyyy/mm/dd',aDateEnd.date)+''' ';
    if aEmpRadio.Checked then
    begin
      sselStr := sselStr+' and emp_id between '''+aEmpBegId.Text+''' '+
      'and '''+aEmpEndId.Text+''' ';
    end;
    if aDeptRadio.Checked then
    begin
      sselStr := sselStr+' and dept_code between '''+LeftStr(aDeptBegCob.Text,6)+''' '+
      'and '''+LeftStr(aDeptEndCob.Text,6)+''' ';
    end;
    sselStr := sselStr+' order by dept_code,emp_id,arr_date ';
    sql.Add(sselStr);
    try
      open;
    except
      showmessage('取排班數據錯誤');
      exit;
    end;
  end;
  Application.CreateForm(TFhrd402ReportA,Fhrd402ReportA);
  Fhrd402ReportA.Fhrd402QRep.Prepare;
  Fhrd402reportA.QRLabel24.Caption := DateTostr(Date);
  Fhrd402ReportA.Fhrd402QRep.Preview;
end;

end.
