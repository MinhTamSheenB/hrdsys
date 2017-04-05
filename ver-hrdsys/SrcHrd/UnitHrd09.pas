unit UnitHrd09;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,tntDialogs, ExtCtrls,StrUtils, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, TntExtCtrls, TntDBGrids, TntDbCtrls, TntStdCtrls, TntButtons,
  DB, ADODB, DBClient, Provider,DateUtils,WSDLIntf, TntComCtrls, TntDB;

type
  Tformhrd09 = class(TForm)
    TntPanel1: TTntPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery2: TADOQuery;
    TntPanel2: TTntPanel;
    PanelAct: TTntPanel;
    sb_save: TTntSpeedButton;
    sb_undo: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_del: TTntSpeedButton;
    sb_Add: TTntSpeedButton;
    TntPanel4: TTntPanel;
    TntGroupBox3: TTntGroupBox;
    TntLabel1: TTntLabel;
    TntEdit2: TTntEdit;
    TntEdit1: TTntEdit;
    TntEdit3: TTntEdit;
    TntEdit4: TTntEdit;
    TntCheckBox1: TTntCheckBox;
    TntCheckBox2: TTntCheckBox;
    TntCheckBox3: TTntCheckBox;
    DEPT_S: TTntComboBox;
    DEPT_E: TTntComboBox;
    bbtn_search: TTntBitBtn;
    bbtn_reset: TTntBitBtn;
    PanelDetail: TTntPanel;
    TLB_IDEN: TTntLabel;
    TLB_POST: TTntLabel;
    TLB_WORKDATE: TTntLabel;
    TLB_LEAVEDATE: TTntLabel;
    TntDBEdit4: TTntEdit;
    TntDBEdit5: TTntEdit;
    TntDBEdit7: TTntEdit;
    TntDBEdit8: TTntEdit;
    TntDBGrid2: TTntDBGrid;
    PanelFlow: TTntPanel;
    TntLabel6: TTntLabel;
    sbtn_add: TTntSpeedButton;
    sbtn_finish: TTntSpeedButton;
    TntPanel6: TTntPanel;
    ImageClose: TImage;
    TntGroupBox5: TTntGroupBox;
    TntLabel4: TTntLabel;
    sbtn_emp: TTntSpeedButton;
    TntLabel5: TTntLabel;
    TntLabel8: TTntLabel;
    TLB_NO: TTntLabel;
    TLB_MONTH: TTntLabel;
    TLB_TYPE: TTntLabel;
    TLB_REMARK: TTntLabel;
    TEDT_ID: TTntDBEdit;
    name: TTntEdit;
    dept: TTntEdit;
    DBEDT_NO: TTntDBEdit;
    DBEDT_TYPE: TTntDBComboBox;
    DBEDT_MONTH: TTntDBEdit;
    DBEDT_REMARK: TTntDBEdit;
    NVG: TDBNavigator;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1insur_seq: TStringField;
    ADOQuery1picc_mon: TStringField;
    ADOQuery1insu_cod: TWideStringField;
    ADOQuery1notes: TWideStringField;
    ADOQuery1ins_type: TTntWideStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1department: TWideStringField;
    ME_MONTH: TMaskEdit;
    TntCheckBox4: TTntCheckBox;
    TntLabel2: TTntLabel;
    TntEdit5: TTntEdit;
    ME_MONTH1: TMaskEdit;
    TntLabel3: TTntLabel;
    name_vim: TTntEdit;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1pst_code: TWideStringField;
    ADOQuery1sal_base: TFloatField;
    Btn_Print: TTntBitBtn;
    ADOQuery1epindt: TDateTimeField;
    ADOQuery1info_code: TStringField;
    ADOQuery1epledt: TDateTimeField;
    ADOQuery1sal_base_1: TFloatField;
    procedure InitLangInfo;
    function GetPst(pstcode:string):widestring;

    procedure FormCreate(Sender: TObject);
    procedure TntDBGrid2TitleClick(Column: TColumn);
    procedure TntCheckBox2Click(Sender: TObject);
    procedure sb_FindEmpClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure TntPanel6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DEPT_EChange(Sender: TObject);
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
    procedure TEDT_IDChange(Sender: TObject);
    procedure EmptyAll;
    procedure sb_delClick(Sender: TObject);
    procedure sb_undoClick(Sender: TObject);
    procedure sb_saveClick(Sender: TObject);
    procedure sbtn_addClick(Sender: TObject);
    procedure DBEDT_MONTHChange(Sender: TObject);
    procedure NVGBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure Btn_PrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formhrd09: Tformhrd09;
  ws_Words:TWideStrings;
  SalBaseLvl:TStrings;
