unit UnitHrd72;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,tntDialogs, ExtCtrls,StrUtils, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, TntExtCtrls, TntDBGrids, TntDbCtrls, TntStdCtrls, TntButtons,
  DB, ADODB, DBClient, Provider,DateUtils,WSDLIntf, TntComCtrls, TntDB,
  ComObj, ExcelXP, Math;

type
  TFormHrd72 = class(TForm)
    TntPanel1: TTntPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    TntPanel2: TTntPanel;
    PanelAct: TTntPanel;
    sb_save: TTntSpeedButton;
    sb_undo: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_del: TTntSpeedButton;
    sb_Add: TTntSpeedButton;
    pnlSearch: TTntPanel;
    GbCond: TTntGroupBox;
    EditEmp_B: TTntEdit;
    EditEmp_E: TTntEdit;
    cbEmp: TTntCheckBox;
    cbDept: TTntCheckBox;
    CbbDept_B: TTntComboBox;
    CbbDept_E: TTntComboBox;
    DBGrid1: TTntDBGrid;
    PanelFlow: TTntPanel;
    TntLabel6: TTntLabel;
    sbtn_add: TTntSpeedButton;
    sbtn_finish: TTntSpeedButton;
    TntPanel6: TTntPanel;
    ImageClose: TImage;
    gbVisible: TTntGroupBox;
    TntLabel4: TTntLabel;
    TntLabel5: TTntLabel;
    TntLabel8: TTntLabel;
    TLB_NO: TTntLabel;
    TLB_MONTH: TTntLabel;
    TLB_TYPE: TTntLabel;
    TLB_REMARK: TTntLabel;
    NVG: TDBNavigator;
    TntLabel3: TTntLabel;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1insur_month: TStringField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1base_pay: TBCDField;
    ADOQuery1insur_money: TBCDField;
    ADOQuery1insur_days: TIntegerField;
    ADOQuery1insur_class: TStringField;
    ADOQuery1print_date: TDateTimeField;
    ADOQuery1print_user: TStringField;
    ADOQuery1remark: TWideStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1epid_no: TStringField;
    ADOQuery1epindt: TDateField;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    TntLabel7: TTntLabel;
    ADOQuery1date_b: TDateTimeField;
    ADOQuery1date_e: TDateTimeField;
    TntDBEdit1: TTntDBEdit;
    TntDBEdit2: TTntDBEdit;
    TntDBEdit3: TTntDBEdit;
    TntDBEdit4: TTntDBEdit;
    TntDBEdit5: TTntDBEdit;
    TntDBEdit6: TTntDBEdit;
    TntDBEdit7: TTntDBEdit;
    TntDBEdit8: TTntDBEdit;
    cbbClass: TTntComboBox;
    TntDBEdit11: TTntDBEdit;
    TntLabel11: TTntLabel;
    DbEditDate_B: TTntDBEdit;
    DbEditDate_E: TTntDBEdit;
    TntSpeedButton1: TTntSpeedButton;
    TntSpeedButton2: TTntSpeedButton;
    ADOQuery1department: TWideStringField;
    TntLabel12: TTntLabel;
    TntDBEdit14: TTntDBEdit;
    ADOQuery1insur_money1: TBCDField;
    TntPanel3: TTntPanel;
    RbAll: TTntRadioButton;
    RbYes: TTntRadioButton;
    RbNo: TTntRadioButton;
    cbMonth: TTntCheckBox;
    cbDate: TTntCheckBox;
    EditMonth: TTntEdit;
    dtpDate_B: TTntDateTimePicker;
    dtpDate_E: TTntDateTimePicker;
    bbtn_search: TTntBitBtn;
    bbtn_reset: TTntBitBtn;
    TntLabel9: TTntLabel;
    TntLabel10: TTntLabel;
    TntLabel13: TTntLabel;
    TntLabel14: TTntLabel;
    TntLabel15: TTntLabel;
    sb_print: TTntSpeedButton;
    mmTitle: TTntMemo;
    mmTitle2: TTntMemo;
    ADOQuery1insur_rate: TIntegerField;
    TntLabel16: TTntLabel;
    TntLabel17: TTntLabel;
    TntLabel18: TTntLabel;
    TntSpeedButton3: TTntSpeedButton;
    DBEditDate_Apply: TTntDBEdit;
    ADOQuery1apply_date: TDateTimeField;
    mcDate: TTntMonthCalendar;
    procedure InitLangInfo;
    function GetPst(pstcode:string):widestring;

    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure sb_AddClick(Sender: TObject);
    procedure TntPanel6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CbbDept_EChange(Sender: TObject);
    procedure bbtn_searchClick(Sender: TObject);
    procedure SetActEnabled(Modify_Flag:boolean=true);
    procedure bbtn_resetClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure sbtn_finishClick(Sender: TObject);
    procedure sqlQuery1AfterClose(DataSet: TDataSet);
    procedure sqlQuery1AfterOpen(DataSet: TDataSet);
    procedure sqlQuery1BeforePost(DataSet: TDataSet);
    procedure sqlQuery1WillChangeRecord(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      var EventStatus: TEventStatus);
    procedure ImageCloseClick(Sender: TObject);
    procedure sb_delClick(Sender: TObject);
    procedure sb_undoClick(Sender: TObject);
    procedure sb_saveClick(Sender: TObject);
    procedure sbtn_addClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure EditEmp_BChange(Sender: TObject);
    procedure ADOQuery1NewRecord(DataSet: TDataSet);
    procedure cbbClassChange(Sender: TObject);
    procedure ADOQuery1insur_classGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure TntSpeedButton1Click(Sender: TObject);
    procedure TntSpeedButton2Click(Sender: TObject);
    procedure mcDateDblClick(Sender: TObject);
    procedure cbEmpClick(Sender: TObject);
    procedure cbDeptClick(Sender: TObject);
    procedure cbMonthClick(Sender: TObject);
    procedure cbDateClick(Sender: TObject);
    procedure RbNoClick(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure sb_printClick(Sender: TObject);
    procedure dtpDate_BChange(Sender: TObject);
    procedure TntSpeedButton3Click(Sender: TObject);
  private
    //
    procedure ExportDataToExcel;
    //
    function IsCanUpdate(AInsurMonth, AInsurClass, AEmpID: string; ADateB, ADateE: TDateTime): Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd72: TFormHrd72;
  ws_Words:TWideStrings;
  SalBaseLvl:TStrings;
implementation

uses
  UnitDMHrdsys,UnitHrdUtils;
  
var
  prvArr:TPrvArr;
  IsAdd:Boolean;
{$R *.dfm}

var
  iSelect : Integer = 0;

procedure TFormHrd72.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  //定義要用到的語言
  ThisFormUsedWords:='hrd09_error1,hrd09_error2,hrd09_error3,hrd09_error4,'+
      'hrd09_error5,hrd09_error6';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
  //
  SetComponentLang(self);
end;

procedure TFormHrd72.FormCreate(Sender: TObject);
var
  sSQL: string;
begin
  prvArr:=GetPrvArr(userName,'hrd72');
  SetActEnabled(false);
  
//取得部門代號
  CbbDept_B.Clear;
  CbbDept_E.Clear;
  //部門
  if UserLang ='E' then
    sSQL := 'select dept_code+'' ''+eng_titl from hrd_dept where '+G_sFactorySql
  else if UserLang= 'V' then
    sSQL := 'select dept_code+'' ''+vim_titl from hrd_dept where '+G_sFactorySql
  else
    sSQL := 'select dept_code+'' ''+abbr_titl from hrd_dept where '+G_sFactorySql;
  //
  SetComboxList(sSQL, CbbDept_B);
  SetComboxList(sSQL, CbbDept_E);
  //報銷比率
  if UserLang = 'E' then
    sSQL := 'SELECT CLAS_CODE+'' ''+CLAS_ENG FROM HRD_EMP_INSURANCE_CLASS'
  else if UserLang ='V' then
    sSQL := 'SELECT CLAS_CODE+'' ''+CLAS_VIM FROM HRD_EMP_INSURANCE_CLASS'
  else
    sSQL := 'SELECT CLAS_CODE+'' ''+CLAS_CHS FROM HRD_EMP_INSURANCE_CLASS';
  //
  SetComboxList(sSQL, cbbClass);
  //
  CbbDept_B.ItemIndex:=0;
  CbbDept_E.ItemIndex:=CbbDept_E.Items.Count-1;
  InitLangInfo;
  SalBaseLvl:=GetAllBaseLvl;
  //
  EditMonth.Text := FormatDateTime('YYYYMM', Date);
  //
  dtpDate_B.Date := Date;
  dtpDate_E.Date := Date;
  //
  mcDate.Date := Date;
end;

procedure TFormHrd72.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormHrd72.sb_AddClick(Sender: TObject);
begin
  IsAdd:=true;
  with adoquery1 do
  begin
    if not active then
    begin
      sql.Clear;
      sql.Add('select * from hrd_emp_insurance where 1<0');
      Open;
    end;
    Append;
  end;
  PanelFlow.Show;
  NVG.Hide;
  sbtn_add.Show;
  DBGrid1.Enabled :=false;
  PanelAct.Enabled :=false;
  pnlSearch.Enabled := False;
end;

procedure TFormHrd72.TntPanel6MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);
end;

