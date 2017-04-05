unit UnitHrd20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ADODB, DB, Grids, DBGrids,strutils,
  ComCtrls, TntComCtrls, TntDialogs, Buttons,WSDLIntf, TntExtCtrls,
  TntStdCtrls, DBCtrls, Mask, TntDbCtrls, TntButtons, TntDBGrids,
  TntDB, ComObj, ExcelXP;


type
  TFormHrd20 = class(TForm)
    Panel3: TPanel;
    StatusBar1: TTntStatusBar;
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel6: TTntLabel;
    TntLabel10: TTntLabel;
    edit_begin: TTntEdit;
    edit_end: TTntEdit;
    Btn_Search: TTntBitBtn;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    PanelAct: TTntPanel;
    sb_Add: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_edit: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_Print: TTntSpeedButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1department: TWideStringField;
    ADOQuery1emp_cate: TTntStringField;
    ADOQuery2: TADOQuery;
    ADOQuery1date_s: TDateTimeField;
    ADOQuery1date_e: TDateTimeField;
    TntLabel3: TTntLabel;
    cate: TTntComboBox;
    chk_date_s: TTntCheckBox;
    dtpBegin: TTntDateTimePicker;
    dtpEnd: TTntDateTimePicker;
    PanelFlow: TTntPanel;
    TntPanel2: TTntPanel;
    Image1: TImage;
    TntGroupBox2: TTntGroupBox;
    TntLabel4: TTntLabel;
    TntLabel7: TTntLabel;
    TntLabel9: TTntLabel;
    TntLabel11: TTntLabel;
    TntLabel12: TTntLabel;
    TntLabel13: TTntLabel;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    EditFlow0: TTntDBEdit;
    TntDBEdit1: TTntDBEdit;
    TntDBEdit2: TTntDBEdit;
    TntDBEdit4: TTntDBEdit;
    Date_0: TTntDBEdit;
    TntButton1: TTntButton;
    emp_cate: TTntDBRadioGroup;
    Date_1: TTntDBEdit;
    TntButton2: TTntButton;
    Panel7: TPanel;
    s_add: TTntBitBtn;
    TntBitBtn2: TTntBitBtn;
    hrd20_date_1: TTntLabel;
    hrd20_date_2: TTntLabel;
    hrd20_date_3: TTntLabel;
    hrd20_date_4: TTntLabel;
    hrd20_date_5: TTntLabel;
    hrd20_date_6: TTntLabel;
    hrd20_date_7: TTntLabel;
    Date_2: TTntDBEdit;
    Date_3: TTntDBEdit;
    Date_4: TTntDBEdit;
    Date_5: TTntDBEdit;
    Date_6: TTntDBEdit;
    Date_7: TTntDBEdit;
    Date_8: TTntDBEdit;
    TntButton3: TTntButton;
    TntButton4: TTntButton;
    TntButton5: TTntButton;
    TntButton6: TTntButton;
    BtnDate_6: TTntButton;
    BtnDate_7: TTntButton;
    ADOQuery1date_1: TDateTimeField;
    ADOQuery1date_2: TDateTimeField;
    ADOQuery1date_3: TDateTimeField;
    ADOQuery1date_4: TDateTimeField;
    ADOQuery1date_5: TDateTimeField;
    ADOQuery1date_6: TDateTimeField;
    ADOQuery1date_7: TDateTimeField;
    month1: TTntMonthCalendar;
    btnExcel: TTntSpeedButton;
    ADOQuery1remarks: TWideStringField;
    TntLabel5: TTntLabel;
    TntDBEdit3: TTntDBEdit;
    ADOQuery1num_1: TStringField;
    ADOQuery1num_2: TStringField;
    ADOQuery1num_3: TStringField;
   
    procedure InitForm;
    procedure InitLang;
    procedure SetActEnabled(modify_Flag:boolean=true);

    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure bbtn_addClick(Sender: TObject);
    procedure bbtn_okClick(Sender: TObject);
    procedure sb_PrintClick(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_editClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure ChangeFlowFlds;
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ImageCloseClick(Sender: TObject);
    procedure TntButton1Click(Sender: TObject);
    procedure Month1DblClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure emp_cateChange(Sender: TObject);
    procedure edit_beginChange(Sender: TObject);
  
  private
    //2013.08.16 LX
    procedure SetPos(Sender: TObject);
    //是否可保存 2013.08.16 LX
    function IsCanPost: Boolean;
    // Added by Adidas 2013/8/16 下午 02:15:18 LX
    procedure ExportDataToExcel;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd20: TFormHrd20;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  pri_arr:TPrvArr;//權限數組
  Langstr,LangC,LangE,LangV :TWideStrings;//語言字符串
  flag: Integer;
{$R *.dfm}


procedure TFormHrd20.DBGrid1TitleClick(Column: TColumn);
var
  sort_key:string;
begin
  if column.Grid.DataSource.DataSet.ClassName='TClientDataset' then
    exit;
  with TADODataset(column.Grid.DataSource.DataSet) do
  begin
    if not active then
      exit;
    if column.fieldname='' then//空欄位時退出
      exit;
    if FieldByName(column.fieldname).FieldKind=fklookup then//lookup欄位
      sort_key:=FieldByName(column.fieldname).KeyFields
    else if FieldByName(column.fieldname).FieldKind=fkdata then
      sort_key:=Column.FieldName
    else  //未知欄位則退出
      exit;
    if Sort=sort_key then
      Sort:=sort_key + ' DESC'
    else
      Sort:=sort_key;
  end;
end;

procedure TFormHrd20.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'hrd20');//Get privilege
  SetComponentLang(self);//set component language text
  InitForm;// Init Form
  SetActEnabled(false);//Set act button weather enabled
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql,CobDeptBegin);
  SetComboxList('select dept_code+''-''+abbr_titl from hrd_dept where '+G_sFactorySql,CobDeptEnd);
  dtpBegin.Date:=GetServerDatetime;//DateOf(GetServerDatetime);//encodedate(YearOf(GetServerDatetime),1,1);
  dtpEnd.Date:=GetServerDatetime;// DateOf(GetServerDatetime);
