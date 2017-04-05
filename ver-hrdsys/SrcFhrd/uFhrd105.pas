{*************************************************
Unit uFhrd105.pas
AUthor: A zhong
create date: 08/09/2005
*************************************************}

unit uFhrd105;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, DB, ADODB, ExtCtrls, TntExtCtrls, Grids,
  DBGrids, TntDBGrids,WSDLIntf, Buttons, TntButtons,tntDialogs,StrUtils,
  ComCtrls, TntComCtrls;

type
  TFormFhrd105 = class(TForm)
    TntGroupBox1: TTntGroupBox;
    TntLabel2: TTntLabel;
    Emp_idEdit: TTntEdit;
    TntLabel3: TTntLabel;
    Emp_Name_Edit: TTntEdit;
    TntLabel4: TTntLabel;
    DutyEdit: TTntEdit;
    TntLabel5: TTntLabel;
    Dept_TitleEdit: TTntEdit;
    TntLabel6: TTntLabel;
    TntLabel7: TTntLabel;
    TntLabel8: TTntLabel;
    ReMarkEdit: TTntEdit;
    Type_RewardCbo: TTntComboBox;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    TntPanel1: TTntPanel;
    ADOQuery1emp_id: TWideStringField;
    ADOQuery1emp_name: TWideStringField;
    ADOQuery1pst_code: TWideStringField;
    ADOQuery1dept_title: TWideStringField;
    ADOQuery1rap_date: TDateTimeField;
    ADOQuery1rap_id: TWideStringField;
    ADOQuery1rap_reason: TWideStringField;
    BtnSave: TTntBitBtn;
    BtnDelete: TTntBitBtn;
    BtnSubQuit: TTntBitBtn;
    TntLabel1: TTntLabel;
    reason: TTntEdit;
    ADOQuery1rap_remark: TStringField;
    RewardDate: TTntDateTimePicker;
    ADOQuery1pst_name: TStringField;
    ADOQuery1rap_name: TStringField;
    TntGroupBox2: TTntGroupBox;
    TntDBGrid1: TTntDBGrid;
    showEmpId: TTntBitBtn;
    procedure Emp_idEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure DRewardEditKeyPress(Sender: TObject; var Key: Char);
    procedure Emp_idEditKeyPress(Sender: TObject; var Key: Char);
    procedure BtnDeleteClick(Sender: TObject);
    procedure TntDBGrid1CellClick(Column: TColumn);
    procedure BtnSubQuitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure showEmpIdClick(Sender: TObject);

  private
    { Private declarations }
    procedure InitDBgrid;
    procedure setTypeData;
    procedure Initlang;

  public
    { Public declarations }
  end;

var
  FormFhrd105: TFormFhrd105;

implementation

uses
  UnitHrdUtils,unitDMHrdsys,UnitHrdMain,DateUtils, ConvUtils, UnitEmp;

{$R *.dfm}

var
  sLangStr:TWideStrings;

{***********************************************
Name: InitLang
Func: 初始化語言變量
Args:
    sKeys->語言變量
***********************************************}

procedure TFormfhrd105.InitLang;
var sKeys:string;
begin
  sKeys:='fhrd105,emp_id,c_name,fld_pst_code,dept_titl,rp_date,rp_type,'+
  'remark,delete,save,quit,hrd09_error4,msg_rewpub_invalid,msg_add_error,'+
  'maintentdata,browsedata,rp_reason,msg_deleted_error,confirm_close,'+
  'left_work,msg_confirm_save';

sLangStr:=GetLangWideStrs(sKeys);

TntPanel1.Caption:=GetLangName(sLangStr,'fhrd105');
TntGroupBox1.Caption:=GetLangName(sLangStr,'maintentdata');
TntGroupBox2.Caption:=GetLangName(sLangStr,'browsedata');
TntLabel1.Caption:=GetLangName(sLangStr,'rp_reason');
TntLabel2.Caption:=GetLangName(sLangStr,'emp_id');
TntLabel3.Caption:=GetLangName(sLangStr,'c_name');//emp_name
TntLabel4.Caption:=GetLangName(sLangStr,'fld_pst_code');
TntLabel5.Caption:=GetLangName(sLangStr,'dept_titl');
TntLabel6.Caption:=GetLangName(sLangStr,'rp_date');
TntLabel7.Caption:=GetLangName(sLangstr,'rp_type');
TntLabel8.Caption:=GetLangName(sLangstr,'remark');
BtnDelete.Caption:=GetLangName(sLangStr,'delete');
BtnSave.Caption:=GetLangName(sLangStr,'save');
BtnSubQuit.Caption:=GetLangName(sLangStr,'quit');
TntDBGrid1.Columns[0].Title.caption:=GetLangName(sLangStr,'emp_id');
TntDBGrid1.Columns[1].Title.caption:=GetLangName(sLangStr,'c_name');//emp_name
TntDBGrid1.Columns[2].Title.caption:=GetLangName(sLangStr,'fld_pst_code');
TntDBGrid1.Columns[3].Title.caption:=GetLangName(sLangStr,'dept_titl');
TntDBGrid1.Columns[4].Title.caption:=GetLangName(sLangStr,'rp_date');//rap
TntDBGrid1.Columns[5].Title.caption:=GetLangName(sLangStr,'rp_type');
TntDBGrid1.Columns[6].Title.caption:=GetLangName(sLangStr,'rp_reason');
TntDBGrid1.Columns[7].Title.caption:=GetLangName(sLangStr,'remark');