procedure TFormHrd72.CbbDept_EChange(Sender: TObject);
begin
  if CbbDept_B.ItemIndex>CbbDept_E.ItemIndex then
    CbbDept_E.ItemIndex := CbbDept_B.ItemIndex;
end;

procedure TFormHrd72.bbtn_searchClick(Sender: TObject);
var
  sSQL: string;
begin
  //
  sSQL := 'SELECT * FROM HRD_EMP_INSURANCE A WHERE 1=1';
  //
  if cbEmp.Checked then
  begin
    sSQL := sSQL + ' AND A.EMP_ID >= '+QuotedStr(EditEmp_B.Text);
    sSQL := sSQL + ' AND A.EMP_ID <= '+QuotedStr(EditEmp_E.Text);
  end;
  //
  if RbYes.Checked then
    sSQL := sSQL + ' AND A.PRINT_DATE IS NOT NULL';
  //
  if RbNo.Checked then
    sSQL := sSQL + ' AND A.PRINT_DATE IS NULL';
  //
  if cbDate.Checked then
  begin
    sSQL := sSQL + ' AND CONVERT(VARCHAR(8), A.UPD_DATE, 112) >= '+QuotedStr(FormatDateTime('YYYYMMDD', dtpDate_B.Date));
    sSQL := sSQL + ' AND CONVERT(VARCHAR(8), A.UPD_DATE, 112) <= '+QuotedStr(FormatDateTime('YYYYMMDD', dtpDate_E.Date));
  end;
  //
  if cbMonth.Checked then
    sSQL := sSQL + ' AND A.INSUR_MONTH = '+QuotedStr(EditMonth.Text);
  //部門
  if cbDept.Checked then
  begin
    sSQL := sSQL + ' AND EXISTS(SELECT * FROM HRD_EMP B WHERE A.EMP_ID = B.EMP_ID AND B.DEPT_CODE >= '+QuotedStr(Copy(CbbDept_B.Text, 1, 6))+')';
    sSQL := sSQL + ' AND EXISTS(SELECT * FROM HRD_EMP B WHERE A.EMP_ID = B.EMP_ID AND B.DEPT_CODE <= '+QuotedStr(Copy(CbbDept_E.Text, 1, 6))+')';
  end;
  //
  sSQL := sSQL + ' ORDER BY A.EMP_ID';
  //
  with Adoquery1 do
  begin
    Sql.Clear;
    Sql.Add(sSQL);
    Open;
  end;

  GbCond.Enabled := False;

  bbtn_reset.Enabled := true;
  bbtn_search.Enabled := false;
