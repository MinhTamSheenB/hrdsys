unit UnitSal13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, TntDBGrids, Buttons, TntButtons, StdCtrls,
  TntStdCtrls, ComCtrls, TntComCtrls, ExtCtrls, TntExtCtrls, DB, ADODB,
  WSDLIntf, TntDialogs, Mask, DBCtrls, TntDbCtrls ,StrUtils;

type
  TFormSal13 = class(TForm)
    Panel1: TTntPanel;
    PanelTitle: TTntPanel;
    TntPageControl1: TTntPageControl;
    TabSheeInq: TTntTabSheet;
    TabSheetUpd: TTntTabSheet;
    TabSheetAdd: TTntTabSheet;
    PanelNote: TTntPanel;
    LabelInqDept: TTntLabel;
    EditInputInq01: TTntEdit;
    TntLabel1: TTntLabel;
    EditInputInq02: TTntEdit;
    ButtonInqOk: TTntSpeedButton;
    PanelInqBottom: TTntPanel;
    ButtonInqPrint: TTntSpeedButton;
    PanelUpdTop: TTntPanel;
    TntPanel2: TTntPanel;
    DBGridUpdData: TTntDBGrid;
    LabelUpdDept: TTntLabel;
    EditInputUpd01: TTntEdit;
    TntLabel2: TTntLabel;
    EditInputUpd02: TTntEdit;
    TntSpeedButton1: TTntSpeedButton;
    ButtonQuickFind2: TTntSpeedButton;
    EditFindCar2: TTntEdit;
    LabelUpd: TTntLabel;
    EditFindcar1: TTntEdit;
    ButtonQuickFind1: TTntSpeedButton;
    LabelInq: TTntLabel;
    DBGridAddData: TTntDBGrid;
    TntPanel1: TTntPanel;
    TntSpeedButton3: TTntSpeedButton;
    TntSpeedButton5: TTntSpeedButton;
    DataSourceUpd: TDataSource;
    LabelInqcode: TTntLabel;
    EditInputInq03: TTntEdit;
    EditInputInq04: TTntEdit;
    TntLabel4: TTntLabel;
    LabelUpdcode: TTntLabel;
    EditInputUpd03: TTntEdit;
    TntLabel5: TTntLabel;
    EditInputUpd04: TTntEdit;
    ADOQueryGrad: TADOQuery;
    ADODataSetInq: TADODataSet;
    ADODataSetUpd: TADODataSet;
    DataSourceInq: TDataSource;
    ADODataSetInqpart_code: TStringField;
    ADODataSetInqpart_grad: TStringField;
    ADODataSetInqpart_dept: TStringField;
    ADODataSetInqpart_chs: TWideStringField;
    ADODataSetInqpart_vim: TWideStringField;
    ADODataSetInqpart_eng: TWideStringField;
    DBGridInqData: TTntDBGrid;
    ButtonRefresh: TTntSpeedButton;
    PanelAdd: TTntPanel;
    LabelCode: TTntLabel;
    LabelGrad: TTntLabel;
    LabelDept: TTntLabel;
    LabelCname: TTntLabel;
    LabelVname: TTntLabel;
    LabelEname: TTntLabel;
    ButtonDelete: TTntSpeedButton;
    ADOQueryGradgrad_code: TStringField;
    ADOQueryGradgrad_money: TBCDField;
    DataSource1: TDataSource;
    EditCode: TTntEdit;
    DBLookupComboBox1: TTntComboBox;
    EditDept: TTntEdit;
    EditCname: TTntEdit;
    EditVname: TTntEdit;
    EditEname: TTntEdit;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    add: TTntButton;
    DataSource2: TDataSource;
    ADODataSetAdd: TADODataSet;
    ADODataSetAddupd_user: TStringField;
    ADODataSetAddupd_date: TDateTimeField;
    ADODataSetAddpart_code: TStringField;
    ADODataSetAddpart_grad: TStringField;
    ADODataSetAddpart_dept: TStringField;
    ADODataSetAddpart_chs: TWideStringField;
    ADODataSetAddpart_vim: TWideStringField;
    ADODataSetAddpart_eng: TWideStringField;
    ADODataSetAddgrad: TStringField;
    procedure InitSal13Lang;
    procedure FormSal13Init;
    procedure FormCreate(Sender: TObject);
    procedure TntPageControl1Change(Sender: TObject);
    procedure ButtonInqOkClick(Sender: TObject);
    procedure EditFindcar1Change(Sender: TObject);
    procedure TntSpeedButton1Click(Sender: TObject);
    procedure TntSpeedButton5Click(Sender: TObject);
    procedure ButtonSaverecnoClick(Sender: TObject);
    procedure TntSpeedButton3Click(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
    procedure DBGridUpdDataTitleClick(Column: TColumn);
    procedure DBGridInqDataTitleClick(Column: TColumn);
    procedure EditFindCar2Change(Sender: TObject);
    procedure ADODataSetAddAfterScroll(DataSet: TDataSet);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure EditInputUpd02Exit(Sender: TObject);
    procedure EditInputUpd04Exit(Sender: TObject);
    procedure EditDeptExit(Sender: TObject);
    procedure EditCodeExit(Sender: TObject);
    procedure EditInputInq02Exit(Sender: TObject);
    procedure EditInputInq04Exit(Sender: TObject);
    procedure ADODataSetAddBeforePost(DataSet: TDataSet);
    procedure ButtonInqPrintClick(Sender: TObject);
    procedure addClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal13: TFormSal13;
  sal13_Words:TWideStrings;
  InqSDept ,  InqEDept ,  InqSPart ,  InqEPart :String ;
  UpdSDept ,  UpdEDept ,  UpdSPart ,  UpdEPart :String ;

implementation
uses
  UnitDMHrdsys,UnitHrdUtils;
 {$R *.dfm}

{初始化語言信息}
procedure TFormSal13.InitSal13Lang;
var
  FormSal13Words  :String ;
  i:integer;
begin
  //定義要用到的語言
  with ADODataSetAdd do
  for i:=0 to Fieldcount-1 do
      FormSal13Words := FormSal13Words+'fld_'+Fields[i].FieldName+',';

  FormSal13Words := FormSal13Words+'sal13title,part_dept,part_code,part_code_null,part_grad_null,part_dept_null,'+
    'part_data,fast_find,not_find_data,add ,ok ,query,update ,save,refresh,print,sal13save_error,sal13save_true,'+
    'input_dept_error,input_grad_error,input_dept';
  sal13_words:=GetLangWideStrs(FormSal13Words);
  PanelTitle.Caption:=GetLangName(sal13_Words,'sal13title');
  //inq
  TabSheeInq.Caption:=GetLangName(sal13_Words,'query');
  LabelInqDept.Caption:=GetLangName(sal13_Words,'part_dept')+':';
  LabelInqCode.Caption:=GetLangName(sal13_Words,'part_code')+':';
  ButtonInqOk.Caption:=GetLangName(sal13_Words,'ok');
  ButtonQuickFind1.Caption:=GetLangName(sal13_Words,'fast_find');
  LabelInq.Caption:=GetLangName(sal13_Words,'part_code');
  ButtonRefresh.Caption :=GetLangName(sal13_Words,'refresh');
  ButtonInqPrint.Caption:=GetLangName(sal13_Words,'print');
  DBGridInqData.Columns[0].Title.Caption :=GetLangName(sal13_Words,'fld_part_code');
  DBGridInqData.Columns[1].Title.Caption :=GetLangName(sal13_Words,'fld_part_grad');
  DBGridInqData.Columns[2].Title.Caption :=GetLangName(sal13_Words,'fld_part_dept');
  DBGridInqData.Columns[3].Title.Caption :=GetLangName(sal13_Words,'fld_part_chs');
  DBGridInqData.Columns[4].Title.Caption :=GetLangName(sal13_Words,'fld_part_vim');
  DBGridInqData.Columns[5].Title.Caption :=GetLangName(sal13_Words,'fld_part_eng');
  //upd
  TabSheetUpd.Caption:=GetLangName(sal13_Words,'update');
  LabelUpdDept.Caption:=GetLangName(sal13_Words,'part_dept')+':';
  LabelUpdCode.Caption:=GetLangName(sal13_Words,'part_code')+':';
  ButtonQuickFind2.Caption:=GetLangName(sal13_Words,'fast_find');
  LabelUpd.Caption:=GetLangName(sal13_Words,'part_code');
  TntSpeedButton5.Caption:=GetLangName(sal13_Words,'save');
  DBGridUpdData.Columns[0].Title.Caption :=GetLangName(sal13_Words,'fld_part_code');
  DBGridUpdData.Columns[1].Title.Caption :=GetLangName(sal13_Words,'fld_part_grad');
  DBGridUpdData.Columns[2].Title.Caption :=GetLangName(sal13_Words,'fld_part_dept');
  DBGridUpdData.Columns[3].Title.Caption :=GetLangName(sal13_Words,'fld_part_chs');
  DBGridUpdData.Columns[4].Title.Caption :=GetLangName(sal13_Words,'fld_part_vim');
  DBGridUpdData.Columns[5].Title.Caption :=GetLangName(sal13_Words,'fld_part_eng');
  //add
  TabSheetAdd.Caption:=GetLangName(sal13_Words,'add');
  TntSpeedButton3.Caption:=GetLangName(sal13_Words,'save');
  LabelCode.Caption :=GetLangName(sal13_Words,'fld_part_code');
  LabelGrad.Caption :=GetLangName(sal13_Words,'fld_part_grad');
  LabelDept.Caption :=GetLangName(sal13_Words,'fld_part_dept');
//  LabelOpator.Caption :=GetLangName(sal13_Words,'fld_upd_user');
  LabelCname.Caption :=GetLangName(sal13_Words,'fld_part_chs');
  LabelVname.Caption :=GetLangName(sal13_Words,'fld_part_vim');
  LabelEname.Caption :=GetLangName(sal13_Words,'fld_part_eng');
 // LabelTime.Caption :=GetLangName(sal13_Words,'fld_upd_date');
  DBGridAddData.Columns[0].Title.Caption :=GetLangName(sal13_Words,'fld_upd_user');
  DBGridAddData.Columns[1].Title.Caption :=GetLangName(sal13_Words,'fld_upd_date');
  DBGridAddData.Columns[2].Title.Caption :=GetLangName(sal13_Words,'fld_part_code');
  DBGridAddData.Columns[3].Title.Caption :=GetLangName(sal13_Words,'fld_part_grad');
  DBGridAddData.Columns[4].Title.Caption :=GetLangName(sal13_Words,'fld_part_dept');
  DBGridAddData.Columns[5].Title.Caption :=GetLangName(sal13_Words,'fld_part_chs');
  DBGridAddData.Columns[6].Title.Caption :=GetLangName(sal13_Words,'fld_part_vim');
  DBGridAddData.Columns[7].Title.Caption :=GetLangName(sal13_Words,'fld_part_eng');
end;

{  初始化,取用戶對該畫面擁有的權限}
procedure TFormSal13.FormSal13Init ;
const
  FORM_ID='sal13';
var
  PrvArr:TPrvArr;
begin

  //初始化,取用戶對該畫面擁有的權限
  PrvArr:=GetPrvArr(UserName,FORM_ID);
  if not PrvArr[INQ] then
     TabSheeInq.TabVisible:=false;
  if not PrvArr[UPD] then
     TabSheetUpd.TabVisible:=false;
//  if not PrvArr[ADD] then
 //    TabSheetAdd.TabVisible:=false;

   EditInputInq01.Text :=G_sFactory+'0';
   EditInputInq02.Text :=G_sFactory+'Z';
   EditInputUpd01.Text :=G_sFactory+'0';
   EditInputUpd02.Text :=G_sFactory+'Z';
end;

procedure TFormSal13.FormCreate(Sender: TObject);
begin
  InitSal13Lang ;
  FormSal13Init ;
  ADOQuery2.SQL.Clear ;
  ADOQuery2.SQL.Add('SELECT *FROM  hrd_WRKPART where part_dept like '''+G_sFactory+'%'' ') ;
  adoQuery2.Open ;
end;

procedure TFormSal13.TntPageControl1Change(Sender: TObject);
begin
if TntPageControl1.ActivePageIndex =0 then
   EditInputInq01.SetFocus
else if TntPageControl1.ActivePageIndex =1 then
   EditInputUpd01.SetFocus
else if TntPageControl1.ActivePageIndex =2 then
   begin
   DBGridAddData.SetFocus ;
  // ADODataSetAdd.Active := true ;
  // ADODataSetAdd.Append ;
   end;
end;

procedure TFormSal13.ButtonInqOkClick(Sender: TObject);
begin
  if EditInputInq01.Text='' then
     InqSDept :='0 '
  else
     InqSDept :=EditInputInq01.Text ;

  if EditInputInq02.Text='' then
     InqEDept :='ZZ'
  else
     InqEDept :=EditInputInq02.Text ;

  if EditInputInq03.Text='' then
     InqSPart :='0  '
  else
     InqSPart :=EditInputInq03.Text ;

  if EditInputInq04.Text='' then
     InqEPart :='ZZZ'
  else
     InqEPart :=EditInputInq04.Text ;

  ADODataSetInq.Active :=false ;
  ADODataSetInq.CommandText :='';
  ADODataSetInq.CommandText :='SELECT part_code, part_grad, part_dept,part_chs,part_vim,part_eng FROM  hrd_wrkpart '+
                              'WHERE part_dept like '''+G_sFactory+'%'' and (part_dept >='''+InqSDept+''' AND part_dept <='''+InqEDept+''') AND (part_code >='''+InqSPart+''' AND part_code <='''+InqEPart+''')' ;
  ADODataSetInq.Open ;
  if ADODataSetInq.Eof then
     begin
      SetStatusText(GetLangName(sal13_Words,'not_find_data'));
      WideShowMessage(GetLangName(sal13_Words,'not_find_data'));
      DBGridInqData.Enabled:=false;
     end
  else
    begin
      DBGridInqData.Enabled:=true;
    end;
end;

procedure TFormSal13.EditFindcar1Change(Sender: TObject);
begin
with ADODataSetInq do
  begin
     Filtered :=false ;
     if TTntEdit(Sender).Text <>'' then
        Filter:='part_code like '''+TTntEdit(Sender).Text+'*'+''''
     else
        Filter:=''   ;

     Filtered :=true ;
  end;
end;

procedure TFormSal13.TntSpeedButton1Click(Sender: TObject);
begin
  if EditInputUPd01.Text='' then
     UpdSDept :='0 '
  else
     UpdSDept :=EditInputUPd01.Text ;

  if EditInputUPd02.Text='' then
     UpdEDept :='ZZ'
  else
     UpdEDept :=EditInputUPd02.Text ;

  if EditInputUPd03.Text='' then
     UpdSPart :='0  '
  else
     UpdSPart :=EditInputUPd03.Text ;

  if EditInputUPd04.Text='' then
     UpdEPart :='ZZZ'
  else
     UpdEPart :=EditInputUPd04.Text ;

  ADODataSetUpd.Active :=false ;
  ADODataSetUpd.CommandText := '' ;
  ADODataSetUpd.CommandText :='SELECT part_code, part_grad, part_dept,part_chs,part_vim,part_eng FROM hrd_wrkpart '+
                              'WHERE part_dept like '''+G_sFactory+'%'' and (part_dept >='''+UpdSDept+''' AND part_dept <='''+UpdEDept+''') AND (part_code >='''+UpdSPart+''' AND part_code <='''+UpdEPart+''')' ;
  ADODataSetUpd.Open ;
  if ADODataSetUpd.Eof then
     begin
      SetStatusText(GetLangName(sal13_Words,'not_find_data'));
      WideShowMessage(GetLangName(sal13_Words,'not_find_data'));
      DBGridUpdData.Enabled:=false;
     end
  else
    begin
      DBGridUpdData.Enabled:=true;
    end;
end;

procedure TFormSal13.TntSpeedButton5Click(Sender: TObject);
begin
     try
        ADODataSetUpd.UpdateBatch;
        WideShowMessage(GetLangName(sal13_Words,'sal13save_true'));
     except
        WideShowMessage(GetLangName(sal13_Words,'sal13save_error'));
     end;
end;

procedure TFormSal13.ButtonSaverecnoClick(Sender: TObject);
var
  nlrecno : integer;
begin
  with ADODataSetUpd do
       for nlrecno:=2 to Fieldcount-1 do
       begin
          if Fields[nlrecno].OldValue <>Fields[nlrecno].Value then
             Fields[nlrecno].Value :=Fields[nlrecno].OldValue ;
       end;
end;

procedure TFormSal13.TntSpeedButton3Click(Sender: TObject);
begin
  try
  // ADODataSetAdd.Post;
  // ADODataSetAdd.UpdateBatch ;
   adoQuery2.UpdateBatch;
   WideShowMessage(GetLangName(sal13_Words,'sal13save_true'));
  except
   WideShowMessage(GetLangName(sal13_Words,'sal13save_error'));
  end;

end;

procedure TFormSal13.ButtonRefreshClick(Sender: TObject);
begin

  if EditInputUPd01.Text='' then
     UpdSDept :='0 '
  else
     UpdSDept :=EditInputUPd01.Text ;

  if EditInputUPd02.Text='' then
     UpdEDept :='ZZ'
  else
     UpdEDept :=EditInputUPd02.Text ;

  if EditInputUPd03.Text='' then
     UpdSPart :='0  '
  else
     UpdSPart :=EditInputUPd03.Text ;

  if EditInputUPd04.Text='' then
     UpdEPart :='ZZZ'
  else
     UpdEPart :=EditInputUPd04.Text ;

  ADODataSetInq.Active :=false ;
  ADODataSetInq.CommandText :='' ;
  ADODataSetInq.CommandText :='SELECT part_code, part_grad, part_dept,part_chs,part_vim,part_eng FROM  hrd_wrkpart WHERE (part_dept >='''+InqSDept+''' AND part_dept <='''+InqEDept+''') AND (part_code >='''+InqSPart+''' AND part_code <='''+InqEPart+''')' ;
  ADODataSetInq.Open ;
end;

procedure TFormSal13.DBGridUpdDataTitleClick(Column: TColumn);
begin
 if not ADODataSetUpd.Active then exit ;
     if ADODataSetUpd.Sort=Column.FieldName then
        ADODataSetUpd.Sort:=ADODataSetUpd.Sort+'DESC'
     else
        ADODataSetUpd.Sort:=Column.FieldName ;
end;

procedure TFormSal13.DBGridInqDataTitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);
end;

procedure TFormSal13.EditFindCar2Change(Sender: TObject);
begin
  with ADODataSetUpd do
  begin
     Filtered :=false ;
     if TTntEdit(Sender).Text <>'' then
        Filter:='part_code like '''+TTntEdit(Sender).Text+'*'+''''
     else
        Filter:=''   ;

     Filtered :=true ;
  end;

end;

procedure TFormSal13.ADODataSetAddAfterScroll(DataSet: TDataSet);
begin
  //if ADODataSetAdd.FieldByName('upd_user').Value = NULL then
  //  begin
  //  ADODataSetAdd.FieldByName('upd_user').Value  :=username ;
  //  ADODataSetAdd.FieldByName('upd_date').Value  :=GetServerDateTime ;
  //  end  ;
end;

procedure TFormSal13.ButtonDeleteClick(Sender: TObject);
begin
ADODataSetUpd.Delete ;
WideShowMessage(GetLangName(sal13_Words,'sal13save_true'));
end;

procedure TFormSal13.EditInputUpd02Exit(Sender: TObject);
begin
  if EditInputUpd02.Text <EditInputUpd01.Text then
     begin
      WideShowMessage(GetLangName(sal13_Words,'input_dept_error'));
      end;
end;

procedure TFormSal13.EditInputUpd04Exit(Sender: TObject);
begin
    if EditInputUpd04.Text < EditInputUpd03.Text then
     begin
      WideShowMessage(GetLangName(sal13_Words,'input_grad_error'));
      //EditInputUpd04.SetFocus ;
     end;
end;

procedure TFormSal13.EditDeptExit(Sender: TObject);
begin
   if EditDept.Text ='' then
      begin
      WideShowMessage(GetLangName(sal13_Words,'part_dept_null'));
      end;
end;

procedure TFormSal13.EditCodeExit(Sender: TObject);
begin
if EditCode.Text = '' then
   WideShowMessage(GetLangName(sal13_Words,'part_code_null')) ;
 //   charupper(   pchar(EditCode.Text) ) ;
end;

procedure TFormSal13.EditInputInq02Exit(Sender: TObject);
begin
  if EditInputInq02.Text <EditInputInq01.Text then
     begin
      WideShowMessage(GetLangName(sal13_Words,'input_dept_error'));
      end;

end;

procedure TFormSal13.EditInputInq04Exit(Sender: TObject);
begin
   if EditInputInq04.Text < EditInputInq03.Text then
     begin
      WideShowMessage(GetLangName(sal13_Words,'input_grad_error'));
      //EditInputUpd04.SetFocus ;
     end;
end;

procedure TFormSal13.ADODataSetAddBeforePost(DataSet: TDataSet);
begin
//   if ADODataSetAdd.FieldByName('part_code').Value='' then
//         begin
 //  ABORT;
 //     end;
end;

procedure TFormSal13.ButtonInqPrintClick(Sender: TObject);
begin
  ShowPrint(ADODataSetInq,'工種印表');
end;

procedure TFormSal13.addClick(Sender: TObject);
begin
   //***<<<2012-12-13 hyt add
   if G_sFactory<>leftStr(editdept.Text,1) then
   begin
      Showmessage('Department is Wrong ');
      exit ;
   end;
   //***>>>

   adoQuery2.Append;
   adoQuery2.FieldByName('upD_user').AsString :=username;
  // adoQuery2.FieldByName('upD_date').AsString :=date;
   adoQuery2.FieldByName('part_code').AsString :=EditCode.Text ;
   adoQuery2.FieldByName('part_grad').AsString :=DBLookupComboBox1.Text  ;
   adoQuery2.FieldByName('part_dept').AsString :=editdept.Text  ;
   adoQuery2.FieldByName('part_chs').Value  :=editcname.Text  ;
   adoQuery2.FieldByName('part_vim').Value  :=editvname.Text  ;
   adoQuery2.FieldByName('part_eng').Value  :=editename.Text  ;
   adoQuery2.Post ;



end;

end.
