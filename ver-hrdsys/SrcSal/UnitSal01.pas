unit UnitSal01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, StdCtrls, Buttons, TntButtons, TntStdCtrls, ExtCtrls,
  TntExtCtrls, ComCtrls, TntComCtrls,DB, Grids, DBGrids, TntDBGrids,DateUtils,
  TntDialogs,WSDLIntf,StrUtils, ADODB, Mask;

type
  TFormSal01 = class(TTntForm)
    TntPanel1: TTntPanel;
    TntPanel2: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    EditEmpId: TTntEdit;
    TntLabel1: TTntLabel;
    TntSpeedButton1: TTntSpeedButton;
    TntLabel2: TTntLabel;
    EditEmpName: TTntEdit;
    TntGroupBox2: TTntGroupBox;
    TntLabel3: TTntLabel;
    dtp_ValidDate: TTntDateTimePicker;
    TntLabel4: TTntLabel;
    cob_EmpDept: TTntComboBox;
    TntLabel6: TTntLabel;
    cob_EmpPst: TTntComboBox;
    TntLabel5: TTntLabel;
    TntLabel7: TTntLabel;
    EditBasePay: TTntEdit;
    TntLabel8: TTntLabel;
    EditMPay: TTntEdit;
    EditTechPay: TTntEdit;
    TntLabel10: TTntLabel;
    EditEnvirPay: TTntEdit;
    TntLabel11: TTntLabel;
    TntLabel9: TTntLabel;
    EditPstPay: TTntEdit;
    TntGroupBox3: TTntGroupBox;
    TntDBGrid1: TTntDBGrid;
    TntPanel3: TTntPanel;
    qry_Tran: TADOQuery;
    ds_Tran: TDataSource;
    bbtn_Cancel: TTntBitBtn;
    bbtn_Save: TTntBitBtn;
    qry_dept: TADOQuery;
    qry_pst: TADOQuery;
    qry_Tranupd_user: TStringField;
    qry_Tranupd_date: TDateTimeField;
    qry_Tranemp_id: TStringField;
    qry_Tranvalid_date: TDateTimeField;
    qry_Trandept_code: TStringField;
    qry_Tranpst_code: TStringField;
    qry_Transal_grade: TStringField;
    qry_Transal_base: TBCDField;
    qry_Transal_mgmt: TBCDField;
    qry_Transal_tech: TBCDField;
    qry_Tranpst_pay: TBCDField;
    qry_Tranenvir_pay: TBCDField;
    qry_Tranother_pay: TBCDField;
    qry_Trandept_name: TStringField;
    qry_Tranpst_name: TStringField;
    EditGradePay: TTntEdit;
    qry_Trangrade_pay: TBCDField;
    qry_Transal_spec: TBCDField;
    qry_Transal_achi: TBCDField;
    TntLabel14: TTntLabel;
    EditSalAchi: TTntEdit;
    CobDuty: TTntComboBox;
    CobTech: TTntComboBox;
    CobPstGrade: TTntComboBox;
    TntLabel15: TTntLabel;
    EditCount: TTntEdit;
    TntLabel13: TTntLabel;
    EditSalSpec: TTntEdit;
    TntLabel12: TTntLabel;
    EditOtherPay: TTntEdit;
    TntLabel16: TTntLabel;
    EditIndt: TTntEdit;
    procedure TntFormCreate(Sender: TObject);
    procedure InitLangInfo;
    procedure TntSpeedButton1Click(Sender: TObject);
    procedure SetEnableSave(flag:Boolean);
    procedure EditEmpIdChange(Sender: TObject);
    procedure ShowEmpSal(EmpId:String);
    procedure bbtn_SaveClick(Sender: TObject);
    procedure SaveHrdEmp;
    procedure SaveSalGrade;
    procedure SaveSalTran;
    procedure GetSalCount;
    procedure dtp_ValidDateChange(Sender: TObject);
    procedure bbtn_CancelClick(Sender: TObject);
    function  GetBasePay:Extended;
    procedure EditMPayChange(Sender: TObject);
    procedure cob_EmpPstChange(Sender: TObject);
    procedure EditGradeChange(Sender: TObject);
    procedure SetEditGrade;
    procedure CobTechChange(Sender: TObject);
    procedure CobDutyChange(Sender: TObject);
    procedure CobPstGradeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal01: TFormSal01;
  ws_Words:TWideStrings;
  SalBaseLvl:TStrings;//���~�굥���B
  
implementation
uses
  UnitDMHrdsys,UnitHrdUtils,UnitSal08;
var
  emp_id:string;
  
