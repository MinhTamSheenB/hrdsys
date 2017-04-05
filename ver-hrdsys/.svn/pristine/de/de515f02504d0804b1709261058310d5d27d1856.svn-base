{******************************************************************************
name：fhrd304(計算薪資)
author: tristan
create date:2005-08-23
commentate:計算薪資
*******************************************************************************}

unit uFhrd304;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, ExtCtrls, TntExtCtrls, Grids, DBGrids,
  TntDBGrids, Buttons, TntButtons, DBCtrls, DB,StrUtils,WSDLIntf, Mask,
  TntDbCtrls, ComCtrls,TntComCtrls, ADODB,tntDialogs, DateUtils,TntGrids,
  CheckLst, TntCheckLst;

type
    DutyArr = Array[0..5] of Real;
type
  TFormfhrd304 = class(TForm)
    TntPanel1: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntGroupBox2: TTntGroupBox;
    salGrid: TTntDBGrid;
    TntLabel1: TTntLabel;
    month: TTntEdit;
    deptRadio: TTntRadioButton;
    empRadio: TTntRadioButton;
    deptBegCob: TTntComboBox;
    deptEndCob: TTntComboBox;
    empBegId: TTntEdit;
    empEndId: TTntEdit;
    saveData: TTntBitBtn;
    exitSubForm: TTntBitBtn;
    saveSalQry: TADOQuery;
    fetchEmpQry: TADOQuery;
    fetchSalQry: TADOQuery;
    salDataSource: TDataSource;
    fetchSalQryemp_id: TStringField;
    fetchSalQryemp_name: TStringField;
    fetchSalQryon_duty: TFloatField;
    fetchSalQryoff_duty: TFloatField;
    fetchSalQrynight1_duty: TFloatField;
    fetchSalQrynight1_price: TFloatField;
    fetchSalQrynight2_duty: TFloatField;
    fetchSalQrynight2_price: TFloatField;
    fetchSalQrysal_bas: TFloatField;
    fetchSalQrysal_frn: TFloatField;
    fetchSalQryfix_add: TFloatField;
    fetchSalQryf_award: TFloatField;
    fetchSalQryadjust: TFloatField;
    fetchSalQrylocal_amt: TFloatField;
    doClsQry: TADOQuery;
    doSalQry: TADOQuery;
    chkDtQry: TADOQuery;
    getHoursQry: TADOQuery;
    getHolQry: TADOQuery;

    // user create function and procedure

    procedure InitLang;
    procedure ctlStatus(sFlag : Char);
    procedure setDeptCob;
    procedure doClvcSalary;
    procedure doClvSalary;
    procedure fetchSal;
    Function chkLeDt(sEmpId : string):string;
    Function chkTransDt(sEmpId : string):string;
    Function getDuty(sMonth : string ; sBegDay : string ; sEndDay : string ; sEmpId : string): DutyArr;
    Function getBase(sEmpId : string ; tFlag : string):real;
    Function getForeign(sEmpId : string ; tFlag : string):real;
    Function getLocalAmt(sEmpId : string ; tFlag : string):real;
    Function getHolDays(sEmpId:string):Real;
    Function getWorkDays(end_day:TDateTime;valid_day:TDateTime):integer;
    procedure saveSal(sempid:string;sal_bas:real;sal_frn:real;fix_add:real;f_award:real;adjust:real;local_amt:real);


    // system create proceudre

    procedure FormCreate(Sender: TObject);
    procedure exitSubFormClick(Sender: TObject);
    procedure monthChange(Sender: TObject);
    procedure empBegIdChange(Sender: TObject);
    procedure empEndIdChange(Sender: TObject);
    procedure deptBegCobChange(Sender: TObject);
    procedure deptEndCobChange(Sender: TObject);
    procedure saveDataClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd304: TFormfhrd304;
  jduty : DutyArr;
  aduty : DutyArr;
  {**************
  aduty[0]-> 基本時數208
  aduty[1]-> 上班時數
  aduty[2]-> 缺勤時數
  aduty[3]-> 小夜班時數(中班)
  aduty[4]-> 大夜班(晚班)(8 H)時數
  aduty[5]-> 大夜班(12H)時數
  **************}

implementation

uses
  UnitHrdUtils,unitDMHrdsys,UnitHrdMain;

{$R *.dfm}

{***定義全局變量***}
var
  g_sLangStr : TWideStrings;
  g_sf_award,g_sfix_add : real;
  g_sBegDay,g_sEndDay : string;
  g_iDays : Integer;

{*****************************************
Name: InitLang
Func: 初始化語言變量
Args:
    sKeys->語言變量
*****************************************}

procedure TFormfhrd304.InitLang;
var
  sKeys : string;
