{******************************************************************************
name：fhrd104(幹部考核資料維護)
author: tim
create date:2005-08-08
commentate:幹部考核資料維護
*******************************************************************************}
unit uFhrd104;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, StdCtrls, Buttons,WSDLIntf, TntButtons, Grids,
  DBGrids, TntDBGrids, TntStdCtrls, ExtCtrls, TntExtCtrls, DB, ADODB,
  ImgList,TntDialogs,StrUtils;

type
  TArray_WideString=array of widestring;
  TFormfhrd104 = class(TTntForm)
    TntPanel_title: TTntPanel;
    TntGroupBox_condition: TTntGroupBox;
    TntLabel_assessMonth: TTntLabel;
    TntEdit_checkMonth: TTntEdit;
    TntRadioButton_department: TTntRadioButton;
    TntRadioButton_emp_id: TTntRadioButton;
    TntComboBox_department_bgn: TTntComboBox;
    TntComboBox_department_end: TTntComboBox;
    TntEdit_emp_id_end: TTntEdit;
    TntLabel_line1: TTntLabel;
    TntLabel_line2: TTntLabel;
    TntGroupBox_waitAssessCadre: TTntGroupBox;
    TntDBGrid_waitAssess: TTntDBGrid;
    TntGroupBox_maintenanceData: TTntGroupBox;
    TntLabel_emp_id: TTntLabel;
    TntLabel_assessItems: TTntLabel;
    TntEdit_emp_id: TTntEdit;
    TntLabel_name: TTntLabel;
    TntLabel_mark: TTntLabel;
    TntEdit_name: TTntEdit;
    TntLabel_department: TTntLabel;
    TntEdit_department: TTntEdit;
    TntComboBox_acs_name: TTntComboBox;
    TntEdit_mark: TTntEdit;
    TntBitBtn_query: TTntBitBtn;
    TntBitBtn_save: TTntBitBtn;
    TntBitBtn_deleted: TTntBitBtn;
    TntGroupBox_browseData: TTntGroupBox;
    TntDBGrid_browsData: TTntDBGrid;
    TntLabel_format: TTntLabel;
    ADOQuery_access: TADOQuery;
    DataSource_dept: TDataSource;
    DataSource_access: TDataSource;
    ADOQuery_waitAssess: TADOQuery;
    TntBitBtn_exit: TTntBitBtn;
    TntEdit_emp_id_bgn: TTntEdit;

    procedure TntFormCreate(Sender: TObject);
    procedure InitData();
    procedure GetDbData(Asql:string;var AData: TArray_WideString);
    procedure SetTntComboBoxData(var AComboBox:TTntComboBox;AData:TArray_WideString);
    procedure TntEdit_checkMonthKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TntBitBtn_queryClick(Sender: TObject);
    procedure TntDBGrid_waitAssessCellClick(Column: TColumn);
    procedure Tab(Sender: TObject; var Key: Word;Shift: TShiftState);
    function JudgeData(An:integer):Boolean;
    procedure TntBitBtn_saveClick(Sender: TObject);
    procedure TntBitBtn_deletedClick(Sender: TObject);
    procedure TntComboBox_acs_nameClick(Sender: TObject);
    procedure TntBitBtn_exitClick(Sender: TObject);
    procedure msgError(errormsg:WideString);
    procedure msgInformation(infomsg:WideString);
    procedure msgWarning(warningmsg:WideString);
    procedure msgStop(stopmsg:WideString);
    function msgConfirm(Confirmmsg:WideString):Boolean;
    procedure ChangeDBGridTitleColor(var ADBGrid:TTntDBGrid;AID:integer);
    procedure TntDBGrid_waitAssessTitleClick(Column: TColumn);
    procedure TntDBGrid_browsDataTitleClick(Column: TColumn);
    procedure TntComboBox_department_bgnChange(Sender: TObject);
    procedure TntComboBox_department_endChange(Sender: TObject);
    procedure TntEdit_emp_id_bgnChange(Sender: TObject);
    procedure TntEdit_emp_id_endChange(Sender: TObject);
    procedure TntFormClose(Sender: TObject; var Action: TCloseAction);
    procedure TntDBGrid_browsDataCellClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd104: TFormfhrd104;
  gDeptArray:TArray_WideString;
  gAcs_idArray:TArray_WideString;
  gDeal_State:string;
  gLangWStrs:TWideStrings;

