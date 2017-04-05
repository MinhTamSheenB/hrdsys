{*************************************************************************
Name：hrd13(員工基本資料查詢)
Author: anil
Create date:2005-08-01
Modify date:2005-08-05
Commentate:員工基本資料查詢
*************************************************************************}
unit UnitHrd13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TntExtCtrls, StdCtrls, TntStdCtrls, Grids, DBGrids,
  TntDBGrids, DB, ADODB, Buttons, TntButtons, Mask, DBCtrls, TntDbCtrls,
  TntDialogs,WSDLIntf,strUtils, TntDB, Menus, TntMenus, ComCtrls,
  TntComCtrls, CheckLst, TntCheckLst,QRCtrls, DBClient, Provider,DateUtils;

type
  TFormHrd13 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelCondition: TPanel;
    PanelGrid: TPanel;
    PanelDetail: TPanel;
    DBGrid1: TTntDBGrid;
    DataSource1: TDataSource;
    TntGroupBox4: TTntGroupBox;
    TntLabel57: TTntLabel;
    TntLabel64: TTntLabel;
    TntLabel62: TTntLabel;
    DBEditTaddrVim: TTntDBEdit;
    DBEditAreaVim: TTntDBEdit;
    DBEditEpidDate: TTntDBEdit;
    ImagePhoto: TImage;
    ADODataSetPic: TADODataSet;
    BtnPrint: TTntBitBtn;
    TntLabel19: TTntLabel;
    EditLocation: TTntEdit;
    TntBitBtn1: TTntBitBtn;
    TntPanel1: TTntPanel;
    EditLedtEnd: TTntDateTimePicker;
    EditLedtBegin: TTntDateTimePicker;
    TntLabel17: TTntLabel;
    TntLabel14: TTntLabel;
    EditIndtBegin: TTntDateTimePicker;
    EditIndtEnd: TTntDateTimePicker;
    EditBirthEnd: TTntDateTimePicker;
    EditBirthBegin: TTntDateTimePicker;
    TntLabel6: TTntLabel;
    TntLabel10: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    EditIdnoEnd: TTntEdit;
    EditIdnoBegin: TTntEdit;
    CobEduBegin: TTntComboBox;
    CobEduEnd: TTntComboBox;
    CobPstEnd: TTntComboBox;
    CobPstBegin: TTntComboBox;
    EditEmpBegin: TTntEdit;
    EditEmpEnd: TTntEdit;
    TntLabel3: TTntLabel;
    TntLabel5: TTntLabel;
    TntLabel11: TTntLabel;
    TntLabel4: TTntLabel;
    TntPanel2: TTntPanel;
    TntLabel7: TTntLabel;
    TntDBEdit2: TTntDBEdit;
    Label_picc: TTntLabel;
    Edit_picc: TTntEdit;
    TntLabel8: TTntLabel;
    TntDBEdit1: TTntDBEdit;
    Panel2: TPanel;
    TntLabel58: TTntLabel;
    CobSex: TTntComboBox;
    TntLabel1: TTntLabel;
    EditSpcBegin: TTntEdit;
    EditSpcEnd: TTntEdit;
    ADOQuery1: TADOQuery;
    ADOQuery1emp_id: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1name_eng: TWideStringField;
    ADOQuery1epid_no: TStringField;
    ADOQuery1epbirth: TDateTimeField;
    ADOQuery1epsexd: TStringField;
    ADOQuery1ifmarry: TStringField;
    ADOQuery1edu_code: TStringField;
    ADOQuery1chs_status: TStringField;
    ADOQuery1eng_status: TStringField;
    ADOQuery1factory: TStringField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1epindt: TDateTimeField;
    ADOQuery1epledt: TDateTimeField;
    ADOQuery1pst_code: TStringField;
    ADOQuery1info_code: TStringField;
    ADOQuery1spc_id: TStringField;
    ADOQuery1epAddrchs: TWideStringField;
    ADOQuery1epAddrvim: TWideStringField;
    ADOQuery1epAddreng: TWideStringField;
    ADOQuery1tpAddrchs: TWideStringField;
    ADOQuery1tpAddrvim: TWideStringField;
    ADOQuery1tpAddreng: TWideStringField;
    ADOQuery1epid_date: TDateTimeField;
    ADOQuery1epid_area: TWideStringField;
    ADOQuery1epid_vim: TWideStringField;
    ADOQuery1epid_eng: TWideStringField;
    ADOQuery1emp_phone: TStringField;
    ADOQuery1department: TWideStringField;
    ADOQuery1pstname: TWideStringField;
    ADOQuery1info_name: TWideStringField;
    BtnQuery: TTntBitBtn;
    TntBitBtn2: TTntBitBtn;
    QryDate: TTntDateTimePicker;
    TntLabel12: TTntLabel;
    rbInWork: TTntRadioButton;
    rbLeftWork: TTntRadioButton;
    RbAllWork: TTntRadioButton;
    CobInfo: TTntComboBox;
    TntLabel50: TTntLabel;
    ADOQuery2: TADOQuery;
    ADOQuery2upd_user: TStringField;
    ADOQuery2upd_date: TDateTimeField;
    ADOQuery2emp_id: TStringField;
    ADOQuery2emp_chs: TWideStringField;
    ADOQuery2epid_no: TStringField;
    ADOQuery2epbirth: TDateTimeField;
    ADOQuery2epsexd: TStringField;
    ADOQuery2ifmarry: TStringField;
    ADOQuery2epAddrchs: TWideStringField;
    ADOQuery2tpAddrchs: TWideStringField;
    ADOQuery2edu_code: TStringField;
    ADOQuery2chs_status: TStringField;
    ADOQuery2eng_status: TStringField;
    ADOQuery2epid_date: TDateTimeField;
    ADOQuery2epid_area: TWideStringField;
    ADOQuery2factory: TStringField;
    ADOQuery2dept_code: TStringField;
    ADOQuery2epindt: TDateTimeField;
    ADOQuery2epledt: TDateTimeField;
    ADOQuery2left_reason: TWideStringField;
    ADOQuery2pst_code: TStringField;
    ADOQuery2info_code: TStringField;
    ADOQuery2spc_id: TStringField;
    ADOQuery2name_eng: TWideStringField;
    ADOQuery2name_vim: TWideStringField;
    ADOQuery2epAddrvim: TWideStringField;
    ADOQuery2epAddreng: TWideStringField;
    ADOQuery2tpAddrvim: TWideStringField;
    ADOQuery2tpAddreng: TWideStringField;
    ADOQuery2epid_vim: TWideStringField;
    ADOQuery2epid_eng: TWideStringField;
    ADOQuery2emp_phone: TStringField;
    ADOQuery2birth_addr: TWideStringField;
    TntLabel13: TTntLabel;
    EditBirthAddr: TTntEdit;
    TntLabel2: TTntLabel;
    EditNameChs: TTntEdit;
    TntLabel9: TTntLabel;
    EditNameVim: TTntEdit;
    ADOQuery1insur_seq: TTntWideStringField;
    ADOQuery1name_vim_en: TTntWideStringField;
    ADOQuery1left_sts: TStringField;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure LoadPicFromServer(ImagePhoto:Timage;InputEmpId:string);
    procedure SetOtherFields;
    procedure SetPiccText(empid:string);
    procedure AppendUpdData(whereStr:string);
    //auto general
    procedure BtnQueryClick(Sender: TObject);
    procedure EditLocationChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ADOStoredProc1epsexdGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BtnPrintClick(Sender: TObject);
    procedure CobDeptBeginChange(Sender: TObject);
    procedure TntBitBtn1Click(Sender: TObject);
    procedure TntBitBtn2Click(Sender: TObject);
    procedure TntPanel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EditMonthKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADOQuery1ifmarryGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd13: TFormHrd13;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