end;

procedure TFormfhrd105.setTypeData;
begin
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.clear;
    sql.Add('select * from fhrd_rapid');
    open;
    while not Eof do
    begin
      Type_RewardCbo.Items.Add(FieldValues['rap_id']+'-'+
                               FieldValues['rap_name'] );
      Next;
    end;
  end;
end;

procedure TFormfhrd105.InitDbgrid;
var st:string;
begin
  with ADOQuery1 do
  begin
    close;
    SQL.Clear;
    st:= 'select e.emp_id,e.emp_name,e.pst_code,(select pst_name '+
    'from fhrd_prof where pst_code=e.pst_code) as pst_name,d.dept_title,'+
      'r.rap_date,r.rap_id,(select rap_name from fhrd_rapid '+
      'where rap_id=r.rap_id) as rap_name,r.rap_reason,r.rap_remark '+
      'from fhrd_emp e,fhrd_dept d,fhrd_rap r '+
      'where '+
      'r.emp_id = e.emp_id and '+
       'e.dept_code = d.dept_code '+
      'order by r.emp_id';
    SQL.Add(st);
    open;
  end;
end;

procedure TFormFhrd105.Emp_idEditChange(Sender: TObject);
var
  SQLstmt:string;
  foundRec:Integer;
begin
  if Length(Emp_idEdit.Text) = 6 then
  begin
    SQLstmt:= 'Select e.emp_name,e.pst_code,'+
    '(select pst_name from fhrd_prof where pst_code=e.pst_code) as pst_name,'+
    'd.dept_title From fhrd_emp e,fhrd_dept d '+
    'Where e.emp_id=''' + Emp_idEdit.Text + ''' '+
    'and e.dept_code = d.dept_code and e.emp_info='''+IntToStr(0)+''' ';
    DMHrdsys.SQLQuery1.Close;
    DMHrdsys.SQLQuery1.SQL.Clear;
    DMHrdsys.SQLQuery1.SQL.Add(SQLstmt);
    DMHrdsys.SQLQuery1.Open;
    foundRec:= DMHrdsys.SQLQuery1.RecordCount;
    if foundRec>0 then
    begin
      Emp_Name_Edit.Text:= DMHrdsys.SQLQuery1.FieldValues['emp_name'];
      if VarIsNull(DMHrdsys.SQLQuery1.FieldValues['pst_code'])
      or VarIsNull(DMHrdsys.SQLQuery1.FieldValues['pst_name']) then
        DutyEdit.Text := ''
      else
        DutyEdit.Text := DMHrdsys.SQLQuery1.FieldValues['pst_code']+'/'+
      DMHrdsys.SQLQuery1.FieldValues['pst_name'];
      Dept_TitleEdit.Text := DMHrdsys.SQLQuery1.FieldValues['dept_title'];
    end
    else
    begin
      widemessagedlg(GetLangName(sLangStr,'hrd09_error4')+' or '+
      GetLangName(sLangStr,'left_work'),mtError,[mbyes],1);
      Emp_idEdit.SetFocus;
      Emp_Name_Edit.Text := '';
      DutyEdit.Text := '';
      Dept_TitleEdit.Text :='';
    end;
    ADOQuery1.Locate('emp_id',Emp_idEdit.Text,[loPartialKey]);
  end;
end;

procedure TFormFhrd105.FormCreate(Sender: TObject);
begin
  initlang;
  setTypeData;
  ShortDateFormat := 'yyyymmdd';
  InitDBGrid;
  ReWardDate.Date := Date;
end;

procedure TFormFhrd105.BtnSaveClick(Sender: TObject);
begin
  if strToDate(FormatDateTime('yyyy/mm/dd',RewardDate.Date))>
  strToDate(FormatDateTime('yyyy/mm/dd',date))then
  begin
    widemessagedlg(GetLangName(sLangStr,'msg_rewpub_invalid'),
    mtError,[mbyes],1);
    exit;
  end;

  if WideMessageDlg(GetLangName(sLangStr,'msg_confirm_save'),mtWarning,mbOKCancel,0) = ID_OK then
  begin
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from fhrd_rap where emp_id='''+Emp_idEdit.Text+''' and '+
    'rap_id='''+LeftStr(Type_RewardCbo.Text,2)+''' and '+
    'rap_date='''+DateToStr(RewardDate.Date)+'''');
    open;
    if RecordCount>0 then
    begin
      try
        close;
        sql.Clear;
        sql.Add('update fhrd_rap set rap_reason='''+reason.Text+''','+
        'rap_remark='''+ReMarkEdit.Text+''' where '+
        'emp_id='''+Emp_idEdit.Text+''' and '+
        'rap_id='''+LeftStr(Type_RewardCbo.Text,2)+''' and '+
        'rap_date='''+DateToStr(RewardDate.Date)+'''');
        ExecSql;
      except
      end;
    end
    else
    begin
      try
        with DMHrdsys.SQLQuery1 do
        begin
          close;
          sql.Clear;
          sql.Add('insert into fhrd_rap (upd_user,emp_id,rap_id,'+
                  'rap_date,rap_reason,rap_remark) '+
                  'values (:upd_user,:emp_id,:rap_id,'+
                  ':rap_date,:rap_reason,:rap_remark)');
          Parameters.ParamValues['upd_user']:=UserName;
          Parameters.ParamValues['emp_id']:=LeftStr(Emp_idEdit.Text,6);
          Parameters.ParamValues['rap_id']:=LeftStr(Type_RewardCbo.Text,2);
          Parameters.ParamValues['rap_date']:= FormatDateTime('yyyy/mm/dd',RewardDate.Date);
          Parameters.ParamValues['rap_reason']:=reason.Text;
          Parameters.ParamValues['rap_remark']:=ReMarkEdit.Text;
          ExecSQL;
        end;
      except
        widemessagedlg(GetLangName(sLangStr,'msg_add_error'),
        mtError,[mbyes],1);
      end;
    end;
  end;
  ADOQuery1.Close;
  ADOQuery1.Open;
  Emp_idEdit.Text := '';
  Emp_Name_Edit.Text := '';
  DutyEdit.Text := '';
  Dept_TitleEdit.Text :='';
  reason.Text := '';
  ReMarkEdit.Text := '';
  Type_RewardCbo.Text := '';
  end;
end;

procedure TFormFhrd105.DRewardEditKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (Key in ['0'..'9',#8]) then
  begin
    Key := chr(0);
  end;
end;

procedure TFormFhrd105.Emp_idEditKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (Key in ['0'..'9',#8]) then
    Key := chr(0);
end;

procedure TFormFhrd105.BtnDeleteClick(Sender: TObject);
begin
  if MessageBox(Handle,pchar('Delete this record,are you sure?'),'Warning',
  MB_YESNO OR MB_ICONQUESTION or MB_DEFBUTTON2)=IDYES then
  begin
    try
      DMHrdsys.SQLQuery1.Close;
      DMHrdsys.SQLQuery1.SQL.Clear;
      DMHrdsys.SQLQuery1.SQL.Add('delete from fhrd_rap where '+
      'emp_id = '''+ADOQuery1.FieldValues['emp_id']+''' and '+
      'rap_id='''+LeftStr(Type_RewardCbo.Text,2)+''' and '+
      'rap_date='''+DateToStr(RewardDate.Date)+'''');
      DMHrdsys.SQLQuery1.ExecSQL;
      ADOQuery1.Close;
      ADOQuery1.Open;
      Emp_idEdit.Text := '';
      Emp_Name_Edit.Text := '';
      DutyEdit.Text := '';
      Dept_TitleEdit.Text :='';
      reason.Text := '';
      ReMarkEdit.Text := '';
      Type_RewardCbo.Text := '';
    except
      widemessagedlg(GetLangName(sLangStr,'msg_deleted_error'),
      mtError,[mbyes],1);
    end;
  end
  else
    abort;
end;

procedure TFormFhrd105.TntDBGrid1CellClick(Column: TColumn);
begin
  Emp_idEdit.Text := TntDBGrid1.Columns.Grid.Fields[0].Value;
  Emp_Name_Edit.Text := TntDBGrid1.Columns.Grid.Fields[1].Value;
  DutyEdit.Text := ADOQuery1.FieldValues['pst_code']+'/'+
  ADOQuery1.FieldValues['pst_name'];
  Dept_TitleEdit.Text := TntDBGrid1.Columns.Grid.Fields[3].Value;
  RewardDate.Date := strToDate(ADOQuery1.FieldValues['rap_date']) ;
  Type_RewardCbo.Text := ADOQuery1.FieldValues['rap_id']+'/'+
  ADOQuery1.FieldValues['rap_name'];
  if VarIsNull(TntDBGrid1.Columns.Grid.Fields[6].Value) then
    reason.Text := ''
  else
    reason.Text := TntDBGrid1.Columns.Grid.Fields[6].Value;
  if VarIsNull(TntDBGrid1.Columns.Grid.Fields[7].Value) then
    REMarKEdit.Text := ''
  else
    ReMarkEdit.Text := TntDBGrid1.Columns.Grid.Fields[7].Value;
end;

procedure TFormFhrd105.BtnSubQuitClick(Sender: TObject);
begin
  close;
end;

procedure TFormFhrd105.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFormFhrd105.showEmpIdClick(Sender: TObject);
begin
 Emp_idEdit.Text := FindEmpId('emp_id');
end;

end.
