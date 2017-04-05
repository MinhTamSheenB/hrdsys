unit ufhrd211;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,tntDialogs, ExtCtrls,StrUtils, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, TntExtCtrls, TntDBGrids, TntDbCtrls, TntStdCtrls, TntButtons,
  DB, ADODB, DBClient, Provider,DateUtils,WSDLIntf, TntComCtrls, CheckLst,
  TntCheckLst, Menus, TntMenus, ImgList, TntForms, TntDB;

type
  TFormFhrd211 = class(TForm)
    TntPanel1: TTntPanel;
    TntPanel2: TTntPanel;
    TntDBGrid1: TTntDBGrid;
    TntPanel3: TTntPanel;
    TntLabel1: TTntLabel;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    cb_reason: TTntComboBox;
    TntStaticText2: TTntStaticText;
    TntPanel7: TTntPanel;
    TntLabel3: TTntLabel;
    TntLabel7: TTntLabel;
    TntLabel2: TTntLabel;
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
    TntDateTimePicker1: TTntDateTimePicker;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
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
    ADOQuery1notify: TStringField;
    ADOQuery1over_flag: TStringField;
    ADOQuery1emp_chs: TStringField;
    ADOQuery1dept_name: TStringField;
    qry_Temp: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    procedure TBB_searchClick(Sender: TObject);
    procedure bb_resetClick(Sender: TObject);
    procedure id_sDblClick(Sender: TObject);
    procedure id_eDblClick(Sender: TObject);
    procedure dept_beginChange(Sender: TObject);
    procedure cb_reasonChange(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
    procedure ADOQuery1BeforeEdit(DataSet: TDataSet);
    procedure ADOQuery1BeforeInsert(DataSet: TDataSet);
    procedure CheckInput;  //輸入條件檢查
    procedure EnableControls(Value:Boolean);
    procedure FormCreate(Sender: TObject);
    procedure InitLangInfo;
    procedure FormInit;
    procedure UpdateErHist;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFhrd211: TFormFhrd211;

implementation

uses UnitDMHrdsys,UnitHrdUtils;
var
  ws_Words:TWideStrings;
  PanelX,PanelY :integer;
  pri_arr:TPrvArr;
  IsSpcPrv:boolean;//所有特殊權限
  IsSpcPrvA:boolean;//可修改遲到，早退特殊權限

{$R *.dfm}
procedure TFormFhrd211.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  SetComponentLang(self);//set component language text
  //定義要用到的語言
  ThisFormUsedWords:='dut10_error1,dut10_error2,dut10_error3,dut10_error4,dut10_error5,'+
    'msg_confirm_save';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
end;

procedure TFormFhrd211.FormInit;
begin
  att_date.Date := now;
  TntDateTimePicker1.Date  :=now;
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
procedure TFormFhrd211.TBB_searchClick(Sender: TObject);
var
  sqlstr,sql_con:string;
begin
  CheckInput;  //輸入條件檢查
  sqlstr := 'select * from fhrd_dut_day where wrk_date>='''+DateToStr(att_date.Date)+ ''' and wrk_date <= '''+ DateToStr( TntDateTimePicker1.date ) + ''''    ;
  sqlstr := sqlstr +' and ((wrk_sts=''06'') or ((local_sts=''36'')) or (late=''04'') or (early=''05'')) ';
  sql_con := '';
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
    sqlstr := sqlstr+ 'and emp_id in (select emp_id from fhrd_emp where '+sql_con+')';
 // if Checktempuser(username)  = false  then
  //   begin
  //     sql_con:=sql_con + ' and  not exists( select *from hrd_deny_emp where emp_id=hrd_dut_day.emp_id ) '
  //   end;
  with adoquery1 do
  begin
    sql.Clear;
    sql.Add(sqlstr);
    open;
  end;
  EnableControls(false);
end;
{===============================================================================
   EnableControls(Value:Boolean);
===============================================================================}
procedure TFormFhrd211.EnableControls(Value:Boolean);
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

procedure TFormFhrd211.bb_resetClick(Sender: TObject);
begin
   ADOQuery1.Close;
  EnableControls(true);
end;

procedure TFormFhrd211.id_sDblClick(Sender: TObject);
var
  AEmpId:string;
begin
//  AEmpId := findempid('emp_id');
//  if AEmpId<>'' then
//    TTntEdit(sender).Text := AEmpId;
end;

procedure TFormFhrd211.id_eDblClick(Sender: TObject);
var
  AEmpId:string;
begin
 // AEmpId := findempid('emp_id');
 // if AEmpId<>'' then
 //   TTntEdit(sender).Text := AEmpId;
end;

procedure TFormFhrd211.dept_beginChange(Sender: TObject);
begin
    dept_end.Text :=  dept_begin.Text ;
end;

procedure TFormFhrd211.cb_reasonChange(Sender: TObject);
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

        if (trim(adoquery1.fieldbyname('wrk_sts').AsString)='36') then //and (not IsSpcPrv) then
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
  
end;

procedure TFormFhrd211.sb_RecoverClick(Sender: TObject);
begin
  adoquery1.CancelBatch(arAll);
  adoquery4.Close;
  adoquery4.Open;
  cb_reason.Text := '';
  sb_Recover.Enabled:=false;
  sb_Save.Enabled:=false;
end;

procedure TFormFhrd211.sb_SaveClick(Sender: TObject);
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

procedure TFormFhrd211.TntDBGrid1TitleClick(Column: TColumn);
begin
   DBGridSortByTitle(Column);
end;

procedure TFormFhrd211.ADOQuery1AfterClose(DataSet: TDataSet);
begin
  cb_reason.Enabled := false;
  sb_Recover.Enabled:=false;
  sb_Save.Enabled:=false;
end;
procedure  TFormFhrd211.UpdateErHist;
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
procedure TFormFhrd211.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
   if not dataset.Eof then
  begin
    cb_reason.Enabled := true;
  end
  else              
    cb_reason.Enabled := false;
end;

procedure TFormFhrd211.ADOQuery1AfterPost(DataSet: TDataSet);
begin
     sb_Recover.Enabled:=true;
  sb_Save.Enabled:=true;
end;

procedure TFormFhrd211.ADOQuery1BeforeEdit(DataSet: TDataSet);
begin
  UpdateErHist;
end;

procedure TFormFhrd211.ADOQuery1BeforeInsert(DataSet: TDataSet);
begin
   abort;
end;
 procedure TFormFhrd211.CheckInput;
var
  SqlStr:String;
begin

  with adoquery4 do
  begin
    sql.Clear;
    sql.Add('select * from fhrd_dut_erhist where er_date='''+datetostr(dateof(att_date.Date))+''' ');
    open;
  end;
end;
procedure TFormFhrd211.FormCreate(Sender: TObject);
begin
  InitLangInfo;
  FormInit;
end;

end.
