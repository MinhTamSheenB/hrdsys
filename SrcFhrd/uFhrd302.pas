{******************************************************************************
name：fhrd302(員工轉正資料維護)
author: tristan
create date:2005-08-18
commentate:員工轉正資料維護
*******************************************************************************}

unit uFhrd302;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, ExtCtrls, TntExtCtrls, Grids, DBGrids,
  TntDBGrids, Buttons, TntButtons, DBCtrls, DB,StrUtils,WSDLIntf, Mask,
  TntDbCtrls, ComCtrls,TntComCtrls, ADODB,tntDialogs, DateUtils,TntGrids,
  CheckLst, TntCheckLst;

type
  TFormfhrd302 = class(TForm)
    TntPanel1: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntGroupBox2: TTntGroupBox;
    TntGroupBox3: TTntGroupBox;
    unTransGrid: TTntDBGrid;
    transGrid: TTntDBGrid;
    TntLabel2: TTntLabel;
    TntLabel3: TTntLabel;
    TntLabel4: TTntLabel;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    TntLabel7: TTntLabel;
    TntLabel8: TTntLabel;
    TntLabel9: TTntLabel;
    saveData: TTntBitBtn;
    empId: TTntEdit;
    empName: TTntEdit;
    pstCob: TTntComboBox;
    deptCob: TTntComboBox;
    baseCob: TTntComboBox;
    foreignCob: TTntComboBox;
    foreignSal: TTntEdit;
    localAmt: TTntEdit;
    totalSal: TTntEdit;
    empQuery: TADOQuery;
    empSource: TDataSource;
    exitSubForm: TTntBitBtn;
    saveDataQry: TADOQuery;
    baseSal: TTntEdit;
    TntLabel1: TTntLabel;
    fetchTransQry: TADOQuery;
    transDataSource: TDataSource;
    tDate: TTntDateTimePicker;
    TntEdit1: TTntEdit;

    // user create function and procedure

    procedure InitLang;
    procedure setCob;
    procedure chgDeptCob(deptCode : string);
    procedure chgPstCob(pstCode : string);

    // system create proceudre

    procedure FormCreate(Sender: TObject);
    procedure empQueryAfterScroll(DataSet: TDataSet);
    procedure saveDataClick(Sender: TObject);
    procedure baseCobChange(Sender: TObject);
    procedure foreignCobChange(Sender: TObject);
    procedure pstCobChange(Sender: TObject);
    procedure exitSubFormClick(Sender: TObject);
    procedure empIdChange(Sender: TObject);
    procedure transGridTitleClick(Column: TColumn);
    procedure unTransGridTitleClick(Column: TColumn);
    procedure unTransGridCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd302: TFormfhrd302;

implementation

uses
  UnitHrdUtils,unitDMHrdsys,UnitHrdMain;

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

procedure TFormfhrd302.InitLang;
var
  sKeys : string;