end;

procedure TFormHrd72.SetActEnabled(Modify_Flag:boolean=true);
var
  status:boolean;
  IsEmpty:boolean;
begin
  status:=Adoquery1.Active;
  IsEmpty :=Adoquery1.eof;
  //
  sb_print.Enabled:=PrvArr[PRT];
  sb_Add.Enabled:=PrvArr[ADD];
  sb_Del.Enabled:=status and PrvArr[DEL] and (Not IsEmpty);
  sb_edit.Enabled:=status and PrvArr[UPD];
  sb_undo.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;

procedure TFormHrd72.bbtn_resetClick(Sender: TObject);
begin
  adoquery1.Close;
  GbCond.Enabled := True;
  bbtn_reset.Enabled := false;
  bbtn_search.Enabled := true;
end;

procedure TFormHrd72.sb_editClick(Sender: TObject);
begin
  //
  if not ADOQuery1.Active then Exit;
  //
  if not ADOQuery1print_date.IsNull then Exit;
  //是否可刪除
  if IsCanUpdate(ADOQuery1insur_month.AsString,
                     ADOQuery1insur_class.AsString,
                     ADOQuery1emp_id.AsString,
                     ADOQuery1date_b.AsDateTime,
                     ADOQuery1date_e.AsDateTime) then Exit;
  //
  IsAdd:=false;
  PanelFlow.Show;
  NVG.Show;
  sbtn_add.Hide;
  //TntDBGrid2.Enabled :=false;
  PanelAct.Enabled :=false;