implementation

uses
  UnitHrdUtils,unitDMHrdsys,UnitHrdMain;

{$R *.dfm}

// create form

procedure TFormfhrd104.TntFormCreate(Sender: TObject);
var
  lcUsedWords:string;
begin

  InitData();

  //----------------------
  //translate language
  //----------------------

  lcUsedWords:='fhrd104,fhrd104_title,fhrd104_condition,fhrd104_wait_assess_cadre,fhrd104_maintenance_data,fhrd104_browse_data,';
  lcUsedWords:=lcUsedWords+'table_field_chk_month,table_field_dept_code,table_field_dept_abbr,table_field_emp_id,table_field_emp_name,table_field_acs_name,table_field_acs_name2,table_field_mark,table_field_pst_name,';
  lcUsedWords:=lcUsedWords+'button_query,button_save,button_deleted,button_exit,';
  lcUsedWords:=lcUsedWords+'format_month1,confirm_close,msg_confirm_save,msg_del_alert,';
  lcUsedWords:=lcUsedWords+'msg_input_error,msg_slt_query_conidition,msg_save_error,msg_no_exist,msg_please_select,msg_less_0,msg_deleted_error,msg_query_error,msg_press_enter';
  gLangWStrs:=GetLangWideStrs(lcUsedWords);
  TntPanel_title.Caption :=GetLangName(gLangWStrs,'fhrd104_title');
  TntGroupBox_condition.Caption :=GetLangName(gLangWStrs,'fhrd104_condition');
  TntGroupBox_waitAssessCadre.Caption :=GetLangName(gLangWStrs,'fhrd104_wait_assess_cadre');
  TntGroupBox_maintenanceData.Caption :=GetLangName(gLangWStrs,'fhrd104_maintenance_data');
  TntGroupBox_browseData.Caption :=GetLangName(gLangWStrs,'fhrd104_browse_data');
  TntLabel_assessMonth.Caption :=GetLangName(gLangWStrs,'table_field_chk_month');
  TntRadioButton_department.Caption :=GetLangName(gLangWStrs,'table_field_dept_code');
  TntRadioButton_emp_id.Caption :=GetLangName(gLangWStrs,'table_field_emp_id');
  TntLabel_emp_id.Caption :=GetLangName(gLangWStrs,'table_field_emp_id');
  TntLabel_name.Caption :=GetLangName(gLangWStrs,'table_field_emp_name')+'(cn)';
  TntLabel_department.Caption :=GetLangName(gLangWStrs,'table_field_dept_abbr');
  TntLabel_assessItems.Caption :=GetLangName(gLangWStrs,'table_field_acs_name');
  TntLabel_mark.Caption :=GetLangName(gLangWStrs,'table_field_mark');
  TntBitBtn_query.Caption :=GetLangName(gLangWStrs,'button_query');
  TntBitBtn_save.Caption :=GetLangName(gLangWStrs,'button_save');
  TntBitBtn_deleted.Caption :=GetLangName(gLangWStrs,'button_deleted');
  TntBitBtn_exit.Caption :=GetLangName(gLangWStrs,'button_exit');
  TntLabel_format.Caption :=GetLangName(gLangWStrs,'format_month1');
               //dbgrid
  TntDBGrid_waitAssess.Columns[0].Title.Caption :=GetLangName(gLangWStrs,'table_field_emp_id');
  TntDBGrid_waitAssess.Columns[1].Title.Caption :=GetLangName(gLangWStrs,'table_field_emp_name');
  TntDBGrid_waitAssess.Columns[2].Title.Caption :=GetLangName(gLangWStrs,'table_field_pst_name');
  TntDBGrid_waitAssess.Columns[3].Title.Caption :=GetLangName(gLangWStrs,'table_field_dept_abbr');

  TntDBGrid_browsData.Columns[0].Title.Caption :=GetLangName(gLangWStrs,'table_field_emp_id');
  TntDBGrid_browsData.Columns[1].Title.Caption :=GetLangName(gLangWStrs,'table_field_emp_name');
  TntDBGrid_browsData.Columns[2].Title.Caption :=GetLangName(gLangWStrs,'table_field_dept_code');
  TntDBGrid_browsData.Columns[3].Title.Caption :=GetLangName(gLangWStrs,'table_field_pst_name');
  TntDBGrid_browsData.Columns[4].Title.Caption :=GetLangName(gLangWStrs,'table_field_acs_name2');
  TntDBGrid_browsData.Columns[5].Title.Caption :=GetLangName(gLangWStrs,'table_field_mark');
  TntDBGrid_browsData.Columns[6].Visible :=false;
  TntDBGrid_browsData.Columns[7].Visible :=false;
  //----------------------
