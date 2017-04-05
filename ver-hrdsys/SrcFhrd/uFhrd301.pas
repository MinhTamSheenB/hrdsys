{============================vodailamson========================================
Program name: Quan ly ho chieu va tien luong can bo nguoi nuoc ngoai
Form name: Formfhrd301
Authors: Vo Dai Lam Son
Begin code date: 2005/08/15
End code date: 2005/08/19
===============================================================================}

unit uFhrd301;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, StdCtrls, TntStdCtrls, ExtCtrls, TntExtCtrls, Grids,
  DBGrids, TntDBGrids, Buttons, TntButtons, DB, ADODB, WSDLIntf, tntDialogs,
  Menus, ImgList, DBCtrls;

type
  TFormfhrd301 = class(TTntForm)
    TntPanel1: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntGroupBox2: TTntGroupBox;
    TntGroupBox3: TTntGroupBox;
    TntDBGrid1: TTntDBGrid;
    TntDBGrid2: TTntDBGrid;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    TntLabel3: TTntLabel;
    TntLabel4: TTntLabel;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    TntLabel7: TTntLabel;
    TntLabel8: TTntLabel;
    TntEdit1: TTntEdit;
    TntEdit2: TTntEdit;
    TntComboBox1: TTntComboBox;
    TntComboBox2: TTntComboBox;
    TntComboBox3: TTntComboBox;
    TntEdit3: TTntEdit;
    TntComboBox4: TTntComboBox;
    TntEdit4: TTntEdit;
    TntEdit6: TTntEdit;
    TntBitBtn1: TTntBitBtn;
    TntBitBtn2: TTntBitBtn;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOQuery5: TADOQuery;
    saveQuery: TADOQuery;
    empChangeQuery: TADOQuery;
    PopupMenu1: TPopupMenu;
    Reloadform: TMenuItem;
    N1: TMenuItem;
    Cancle1: TMenuItem;
    Delete: TMenuItem;
    ImageList1: TImageList;
    TntEdit5: TTntEdit;

    // user create function or procedure

    procedure InitLang;
    procedure DBShowPstName;
    procedure DBShowDepartment;
    procedure DBShowSalTitle(sPstCode : string);
    procedure DBGetOneRow;

    // system create procedure

    procedure TntFormCreate(Sender: TObject);
    procedure TntBitBtn2Click(Sender: TObject);
    procedure TntDBGrid1CellClick(Column: TColumn);
    procedure TntDBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TntDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TntEdit1Change(Sender: TObject);
    procedure TntBitBtn1Click(Sender: TObject);
    procedure TntEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure TntDBGrid2TitleClick(Column: TColumn);
    procedure ReloadformClick(Sender: TObject);
    procedure TntDBGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TntComboBox3Change(Sender: TObject);
    procedure TntEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure TntComboBox4Change(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure TntComboBox1Change(Sender: TObject);
    procedure TntFormClose(Sender: TObject; var Action: TCloseAction);
    function getDutyGrade(amttype : string ;ItemCodeVal: String): String;
    procedure chgPstCob(pstCode : string);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd301: TFormfhrd301;

implementation

uses
  UnitHrdUtils,unitDMHrdsys,UnitHrdMain, DateUtils, StrUtils;

{$R *.dfm}

var sLangStr:TWideStrings; //used unit WSDLIntf
var sDuty:array[0..10,0..1] of WideString;
var DutynGrade:array[0..20,0..1] of WideString;
var FrnnGrade:array[0..20,0..1] of WideString;

{ TFormfhrd301 }

{===============================================================================
Gan cac nhan tuong ung voi ngon ngu hien thi
Gom 3 ngon ngu: Anh, Viet, Hoa
===============================================================================}

procedure TFormfhrd301.InitLang;
var
  sKeys:String;
begin
  sKeys:= 'fhrd301,new_employee,maintentdata,browsedata,save,quit,confirm_close,'+
          'emp_id,fld_emp_name,fld_name_en,dept_code,fld_pstname,'+
          'fld_department,sal_bas,sal_bas,advance,total,dept_titl,'+
          'fld_epindt,cvdate,t_date,sal_frn,hrd09_error4,msg_add_error,'+
          'msg_query_error,msg_deleted_error,msg_initbase_error,'+
          'msg_initforeign_error,msg_cho_base,msg_cho_foreitn,msg_localamt_null,'+
          'msg_localamt_total,msg_confirm_save';

  sLangStr := GetLangWideStrs(sKeys);
  TntPanel1.Caption:= GetLangName(sLangStr,'fhrd301');
  TntGroupBox1.Caption:= GetLangName(sLangStr,'new_employee');
  TntGroupBox2.Caption:= GetLangName(sLangStr,'maintentdata');
  TntGroupBox3.Caption:= GetLangName(sLangStr,'browsedata');
  TntBitBtn1.Caption:= GetLangName(sLangStr,'save');
  TntBitBtn2.Caption:= GetLangName(sLangStr,'quit');

  TntLabel1.Caption:= GetLangName(sLangStr,'emp_id');
  TntLabel2.Caption:= GetLangName(sLangStr,'fld_emp_name');
  TntLabel3.Caption:= GetLangName(sLangStr,'fld_pstname');
  TntLabel4.Caption:= GetLangName(sLangStr,'fld_department');

  TntLabel5.Caption:= GetLangName(sLangStr,'sal_bas');
  TntLabel6.Caption:= GetLangName(sLangStr,'sal_frn');
  TntLabel7.Caption:= GetLangName(sLangStr,'advance');
  TntLabel8.Caption:= GetLangName(sLangStr,'total');

  TntDBGrid1.Columns[0].Title.Caption:= GetLangName(sLangStr,'emp_id');
  TntDBGrid1.Columns[1].Title.Caption:= GetLangName(sLangStr,'fld_emp_name');
  TntDBGrid1.Columns[2].Title.Caption:= GetLangName(sLangStr,'fld_pstname');
  TntDBGrid1.Columns[3].Title.Caption:= GetLangName(sLangStr,'dept_code');
  TntDBGrid1.Columns[4].Title.Caption:= GetLangName(sLangStr,'fld_epindt');
  TntDBGrid1.Columns[5].Title.Caption:= GetLangName(sLangStr,'cvdate');

  TntDBGrid2.Columns[0].Title.Caption:= GetLangName(sLangStr,'t_date');
  TntDBGrid2.Columns[1].Title.Caption:= GetLangName(sLangStr,'emp_id');
  TntDBGrid2.Columns[2].Title.Caption:= GetLangName(sLangStr,'fld_emp_name');
  TntDBGrid2.Columns[3].Title.Caption:= GetLangName(sLangStr,'dept_titl');
  TntDBGrid2.Columns[4].Title.Caption:= GetLangName(sLangStr,'fld_pstname');
  TntDBGrid2.Columns[5].Title.Caption:= GetLangName(sLangStr,'sal_bas');
  TntDBGrid2.Columns[6].Title.Caption:= GetLangName(sLangStr,'sal_frn');
  TntDBGrid2.Columns[7].Title.Caption:= GetLangName(sLangStr,'advance');

end;
//==============================================================================

procedure TFormfhrd301.TntFormCreate(Sender: TObject);
begin
  InitLang;

  if not ADOQuery1.Active then
    ADOQuery1.Active := true;
  ADOQuery1.Last;
  if not ADOQuery2.Active then
    ADOQuery2.Active := true;

  DBShowPstName;
  DBShowDepartment;
  DBGetOneRow;
  ShortDateFormat:= 'yyyy/mm/dd';

end;
//==============================================================================

procedure TFormfhrd301.TntBitBtn2Click(Sender: TObject);
begin
    Close;
end;
//==============================================================================

procedure TFormfhrd301.DBShowPstName;
{===============================================================================
Xuat ra gia tri cua tat ca cac ChucVu hien co
===============================================================================}
var I:Integer;
begin
  With ADOQuery3 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT pst_code,pst_name FROM fhrd_prof order by pst_code');
    Open;
    First;
    I:=0;
    while not Eof do begin
    //gan gia tri cho tntCombobox1
      TntComboBox1.Items.Add(FieldByName('pst_code').Value+''+FieldValues['pst_name']);
      sDuty[I][0]:= ADOQuery3.FieldByName('pst_code').Value;
      sDuty[I][1]:= ADOQuery3.FieldByName('pst_name').Value;
      Next; I:=I+1;
    end;
  end;
end;
//==============================================================================

procedure TFormfhrd301.DBShowDepartment;
{---------------------------------------
Xuat ra MaBoPhan va TenBoPhan
----------------------------------------}
begin
  with ADOQuery4 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT dept_code,dept_abbr FROM fhrd_dept ORDER BY dept_code');
    Open;
    First;
    while not Eof do begin
    //gan gia tri cho hop tntCombox2
      TntComboBox2.Items.Add(ADOQuery4.FieldByName('dept_code').Value +
      '-' + ADOQuery4.FieldByName('dept_abbr').Value);
      Next;
    end;
  end;
end;
//==============================================================================

procedure TFormfhrd301.TntDBGrid1CellClick(Column: TColumn);
begin
  DBGetOneRow;
end;

{===============================================================================
Lay cac gia tri cac cot tren DBGrid1
===============================================================================}
procedure TFormfhrd301.DBGetOneRow;
begin
  If ADOQuery1.RecordCount>0 Then
  Begin
      TntEdit1.Text:= ADOQuery1.FieldValues['emp_id'];
  End
end;
//==============================================================================

procedure TFormfhrd301.TntDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  DBGetOneRow;
end;
//==============================================================================

procedure TFormfhrd301.TntDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  DBGetOneRow;
end;

//==============================================================================
procedure TFormfhrd301.TntEdit1Change(Sender: TObject);
var
  SQLstmt:String;
  I:Integer;
begin
  SQLstmt:= 'SELECT emp_id,emp_name,pst_code,dept_code '+
            'FROM fhrd_emp '+
            'WHERE emp_id=:empID '+
            'and emp_id NOT IN (SELECT emp_id FROM fhrd_salstru) '+
            'ORDER BY emp_id';
  with empChangeQuery do begin
    Close;
    SQL.Clear;
    SQL.Add(SQLstmt);
    Parameters.ParamValues['empID']:= TntEdit1.Text;
    try
      Open;
      ADOQuery1.Locate('emp_id',TntEdit1.Text,[loPartialKey]);
      if empChangeQuery.RecordCount > 0 then begin
        TntEdit2.Text:= FieldValues['emp_name'];

        for I:=0 to TntComboBox1.Items.Count-1 do
          if LeftStr(TntComboBox1.Items[I],2)= FieldValues['pst_code'] then
          begin
            TntComboBox1.ItemIndex:= I;
            break;
          end;
        for I:=0 to TntComboBox2.Items.Count-1 do
          if LeftStr(TntComboBox2.Items[I],6)=FieldValues['dept_code'] then
          begin
            TntComboBox2.ItemIndex:= I;
            break;
          end;
        DBShowSalTitle(FieldValues['pst_code']);
      end
      else
      begin
        if Length(TntEdit1.Text) = 6 then
        begin
          widemessagedlg(GetLangName(sLangStr,'hrd09_error4'),
          mtError,[mbyes],1);
          TntEdit1.SelectAll;
        end;
        TntEdit2.Text:= '';
        TntComboBox1.ItemIndex:= -1;
        TntComboBox2.ItemIndex:= -1;
      end;
    finally
      Close;
      SQL.Clear;
    end;
  end;
end;
//==============================================================================
procedure TFormfhrd301.TntBitBtn1Click(Sender: TObject);
begin
  if TntComboBox3.Text='' then
  begin
    widemessagedlg(GetLangName(sLangStr,'msg_cho_base'),mtError,[mbyes],1);
    TntComboBox3.SetFocus;
    exit;
  end;

  if TntComboBox4.Text='' then
  begin
    widemessagedlg(GetLangName(sLangStr,'msg_cho_foreign'),mtError,[mbyes],1);
    TntComboBox4.SetFocus;
    exit;
  end;

  if TntEdit5.Text='' then
  begin
    widemessagedlg(GetLangName(sLangStr,'msg_localamt_null'),mtError,[mbyes],1);
    TntEdit5.SetFocus;
    exit;
  end;

  if StrToInt(tntEdit5.Text)>StrToInt(TntEdit6.Text) then
  begin
    widemessagedlg(GetLangName(sLangStr,'msg_localamt_total'),mtError,[mbyes],1);
    TntEdit5.SetFocus;
    exit;
  end;
  if WideMessageDlg(GetLangName(sLangStr,'msg_confirm_save'),mtWarning,mbOKCancel,0) = ID_OK then
  begin
  with saveQuery do begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO fhrd_tranhist(upd_user,valid_date,emp_id,'+
      'dept_code,dept_title,pst_code,sal_bas,bas_amt,sal_frn,frn_amt,'+
      'local_amt) '+
      'VALUES(:upd_user,:validDate,:empID,:deptCode,:deptTitle,:pstCode,'+
      ':salBas,:basAmt,:salFrn,:frnAmt,:localAmt)');
      Parameters.ParamValues['upd_user']:= UserName;
      Parameters.ParamValues['validDate']:= ADOQuery1.FieldValues['emp_gvdt'];
      Parameters.ParamValues['empID']:= TntEdit1.Text;
      Parameters.ParamValues['deptCode']:= LeftStr(TntComboBox2.Text,6);
      Parameters.ParamValues['deptTitle']:= MidStr(TntComboBox2.Text,8,50);
      Parameters.ParamValues['pstCode']:= LeftStr(TntComboBox1.Text,2);
      Parameters.ParamValues['salBas']:= RightStr(TntComboBox3.Text,2);
      Parameters.ParamValues['basAmt']:= StrToFloat(TntEdit3.Text);
      Parameters.ParamValues['salFrn']:= RightStr(TntComboBox4.Text,2);
      Parameters.ParamValues['frnAmt']:= StrToFloat(TntEdit4.Text);
      Parameters.ParamValues['localAmt']:= StrToFloat(TntEdit5.Text);
      try
        ExecSQL;
        close;
        sql.Clear;
        sql.Add('insert into fhrd_salstru (upd_user,emp_id,sal_bas,sal_frn,'+
        'local_amt,tryout,t_date) values (:upd_user,:emp_id,:sal_bas,:sal_frn,'+
        ':local_amt,:tryout,:t_date)');
        Parameters.ParamValues['upd_user']:=userName;
        Parameters.ParamValues['emp_id']:=TntEdit1.Text;
        Parameters.ParamValues['sal_bas']:=RightStr(TntComboBox3.Text,2);
        Parameters.ParamValues['sal_frn']:=RightStr(TntComboBox4.Text,2);
        Parameters.ParamValues['local_amt']:=StrToFloat(TntEdit5.Text);
        Parameters.ParamValues['tryout']:='0';
        Parameters.ParamValues['t_date']:=ADOQuery1.FieldValues['emp_gvdt'];
        ExecSql;
        if ADOQuery1.FieldValues['dept_code']<>LeftStr(TntComboBox2.Text,6) then
        begin
          with DMHrdsys.SQLQuery1 do
          begin
            close;
            sql.Clear;
            sql.Add('update fhrd_emp set '+
            'dept_code='''+LeftStr(TntComboBox2.Text,6)+''' where '+
            'emp_id='''+TntEdit1.Text+''' ');
            ExecSql;
          end;
        end;
        if ADOquery1.FieldValues['pst_code']<>LeftStr(TntComboBox1.Text,2) then
        begin
          with DMHrdsys.SQLQuery1 do
          begin
            close;
            sql.Clear;
            sql.Add('update fhrd_emp set '+
            'pst_code='''+LeftStr(TntComboBox1.Text,2)+''' where '+
            'emp_id='''+TntEdit1.Text+'''');
            ExecSql;
          end;
        end;
      except
        widemessagedlg(GetLangName(sLangStr,'msg_add_error'),
        mtError,[mbyes],1);
      end;

    if ADOQuery1.Active then
      ADOQuery1.Active := false;
    ADOQuery1.Active := true;
    ADOQuery1.Last;

    TntComboBox3.ItemIndex:=-1;
    TntComboBox4.ItemIndex:=-1;
    TntEdit3.Text:= '';
    TntEdit4.Text:= '';
    TntEdit5.Text:= '';
    TntEdit6.Text:= '';

    if ADOQuery2.Active then
      ADOQuery2.Active := false;
    ADOQuery2.Active := true;

    ADOQuery2.Locate('emp_id',TntEdit1.Text,[loCaseInsensitive]);
  end;
  end;
end;
//==============================================================================

procedure TFormfhrd301.TntEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  //check the key is a number or backspace or point
  if not (Key in ['0'..'9', #8, '.']) then begin
    Key:= #0;
    Beep;
  end;
end;
//==============================================================================
procedure TFormfhrd301.TntDBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;
//==============================================================================
procedure TFormfhrd301.TntDBGrid2TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;
//==============================================================================
procedure TFormfhrd301.DBShowSalTitle(sPstCode : string);
var I,J:Integer;
begin
  TntComBoBox3.Items.Clear;
  TntComBoBox4.Items.Clear;
  with ADOQuery5 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT *,pst_name FROM fhrd_salgrd s,fhrd_prof p ' +
            'WHERE s.pst_code=p.pst_code and p.pst_code='''+sPstCode+''''+
            'ORDER BY p.pst_code,grade');
    try
      Open;
      if ADOQuery5.RecordCount>0 then First;
      I:=0; J:=0;
      while not Eof do begin
        if FieldByName('item_id').Value='01' then begin
          TntComboBox3.Items.Add(FieldByName('pst_code').Value +
                                 FieldByName('pst_name').Value + '/' +
                                 FieldByName('grade').Value);
          DutynGrade[I][0]:= FieldByName('pst_code').Value;
          DutynGrade[I][1]:= FieldByName('grade').Value;
          I:=I+1;
        end
        else begin
          TntComboBox4.Items.Add(FieldByName('pst_code').Value+
                                 FieldByName('pst_name').Value+ '/' +
                                 FieldByName('grade').Value);
          FrnnGrade[J][0]:= FieldByName('pst_code').Value;
          FrnnGrade[J][1]:= FieldByName('grade').Value;
          J:=J+1;
        end;
        Next;
      end;
    except
      widemessagedlg(GetLangName(sLangStr,'msg_query_error'),
      mtError,[mbyes],1);
    end;
  end;
end;
//==============================================================================
procedure TFormfhrd301.ReloadformClick(Sender: TObject);
begin
  ADOQuery2.Close;
  ADOQuery2.Open;
end;
//==============================================================================
procedure TFormfhrd301.TntDBGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ClientPoint, ScreenPoint:TPoint;
begin
  if Button=mbRight then begin
    ClientPoint.X:= X;
    ClientPoint.Y:= Y;
    ScreenPoint:= TntDBGrid2.ClientToScreen(ClientPoint);
    PopupMenu1.Popup(ScreenPoint.X, ScreenPoint.Y);
  end;
end;
//==============================================================================
procedure TFormfhrd301.TntComboBox3Change(Sender: TObject);
var
  sAmount:String;
begin
  if (TntComboBox3.Text = '') then
    exit;
  if (TntComboBox3.ItemIndex > -1) then
    sAmount:= getDutyGrade(TntComboBox3.Text,'01');

  if (sAmount <> '') then begin
    TntEdit3.Text:= sAmount;
    if (TntEdit4.Text <> '') then
      TntEdit6.Text:= FloatToStr( StrToFloat(TntEdit3.Text) + StrToFloat(TntEdit4.Text))
    else
      TntEdit6.Text:= TntEdit3.Text;
  end;

end;
//==============================================================================
procedure TFormfhrd301.TntComboBox4Change(Sender: TObject);
var
  sAmount:String;
begin
  if TntComboBox4.Text='' then exit;
  if (TntComboBox4.ItemIndex > -1) then
    sAmount:= getDutyGrade(TntComboBox4.Text,'02');
  if (sAmount <> '') then begin
    TntEdit4.Text:= sAmount;
    if (TntEdit3.Text <> '') then
      TntEdit6.Text:= FloatToStr( StrToFloat(TntEdit3.Text) + StrToFloat(TntEdit4.Text))
    else
      TntEdit6.Text:= TntEdit4.Text;
  end;

end;
//==============================================================================
procedure TFormfhrd301.DeleteClick(Sender: TObject);
var
  I:Integer;
  //J:Integer;
  s:WideString;
begin
  //===============================================================
  //ShowMessage('Xin loi nha! cai nay tui chua viet, hi hi...');
  //===============================================================
  if TntDBGrid2.SelectedRows.Count>0 then begin
    with TntDBGrid2.DataSource.DataSet do
      for i := 0 to TntDBGrid2.SelectedRows.Count-1 do begin
        GotoBookmark(pointer(TntDBGrid2.SelectedRows.Items[I]));
        if (I>0) and (I<FieldCount) then s:=s+',';
        s:=s+Fields[0].AsString;
      end;
    ADOQuery5.Close;
    ADOQuery5.SQL.Clear;
    ADOQuery5.SQL.Add('DELETE FROM fhrd_tranhist WHERE emp_id in (' + s + ')');
    try
      ADOQuery5.ExecSQL;
    except
      widemessagedlg(GetLangName(sLangStr,'msg_deleted_error'),
      mtError,[mbyes],1);
    end;
    //Nap lai du lieu cho bang TntDBGrid2
    ADOQuery2.Close;
    ADOQuery2.Open;
  end;
end;

procedure TFormFhrd301.chgPstCob(pstCode : string);
var
  i : integer;
begin
  For i:=0 to TntComboBox1.Items.Count-1 do
  begin
    if LeftStr(TntComboBox1.Items.Strings[i],2)=pstCode then
    begin
      TntComboBox1.ItemIndex := i;
      break;
    end;
  end;

  TntComboBox3.Items.Clear;
  TntComboBox4.Items.Clear;
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
        TntComboBox3.Items.Add(FieldByName('pst_code').Value+'-'+FieldByName('pst_name').Value+'/'+
        FieldByName('grade').Value);
        next;
      end;
    end;
  except
    widemessagedlg(GetLangName(sLangStr,'msg_initbase_error'),
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
        TntComboBox4.Items.Add(FieldByName('pst_code').Value+'-'+
        FieldByName('pst_name').Value+'/'+
        FieldByName('grade').Value);
        next;
      end;
    end;
  except
    widemessagedlg(GetLangName(sLangStr,'msg_initforeign_error'),
    mtError,[mbyes],1);
  end;
end;

//==============================================================================

procedure TFormfhrd301.TntComboBox1Change(Sender: TObject);
begin
  chgPstCob(LeftStr(TntComboBox1.Text,2));
  if (Leftstr(TntComboBox1.Text,2)='01') or (Leftstr(TntComboBox1.Text,2)='02') or
  (Leftstr(TntComboBox1.Text,2)='13') or (Leftstr(TntComboBox1.Text,2)='14') then
  begin
    TntEdit5.Text := '50';
  end
  else
    TntEdit5.Text := '100';
end;
//==============================================================================

procedure TFormfhrd301.TntEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  //check the key is a number or backspace or point
  if not (Key in ['0'..'9', #8, '.']) then begin
    Key:= #0;
    Beep;
  end;
end;
//==============================================================================

procedure TFormfhrd301.TntFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

//==============================================================================
//Function tra ve tien luong co ban hoac tro cap doi voi nhan vien nguoi nuoc
//ngoai.
//ItemIndexVal: Integer; 0->n-1
//FrnnGrade[ItemIndexVal][0]: ma chuc vu
//FrnnGrade[ItemIndexVal][1]: xep loai theo chuc vu
//ItemCodeVal: String; 01: Luong co ban ; 02: Tro cap xa nha
//==============================================================================
function TFormfhrd301.getDutyGrade(amttype : string ;ItemCodeVal: String): String;
begin
  with ADOQuery5 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT amount FROM fhrd_salgrd WHERE item_id='''+ItemCodeVal+''' '+
            'and pst_code='''+Leftstr(amttype,2)+''' '+
            'and grade='''+RightStr(amttype,2)+''' ');
    try
      Open;
    except
      widemessagedlg(GetLangName(sLangStr,'msg_query_error'),
      mtError,[mbyes],1);    end;
    if not Eof then
      Result:= FieldValues['amount']
    else
      Result:= '';
  end;
end;

end.