begin

  sKeys:='fhrd302,save,quit,emp_id,fld_department,c_name,sal_bas,sal_frn,'+
  'total,table_field_pst_name,total,local_amt,fld_epindt,cvdate,t_date,'+
  'dept_code,fld_pst_code,fld_epindt,frn_grade,bas_grade,maintentdata'+
  ',browsedata,untransemp,confirm_close,msg_set_pst,msg_set_dept,msg_chk_tdate,'+
  'msg_initbase_error,msg_initforeign_error,msg_fetbase_error,hrd09_error4,'+
  'msg_fetforeign_error,msg_localamt_null,msg_empid_null,msg_localamt_total,'+
  'msg_updsalstru_error,msg_add_error,msg_chg_dept,msg_chg_position,'+
  'msg_confirm_save';

  g_sLangStr:=GetLangWideStrs(sKeys);

  TntPanel1.Caption:=GetLangName(g_sLangStr,'fhrd302');
  saveData.Caption:=GetLangName(g_sLangStr,'save');
  exitSubForm.Caption:=GetLangName(g_sLangStr,'quit');
  TntLabel1.Caption:=GetLangName(g_sLangStr,'emp_id');
  TntLabel2.Caption:=GetLangName(g_sLangStr,'c_name');
  TntLabel3.Caption:=GetLangName(g_sLangStr,'table_field_pst_name');
  TntLabel4.Caption:=GetLangName(g_sLangStr,'fld_department');
  TntLabel5.Caption:=GetLangName(g_sLangStr,'sal_bas');
  TntLabel6.Caption:=GetLangName(g_sLangStr,'sal_frn');
  TntLabel7.Caption:=GetLangName(g_sLangStr,'t_date');
  TntLabel8.Caption:=GetLangName(g_sLangStr,'local_amt');
  TntLabel9.Caption:=GetLangName(g_sLangStr,'total');
  unTransGrid.Columns[0].Title.caption:=GetLangName(g_sLangStr,'emp_id');
  unTransGrid.Columns[1].Title.caption:=GetLangName(g_sLangStr,'c_name');
  unTransGrid.Columns[2].Title.caption:=GetLangName(g_sLangStr,'dept_code');
  unTransGrid.Columns[3].Title.caption:=GetLangName(g_sLangStr,'fld_pst_code');
  unTransGrid.Columns[4].Title.caption:=GetLangName(g_sLangStr,'fld_epindt');
  unTransGrid.Columns[5].Title.caption:=GetLangName(g_sLangStr,'cvdate');
  transGrid.Columns[0].Title.caption:=GetLangName(g_sLangStr,'emp_id');
  transGrid.Columns[1].Title.caption:=GetLangName(g_sLangStr,'c_name');
  transGrid.Columns[2].Title.caption:=GetLangName(g_sLangStr,'fld_department');
  transGrid.Columns[3].Title.caption:=GetLangName(g_sLangStr,'table_field_pst_name');
  transGrid.Columns[4].Title.caption:=GetLangName(g_sLangStr,'bas_grade');
  transGrid.Columns[5].Title.caption:=GetLangName(g_sLangStr,'sal_bas');
  transGrid.Columns[6].Title.caption:=GetLangName(g_sLangStr,'frn_grade');
  transGrid.Columns[7].Title.caption:=GetLangName(g_sLangStr,'sal_frn');
  transGrid.Columns[8].Title.caption:=GetLangName(g_sLangStr,'local_amt');
  transGrid.Columns[9].Title.caption:=GetLangName(g_sLangStr,'t_date');
  TntGroupBox1.Caption:=GetLangName(g_sLangStr,'untransemp');
  TntGroupBox2.Caption:=GetLangName(g_sLangStr,'maintentdata');
  TntGroupBox3.Caption:=GetLangName(g_sLangStr,'browsedata');
end;

{********************************************
Name: setCob
Func: 初始化下拉框數據
Args:
********************************************}

procedure TFormFhrd302.setCob;
begin

  {***初始化職務數據***}
  try
    with DMHrdsys.SQLQuery2 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from fhrd_prof order by pst_code');
      open;
      while not Eof do
      begin
        pstCob.Items.Add(FieldByName('pst_code').Value+'/'+
        FieldByName('pst_name').Value);
        next;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_set_pst'),
    mtError,[mbyes],1);
  end;

  {***初始化部門數據***}
  try
    with DMHrdsys.SQLQuery2 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from fhrd_dept order by dept_code');
      open;
      while not Eof do
      begin
        deptCob.Items.Add(FieldByName('dept_code').Value+'/'+
        FieldByName('dept_abbr').Value);
        next;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_set_dept'),
    mtError,[mbyes],1);
  end;
end;

{**************************************
Name: chgPstCob
Func: 改變職位下拉框數值
Args:
***************************************}

procedure TFormFhrd302.chgPstCob(pstCode : string);
var
  i : integer;