implementation

uses
  UnitDMHrdsys,UnitHrdUtils;
  
var
  prvArr:TPrvArr;
  IsAdd:Boolean;
{$R *.dfm}

function checkmonth(m_str:string):boolean;
var
  y,m :integer;
begin
   if m_str = '' then
   begin
     result := true;
     exit;
   end;
   try
     y := strtoint(leftstr(m_str,4));
     m := strtoint(rightstr(m_str,2));
     if (length(m_str)<6) or (y>strtoint(leftstr(datetostr(now),4))) then
       result := false
     else if (m<01) or (m>12) then
       result := false
     else
       result := true;
   except
     result := false;
   end;
end;

procedure TFormhrd09.EmptyAll;
begin
  //Adoquery1.Edit;
  //Adoquery1.FieldByName('emp_id').AsString :='';
  name.Text:='';
  dept.Text:='';
  TntDBedit4.Text :='';
  TntDBedit5.Text :='';
//  TntDBedit6.Text :='';
  TntDBedit7.Text :='';
  TntDBedit8.Text :='';
end;

procedure TFormhrd09.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  //定義要用到的語言
  ThisFormUsedWords:='hrd09_error1,hrd09_error2,hrd09_error3,hrd09_error4,'+
      'hrd09_error5,hrd09_error6';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);

  SetComponentLang(self);
end;
procedure Tformhrd09.FormCreate(Sender: TObject);
begin
  prvArr:=GetPrvArr(userName,'hrd09');
  SetActEnabled(false);
  
//取得部門代號
  dept_s.Clear;
  dept_e.Clear;
  SetComboxList('select dept_code+'' ''+abbr_titl from hrd_dept where '+G_sFactorySql,dept_s);
  SetComboxList('select dept_code+'' ''+abbr_titl from hrd_dept where '+G_sFactorySql,dept_e);
  dept_s.ItemIndex:=0;
  dept_e.ItemIndex:=dept_e.Items.Count-1;
  ME_MONTH.Text:='';//formatdatetime('yyyymm',GetServerDatetime);
  ME_MONTH1.Text:=formatdatetime('yyyymm',GetServerDatetime);
  with adoquery2 do
  begin
    sql.Clear;
    sql.Add('select * from hrd_ins_code');
    open;
    while not eof do
    begin
      DBEDT_TYPE.Items.Add(fieldbyname('insur_cod').AsString+' '+fieldbyname('scpt_chs').AsString);
      next;
    end;
    close;
  end;
  InitLangInfo;
  SalBaseLvl:=GetAllBaseLvl;
end;

procedure Tformhrd09.TntDBGrid2TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure Tformhrd09.TntCheckBox2Click(Sender: TObject);
begin
  if tntcheckbox1.Checked then
  begin
    tntedit1.Enabled := true;
    tntedit2.Enabled := true;
  end
  else
  begin
    tntedit1.Enabled := false;
    tntedit2.Enabled := false;
  end;
  if tntcheckbox2.Checked then
  begin
    tntedit3.Enabled := true;
    tntedit4.Enabled := true;
  end
  else
  begin
    tntedit3.Enabled := false;
    tntedit4.Enabled := false;
  end;
  if tntcheckbox3.Checked then
  begin
    dept_s.Enabled :=true;
    dept_e.Enabled :=true;
  end
  else
  begin
    dept_s.Enabled :=false;
    dept_e.Enabled :=false;
  end;
  if  tntcheckbox4.Checked then
    me_month.Enabled:=true
  else
    me_month.Enabled:=false;  