end;

procedure TFormHrd72.sbtn_finishClick(Sender: TObject);
begin
  if ADOQuery1.State in [dsInsert, dsEdit] then
    ADOQuery1.Post;
  pnlSearch.Enabled := True;
  PanelFlow.Hide;
  PanelAct.Enabled := true;
  DBGrid1.Enabled := true;
  IsAdd:=false;
end;

procedure TFormHrd72.sqlQuery1AfterClose(DataSet: TDataSet);
begin
  SetActEnabled(false);
end;

procedure TFormHrd72.sqlQuery1AfterOpen(DataSet: TDataSet);
begin
  SetActEnabled(false);
end;

procedure TFormHrd72.sqlQuery1BeforePost(DataSet: TDataSet);
begin
  //
  if ADOQuery1insur_month.IsNull or
     ADOQuery1emp_id.IsNull or
     ADOQuery1insur_class.IsNull or
     ADOQuery1base_pay.IsNull or
     ADOQuery1insur_days.IsNull or
     ADOQuery1date_b.IsNull or
     ADOQuery1date_e.IsNull then
  begin
    wideShowmessage(GetLangName(ws_words,'hrd10_error7'));
    Abort;
  end;
  //
  with Adoquery1 do
  begin
    Edit;
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=GetServerDatetime;
    //
    FieldByName('insur_money').AsBCD := FieldByName('insur_money1').AsBCD;
  end;
end;

procedure TFormHrd72.sqlQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
begin
  SetActEnabled(true);
end;

procedure TFormHrd72.ImageCloseClick(Sender: TObject);
begin
  DBGrid1.Enabled := true;
  pnlSearch.Enabled := True;
  PanelAct.Enabled := true;
  PanelFlow.Hide;
  IsAdd:=false;
end;

procedure TFormHrd72.sb_delClick(Sender: TObject);
begin
  //
  if not ADOQuery1.Active then Exit;
  //
  if not ADOQuery1print_date.IsNull then Exit;
  //是否可刪除
  if IsCanUpdate(ADOQuery1insur_month.AsString,
                     ADOQuery1insur_class.AsString,
                     ADOQuery1emp_id.AsString,
                     ADOQuery1date_b.AsDateTime,
                     ADOQuery1date_e.AsDateTime) then Exit;
  //
  if not adoquery1.Eof then
    adoquery1.Delete;
end;

procedure TFormHrd72.sb_undoClick(Sender: TObject);
begin
  adoquery1.CancelBatch(arAll);
  SetActEnabled(false);
end;

procedure TFormHrd72.sb_saveClick(Sender: TObject);
var
  I: Integer;
begin
  for I:= 0 to ADOQuery1.FieldCount- 1 do
    ShowMessage(ADOQuery1.Fields[I].AsString);

  adoquery1.UpdateBatch(arAll);
  SetActEnabled(false);
end;

procedure TFormHrd72.sbtn_addClick(Sender: TObject);
var
  flag:boolean;
  i:integer;
begin
  flag:=false;
  for i:=2 to 5 do
  begin
    if i=3 then continue;
    if Adoquery1.Fields[i].AsString='' then
      flag:= true;
  end;
  if not flag then
    Adoquery1.Append;
end;

procedure TFormHrd72.ADOQuery1CalcFields(DataSet: TDataSet);
var
  sSQL: string;
  //
  iDays, iRate: Integer;
  //
  iMoney : Int64;
  //
  dMoney, rRate : Double;
  //
  boSpc: Boolean;