{$R *.dfm}
procedure TformSal01.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
SetComponentLang(self);//set component language text
  ThisFormUsedWords:='fld_emp_id,fld_emp_name,fld_valid_date,fld_department,fld_pstname,'+
    'fld_sal_level,fld_base_sal,fld_madd_sal,fld_pst_pay,fld_tech_pay,fld_envir_pay,'+
    'fld_other_pay,save,cancel,compute,sal01_titl,error_empid,save_success,save_fail,'+
    'msg_input_error,sal01_error1,sal01_error2,sal01_error3,sal01_confirm1,query_condition,'+
    'salary_data,tran_hist';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
  TntPanel1.Caption:= GetLangName(ws_Words,'sal01_titl');
  TntLabel1.Caption:=GetLangName(ws_Words,'fld_emp_id');
  TntLabel2.Caption:=GetLangName(ws_Words,'fld_emp_name');
  TntLabel3.Caption:=GetLangName(ws_Words,'fld_valid_date');
  TntLabel4.Caption:=GetLangName(ws_Words,'fld_department');
  TntLabel5.Caption:=GetLangName(ws_Words,'fld_pstname');
  TntLabel6.Caption:=GetLangName(ws_Words,'fld_sal_level');
  TntLabel7.Caption:=GetLangName(ws_Words,'fld_base_sal');
  TntLabel8.Caption:=GetLangName(ws_Words,'fld_madd_sal');
  TntLabel9.Caption:=GetLangName(ws_Words,'fld_pst_pay');
  TntLabel10.Caption:=GetLangName(ws_Words,'fld_tech_pay');
  TntLabel11.Caption:=GetLangName(ws_Words,'fld_envir_pay');
  TntLabel12.Caption:=GetLangName(ws_Words,'fld_other_pay');
  //sb_GetBasePay.Caption:=GetLangName(ws_Words,'compute');
  bbtn_Save.Caption:=GetLangName(ws_Words,'save');
  bbtn_Cancel.Caption:=GetLangName(ws_Words,'cancel');
  TntGroupBox1.Caption:=GetLangName(ws_Words,'query_condition');
  TntGroupBox2.Caption:=GetLangName(ws_Words,'salary_data');
  TntGroupBox3.Caption:=GetLangName(ws_Words,'tran_hist');
end;
{===============================================================================
  ��l�Ƶ{��
===============================================================================}
procedure TFormSal01.TntFormCreate(Sender: TObject);
begin
  {�h�y����l��}
  InitLangInfo;
  {�U�Ե���l��}
  SetComboxList('select dept_code+''-''+'+'abbr_titl'+',dept_code from hrd_dept',cob_EmpDept);
  SetComboxList('select pst_code+''-''+'+'pst_chs'+',pst_code from hrd_prof',cob_EmpPst);
  SalBaseLvl:=GetAllBaseLvl;//���o�Ҧ����~�굥���B
end;
{===============================================================================
  �o����u
===============================================================================}
procedure TFormSal01.TntSpeedButton1Click(Sender: TObject);
var
  aEmpId:String;
begin
  aEmpId:=FindEmpId('emp_id');
  if aEmpId<>'' then
    EditEmpId.Text:=aEmpId;
end;
{===============================================================================
  �]�m�O�s���s���A
===============================================================================}
procedure TFormSal01.SetEnableSave(flag:Boolean);
begin
  bbtn_Save.Enabled:=flag;
  bbtn_Cancel.Enabled:=flag;
end;
{===============================================================================
  ��J�u��
===============================================================================}
procedure TFormSal01.EditEmpIdChange(Sender: TObject);
var
  EmpInfo:TFields;
  PstCode,EduCode, clMon, OldPst :String;
  BasePay:Extended;
  InDate:TDate;
begin
  //Clear data
  EditEmpName.Text:='';
  dtp_ValidDate.Date:=date;
  cob_EmpDept.ItemIndex:=-1;
  cob_EmpPst.ItemIndex:=-1;
  //EditGrade.ItemIndex:=-1;
  EditBasePay.Text:='';
  EditMPay.Text:='';
  EditPstPay.Text:='';
  EditTechPay.Text:='';
  EditEnvirPay.Text:='';
  EditOtherPay.Text:='';
  qry_Tran.Close;
  //�O�s���䪬�A
  SetEnableSave(false);
  //
  if Length(EditEmpId.Text)<6 then abort;

  //2012-09-07 hyt add
  if AnalysisEmpFactory(EditEmpId.Text)=false then
    exit ;

  EmpInfo:=GetEmpInfo(EditEmpId.Text);
 // if EmpInfo.FieldByName('emp_id').AsString='' then
 // begin
  //  WideMessageDlg(GetLangName(ws_Words,'error_empid'),mtError,[mbYes],0);
 //   EditEmpId.SetFocus;
 //   Exit;