begin

  sKeys:='fhrd304,save,quit,browsedata,salmonth,fhrd104_condition,compute,'+
  'fld_department,emp_id,confirm_close,msg_set_dept,msg_chkmdut_error,'+
  'msg_add_error,msg_fetsal_error,fld_emp_name,fld_s_start,off_duty_time,'+
  'sal_bas,sal_frn,fix_add,f_award,adjust,local_amt,lnight_duty,lnight_price,'+
  'snight_duty,snight_price,dut03_dateerror,msg_month_null,msg_cho_dept,'+
  'msg_empid_null,msg_no_mduty,dinnerPrice,anight_duty,anight_price';

  g_sLangStr:=GetLangWideStrs(sKeys);

  TntPanel1.Caption:=GetLangName(g_sLangStr,'fhrd304');
  TntLabel1.Caption := GetLangName(g_sLangStr,'salmonth');
  saveData.Caption:=GetLangName(g_sLangStr,'compute');
  exitSubForm.Caption:=GetLangName(g_sLangStr,'quit');
  TntGroupBox1.Caption:=GetLangName(g_sLangStr,'fhrd104_condition');
  TntGroupBox2.Caption:=GetLangName(g_sLangStr,'browsedata');
  deptRadio.Caption := GetLangName(g_sLangStr,'fld_department');
  empRadio.Caption := GetLangName(g_sLangStr,'emp_id');
  salGrid.Columns[0].Title.caption := GetLangName(g_sLangStr,'emp_id');
  salGrid.Columns[1].Title.caption := GetLangName(g_sLangStr,'fld_emp_name');
  salGrid.Columns[2].Title.caption := GetLangName(g_sLangStr,'fld_s_start');
  salGrid.Columns[3].Title.caption := GetLangName(g_sLangStr,'off_duty_time');
  salGrid.Columns[4].Title.caption := GetLangName(g_sLangStr,'snight_duty');
  salGrid.Columns[5].Title.caption := GetLangName(g_sLangStr,'snight_price');
  salGrid.Columns[6].Title.caption := GetLangName(g_sLangStr,'lnight_duty');
  salGrid.Columns[7].Title.caption := GetLangName(g_sLangStr,'lnight_price');
  salGrid.Columns[8].Title.caption := GetLangName(g_sLangStr,'anight_duty');
  salGrid.Columns[9].Title.caption := GetLangName(g_sLangStr,'anight_price');
  salGrid.Columns[10].Title.caption := GetLangName(g_sLangStr,'sal_bas');
  salGrid.Columns[11].Title.caption := GetLangName(g_sLangStr,'sal_frn');
  salGrid.Columns[12].Title.caption := GetLangName(g_sLangStr,'fix_add');
  salGrid.Columns[13].Title.caption := GetLangName(g_sLangStr,'f_award');
  salGrid.Columns[14].Title.caption := GetLangName(g_sLangStr,'adjust');
  salGrid.Columns[15].Title.caption := GetLangName(g_sLangStr,'dinnerPrice');
  salGrid.Columns[16].Title.caption := GetLangName(g_sLangStr,'local_amt');

end;

{********************************************
Name: ctlStatus
Func: 控制條件編輯框是否可編輯
Args:
      sFlag-> 控制標誌 0->不可編輯1->可編輯
*********************************************}

procedure TFormfhrd304.ctlStatus(sFlag : Char);
begin
  case sFlag of
  '0':
  begin
    deptRadio.Enabled := false;
    empRadio.Enabled := false;
    deptBegCob.Enabled := false;
    deptEndCob.Enabled := false;
    empBegId.Enabled := false;
    empBegId.Enabled := false;
    saveData.Enabled := false;
  end;
  '1':
  begin
    deptRadio.Enabled := true;
    empRadio.Enabled := true;
    deptBegCob.Enabled := true;
    deptEndCob.Enabled := true;
    empBegId.Enabled := true;
    empBegId.Enabled := true;
    saveData.Enabled := true;
  end;
  end;
end;

procedure TFormfhrd304.FormCreate(Sender: TObject);
begin
  InitLang;
  ctlStatus('0');
  setDeptCob;
end;

procedure TFormfhrd304.monthChange(Sender: TObject);
begin
  if Length(month.Text)=6 then
  begin
    ctlStatus('1');
  end;
end;

{*******條件變化，選擇框跟隨***BEGIN****}

procedure TFormfhrd304.empBegIdChange(Sender: TObject);
begin
  if Length(empBegId.Text)=6 then
  begin
    empRadio.Checked := true;
    deptBegCob.Text := '';
    deptEndCob.Text := '';
  end;
end;

procedure TFormfhrd304.empEndIdChange(Sender: TObject);
begin
  if (Length(empEndId.Text)=6) and (empBegId.Text<>'') then
  begin
    empRadio.Checked := true;
    deptBegCob.Text := '';
    deptEndCob.Text := '';
  end;
end;

procedure TFormfhrd304.deptBegCobChange(Sender: TObject);
begin
  deptRadio.Checked := true;
  empBegId.Text := '';
  empEndId.Text := '';
end;

procedure TFormfhrd304.deptEndCobChange(Sender: TObject);
begin
  deptRadio.Checked := true;
  empBegId.Text := '';
  empEndId.Text := '';
end;

{******條件變化，選擇框跟隨****END******}

{****************************************
Name: setDeptCob
Func: 初始化部門下拉框
Args:
*****************************************}

procedure TFormFhrd304.setDeptCob;
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
        deptBegCob.Items.Add(FieldByName('dept_code').Value+'/'+
        FieldByName('dept_abbr').Value);
        deptEndCob.Items.Add(FieldByName('dept_code').Value+'/'+
        FieldByName('dept_abbr').Value);
        next;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_set_dept'),
    mtError,[mbyes],1);
  end;
end;

{******************************************
Name: getDuty
Func: 取時數
Args:
    sMonth->    月份
    sEmpId->    工號
    sBegDay->   開始天
    sEndDay->   結束天
    sClsId->    班別
    i->         循環變量
    iduty->　　時數
*******************************************}

Function TFormFhrd304.getDuty(sMonth : string ; sBegDay : string ; sEndDay : string ; sEmpId : string): DutyArr;
var
  i,j : integer;
  sTmpClsId,sTmpBegDay : string;