begin
  //
  sSQL := 'SELECT A.EMP_ID,'
        + '       A.EMP_CHS,'
        + '       A.NAME_VIM,'
        + '       A.NAME_ENG,'
        + '       A.EPID_NO,'
        + '       A.EPINDT,'
        + '       A.DEPT_CODE,'
        + '       B.ABBR_TITL,'
        + '       B.VIM_TITL,'
        + '       B.ENG_TITL'
        + '  FROM HRD_EMP A, HRD_DEPT B'
        + ' WHERE A.DEPT_CODE = B.DEPT_CODE'
        + '   AND A.EMP_ID = '+QuotedStr(DataSet.FieldByName('emp_id').AsString);
  //
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    if not IsEmpty then
    begin
      //姓名
      DataSet.FieldByName('name_vim').Value := FieldByName('name_vim').Value;
      //部門
      if UserLang= 'E' then
        DataSet.FieldByName('department').Value := FieldByName('dept_code').AsString+' '+ widestring(FieldByName('end_titl').value)
      else if UserLang = 'V' then
        DataSet.FieldByName('department').Value := FieldByName('dept_code').AsString+' '+ widestring(FieldByName('vim_titl').value)
      else
        DataSet.FieldByName('department').Value := FieldByName('dept_code').AsString+' '+ widestring(FieldByName('abbr_titl').value);
      //進廠日期
      DataSet.FieldByName('epindt').Value := FieldByName('epindt').Value;
      //身份證號碼
      DataSet.FieldByName('epid_no').Value := FieldByName('epid_no').Value;
    end;
    //
    Close;
  end;
  //
  rRate := 0;
  boSpc := False;
  //計算比率
  sSQL := 'SELECT CLAS_RATE, CLAS_SPC'
        + '  FROM HRD_EMP_INSURANCE_CLASS'
        + ' WHERE CLAS_CODE = '+QuotedStr(DataSet.FieldByName('insur_class').AsString);
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    if not IsEmpty then
    begin
      //換算比率
      iRate := FieldByName('CLAS_RATE').AsInteger;
      rRate := iRate/100;
      //特殊算法
      boSpc := FieldByName('CLAS_SPC').AsString = '1';
    end;
    Close;
  end;
  //
  DataSet.FieldByName('insur_rate').AsInteger := iRate;
  //
  iDays := DataSet.FieldByName('insur_days').AsInteger;

  //特殊--基本工資*比率*天數
  if boSpc then
    if iRate = 100 then
    begin
      if iDays > 120 then
      begin
        DataSet.FieldByName('insur_money1').AsFloat := SimpleRoundTo(((DataSet.FieldByName('base_pay').AsInteger*6*rRate)+1150000*2)/100, 0)*100 + 2300000;
      end
      else
        DataSet.FieldByName('insur_money1').AsCurrency := SimpleRoundTo((DataSet.FieldByName('base_pay').AsInteger/26*rRate*iDays)/100, 0)*100  + 2300000;
    end
    else
      DataSet.FieldByName('insur_money1').AsCurrency := SimpleRoundTo((DataSet.FieldByName('base_pay').AsInteger*rRate*iDays)/100, 0)*100
  //一般--基本工資/26*比率*天數
  else begin
    //一胞胎-180天
    if (iRate = 100) and (iDays > 120) and (iDays <= 180) then
      DataSet.FieldByName('insur_money1').AsFloat := SimpleRoundTo(((DataSet.FieldByName('base_pay').AsInteger*6*rRate)+1150000*2)/100, 0)*100
    //雙胞胎-210天
    else if (iRate = 100) and (iDays = 210) then
      DataSet.FieldByName('insur_money1').AsFloat := SimpleRoundTo(((DataSet.FieldByName('base_pay').AsInteger*7*rRate)+4600000)/100, 0)*100
    //三胞胎-240天
    else if (iRate = 100) and (iDays = 240) then
      DataSet.FieldByName('insur_money1').AsFloat := SimpleRoundTo(((DataSet.FieldByName('base_pay').AsInteger*8*rRate)+6900000)/100, 0)*100
    //四胞胎-270天
    else if (iRate = 100) and (iDays = 270) then
      DataSet.FieldByName('insur_money1').AsFloat := SimpleRoundTo(((DataSet.FieldByName('base_pay').AsInteger*9*rRate)+9200000)/100, 0)*100
    else
      DataSet.FieldByName('insur_money1').AsCurrency := SimpleRoundTo((DataSet.FieldByName('base_pay').AsInteger/26*rRate*iDays)/100, 0)*100;
  end;
end;