end;

procedure TFormHrd20.InitForm;
var
  lcFrom_FileName,lcTo_FileName:string;
begin
 // date_s.Date:=date;
//  date_e.Date:=date-1;

end;

procedure TFormHrd20.Btn_SearchClick(Sender: TObject);
//查詢數據
var
  sql_str,where_str:string;
begin
//  sql_str:='select * from hrd_lanu A,hrd_emp B where A.emp_id=B.emp_id ';
  sql_str:='select * from hrd_emp_chan A where 1=1 ';

  sql_str:=sql_str+' and emp_id in (select emp_id from hrd_emp where 1=1';
  //2012-09-07 hyt add
  sql_str:=sql_str+' and '+G_sFactorySql+' ';

  if trim(edit_begin.text)<>'' then
    where_str:=where_str+' and emp_id>=''' +trim(edit_begin.text)+'''';
  if trim(edit_end.text)<>'' then
    where_str:=where_str+' and emp_id<=''' +trim(edit_end.text)+'''';
  if CobDeptBegin.Text<>'' then
    where_str:=where_str+' and dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if CobDeptEnd.Text<>'' then
    where_str:=where_str+' and dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  if copy( cate.Text,1,1)  ='1' then
     where_str:=where_str+' and emp_cate ='''+copy( cate.Text,1,1 ) +'''';
   if copy( cate.Text,1,1)  ='2' then
     where_str:=where_str+' and emp_cate ='''+copy( cate.Text,1,1 ) +'''';
   if chk_date_s.Checked then
     where_str:=where_str+' and date_s >='''+formatdatetime('yyyy/mm/dd',dtpBegin.Date)+''' '+
                          ' and date_s <='''+formatdatetime('yyyy/mm/dd',dtpEnd.Date)+''' ';


 sql_str:=sql_str+where_str+')';

  with Adoquery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  
  if Adoquery1.Eof then
  begin
    SetStatusText(GetLangName(LangStr,'not_find_data'));
    DBGrid1.Enabled:=false;
  end
  else
  begin
    DBGrid1.Enabled:=true;
    sb_edit.Enabled := true;
    sb_del.Enabled := true;
    sb_save.Enabled := true;
    sb_print.Enabled := true ;
    btnExcel.Enabled:= True;
    StatusBar1.SimpleText := ' Total : ' + inttostr( adoQuery1.RecordCount )  + ' 人 ';
  end;

end;

procedure TFormHrd20.bbtn_addClick(Sender: TObject);
begin
  //
  if not IsCanPost then Exit;
  //
  ADOQuery1.Append;
  PanelFlow.Visible:=true;
  // ChangeFlowFlds;
  EditFlow0.SetFocus;
  //
  sb_save.Enabled := true ;
  PanelAct.Enabled:=true;
  PanelQuery.Enabled:=true;
  SetActEnabled(true) ;
end;

procedure TFormHrd20.bbtn_okClick(Sender: TObject);
begin
  {2014.08.07 lx
  if IsCanPost then
  begin
    if ADOQuery1.State in [dsedit,dsinsert] then
      ADOQuery1.Post;
  end
  else
    ADOQuery1.Cancel;
  }

  //2014.08.07 lx
  if ADOQuery1.State in [dsedit,dsinsert] then
  begin
    if ADOQuery1.State in [dsinsert] then
    begin
      if IsCanPost then
        ADOQuery1.Post
      else
        ADOQuery1.Cancel;
    end
    else
      ADOQuery1.Post;
  end
  else
    ADOQuery1.Cancel;


  //
  PanelFlow.Visible:=false ;
  month1.Visible:= False;
  sb_save.Enabled := true ;
  PanelAct.Enabled:=true;
  PanelQuery.Enabled:=true;
  SetActEnabled(true) ;
end;

procedure TFormHrd20.sb_PrintClick(Sender: TObject);
var
  titl:widestring;
begin
  titl:=GetLangName(LangC,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangV,'vietnam_chingluh_company')+'<br>'
    +GetLangName(LangC,'obas05_titl')+'<br>';
  showPrint(ADOQuery1,titl);
end;

procedure TFormHrd20.sb_AddClick(Sender: TObject);
//add record
begin
  with ADOQuery1 do
  begin
    if Active=false then//如果沒有打開數據集， 則重新打開
    begin
      SQL.Clear;
      SQL.Add('select * from hrd_emp_chan where 2=1 ');
      Active:=true;
    end;
    Last;
    Append;
    ADOQuery1.FieldByName('up_user').Value := username ;
    ADOQuery1.FieldByName('up_date').AsDateTime  := GetServerDateTime ;
  end;
  ChangeFlowFlds;
  PanelFlow.Visible:= True;
  EditFlow0.Enabled:= True ;
  EditFlow0.SetFocus;
  PanelFlow.Enabled:= True;
  PanelMain.Enabled:= True;
  //
  s_add.Visible := True;
end;

procedure TFormHrd20.sb_DelClick(Sender: TObject);
begin
with ADOQuery1 do
if (RecordCount<>0) or ( not Eof) then
  if wideMessageDlg(GetLangName(LangStr,'msg_del_alert'),mtConfirmation,[mbyes,mbno],0)=mryes then
    Delete;
end;

procedure TFormHrd20.sb_editClick(Sender: TObject);
begin
  ChangeFlowFlds;
  PanelFlow.Visible:=true;
  EditFlow0.SetFocus;
  PanelGrid.Enabled:=true;
  PanelAct.Enabled:=false;
  PanelQuery.Enabled:=false;
  sb_save.Enabled := true ;
  //
  s_add.Visible := False;
end;

procedure TFormHrd20.sb_RecoverClick(Sender: TObject);
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_cancel'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
ADOQuery1.CancelBatch;
SetActEnabled(false);
end;

procedure TFormHrd20.sb_SaveClick(Sender: TObject);
begin
  if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  ADOQuery1.UpdateBatch;
  SetActEnabled(false);
end;
procedure TFormHrd20.ChangeFlowFlds;
//給浮動窗口中某些欄位賦默認值
begin
  with ADOQuery1 do
  begin
    if State=dsInsert then//是否修改
    begin
      EditFlow0.ReadOnly:=false;
      EditFlow0.Color:=clwhite;
      
    end
    else
    begin
      EditFlow0.ReadOnly:=true;
      EditFlow0.Color:=clBtnface;
    end;
  end;
end;
procedure TFormHrd20.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
  SetComponentLang(self);//set component language text
  keys:='vietnam_chingluh_company,hrd15_titl,total,current_location,'
    +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
    +'not_find_data,with_star_cannot_empty,msg_post_record_on_close,'
    +'sex_man,sex_woman,hrd20_date_1,hrd20_date_2,hrd20_date_3,hrd20_date_4,hrd20_date_5,hrd20_date_6,hrd20_date_7';
  LangC:=GetLangWideStrs(keys,'C');
  LangE:=GetLangWideStrs(keys,'E');
  LangV:=GetLangWideStrs(keys,'V');
  if userlang='V' then
    LangStr:=LangV
  else if userlang='E' then
    LangStr:=LangE
  else
    LangStr:=LangC;
  //
  hrd20_date_1.Caption:= GetLangName(Langstr, 'hrd20_date_1');
  hrd20_date_2.Caption:= GetLangName(Langstr, 'hrd20_date_2');
  hrd20_date_3.Caption:= GetLangName(Langstr, 'hrd20_date_3');
  hrd20_date_4.Caption:= GetLangName(Langstr, 'hrd20_date_4');
  hrd20_date_5.Caption:= GetLangName(Langstr, 'hrd20_date_5');
  hrd20_date_6.Caption:= GetLangName(Langstr, 'hrd20_date_6');
  hrd20_date_7.Caption:= GetLangName(Langstr, 'hrd20_date_7');

//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;
procedure TFormHrd20.SetActEnabled(Modify_Flag:boolean=true);
//設置功能按鈕是否可用
var
  status:boolean;
begin
  status:=AdoQuery1.Active;
  sb_print.Enabled:=status and Pri_Arr[PRT];
  //
  btnExcel.Enabled:= sb_Print.Enabled;
  //
  sb_Add.Enabled:=Pri_Arr[ADD];
  sb_Del.Enabled:=status and Pri_Arr[DEL];
  sb_edit.Enabled:=status and Pri_Arr[UPD];
  sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;
procedure TFormHrd20.ADOQuery1CalcFields(DataSet: TDataSet);
var
  emp, sql, dept, cate  :string ;
begin
  emp := dataset.fieldbyname('emp_id').AsString ;
  sql := 'select a.emp_id, a.emp_chs, a.name_vim, b.dept_code + '' - '' + b.abbr_titl as department  from hrd_emp as a, hrd_dept as b where a.emp_id='''+ emp +''' and a.dept_code=b.dept_code';
  dmhrdsys.SQLQuery1.SQL.Clear ;
  dmhrdsys.SQLQuery1.SQL.Add(sql);
  dmhrdsys.SQLQuery1.Open ;
//  dept := dmhrdsys.SQLQuery1.fieldbyname('dept_code').AsString ;
  if not dmhrdsys.SQLQuery1.Eof then
     begin
       dataset.FieldByName('emp_chs').Value := dmhrdsys.SQLQuery1.fieldbyname('emp_chs').Value ;
       dataset.FieldByName('name_vim').Value := dmhrdsys.SQLQuery1.fieldbyname('name_vim').Value ;
       dataset.FieldByName('department').Value := dmhrdsys.SQLQuery1.fieldbyname('department').Value ;
     end;
//  cate := dataset.fieldbyname('emp_cate').AsString ;
 // if cate = '1' then
 //    emp_cate1.Checked := true ;
 // if cate = '2' then
 //    emp_cate2.Checked := true ;

  //
  if not ADOQuery1date_6.IsNull then
    ADOQuery1date_7.AsDateTime:= IncMonth(ADOQuery1date_6.AsDateTime, 12);
end;

procedure TFormHrd20.ImageCloseClick(Sender: TObject);
begin
  //
  emp_cate.OnChange:= nil;
  try
    if ADOQuery1.State in [dsedit,dsinsert] then
    begin
      if wideMessageDlg(GetLangName(LangStr,'msg_post_record_on_close'),mtConfirmation,[mbyes,mbno],0)=mryes then
        ADOQuery1.Post
      else
        ADOQuery1.Cancel;
    end;
    PanelFlow.Visible:=false;
    month1.Visible:= False;
    PanelMain.Enabled:=true;
    PanelQuery.Enabled:=true;
    PanelGrid.Enabled:=true;
    PanelAct.Enabled:=true;
  finally
    emp_cate.OnChange:= emp_cateChange;
  end;
end;

procedure TFormHrd20.TntButton1Click(Sender: TObject);
begin
  SetPos(Sender);
end;

procedure TFormHrd20.Month1DblClick(Sender: TObject);
begin
  adoQuery1.Edit ;
  //
  case flag of
    0: ADOQuery1date_s.AsDateTime:= Month1.Date;
    1: ADOQuery1date_e.AsDateTime:= Month1.Date;
    2: ADOQuery1date_1.AsDateTime:= Month1.Date;
    3: ADOQuery1date_2.AsDateTime:= Month1.Date;
    4: ADOQuery1date_3.AsDateTime:= Month1.Date;
    5: ADOQuery1date_4.AsDateTime:= Month1.Date;
    6: ADOQuery1date_5.AsDateTime:= Month1.Date;
    7: ADOQuery1date_6.AsDateTime:= Month1.Date;
  end;
  //
  flag:= -1;
  //
  month1.Visible := false ;
end;

procedure TFormHrd20.SetPos(Sender: TObject);
var
  BtnPos: TTntButton;
  //
  iTop, iLeft: Integer;
begin
  //
  BtnPos:= (Sender as TTntButton);
  //
  flag:= BtnPos.Tag;
  //
  iTop:= BtnPos.Top - month1.Height;
  //
  if iTop< 0 then
    iTop:= 0;
  //
  month1.Top:= iTop;
  //
  iLeft:= BtnPos.Left - month1.Width;
  //
  if iLeft< 0 then
    iLeft:= 0;
  //
  month1.Left:= iLeft;
  //
  month1.Visible := true ;
end;

//是否可保存 2013.08.16 LX
function TFormHrd20.IsCanPost: Boolean;
var
  //
  sSQL, sCate: string;
begin
  //
  Result:= True;
  //
  sCate:= '';
  if emp_cate.ItemIndex = 0 then
    sCate := '1'  ;
  if emp_cate.ItemIndex = 1 then
    sCate := '2' ;
  sSQL:= 'select * from hrd_emp_chan A where emp_id =''' + EditFlow0.text + ''' and emp_cate=''' + sCate + ''' and date_s='''+ Date_0.Text  + '''';
  //
  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    if not IsEmpty then
    begin
      Result:= False;
      ShowMessage('該員工資料已存在');
      Exit;
    end;
  end;
  //判斷是否為女性 2013.08.16 LX
  sSQL:= 'select * from hrd_emp where emp_id = '+QuotedStr(EditFlow0.Text)+' and epsexd=''W''';
  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    //
    if IsEmpty then
    begin
      Result:= False;
      ShowMessage('請輸入女員工');
      Exit;
    end;
  end;