//  end;
  //tntedit1.Text := floattostr( GetLongWork( EmpInfo.FieldByName('epindt').AsDateTime , dtp_ValidDate.Date,EmpInfo.FieldByName('pst_code').AsString));
  emp_id:=EmpInfo.FieldByName('emp_id').AsString;
  EditEmpName.Text:=EmpInfo.FieldByName('emp_chs').AsString;{���u�m�W}
  EditIndt.Text:=EmpInfo.FieldByName('epindt').AsString;//�i�t���
  SetComboxIndex(cob_EmpDept,EmpInfo.FieldByName('dept_code').AsString);{���u����}
  SetComboxIndex(cob_EmpPst,EmpInfo.FieldByName('pst_code').AsString);{���u¾��}
  SetEditGrade; {�~�굥�Ū�l��}

  EduCode:=EmpInfo.FieldByName('edu_code').AsString;{�Ǿ�}
  OldPst:=EmpInfo.FieldByName('pst_code').AsString ;{�i�t���}
  InDate:=EmpInfo.FieldByName('epindt').AsDateTime;{�i�t���}
 // Empid := EmpInfo.FieldByName('emp_id').AsString;{�Ǿ�}
  //clMon := copy( datetimetostr( dtp_validdate.DateTime ), 1, 4 ) + copy( datetimetostr( dtp_validdate.DateTime ), 6, 2   );
  //2012-09-13 hyt upd
  clMon := formatDatetime('yyyymm',dtp_validdate.DateTime);


  EditBasePay.Text:= floattostr( GetNormalBase(emp_id,clmon, PstCode,EduCode,InDate,SalBaseLvl)) ;//�������~��


  ShowEmpSal(EditEmpId.Text);{���u�~���l��}
  qry_Tran.Parameters.ParamByName('emp_id').Value:=EditEmpId.Text;{�դɾ��v�O�����}
  qry_Tran.Open;

end;
{===============================================================================
  ���W���ͮĤ��
===============================================================================}
function GetLastDate(EmpId:String):TDate;
var
  CurDate:TDate;
begin
  CurDate:=DateOf(GetServerDateTime);
  with DMHrdsys.SQLQuery1  do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT emp_id,MAX(valid_date) AS valid_date FROM hrd_saltran WHERE emp_id='''+EmpId+''' GROUP BY emp_id');
    Open;
    if not Eof then
      Result:=FieldByName('valid_date').Value
    else
      Result:=CurDate;
    Close;
  end;