end;

procedure Tformhrd09.sb_FindEmpClick(Sender: TObject);
var
  AEmpId:string;
begin
   AEmpId := FindEmpId('emp_id') ;
   if AEmpId<>'' then
   begin
      if sender.ClassType=TtntEdit then
        TtntEdit(sender).Text:= AEmpid
      else
      begin
        TEDT_ID.text := AEmpid;
      end;  
   end;   
end;

procedure Tformhrd09.sb_AddClick(Sender: TObject);
begin
  IsAdd:=true;
  with adoquery1 do
  begin
    if not active then
    begin
      sql.Clear;
      sql.Add('select * from hrd_picc where 1<0');
      Open;
    end;
    Append;
  end;
  PanelFlow.Show;
  NVG.Hide;
  sbtn_add.Show;
  TntDBGrid2.Enabled :=false;
  PanelAct.Enabled :=false;
  TntGroupBox3.Enabled :=false;
  sbtn_emp.Show;
  TEDT_ID.ReadOnly := false;
  TEdT_ID.Color := clWindow;
end;

procedure Tformhrd09.TntPanel6MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);
end;

procedure Tformhrd09.DEPT_EChange(Sender: TObject);
begin
  if dept_s.ItemIndex>dept_e.ItemIndex then
    dept_e.ItemIndex := dept_s.ItemIndex;
end;

procedure Tformhrd09.bbtn_searchClick(Sender: TObject);
var
  SqlStr,SqlCond:WideString;