begin

  For j:=0 to 4 do
    jduty[j]:=0;

  with doClsQry do
  begin
    close;
    sql.Clear;
    sql.Add('select * from fhrd_mdut where dut_mon='''+sMonth+''' '+
    'and emp_id='''+sEmpId+''' order by dut_mon,emp_id,cls_id ');
    open;

    if RecordCount>0 then
    begin
      jduty[0]:=208;
      while Not Eof do
      begin
        sTmpClsId := Trim(FieldByName('cls_id').Value);
        For i:=strToInt(sBegDay) to strToInt(sEndDay) do
        begin
          sTmpBegDay := IntToStr(i);
          if Length(sTmpBegDay)=1 then
            sTmpBegDay := '0'+sTmpBegDay;
          if not VarIsNull(FieldByName('day'+sTmpBegDay).Value) then
          begin
            if sTmpClsId='01' then
              jduty[1] := jduty[1]+strToFloat(trim(FieldByName('day'+sTmpBegDay).Value))
            else if sTmpClsId='02' then
            begin
              jduty[3] := jduty[3]+strToFloat(trim(FieldByName('day'+sTmpBegDay).Value));
            end
            else if sTmpClsId='03' then
            begin
              jduty[4] := jduty[4]+strToFloat(trim(FieldByName('day'+sTmpBegDay).Value));
            end
            else if sTmpClsId='10' then
            begin
              jduty[5] := jduty[5]+strToFloat(trim(FieldByName('day'+sTmpBegDay).Value));
            end
            else
              jduty[2] := jduty[2]+strToFloat(trim(FieldByName('day'+sTmpBegDay).Value));
          end;
        end;
        next;
      end;
      jduty[1]:=jduty[1]+jduty[3]+jduty[4]+jduty[5];
      result := jduty;
    end
    else
    begin
      result := jduty;
    end;
  end;
end;

{****************************************
Name: getBase
Func: 取本薪
Args:
    sEmpId-> 工號
    tFlag->  是否轉正標誌
*****************************************}

Function TFormFhrd304.getBase(sEmpId : string ; tFlag : string):real;
begin
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add('select bas_amt from vfhrdsalgrd where '+
    'emp_id='''+sEmpId+''' and tryout='''+tFlag+''' ');
    open;
    if RecordCount>0 then
      result := FieldByName('bas_amt').value
    else
      result := 0;
  end;
end;

{****************************************
Name: getForeign
Func: 取海外津貼
Args:
    sEmpId-> 工號
    tFlag->  是否轉正標誌
*****************************************}

Function TFormFhrd304.getForeign(sEmpId : string ; tFlag : string):real;
begin
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add('select frn_amt from vfhrdsalgrd where '+
    'emp_id='''+sEmpId+''' and tryout='''+tFlag+''' ');
    open;
    if RecordCount>0 then
      result := FieldByName('frn_amt').value
    else
      result := 0;
  end;
end;

{****************************************
Name: getForeign
Func: 取海外津貼
Args:
    sEmpId-> 工號
    tFlag->  是否轉正標誌
*****************************************}

Function TFormFhrd304.getLocalAmt(sEmpId : string ; tFlag : string):real;
begin
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add('select local_amt from vfhrdsalgrd where '+
    'emp_id='''+sEmpId+''' and tryout='''+tFlag+''' ');
    open;
    if RecordCount>0 then
      result := FieldByName('local_amt').value
    else
      result := 0;
  end;
end;

{****************************************
Name: chkLeDt
Func: 檢查是否離職
Args:
    sEmpId-> 工號
*****************************************}

Function TFormFhrd304.chkLeDt(sEmpId : string): String;
begin
  with chkDtQry do
  begin
    close;
    sql.Clear;
    sql.Add('select emp_ledt from fhrd_emp where emp_id='''+sEmpId+''' ');
    open;
    if VarIsNull(FieldByName('emp_ledt').Value) then
      result := ''
    else
    begin
      if (strToDate(FormatDateTime('yyyy/mm/dd',strToDate(FieldByName('emp_ledt').Value)))>=
        strToDate(FormatDateTime('yyyy/mm/dd',strToDate(g_sBegDay)))) and
        (strToDate(FormatDateTime('yyyy/mm/dd',strToDate(FieldByName('emp_ledt').Value)))<=
        strToDate(FormatDateTime('yyyy/mm/dd',strToDate(g_sEndDay)))) then
        result := FormatDateTime('yyyy/mm/dd',strToDate(FieldByName('emp_ledt').Value))
      else
        result := '';
    end;
  end;
end;

{*****************************************
Name: chkTransDt
Func: 檢查調升日期
Args:
    sMonth->
    sEmpId->
******************************************}
Function TFormFhrd304.chkTransDt(sEmpId : string):string;
begin
  with chkDtQry do
  begin
    close;
    sql.Clear;
    sql.Add('select max(valid_date) as valid_date from fhrd_tranhist '+
    'where emp_id='''+sEmpId+'''');
    open;
    if VarIsNull(FieldByName('valid_date').Value) then
      result := ''
    else
    begin
      if (strToDate(FormatDateTime('yyyy/mm/dd',strToDate(FieldByName('valid_date').Value)))>=
        strToDate(FormatDateTime('yyyy/mm/dd',strToDate(g_sBegDay)))) and
        (strToDate(FormatDateTime('yyyy/mm/dd',strToDate(FieldByName('valid_date').Value)))<=
        strToDate(FormatDateTime('yyyy/mm/dd',strToDate(g_sEndDay)))) then
        result := FormatDateTime('yyyy/mm/dd',strToDate(FieldByName('valid_date').Value))
      else
        result := '';
    end;
  end;
end;

{****************************************
Name: doSalary
Func: 計算並保存薪資
Args:
    monthFlag->月結標誌
    sSelStr-> 查詢語句
****************************************}

procedure TFormFhrd304.doClvcSalary;
var
  monthFlag : boolean;
  sSelStr,sTmpEmpId,sYear,sMon : string;
  aNightPrice,lNightPrice,sNightPrice,
  rBaseAmt,rForeignAmt,rLocalAmt,sTmpOnDuty,sTmpOffDuty,sTmpaNightDuty,
  sTmplNightDuty,sTmpsNightDuty,rBaseAmt1,rForeignAmt1,dinnerPrice: real;
  lcYear,lcMonth : Integer;
begin

  {***處理日期***}

  sYear := LeftStr(month.Text,4);
  sMon := RightStr(month.Text,2);
  if LeftStr(sMon,1)='0' then
    sMon := RightStr(sMon,1);

  g_sBegDay := DateToStr(StartOfAMonth(strToInt(sYear),strToInt(sMon)));
  g_sBegDay := FormatDateTime('yyyy/mm/dd',strToDate(g_sBegDay));
  g_idays := DaysInAMonth(strToInt(sYear),strToInt(sMon));
  g_sEndDay := DateToStr(EndOfAMonth(strToInt(sYear),strToInt(sMon)));
  g_sEndDay := FormatDateTime('yyyy/mm/dd',strToDate(g_sEndDay));

  {***驗證月份是否有效------------------------------------***}

  if month.Text='' then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_month_null'),mtError,[mbyes],1);
    month.SetFocus;
    exit;
  end
  else
  begin
    if length(month.Text )<>6 then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'dut03_dateerror'),mtError,[mbyes],1);
      exit;
    end;
    try
      lcYear:=StrToInt(LeftStr(month.Text,4));
      lcMonth:=StrToInt(RightStr(month.Text,2));
    except
      exit;
    end;
    if (lcMonth>12) or (lcMonth<1) or (lcYear>2100) or (lcYear<1900) then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'dut03_dateerror'),mtError,[mbyes],1);
      exit;
    end;
  end;

  {***驗證工號是否為空------------------------------------***}

  if empRadio.Checked then
  begin
    if (empBegId.Text='') or (empEndId.Text='') then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'msg_empid_null'),mtError,[mbyes],1);
      exit;
    end;
  end;

  {***驗證是否選擇部門------------------------------------***}

  if deptRadio.Checked then
  begin
    if (deptBegCob.Text='') or (deptEndCob.Text='') then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'msg_cho_dept'),mtError,[mbyes],1);
      exit;
    end;
  end;

  {***驗證月份是否已月結-----------------------------------------***}
  {
  try
    with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from close_f where c_month='''+month.Text+'''');
      open;
      if RecordCount>0 then
        monthFlag := true
      else
        monthFlag := false;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_chkmdut_error'),
    mtError,[mbyes],1);
  end;
  }

  if not monthFlag then
  begin
    // 未月結 ,提示,退出
    widemessagedlg(GetLangName(g_sLangStr,'msg_no_mduty'),mtError,[mbyes],1);
    exit;
  end
  else
  begin
    try
      {***取輸入月份(月結月份)的員工號---------------------***}
      with fetchEmpQry do
      begin
        close;
        sql.Clear;
        sSelStr := 'select distinct d.emp_id '+
        'from fhrd_mdut as d,fhrd_emp as e,fhrd_salstru as s where '+
        'd.dut_mon='''+month.Text+''' ';
        if empRadio.Checked then
          sSelStr := sSelStr+' and d.emp_id between '''+empBegId.Text+''' '+
          'and '''+empEndId.Text+''' ';
        if deptRadio.Checked then
          sSelStr := sSelStr+' and e.dept_code '+
          'between '''+LeftStr(deptBegCob.Text,6)+''' '+
          'and '''+LeftStr(deptEndCob.Text,6)+''' and d.emp_id=e.emp_id ';
        sSelStr := sSelStr+' and s.emp_id=d.emp_id and e.emp_info=''0'' order by d.emp_id';
        sql.Add(sSelStr);
        open;

        {***取得資料進行如下操作---------------------------***}

        if RecordCount>0 then
        begin
          setProcessBar(true,1,RecordCount*3);
          First;
          while Not Eof do
          begin
            setProcessBar(false,1);
            rBaseAmt := 0;
            rForeignAmt := 0;
            rLocalAmt := 0;
            g_sf_award := 5.0;
            g_sfix_add := 25.0;
            sTmpEmpId := fetchEmpQry.FieldValues['emp_id'];
            with doSalQry do
            begin
              close;
              sql.Clear;
              sql.Add('select * from fhrd_salstru '+
              'where emp_id='''+sTmpEmpId+''' ');
              open;
              if FieldByName('tryout').Value='1' then
              begin
                if chkTransDt(sTmpEmpId)='' then //調升在當月之前
                begin
                  if chkLeDt(sTmpEmpId)='' then //在職 計算整月薪資
                  begin
                    aduty := getDuty(month.Text,RightStr(g_sBegDay,2),RightStr(g_sEndDay,2),sTmpEmpId);
                    rBaseAmt := (getBase(sTmpEmpId,'1')/aduty[0])*(aduty[0]-aduty[2]);
                    rForeignAmt := (getForeign(sTmpEmpId,'1')/aduty[0])*(aduty[0]-aduty[2]);
                    rLocalAmt := getLocalAmt(sTmpEmpId,'1');
                  end
                  else       //---------離職,計算薪資從月初到離職日
                  begin
                    aduty := getDuty(month.Text,RightStr(g_sBegDay,2),RightStr(chkLeDt(sTmpEmpId),2),sTmpEmpId);
                    rBaseAmt := (getBase(sTmpEmpId,'1')/aduty[0])*aduty[1];
                    rForeignAmt := (getForeign(sTmpEmpId,'1')/aduty[0])*aduty[1];
                    rLocalAmt := getLocalAmt(sTmpEmpId,'1');
                  end;
                end
                else //---------------------------------------//調升在當月初
                begin
                  if chkLeDt(sTmpEmpId)='' then //在職
                  begin
                      // 調升 月初生效
                    if chkTransDt(sTmpEmpId)=g_sBegDay then
                    begin
                      aduty := getDuty(month.Text,RightStr(g_sBegDay,2),RightStr(g_sEndDay,2),sTmpEmpId);
                      rBaseAmt := (getBase(sTmpEmpId,'1')/aduty[0])*(aduty[0]-aduty[2]);
                      rForeignAmt := (getForeign(sTmpEmpId,'1')/aduty[0])*(aduty[0]-aduty[2]);
                      rLocalAmt := getLocalAmt(sTmpEmpId,'1');
                    end
                    else
                    begin
                      // 本月新進員工 調升 在月中
                      aduty := getDuty(month.Text,RightStr(chkTransDt(sTmpEmpId),2),RightStr(g_sEndDay,2),sTmpEmpId);
                      rBaseAmt := (getBase(sTmpEmpId,'1')/aduty[0])*(aduty[0]-aduty[2]);
                      rForeignAmt := (getForeign(sTmpEmpId,'1')/aduty[0])*(aduty[0]-aduty[2]);
                      rLocalAmt := getLocalAmt(sTmpEmpId,'1');
                    end;
                  end
                  else //離職  計算從月初到離職日
                  begin
                    if chkTransDt(sTmpEmpId)<>g_sBegDay then  // 月中進廠 月中離職
                    begin
                      aduty := getDuty(month.Text,RightStr(chkTransDt(sTmpEmpId),2),RightStr(chkLeDt(sTmpEmpId),2),sTmpEmpId);
                      rBaseAmt := (getBase(sTmpEmpId,'1')/aduty[0])*aduty[1];
                      rForeignAmt := (getForeign(sTmpEmpId,'1')/aduty[0])*aduty[1];
                      rLocalAmt := getLocalAmt(sTmpEmpId,'1');
                    end
                    else
                    begin   // 當月之前進廠 月中離職
                      aduty := getDuty(month.Text,RightStr(g_sBegDay,2),RightStr(chkLeDt(sTmpEmpId),2),sTmpEmpId);
                      rBaseAmt := (getBase(sTmpEmpId,'1')/aduty[0])*aduty[1];
                      rForeignAmt := (getForeign(sTmpEmpId,'1')/aduty[0])*aduty[1];
                      rLocalAmt := getLocalAmt(sTmpEmpId,'1');
                    end;
                  end;
                end;
              end;
            end;

            {***計算大夜班(12H)津貼--------------------------------***}

            with DMHrdsys.SQLQuery3 do
            begin
              close;
              sql.Clear;
              sql.Add('select night_amt from fhrd_segment '+
              'where cls_id='''+IntToStr(1)+IntToStr(0)+'''');
              open;
              aNightPrice := aduty[5]*FieldByName('night_amt').Value;
            end;

            {***計算大夜班(8H)津貼-----------------------------***}

            with DMHrdsys.SQLQuery3 do
            begin
              close;
              sql.Clear;
              sql.Add('select night_amt from fhrd_segment '+
              'where cls_id='''+IntToStr(0)+IntToStr(3)+'''');
              open;
              lNightPrice := aduty[4]*FieldByName('night_amt').Value;
            end;

            {***計算小夜班津貼--------------------------------------***}

            with DMHrdsys.SQLQuery3 do
            begin
              close;
              sql.Clear;
              sql.Add('select night_amt from fhrd_segment '+
              'where cls_id='''+IntToStr(0)+IntToStr(2)+'''');
              open;
              sNightPrice := aduty[3]*FieldByName('night_amt').Value;
            end;

            {***夜點補貼***}

            dinnerPrice := (((aduty[3]+aduty[4]+aduty[5])/8)*8000)/15900;

            {***新增計算工資--------------------------------------***}

            try
              {***刪除已存在的本月員工薪資-------------------------***}
              with DMHrdsys.SQLQuery3 do
              begin
                close;
                sql.Clear;
                sql.Add('delete from fhrd_salary where '+
                'sal_month='''+month.Text+''' '+
                'and emp_id='''+sTmpEmpId+'''');
                ExecSql;
              end;

              {***新增本月新計算的員工薪資---------------------------***}

              with saveSalQry do
              begin
                close;
                Parameters.ParamByName('upd_user').Value:=userName;
                Parameters.ParamByName('sal_month').Value:=month.Text;
                Parameters.ParamByName('emp_id').Value:=sTmpEmpId;
                Parameters.ParamByName('on_duty').Value:=aduty[1];
                Parameters.ParamByName('off_duty').Value:=aduty[2];
                Parameters.ParamByName('night1_duty').Value:=aduty[3];
                Parameters.ParamByName('night1_price').Value:=sNightPrice;
                Parameters.ParamByName('night2_duty').Value:=aduty[4];
                Parameters.ParamByName('night2_price').Value:=lNightPrice;
                Parameters.ParamByName('night3_duty').Value:=aduty[5];
                Parameters.ParamByName('night3_price').Value:=aNightPrice;
                Parameters.ParamByName('sal_bas').Value:=rBaseAmt;
                Parameters.ParamByName('sal_frn').Value:=rForeignAmt;
                Parameters.ParamByName('fix_add').Value:=g_sfix_add;
                Parameters.ParamByName('f_award').Value:=g_sf_award;
                Parameters.ParamByName('adjust').Value:=0;
                Parameters.ParamByName('local_amt').Value:=rLocalAmt;
                Parameters.ParamByName('dinner_price').Value:=dinnerPrice;
                ExecSql;
              end;
            except
              widemessagedlg(GetLangName(g_sLangStr,'msg_add_error'),
              mtError,[mbyes],1);
            end;
            next;
          end;
        end;
      end;
    except
      widemessagedlg(GetLangName(g_sLangStr,'msg_add_error'),
      mtError,[mbyes],1);
    end;
  end;
  setProcessBar(true);
end;

procedure TFormfhrd304.saveDataClick(Sender: TObject);
begin
  if deptRadio.Checked then
  begin
    if (deptbegCob.Text='') or (deptendCob.Text='') then
    begin
      showmessage('請選擇部門');
      exit;
    end
    else
    begin
      if LeftStr(deptbegCob.Text,1)<>LeftStr(deptendCob.Text,1) then
      begin
        showmessage('部門選擇無效');
        exit;
      end;
    end;
  end
  else
  begin
    showmessage('請選擇部門');
    exit;
  end;
  if (LeftStr(deptbegCob.Text,1)='N') and (LeftStr(deptendCob.Text,1)='N') then
    doClvcSalary
  else if (LeftStr(deptbegCob.Text,1)<>'N') and (LeftStr(deptendCob.Text,1)<>'N') then
    doClvSalary;
  fetchSal;
end;

procedure TFormFhrd304.doClvSalary;
var
  sSelStr,sTmpEmpId,sYear,sMon : string;
  lcYear,lcMonth : Integer;
  sal_bas,sal_frn,fix_add,f_award,adjust,local_amt:real;
begin
{***處理日期***}

  sYear := LeftStr(month.Text,4);
  sMon := RightStr(month.Text,2);
  if LeftStr(sMon,1)='0' then
    sMon := RightStr(sMon,1);

  g_idays := DaysInAMonth(strToInt(sYear),strToInt(sMon));
  g_sEndDay := DateToStr(EndOfAMonth(strToInt(sYear),strToInt(sMon)));
  g_sEndDay := FormatDateTime('yyyy/mm/dd',strToDate(g_sEndDay));
  g_sBegDay := DateToStr(StartOfAMonth(strToInt(sYear),strToInt(sMon)));
  g_sBegDay := FormatDateTime('yyyy/mm/dd',strToDate(g_sBegDay));

  {***驗證月份是否有效------------------------------------***}

  if length(month.Text)<>6 then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_month_null'),mtError,[mbyes],1);
    month.SetFocus;
    exit;
  end
  else
  begin
    if length(month.Text )<>6 then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'dut03_dateerror'),mtError,[mbyes],1);
      exit;
    end;
    try
      lcYear:=StrToInt(LeftStr(month.Text,4));
      lcMonth:=StrToInt(RightStr(month.Text,2));
    except
      exit;
    end;
    if (lcMonth>12) or (lcMonth<1) or (lcYear>2100) or (lcYear<1900) then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'dut03_dateerror'),mtError,[mbyes],1);
      exit;
    end;
  end;

  {***驗證工號是否為空------------------------------------***}

  if empRadio.Checked then
  begin
    if (empBegId.Text='') or (empEndId.Text='') then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'msg_empid_null'),mtError,[mbyes],1);
      exit;
    end;
  end;

  {***驗證是否選擇部門------------------------------------***}

  if deptRadio.Checked then
  begin
    if (deptBegCob.Text='') or (deptEndCob.Text='') then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'msg_cho_dept'),mtError,[mbyes],1);
      exit;
    end;
  end;

  {***取輸入月份(月結月份)的員工號---------------------***}

  with fetchEmpQry do
  begin
    close;
    sql.Clear;
    sSelStr := 'select emp_id,emp_name,dept_code,dept_abbr,pst_code,pst_name,'+
    'sal_bas,bas_amt,sal_frn,frn_amt,local_amt,tryout,t_date'+
    ' from vfhrdsalgrd as d '+
    'where 1=''1'' ';
    if empRadio.Checked then
      sSelStr := sSelStr+' and emp_id between '''+empBegId.Text+''' '+
      'and '''+empEndId.Text+''' ';
    if deptRadio.Checked then
      sSelStr := sSelStr+' and dept_code between '''+LeftStr(deptBegCob.Text,6)+''' '+
      'and '''+LeftStr(deptEndCob.Text,6)+''' order by d.emp_id';
    sql.Add(sSelStr);
    try
      open;
    except
      widemessagedlg(GetLangName(g_sLangStr,'msg_add_error'),mtError,[mbyes],1);
      exit;
    end;

    {***取得資料進行如下操作---------------------------***}

    sal_bas := 0;
    sal_frn := 0;
    fix_add := 0;
    f_award := 0;
    local_amt := 0;
    adjust := 0;

    if RecordCount>0 then
    begin
      setProcessBar(true,1,RecordCount*3);
      First;
      while Not Eof do
      begin
        setProcessBar(false,1);
        sTmpEmpId := FieldValues['emp_id'];
        if chkLedt(sTmpEmpId)='' then
        begin
          //儅月在職,儅月前進廠
          if FormatDateTime('yyyymm',fieldByName('t_date').Value)<month.Text then
          begin
            sal_bas := FieldByname('bas_amt').AsFloat;
            sal_frn := FieldByname('frn_amt').AsFloat;
            fix_add := FieldByname('fix_add').AsFloat;
            f_award := FieldByname('f_award').AsFloat;
            sal_bas := sal_bas-sal_bas*(getHolDays(sTmpEmpId)/26);
            sal_frn := sal_frn-sal_frn*(getHolDays(sTmpEmpId)/26);
            fix_add := fix_add-fix_add*(getHolDays(sTmpEmpId)/26);
            f_award := f_award-f_award*(getHolDays(sTmpEmpId)/26);
            local_amt := FieldByname('local_amt').AsFloat;
            adjust := 0;
            saveSal(sTmpEmpId,sal_bas,sal_frn,fix_add,f_award,adjust,local_amt);
          end;
          if FormatDateTime('yyyymm',fieldByName('t_date').Value)=month.Text then
          begin
            //儅月在職,儅月進廠
            sal_bas := FieldByname('bas_amt').AsFloat;
            sal_frn := FieldByname('frn_amt').AsFloat;
            fix_add := FieldByname('fix_add').AsFloat;
            f_award := FieldByname('f_award').AsFloat;
            sal_bas := sal_bas-sal_bas*(getHolDays(sTmpEmpId)/26);
            sal_frn := sal_frn-sal_frn*(getHolDays(sTmpEmpId)/26);
            fix_add := fix_add-fix_add*(getHolDays(sTmpEmpId)/26);
            f_award := f_award-f_award*(getHolDays(sTmpEmpId)/26);
            if g_sBegDay<>FormatDateTime('yyyy/mm/dd',FieldByName('t_date').AsDateTime) then
            begin
              sal_bas := (sal_bas/26)*getWorkDays(strToDate(g_sEndDay),FieldByName('t_date').AsDateTime);
              sal_frn := (sal_frn/26)*getWorkDays(strToDate(g_sEndDay),FieldByName('t_date').AsDateTime);
              fix_add := (fix_add/26)*getWorkDays(strToDate(g_sEndDay),FieldByName('t_date').AsDateTime);
              f_award := (f_award/26)*getWorkDays(strToDate(g_sEndDay),FieldByName('t_date').AsDateTime);
            end;
            local_amt := FieldByname('local_amt').AsFloat;
            adjust := 0;
            saveSal(sTmpEmpId,sal_bas,sal_frn,fix_add,f_award,adjust,local_amt);
          end;
        end
        else
        begin
          //當月離職
          if FormatDateTime('yyyy/mm/dd',strToDate(chkLedt(sTmpEmpId)))=g_sBegDay then
          begin
            // 月初離職
          end
          else if FormatDateTime('yyyy/mm/dd',strToDate(chkLedt(sTmpEmpId)))=g_sEndDay then
          begin
            // 月末離職
            sal_bas := FieldByname('bas_amt').AsFloat;
            sal_frn := FieldByname('frn_amt').AsFloat;
            fix_add := FieldByname('fix_add').AsFloat;
            f_award := FieldByname('f_award').AsFloat;
            sal_bas := sal_bas-sal_bas*(getHolDays(sTmpEmpId)/26);
            sal_frn := sal_frn-sal_frn*(getHolDays(sTmpEmpId)/26);
            fix_add := fix_add-fix_add*(getHolDays(sTmpEmpId)/26);
            f_award := f_award-f_award*(getHolDays(sTmpEmpId)/26);
            local_amt := FieldByname('local_amt').AsFloat;
            adjust := 0;
            saveSal(sTmpEmpId,sal_bas,sal_frn,fix_add,f_award,adjust,local_amt);
          end
          else
          begin
            //  月中離職
            sal_bas := FieldByname('bas_amt').AsFloat;
            sal_frn := FieldByname('frn_amt').AsFloat;
            fix_add := FieldByname('fix_add').AsFloat;
            f_award := FieldByname('f_award').AsFloat;

            sal_bas := sal_bas-sal_bas*(getHolDays(sTmpEmpId)/26);
            sal_frn := sal_frn-sal_frn*(getHolDays(sTmpEmpId)/26);
            fix_add := fix_add-fix_add*(getHolDays(sTmpEmpId)/26);
            f_award := f_award-f_award*(getHolDays(sTmpEmpId)/26);

            sal_bas := (sal_bas/26)*getWorkDays(FieldByName('t_date').AsDateTime,strToDate(g_sBegDay));
            sal_frn := (sal_frn/26)*getWorkDays(FieldByName('t_date').AsDateTime,strToDate(g_sBegDay));
            fix_add := (fix_add/26)*getWorkDays(FieldByName('t_date').AsDateTime,strToDate(g_sBegDay));
            f_award := (f_award/26)*getWorkDays(FieldByName('t_date').AsDateTime,strToDate(g_sBegDay));
            local_amt := FieldByname('local_amt').AsFloat;
            adjust := 0;
            saveSal(sTmpEmpId,sal_bas,sal_frn,fix_add,f_award,adjust,local_amt);
          end;
        end;
        next;
      end;
    end;
  end;
  setProcessBar(true);
end;

Function TFormFhrd304.getHolDays(sEmpId:string):Real;
var
  relDays : Real;
  temptime : integer;
begin
  with getHolQry do
  begin
    close;
    sql.Clear;
    sql.Add('select * from fhrd_hol where emp_id='''+sEmpId+''' and (cls_id=''06'' or cls_id=''05'') order by up_date');
    try
      open;
    except
    end;
    relDays := 0;
    while Not Eof do
    begin
      if FormatDateTime('yyyy/mm',FieldByName('up_date').AsDateTime)=FormatDateTime('yyyy/mm',strToDate(month.Text)) then
      begin
        relDays := relDays+GetWorkDays(FieldByName('down_date').AsDateTime,FieldByName('up_date').AsDateTime)-1;
        tempTime := round(strToInt(LeftStr(FieldByName('down_time').AsString,2))-StrToInt(LeftStr(FieldByName('up_time').AsString,2)));
        if (tempTime<8) and (tempTime>4) then
          relDays := relDays+1
        else if (tempTime<=4) then
          relDays := relDays+0.5
        else if (tempTime>=8) then
          relDays := relDays+1;
        if FieldbyName('cls_id').AsString='06' then
          relDays := relDays*0.8;
      end;
      Next;
    end;
  end;
  result := relDays;
end;

Function TFormfhrd304.getWorkDays(end_day:TDateTime;valid_day:TDateTime):integer;
var
  relDay,i : integer;
  sEnd,sVad : string;
  chkDay : string;
begin
  relDay := 0;
  sEnd := RightStr(FormatDateTime('yyyy/mm/dd',end_day),2);
  sVad := RightStr(FormatDateTime('yyyy/mm/dd',valid_day),2);
  For i:=StrToInt(sVad) to StrToInt(sEnd) do
  begin
    chkDay := LeftStr(FormatDateTime('yyyy/mm/dd',end_day),length(FormatDateTime('yyyy/mm/dd',end_day))-2)+IntToStr(i);
    if DayOfWeek(strToDate(chkDay))<>1 then
      relDay := relDay+1;
  end;
  result := relDay;
end;


{********************************
Name: fetchSal
Func: 取工資資料
Args:
    sSelStr->查詢語句
*********************************}

procedure TFormFhrd304.fetchSal;
var
  sSelStr : string;
  lcYear,lcMonth : integer;
begin
  {***驗證月份是否有效***}

  if month.Text='' then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_month_null'),mtError,[mbyes],1);
    month.SetFocus;
    exit;
  end
  else
  begin
    if length(month.Text )<>6 then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'dut03_dateerror'),mtError,[mbyes],1);
      exit;
    end;
    try
      lcYear:=StrToInt(LeftStr(month.Text,4));
      lcMonth:=StrToInt(RightStr(month.Text,2));
    except
      exit;
    end;
    if (lcMonth>12) or (lcMonth<1) or (lcYear>2100) or (lcYear<1900) then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'dut03_dateerror'),mtError,[mbyes],1);
      exit;
    end;
  end;

  {***驗證月份是否已月結-----------------------------------------***}

  try
    with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from close_f where c_month='''+month.Text+'''');
      open;
      if RecordCount<0 then
      begin
        // 未月結
        widemessagedlg(GetLangName(g_sLangStr,'msg_no_mduty'),mtError,[mbyes],1);
        exit;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_chkmdut_error'),
    mtError,[mbyes],1);
  end;

  try
    with fetchSalQry do
    begin
      close;
      sql.Clear;
      sSelStr := 'select distinct s.emp_id,(select emp_name from fhrd_emp '+
      'where emp_id=s.emp_id) as emp_name,s.on_duty,s.off_duty,s.night1_duty,'+
      's.night1_price,s.night2_duty,s.night2_price,s.night3_duty,s.night3_price,'+
      's.sal_bas,s.sal_frn,'+
      's.fix_add,s.f_award,s.adjust,s.dinner_price,s.local_amt '+
      'from fhrd_salary as s,fhrd_emp as e where '+
      's.sal_month='''+month.Text+''' ';
      if empRadio.Checked then
        sSelStr := sSelStr+' and s.emp_id between '''+empBegId.Text+''' '+
        'and '''+empEndId.Text+''' ';
      if deptRadio.Checked then
        sSelStr := sSelStr+' and e.dept_code '+
      'between '''+LeftStr(deptBegCob.Text,6)+''' '+
      'and '''+LeftStr(deptEndCob.Text,6)+''' and s.emp_id=e.emp_id ';
      sSelStr := sSelStr+' and e.emp_info = ''0''  order by s.emp_id';
      sql.Add(sSelStr);
      open;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_fetsal_error'),
    mtError,[mbyes],1);
  end;
end;

procedure TFormfhrd304.saveSal(sempid:string;sal_bas:real;sal_frn:real;fix_add:real;f_award:real;adjust:real;local_amt:real);
begin
  try
    with DMHrdsys.SQLQuery3 do
    begin
      close;
      sql.Clear;
      sql.Add('delete from fhrd_salary where '+
      'sal_month='''+month.Text+''' '+
      'and emp_id='''+sempid+'''');
      ExecSql;
    end;

    with saveSalQry do
    begin
      close;
      Parameters.ParamByName('upd_user').Value:=userName;
      Parameters.ParamByName('sal_month').Value:=month.Text;
      Parameters.ParamByName('emp_id').Value:=sempid;
      Parameters.ParamByName('on_duty').Value:=0;
      Parameters.ParamByName('off_duty').Value:=0;
      Parameters.ParamByName('night1_duty').Value:=0;
      Parameters.ParamByName('night1_price').Value:=0;
      Parameters.ParamByName('night2_duty').Value:=0;
      Parameters.ParamByName('night2_price').Value:=0;
      Parameters.ParamByName('night3_duty').Value:=0;
      Parameters.ParamByName('night3_price').Value:=0;
      Parameters.ParamByName('sal_bas').Value:=sal_bas;
      Parameters.ParamByName('sal_frn').Value:=sal_frn;
      Parameters.ParamByName('fix_add').Value:=fix_add;
      Parameters.ParamByName('f_award').Value:=f_award;
      Parameters.ParamByName('adjust').Value:=0;
      Parameters.ParamByName('local_amt').Value:=local_amt;
      Parameters.ParamByName('dinner_price').Value:=0;
      ExecSql;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_add_error'),mtError,[mbyes],1);
  end;

end;


{***釋放表單***}

procedure TFormfhrd304.exitSubFormClick(Sender: TObject);
begin
  close;
end;

procedure TFormfhrd304.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

end.