end;
{===============================================================================
  ���D�ޥ[��
===============================================================================}
function GetMgmt(PstCode:String):Extended;
begin
  if PstCode='12' then       //�g�z 2013-01-30 hyt add
    Result:=2500000
  else if PstCode='18' then       //�D��
    Result:=1200000
  else if PstCode='19' then  //�ƥD��
    Result:=580000
  else if PstCode='22' then  //�Ҫ�
    Result:=520000
  else if PstCode='26' then  //�ƽҪ�
    Result:=210000
  else if PstCode='28' then  //�ƽҪ�
    Result:=210000
  else if PstCode='33' then  //�ժ�
    Result:=160000
  else if PstCode='37' then  //�Ʋժ�
    Result:=80000
  else if PstCode='41' then  //�Z��
    Result:=70000
  else if PstCode='46' then  //�Z��
    Result:=50000
  else                       //¾���B�ާ@��
    Result:=0;
end;
{===============================================================================
  ShowEmpInfo(EmpId:String);
  ��l��
===============================================================================}
procedure TFormSal01.ShowEmpSal(EmpId:String);
begin
  //���W���ͮĤ��
  dtp_ValidDate.Date:=GetLastDate(EmpId);
  with DMHrdsys.SQLQuery3  do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM  hrd_sal_grade WHERE emp_id='''+EmpId+'''');
    Open;
    if not Eof then
    begin
      //SetComboxIndex(EditGrade,FieldByName('sal_grade').AsString);//�~�굥��
      //�򥻤u��
  //    EditBasePay.Text:=FieldByName('sal_base').AsString;

      //�D�ޥ[��
      EditMPay.Text:=FieldByName('sal_mgmt').AsString;
      //�M�~�[��
      EditTechPay.Text:=FieldByName('sal_tech').AsString;
      //¾�Ȭz�K
      EditPstPay.Text:=FieldByName('pst_pay').AsString;
      //¾�����B
      EditGradePay.Text:=FieldByName('grade_pay').AsString;
      //���Ҭz�K
      EditEnvirPay.Text:=FieldByName('envir_pay').AsString;
      //��L�[��
      EditOtherPay.Text:=FieldByName('other_pay').AsString;
      EditSalSpec.Text:=FieldByName('sal_spec').AsString;
      //����
      SetComBoxIndex(CobDuty,FieldByName('duty_code').AsString);
      SetComBoxIndex(CobTech,FieldByName('tech_code').AsString);
      SetComBoxIndex(CobPstGrade,FieldByName('sal_grade').AsString);
      //�O�s���䪬�A
      SetEnableSave(false);
    end
    else
    begin
      EditBasePay.Text:=FloatToStr(GetBasePay);//���򥻤u��
      EditMPay.Text:=FloatToStr(GetMgmt(LeftStr(cob_EmpPst.Text,2)));//���D�ޥ[��
      CobDuty.ItemIndex:=0;
      CobTech.ItemIndex:=0;
      //�O�s���䪬�A
      SetEnableSave(true);
    end;
  end;
end;
{===============================================================================
  �]�m�~�굥�ŹL�{--SetEditGrade
===============================================================================}
procedure TFormSal01.SetEditGrade;
var
  i:Integer;
  GradeStr:String;
begin
  if LeftStr(cob_EmpPst.Text,2)='50' then       //¾��
    GradeStr:='01'
  else if LeftStr(cob_EmpPst.Text,2)='46' then  //�x�F
    GradeStr:='02'
  else if LeftStr(cob_EmpPst.Text,2)='41' then  //�Z��
    GradeStr:='03'
  else if LeftStr(cob_EmpPst.Text,2)='37' then  //�Ʋժ�
    GradeStr:='04'
  else if LeftStr(cob_EmpPst.Text,2)='33' then  //�ժ�
    GradeStr:='05'
  else if LeftStr(cob_EmpPst.Text,2)='28' then  //�ƽҪ�
    GradeStr:='06'
  else if LeftStr(cob_EmpPst.Text,2)='22' then  //�Ҫ�
    GradeStr:='07'
  else if LeftStr(cob_EmpPst.Text,2)='19' then  //�ƥD��
    GradeStr:='08'
  else if LeftStr(cob_EmpPst.Text,2)='18' then  //�D��
    GradeStr:='09'
  else                                          //��L
    GradeStr:='00';
  CobPstGrade.Items.Clear;
  for i:=1 to 6 do
  begin
    CobPstGrade.Items.Append(GradeStr+'0'+IntToStr(i));
  end;
end;
{===============================================================================
  �o����u�i�t���
===============================================================================}
function GetEmpInDate(EmpId:String):TDate;
begin
  with DMHrdsys.SQLQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_emp WHERE emp_id='''+EmpId+'''');
    Open;
    if not Eof then
      Result:=DateOf(FieldByName('epindt').AsDateTime)
    else
      Result:=date;
    Close;
  end;
end;
{===============================================================================
  �ˬd�u����J�O�_���T CheckEmpId
===============================================================================}
procedure CheckEmpId(EmpId:String);
begin
  with DMHrdsys.SQLQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT emp_id FROM hrd_emp WHERE emp_id='''+EmpId+'''');
    Open;
    if Eof then
    begin
      Close;
      WideMessageDlg(GetLangName(ws_Words,'error_empid'),mtError,[mbYes],0);
      Abort;
    end;
    Close;
  end;
end;
{===============================================================================
  �ˬd¾��
===============================================================================}
procedure CheckEmpPst(pst_code:String);
begin
  //if pst_code>''
end;
{===============================================================================
  �ˬd�ͮĤ��
===============================================================================}
procedure CheckEffectDate(EmpId:String;ValidDate:TDate);
var
  CurDate:TDateTime;
begin
  //�o��A�Ⱦ��W����e���
  CurDate:=GetServerDateTime;
  //�ˬd�O�_�j���e���
  if FormatDateTime('yyyy/mm/dd',ValidDate)> FormatDateTime('yyyy/mm/dd',CurDate) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'sal01_error1'),mtError,[mbYes],0);
    Abort;
  end;
  //�դɤ�����ভ�_�i�t��ΤW���դɤ�
 { if FormatDateTime('yyyy/mm/dd',GetLastDate(EmpId))<>FormatDateTime('yyyy/mm/dd',CurDate) then
  begin
    if FormatDateTime('yyyy/mm/dd',ValidDate)<FormatDateTime('yyyy/mm/dd',GetLastDate(EmpId)) then
    begin
      WideMessageDlg(GetLangName(ws_Words,'sal01_error2'),mtError,[mbYes],0);
      Abort;
    end;
  end;      }
  if ValidDate<GetEmpInDate(EmpId) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'sal01_error3'),mtError,[mbYes],0);
    Abort;
  end;
  //�դɷ��w���Ӭ���
  with DMHrdsys.SQLQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_saltran WHERE emp_id='''+EmpId+''' AND valid_date='''+
      FormatDateTime('yyyy/mm/dd',ValidDate)+'''');
    Open;
    if not Eof then
    begin
      Close;
      WideMessageDlg('�դ��ɤ��w���Ӭ���!',mtError,[mbYes],0);
      Abort;
    end;
    Close;
  end;