begin
  For i:=0 to pstCob.Items.Count-1 do
  begin
    if LeftStr(pstCob.Items.Strings[i],2)=pstCode then
    begin
      pstCob.ItemIndex := i;
      break;
    end;
  end;

  baseCob.Items.Clear;
  foreignCob.Items.Clear;
  {***初始化本薪數據***}
  try
    with DMHrdsys.SQLQuery2 do
    begin
      close;
      sql.Clear;
      sql.Add('select pst_code,(select pst_name '+
      'from fhrd_prof where pst_code=fhrd_salgrd.pst_code) '+
      'as pst_name,grade from fhrd_salgrd where '+
      'pst_code='''+pstCode+''' and '+
      'item_id='''+IntToStr(0)+IntToStr(1)+'''');
      open;
      while Not Eof do
      begin
        baseCob.Items.Add(FieldByName('pst_code').Value+'-'+FieldByName('pst_name').Value+'/'+
        FieldByName('grade').Value);
        next;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_initbase_error'),
    mtError,[mbyes],1);
  end;

  {***初始化海外津貼數據***}
  try
    with DMHrdsys.SQLQuery2 do
    begin
      close;
      sql.Clear;
      sql.Add('select pst_code,(select pst_name '+
      'from fhrd_prof where pst_code=fhrd_salgrd.pst_code) '+
      'as pst_name,grade from fhrd_salgrd where '+
      'pst_code='''+pstCode+''' and '+
      'item_id='''+IntToStr(0)+IntToStr(2)+'''');
      open;
      while Not Eof do
      begin
        foreignCob.Items.Add(FieldByName('pst_code').Value+'-'+
        FieldByName('pst_name').Value+'/'+
        FieldByName('grade').Value);
        next;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_initforeign_error'),
    mtError,[mbyes],1);
  end;
end;

{*****************************************
Name: chgDeptCob
Func: 改變部門下拉框數值
Args:
*****************************************}

procedure TFormFhrd302.chgDeptCob(deptCode : string);
var
  i : integer;
begin
  For i:=0 to deptCob.Items.Count-1 do
  begin
    if LeftStr(deptCob.Items.Strings[i],6)=deptCode then
    begin
      deptCob.ItemIndex := i;
      break;
    end;
  end;
end;

procedure TFormfhrd302.FormCreate(Sender: TObject);
begin
  InitLang;
  setCob;
  if not empQuery.Active then
    empQuery.Active := true;
  if not fetchTransQry.Active then
    fetchTransQry.Active := true;
  tDate.Date := Date;
end;

procedure TFormfhrd302.empQueryAfterScroll(DataSet: TDataSet);
var
  i : integer;
begin
  if not VarIsNull(empQuery.FieldValues['emp_id']) then
  begin
    empId.Text := empQuery.FieldValues['emp_id'];
    empName.Text := empQuery.FieldValues['emp_name'];
    localAmt.Text := empQuery.FieldValues['local_amt'];
    chgPstCob(empQuery.FieldValues['pst_code']);

    For i:=0 to baseCob.Items.Count-1 do
    begin
      if LeftStr(baseCob.Items.Strings[i],2)=LeftStr(pstCob.Text,2) then
      begin
        baseCob.ItemIndex := i;
        try
          with DMHrdsys.SQLQuery1 do
          begin
            close;
            sql.Clear;
            sql.Add('select amount from fhrd_salgrd '+
            'where item_id='''+InttoStr(0)+IntToStr(1)+''' and '+
            'pst_code='''+LeftStr(pstCob.Text,2)+''' and '+
            'grade='''+empQuery.FieldValues['sal_bas']+'''');
            open;
            baseSal.Text := FieldByName('amount').Value;
          end;
        except
          widemessagedlg(GetLangName(g_sLangStr,'msg_fetbase_error'),
          mtError,[mbyes],1);
        end;
        break
      end;
    end;

    For i:=0 to foreignCob.items.count-1 do
    begin
      if LeftStr(foreignCob.Items.Strings[i],2)=LeftStr(pstCob.Text,2) then
      begin
        foreignCob.ItemIndex := i;
        try
          with DMHrdsys.SQLQuery1 do
          begin
            close;
            sql.Clear;
            sql.Add('select amount from fhrd_salgrd '+
            'where item_id='''+InttoStr(0)+IntToStr(2)+''' and '+
            'pst_code='''+LeftStr(pstCob.Text,2)+''' and '+
            'grade='''+empQuery.FieldValues['sal_frn']+'''');
            open;
            foreignSal.Text := FieldByName('amount').Value;
          end;
        except
          widemessagedlg(GetLangName(g_sLangStr,'msg_fetforeign_error'),
          mtError,[mbyes],1);
        end;
        break;
      end;
    end;
    if (baseSal.Text<>'') and (foreignSal.Text<>'') then
      totalSal.Text :=IntToStr(StrToInt(baseSal.Text)+StrToInt(foreignSal.Text));

    chgDeptCob(empQuery.FieldValues['dept_code']);

    baseSal.Enabled := false;
    foreignSal.Enabled := false;
    totalSal.Enabled :=false;
  end;

end;

{************************************
Name: saveDataClick
Func: 保存轉正資料
Args:
    sInsStr->
************************************}

procedure TFormfhrd302.saveDataClick(Sender: TObject);
var
  sInsStr : string;
  sDept : TStringList;
begin
  if localAmt.Text='' then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_localamt_null'),mtError,[mbyes],1);
    localAmt.SetFocus;
    exit;
  end;

  if empId.Text='' then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_empid_null'),mtError,[mbyes],1);
    empId.SetFocus;
    exit;
  end;

  if StrToInt(localamt.Text)>StrToInt(totalSal.Text) then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_localamt_total'),mtError,[mbyes],1);
    localAmt.SetFocus;
    exit;
  end;

  {***驗證轉正日期***}
  {
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select t_date from fhrd_salstru where emp_id='''+empId.Text+''' ');
    open;
    if RecordCount>0 then
    begin
      if tDate.Date<=strToDate(FieldByName('t_date').Value) then
      begin
        widemessagedlg(GetLangName(g_sLangStr,'msg_chk_tdate'),mtError,[mbyes],1);
        exit;
      end;
    end;
  end;
  }

  if tDate.Date>=(IncMonth(Date,3)) then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_chk_tdate'),mtError,[mbyes],1);
    exit;
  end;

  {***修改薪資結構檔***}
  try
    with saveDataQry do
    begin
      close;
      sql.Clear;
      sInsStr := 'update fhrd_salstru set '+
      'sal_bas='''+RightStr(baseCob.Text,2)+''','+
      'sal_frn='''+RightStr(foreignCob.Text,2)+''','+
      'local_amt='''+localAmt.Text+''','+
      'tryout='''+IntTostr(1)+''',t_date='''+FormatDateTime('yyyy/mm/dd',tDate.Date)+''' '+
      'where emp_id='''+empId.Text+'''';
      sql.Add(sInsStr);
      ExecSql;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_updsalstru_error'),
    mtError,[mbyes],1);
  end;

  {***新增資料到調升檔***}

  if WideMessageDlg(GetLangName(g_sLangStr,'msg_confirm_save'),mtWarning,mbOKCancel,0) = ID_OK then
  begin
  try
    TntEdit1.Text:=empId.Text;
    with DMHrdsys.SQLQuery2 do
    begin
      close;
      sql.Clear;
      sql.Add('insert into fhrd_tranhist (upd_user,valid_date,emp_id,'+
      'dept_code,dept_title,pst_code,sal_bas,bas_amt,sal_frn,frn_amt,local_amt) '+
      'values (:upd_user,:valid_date,:emp_id,:dept_code,:dept_title,:pst_code,'+
      ':sal_bas,:bas_amt,:sal_frn,:frn_amt,:local_amt)');
      Parameters.ParamByName('upd_user').Value:=userName;
      Parameters.ParamByName('valid_date').Value:=FormatDateTime('yyyy/mm/dd',tDate.Date);
      Parameters.ParamByName('emp_id').Value:=empId.Text;
      sDept := StrSplit(deptCob.Text,'/');
      Parameters.ParamByName('dept_code').Value:=sDept[0];
      Parameters.ParamByName('dept_title').Value:=sDept[1];
      Parameters.ParamByName('pst_code').Value:=LeftStr(pstCob.Text,2);
      Parameters.ParamByName('sal_bas').Value:=RightStr(baseCob.Text,2);
      Parameters.ParamByName('bas_amt').Value:=StrToFloat(baseSal.Text);
      Parameters.ParamByName('sal_frn').Value:=RightStr(foreignCob.Text,2);
      Parameters.ParamByName('frn_amt').Value:=StrToFloat(foreignSal.Text);
      Parameters.ParamByName('local_amt').Value:=StrToFloat(localAmt.Text);
      ExecSql;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_add_error'),
    mtError,[mbyes],1);
  end;

  {***如果部門變更，修改員工基本資料部門數據***}

  try
    if LeftStr(deptCob.Text,6)<>empQuery.FieldValues['dept_code'] then
    begin
      with DMHrdsys.SQLQuery3 do
      begin
        close;
        sql.Clear;
        sql.Add('update fhrd_emp set dept_code='''+LeftStr(deptCob.Text,6)+''' where '+
        'emp_id='''+empId.Text+'''');
        ExecSql;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_chg_dept'),
    mtError,[mbyes],1);
  end;

  {***如果職務變更，修改員工基本資料職務數據***}

  try
    if LeftStr(pstCob.Text,2)<>empQuery.FieldValues['pst_code'] then
    begin
      with DMHrdsys.SQLQuery3 do
      begin
        close;
        sql.clear;
        sql.Add('update fhrd_emp set pst_code='''+LeftStr(pstCob.Text,2)+''' where '+
        'emp_id='''+empId.Text+'''');
        ExecSql;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_chg_position'),
    mtError,[mbyes],1);
  end;

  if empQuery.Active then
    empQuery.Active := false;
  if fetchTransQry.Active then
    fetchTransQry.Active := false;

  empQuery.Active := true;
  fetchTransQry.Active := true;

  fetchTransQry.Locate('emp_id',TntEdit1.Text,[loCaseInsensitive]);
  end;
end;

{******************************************
Name: baseCobChange
Func: 本資項目改變,帶出薪資
Args:
******************************************}

procedure TFormfhrd302.baseCobChange(Sender: TObject);
begin

  try
    with DMHrdsys.SQLQuery3 do
    begin
      close;
      sql.Clear;
      sql.Add('select amount from fhrd_salgrd where '+
      'item_id='''+IntToStr(0)+IntToStr(1)+''' and '+
      'pst_code='''+LeftStr(baseCob.Text,2)+''' and '+
      'grade='''+RightStr(trim(baseCob.Text),2)+''' ');
      open;

      if RecordCount>0 then
        baseSal.Text := FieldByName('amount').Value
      else
      begin
        baseSal.Text := '';
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_fetbase_error'),
    mtError,[mbyes],1);
  end;

  {***計算合計***}

  if (baseSal.Text<>'') and (foreignSal.Text<>'') then
    totalSal.Text := IntToStr(StrToInt(baseSal.Text)+StrToInt(foreignSal.Text));

end;

{*******************************************
Name: foreignCobChange
Func: 海外津貼項目改變,帶出薪資
Args:
*******************************************}

procedure TFormfhrd302.foreignCobChange(Sender: TObject);
begin
  try
    with DMHrdsys.SQLQuery3 do
    begin
      close;
      sql.Clear;
      sql.Add('select amount from fhrd_salgrd where '+
      'item_id='''+IntToStr(0)+IntToStr(2)+''' and '+
      'pst_code='''+LeftStr(foreignCob.Text,2)+''' and '+
      'grade='''+RightStr(trim(foreignCob.Text),2)+''' ');
      open;

      if RecordCount>0 then
        foreignSal.Text := FieldByName('amount').Value
      else
      begin
        foreignSal.Text := '';
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_fetforeign_error'),
    mtError,[mbyes],1);
  end;

  {***計算合計***}
  
  if (baseSal.Text<>'') and (foreignSal.Text<>'') then
    totalSal.Text := IntToStr(StrToInt(baseSal.Text)+StrToInt(foreignSal.Text));

end;

{**************************************
Name: pstCobChange
Func: 職位數值改變，相應改動新等數值
Args:
**************************************}

procedure TFormfhrd302.pstCobChange(Sender: TObject);
begin
 chgPstCob(LeftStr(pstCob.Text,2));
 if (Leftstr(pstCob.Text,2)='01') or (Leftstr(pstCob.Text,2)='02') or
  (Leftstr(pstCob.Text,2)='13') or (Leftstr(pstCob.Text,2)='14') then
  begin
    localAmt.Text := '50';
  end
  else
    localAmt.Text := '100';
end;

{******************************************
Name: exitSubFormClick
Func: 退出當前畫面
Args:
    curIndex->
*******************************************}

procedure TFormfhrd302.exitSubFormClick(Sender: TObject);
begin
  close;
end;

{********************************************
Name: empIdChange
Func: 輸入工號帶出相應數據，如果存在
Args:
    sSelStr->
*********************************************}

procedure TFormfhrd302.empIdChange(Sender: TObject);
var
  sSelStr : string;
begin
  if Length(empId.Text)=6 then
  begin
    try
      with DMHrdsys.SQLQuery1 do
      begin
        close;
        sql.Clear;
        sSelStr := 'SELECT e.emp_id,e.emp_name,e.dept_code,e.pst_code,'+
        'e.emp_etdt,e.emp_gvdt FROM fhrd_emp as e INNER JOIN '+
        ' fhrd_salstru as s ON e.emp_id = s.emp_id WHERE '+
        '(GETDATE() >= DATEADD(month, 3, e.emp_gvdt)) '+
        'AND (e.emp_info = '''+IntToStr(0)+''') AND '+
        '(s.tryout = '''+IntToStr(0)+''') and e.emp_id='''+trim(empId.Text)+'''';
        sql.Add(sSelStr);
        open;
        if RecordCount>0 then
        begin
          while Not Eof do
          begin
            empName.Text := FieldByName('emp_name').Value;
            chgDeptCob(FieldByName('dept_code').Value);
            chgPstCob(FieldByName('pst_code').Value);
            empQuery.Locate('emp_id',empId.Text,[loPartialKey]);
            next;
          end;
        end;
      end;
    except
      widemessagedlg(GetLangName(g_sLangStr,'hrd09_error4'),
      mtError,[mbyes],1);
    end;
  end;
end;

procedure TFormfhrd302.transGridTitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;

procedure TFormfhrd302.unTransGridTitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;

procedure TFormfhrd302.unTransGridCellClick(Column: TColumn);
var
  i : Integer;
begin
  if not VarIsNull(empQuery.FieldValues['emp_id']) then
  begin
    empId.Text := empQuery.FieldValues['emp_id'];
    empName.Text := empQuery.FieldValues['emp_name'];
    localAmt.Text := empQuery.FieldValues['local_amt'];
    chgPstCob(empQuery.FieldValues['pst_code']);

    For i:=0 to baseCob.Items.Count-1 do
    begin
      if LeftStr(baseCob.Items.Strings[i],2)=LeftStr(pstCob.Text,2) then
      begin
        baseCob.ItemIndex := i;
        try
          with DMHrdsys.SQLQuery1 do
          begin
            close;
            sql.Clear;
            sql.Add('select amount from fhrd_salgrd '+
            'where item_id='''+InttoStr(0)+IntToStr(1)+''' and '+
            'pst_code='''+LeftStr(pstCob.Text,2)+''' and '+
            'grade='''+empQuery.FieldValues['sal_bas']+'''');
            open;
            baseSal.Text := FieldByName('amount').Value;
          end;
        except
          widemessagedlg(GetLangName(g_sLangStr,'msg_fetbase_error'),
          mtError,[mbyes],1);
        end;
        break
      end;
    end;

    For i:=0 to foreignCob.items.count-1 do
    begin
      if LeftStr(foreignCob.Items.Strings[i],2)=LeftStr(pstCob.Text,2) then
      begin
        foreignCob.ItemIndex := i;
        try
          with DMHrdsys.SQLQuery1 do
          begin
            close;
            sql.Clear;
            sql.Add('select amount from fhrd_salgrd '+
            'where item_id='''+InttoStr(0)+IntToStr(2)+''' and '+
            'pst_code='''+LeftStr(pstCob.Text,2)+''' and '+
            'grade='''+empQuery.FieldValues['sal_frn']+'''');
            open;
            foreignSal.Text := FieldByName('amount').Value;
          end;
        except
          widemessagedlg(GetLangName(g_sLangStr,'msg_fetforeign_error'),
          mtError,[mbyes],1);
        end;
        break;
      end;
    end;
    if (baseSal.Text<>'') and (foreignSal.Text<>'') then
      totalSal.Text :=IntToStr(StrToInt(baseSal.Text)+StrToInt(foreignSal.Text));

    chgDeptCob(empQuery.FieldValues['dept_code']);

    baseSal.Enabled := false;
    foreignSal.Enabled := false;
    totalSal.Enabled :=false;
  end;
end;

procedure TFormfhrd302.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:= caFree;
end;

end.
