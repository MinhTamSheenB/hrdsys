unit UnitHrd28;

interface

uses
  Windows,SqlExpr, ComCtrls, TntComCtrls, Classes, Controls, ExtCtrls, Messages, SysUtils, Variants, Graphics,  Forms,
  Dialogs, FMTBcd, DB, StdCtrls, Grids, DBGrids, TntDBGrids, TntStdCtrls,tntdialogs,
  DBCtrls,WSDLIntf,TntDBCtrls, Buttons, TntButtons,StrUtils, ADODB, TntExtCtrls,
  Mask,DateUtils, TntDB;

type
  TFormhrd28 = class(TForm)
    Panel1: TTntPanel;
    Panel2: TTntPanel;
    PanelMain: TTntPanel;
    TntGroupBox2: TTntGroupBox;
    rp_type: TTntCheckBox;
    date_range: TTntCheckBox;
    dept_code: TTntCheckBox;
    code_range: TTntCheckBox;
    edt_code_s: TTntEdit;
    edt_code_e: TTntEdit;
    cb_rp_s_code: TTntComboBox;
    cb_rp_e_code: TTntComboBox;
    cb_dept_s: TTntComboBox;
    cb_dept_e: TTntComboBox;
    edt_date_s: TTntDateTimePicker;
    edt_date_e: TTntDateTimePicker;
    Btn_Search: TTntBitBtn;
    Btn_Reset: TTntBitBtn;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    DBGridUPD: TTntDBGrid;
    PanelFlow: TTntPanel;
    TntLabel3: TTntLabel;
    sbtn_add: TTntSpeedButton;
    sbtn_finish: TTntSpeedButton;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    TntGroupBox5: TTntGroupBox;
    TntLabel1: TTntLabel;
    TntSpeedButton2: TTntSpeedButton;
    tntlabel4: TTntLabel;
    TntLabel7: TTntLabel;
    TntLabel9: TTntLabel;
    TntLabel8: TTntLabel;
    TntLabel10: TTntLabel;
    sbtn_emp: TTntSpeedButton;
    TntLabel11: TTntLabel;
    TntLabel12: TTntLabel;
    J_date_s: TTntDBEdit;
    prs_type: TTntDBComboBox;
    cheng_c: TTntDBEdit;
    prs_code: TTntDBComboBox;
    xingtai_v: TTntDBEdit;
    xingtai_c: TTntDBEdit;
    EDT_ID: TTntDBEdit;
    TntDBEdit1: TTntDBEdit;
    TntDBEdit2: TTntDBEdit;
    Nvg: TDBNavigator;
    mcd: TTntMonthCalendar;
    ADOQuery1: TADOQuery;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1p_p_date: TDateTimeField;
    ADOQuery1p_p_type: TStringField;
    ADOQuery1prs_code: TStringField;
    ADOQuery1chs_remark: TWideStringField;
    ADOQuery1vim_remark: TWideStringField;
    ADOQuery1emp_chs: TTntWideStringField;
    DataSource2: TDataSource;
    qry_rp_type: TADOQuery;
    qry_reason: TADOQuery;
    qry_pub: TADOQuery;
    ADOQuery1J_date_e: TDateTimeField;
    ADOQuery1name_vim: TTntWideStringField;
    ADOQuery1xingtzi_type: TTntStringField;
    ADOQuery1xing_v: TTntWideStringField;
    ADOQuery1dept_code: TTntStringField;
    ADOQuery1dept_titl: TTntWideStringField;
    ADOQuery1vim_titl: TTntWideStringField;
    J_date_e: TTntDBEdit;
    TntSpeedButton1: TTntSpeedButton;
    TntLabel2: TTntLabel;
    TntDBEdit4: TTntDBEdit;
    TntDBEdit5: TTntDBEdit;
    TntLabel13: TTntLabel;
    cheng_v: TTntDBEdit;
    sb_Preview: TTntSpeedButton;
    sb_Print: TTntSpeedButton;
    PrintDialog1: TPrintDialog;
    chs: TTntRadioButton;
    viet: TTntRadioButton;
    ADOQuery1pst_chs: TTntWideStringField;
    ADOQuery1pst_vim: TTntWideStringField;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    procedure sb_AddClick(Sender: TObject);
    procedure sbtn_finishClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
      procedure InitInqPage(Sender: TObject);
     procedure InitLangInfo;
    procedure prs_codeChange(Sender: TObject);
    procedure prs_typeChange(Sender: TObject);
    procedure TntSpeedButton2Click(Sender: TObject);
    procedure mcdDblClick(Sender: TObject);
    procedure TntSpeedButton1Click(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure rp_typeClick(Sender: TObject);
    procedure Btn_ResetClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_PreviewClick(Sender: TObject);
//     procedure SetActEnabled(Modify_Flag:boolean=true);
    procedure PrintTip(PrintFlag:boolean;sClass:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formhrd28: TFormhrd28;

implementation
 Uses
    unitdmhrdsys,unithrdutils, UnitHrd28Prt, UnitHrd28PrtA;
var
   prv:TPrvArr;
   ws_Words:TWideStrings;
   IsAdd:Boolean;
   flag :string ;
{$R *.dfm}

procedure TFormhrd28.sb_AddClick(Sender: TObject);
begin
  // IsAdd:=true;
  EDT_ID.ReadOnly := false;
  EDT_ID.Color := clWindow;
  sbtn_emp.Show;
 // EdT_COST.Text:='';
  with adoquery1 do
  begin
    if not Active then
    begin
      sql.Clear;
      sql.Add('select * from hrd_emp_jueding  where 1<0');
      Open;
    end;
    append;
  end;
  PanelFlow.Show;
  PanelMain.Enabled:=false;
  SBtn_add.Show;
  Nvg.Hide;
end;

procedure TFormhrd28.sbtn_finishClick(Sender: TObject);
var
  i:integer;
  flag,flag2 :boolean;
begin
  if adoquery1.State in [dsEdit,dsInsert] then
  begin
      if (  EDT_ID.Text <> '' ) and  ( J_date_s.Text<> '' ) and ( J_date_e.text <> '' ) and ( prs_code.text<> '' ) and ( prs_type.Text <> '' ) then
      begin

    //  if sender.ClassType=TtntSpeedButton then
      //  adoquery1.Post;

        PanelMain.Enabled := true;
        PanelFlow.Hide;
        PanelAct.Enabled := true;
        DBGridUPD.Enabled := true;
        TntGroupBox2.Enabled := true;
        sb_save.Enabled := true;
        exit;
    //  end;
   end
 else
   begin
     showmessage( '輸入不完整' ) ;
     adoquery1.Cancel;
   end;
  end;
  PanelMain.Enabled := true;
        PanelFlow.Hide;
        PanelAct.Enabled := true;
        DBGridUPD.Enabled := true;
        TntGroupBox2.Enabled := true; 
end;


procedure TFormhrd28.ADOQuery1CalcFields(DataSet: TDataSet);
var
  FldEmp:Tfields;
  pstcode :string ;
begin
  if length(adoquery1.FieldByName('emp_id').AsString)<>6 then
    exit;
  FldEmp:= GetEmpInfo(adoquery1.FieldByName('emp_id').Value);
  adoquery1.FieldByName('emp_chs').Value:=FldEmp.fieldbyname('emp_chs').Value;
   adoquery1.FieldByName('name_vim').Value:=FldEmp.fieldbyname('name_vim').Value;
  adoquery1.FieldByName('dept_titl').Value:=FldEmp.fieldbyname('dept_code').Value+' '+FldEmp.fieldbyname('abbr_titl').Value;
  adoquery1.FieldByName('vim_titl').Value:=FldEmp.fieldbyname('dept_code').Value+' '+FldEmp.fieldbyname('vim_titl').Value;
  pstcode := FldEmp.fieldbyname('pst_code').Value;
   with qry_pub do
  begin
    sql.Clear;
    sql.Add('select * from hrd_prof  where pst_code='''+pstcode+'''');
    Open;
   // adoquery1.Edit;
    adoquery1.FieldByName('pst_chs').Value  :=fieldbyname('pst_chs').Value ;
    adoquery1.FieldByName('pst_vim').Value  :=fieldbyname('pst_vim').Value ;

    Close;
  end;

  if   adoquery1.fieldbyname('chengdu_type').Value > '' then
      begin

  with qry_pub do
  begin
    sql.Clear;
    sql.Add('select * from hrd_emp_chengdu_cate  where cheng_type='''+adoquery1.fieldbyname('chengdu_type').Value+'''');
    Open;
   // adoquery1.Edit;
    adoquery1.FieldByName('cheng_c').Value  :=fieldbyname('cheng_c').Value ;
    adoquery1.FieldByName('cheng_v').Value  :=fieldbyname('cheng_v').Value ;

    Close;
  end;
  end;
  if   adoquery1.fieldbyname('xingtai_type').Value > '' then
      begin
       with qry_pub do
         begin
           sql.Clear;
           sql.Add('select * from hrd_emp_xingtai_cate  where xingtai_type='''+adoquery1.fieldbyname('xingtai_type').Value+'''');
           Open;
    //adoquery1.Edit;
           adoquery1.FieldByName('xingtai_c').Value  :=fieldbyname('xingtai_c').Value ;
           adoquery1.FieldByName('xingtai_v').Value  :=fieldbyname('xingtai_v').Value ;
           Close;
         end;
      end;
end;

procedure TFormhrd28.FormCreate(Sender: TObject);
begin
  //取得權限數組
  prv:=GetPrvArr(username,'hrd28');
  InitInqPage(Sender);
  InitLangInfo;
end;
procedure TFormhrd28.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  //默認為中文
 //if UserLang='C' then exit;
 ThisFormUsedWords:='upd_success,add_success,hrd10_error1,hrd10_warning1,search_fail,'+
     'hrd09_error4,hrd10_error7,hrd10_error8,msg_del_alert';
 ws_Words:=GetLangWideStrs(ThisFormUsedWords);

 SetComponentLang(self);
end;

//初始化查詢頁面
procedure TFormhrd28.InitInqPage(Sender: TObject);
begin
 // edt_date_s.date:=EncodeDate(yearof(date),1,1);
  //edt_date_e.date:=date;
  //取得獎懲類別
 // SetComboxList('select prs_type+''-''+script_cht from hrd_prs_type order by prs_type',cb_rp_s_code);
  SetComboxList('select xingtai_type from hrd_emp_xingtai_cate order by xingtai_type',cb_rp_e_code);
  cb_rp_s_code.ItemIndex:=0;
  cb_rp_e_code.ItemIndex:=cb_rp_e_code.Items.Count-1;

  prs_type.Items:=cb_rp_e_code.Items;
  with qry_reason do
  begin
    if not active then
      Open;
    first;
    while not eof do
    begin
      prs_code.Items.Add(fieldbyname('cheng_type').Value);
      next;
    end;
  end;


//取得部門代號
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept',cb_dept_s);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept',cb_dept_e);
  cb_dept_s.ItemIndex:=0;
  cb_dept_e.ItemIndex:=cb_dept_e.Items.Count-1;

 // SetActEnabled(false);
end;
procedure TFormhrd28.prs_codeChange(Sender: TObject);
begin
  with qry_pub do
  begin
    sql.Clear;
    sql.Add('select * from hrd_emp_chengdu_cate  where cheng_type='''+leftstr(prs_code.Text,4)+'''');
    Open;
   // adoquery1.Edit;
   // adoquery1.FieldByName('cheng_c').Value  :=fieldbyname('cheng_c').Value ;
   // adoquery1.FieldByName('cheng_v').Value  :=fieldbyname('cheng_v').Value ;

    cheng_c.Text := fieldbyname('cheng_c').Value ;
    cheng_v.Text := fieldbyname('cheng_v').Value ;
    Close;
  end;
 // chs_remark.SetFocus;
end;

procedure TFormhrd28.prs_typeChange(Sender: TObject);
begin
    with qry_pub do
  begin
    sql.Clear;
    sql.Add('select * from hrd_emp_xingtai_cate  where xingtai_type='''+leftstr(prs_type.Text,5)+'''');
    Open;
    xingtai_c.Text := fieldbyname('xingtai_c').Value ;
    xingtai_v.Text := fieldbyname('xingtai_v').Value ;
    Close;
  end;
  //chs_remark.SetFocus;
end;

procedure TFormhrd28.TntSpeedButton2Click(Sender: TObject);
begin
   flag := '1' ;
   mcd.Show;
  PanelFlow.Enabled :=false;
end;

procedure TFormhrd28.mcdDblClick(Sender: TObject);
begin
   adoquery1.Edit;
   if flag = '1' then
      adoquery1.FieldByName('J_date_s').AsDateTime := mcd.Date;
   if flag ='2' then
       adoquery1.FieldByName('J_date_e').AsDateTime := mcd.Date;
  //p_p_date.Text := DateToStr(mcd.Date);
  mcd.Hide;
  panelFlow.Enabled :=true;
  flag := '0' ;
end;

procedure TFormhrd28.TntSpeedButton1Click(Sender: TObject);
begin
   flag :='2' ;
   mcd.Show;
  PanelFlow.Enabled :=false;
end;


procedure TFormhrd28.sb_SaveClick(Sender: TObject);
begin
 adoquery1.UpdateBatch(arAll);
  //SetActEnabled(false);
  showmessage( 'Save Ok !!!!' ) ;
  sb_save.Enabled := false ;
end;

procedure TFormhrd28.sb_editClick(Sender: TObject);
begin
  IsAdd:=false;
  EDT_ID.ReadOnly := true;
  EDT_ID.Color := clSkyBlue;
  sbtn_emp.Hide;
  PanelMain.Enabled := true;
  TntGroupBox2.Enabled := false;
  DBGridUPD.Enabled := true;
  PanelAct.Enabled := false;
  PanelFlow.Show;
  SBtn_add.Hide;
  Nvg.Show;
  sb_save.Enabled :=true ;
end;

procedure TFormhrd28.Btn_SearchClick(Sender: TObject);
var
  SqlStr:WideString;
begin
  SqlStr:='select * from hrd_emp_jueding where 1>0';
 // if rp_type.Checked then
  //  SqlStr:=SqlStr+' and p_p_type>='''+leftstr(cb_rp_s_code.text,1)+''' and p_p_type<='''+leftstr(cb_rp_e_code.text,1)+''' ';
  if date_range.Checked then
    SqlStr:=SqlStr+' and J_date_s>='''+DateToStr(edt_date_s.Date)+''' and J_date_s<='''+DateToStr(edt_date_e.Date)+''' ';
  if code_range.Checked then
    SqlStr:=SqlStr+' and emp_id>='''+edt_code_s.Text+''' and emp_id<='''+edt_code_e.Text+''' ';
  if dept_code.Checked then
    SqlStr:=SqlStr+' and emp_id in(select emp_id from hrd_emp where dept_code>='''+leftstr(cb_dept_s.text,6)+''' and dept_code<='''+leftstr(cb_dept_e.text,6)+''') ';
 
  with adoquery1 do
  begin
    sql.Clear;
    sql.Add(SqlStr);
    Open;
  end;
  rp_type.Enabled := false;
  date_range.Enabled :=false;
  code_range.Enabled :=false;
  dept_code.Enabled :=false;

  cb_rp_s_code.Enabled :=false;
  cb_rp_e_code.Enabled :=false;
  edt_date_s.Enabled :=false;
  edt_date_e.Enabled :=false;
  edt_code_s.Enabled :=false;
  edt_code_e.Enabled :=false;
  cb_dept_s.Enabled :=false;
  cb_dept_e.Enabled:=false;

  btn_search.Enabled :=false;
  btn_reset.Enabled :=true;
  sb_Del.Enabled := true ;
  sb_edit.Enabled := true ;
  sb_Recover.Enabled := true ;
end;
procedure TFormhrd28.rp_typeClick(Sender: TObject);
begin
   if rp_type.Checked then
  begin
    cb_rp_s_code.Enabled:=true;
    cb_rp_e_code.Enabled:=true;
  end
  else
  begin
    cb_rp_s_code.Enabled:=false;
    cb_rp_e_code.Enabled:=false;
  end;
  if date_range.Checked then
  begin
    edt_date_s.Enabled:=true;
    edt_date_e.Enabled:=true;
  end
  else
  begin
    edt_date_s.Enabled:=false;
    edt_date_e.Enabled:=false;
  end;
  if code_range.Checked then
  begin
    edt_code_s.Enabled:=true;
    edt_code_e.Enabled:=true;
  end
  else
  begin
    edt_code_s.Enabled:=false;
    edt_code_e.Enabled:=false;
  end;
  if dept_code.Checked then
  begin
    cb_dept_s.Enabled:=true;
    cb_dept_e.Enabled:=true;
  end
  else
  begin
    cb_dept_s.Enabled:=false;
    cb_dept_e.Enabled:=false;
  end;
end;

procedure TFormhrd28.Btn_ResetClick(Sender: TObject);
begin
  adoquery1.Close;
  rp_type.Enabled := true;
  date_range.Enabled :=true;
  code_range.Enabled :=true;
  dept_code.Enabled :=true;
  rp_type.Checked := false;
  date_range.Checked :=false;
  code_range.Checked :=false;
  dept_code.Checked :=false;
  btn_search.Enabled :=true;
  btn_reset.Enabled :=false;
end;

procedure TFormhrd28.sb_DelClick(Sender: TObject);
begin
     if not adoquery1.Eof then
    adoquery1.Delete;
    sb_save.Enabled := true ;
end;
{procedure TFormHrd28.SetActEnabled(Modify_Flag:boolean=true);
var
  status:boolean;
  IsEmpty:boolean;
begin
  status:=adoquery1.Active;
  IsEmpty :=adoquery1.eof;
  sb_Add.Enabled:=Prv[ADD];
  sb_Del.Enabled:=status and Prv[DEL] and Not IsEmpty;
  sb_edit.Enabled:=status and Prv[UPD];
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;   }
procedure TFormhrd28.sb_RecoverClick(Sender: TObject);
begin
    adoquery1.CancelBatch(arAll);
 // SetActEnabled(false);
end;

procedure TFormhrd28.sb_PreviewClick(Sender: TObject);
//打印內容設置
begin
  //打印(預覽)
  if TtntButton(Sender).Name='sb_Print' then
  begin
    if PrintDialog1.Execute then
    PrintTip(true,'1');
  end
  else
    PrintTip(false,'1');
end;
 procedure TFormhrd28.PrintTip(PrintFlag:boolean;sClass:string);
begin
  with ADOQuery1 do
  begin
    first;
    if EOF then
    begin
      WideMessageDlg(GetLangName(ws_Words,'not_find_data'),mtConfirmation,[mbok],0);
      exit;
    end;
     while not EOF do
    begin
      if PrintFlag then
        SetStatusText(GetLangName(ws_Words,'while_printing')+GetLangName(ws_Words,'fld_emp_id')+FieldByName('emp_id').AsString);
      if chs.Checked = true then
      begin  //鞋廠
         with FormHrd28Prt.QuickRep1 do
         begin
          
           if PrintFlag then
              Print
           else if ADOQuery1.RecNo=1 then
                begin
                 // if ADOQuery1.RecordCount>1 then
                  //  WideMessageDlg(GetLangName(ws_Words,'print_muti_page_pre'),mtConfirmation,[mbok],0);
                  Preview;
                  exit;
                end;
          end;
      end
      else
      begin  //化工
          with FormHrd28PrtA.QuickRep1 do
          begin
            if PrintFlag then
              Print
            else if ADOQuery1.RecNo=1 then
                begin
                //  if ADOQuery1.RecordCount>1 then
                 //   WideMessageDlg(GetLangName(ws_Words,'print_muti_page_pre'),mtConfirmation,[mbok],0);
                  Preview;
                  exit;
                end;
          end;
      end;
       next;
    end;
  end;
  if PrintFlag then
    SetStatusText(GetLangName(ws_Words,'print_finish'));
end;
end.