end;
{===============================================================================
===============================================================================}
procedure CheckSalGrade(SalGrade:String);
begin
  //
end;

{===============================================================================
  �O�s
===============================================================================}
procedure TFormSal01.bbtn_SaveClick(Sender: TObject);
begin
  CheckEmpId(EditEmpId.Text);{�ˬd�u��}
  CheckEffectDate(EditEmpId.Text,dtp_ValidDate.Date);{�ˬd�ͮĤ��}
  //CheckSalGrade(EditGrade.Text);{�ˬd�~�굥��}
  CheckEmpPst(LeftStr(cob_EmpPst.Text,2));{�ˬd¾��}
  DMHrdsys.conn.BeginTrans;{�}�l�ư�}
  try{�O�s���}
    SaveHrdEmp;{�O�s���u�D��}
    SaveSalGrade;{�O�s�~����}
    //SaveSalAchi;{�O�s�\�Z������}
    SaveSalTran;{�O�s�դɾ��v������}
    {�O�s���\}
    WideMessageDlg(GetLangName(ws_Words,'save_success'),mtInformation,[mbYes],0);
    DMHrdsys.conn.CommitTrans;{����ư�}
    SetEnableSave(false);
  except
    {�O�s����}
    WideMessageDlg(GetLangName(ws_Words,'save_fail'),mtInformation,[mbYes],0);
    DMHrdsys.conn.RollbackTrans;{�^�u�ư�}
  end;
end;
{===============================================================================
  �O�s���u�D��
===============================================================================}
procedure TFormSal01.SaveHrdEmp;
begin
  {�קﳡ���N���O¾��}
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from hrd_emp where emp_id='''+EditEmpId.Text+'''');
    Open;
    Edit;
    FieldByName('dept_code').AsString:= LeftStr(cob_EmpDept.Text,6);
    FieldByName('pst_code').AsString:=LeftStr(cob_EmpPst.Text,2);
    FieldByName('upd_user').AsString:=username;
    FieldByName('upd_date').AsDateTime:=GetServerDateTime;
    Post;
    Close;
  end;
end;
{===============================================================================
  �O�s�~����
===============================================================================}
procedure TFormSal01.SaveSalGrade;
begin
  with DMHrdsys.SQLQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_sal_grade WHERE emp_id='''+EditEmpId.Text+'''');
    Open;
    if Eof then
    begin
      Append;
      FieldByName('emp_id').AsString:=EditEmpId.Text;
      FieldByName('valid_date').AsString:= FormatDateTime('yyyy/mm/dd',dtp_ValidDate.Date);
    end
    else
      Edit;
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=GetServerDateTime;
    FieldByName('dept_code').AsString:=LeftStr(cob_EmpDept.Text,6);
    FieldByName('pst_code').AsString:=LeftStr(cob_EmpPst.Text,2);
    //FieldByName('sal_grade').AsString:=EditGrade.Text;
    FieldByName('sal_base').AsString:=EditBasePay.Text;
    FieldByName('sal_mgmt').AsString:=EditMPay.Text;
    FieldByName('sal_tech').AsString:=EditTechPay.Text;
    FieldByName('pst_pay').AsString:=EditPstPay.Text;
    FieldByName('envir_pay').AsString:=EditEnvirPay.Text;
    FieldByName('grade_pay').AsString:=EditGradePay.Text;
    FieldByName('sal_spec').AsString:=EditSalSpec.Text;
    FieldByName('sal_achi').AsString:=EditSalAchi.Text;
    FieldByName('other_pay').AsString:=EditOtherPay.Text;
    //�O�s���ťN��
    FieldByName('tech_code').AsString:=CobTech.Text;
    FieldByName('duty_code').AsString:=CobDuty.Text;
    FieldByName('sal_grade').AsString:=CobPstGrade.Text;
    Post;
    Close;
  end;