const
  TMP_DB='[dbo].';
  TMP_TABLE='tmp_emp_qry';
{$R *.dfm}

procedure TFormHrd13.InitLang;
{*************************************************************************
TO DO:初始化語言
參數：無
*************************************************************************}
var
  keys:String;
  i:integer;
begin
SetComponentLang(self);//set component language text
with ADOQuery1 do
  for i:=0 to Fieldcount-1 do
    keys:=keys+'fld_'+Fields[i].FieldName+',';
keys:=keys+'hrd13_titl,in_work,left_work,month,current_location,total,'
  +'choose_photo,sex_man,sex_woman,marry_over,marry_is,marry_not,reading_data,'
  +'detail_info,query,print,fast_find,query_condition,not_find_data,'
  +'default_value,choose_all,choose_none,preview,choose_print_field,'
  +'sex_woman,sex_man,sex_all,all_inwork,all_outwork,all,';
LangStr:=GetLangWideStrs(keys);
PanelTitle.Caption:=GetLangName(LangStr,'hrd13_titl');
TntGroupBox4.Caption:=GetLangName(LangStr,'detail_info');
rbInWork.Caption:=GetLangName(LangStr,'in_work');
rbLeftWork.Caption:=GetLangName(LangStr,'left_work');
BtnQuery.Caption:=GetLangName(LangStr,'query');
BtnPrint.Caption:=GetLangName(LangStr,'print');
TntLabel4.Caption:=GetLangName(LangStr,'fld_emp_id');
TntLabel2.Caption:=GetLangName(LangStr,'fld_emp_chs');
TntLabel6.Caption:=GetLangName(LangStr,'fld_epbirth');
TntLabel3.Caption:=GetLangName(LangStr,'fld_epid_no');
TntLabel5.Caption:=GetLangName(LangStr,'fld_edu_code');
TntLabel10.Caption:=GetLangName(LangStr,'fld_dept_code');
TntLabel14.Caption:=GetLangName(LangStr,'fld_epindt');
TntLabel11.Caption:=GetLangName(LangStr,'fld_pst_code');
TntLabel17.Caption:=GetLangName(LangStr,'fld_epledt');
TntLabel19.Caption:=GetLangName(LangStr,'fast_find');
TntLabel62.Caption:=GetLangName(LangStr,'fld_epid_date');
TntLabel64.Caption:=GetLangName(LangStr,'fld_epid_vim');
TntLabel57.Caption:=GetLangName(LangStr,'fld_tpAddrvim');
end;