function TFormHrd72.GetPst(pstcode:string):widestring;
begin
  with dmhrdsys.sqlquery1 do
  begin
    close;
    sql.clear;
    sql.add('select * from hrd_prof where pst_code='''+pstcode+''' ');
    open;
    if not eof then
    begin
      if UserLang= 'V' then
        Result:= FieldByName('pst_vim').Value
      else if UserLang= 'E' then
        Result:= FieldByName('pst_eng').Value
      else
        Result:= Fieldbyname('pst_chs').value;
    end
    else
      result:='';  
  end;
end;

procedure TFormHrd72.EditEmp_BChange(Sender: TObject);
begin
  //
  EditEmp_E.Text := EditEmp_B.Text;
end;

procedure TFormHrd72.ADOQuery1NewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('insur_month').AsString := FormatDateTime('YYYYMM', Date);
end;

procedure TFormHrd72.cbbClassChange(Sender: TObject);
var
  sClassCode: string;
begin
  //
  if not ADOQuery1.Active then Exit;
  //
  sClassCode := Copy(cbbClass.Text, 1, 2);
  ADOQuery1.Edit;
  ADOQuery1insur_class.AsString := Copy(cbbClass.Text, 1, 2);
  //
  if sClassCode= '04' then
    ADOQuery1base_pay.AsInteger := 1150000
  else if ADOQuery1base_pay.AsInteger = 1150000 then
    ADOQuery1base_pay.AsInteger := 0;
end;

procedure TFormHrd72.ADOQuery1insur_classGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  sSQL: string;  
begin
  {
  //
  if UserLang = 'E' then
    sSQL := 'SELECT CLAS_CODE + '' ''+ CLAS_ENG AS CLAS_NAME'
          + '  FROM HRD_EMP_INSURANCE_CLASS'
          + ' WHERE CLAS_CODE = '+QuotedStr(Sender.AsString)
  else if UserLang = 'V' then
    sSQL := 'SELECT CLAS_CODE + '' ''+ CLAS_VIM AS CLAS_NAME'
          + '  FROM HRD_EMP_INSURANCE_CLASS'
          + ' WHERE CLAS_CODE = '+QuotedStr(Sender.AsString)
  else
    sSQL := 'SELECT CLAS_CODE + '' ''+ CLAS_CHS AS CLAS_NAME'
      + '  FROM HRD_EMP_INSURANCE_CLASS'
      + ' WHERE CLAS_CODE = '+QuotedStr(Sender.AsString);
  }
  //
  if UserLang = 'E' then
    sSQL := 'SELECT CLAS_ENG AS CLAS_NAME'
          + '  FROM HRD_EMP_INSURANCE_CLASS'
          + ' WHERE CLAS_CODE = '+QuotedStr(Sender.AsString)
  else if UserLang = 'V' then
    sSQL := 'SELECT CLAS_VIM AS CLAS_NAME'
          + '  FROM HRD_EMP_INSURANCE_CLASS'
          + ' WHERE CLAS_CODE = '+QuotedStr(Sender.AsString)
  else
    sSQL := 'SELECT CLAS_CHS AS CLAS_NAME'
      + '  FROM HRD_EMP_INSURANCE_CLASS'
      + ' WHERE CLAS_CODE = '+QuotedStr(Sender.AsString);
  //
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    if not IsEmpty then
      Text := FieldByName('CLAS_NAME').Value;
    //
    Close;
  end;
end;

procedure TFormHrd72.TntSpeedButton1Click(Sender: TObject);
begin
  iSelect := 1;
  //
  mcDate.Visible := not mcDate.Visible;
  //
  if mcDate.Visible then
  begin
    mcDate.Left := DbEditDate_B.Left + DbEditDate_B.Width - mcDate.Width;
    mcDate.Top  := DbEditDate_B.Top + DbEditDate_B.Height;
    //
    if (mcDate.Top + mcDate.Height)> gbVisible.Height then
      mcDate.Top := gbVisible.Height - mcDate.Height;
  end
end;

procedure TFormHrd72.TntSpeedButton2Click(Sender: TObject);
begin
  iSelect := 2;
  //
  mcDate.Visible := not mcDate.Visible;
  //
  if mcDate.Visible then
  begin
    mcDate.Left := DbEditDate_E.Left + DbEditDate_E.Width - mcDate.Width;
    mcDate.Top  := DbEditDate_E.Top + DbEditDate_E.Height;
    //
    if (mcDate.Top + mcDate.Height)> gbVisible.Height then
      mcDate.Top := gbVisible.Height - mcDate.Height;
  end;
end;

procedure TFormHrd72.mcDateDblClick(Sender: TObject);
var
  sDate : string;
begin
  mcDate.Visible := False;
  //
  if not ADOQuery1.Active then Exit;
  //
  sDate := FormatDateTime('YYYY/MM/DD', mcDate.Date);
  //
  case iSelect of
    1 :
      begin
        ADOQuery1.Edit;
        ADOQuery1date_b.AsString := sDate;
      end;
    2 :
      begin
        ADOQuery1.Edit;
        ADOQuery1date_e.AsString := sDate;
      end;
    3:
      begin
        ADOQuery1.Edit;
        ADOQuery1apply_date.AsString := sDate;
      end;
  end;
end;

procedure TFormHrd72.cbEmpClick(Sender: TObject);
begin
  EditEmp_B.Enabled := cbEmp.Checked;
  EditEmp_E.Enabled := cbEmp.Checked;
end;

procedure TFormHrd72.cbDeptClick(Sender: TObject);
begin
  CbbDept_B.Enabled := cbDept.Checked;
  CbbDept_E.Enabled := cbDept.Checked;
end;

procedure TFormHrd72.cbMonthClick(Sender: TObject);
begin
  EditMonth.Enabled := cbMonth.Checked;
end;

procedure TFormHrd72.cbDateClick(Sender: TObject);
begin
  dtpDate_B.Enabled := cbDate.Checked;
  dtpDate_E.Enabled := cbDate.Checked;
end;

procedure TFormHrd72.RbNoClick(Sender: TObject);
begin
  if RbNo.Checked and (cbDate.Checked) then
    cbDate.Checked := False;
end;

procedure TFormHrd72.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  //
  SetComboxIndex(cbbClass, ADOQuery1insur_class.AsString);
end;

procedure TFormHrd72.sb_printClick(Sender: TObject);
begin
  //
  ExportDataToExcel;
end;

//
procedure TFormHrd72.ExportDataToExcel;
var
  MyExcel: Variant;
  //
  iRow, I, J, iIndex : Integer;
  //
  cTotal: Currency;
begin
  try
    MyExcel := CreateOleObject('Excel.Application');
    MyExcel.WorkBooks.Add;
  except
    ShowMessage('Error');
    Exit;
  end;
  //
  MyExcel.Visible := False;
  try
    MyExcel.Cells.Font.Name := 'Times New Roman';
    MyExcel.Cells.Font.Size := 12;

    iRow := 1;
    MyExcel.Cells[iRow, 1] := mmTitle.Lines.Strings[0];
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 10]].MergeCells := True;
    iRow := 2;
    MyExcel.Cells[iRow, 2] := mmTitle.Lines.Strings[1];
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 10]].MergeCells := True;
    //
    MyExcel.Columns[5].NumberFormatLocal := '#,##0_ ';
    MyExcel.Columns[8].NumberFormatLocal := '#,##0_ ';
    //
    MyExcel.Columns[1].ColumnWidth := 6.8;
    MyExcel.Columns[2].ColumnWidth := 9;
    MyExcel.Columns[3].ColumnWidth := 32;
    MyExcel.Columns[4].ColumnWidth := 22;
    MyExcel.Columns[5].ColumnWidth := 15;
    MyExcel.Columns[6].ColumnWidth := 12;
    MyExcel.Columns[7].ColumnWidth := 7;
    MyExcel.Columns[8].ColumnWidth := 13;
    MyExcel.Columns[9].ColumnWidth := 22;
    MyExcel.Columns[10].ColumnWidth := 13;
    //
    iRow := 3;
    //
    J := 2;
    for I := 1 to 10 do
    begin
      MyExcel.Cells[iRow, I] := mmTitle.Lines.Strings[J]+#13#10+mmTitle.Lines.Strings[J+1];
      //
      Inc(J, 2);;
    end;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[3, 10]].HorizontalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[3, 10]].VerticalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[3, 10]].Font.Bold := True;
    //
    iRow := 3;
    iIndex := 0;
    cTotal := 0;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
      Inc(iIndex);
      Inc(iRow);
      //序
      MyExcel.Cells[iRow, 1] := IntToStr(iIndex);
      //工號
      MyExcel.Cells[iRow, 2] := ADOQuery1emp_id.AsString;
      //部門
      MyExcel.Cells[iRow, 3] := ADOQuery1department.Value;
      //姓名
      MyExcel.Cells[iRow, 4] := ADOQuery1name_vim.Value;
      //社保薪資
      MyExcel.Cells[iRow, 5] := ADOQuery1base_pay.Value;
      //社保天數
      MyExcel.Cells[iRow, 6] := ADOQuery1insur_days.Value;
      //報銷比率
      MyExcel.Cells[iRow, 7] := ADOQuery1insur_rate.AsString + '%';
      //報銷金額
      MyExcel.Cells[iRow, 8] := ADOQuery1insur_money.Value;
      //備註
      MyExcel.Cells[iRow, 10] := ADOQuery1remark.Value;
      //
      cTotal := cTotal + ADOQuery1insur_money.AsCurrency;
      ADOQuery1.Next;
    end;
    //
    Inc(iRow);
    //
    MyExcel.Cells[iRow, 1] := 'TOTAL';
    //
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 7]].MergeCells := True;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 7]].HorizontalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 7]].VerticalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 1], MyExcel.Cells.Item[iRow, 7]].Font.Bold := True;
    //
    MyExcel.Cells[iRow, 8] := cTotal;
    MyExcel.Cells[iRow, 8].Font.Bold := True;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[iRow, 10]].Borders.LineStyle := xlContinuous;
    //
    Inc(iRow);
    //
    MyExcel.Cells[iRow, 7] := FormatDateTime(WideString(mmTitle2.Lines.Strings[0]), Date);
    MyExcel.Cells[iRow, 7].Font.Bold := True;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 7], MyExcel.Cells.Item[iRow, 10]].MergeCells := True;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 7], MyExcel.Cells.Item[iRow, 10]].HorizontalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 7], MyExcel.Cells.Item[iRow, 10]].VerticalAlignment := xlCenter;
    //
    Inc(iRow);
    MyExcel.Cells[iRow, 3] := mmTitle2.Lines.Strings[1]+#13#10+mmTitle2.Lines.Strings[2];
    MyExcel.Cells[iRow, 3].Font.Bold := True;
    MyExcel.Cells[iRow, 7] := mmTitle2.Lines.Strings[3]+#13#10+mmTitle2.Lines.Strings[4];
    MyExcel.Cells[iRow, 7].Font.Bold := True;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 7], MyExcel.Cells.Item[iRow, 10]].MergeCells := True;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 7], MyExcel.Cells.Item[iRow, 10]].HorizontalAlignment := xlCenter;
    MyExcel.Range[MyExcel.Cells.Item[iRow, 7], MyExcel.Cells.Item[iRow, 10]].VerticalAlignment := xlCenter;
    MyExcel.ActiveSheet.PageSetup.LeftMargin        := 0.4/0.035;
    MyExcel.ActiveSheet.PageSetup.RightMargin       := 0.4/0.035;
    MyExcel.ActiveSheet.PageSetup.TopMargin         := 0.4/0.035;
    MyExcel.ActiveSheet.PageSetup.BottomMargin      := 0.4/0.035;
    MyExcel.ActiveSheet.PageSetup.HeaderMargin      := 0.4/0.035;
    MyExcel.ActiveSheet.PageSetup.FooterMargin      := 0.4/0.035;
    MyExcel.ActiveSheet.PageSetup.Orientation := xlLandscape;
    //
   // MyExcel.Cells.EntireColumn.AutoFit;
  finally
    MyExcel.Visible := True;
  end;
end;

//
function TFormHrd72.IsCanUpdate(AInsurMonth, AInsurClass, AEmpID: string;
  ADateB, ADateE: TDateTime): Boolean;
var
  sSQL: string;
begin
  sSQL := 'SELECT *'
        + '  FROM HRD_EMP_INSURANCE'
        + ' WHERE INSUR_MONTH = '+QuotedStr(AInsurMonth)
        + '   AND INSUR_CLASS = '+QuotedStr(AInsurClass)
        + '   AND EMP_ID = '+QuotedStr(AEmpID)
        + '   AND DATE_B = '+QuotedStr(FormatDateTime('YYYY/MM/DD', ADateB))
        + '   AND DATE_E = '+QuotedStr(FormatDateTime('YYYY/MM/DD', ADateE))
        //已發放
        + '   AND PRINT_DATE IS NOT NULL';
  with DMHrdsys.SQLQuery4 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    Result := not IsEmpty;
    Close;
  end;
end;

procedure TFormHrd72.dtpDate_BChange(Sender: TObject);
begin
  dtpDate_E.Date := dtpDate_b.DATE;
end;

procedure TFormHrd72.TntSpeedButton3Click(Sender: TObject);
begin
  iSelect := 3;
  //
  mcDate.Visible := not mcDate.Visible;
  //
  if mcDate.Visible then
  begin
    mcDate.Left := DBEditDate_Apply.Left + DBEditDate_Apply.Width - mcDate.Width;
    mcDate.Top  := DBEditDate_Apply.Top + DBEditDate_Apply.Height;
    //
    if (mcDate.Top + mcDate.Height)> gbVisible.Height then
      mcDate.Top := gbVisible.Height - mcDate.Height;
  end
end;

end.