end;
{===============================================================================
  �O�s�դɾ��v������
===============================================================================}
procedure TFormSal01.SaveSalTran;
begin
  with DMHrdsys.SQLQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_saltran WHERE emp_id='''+EditEmpId.Text+
      ''' AND valid_date='''+FormatDateTime('yyyy/mm/dd',dtp_ValidDate.Date)+'''');
    Open;
    if Eof then
    begin
      Append;
      FieldByName('emp_id').AsString:=EditEmpId.Text;
      FieldByName('valid_date').AsString:= FormatDateTime('yyyy/mm/dd',dtp_ValidDate.Date);
    end
    else
      Edit;
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=GetServerDateTime;
    FieldByName('dept_code').AsString:=LeftStr(cob_EmpDept.Text,6);
    FieldByName('pst_code').AsString:=LeftStr(cob_EmpPst.Text,2);
    //FieldByName('sal_grade').AsString:=EditGrade.Text;
    FieldByName('sal_base').AsString:=EditBasePay.Text;
    FieldByName('sal_mgmt').AsString:=EditMPay.Text;
    FieldByName('sal_tech').AsString:=EditTechPay.Text;
    FieldByName('pst_pay').AsString:=EditPstPay.Text;
    FieldByName('envir_pay').AsString:=EditEnvirPay.Text;
    FieldByName('grade_pay').AsString:=EditGradePay.Text;
    FieldByName('sal_spec').AsString:=EditSalSpec.Text;
    FieldByName('sal_achi').AsString:=EditSalAchi.Text;
    FieldByName('other_pay').AsString:=EditOtherPay.Text;
    //�O�s���ťN��
    FieldByName('tech_code').AsString:=CobTech.Text;
    FieldByName('duty_code').AsString:=CobDuty.Text;
    FieldByName('sal_grade').AsString:=CobPstGrade.Text;
    Post;
    Close;
  end;
  qry_Tran.Close;
  qry_Tran.Open;
end;

procedure TFormSal01.dtp_ValidDateChange(Sender: TObject);
begin
  SetEnableSave(true);
  EditBasePay.Text:=FloatToStr(GetBasePay);//���򥻤u��
end;

procedure TFormSal01.bbtn_CancelClick(Sender: TObject);
var
  EmpInfo:TFields;
begin
  EditEmpName.Text:='';
  dtp_ValidDate.Date:=date;
  cob_EmpDept.ItemIndex:=-1;
  cob_EmpPst.ItemIndex:=-1;
  //EditGrade.Text:='';
  EditBasePay.Text:='';
  EditMPay.Text:='';
  EditPstPay.Text:='';
  EditTechPay.Text:='';
  EditEnvirPay.Text:='';
  EditOtherPay.Text:='';
  EmpInfo:=GetEmpInfo(EditEmpId.Text);
  EditEmpName.Text:=EmpInfo.FieldByName('emp_chs').AsString;
  SetComboxIndex(cob_EmpDept,EmpInfo.FieldByName('dept_code').AsString);
  SetComboxIndex(cob_EmpPst,EmpInfo.FieldByName('pst_code').AsString);
  ShowEmpSal(EditEmpId.Text);
  SetEnableSave(false);
end;
{===============================================================================
  �p��򥻤u��(���ǰ��D�A�ݭק�)
===============================================================================}
function TFormSal01.GetBasePay:Extended;
var
  PstCode,EduCode, clMon, OldPst :String;
  EmpInfo:TFields;
  BasePay:Extended;
  InDate:TDate;
  InMonths:Integer;
  empid :string ;
begin
  //
  BasePay:=0;
  EmpInfo:=GetEmpInfo(EditEmpId.Text);
  PstCode:=LeftStr(cob_EmpPst.Text,2);{¾��}
  EduCode:=EmpInfo.FieldByName('edu_code').AsString;{�Ǿ�}
  OldPst:=EmpInfo.FieldByName('pst_code').AsString ;{�i�t���}
  InDate:=EmpInfo.FieldByName('epindt').AsDateTime;{�i�t���}
  Empid := EmpInfo.FieldByName('emp_id').AsString;{�Ǿ�}
  //clMon := copy( datetimetostr( dtp_validdate.DateTime ), 1, 4 ) + copy( datetimetostr( dtp_validdate.DateTime ), 6, 2   );
  //2012-09-13 hyt upd
  clMon := formatDatetime('yyyymm',dtp_validdate.DateTime);
 // if clMon < '200801' then
     BasePay:=GetNormalBase(empid,clmon, PstCode,EduCode,InDate,SalBaseLvl);//�������~��
 if ( OldPst = '60' )  and ( pstcode ='50' ) then
     BasePay:= BasePay + 20000 ;
 if (OldPst = '50' )  and (( pstcode ='41') or (pstcode='46')) then
     BasePay:= BasePay + 30000 ;
 if (( oldpst ='41' ) or ( oldpst='46')) and ((pstcode='33') or ( pstcode='37' ) ) then
     BasePay:= BasePay + 70000 ;
 if (( oldpst ='33' ) or ( oldpst='37')) and ((pstcode='28') or ( pstcode='22' ) ) then
     BasePay:= BasePay + 100000 ;