procedure TFormHrd13.InitForm();
{*************************************************************************
TO DO:初始化Form
參數：無
*************************************************************************}
var
  sql_str,fld_name:string;
  i:integer;
begin
//init date
QryDate.Date:=date;
EditBirthEnd.Date:=date-3650;
EditIndtEnd.Date:=date;
EditLedtEnd.Date:=date;
EditBirthEnd.Checked:=false;
EditIndtEnd.Checked:=false;
EditLedtEnd.Checked:=false;
//init comboBox
  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
//info code
  {sql_str:='select info_code+'' ''+info_chs from hrd_inwork ';
  SetComboxList(sql_str,CobInfo,'0');}
  CobInfo.Items.Add(GetLangName(LangStr,'all_inwork'));
  CobInfo.Items.Add(GetLangName(LangStr,'all_outwork'));
  CobInfo.Items.Add(GetLangName(LangStr,'all'));
  CobInfo.ItemIndex:=CobInfo.Items.Count-3;
  //CobSex
  CobSex.Items.Add('0 '+ GetLangName(LangStr,'sex_all'));
  CobSex.Items.Add('W '+ GetLangName(LangStr,'sex_woman'));
  CobSex.Items.Add('M '+ GetLangName(LangStr,'sex_man'));
  CobSex.ItemIndex:=0;
  {//dept_code
  if userLang='E' then
    fld_name:='dept_code+'' ''+eng_abbr'
  else if userLang='V' then
    fld_name:='dept_code+'' ''+vim_abbr'
  else
    fld_name:='dept_code+'' ''+abbr_titl';
  sql_str:='select '+fld_name+' as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,CobDeptBegin);
  SetComboxList(sql_str,CobDeptEnd);}
  //edu_code
  for i:=1 to 17 do
  begin
    CobEduBegin.Items.Add(Format('%.2d', [i]));
    CobEduEnd.Items.Add(Format('%.2d', [i]));
  end;
  //sql_str:='select edu_code from hrd_educ';
  //SetComboxList(sql_str,CobEduBegin);
  //SetComboxList(sql_str,CobEduEnd);
  if userLang='E' then
    fld_name:='pst_code+'' ''+pst_eng'
  else if userLang='V' then
    fld_name:='pst_code+'' ''+pst_vim'
  else
    fld_name:='pst_code+'' ''+pst_chs';
  sql_str:='select '+fld_name+' as pst_name from hrd_prof where pst_code>=''12''';
  SetComboxList(sql_str,CobPstBegin);
  SetComboxList(sql_str,CobPstEnd);
