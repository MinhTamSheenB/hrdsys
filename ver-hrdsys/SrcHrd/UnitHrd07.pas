unit UnitHrd07;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, TntExtCtrls, TntDBGrids, TntDbCtrls, TntStdCtrls, TntButtons,
  DB, ADODB, DBClient, Provider,DateUtils,WSDLIntf,TntDialogs, TntComCtrls;
const
  FORM_ID='hrd07';
type
  TFormhrd07 = class(TForm)
    PanelMain: TPanel;
    TntDBGrid1: TTntDBGrid;
    TntPanel1: TTntPanel;
    TntPanel3: TTntPanel;
    Panel2: TPanel;
    TntLabel12: TTntLabel;
    TntLabel13: TTntLabel;
    TntEdit2: TTntEdit;
    TntLabel14: TTntLabel;
    TntEdit3: TTntEdit;
    sb_InqOk: TTntSpeedButton;
    TntDBGrid2: TTntDBGrid;
    sb_close2: TTntSpeedButton;
    ADOStoredProc1: TADOStoredProc;
    TntPanel4: TTntPanel;
    DataSource1: TDataSource;
    ADOStoredProc1dept_code: TStringField;
    ADOStoredProc1dept_titl: TWideStringField;
    ADOStoredProc1abbr_titl: TWideStringField;
    ADOStoredProc1vim_titl: TWideStringField;
    ADOStoredProc1vim_abbr: TWideStringField;
    ADOStoredProc1eng_titl: TWideStringField;
    ADOStoredProc1eng_abbr: TWideStringField;
    ADOStoredProc1org_num: TIntegerField;
    ADOStoredProc1act_num: TIntegerField;
    ADOStoredProc1factory: TStringField;
    ADOStoredProc1dept_cls: TStringField;
    TntPanel2: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_Close: TTntSpeedButton;
    TntLabel16: TTntLabel;
    TntEdit5: TTntEdit;
    TntLabel17: TTntLabel;
    TntEdit6: TTntEdit;
    TntEdit4: TTntEdit;
    TntLabel15: TTntLabel;
    TntBitBtn1: TTntBitBtn;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    TntPanel5: TTntPanel;
    TntBitBtn2: TTntBitBtn;
    ADOQuery1dept_code: TStringField;
    ADOQuery1dept_titl: TWideStringField;
    ADOQuery1abbr_titl: TWideStringField;
    ADOQuery1vim_titl: TWideStringField;
    ADOQuery1vim_abbr: TWideStringField;
    ADOQuery1eng_titl: TWideStringField;
    ADOQuery1eng_abbr: TWideStringField;
    ADOQuery1org_num: TIntegerField;
    ADOQuery1act_num: TIntegerField;
    ADOQuery1factory: TStringField;
    ADOQuery1dept_cls: TStringField;
    ADOQuery2: TADOQuery;
    ADOQuery1updator: TStringField;
    ADOQuery1update_time: TDateTimeField;
    PageControl1: TTntPageControl;
    TabSheet1: TTntTabSheet;
    TabSheet2: TTntTabSheet;
    MaskEdit1: TMaskEdit;
    TntBitBtn3: TTntBitBtn;
    sb_edit: TTntSpeedButton;
    PanelFlow: TTntPanel;
    TntLabel18: TTntLabel;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    bbtn_ok: TTntBitBtn;
    TntGroupBox5: TTntGroupBox;
    Label_DeptCode: TTntLabel;
    Label_Factory: TTntLabel;
    Label_DeptCls: TTntLabel;
    Label_OrgNum: TTntLabel;
    Label_DeptName: TTntLabel;
    Label_DeptAbbr: TTntLabel;
    Label_ActNum: TTntLabel;
    Label_EngTitl: TTntLabel;
    Label_VimTitl: TTntLabel;
    TntDBEdit1: TTntDBEdit;
    TntDBEdit2: TTntDBEdit;
    TntDBEdit4: TTntDBEdit;
    TntDBEdit5: TTntDBEdit;
    TntDBEdit8: TTntDBEdit;
    TntDBEdit10: TTntDBEdit;
    TntDBEdit3: TTntDBEdit;
    TntDBEdit7: TTntDBEdit;
    TntDBEdit6: TTntDBEdit;
    DBNavigator2: TDBNavigator;
    bbtn_add: TTntBitBtn;
    ADOQuery1is_del: TStringField;
    procedure TntEdit4Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sb_InqOkClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure FormInit;
    procedure InitLangInfo;
    procedure TntBitBtn1Click(Sender: TObject);
    procedure ADOQuery1AfterEdit(DataSet: TDataSet);
    procedure EnableDel;
    procedure EnableRecover;
    procedure EnableSave;
    //procedure ADOQuery1dept_codeChange(Sender: TField);
    procedure sb_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1BeforeDelete(DataSet: TDataSet);
    procedure ADOQuery1dept_codeSetText(Sender: TField;
      const Text: String);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure TntDBGrid2TitleClick(Column: TColumn);
    procedure TntBitBtn3Click(Sender: TObject);
    procedure ChangeFlowFlds;
    procedure sb_editClick(Sender: TObject);
    procedure PanelFlowTitleMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure bbtn_addClick(Sender: TObject);
    procedure bbtn_okClick(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure TntDBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Formhrd07: TFormhrd07;
  PrvAdd,PrvDel,PrvUpd:boolean;
  ws_Words:TWideStrings;
implementation
uses
  UnitDMHrdsys,UnitHrdUtils;

{$R *.dfm}
{��l�ƻy���H��}
procedure TFormhrd07.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  SetComponentLang(self);//set component language text
  //�w�q�n�Ψ쪺�y��
  ThisFormUsedWords:='hrd07_titl,hrd07_error1,hrd07_error2,hrd07_error3,hrd07_error4,hrd07_confirm1,'+
    'fld_dept_code,month,dept_print,msg_del_alert';
  ws_Words:=GetLangWideStrs(ThisFormUsedWords);
end;
{�ֳt�d��,�L�o�\��}
procedure TFormhrd07.TntEdit4Change(Sender: TObject);
begin
  With ADOQuery1 do
  begin
    Filtered:=false;
    if TTntEdit(Sender).Text<>'' then
      Filter:='dept_code like '''+TTntEdit(Sender).Text+'*'+''''
    else
      Filter:='';
    Filtered:=true;
  end;
end;

procedure TFormhrd07.FormCreate(Sender: TObject);
begin
  //��l�ƻy���H��
  InitLangInfo;
  //��l��
  FormInit;
end;

{  ��l�ƨ��  }
procedure TFormhrd07.FormInit;
var
  PrvArr:TPrvArr;
begin

  //��l��,���Τ��ӵe���֦����v��
  PrvArr:=GetPrvArr(UserName,FORM_ID);
  //�s�W�v��
  PrvAdd:=PrvArr[ADD];
  //�R���v��
  PrvDel:=PrvArr[DEL];
  //�ק��v��
  PrvUpd:=PrvArr[UPD];
  if not PrvArr[INQ] then
    TabSheet1.TabVisible:=false;
  if (not PrvArr[UPD]) and (not PrvArr[ADD]) and (not PrvArr[DEL]) then
    TabSheet2.TabVisible:=false;
  //���@ ��l��
  ADOQuery1.Close;
  sb_Recover.Enabled:=false;
  sb_Save.Enabled:=false;
  tntEdit4.Text:='';
  //�s�W�v�����s
  if not PrvAdd then sb_Add.Enabled:=false;
  //�R���v�����s
  sb_Del.Enabled:=false;
  //�d�߳���
  ADOStoredProc1.Close;
  MaskEdit1.Text:=IntToStr(YearOf(date))+Format('%.2d',[MonthOf(date)]);
end;

//
procedure TFormhrd07.sb_InqOkClick(Sender: TObject);
begin
  with ADOStoredProc1 do
  begin
    Close;
    Parameters.ParamValues['@dept_begin']:=TntEdit2.Text;
    Parameters.ParamValues['@dept_end']:=TntEdit3.Text;
    Parameters.ParamValues['@year_month']:=MaskEdit1.Text;
    try
      Open;
      if not Eof then
      begin
        TntBitBtn2.Enabled:=true;
        TntBitBtn3.Enabled:=true;
      end
      else begin
        TntBitBtn2.Enabled:=false;
        TntBitBtn3.Enabled:=false;
      end;
    except
      WideShowMessage(GetLangName(ws_Words,'hrd07_error1'));
      //ShowMessage('�z��J���d�߱��󦳻~,�Ю֬d!');
    end;
  end;
end;

procedure TFormhrd07.sb_AddClick(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    if Active=false then//�p�G�S�����}�ƾڶ��A �h���s���}
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM hrd_dept WHERE 2=1 ');
      Open;
    end;
    Append;
  end;
  ChangeFlowFlds;
  DBNavigator2.Hide;
  bbtn_add.Show;
  PanelFlow.Visible:=true;
  PageControl1.Enabled:=false;
end;

procedure TFormhrd07.sb_DelClick(Sender: TObject);
begin
  if wideMessageDlg(GetLangName(ws_words,'msg_del_alert'),mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    //ADOQuery1.Delete;
    ADOQuery1.Edit;
    ADOQuery1.FieldByName('is_del').AsString:='1';
    EnableDel;
  end;  
end;

procedure TFormhrd07.sb_RecoverClick(Sender: TObject);
begin
  ADOQuery1.CancelUpdates;
  EnableDel;
  sb_Recover.Enabled:=false;
  sb_Save.Enabled:=false;
  if (ADOQuery1.RecordCount>0) and (PrvUpd) then
    sb_Edit.Enabled:=true
  else
    sb_Edit.Enabled:=false;
end;

procedure TFormhrd07.sb_SaveClick(Sender: TObject);
begin
  if WideMessageDlg(GetLangName(ws_Words,'hrd07_confirm1'),mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    try
      ADOQuery1.UpdateBatch;
      sb_Recover.Enabled:=false;
      sb_Save.Enabled:=false;
      if (ADOQuery1.RecordCount>0) and (PrvUpd) then
        sb_Edit.Enabled:=true
      else
        sb_Edit.Enabled:=false;
    except
      WideShowMessage(GetLangName(ws_Words,'hrd07_error2'));
      sb_Recover.Enabled:=true;
      sb_Save.Enabled:=true;
    end;
  end;
end;


{�d����s�ƥ�}
procedure TFormhrd07.TntBitBtn1Click(Sender: TObject);
begin
  With ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_dept WHERE dept_code>='''+TntEdit5.Text+''' AND dept_code<='''+TntEdit6.Text+''' and is_del<>''1''');
    Open;
  end;
  if (ADOQuery1.RecordCount>0) and (PrvUpd) then
    sb_Edit.Enabled:=true
  else
    sb_Edit.Enabled:=false;
  EnableDel;
  sb_Recover.Enabled:=false;
  sb_Save.Enabled:=false;