end;

// init data

procedure TFormfhrd104.InitData();
var
  lcSql:string;
  lcArray:TArray_WideString;
begin
          //fhrd_dept
  lcSql:='select dept_code from fhrd_dept order by dept_code';
  GetDbData(lcSql,gDeptArray);
  lcSql:='select dept_abbr from fhrd_dept order by dept_code';
  GetDbData(lcSql,lcArray);
  SetTntComboBoxData(TntComboBox_department_bgn,lcArray);
  SetTntComboBoxData(TntComboBox_department_end,lcArray);
  TntComboBox_department_bgn.ItemIndex :=0;
  TntComboBox_department_end.ItemIndex :=TntComboBox_department_end.Items.Count-1;
          //fhrd_acsid
  lcSql:='select acs_id from fhrd_acsid order by acs_id';
  GetDbData(lcSql,gAcs_idArray);
  lcSql:='select acs_name from fhrd_acsid order by acs_id';
  GetDbData(lcSql,lcArray);
  SetTntComboBoxData(TntComboBox_acs_name,lcArray);
  TntComboBox_acs_name.ItemIndex :=-1;
          //tab event
  TntEdit_emp_id.OnKeyDown :=tab;
  TntEdit_name.OnKeyDown :=tab;
  TntEdit_department.OnKeyDown :=tab;
  TntComboBox_acs_name.OnKeyDown :=tab;
  TntEdit_mark.OnKeyDown :=tab;
          //Deal State:add,update
  gDeal_State:='';
end;

// get database'data

procedure TFormfhrd104.GetDbData(Asql:string;var AData: TArray_WideString);
var
  i:integer;
begin
  SetLength(AData,0);
  i:=0;
  DMHrdsys.SQLQuery1.SQL.Clear ;
  DMHrdsys.SQLQuery1.SQL.Add(Asql);
  DMHrdsys.SQLQuery1.Open ;
  if DMHrdsys.SQLQuery1.Eof then exit;
  DMHrdsys.SQLQuery1.First ;
  while not DMHrdsys.SQLQuery1.Eof do
  begin
    SetLength(AData,i+1);
    AData[i]:=DMHrdsys.SQLQuery1.Fields[0].Value;
    i:=i+1;
    DMHrdsys.SQLQuery1.Next ;
  end;
end;

//set add ComboBoxData's data

procedure TFormfhrd104.SetTntComboBoxData(var AComboBox:TTntComboBox;AData:TArray_WideString);
var
  i:integer;
begin
  AComboBox.Items.Clear ;
  for i:=low(AData) to high(AData) do
  begin
    if (AComboBox.Name='TntComboBox_department_bgn') or (AComboBox.Name='TntComboBox_department_end') then
      AComboBox.Items.Add(gDeptArray[i]+'-'+AData[i]);
    if (AComboBox.Name='TntComboBox_acs_name') then
      AComboBox.Items.Add(gAcs_idArray[i]+'-'+AData[i]);
  end;
end;

// confirm checkMonth's data

procedure TFormfhrd104.TntEdit_checkMonthKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  lcYear,lcMonth:integer;
  lcLangCheckMonth,lcLangMsg:Widestring;