//  if (( oldpst ='41' ) or ( oldpst='46')) and ((pstcode='33') or ( pstcode='37' ) ) then
  //   BasePay:= BasePay + 500000 ;
 // else
 //     begin
     //  if( pstcode ='60' )  then
       //   BasePay:=GetNormalBase(clmon,PstCode,EduCode,InDate,SalBaseLvl)  ;   //2008.01 �_¾���@�~���~��W�B190000
 //      if ( pstCode ='50' ) then
 //         BasePay:=GetNormalBase(PstCode,EduCode,InDate,SalBaseLvl) + 190000 ;   //2008.01 �_¾���@�~���~��W�B190000
 //      if ( pstCode ='46' ) or ( pstcode ='41' ) or ( pstcode ='42' )  then
 //         BasePay:=GetNormalBase(PstCode,EduCode,InDate,SalBaseLvl) + 172000 ;  // 2008.01 �_�Z�����~��W�B172000
 //      if ( pstCode ='33' ) or ( pstcode ='37' )  then
 ////         BasePay:=GetNormalBase(PstCode,EduCode,InDate,SalBaseLvl) + 242000 ;  // 2008.01 �_�ժ����~��W�B242000
 //      if ( pstCode ='22' ) or ( pstcode ='26' ) or ( pstcode ='28' )  then
  //        BasePay:=GetNormalBase(PstCode,EduCode,InDate,SalBaseLvl) + 342000 ;  // 2008.01 �_�Ҫ����~��W�B342000
  //     if ( pstCode ='18' ) or ( pstcode ='19' )   then
  //        BasePay:=GetNormalBase(PstCode,EduCode,InDate,SalBaseLvl) + 442000 ;  // 2008.01 �_�D�����~��W�B90000
  //   end;
  //  if PstCode>='50' then//�եδ��~��
  //   begin
   //    if clMon >='200801'  then
   //       BasePay:=  GetNormalBase(PstCode,EduCode,InDate,SalBaseLvl) + 90000   //StrToFloat(SalBaseLvl.Strings[1]) + 90000    // 2008.01�_�եδ��~��W�B90000
   //    else
   //      BasePay:=  GetNormalBase(PstCode,EduCode,InDate,SalBaseLvl) ;//StrToFloat(SalBaseLvl.Strings[1]) ;
  //  end
 // else//¾���H�W�L�եδ�
 //   BasePay:=BasePay;


   //  BasePay:=GetNormalBase(PstCode,EduCode,InDate,SalBaseLvl)+ 92300;//�������~��
  {if PstCode='60' then//�ާ@��
  begin
    InMonths:=MonthOf(GetServerDateTime)+12*(YearOf(GetServerDateTime)-YearOf(InDate))-MonthOf(InDate);
    if InMonths<0 then
      InMonths:=InMonths+12;
    if (InMonths<3) then//and (DayOf(InDate)>1) then
      BasePay:=550000
    else
    begin
      if (EduCode>='12') and (EduCode<='14') then
        BasePay:=630000
      else if (EduCode>='15') and (EduCode<='16') then
        BasePay:= 700000
      else
        BasePay:=580000;
    end;
  end
  else if PstCode='50' then//¾��
  begin
    InMonths:=MonthOf(GetServerDateTime)+12*(YearOf(GetServerDateTime)-YearOf(InDate))-MonthOf(InDate);
    if InMonths<=3 then//and (DayOf(InDate)>1) then
      BasePay:=550000
    else
    begin
      if (EduCode>='12') and (EduCode<='14') then
        BasePay:=630000
      else if (EduCode>='15') and (EduCode<='16') then
        BasePay:= 700000
      else
        BasePay:=580000;
    end;
  end
  else//��L
  begin
    if (PstCode='18') or (PstCode='19') then
      BasePay:=900000
    else if (PstCode='22') or (PstCode='28') then
      BasePay:=800000
    else if (PstCode='33') or (PstCode='37') then
      BasePay:=700000
    else if (PstCode='41') or (PstCode='46') then
    begin
      if EduCode>='15' then
        BasePay:=700000
      else
        BasePay:=630000;
    end;
  end;}
  Result:=BasePay;