end;

procedure TFormhrd07.ADOQuery1AfterEdit(DataSet: TDataSet);
begin
  EnableDel;
  if (ADOQuery1.RecordCount>0) and PrvUpd then
    sb_Edit.Enabled:=true
  else
    sb_Edit.Enabled:=false;
  sb_Recover.Enabled:=true;
  sb_Save.Enabled:=true;
end;
{�m�R�����s����}
procedure TFormhrd07.EnableDel;
begin
  if (ADOQuery1.RecordCount>0) and PrvDel then
    sb_Del.Enabled:=true
  else
    sb_Del.Enabled:=false;
end;
{�m��_���s����}
procedure TFormhrd07.EnableRecover;
begin
  sb_Recover.Enabled:=true;
end;
{�m�O�s���s����}
procedure TFormhrd07.EnableSave;
begin
  sb_Save.Enabled:=true;
end;
//�����t��
procedure TFormhrd07.sb_CloseClick(Sender: TObject);
begin
  TForm(PanelMain.Parent).Close;
end;

procedure TFormhrd07.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OnCreate(TForm(PanelMain.Parent));
end;

procedure TFormhrd07.ADOQuery1BeforePost(DataSet: TDataSet);
var
  sql_str,dept_code:string;
  ServerDateTime:TDateTime;
  act_num:integer;