end;

procedure TFormHrd13.BtnQueryClick(Sender: TObject);
//Begin Query
var
  SqlStr,WhereStr:string;
begin
  SetStatusText(GetLangName(LangStr,'reading_data'));
  SqlStr:='if exists (select * from '+TMP_DB+'sysobjects where name='''+TMP_TABLE+''')'
//    +'drop table '+TMP_DB+TMP_TABLE+';';
    +'delete from  '+TMP_DB+TMP_TABLE+';';
//  SqlStr:=SqlStr+'select * into '+TMP_DB+TMP_TABLE+' from hrd_emp A where 1=1 ';
  SqlStr:=SqlStr+'insert into '+TMP_DB+TMP_TABLE+' select * from hrd_emp A where 1=1 ';
  if DateOf(QryDate.Date)<>DateOf(Date) then
    SqlStr:=SqlStr+' and emp_id not in (select distinct emp_id from hrd_emp_upd'//此後未調動
      +' where up_date>='''+FormatDateTime('yyyy/mm/dd',QryDate.Date+1)+''')';
  WhereStr:=WhereStr+' and '+UserDeptStr;
  if DateOf(QryDate.Date)=DateOf(Date) then
  begin//查詢當前日期
  if CobInfo.ItemIndex=CobInfo.Items.Count-3 then//全部在職
    WhereStr:=WhereStr+' and epledt is null'
  else if CobInfo.ItemIndex=CobInfo.Items.Count-2 then//全部離職
    WhereStr:=WhereStr+' and epledt is not null'
  else if CobInfo.ItemIndex<>CobInfo.Items.Count-1 then
    WhereStr:=WhereStr+' and info_code='''+LeftStr(CobInfo.Text,1)+'''';
  end
  else
  begin//查詢以前日期
  if CobInfo.ItemIndex=CobInfo.Items.Count-3 then//全部在職
    WhereStr:=WhereStr+' and (epledt is null '
      +' or epledt>'''+FormatDateTime('yyyy/mm/dd',QryDate.Date)+''')'//加上此後離職
      +' and epindt<='''+FormatDateTime('yyyy/mm/dd',QryDate.Date)+''''//必須此前進廠
  else if CobInfo.ItemIndex=CobInfo.Items.Count-2 then//全部離職
    WhereStr:=WhereStr+' and (epledt is not null'
      +' and epledt<='''+FormatDateTime('yyyy/mm/dd',QryDate.Date)+''')';//加上此前離職
  end;
  if trim(EditEmpBegin.Text)<>'' then
    WhereStr:=WhereStr+' and emp_id>='''+trim(EditEmpBegin.Text)+'''';
  if trim(EditEmpEnd.Text)<>'' then
    WhereStr:=WhereStr+' and emp_id<='''+trim(EditEmpEnd.Text)+'''';
  if trim(EditIdnoBegin.Text)<>'' then
    WhereStr:=WhereStr+' and epid_no>='''+trim(EditIdnoBegin.Text)+'''';
  if trim(EditIdnoEnd.Text)<>'' then
    WhereStr:=WhereStr+' and epid_no<='''+trim(EditIdnoEnd.Text)+'''';
  if trim(EditSpcBegin.Text)<>'' then
    WhereStr:=WhereStr+' and spc_id>='''+trim(EditSpcBegin.Text)+'''';
  if trim(EditSpcEnd.Text)<>'' then
    WhereStr:=WhereStr+' and spc_id<='''+trim(EditSpcEnd.Text)+'''';
  if trim(CobDeptBegin.Text)<>'' then
    WhereStr:=WhereStr+' and dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if trim(CobDeptEnd.Text)<>'' then
    WhereStr:=WhereStr+' and dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  if trim(CobPstBegin.Text)<>'' then
    WhereStr:=WhereStr+' and pst_code>='''+LeftStr(CobPstBegin.Text,2)+'''';
  if trim(CobPstEnd.Text)<>'' then
    WhereStr:=WhereStr+' and pst_code<='''+LeftStr(CobPstEnd.Text,2)+'''';
  if trim(CobEduBegin.Text)<>'' then
    WhereStr:=WhereStr+' and edu_code>='''+LeftStr(CobEduBegin.Text,2)+'''';
  if trim(CobEduEnd.Text)<>'' then
    WhereStr:=WhereStr+' and edu_code<='''+LeftStr(CobEduEnd.Text,2)+'''';
  if EditIndtBegin.Checked then
    WhereStr:=WhereStr+' and epindt>='''+FormatDateTime('yyyy/mm/dd',EditIndtBegin.Date)+'''';
  if EditIndtEnd.Checked then
    WhereStr:=WhereStr+' and epindt<='''+FormatDateTime('yyyy/mm/dd',EditIndtEnd.Date)+'''';
  if EditLedtBegin.Checked then
    WhereStr:=WhereStr+' and epledt>='''+FormatDateTime('yyyy/mm/dd',EditLedtBegin.Date)+'''';
  if EditLedtEnd.Checked then
    WhereStr:=WhereStr+' and epledt<='''+FormatDateTime('yyyy/mm/dd',EditLedtEnd.Date)+'''';
  if EditBirthBegin.Checked then
    WhereStr:=WhereStr+' and epbirth>='''+FormatDateTime('yyyy/mm/dd',EditBirthBegin.Date)+'''';
  if EditBirthEnd.Checked then
    WhereStr:=WhereStr+' and epbirth<='''+FormatDateTime('yyyy/mm/dd',EditBirthEnd.Date)+'''';
  if leftstr(CobSex.Text,1)<>'0' then
    WhereStr:=WhereStr+' and epsexd='''+leftstr(CobSex.Text,1)+'''';
  if trim(EditNameChs.Text)<>'' then
    WhereStr:=WhereStr+' and emp_chs like ''%'+trim(EditNameChs.Text)+'%''';
  if trim(EditNameVim.Text)<>'' then
    WhereStr:=WhereStr+' and name_vim like ''%'+trim(EditNameVim.Text)+'%''';
  if trim(EditBirthAddr.Text)<>'' then
    WhereStr:=WhereStr+' and birth_addr like ''%'+trim(EditBirthAddr.Text)+'%''';
  SqlStr:=SqlStr+WhereStr;
  with DMHrdsys.ADOCommand1 do
  begin
    CommandText:=SqlStr;
    execute;
  end;
  if DateOf(QryDate.Date)<>DateOf(Date) then
    AppendUpdData(whereStr);//查詢以前日期附加之後修改過的數據
  SqlStr:='select * from '+TMP_DB+TMP_TABLE+' where 1=1 '+whereStr+' order by dept_code,emp_id';
  With ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.add(SqlStr);
    open;
  end;
  if ADOQuery1.Eof then
  begin
    SetStatusText(GetLangName(LangStr,'not_find_data'));
    DBGrid1.Enabled:=false;
    BtnPrint.Enabled:=false;
    EditLocation.text:='';
    EditLocation.Enabled:=false;
    EditLocation.Color:=clBtnFace;
  end
  else
    begin
      DBGrid1.Enabled:=true;
      BtnPrint.Enabled:=true;
      EditLocation.Enabled:=true;
      EditLocation.Text:='';
      EditLocation.Color:=clwhite;
    end;
  TntPanel1.Visible:=false;
  Panel1.Enabled:=true;
  DBGridSortByTitle(DBGrid1.Columns[0]);
