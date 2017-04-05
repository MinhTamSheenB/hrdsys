unit UnitDut10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,tntDialogs, ExtCtrls,StrUtils, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, TntExtCtrls, TntDBGrids, TntDbCtrls, TntStdCtrls, TntButtons,
  DB, ADODB, DBClient, Provider,DateUtils,WSDLIntf, TntComCtrls, CheckLst,
  TntCheckLst, Menus, TntMenus, ImgList, TntForms, TntDB;

type
  TformDut10 = class(TForm)
    TntPanel1: TTntPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    TntPanel2: TTntPanel;
    TntDBGrid1: TTntDBGrid;
    TntPanel3: TTntPanel;
    qry_Temp: TADOQuery;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1wrk_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1seg_code: TStringField;
    ADOQuery1clas_code: TStringField;
    ADOQuery1s_start: TStringField;
    ADOQuery1s_end: TStringField;
    ADOQuery1real_start: TStringField;
    ADOQuery1real_end: TStringField;
    ADOQuery1wrk_sts: TStringField;
    ADOQuery1late: TStringField;
    ADOQuery1early: TStringField;
    ADOQuery1over_flag: TStringField;
    ADOQuery1notify: TStringField;
    TntLabel1: TTntLabel;
    cb_reason: TTntComboBox;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    TntPanel7: TTntPanel;
    TntLabel3: TTntLabel;
    dept_begin: TTntComboBox;
    dept_end: TTntComboBox;
    id_s: TTntEdit;
    id_e: TTntEdit;
    cb_id: TTntCheckBox;
    cb_dept: TTntCheckBox;
    TBB_search: TTntBitBtn;
    bb_reset: TTntBitBtn;
    att_date: TTntDateTimePicker;
    TntStaticText1: TTntStaticText;
    TntLabel7: TTntLabel;
    TntLabel2: TTntLabel;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    ADOQuery1emp_chs: TStringField;
    ADOQuery1dept_name: TStringField;
    TntStaticText2: TTntStaticText;
    procedure InitLangInfo;
    procedure FormInit;
    procedure FormCreate(Sender: TObject);
    procedure cb_idClick(Sender: TObject);
    procedure cb_deptClick(Sender: TObject);
    procedure TBB_searchClick(Sender: TObject);
    procedure id_sDblClick(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure UpdateErHist;
    procedure CheckInput;  //輸入條件檢查
    procedure EnableControls(Value:Boolean);
    procedure ADOQuery1BeforeEdit(DataSet: TDataSet);
    procedure cb_reasonChange(Sender: TObject);
    procedure bb_resetClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADOQuery1BeforeInsert(DataSet: TDataSet);
    procedure dept_beginChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formDut10: TformDut10;

implementation

uses
  UnitDMHrdsys,UnitHrdUtils;
{$R *.dfm}
var
  ws_Words:TWideStrings;
  PanelX,PanelY :integer;
  pri_arr:TPrvArr;
  IsSpcPrv:boolean;//所有特殊權限
  IsSpcPrvA:boolean;//可修改遲到，早退特殊權限

procedure TformDut10.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  SetComponentLang(self);//set component language text
  //定義要用到的語言
  ThisFormUsedWords:='dut10_error1,dut10_error2,dut10_error3,dut10_error4,dut10_error5,'+
    'msg_confirm_save';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
end;

procedure TformDut10.FormInit;
begin
  att_date.Date := now;
  GetDeptRange(dept_begin);
  GetDeptRange(dept_end);
  pri_arr:=GetPrvArr(username,'dut10');
  IsSpcPrv:=HaveSpcPrv(username,'dut10');
  IsSpcPrvA:=HaveSpcPrv(username,'dut10A');
  if IsSpcPrvA or IsSpcPrv then
  begin//有限特殊權限
    SetComboxList('select err_code+''-''+err_chs from hrd_ereason',cb_reason);
    tntDBGrid1.Options:=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
  end
  else
  begin
    SetComboxList('select err_code+''-''+err_chs from hrd_ereason where with_spc=''0''',cb_reason);
    tntDBGrid1.Options:=[dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
  end;
  if IsSpcPrv then
  begin//全部特殊權限
    tntDBGrid1.Columns[10].ReadOnly:=false;
  end;
//  SetComboxList('select clas_code+''-''+clas_chs from hrd_dut_class where clas_code>=''08'' and clas_code<=''15''',cb_reason);
end;

procedure TformDut10.FormCreate(Sender: TObject);
begin
  InitLangInfo;
  FormInit;
end;
{===============================================================================
  輸入條件檢查
===============================================================================}
procedure TformDut10.CheckInput;
var
  SqlStr:String;
begin
 { with qry_Temp do
  begin
    SqlStr := 'select * from sysobjects where xtype=''U '' and name=''hrd_dut_day'+
      formatdatetime('yymmdd',att_date.date)+''' ';
    SQL.Clear;
    SQL.Add(sqlstr);
    Open;
    if Eof then
    begin
      WideMessagedlg(GetLangName(ws_Words,'dut10_error1'),mtError,[mbOk],0);
      Exit;
    end;
  end;  }
  with adoquery4 do
  begin
    sql.Clear;
    sql.Add('select * from hrd_dut_erhist where er_date='''+datetostr(dateof(att_date.Date))+''' ');
    open;
  end;
end;
{===============================================================================
   EnableControls(Value:Boolean);
===============================================================================}
procedure TFormDut10.EnableControls(Value:Boolean);
begin
  cb_id.Enabled := Value;
  //cb_dept.Enabled := Value;
  id_s.Enabled := Value;
  id_e.Enabled := Value;
  dept_begin.Enabled := Value;
  dept_end.Enabled := Value;
  tbb_search.Enabled := Value;
  att_date.Enabled := Value;
  bb_Reset.Enabled:=not Value;
end;
procedure TformDut10.cb_idClick(Sender: TObject);
begin
  if cb_id.Checked then
  begin
    id_s.Enabled := true;
    id_e.Enabled := true;
  end
  else
  begin
    id_s.Enabled := false;
    id_e.Enabled := false;
  end;
end;

procedure TformDut10.cb_deptClick(Sender: TObject);
begin
  if cb_dept.Checked then
  begin
    dept_begin.Enabled := true;
    dept_end.Enabled := true;
  end
  else
  begin
    dept_begin.Enabled := false;
    dept_end.Enabled := false;
  end;
end;

procedure TformDut10.TBB_searchClick(Sender: TObject);
var
  sqlstr,sql_con:string;
begin
  CheckInput;  //輸入條件檢查
  sqlstr := 'select * from hrd_dut_day where wrk_date='''+DateToStr(att_date.Date)+
            ''' and ((wrk_sts=''06'') or ((wrk_sts=''36'')) or (late=''04'') or (early=''05'')) ';
  //sql_con := '';
  //2012-09-07 hyt add
  sql_con:=G_sFactorySql+' ';

  if cb_id.Checked then
  begin
    if trim(id_s.Text)<>'' then
      sqlstr := sqlstr+' and emp_id>='''+trim(id_s.Text)+''' ';
    if trim(id_e.Text)<>'' then
      sqlstr := sqlstr+' and emp_id<='''+trim(id_e.Text)+''' ';
  end;
  if cb_dept.Checked then
  begin
    if trim(dept_begin.Text)<>'' then
    begin
      if sql_con<>'' then
        sql_con := sql_con+' and dept_code>='''+leftstr(dept_begin.Text,6)+''' '
      else
        sql_con := ' dept_code>='''+leftstr(dept_begin.Text,6)+''' ';
    end;
    if trim(dept_end.Text)<>'' then
    begin
      if sql_con<>'' then
        sql_con := sql_con+' and dept_code<='''+leftstr(dept_end.Text,6)+''' '
      else
        sql_con := ' dept_code<='''+leftstr(dept_end.Text,6)+''' ';
    end;
  end;
  if sql_con<>'' then
    sqlstr := sqlstr+ 'and emp_id in (select emp_id from hrd_emp where '+sql_con+')';
  with adoquery1 do
  begin
    sql.Clear;
    sql.Add(sqlstr);
    open;
  end;
  EnableControls(false);
end;

procedure TformDut10.id_sDblClick(Sender: TObject);
var
  AEmpId:string;
begin
  AEmpId := findempid('emp_id');
  if AEmpId<>'' then
    TTntEdit(sender).Text := AEmpId;
end;

procedure TformDut10.TntDBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;

procedure TformDut10.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
  if not dataset.Eof then
  begin
    cb_reason.Enabled := true;
  end
  else              
    cb_reason.Enabled := false;
end;

procedure TformDut10.ADOQuery1AfterClose(DataSet: TDataSet);
begin
  cb_reason.Enabled := false;
  sb_Recover.Enabled:=false;
  sb_Save.Enabled:=false;
end;

procedure  TformDut10.UpdateErHist;
var
  arr:array[1..4] of string;
begin
  arr[1]:= adoquery1.fieldbyname('emp_id').Value;
  arr[2]:= adoquery1.fieldbyname('seg_code').Value;
  arr[3]:= adoquery1.fieldbyname('s_start').Value;
  arr[4]:= adoquery1.fieldbyname('s_end').Value;
  with adoquery4 do
  begin
    if not Locate('emp_id;seg_code;s_start;s_end',varArrayOf([arr[1],arr[2],arr[3],arr[4]]),[loCaseInsensitive]) then
    begin
      append;
      FieldByName('upd_user').Value := UserName;
      FieldByName('upd_date').Value := GetServerDatetime;
      FieldByName('emp_id').Value := adoquery1.fieldbyname('emp_id').value;
      FieldByName('seg_code').Value := adoquery1.fieldbyname('seg_code').value;
      FieldByName('clas_code').Value := adoquery1.fieldbyname('clas_code').value;
      FieldByName('er_date').Value := dateof(att_date.Date);
      FieldByName('s_start').Value := adoquery1.fieldbyname('s_start').value;
      FieldByName('s_end').Value := adoquery1.fieldbyname('s_end').value;
      FieldByName('late').Value := adoquery1.fieldbyname('late').value;
      FieldByName('early').Value := adoquery1.fieldbyname('early').value;
      FieldByName('er_time').Value := adoquery1.fieldbyname('real_start').value;
      fieldbyname('ps_time').value := adoquery1.fieldbyname('real_end').value;
      fieldbyname('status').value := '0';
    end;
  end;
end;
procedure TformDut10.ADOQuery1BeforeEdit(DataSet: TDataSet);
begin
  UpdateErHist;
end;

procedure TformDut10.cb_reasonChange(Sender: TObject);
var
  arr:array[1..4] of string;
  i:integer;
begin
  if trim(leftstr(cb_reason.Text,2))='' then
    exit;
  with tntdbgrid1.SelectedRows do
  begin
    for i:=0 to count-1 do
    begin
      if indexof(items[i])<>-1 then
      begin
        TntDBGrid1.Datasource.Dataset.Bookmark:= Items[i];
        {//特殊權限才能沖銷遲到早退
        if (trim(adoquery1.fieldbyname('late').AsString)<>'') and (not IsSpcPrv) then
          continue;
        if (trim(adoquery1.fieldbyname('early').AsString)<>'' and (not IsSpcPrv) then
          continue;}
        if (trim(adoquery1.fieldbyname('wrk_sts').AsString)='36') and (not IsSpcPrv) then
          continue;//特殊權限才能沖銷刷卡位置異常
        if (trim(leftstr(cb_reason.Text,2))>='01') and (trim(leftstr(cb_reason.Text,2))<='05') then
        begin
          adoquery1.edit;
          if adoquery1.fieldbyname('real_start').Value <> '****' then
            adoquery1.fieldbyname('real_start').Value := '%%%%';
          if adoquery1.fieldbyname('real_end').Value <> '****' then
            adoquery1.fieldbyname('real_end').Value := '%%%%';
          adoquery1.fieldbyname('wrk_sts').Value :='';
          //adoquery1.fieldbyname('late').Value :='';
          //adoquery1.fieldbyname('early').Value :='';
          AdoQuery1.Post;
        end
        else
        begin
          adoquery1.edit;
          if adoquery1.fieldbyname('real_start').Value <> '****' then
            adoquery1.fieldbyname('real_start').Value := '%%%%';
          if adoquery1.fieldbyname('real_end').Value <> '****' then
            adoquery1.fieldbyname('real_end').Value := '%%%%';
          adoquery1.fieldbyname('wrk_sts').Value :='';
          //adoquery1.fieldbyname('late').Value :='';
          //adoquery1.fieldbyname('early').Value :='';
          //adoquery1.fieldbyname('clas_code').Value :=trim(leftstr(cb_reason.Text,2));
          ADOQuery1.Post;
        end;
        arr[1]:= adoquery1.fieldbyname('emp_id').Value;
        arr[2]:= adoquery1.fieldbyname('seg_code').Value;
        arr[3]:= adoquery1.fieldbyname('s_start').Value;
        arr[4]:= adoquery1.fieldbyname('s_end').Value;

        if adoquery4.Locate('emp_id;seg_code;s_start;s_end',varArrayOf([arr[1],arr[2],arr[3],arr[4]]),[loCaseInsensitive]) then
        begin
          adoquery4.Edit;
          adoquery4.fieldbyname('er_reason').value := trim(leftstr(cb_reason.Text,2));
          ADOQuery4.Post;
        end;
      end;
    end;
  end;
  {with adoquery1 do
  begin
    first;
    while not eof do
    begin

      if (trim(leftstr(cb_reason.Text,2))>='01') and (trim(leftstr(cb_reason.Text,2))<='05') then
      begin
        edit;
        if fieldbyname('real_start').Value <> '****' then
          fieldbyname('real_start').Value := '%%%%';
        if fieldbyname('real_end').Value <> '****' then
          fieldbyname('real_end').Value := '%%%%';

        fieldbyname('wrk_sts').Value :='';
        fieldbyname('late').Value :='';
        fieldbyname('early').Value :='';
      end
      else
      begin
        edit;
        if fieldbyname('real_start').Value <> '****' then
          fieldbyname('real_start').Value := '%%%%';
        if fieldbyname('real_end').Value <> '****' then
          fieldbyname('real_end').Value := '%%%%';
        fieldbyname('wrk_sts').Value :='';
        fieldbyname('late').Value :='';
        fieldbyname('early').Value :='';
        fieldbyname('clas_code').Value :=trim(leftstr(cb_reason.Text,2));
      end;
      arr[1]:= fieldbyname('emp_id').Value;
      arr[2]:= fieldbyname('seg_code').Value;
      arr[3]:= fieldbyname('s_start').Value;
      arr[4]:= fieldbyname('s_end').Value;

      if adoquery4.Locate('emp_id;seg_code;s_start;s_end',varArrayOf([arr[1],arr[2],arr[3],arr[4]]),[loCaseInsensitive]) then
      begin
        adoquery4.Edit;
        adoquery4.fieldbyname('er_reason').value := trim(leftstr(cb_reason.Text,2));
      end;
      next;
    end;
  end;  }
end;

procedure TformDut10.bb_resetClick(Sender: TObject);
begin
  ADOQuery1.Close;
  EnableControls(true);
end;

procedure TformDut10.sb_RecoverClick(Sender: TObject);
begin
  adoquery1.CancelBatch(arAll);
  adoquery4.Close;
  adoquery4.Open;
  cb_reason.Text := '';
  sb_Recover.Enabled:=false;
  sb_Save.Enabled:=false;
end;

procedure TformDut10.sb_SaveClick(Sender: TObject);
begin
  if widemessagedlg(GetLangName(ws_Words,'msg_confirm_save'),mtInformation,[mbOk,mbCancel],0)=mrOk then
  begin
    DMHrdsys.conn.BeginTrans;
    try
      adoquery1.UpdateBatch(arAll);
      adoquery4.UpdateBatch(arAll);
      DMHrdsys.conn.CommitTrans;
      cb_reason.Text := '';
      sb_Recover.Enabled:=false;
      sb_Save.Enabled:=false;
    except
      WideMessageDlg(GetLangName(ws_Words,'msg_confirm_save'),mtInformation,[mbYes],0);
      DMHrdsys.conn.RollbackTrans;
      exit;
    end;
  end;
end;

procedure TformDut10.ADOQuery1AfterPost(DataSet: TDataSet);
begin
  sb_Recover.Enabled:=true;
  sb_Save.Enabled:=true;
end;

procedure TformDut10.ADOQuery1CalcFields(DataSet: TDataSet);
{var
  EmpName,EmpId,EmpMonth,DeptCode:String;
  aFields:TFields;}
begin
  {EmpId:=DataSet.FieldByName('emp_id').AsString;
  EmpMonth:=FormatDateTime('yyyymm',DataSet.FieldByName('wrk_date').AsDateTime);
  aFields:=GetEmpInfo(EmpId,EmpMonth);
  EmpName:=aFields.FieldByName('emp_chs').AsString;
  DeptCode:=aFields.FieldByName('dept_code').AsString+' '+aFields.FieldByName('abbr_titl').AsString;;
  DataSet.FieldByName('emp_chs').AsString:=EmpName;
  DataSet.FieldByName('dept_name').AsString:=DeptCode;}
end;

procedure TformDut10.ADOQuery1BeforeInsert(DataSet: TDataSet);
begin
  abort;
end;

procedure TformDut10.dept_beginChange(Sender: TObject);
begin
  dept_end.Text :=dept_begin.Text ;
end;

end.