begin
  if Key=13 then
  begin
    lcLangCheckMonth:=TntLabel_assessMonth.Caption ;
    lcLangMsg:=GetLangName(gLangWStrs,'msg_input_error');
    if length(TntEdit_checkMonth.Text )<>6 then
    begin
      msgError(lcLangCheckMonth+lcLangMsg);
      exit;
    end;
    try
      lcYear:=StrToInt(copy(TntEdit_checkMonth.Text,1,4));
      lcMonth:=StrToInt(copy(TntEdit_checkMonth.Text,5,2));
    except
      msgError(lcLangCheckMonth+lcLangMsg);
      exit;
    end;
    if (lcMonth>12) or (lcMonth<1) or (lcYear>2100) or (lcYear<1900) then
    begin
      msgError(lcLangCheckMonth+lcLangMsg);
      exit;
    end;
    TntRadioButton_department.Enabled :=true;
    TntRadioButton_emp_id.Enabled :=true;
    TntRadioButton_department.SetFocus ;
    ADOQuery_access.Close ;
    ADOQuery_access.Parameters.ParamByName('gChk_month').Value :=TntEdit_checkMonth.Text;
    ADOQuery_access.Open ;
    ChangeDBGridTitleColor(TntDBGrid_browsData,0);  //sort color
  end;
end;

//click Query button

procedure TFormfhrd104.TntBitBtn_queryClick(Sender: TObject);
var
  lcSql:string;
  lcLangMsg:widestring;
  lcYear,lcMonth:integer;
  lcLangCheckMonth : Widestring;