begin
  SqlStr := 'select * from hrd_picc where 1>0 ';
  //2012-09-07 hyt add
  SqlStr:=SqlStr+' and emp_id IN( select emp_id from hrd_emp where '+G_sFactorySql+') ';

  if TntCheckBox1.Checked then
  begin
    if TntEdit1.Text<>'' then
      SqlStr := SqlStr+' and insur_seq>='''+TntEdit1.Text+''' ';
    if TntEdit2.Text<>'' then
      SqlStr := SqlStr+' and insur_seq<='''+TntEdit2.Text+''' ';
  end;
  if TntCheckBox2.Checked then
  begin
    if TntEdit3.Text<>'' then
      SqlStr := SqlStr+' and emp_id>='''+TntEdit3.Text+''' ';
    if TntEdit4.Text<>'' then
      SqlStr := SqlStr+' and emp_id<='''+TntEdit4.Text+''' ';
  end;
  if TntCheckBox4.Checked then
  begin
    if ME_MONTH.Text<>'' then
    SqlStr := SqlStr+' and picc_mon>='''+ME_MONTH.Text+''' ';
    if ME_MONTH1.Text<>'' then
    SqlStr := SqlStr+' and picc_mon<='''+ME_MONTH1.Text+''' ';
  end;
  if TntCheckBox3.Checked then
  begin
    SqlCond:='';
    if (dept_s.Text<>'')  then
      SqlCond:=' dept_code>='''+leftstr(dept_s.text,6)+''' ';
    if (dept_e.Text<>'')  then
    begin
      if SqlCond='' then
        SqlCond:=' dept_code<='''+leftstr(dept_e.text,6)+''' '
      else
        SqlCond:=SqlCond+' and dept_code<='''+leftstr(dept_e.text,6)+''' '
    end;
    if SqlCond<>'' then
      SqlStr := SqlStr+' and emp_id in (select emp_id from hrd_emp where '+SqlCond+')';
  end;

  with Adoquery1 do
  begin
    Sql.Clear;
    Sql.Add(SqlStr);
    Open;
  end;
  TntCheckBox1.Enabled := false;
  TntCheckBox2.Enabled := false;
  TntCheckBox3.Enabled := false;
  TntCheckBox4.Enabled := false;
  TntEdit1.Enabled :=false;
  TntEdit2.Enabled :=false;
  TntEdit3.Enabled :=false;
  TntEdit4.Enabled :=false;
  ME_MONTH.Enabled:=false;
  dept_s.Enabled :=false;
  dept_e.Enabled:=false;
  bbtn_reset.Enabled := true;
  bbtn_search.Enabled := false;

end;

procedure TFormHrd09.SetActEnabled(Modify_Flag:boolean=true);
var
  status:boolean;
  IsEmpty:boolean;
begin
  status:=Adoquery1.Active;
  IsEmpty :=Adoquery1.eof;
  btn_print.Enabled:=PrvArr[PRT];
  sb_Add.Enabled:=PrvArr[ADD];
  sb_Del.Enabled:=status and PrvArr[DEL] and Not IsEmpty;
  sb_edit.Enabled:=status and PrvArr[UPD];
  sb_undo.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;

procedure Tformhrd09.bbtn_resetClick(Sender: TObject);
begin
  adoquery1.Close;
  TntCheckBox1.Checked := true;
  TntCheckBox2.Checked := true;
  TntCheckBox3.Checked := true;
  TntCheckBox4.Checked := true;
  TntCheckBox4.Enabled := true;
  TntCheckBox1.Enabled := true;
  TntCheckBox2.Enabled := true;
  TntCheckBox3.Enabled := true;
  TntEdit1.Enabled :=true;
  TntEdit2.Enabled :=true;
  TntEdit3.Enabled :=true;
  TntEdit4.Enabled :=true;
  ME_MONTH.Enabled:=true;
  dept_s.Enabled :=true;
  dept_e.Enabled:=true;
  bbtn_reset.Enabled := false;
  bbtn_search.Enabled := true;
end;

procedure Tformhrd09.sb_editClick(Sender: TObject);
begin
  IsAdd:=false;
  PanelFlow.Show;
  NVG.Show;
  sbtn_add.Hide;
  //TntDBGrid2.Enabled :=false;
  PanelAct.Enabled :=false;
  TntGroupBox3.Enabled :=false;
  sbtn_emp.Hide;
  TEDT_ID.ReadOnly := true;
  TEdT_ID.Color := clSkyBlue;
end;

procedure Tformhrd09.sbtn_finishClick(Sender: TObject);
var
  i:integer;
  flag :boolean;
begin
  if not checkmonth(DBEDT_MONTH.Text) then
  begin
    DBEDT_MONTH.Text:=adoquery1.FieldByName('picc_mon').AsString ;
    wideShowmessage(GetLangName(ws_words,'hrd09_error1'));
    exit;
  end;
  PanelFlow.Hide;
  PanelAct.Enabled := true;
  TntDBGrid2.Enabled := true;
  TntGroupBox3.Enabled := true;
  if Adoquery1.State in [dsEdit,dsInsert] then
  begin
    if Adoquery1.State = dsInsert then
    begin
      flag:=false;
      for i:=2 to 7 do
      begin
        if (i=3) or (i=4) or(i=5) then continue;
        if Adoquery1.Fields[i].AsString='' then
          flag:= true;
      end;
      if flag then
        Adoquery1.Cancel
      else
        Adoquery1.Post;
    end
    else
      Adoquery1.Post;
  end;
  IsAdd:=false;
  tntEdit5.Text:=inttostr(adoquery1.RecordCount);
end;

procedure Tformhrd09.sqlQuery1AfterClose(DataSet: TDataSet);
begin
  SetActEnabled(false);
  tntEdit5.Text:='0';
end;

procedure Tformhrd09.sqlQuery1AfterOpen(DataSet: TDataSet);
begin
  SetActEnabled(false);
  tntEdit5.Text:=inttostr(adoquery1.RecordCount);
end;

procedure Tformhrd09.sqlQuery1BeforePost(DataSet: TDataSet);
begin
  with Adoquery1 do
  begin
    FieldByName('upd_user').AsString:=UserName;
    FieldByName('upd_date').AsDateTime:=GetServerDatetime;
  end;
end;

procedure Tformhrd09.sqlQuery1WillChangeRecord(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer;
  var EventStatus: TEventStatus);
begin
  SetActEnabled(true);
end;

procedure Tformhrd09.ImageCloseClick(Sender: TObject);
begin
  if not checkmonth(DBEDT_MONTH.Text) then
  begin
    DBEDT_MONTH.Text:=adoquery1.FieldByName('picc_mon').AsString ;
    wideShowmessage(GetLangName(ws_words,'hrd09_error1'));
    exit;
  end;
  TntGroupbox3.Enabled := true;
  TntDBGrid2.Enabled := true;
  PanelAct.Enabled := true;
  PanelFlow.Hide;
  IsAdd:=false;
  tntEdit5.Text:=inttostr(adoquery1.RecordCount);
end;

procedure Tformhrd09.TEDT_IDChange(Sender: TObject);
var
  SqlStr:String;
  FieldEmp:Tfields;
begin
  EmptyAll;
  if length(TEdT_ID.Text)<>6 then
    exit;
  SqlStr:= 'select * from hrd_emp where emp_id='''+TEDT_ID.Text+''' ';
  with adoquery2 do
  begin
    if IsAdd then
    begin
      Sql.Clear;
      Sql.Add(SqlStr);
      Open;
      if eof then
      begin
        wideshowmessage(GetLangName(ws_words,'hrd09_error4'));
        Adoquery1.Edit;
        Adoquery1.FieldByName('emp_id').AsString :='';
        EmptyAll;
        exit;
      end;
      Close;
      SqlStr:='select * from hrd_picc where emp_id='''+TEDT_ID.Text+'''';
      Sql.Clear;
      SQl.Add(SqlStr);
      Open;
      if not eof then
      begin
        wideshowmessage(GetLangName(ws_words,'hrd09_error3'));
        {Adoquery1.Edit;
        Adoquery1.FieldByName('emp_id').AsString :='';
        EmptyAll; }
        exit;
      end;
    end;
    close;
  end;
  fieldEmp:=GetEmpInfo(TEDT_ID.Text);
  name.Text := fieldEmp.fieldbyname('emp_chs').value;
  dept.Text := fieldEmp.fieldbyname('abbr_titl').value;
  name_vim.Text:=fieldEmp.fieldbyname('name_vim').value;
  TntDBEdit4.Text := fieldEmp.fieldbyname('epid_no').AsString;
  with adoquery2 do
  begin
    sql.Clear;
    sql.Add('select * from hrd_prof where pst_code='''+fieldEmp.fieldbyname('pst_code').AsString+'''');
    open;
    TntDBEdit5.Text := fieldbyname('pst_code').AsString+' '+fieldbyname('pst_chs').AsString;
    Close;
  end;
 // TntDBEdit6.Text := fieldEmp.fieldbyname('dept_code').AsString+' '+fieldEmp.fieldbyname('abbr_titl').AsString;
  TntDBEdit7.Text := fieldEmp.fieldbyname('epindt').AsString;
  TntDBEdit8.Text := fieldEmp.fieldbyname('epledt').AsString;
end;

procedure Tformhrd09.sb_delClick(Sender: TObject);
begin
  if not adoquery1.Eof then
    adoquery1.Delete;
end;

procedure Tformhrd09.sb_undoClick(Sender: TObject);
begin
  adoquery1.CancelBatch(arAll);
  SetActEnabled(false);
end;

procedure Tformhrd09.sb_saveClick(Sender: TObject);
begin
  adoquery1.UpdateBatch(arAll);
  SetActEnabled(false);
  tntEdit5.Text:=inttostr(adoquery1.RecordCount);
end;

procedure Tformhrd09.sbtn_addClick(Sender: TObject);
var
  flag:boolean;
  i:integer;
begin
  if not checkmonth(DBEDT_MONTH.Text) then
  begin
    DBEDT_MONTH.Text:=adoquery1.FieldByName('picc_mon').AsString ;
    wideShowmessage(GetLangName(ws_words,'hrd09_error1'));
    exit;
  end;
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

procedure Tformhrd09.DBEDT_MONTHChange(Sender: TObject);
begin
  if length(DBEDT_MONTH.Text)<>6  then
    exit;
  if not checkmonth(DBEDT_MONTH.Text) then
  begin
    DBEDT_MONTH.Text:=adoquery1.FieldByName('picc_mon').AsString ;
    wideShowmessage(GetLangName(ws_words,'hrd09_error1'));
    exit;
  end;  
  {if DBEDT_MONTH.Text>formatdatetime('yyyymm',date) then
  begin
    DBEDT_MONTH.Text:=adoquery1.FieldByName('picc_mon').AsString ;
    wideShowmessage(GetLangName(ws_words,'hrd09_error6'));
  end;}
end;

procedure Tformhrd09.NVGBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if not checkmonth(DBEDT_MONTH.Text) then
  begin
    wideShowmessage(GetLangName(ws_words,'hrd09_error1'));
    exit;
  end;
end;

procedure Tformhrd09.ADOQuery1CalcFields(DataSet: TDataSet);
var
  flds:Tfields;
begin
  with DataSet do
  begin
    if FieldByName('emp_id').AsString='' then
      exit;
    flds:=GetEmpInfo(FieldByName('emp_id').AsString);
    if flds.fieldbyname('name_vim').AsString<>'' then
      FieldByName('name_vim').value:=flds.fieldbyname('name_vim').value;
    if flds.fieldbyname('emp_chs').AsString<>'' then
      FieldByName('emp_chs').value:=flds.fieldbyname('emp_chs').value;
    if flds.fieldbyname('abbr_titl').AsString<>'' then
      FieldByName('department').AsString:=flds.fieldbyname('dept_code').value+' '+widestring(flds.fieldbyname('abbr_titl').value)
    else begin
      if not flds.fieldbyname('dept_code').IsNull then
        FieldByName('department').AsString:=flds.fieldbyname('dept_code').value+' ';
    end;
    FieldByName('pst_code').value:=flds.Fieldbyname('pst_code').AsString+'-'+widestring(GetPst(flds.Fieldbyname('pst_code').AsString));
    FieldByName('epindt').AsDateTime:=flds.fieldbyname('epindt').AsDateTime;
    // Added by sanjin.lee 2014/10/29 下午 02:33:15
    FieldByName('epledt').Value := flds.fieldbyname('epledt').Value;

    FieldByName('info_code').AsString:=flds.fieldbyname('info_code').AsString;
    //
    {
    if me_month.Text  < '200801'  then
       FieldByName('sal_base').value:=GetNormalBase(flds.Fieldbyname('pst_code').AsString,
                            flds.Fieldbyname('edu_code').AsString,
                            flds.Fieldbyname('epindt').Asdatetime ,
                            SalBaseLvl)
    else

      FieldByName('sal_base').value:=GetNormalBase(flds.Fieldbyname('pst_code').AsString,
                           flds.Fieldbyname('edu_code').AsString,
                           flds.Fieldbyname('epindt').Asdatetime,
                            SalBaseLvl) + 92300  ;
    }
    FieldByName('sal_base').value:= GetBasepay(FieldByName('emp_id').AsString);
    if flds.fieldbyname('pst_code').AsString < '60' then
      FieldByName('sal_base_1').value:= FieldByName('sal_base').value + GetStdPay(FieldByName('emp_id').AsString)
    else
      FieldByName('sal_base_1').value:= FieldByName('sal_base').value;  
  end;
end;
function Tformhrd09.GetPst(pstcode:string):widestring;
begin
  with dmhrdsys.sqlquery1 do
  begin
    close;
    sql.clear;
    sql.add('select * from hrd_prof where pst_code='''+pstcode+''' ');
    open;
    if not eof then
      result:=fieldbyname('pst_chs').value
    else
      result:='';  
  end;
end;

procedure Tformhrd09.Btn_PrintClick(Sender: TObject);
begin
  showprint(adoquery1,'');
end;

end.