end;

procedure TFormHrd13.SetOtherFields();
{*************************************************************************
TO DO:設置grid欄位
*************************************************************************}
var
  sql_str,fld_name:string;
begin
  //dept_code
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.clear;
    if userLang='E' then
      fld_name:='dept_code+'' ''+eng_abbr'
    else if userLang='V' then
      fld_name:='dept_code+'' ''+vim_abbr'
    else
      fld_name:='dept_code+'' ''+abbr_titl';
    sql_str:='select dept_code,'+fld_name+' as dept_name from hrd_dept';
    sql.Add(sql_str);
    open;
  end;
  with ADOQuery1.FieldByName('department') do
  begin
    LookupDataSet:=DMHrdsys.SQLQuery1;
    KeyFields:='dept_code';
    LookupKeyFields:='dept_code';
    LookupResultField:='dept_name';
  end;
  //pst_code
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.clear;
    if userLang='E' then
      fld_name:='pst_eng'
    else if userLang='V' then
      fld_name:='pst_vim'
    else
      fld_name:='pst_chs';
    sql_str:='select pst_code,'+fld_name+' as pst_chs from hrd_prof';
    sql.Add(sql_str);
    open;
  end;
  with ADOQuery1.FieldByName('pstname') do
  begin
    LookupDataSet:=DMHrdsys.SQLQuery2;
    KeyFields:='pst_code';
    LookupKeyFields:='pst_code';
    if DMHrdsys.SQLQuery2.FieldByName('pst_chs').Value<>'' then
      LookupResultField:='pst_chs'
    else
      LookupResultField:='pst_code';
  end;
  //info_code
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.clear;
    if userLang='E' then
      fld_name:='info_eng'
    else if userLang='V' then
      fld_name:='info_vim'
    else
      fld_name:='info_chs';
    sql_str:='select info_code,'+fld_name+' as info_name from hrd_inwork';
    sql.Add(sql_str);
    open;
  end;
  with ADOQuery1.FieldByName('info_name') do
  begin
    LookupDataSet:=DMHrdsys.SQLQuery3;
    KeyFields:='info_code';
    LookupKeyFields:='info_code';
    if DMHrdsys.SQLQuery3.FieldByName('info_name').Value<>'' then
      LookupResultField:='info_name'
    else
      LookupResultField:='info_code';
  end;