begin
    lcLangCheckMonth:=TntLabel_assessMonth.Caption ;
    lcLangMsg:=GetLangName(gLangWStrs,'msg_input_error');
    if length(TntEdit_checkMonth.Text )<>6 then
    begin
      msgError(lcLangCheckMonth+lcLangMsg);
      exit;
    end;
    try
      lcYear:=StrToInt(copy(TntEdit_checkMonth.Text,1,4));
      lcMonth:=StrToInt(copy(TntEdit_checkMonth.Text,5,2));
    except
      msgError(lcLangCheckMonth+lcLangMsg);
      exit;
    end;
    if (lcMonth>12) or (lcMonth<1) or (lcYear>2100) or (lcYear<1900) then
    begin
      msgError(lcLangCheckMonth+lcLangMsg);
      exit;
    end;

  if (not TntRadioButton_department.Checked) and (not TntRadioButton_emp_id.Checked ) then
  begin
    lcLangMsg:=GetLangName(gLangWStrs,'table_field_chk_month');
    lcLangMsg:=lcLangMsg+GetLangName(gLangWStrs,'msg_press_enter');
    msgError(lcLangMsg);
    TntEdit_checkMonth.SetFocus ;
    exit;
  end;
  lcSql:='select e.emp_id,e.emp_name,p.pst_name,d.dept_abbr';
  lcSql:=lcSql+' from fhrd_emp as e,';
  lcSql:=lcSql+' fhrd_prof as p,';
  lcSql:=lcSql+' fhrd_dept as d';
  lcSql:=lcSql+' where e.pst_code=p.pst_code';
  lcSql:=lcSql+' and  e.dept_code=d.dept_code';
  lcSql:=lcSql+' and e.emp_id not in (select emp_id from fhrd_access  where chk_month='''+TntEdit_checkMonth.Text+''')';
  if TntRadioButton_department.Checked then
  begin
    lcSql:=lcSql+' and e.dept_code between '''+gDeptArray[TntComboBox_department_bgn.ItemIndex]+'''';
    lcSql:=lcSql+' and '''+gDeptArray[TntComboBox_department_end.ItemIndex]+'''';
  end
  else
  begin
    lcSql:=lcSql+' and e.emp_id between '''+TntEdit_emp_id_bgn.Text+'''';
    lcSql:=lcSql+' and '''+TntEdit_emp_id_end.Text+'''';
  end;
  lcSql:=lcSql+' order by e.emp_id';

  ADOQuery_waitAssess.SQL.Clear ;
  ADOQuery_waitAssess.SQL.Add(lcSql);
  try
    ADOQuery_waitAssess.Open ;
    ChangeDBGridTitleColor(TntDBGrid_waitAssess,0);  //sort color
  except
    msgError(GetLangName(gLangWStrs,'msg_query_error'));
    exit;
  end;
  //---ok do
  TntGroupBox_waitAssessCadre.Enabled :=true;
  TntGroupBox_maintenanceData.Enabled :=true;
end;

//click waitAssess's DBGrid

procedure TFormfhrd104.TntDBGrid_waitAssessCellClick(Column: TColumn);
var
  lcEmp_id:string;
begin
  if (TntDBGrid_waitAssess.Fields[0].Value=NULL) or (TntDBGrid_waitAssess.Fields[0].Value='') then exit;
  lcEmp_id:=TntDBGrid_waitAssess.Fields[0].Value ;
  TntEdit_emp_id.Text :=lcEmp_id ;
  TntEdit_name.Text :=TntDBGrid_waitAssess.Fields[1].Value ;
  TntEdit_department.Text :=TntDBGrid_waitAssess.Fields[3].Value ;
  TntComboBox_acs_name.Text :='';
  TntComboBox_acs_name.ItemIndex :=-1;
  TntEdit_mark.Text :='';

  TntComboBox_acs_name.SetFocus ;
end;

//tab event

procedure TFormfhrd104.Tab(Sender: TObject; var Key: Word;Shift: TShiftState);
var
  lcTabOrder:integer;
Begin

  if not ((key=VK_Down) or (key=13) or (key=VK_Up)) then exit;
        //-----get lcTabOrder value
  lcTabOrder:=0;
  if Sender.ClassName='TTntEdit' then
  begin
    if TTntEdit(Sender).Name='TntEdit_emp_id' then lcTabOrder:=0;
    if TTntEdit(Sender).Name='TntEdit_name' then lcTabOrder:=1;
    if TTntEdit(Sender).Name='TntEdit_department' then lcTabOrder:=2;
    if TTntEdit(Sender).Name='TntEdit_mark' then lcTabOrder:=4;
  end;
  if Sender.ClassName='TTntComboBox' then
    if TTntComboBox(Sender).Name='TntComboBox_acs_name' then lcTabOrder:=3;
  if Sender.ClassName='TTntBitBtn' then
    if TTntBitBtn(Sender).Name='TntBitBtn_save' then lcTabOrder:=5;
        //-----deal key event
  if (key=VK_Down) or (key=13) then
  begin
    Key:=0;
    if not JudgeData(lcTabOrder) then exit;
    case lcTabOrder of
      0:
      begin
        TntComboBox_acs_name.SetFocus ;
      end;
      3:
        TntEdit_mark.SetFocus ;
      4:
        TntBitBtn_save.SetFocus ;
    end;
    exit;
  end;
  if (key=VK_Up) then
  begin
    Key:=0;
    case lcTabOrder of
      1..3:
        TntEdit_emp_id.SetFocus ;
      4:
        TntComboBox_acs_name.SetFocus ;
      5:
        TntEdit_mark.SetFocus ;
    end;
    exit;
  end;
end;

//Judge Data is ok or no?

function TFormfhrd104.JudgeData(An:integer):Boolean;
var
  lcmark:integer;
  lcLangMsg:widestring;
begin
  Result:=true;
  case An of
    0:
    begin
      ADOQuery_waitAssess.Locate('emp_id',TntEdit_emp_id.Text,[loCaseInsensitive]);
      if ADOQuery_waitAssess.Fields[0].Value=TntEdit_emp_id.Text then
      begin
        TntEdit_name.Text :=ADOQuery_waitAssess.Fields[1].Value;
        TntEdit_department.Text :=ADOQuery_waitAssess.Fields[3].Value;
        gDeal_State:='add';
      end
      else
      begin
        ADOQuery_access.Locate('emp_id',TntEdit_emp_id.Text,[loCaseInsensitive]);
        if ADOQuery_access.Fields[0].Value=TntEdit_emp_id.Text then
        begin
          TntEdit_name.Text :=ADOQuery_access.Fields[1].Value;
          TntEdit_department.Text :=ADOQuery_access.Fields[3].Value;
          gDeal_State:='update'
        end
        else
        begin
          lcLangMsg:=GetLangName(gLangWStrs,'table_field_emp_id');
          lcLangMsg:=lcLangMsg+GetLangName(gLangWStrs,'msg_no_exist');
          msgError(lcLangMsg);
          Result:=false;
        end;
      end;
    end;
    3:
    begin
      if TntComboBox_acs_name.ItemIndex =-1 then
      begin
        lcLangMsg:=GetLangName(gLangWStrs,'msg_please_select');
        lcLangMsg:=lcLangMsg+GetLangName(gLangWStrs,'table_field_acs_name');
        msgError(lcLangMsg);
        Result:=false;
      end;
    end;
    4:
    begin
      try
        lcmark:=StrToInt(TntEdit_mark.Text );
      except
        lcLangMsg:=GetLangName(gLangWStrs,'table_field_mark');
        lcLangMsg:=lcLangMsg+GetLangName(gLangWStrs,'msg_input_error');
        msgError(lcLangMsg);
        Result:=false;
        exit;
      end;
      if lcmark<0 then
      begin
        lcLangMsg:=GetLangName(gLangWStrs,'table_field_mark');
        lcLangMsg:=lcLangMsg+GetLangName(gLangWStrs,'msg_less_0');
        msgError(lcLangMsg);
        Result:=false;
      end;
    end;

  end;
end;

//click save's button

procedure TFormfhrd104.TntBitBtn_saveClick(Sender: TObject);
var
  lcSql:string;
  lcAsc_id:string;
begin
if WideMessageDlg(GetLangName(gLangWStrs,'msg_confirm_save'),mtWarning,mbOKCancel,0) = ID_OK then
begin
  if not JudgeData(0) then exit;   //emp_id
  if not JudgeData(3) then exit;   //check data
  if not JudgeData(4) then exit;   //mark
  lcAsc_id:=gAcs_idArray[TntComboBox_acs_name.ItemIndex];
  //--save data
  lcSql:='select emp_id from fhrd_access where emp_id='''+TntEdit_emp_id.Text+'''';
  lcSql:=lcSql+' and chk_month='''+TntEdit_checkMonth.Text+'''';
  lcSql:=lcSql+' and acs_id='''+lcAsc_id+'''';
  DMHrdsys.SQLQuery1.SQL.Clear ;
  DMHrdsys.SQLQuery1.SQL.Add(lcSql);
  DMHrdsys.SQLQuery1.Open ;
  if DMHrdsys.SQLQuery1.Eof then
  begin                          //add data
    lcSql:='insert into fhrd_access(upd_user,chk_month,emp_id,acs_id,mark) ';
    lcSql:=lcSql+' values('''+UserName+''',' ;
    lcSql:=lcSql+' '''+TntEdit_checkMonth.Text+''',';
    lcSql:=lcSql+' '''+TntEdit_emp_id.Text+''',';
    lcSql:=lcSql+' '''+lcAsc_id+''',';
    lcSql:=lcSql+' '+TntEdit_mark.Text+')';
  end
  else
  begin                          //update data
    lcSql:='update fhrd_access set upd_user='''+UserName+''',';
    lcSql:=lcSql+' upd_date='''+DatetimeTostr(date)+''',';
    lcSql:=lcSql+' mark='+TntEdit_mark.Text ;
    lcSql:=lcSql+' where emp_id='''+TntEdit_emp_id.Text+'''';
    lcSql:=lcSql+' and chk_month='''+TntEdit_checkMonth.Text+'''';
    lcSql:=lcSql+' and acs_id='''+lcAsc_id+'''';
  end;

  DMHrdsys.ADOCommand1.CommandText :='';
  DMHrdsys.ADOCommand1.CommandText :=lcSql;
  try
    DMHrdsys.ADOCommand1.Execute ;
  except
    msgError(GetLangName(gLangWStrs,'msg_save_error'));
    exit;
  end;

  //fresh grid
  ADOQuery_waitAssess.Close ;
  ADOQuery_waitAssess.Open ;
  ChangeDBGridTitleColor(TntDBGrid_waitAssess,0);  //sort color
  ADOQuery_access.Close ;
  ADOQuery_access.Open ;
  ADOQuery_access.Locate('emp_id;chk_month;acs_id',VarArrayOf([TntEdit_emp_id.Text,TntEdit_checkMonth.Text,lcAsc_id]),[loCaseInsensitive]); //go to current's record
  ChangeDBGridTitleColor(TntDBGrid_browsData,0);  //sort color

  TntEdit_emp_id.Text :='';
  TntEdit_name.Text :='';
  TntEdit_department.Text :='';
  TntComboBox_acs_name.Text :='';
  TntEdit_mark.Text :='';
  TntEdit_emp_id.SetFocus ;
  gDeal_State:='';
end;
end;

//click deleted's button

procedure TFormfhrd104.TntBitBtn_deletedClick(Sender: TObject);
var
  lcSql,lcAsc_id:string;
begin
  if WideMessageDlg(GetLangName(gLangWStrs,'msg_del_alert'),mtWarning,mbOKCancel,0) = ID_OK then
  begin
  if not JudgeData(0) then exit;   //emp_id
  if not JudgeData(3) then exit;   //check data
  lcAsc_id:=gAcs_idArray[TntComboBox_acs_name.ItemIndex];
  lcSql:='delete from fhrd_access where emp_id='''+TntEdit_emp_id.Text+'''';
  lcSql:=lcSql+' and chk_month='''+TntEdit_checkMonth.Text+'''';
  lcSql:=lcSql+' and acs_id='''+lcAsc_id+'''';

  DMHrdsys.ADOCommand1.CommandText :='' ;
  DMHrdsys.ADOCommand1.CommandText :=lcSql;
  try
    DMHrdsys.ADOCommand1.Execute ;
  except
    msgError(GetLangName(gLangWStrs,'msg_deleted_error'));
    exit;
  end;

  ADOQuery_waitAssess.Close ;
  ADOQuery_waitAssess.Open ;
  ChangeDBGridTitleColor(TntDBGrid_waitAssess,0);  //sort color
  ADOQuery_access.Close ;
  ADOQuery_access.Open ;
  ChangeDBGridTitleColor(TntDBGrid_browsData,0);  //sort color

  TntEdit_emp_id.Text :='';
  TntEdit_name.Text :='';
  TntEdit_department.Text :='';
  TntComboBox_acs_name.Text :='';
  TntEdit_mark.Text :='';
  TntEdit_emp_id.SetFocus ;
  end;
end;

//click Assess Items's ComboBox

procedure TFormfhrd104.TntComboBox_acs_nameClick(Sender: TObject);
var
  lcAsc_id:string;
begin
  if gDeal_State='update' then
  begin
    lcAsc_id:=gAcs_idArray[TntComboBox_acs_name.ItemIndex];
    ADOQuery_access.Locate('emp_id;chk_month;acs_id',VarArrayOf([TntEdit_emp_id.Text,TntEdit_checkMonth.Text,lcAsc_id]),[loCaseInsensitive]); //go to current's record
    if (ADOQuery_access.Fields[0].Value=TntEdit_emp_id.Text) and (ADOQuery_access.Fields[6].Value=TntEdit_checkMonth.Text) and (ADOQuery_access.Fields[7].Value=lcAsc_id) then
      TntEdit_mark.Text :=ADOQuery_access.Fields[5].Value;
  end;
  TntEdit_mark.SetFocus ;
end;

//close form

procedure TFormfhrd104.TntBitBtn_exitClick(Sender: TObject);
begin
  close;
end;


////////////////////////////////message begin//////////////////////////////

//message's Error

procedure TFormfhrd104.msgError(errormsg:WideString);
begin
        wideMessageDlg(errormsg,mterror,[mbOk],0);
end;

//message's Information

procedure TFormfhrd104.msgInformation(infomsg:WideString);
begin
        wideMessageDlg(infomsg,mtInformation,[mbOk],0); //TMsgDlgType,TMsgDlgButtons
end;

//message's Warning

procedure TFormfhrd104.msgWarning(warningmsg:WideString);
begin
        wideMessageDlg(warningmsg,mtwarning,[mbOk],0); //TMsgDlgType,TMsgDlgButtons
end;

//message's Stop

procedure TFormfhrd104.msgStop(stopmsg:WideString);
var
        str_temp:array[0..254] of char;
begin
        StrPCopy(str_temp,stopmsg);
        Application.MessageBox(str_temp,'Stop',MB_ICONSTOP);
end;

//message's Confirm

function TFormfhrd104.msgConfirm(Confirmmsg:WideString):Boolean;
begin
        if wideMessageDlg(Confirmmsg,mtConfirmation,[mbYes,mbNo],0)=6 then //TMsgDlgType,TMsgDlgButtons
                Result:=True
        else
                Result:=false;
end;

////////////////////////////////message end//////////////////////////////

//change DBGrid's title color

procedure TFormfhrd104.ChangeDBGridTitleColor(var ADBGrid:TTntDBGrid;AID:integer);
var
  i:integer;
  lcColor:TColor;
begin
  lcColor:=clSkyBlue;
  for i:=0 to ADBGrid.Columns.Count-1 do
    ADBGrid.Columns[i].Title.Color:=lcColor;
  ADBGrid.Columns[AID].Title.Color:=clMoneyGreen;
end;

//DBGrid sort by title(DBGrid_waitAssess)

procedure TFormfhrd104.TntDBGrid_waitAssessTitleClick(Column: TColumn);
begin
  ChangeDBGridTitleColor(TntDBGrid_waitAssess,Column.ID);
  DBGridSortByTitle(Column);
end;

//DBGrid sort by title(DBGrid_browsData)

procedure TFormfhrd104.TntDBGrid_browsDataTitleClick(Column: TColumn);
begin
  ChangeDBGridTitleColor(TntDBGrid_browsData,Column.ID);
  DBGridSortByTitle(Column);
end;

procedure TFormfhrd104.TntComboBox_department_bgnChange(Sender: TObject);
begin
  if TntComboBox_department_bgn.Text<>'' then
  begin
    TntRadioButton_department.Checked := true;
    TntEdit_emp_id_bgn.Text := '';
    TntEdit_emp_id_end.Text :='';
    TntRadioButton_emp_id.Checked := false;
  end;
end;

procedure TFormfhrd104.TntComboBox_department_endChange(Sender: TObject);
begin
    TntRadioButton_department.Checked := true;
    TntEdit_emp_id_bgn.Text := '';
    TntEdit_emp_id_end.Text :='';
    TntRadioButton_emp_id.Checked := false;
end;

procedure TFormfhrd104.TntEdit_emp_id_bgnChange(Sender: TObject);
begin
  if TntEdit_emp_id_bgn.Text<>'' then
  begin
    TntRadioButton_department.Checked := false;
    TntComboBox_department_bgn.Text := '';
    TntComboBox_department_end.Text := '';
    TntRadioButton_emp_id.Checked := true;
  end;
end;

procedure TFormfhrd104.TntEdit_emp_id_endChange(Sender: TObject);
begin
  if TntEdit_emp_id_end.Text<>'' then
  begin
    TntRadioButton_department.Checked := false;
    TntComboBox_department_bgn.Text := '';
    TntComboBox_department_end.Text := '';
    TntRadioButton_emp_id.Checked := true;
  end;
end;

procedure TFormfhrd104.TntFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFormfhrd104.TntDBGrid_browsDataCellClick(Column: TColumn);
var
  i : integer;
begin
  if not VarIsNull(ADOQuery_access.FieldValues['emp_id']) then
    TntEdit_emp_id.Text := ADOQuery_access.FieldValues['emp_id'];
  if not VarIsNull(ADOQuery_access.FieldValues['emp_name']) then
    TntEdit_name.Text := ADOQuery_access.FieldValues['emp_name'];
  if not VarIsNull(ADOQuery_access.FieldValues['dept_abbr']) then
    TntEdit_department.Text := ADOQuery_access.FieldValues['dept_abbr'];
  if not VarIsNull(ADOQuery_access.FieldValues['mark']) then
    TntEdit_mark.Text := ADOQuery_access.FieldValues['mark'];
  For i:=0 to TntComboBox_acs_name.Items.Count-1 do
  begin
    if ADOQuery_access.FieldValues['acs_id']=LeftStr(TntComboBox_acs_name.Items.Strings[i],2) then
    begin
      TntComboBox_acs_name.ItemIndex := i;
      break;
    end;
  end;
end;

end.