end;

{===============================================================================
  �ˬd���B��J�O�_���T
===============================================================================}
procedure TFormSal01.EditMPayChange(Sender: TObject);
var
  aValue:Extended;
begin
  SetEnableSave(true);
  if Length(TTntEdit(Sender).Text)=0 then exit;
  if not TryStrToFloat(TTntEdit(Sender).Text,aValue) then
  begin
    WideMessageDlg(GetLangName(ws_Words,'msg_input_error'),mtError,[mbYes],0);
    TTntEdit(Sender).Text:='';
    abort;
  end;
  if Length(TTntEdit(Sender).Text)>=7 then
  begin
    if WideMessageDlg(GetLangName(ws_Words,'sal01_confirm1'),mtConfirmation,[mbYes,mbNo],0)=mrNo then
      TTntEdit(Sender).Text:='';
  end;
  GetSalCount;
end;

procedure TFormSal01.cob_EmpPstChange(Sender: TObject);
begin
  SetEnableSave(true);
  EditBasePay.Text:=FloatToStr(GetBasePay);//���򥻤u��
  EditMPay.Text:=FloatToStr(GetMgmt(LeftStr(TTntComboBox(Sender).Text,2)));//���D�ޥ[��
  SetEditGrade;{�~�굥�Ū�l��}
  CobPstGrade.ItemIndex:=0;
  CobTech.ItemIndex:=1;
  CobDuty.ItemIndex:=1;
  CobPstGrade.OnChange(self);
  CobTech.OnChange(self);
  CobDuty.OnChange(self);
end;

procedure TFormSal01.EditGradeChange(Sender: TObject);
begin
  SetEnableSave(true);
end;

procedure TFormSal01.CobTechChange(Sender: TObject);
//�M�~�[��
begin
  with DMHrdsys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_sal_lvl_tech where grad_code='''+LeftStr(CobTech.Text,1)+''' and if_new='''+RightStr(CobTech.Text,1)+'''');
    open;
    if not Eof then
      EditTechPay.Text:=FieldByName('pst_money').AsString
    else
      EditTechPay.Text:='';
  end;
end;

procedure TFormSal01.CobDutyChange(Sender: TObject);
//¾�Ȭz�K
var
  sqlstr:string;
begin
  sqlstr:='select * from hrd_sal_lvl_duty where grad_code='''+LeftStr(CobDuty.Text,1)+''''
    +' and if_new='''+RightStr(CobDuty.Text,1)+''' and pst_code='''+LeftStr(cob_EmpPst.Text,2)+'''';
  with DMHrdsys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if not Eof then
      EditPstPay.Text:=FieldByName('pst_money').AsString
    else
      EditPstPay.Text:='';
  end;
end;

procedure TFormSal01.CobPstGradeChange(Sender: TObject);
//¾�����B
var
  sqlstr,pst_grad,grad_code:string;
begin
  pst_grad:=MidStr(CobPstGrade.Text,2,1);
  grad_code:=RightStr(CobPstGrade.Text,1);
  sqlstr:='select * from hrd_sal_lvl where grad_clas='''+pst_grad+'''';
  with DMHrdsys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if not Eof then
      EditGradePay.Text:=FieldByName('grad_'+grad_code).AsString
    else
      EditGradePay.Text:='';
  end;
end;

procedure TFormSal01.GetSalCount;
var
  allCount:integer;
begin
  allCount:=0;
  if EditBasePay.Text<>'' then
    allCount:=allCount+StrToInt(EditBasePay.Text);
  if EditMPay.Text<>'' then
    allCount:=allCount+StrToInt(EditMPay.Text);
  if EditTechPay.Text<>'' then
    allCount:=allCount+StrToInt(EditTechPay.Text);
  if EditGradePay.Text<>'' then
    allCount:=allCount+StrToInt(EditGradePay.Text);
  if EditPstPay.Text<>'' then
    allCount:=allCount+StrToInt(EditPstPay.Text);
  if EditEnvirPay.Text<>'' then
    allCount:=allCount+StrToInt(EditEnvirPay.Text);
  if EditSalSpec.Text<>'' then
    allCount:=allCount+StrToInt(EditSalSpec.Text);
  EditCount.text:=IntToStr(AllCount);
end;

end.