end;

procedure TFormHrd20.ExportDataToExcel;
var
  MyExcel: Variant;
  //
  I, iIndex, iCount, iRow: Integer;
begin
  //
  try
    MyExcel:= CreateOleObject('Excel.Application');
    MyExcel.WorkBooks.Add;
  except
    on Exception do
    begin
      raise
        exception.Create('無法創建Xls文件，請確認是否安裝EXCEL');
      Exit;
    end;
  end;
  //
  MyExcel.Visible:= False;
  try
    //
    iRow:= 1;
    //
    MyExcel.Cells[iRow, 1]:= PanelTitle.Caption;
    //
    Inc(iRow);
    //
    MyExcel.Cells[iRow, 1]:= '序號';
    //
    for I:= 0 to DBGrid1.FieldCount- 1 do
      MyExcel.Cells[iRow, I + 2]:= DBGrid1.Columns[I].Title.Caption;
    //
    DBGrid1.DataSource.DataSet.First;
    //
    while not DBGrid1.DataSource.DataSet.Eof do
    begin
      //
      Inc(iRow);
      //
      MyExcel.Cells[iRow, 1]:= DBGrid1.DataSource.DataSet.RecNo;
      //
      for I:= 0 to DBGrid1.FieldCount- 1 do
        MyExcel.Cells[iRow, I + 2]:= DBGrid1.Fields[I].Value;
      //
      DBGrid1.DataSource.DataSet.Next;
    end;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[iRow, 15]].Borders.LineStyle:= xlContinuous;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[iRow, 15]].Font.Size:= 9;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[1, 15]].MergeCells:= True;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[1, 15]].Font.Size:= 18;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, 15]].Font.Bold:= True;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, 15]].HorizontalAlignment:= xlCenter;
    //
    MyExcel.Range[MyExcel.Cells.Item[1, 1], MyExcel.Cells.Item[2, 15]].VerticalAlignment:= xlCenter;
    //
    MyExcel.Range[MyExcel.Cells.Item[2, 1], MyExcel.Cells.Item[2, 15]].Font.Size:= 10;
    //
    MyExcel.Cells.EntireColumn.AutoFit;
  finally
    MyExcel.Visible:= True;
  end;
end;

procedure TFormHrd20.btnExcelClick(Sender: TObject);
begin
  //
  ExportDataToExcel;
end;

procedure TFormHrd20.emp_cateChange(Sender: TObject);
var
  sValue: WideString;
begin
  //
  sValue:= emp_cate.Value;
  //
  if sValue= '1' then
  begin
    Date_6.Enabled:= False;
    BtnDate_6.Enabled:= False;
    Date_7.Enabled:= False;
    BtnDate_7.Enabled:= False;
    Date_8.Enabled:= False;
  end
  else
  begin
    Date_6.Enabled:= True;
    BtnDate_6.Enabled:= True;
    Date_7.Enabled:= True;
    BtnDate_7.Enabled:= True;
    Date_8.Enabled:= True;
  end;
end;

procedure TFormHrd20.edit_beginChange(Sender: TObject);
begin
  edit_end.Text:= edit_begin.Text;
end;

end.