end;

procedure TFormHrd13.EditLocationChange(Sender: TObject);
{*************************************************************************
TO DO:快速查找
*************************************************************************}
begin
  With ADOQuery1 do
  begin
    if TTntEdit(Sender).Text<>'' then
      Filter:='emp_id like '''+TTntEdit(Sender).Text+'*'+''''
    else
      Filter:='';
    Filtered:=true;
  end;
end;

procedure TFormHrd13.LoadPicFromServer(ImagePhoto:Timage;InputEmpId:string);
{*************************************************************************
TO DO:載入工號對應的照片到圖片中
Param:ImagePhoto-欲加載到圖片；InputEmpId-工號
Author:anil
Create Date:2005-7-25
Modify Date:2005-8-4
*************************************************************************}
var
  myfilename:string;
  myfileStream,PicBlobStream: TStream;
  Count: Integer;
  Buffer: PChar;
begin
  if trim(InputEmpId)='' then
    begin
      ImagePhoto.Picture:=nil;
      exit;
    end;
  with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from hrd_epPict where emp_id='''+InputEmpId+'''');
      open;
      if not EOF then
      begin
        myfilename := fields.FieldByName('pict_road').AsString;//get file name
        PicBlobStream := CreateBlobStream(FieldByName('emp_pict'), bmRead);
        Count := PicBlobStream.Size;
        if Count>0 then
        begin
          myfileStream := TFileStream.Create(myfilename, fmCreate);//create file
          GetMem(Buffer, Count);
          PicBlobStream.ReadBuffer(Buffer^, Count);
          MyFileStream.WriteBuffer(Buffer^, Count);
          myfileStream.Free;
        end;
        if fileexists(myfilename) then
        begin
          ImagePhoto.Picture.LoadFromFile(myfilename);
          deletefile(myfilename);
        end
        else
          ImagePhoto.Picture:=nil;
      end//end not EOF
      else
        ImagePhoto.Picture:=nil;
    end;
end;

procedure TFormHrd13.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  InitForm;// Init Form
  pri_arr:=GetPrvArr(username,'hrd13');
end;

procedure TFormHrd13.ADOStoredProc1epsexdGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.Value='M' then
    text:=GetLangName(LangStr,'sex_man')
  else if Sender.Value='W' then
    text:=GetLangName(LangStr,'sex_woman');
end;

procedure TFormHrd13.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormHrd13.BtnPrintClick(Sender: TObject);
{*************************************************************************
TO DO:顯示打印欄位選擇浮動Panel
*************************************************************************}
var
  DefFlds:string;
begin
  DefFlds:='emp_id,emp_chs,name_vim,epid_no,epbirth,epsexd,edu_code,dept_code,department,epindt,spe_id,pstname,tpAddrvim';
  showPrint(ADOQuery1,'人事基本資料列印','',DefFlds);
end;

procedure TFormHrd13.CobDeptBeginChange(Sender: TObject);
begin
  CobDeptEnd.Text:=CobDeptBegin.Text;
end;

procedure TFormHrd13.TntBitBtn1Click(Sender: TObject);
begin
  TntPanel1.Visible:=true;
  Panel1.Enabled:=false;
  TntPanel1.Left:=256;
  TntPanel1.Top:=16;
end;

procedure TFormHrd13.TntBitBtn2Click(Sender: TObject);
begin
  TntPanel1.Visible:=false;
  Panel1.Enabled:=true;
end;

procedure TFormHrd13.TntPanel2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  TntPanel1.Perform(WM_SysCommand,$F012,0);
end;

procedure TFormHrd13.SetPiccText(empid:string);
var
  sql_str:string;
begin
  sql_str:='select * from hrd_picc where emp_id='''+empid+'''';
  if CheckRecordExist(sql_str) then
    Edit_picc.Text:='1'
  else
    Edit_picc.Text:='0';
end;

procedure TFormHrd13.EditMonthKeyDown(Sender: TObject; var Key: Word;
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

procedure TFormHrd13.ADOQuery1AfterScroll(DataSet: TDataSet);
var
  GetEmpId:string;
begin
with Dataset do
  begin
    if FieldByName('emp_id').Value<>null then
      GetEmpId:=FieldByName('emp_id').Value
    else
      GetEmpId:='';
    LoadPicFromServer(ImagePhoto,GetEmpId);
    SetPiccText(GetEmpId);
    setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
  end;
end;

procedure TFormHrd13.ADOQuery1CalcFields(DataSet: TDataSet);
var
  key,sqlstr:string;
begin
  with DMHrdsys.SQLQuery2 do
  begin
    //dept_code
    key:=DataSet.FieldByName('dept_code').AsString;
    sqlstr:='select *,dept_code+'' ''+abbr_titl as dept from hrd_dept where dept_code='''+key+'''';
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;                             
    DataSet.FieldByName('department').AsString:=FieldByName('dept').AsString;
    //pst_code
    key:=DataSet.FieldByName('pst_code').AsString;
    sqlstr:='select * from hrd_prof where pst_code='''+key+'''';
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;                             
    DataSet.FieldByName('pstname').AsString:=FieldByName('pst_chs').AsString;
    //info_code
    key:=DataSet.FieldByName('info_code').AsString;
    sqlstr:='select * from hrd_inwork where info_code='''+key+'''';
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    DataSet.FieldByName('info_name').AsString:=FieldByName('info_chs').AsString;

    key:=DataSet.FieldByName('emp_id').AsString;
    sqlstr:='select * from hrd_picc where emp_id='''+key+'''';
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    DataSet.FieldByName('insur_seq').AsString:=FieldByName('insur_seq').AsString;
  end;
end;

procedure TFormHrd13.ADOQuery1ifmarryGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin                     
  if Sender.Value='0' then
    text:=GetLangName(LangStr,'marry_over')
  else if Sender.Value='1' then
    text:=GetLangName(LangStr,'marry_is')                       
  else if Sender.Value='2' then
    text:=GetLangName(LangStr,'marry_not');
end;

procedure TFormHrd13.AppendUpdData(whereStr:string);
//查詢之前的資料附加該日期后修改過的數據
var
  sql_str,fld_name:string;
  i:integer;
begin
  whereStr:=AnsiReplaceStr(whereStr,'and emp_id','and A.emp_id');
  whereStr:=AnsiReplaceStr(whereStr,'dept_code','dept_old');
  whereStr:=AnsiReplaceStr(whereStr,'pst_code','pst_old');
//  sql_str:='insert into '+TMP_DB+TMP_TABLE+' select B.dept_old as dept_code,B.pst_old as pst_code,A.*'
  {sql_str:='update '+TMP_DB+TMP_TABLE+' set dept_code=B.dept_old,pst_code=B.pst_old '
    +' from hrd_emp A,hrd_emp_upd B where A.emp_id=B.emp_id '+whereStr
    +' and B.id in (select min(id) from hrd_emp_upd where '
    +' up_date>='''+FormatDateTime('yyyy/mm/dd',QryDate.Date)+''' group by emp_id)';}
  sql_str:='insert into '+TMP_DB+TMP_TABLE
    +' select upd_user,upd_date,A.emp_id,emp_chs,epid_no,epbirth,epsexd,ifmarry,'
    +'epAddrchs,tpAddrchs,edu_code,chs_status,eng_status,epid_date,epid_area,factory,'
    +'B.dept_old as dept_code,epindt,epledt,left_reason,B.pst_old as pst_code,'
    +'info_code,spc_id,name_eng,name_vim,epAddrvim,epAddreng,tpAddrvim,'
    +'tpAddreng,epid_vim,epid_eng,emp_phone,birth_addr,name_vim_en'
    +' from hrd_emp A,hrd_emp_upd B where A.emp_id=B.emp_id '+whereStr
    +' and B.id in (select min(id) from hrd_emp_upd where '
    +' up_date>='''+FormatDateTime('yyyy/mm/dd',QryDate.Date+1)+''' group by emp_id)';
  with DMHrdsys.ADOCommand1 do  //2010-12-13 hyt add name_vim_en
  begin
    CommandText:=sql_str;
    Execute;
  end;                
  {with ADOQuery2 do
  begin
    Close;
    Sql.Clear;
    Sql.Add(sql_str);
    Open;
    while not Eof do
    begin
      ADOQuery1.Append;
      for i:=0 to ADOQuery1.FieldCount-1 do
      begin
        fld_name:=ADOQuery1.Fields[i].FieldName;
        //if FindField(fld_name)<>nil then
        if ADOQuery1.Fields[i].FieldKind=fkData then
        begin
          ADOQuery1.Edit;
          ADOQuery1.FieldByName(fld_name).AsString:=FieldByName(fld_name).AsString;
        end;
      end;
      ADOQuery1.Post;
      next;
    end;
  end;}
end;

end.