begin
  ServerDateTime:=GetServerDateTime;
  dept_code:=ADOQuery1.FieldByName('dept_code').AsString;
  if Length(dept_code)<>6 then
  begin
    WideShowMessage(GetLangName(ws_Words,'hrd07_error3'));
    //ShowMessage('��J���~!,�����N������6��!');
    abort;
  end;
  //�έp��ڤH��
  sql_str:='select count(*) as qty from hrd_emp where epledt is not null'
    +' and dept_code=''' +dept_code+'''';
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
    act_num:=FieldByName('qty').AsInteger;
  end;
  with ADOQuery1 do
  begin
    FieldByName('act_num').AsInteger:=act_num;
    FieldByName('updator').AsString:=UserName;
    FieldByName('update_time').AsDateTime:=ServerDateTime;
  end;
end;

procedure TFormhrd07.ADOQuery1BeforeDelete(DataSet: TDataSet);
begin
  ADOQuery1.Edit;
  ADOQuery1.FieldByName('updator').AsString:=UserName;
end;

procedure TFormhrd07.ADOQuery1dept_codeSetText(Sender: TField;
  const Text: String);
begin
  if Length(Text)<>6 then
  begin
    WideShowMessage(GetLangName(ws_Words,'hrd07_error3'));
    //ShowMessage('��J���~!,�����N������6��!');
    abort;
  end
  else
  begin
    //�P�_�����N���O�_���_
    With ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Append('select * from hrd_dept where dept_code='''+Text+'''');
      Open;
      if not Eof then
      begin
        WideShowMessage(GetLangName(ws_Words,'hrd07_error4'));
        //ShowMessage('���~!�������N���w�g�s�b!');
        abort;
      end;
    end;
    Sender.AsString:=Text;
  end;
end;
{�I�����Y�A�����Y���Ƨ�}
procedure TFormhrd07.TntDBGrid1TitleClick(Column: TColumn);
begin
  if not ADOQuery1.Active  then exit;
  if ADOQuery1.Sort=Column.FieldName then
    ADOQuery1.Sort:=ADOQuery1.Sort+' DESC'
  else
    ADOQuery1.Sort:=Column.FieldName;
end;
{�I�����Y�A�����Y���Ƨ�}
procedure TFormhrd07.TntDBGrid2TitleClick(Column: TColumn);
begin
  if not ADOStoredProc1.Active then exit;
  if ADOStoredProc1.Sort=Column.FieldName then
    ADOStoredProc1.Sort:=Column.FieldName+' DESC'
  else
    ADOStoredProc1.Sort:=Column.FieldName;
end;

procedure TFormhrd07.TntBitBtn3Click(Sender: TObject);
begin
  showPrint(ADOStoredProc1,GetLangName(ws_Words,'dept_print')+'<br><left>'+
    GetLangName(ws_Words,'month')+':'+MaskEdit1.Text+'  '+
    GetLangName(ws_Words,'fld_dept_code')+':'+TntEdit2.Text+' �X�X'+TntEdit3.Text);
end;

procedure TFormHrd07.ChangeFlowFlds;
//���B�ʵ��f���Y�������q�{��
begin
  PanelFlow.Height:=391;
  PanelFlow.Width:=341;
  PanelFlow.Top:=10;
  PanelFlow.Left:=208;
  with ADOQuery1 do
    begin
      if State=dsInsert then//�u���O�_�i�s��
        begin
          TntDBEdit1.ReadOnly:=false;
          TntDBEdit1.Color:=clWhite;
          TntDBEdit4.Color:=clWhite;
          TntDBEdit4.ReadOnly:=false;
        end
      else
        begin
          TntDBEdit1.ReadOnly:=true;
          TntDBEdit1.Color:=clBtnface;
          //�S���v���ק�s��H��
          if HaveSpcPrv(UserName,FORM_ID) then
          begin
            TntDBEdit4.ReadOnly:=false;
            TntDBEdit4.Color:=clWhite;
          end
          else begin
            TntDBEdit4.ReadOnly:=true;
            TntDBEdit4.Color:=clBtnface;
           end;
        end;
    end;
end;
procedure TFormhrd07.sb_editClick(Sender: TObject);
begin
  ADOQuery1.Edit;
  ChangeFlowFlds;
  DBNavigator2.Show;
  bbtn_add.Hide;
  PanelFlow.Visible:=true;
  PageControl1.Enabled:=false;
end;

procedure TFormhrd07.PanelFlowTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PanelFlow.Perform(WM_SysCommand,$F012,0);
end;

procedure TFormhrd07.bbtn_addClick(Sender: TObject);
begin
  ADOQuery1.Append;
  ChangeFlowFlds;
  TntDBEdit1.SetFocus;
end;

procedure TFormhrd07.bbtn_okClick(Sender: TObject);
begin
  if ADOQuery1.State in [dsedit,dsinsert] then
    ADOQuery1.post;
  ImageClose.OnClick(Sender);
end;

procedure TFormhrd07.ImageCloseClick(Sender: TObject);
begin
  PanelFlow.Visible:=false;
  PageControl1.Enabled:=true;
end;

procedure TFormhrd07.TntDBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then// key_enter
    self.FindNextControl(TwinControl(Sender),true,true,false).SetFocus;
  if (Sender.ClassType = TtntcomboBox) or (Sender.ClassType =TTntDatetimePicker) then
    exit;//while key up and down on comboBox or DatetimePicker,not continue;
  if (key=40) then//key_down
    self.FindNextControl(TwinControl(Sender),true,true,false).SetFocus;
  if (key=38) and (TwinControl(Sender).TabOrder>0) then//key_up
    self.FindNextControl(TwinControl(Sender),false,true,false).SetFocus;
end;

end.
