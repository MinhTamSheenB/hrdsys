{=================================================
unit uFhrd103.pas
authors: LamSon
create date: 08/09/2005
form name: Quan ly ho chieu can bo nguoi nuoc ngoai
==================================================}
unit uFhrd103;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, StdCtrls,
   Grids, DBGrids, TntDBGrids, TntStdCtrls, ExtCtrls, TntExtCtrls,
  DB, ADODB, WSDLIntf, Menus, TntMenus, ImgList, Buttons, TntButtons,
  ComCtrls, TntComCtrls,tntDialogs;

type
  TFormfhrd103 = class(TTntForm)
    TntPanel1: TTntPanel;
    passportQuery: TADOQuery;
    detailsQuery: TADOQuery;
    passportDataSource: TDataSource;
    DataSource1: TDataSource;
    SelectQuery: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    TntPopupMenu1: TTntPopupMenu;
    close_form: TTntMenuItem;
    delete_rec: TTntMenuItem;
    ADOQuery1emp_passport: TWideStringField;
    ADOQuery1emp_id: TWideStringField;
    ADOQuery1emp_name: TWideStringField;
    ADOQuery1dept_title: TWideStringField;
    ADOQuery1visa_type: TWideStringField;
    ADOQuery1from_vsdt: TDateTimeField;
    ADOQuery1due_vsdt: TDateTimeField;
    ADOQuery1visa_serial: TWideStringField;
    ADOQuery4: TADOQuery;
    ImageList1: TImageList;
    TntPanel2: TTntPanel;
    TntGroupBox3: TTntGroupBox;
    TntDBGrid2: TTntDBGrid;
    TntPanel3: TTntPanel;
    TntGroupBox2: TTntGroupBox;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    TntLabel3: TTntLabel;
    TntLabel4: TTntLabel;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    TntLabel7: TTntLabel;
    TntLabel8: TTntLabel;
    TntRadioButton_StyleSingle: TTntRadioButton;
    TntRadioButton_StyleMulti: TTntRadioButton;
    TntEdit_EmpID: TTntEdit;
    TntEdit_EmpName: TTntEdit;
    TntEdit_DeptName: TTntEdit;
    TntEditEmpPassport: TTntEdit;
    TntEdit_VisaID: TTntEdit;
    TntButton_Save: TTntBitBtn;
    TntButtonDelete: TTntBitBtn;
    TntButton_Quit: TTntBitBtn;
    fromDate: TTntDateTimePicker;
    endDate: TTntDateTimePicker;
    TntGroupBox1: TTntGroupBox;
    TntDBGrid1: TTntDBGrid;

    // user create function or procedure

    procedure dbgetRows(Column : TColumn);
    procedure dbGetOneRow;
    procedure dbSelectSQL(KeyFiels: String);
    procedure InitLang;

    // system create procedure

    procedure TntButton_QuitClick(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
    procedure TntDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TntDBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TntButton_SaveClick(Sender: TObject);
    procedure TntEdit_EmpIDChange(Sender: TObject);
    procedure TntEditEmpPassportChange(Sender: TObject);
    procedure TntEdit_EmpIDClick(Sender: TObject);
    procedure TntButtonDeleteClick(Sender: TObject);
    procedure delete_recClick(Sender: TObject);
    procedure TntDBGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TntEdit_EmpDate1KeyPress(Sender: TObject; var Key: Char);
    procedure TntEdit_EmpDate2KeyPress(Sender: TObject; var Key: Char);
    procedure ADOQuery1from_vsdtSetText(Sender: TField;
      const Text: String);
    procedure ADOQuery1from_vsdtGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQuery1due_vsdtGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQuery1due_vsdtSetText(Sender: TField; const Text: String);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure TntFormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd103: TFormfhrd103;

implementation

uses
  UnitHrdUtils,unitDMHrdsys,UnitHrdMain, DateUtils, StrUtils;

{$R *.dfm}

var sLangStr:TWideStrings;

{*******************************************
Name: dbgetRows
Func: 取每條記錄的資料，填充編輯框
Args:
    Column->欄位
*******************************************}

procedure TFormfhrd103.dbgetRows(Column: TColumn);
begin
  if passportQuery.RecordCount > 0 then begin
    TntEdit_EmpID.Text:= passportQuery.FieldValues['emp_id'];
    TntEdit_EmpName.Text:= TntDBGrid1.Columns.Grid.Fields[2].Value;
    TntEdit_DeptName.Text:= TntDBGrid1.Columns.Grid.Fields[4].Value;
    TntEditEmpPassport.Text:= TntDBGrid1.Columns.Grid.Fields[0].Value;
    TntEdit_visaId.Text := '';
    TntButton_Save.Enabled := true;

    TntRadioButton_StyleSingle.Enabled := true;
    TntRadioButton_StyleMulti.Enabled := true;
  end;
end;

{**********************************************
Name: InitLang
Func: 初始化語言變量
Args:
    sKeys->語言變量
**********************************************}

procedure TFormfhrd103.InitLang;
var sKeys:string;
begin
  sKeys:='fhrd103,dept_code,fld_pstname,dept_titl,emp_passport,bdate_passport,'+
         'new_employee,maintentdata,browsedata,save,delete,quit,msg_confirm_save,'+
         'emp_id,c_name,bdate_passport,edate_passport,confirm_close,'+
         'visa_type,visa_serial,format_date,confirm_close,msg_query_error,'+
         'dut05_dateerror,msg_add_error,msg_deleted_error,invalid';
  sLangStr:=GetLangWideStrs(sKeys);

  TntPanel1.Caption:= GetLangName(sLangStr,'fhrd103');
  TntGroupBox1.Caption:=GetLangName(sLangStr,'new_employee');
  TntGroupBox2.Caption:=GetLangName(sLangStr,'maintentdata');
  TntGroupBox3.Caption:=GetLangName(sLangStr,'browsedata');

  TntLabel1.Caption:=GetLangName(sLangStr,'emp_id');
  TntLabel2.Caption:=GetLangName(sLangStr,'c_name');
  TntLabel3.Caption:=GetLangName(sLangStr,'dept_titl');
  TntLabel4.Caption:=GetLangName(sLangStr,'emp_passport');
  TntLabel5.Caption:=GetLangName(sLangStr,'bdate_passport');
  TntLabel6.Caption:=GetLangName(sLangStr,'edate_passport');
  TntLabel7.Caption:=GetLangName(sLangStr,'visa_type');
  TntLabel8.Caption:=GetLangName(sLangStr,'visa_serial');

  TntButton_Save.Caption:=GetLangName(sLangStr,'save');
  TntButtonDelete.Caption:=GetLangName(sLangStr,'delete');
  TntButton_Quit.Caption:=GetLangName(sLangStr,'quit');
  TntButton_Quit.ShowHint:= True;
  TntButton_Quit.Hint:=GetLangName(sLangStr,'confirm_close');
  TntDBGrid1.Columns[0].Title.caption:=GetLangName(sLangStr,'emp_passport');
  TntDBGrid1.Columns[1].Title.caption:=GetLangName(sLangStr,'emp_id');
  TntDBGrid1.Columns[2].Title.caption:=GetLangName(sLangStr,'c_name');
  TntDBGrid1.Columns[3].Title.caption:=GetLangName(sLangStr,'fld_pstname');
  TntDBGrid1.Columns[4].Title.caption:=GetLangName(sLangStr,'dept_titl');

  TntDBGrid2.Columns[0].Title.caption:=GetLangName(sLangStr,'emp_passport');
  TntDBGrid2.Columns[1].Title.caption:=GetLangName(sLangStr,'emp_id');
  TntDBGrid2.Columns[2].Title.caption:=GetLangName(sLangStr,'c_name');
  TntDBGrid2.Columns[3].Title.caption:=GetLangName(sLangStr,'dept_titl');
  TntDBGrid2.Columns[4].Title.caption:=GetLangName(sLangStr,'visa_type');
  TntDBGrid2.Columns[5].Title.caption:=GetLangName(sLangStr,'bdate_passport');
  TntDBGrid2.Columns[6].Title.caption:=GetLangName(sLangStr,'edate_passport');
  TntDBGrid2.Columns[7].Title.caption:=GetLangName(sLangStr,'visa_serial');

end;

procedure TFormfhrd103.TntButton_QuitClick(Sender: TObject);
begin
  Close
end;

procedure TFormfhrd103.TntFormCreate(Sender: TObject);
begin
  if not passportQuery.Active then
    passportQuery.Active := true;
  passportQuery.Open;

  if not ADOQuery1.Active then
    ADOQuery1.Active := true;

  ADOQuery1.Open;
  InitLang;
  dbGetOneRow;
  fromDate.Date := Date;
  endDate.Date := Date;
end;

//---------------------------------------------------------
//Lay 1 dong du lieu cua luoi DBGrid
//---------------------------------------------------------

procedure TFormfhrd103.dbGetOneRow;
begin
  if passportQuery.RecordCount > 0 then begin
    TntEdit_EmpID.Text:= passportQuery.FieldByName('emp_id').Value;
    TntEdit_EmpName.Text:= passportQuery.FieldByName('emp_name').Value;
    TntEdit_DeptName.Text:= passportQuery.FieldByName('dept_title').Value;
    TntEditEmpPassport.Text:= passportQuery.FieldByName('emp_passport').Value;
  end;
end;

procedure TFormfhrd103.TntDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  dbGetOneRow;
end;

procedure TFormfhrd103.TntDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  dbGetOneRow;
end;

//---------------------------------------------------------
//Lay gia tri tu bang fhrd_passport voi dieu kien KeyFiels
//---------------------------------------------------------

procedure TFormfhrd103.dbSelectSQL(KeyFiels: String);
var
  SQLstmt: string;
begin
  SQLstmt:= 'Select passport,from_vsdt,due_vsdt,visa_type,visa_serial ';
  SQLstmt:= SQLstmt + 'From fhrd_passport ';
  SQLstmt:= SQLstmt + 'Where passport=''' + KeyFiels + '''';
  SelectQuery.SQL.Clear;
  SelectQuery.SQL.Add(SQLstmt);
  try
    SelectQuery.Open;
  except
    widemessagedlg(GetLangName(sLangStr,'msg_query_error'),mtError,[mbyes],1);
  end;

  if (SelectQuery.RecordCount>0) then
  begin
    fromDate.Date:= strToDate(SelectQuery.FieldByName('from_vsdt').Value);
    endDate.Date:= strToDate(SelectQuery.FieldByName('due_vsdt').Value);
    if ((SelectQuery.FieldByName('visa_type').Value)='1') then
    begin
      TntRadioButton_StyleSingle.Checked:= True;
      TntRadioButton_StyleMulti.Checked:= False;
    end
    else
    begin
      TntRadioButton_StyleSingle.Checked:= False;
      TntRadioButton_StyleMulti.Checked:= True;
    end;
    TntEdit_VisaID.Text:= SelectQuery.FieldByName('visa_serial').Value;
  end
  else //if not found
  begin
    TntRadioButton_StyleSingle.Checked:= False;
    TntRadioButton_StyleMulti.Checked:= False;
    TntEdit_VisaID.Text:= '';
  end;
end;

//----------------------------------------------------------
//Luu vao bang fhrd_passport
//----------------------------------------------------------

procedure TFormfhrd103.TntButton_SaveClick(Sender: TObject);
var
  emp_search: String;
begin
  emp_search:= TntEdit_EmpID.Text;
  if fromDate.Date>=endDate.Date then
  begin
    widemessagedlg(GetLangName(sLangStr,'dut05_dateerror'),mtError,[mbyes],1);
    exit;
  end;

  {***驗證簽證日期的有效性***}

  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select max(due_vsdt) as due_vsdt from fhrd_passport '+
    'where passport='''+trim(TntEditEmpPassport.Text)+''' ');
    open;
    if (RecordCount>0) and (not VarIsNull(FieldByName('due_vsdt').Value)) then
    begin
      if fromDate.Date<=
      strToDate(FormatDateTime('yyyy/mm/dd',(strToDate(FieldByName('due_vsdt').Value)))) then
      begin
        widemessagedlg(GetLangName(sLangStr,'bdate_passport')+
        GetLangName(sLangStr,'invalid'),mtError,[mbyes],1);
        exit;
      end;
    end;
  end;

  if WideMessageDlg(GetLangName(sLangStr,'msg_confirm_save'),mtWarning,mbOKCancel,0) = ID_OK then
  begin
  try
    with detailsQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Insert Into fhrd_passport(upd_user,passport,from_vsdt,'+
      'due_vsdt,visa_type,visa_serial) '+
      'Values(:upd_user,:passport,:from_vsdt,:due_vsdt,:visa_type,'+
      ':visa_serial)');
      Parameters.ParamValues['upd_user']:= UserName;
      Parameters.ParamValues['passport']:= TntEditEmpPassport.Text;
      Parameters.ParamValues['from_vsdt']:= DateTostr(fromDate.Date);
      Parameters.ParamValues['due_vsdt']:= DateToStr(endDate.Date);
      if TntRadioButton_StyleSingle.Checked then
        Parameters.ParamValues['visa_type']:= '1'
      else
        Parameters.ParamValues['visa_type']:= '2';
      Parameters.ParamValues['visa_serial']:= TntEdit_VisaID.Text;
      try
        ExecSQL;
        ADOQuery1.Locate('emp_id',TntEdit_EmpID.Text,[loCaseInsensitive]);
      except
        widemessagedlg(GetLangName(sLangStr,'msg_add_error'),mtError,[mbyes],1);
      end;
    end;
    finally
      passportQuery.Close;
      passportQuery.Close;
      passportQuery.Open;
      ADOQuery1.Close;
      ADOQuery1.Open;
      dbGetOneRow;
  end;
  ADOQuery1.Locate('emp_id',emp_search,[loPartialKey]);
  end;
end;

procedure TFormfhrd103.TntEdit_EmpIDChange(Sender: TObject);
var SQLstmt: String;
begin
  SQLstmt:='';
  SQLstmt:= 'select emp_passport, emp_name, fhrd_dept.dept_title ' +
            'from fhrd_emp, fhrd_dept ' +
            'where fhrd_emp.dept_code=fhrd_dept.dept_code ' +
            'and emp_passport not in (SELECT passport FROM fhrd_passport) ' +
            'and fhrd_emp.emp_id=''' + Trim(TntEdit_EmpID.Text) + '''';
  ADOQuery4.Close;
  ADOQuery4.SQL.Clear;
  ADOQuery4.SQL.Add(SQLstmt);
  try
    ADOQuery4.Open;
    passportQuery.Locate('emp_id',TntEdit_EmpID.Text,[loPartialKey]);
    if ADOQuery4.RecordCount > 0 then
    begin
      TntEdit_EmpName.Text:= ADOQuery4.FieldValues['emp_name'];
      TntEdit_DeptName.Text:= ADOQuery4.FieldValues['dept_title'];
      TntEditEmpPassport.Text:= ADOQuery4.FieldValues['emp_passport'];
    end;
  except
    widemessagedlg(GetLangName(sLangStr,'msg_query_error'),mtError,[mbyes],1);
  end;
end;

procedure TFormfhrd103.TntEditEmpPassportChange(Sender: TObject);
var
  sKey,SQLstmt : string;
begin
  SQLstmt:='';
  SQLstmt:= 'select emp_passport, emp_name, fhrd_dept.dept_title ' +
            'from fhrd_emp, fhrd_dept ' +
            'where fhrd_emp.dept_code=fhrd_dept.dept_code ' +
            'and emp_passport not in (SELECT passport FROM fhrd_passport) ' +
            'and fhrd_emp.emp_passport=''' +trim(TntEditEmpPassport.Text)+ '''';
  ADOQuery4.Close;
  ADOQuery4.SQL.Clear;
  ADOQuery4.SQL.Add(SQLstmt);
  try
    ADOQuery4.Open;
    passportQuery.Locate('emp_passport',trim(TntEditEmpPassport.Text),[loPartialKey]);
    if ADOQuery4.RecordCount > 0 then
    begin
      TntEdit_EmpName.Text:= ADOQuery4.FieldValues['emp_name'];
      TntEdit_DeptName.Text:= ADOQuery4.FieldValues['dept_title'];
      TntEditEmpPassport.Text:= ADOQuery4.FieldValues['emp_passport'];
    end;
  except
    widemessagedlg(GetLangName(sLangStr,'msg_query_error'),mtError,[mbyes],1);
  end;
  sKey:= TntEditEmpPassport.Text;
  with TntDBGrid2 do
  begin
    Fields[0].LookupList.Add('emp_passport',sKey);
    Next;
  end;
end;

procedure TFormfhrd103.TntEdit_EmpIDClick(Sender: TObject);
begin
  TntEdit_EmpID.SelectAll;
end;

procedure TFormfhrd103.TntButtonDeleteClick(Sender: TObject);
var confirm_del:Integer;
begin
  if ADOQuery1.RecordCount>0 then begin
    with ADOQuery3 do begin
      Close;
      SQL.Clear;
      SQL.Add('Delete From fhrd_passport Where passport=:emp_passport '+
      'and from_vsdt=:from_vsdt');
      Parameters.ParamValues['emp_passport']:=
      ADOQuery1.FieldValues['emp_passport'];
      Parameters.ParamValues['from_vsdt']:=
      ADOQuery1.FieldValues['from_vsdt'];
      confirm_del:= MessageDlg(pchar('do you want to delete this '+
      'value (passport='+trim(ADOQuery1.FieldValues['emp_passport'])+')'),
      mtWarning,mbYesNoCancel,0);
      if confirm_del=6 then begin
        try
          ExecSQL;
        except
          widemessagedlg(GetLangName(sLangStr,'msg_deleted_error'),
          mtError,[mbyes],1);
          exit;
        end;
      end
      else
        exit;
    end;
  end
  else
  begin
    MessageDlg(GetLangName(sLangStr,'msg_deleted_error'),mtWarning,[mbOK],0);
    exit;
  end;
  ADOQuery1.Close;
  ADOQuery1.Open;
  passportQuery.Close;
  passportQuery.Open;
end;

procedure TFormfhrd103.delete_recClick(Sender: TObject);
var
  confirm_del:Integer;
begin
  if ADOQuery1.RecordCount>0 then begin
    with ADOQuery3 do begin
      Close;
      SQL.Clear;
      SQL.Add('Delete From fhrd_passport Where passport=:emp_passport');
      Parameters.ParamValues['emp_passport']:=
      ADOQuery1.FieldValues['emp_passport'];
      confirm_del:= MessageDlg(pchar('do you want to delete this value '+
      '(passport='+trim(ADOQuery1.FieldValues['emp_passport'])+')'),
      mtWarning,mbYesNoCancel,0);
      if confirm_del=6 then begin
        try
          ExecSQL;
        except
          widemessagedlg(GetLangName(sLangStr,'msg_deleted_error'),
          mtError,[mbyes],1);
          exit;
        end;
      end
      else
        exit;
    end;
  end
  else begin
    MessageDlg(GetLangName(sLangStr,'msg_deleted_error'),mtWarning,[mbOK],0);
    exit;
  end;
  ADOQuery1.Close;
  ADOQuery1.Open;
  passportQuery.Close;
  passportQuery.Open;
end;

procedure TFormfhrd103.TntDBGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ClientPoint, ScreenPoint: TPoint;
begin
  if Button = mbRight then
  begin
    ClientPoint.X := X;
    ClientPoint.Y := Y;
    ScreenPoint := TntDBGrid2.ClientToScreen(ClientPoint);
    TntPopupMenu1.Popup(ScreenPoint.X, ScreenPoint.Y)
  end;
end;

procedure TFormfhrd103.TntEdit_EmpDate1KeyPress(Sender: TObject;
  var Key: Char);
begin
  // check if the key is a number or backspace
  if not (Key in ['0'..'9', #8, '/']) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure TFormfhrd103.TntEdit_EmpDate2KeyPress(Sender: TObject;
  var Key: Char);
begin
  // check if the key is a number or backspace
  if not (Key in ['0'..'9', #8, '/']) then
  begin
    Key := #0;
    Beep;
  end;
end;


procedure TFormfhrd103.ADOQuery1from_vsdtSetText(Sender: TField;
  const Text: String);
begin
  if Text = '' then
    Sender.Clear
  else
    Sender.AsString:= Text;
end;

procedure TFormfhrd103.ADOQuery1from_vsdtGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text:= '<underfine>'
  else begin
    ShortDateFormat:= 'yyyy/mm/dd';
    Text:= Sender.AsString;
  end;
end;

procedure TFormfhrd103.ADOQuery1due_vsdtGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text:= '<undefine>'
  else begin
    ShortDateFormat:= 'yyyy/mm/dd';
    Text:= Sender.AsString;
  end;
end;

procedure TFormfhrd103.ADOQuery1due_vsdtSetText(Sender: TField;
  const Text: String);
begin
  if Text='' then
    Sender.Clear
  else
    Sender.AsString:= Text;
end;

procedure TFormfhrd103.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  TntEdit_EmpId.Text := ADOQuery1.FieldValues['emp_id'];
  TntEdit_EmpName.Text := ADOQuery1.FieldValues['emp_name'];
  TntEdit_deptName.Text := ADOQuery1.FieldValues['dept_title'];
  TntEditEmpPassport.Text := ADOQuery1.FieldValues['emp_passport'];
  fromDate.Date := strToDate(ADOQuery1.FieldValues['from_vsdt']);
  endDate.Date := strToDate(ADOQuery1.FieldValues['due_vsdt']);
  TntEdit_visaId.Text := ADOQuery1.FieldValues['visa_serial'];
  if ADOQuery1.FieldValues['visa_type']='single' then
    TntRadioButton_StyleSingle.Checked := true
  else
    TntRadioButton_StyleMulti.Checked := true;
end;

procedure TFormfhrd103.TntFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

end.
