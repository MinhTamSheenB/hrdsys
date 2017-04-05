{*************************************************************************
name：hrd08(員工基本資料作業)
author: anil
create date:2005-07-18
modify date:2005-08-01
commentate:員工基本資料作業
*************************************************************************}
unit UnitHrd19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, TntDbCtrls, TntStdCtrls, Buttons,
  TntButtons, Grids, DBGrids, TntDBGrids, ExtCtrls, ComCtrls, TntExtCtrls,
  DB, ADODB, Provider, DBClient, ExtDlgs,StrUtils, Menus, TntMenus,WSDLIntf,tntDialogs,
  TntComCtrls;

type
  TFormHrd19 = class(TForm)
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    PanelUpd: TPanel;
    PanelFooter: TTntPanel;
    BtnCancel: TTntBitBtn;
    BtnSave: TTntBitBtn;
    PanelInput: TPanel;
    TntLabel1: TTntLabel;
    EditEmpId: TTntEdit;
    PanelDetail: TPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    ADODataSetPic: TADODataSet;
    ADODataSetPicupd_user: TStringField;
    ADODataSetPicupd_date: TDateTimeField;
    ADODataSetPicemp_id: TStringField;
    ADODataSetPicemp_pict: TBlobField;
    ADODataSetPicpict_road: TStringField;
    PanelTitle: TTntPanel;
    TntGroupBox3: TTntGroupBox;
    TntGroupBox4: TTntGroupBox;
    TntLabel45: TTntLabel;
    TntLabel47: TTntLabel;
    TntLabel46: TTntLabel;
    DBEditSpcId: TTntDBEdit;
    TntLabel48: TTntLabel;
    TntLabel49: TTntLabel;
    DBEditTaddrVim: TTntDBEdit;
    TntLabel57: TTntLabel;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    TntGroupBox2: TTntGroupBox;
    ImagePhoto: TImage;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel6: TPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel39: TTntLabel;
    TntLabel43: TTntLabel;
    TntLabel42: TTntLabel;
    TntLabel41: TTntLabel;
    TntLabel58: TTntLabel;
    DBEditEpIdNo: TTntDBEdit;
    DBEditNameVim: TTntDBEdit;
    DBEditNameChs: TTntDBEdit;
    CobSex: TTntComboBox;
    TntLabel44: TTntLabel;
    CobIfMarry: TTntComboBox;
    TntLabel51: TTntLabel;
    CobEdu: TTntComboBox;
    TntLabel60: TTntLabel;
    DBCobEngStatus: TTntDBComboBox;
    TntLabel59: TTntLabel;
    DBCobChsStatus: TTntDBComboBox;
    Panel13: TPanel;
    Panel14: TPanel;
    BtnChoosePhoto: TTntButton;
    ADODataSet1upd_user: TStringField;
    ADODataSet1upd_date: TDateTimeField;
    ADODataSet1emp_id: TStringField;
    ADODataSet1emp_chs: TWideStringField;
    ADODataSet1epid_no: TStringField;
    ADODataSet1epbirth: TDateTimeField;
    ADODataSet1epsexd: TStringField;
    ADODataSet1ifmarry: TStringField;
    ADODataSet1epAddrchs: TWideStringField;
    ADODataSet1tpAddrchs: TWideStringField;
    ADODataSet1edu_code: TStringField;
    ADODataSet1chs_status: TStringField;
    ADODataSet1eng_status: TStringField;
    ADODataSet1epid_date: TDateTimeField;
    ADODataSet1epid_area: TWideStringField;
    ADODataSet1factory: TStringField;
    ADODataSet1dept_code: TStringField;
    ADODataSet1epindt: TDateTimeField;
    ADODataSet1epledt: TDateTimeField;
    ADODataSet1pst_code: TStringField;
    ADODataSet1info_code: TStringField;
    ADODataSet1spc_id: TStringField;
    ADODataSet1name_eng: TWideStringField;
    ADODataSet1name_vim: TWideStringField;
    ADODataSet1epAddrvim: TWideStringField;
    ADODataSet1epAddreng: TWideStringField;
    ADODataSet1tpAddrvim: TWideStringField;
    ADODataSet1tpAddreng: TWideStringField;
    ADODataSet1epid_vim: TWideStringField;
    ADODataSet1epid_eng: TWideStringField;
    DTPickepBirth: TTntDateTimePicker;
    DTPickEpindt: TTntDateTimePicker;
    sb_FindEmp: TTntSpeedButton;
    sb_epledt: TTntSpeedButton;
    DBEditLedt: TTntDBEdit;
    TntLabel2: TTntLabel;
    TntLabel3: TTntLabel;
    TntLabel4: TTntLabel;
    TntLabel6: TTntLabel;
    TntLabel8: TTntLabel;
    TntLabel9: TTntLabel;
    TntLabel11: TTntLabel;
    TntLabel12: TTntLabel;
    TntLabel13: TTntLabel;
    TntStaticText1: TTntStaticText;
    TntLabel15: TTntLabel;
    TntDBEdit1: TTntDBEdit;
    ADODataSet1left_reason: TWideStringField;
    TntLabel5: TTntLabel;
    rbUpd: TTntRadioButton;
    rbAdd: TTntRadioButton;
    TntLabel62: TTntLabel;
    DBEditIddt: TTntDBEdit;
    sb_epid_date: TTntSpeedButton;
    TntLabel61: TTntLabel;
    CobFactory: TTntDBComboBox;
    TntLabel16: TTntLabel;
    TntLabel64: TTntLabel;
    DBEditAreaVim: TTntDBEdit;
    Label_picc: TTntLabel;
    TntLabel10: TTntLabel;
    TntDBEdit2: TTntDBEdit;
    TntLabel50: TTntLabel;
    CobInfo: TTntComboBox;
    ADODataSet1emp_phone: TStringField;
    Edit_picc: TTntEdit;
    CobDept: TTntComboBox;
    CobProf: TTntComboBox;
    TntPanel1: TTntPanel;
    RbShoes: TTntRadioButton;
    RbChem: TTntRadioButton;
    RbInq: TTntRadioButton;
    ChooseCalendar: TTntMonthCalendar;
    //my define
    procedure InitLang;
    procedure LoadPicFromServer(ImagePhoto:Timage;InputEmpId:string);
    procedure SavePicToServer(EmpId,filename:string);
    procedure changeFormStatus(flag:char);
    procedure ChangeCobData;
    procedure InitForm;
    procedure SetEnableSave(flag:boolean);
    function CheckInputValid():boolean;
    procedure SetPiccText();
    function getNewEmpId():string;
    procedure SaveDeptLog;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure EditEmpIdChange(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnChoosePhotoClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure rbUpdClick(Sender: TObject);
    procedure rbAddClick(Sender: TObject);
    procedure CobSexChange(Sender: TObject);
    procedure sb_FindEmpClick(Sender: TObject);
    procedure CobInfoChange(Sender: TObject);
    procedure sb_epledtClick(Sender: TObject);
    procedure ChooseCalendarClick(Sender: TObject);
    procedure DBEditNameChsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RbChemClick(Sender: TObject);
    procedure RbShoesClick(Sender: TObject);
    procedure DBEditEpIdNoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd19: TFormHrd19;

implementation

uses
  UnitHrdUtils,unitDMHrdsys;
{$R *.dfm}

var
  pri_arr:TPrvArr;
  CurEmpId,KeyFld: string;
  SelectPhotoFlag:boolean;
  LangStr:TWideStrings;

procedure TFormHrd19.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'hrd19');
  ChangeFormStatus('0');
  InitForm;
end;

procedure TFormHrd19.InitLang;
var
  keys:String;
  i:integer;
begin
SetComponentLang(self);
keys:=keys+'hrd08_titl,hrd08_detail_info,hrd08_commany_info,hrd08_base_info,'
  +'emp_photo,choose_photo,sex_man,sex_woman,marry_over,marry_is,marry_not,'
  +'add,update,save,cancel,close,success,failed,error_date,msg_confirm_save,'
  +'hrd08_name_null,hrd08_indt_null,hrd08_dept_null,hrd08_epId_null,'
  +'hrd08_edu_null,hrd08_chsstatus_null,hrd08_engstatus_null,hrd08_SpcId_null,'
  +'hrd08_factory_null,hrd08_iddate_small,hrd08_leftdate_great_indate,'
  +'hrd08_emp_age_erorr,hrd08_input_leftdate,hrd08_leftdate_must_null,'
  +'save_success,save_fail,with_star_cannot_empty,msg_idcard_repeat,'
  +'msg_no_priv_emp,msg_empid_null,msg_same_spcid,';
LangStr:=GetLangWideStrs(keys);
BtnChoosePhoto.Hint:=GetLangName(LangStr,'choose_photo');
//SheetMain.Caption:=GetLangName(LangStr,'main_page');
end;

procedure TFormHrd19.InitForm();
{*************************************************************************
TO DO:初始化Form元素
參數：無
*************************************************************************}
var
  sql_str,fld_name,edu_name:string;
  i:integer;
begin
  GetDeptRange(CobDept,false);
  //默認鞋廠/化工廠
  if (LeftStr(UserName,1)='N') then
    RbChem.Checked
  else if (LeftStr(UserName,1)='B') and (RightStr(UserName,5)>'10000') then
    RbChem.Checked
  else
    RbShoes.Checked;
  //CobSex
  CobSex.Items.Add('W '+ GetLangName(LangStr,'sex_woman'));
  CobSex.Items.Add('M '+ GetLangName(LangStr,'sex_man'));
  CobSex.ItemIndex:=0;
  //CobIfMarry
  CobIfMarry.Items.Add('0 '+GetLangName(LangStr,'marry_over'));
  CobIfMarry.Items.Add('1 '+GetLangName(LangStr,'marry_is'));
  CobIfMarry.Items.Add('2 '+GetLangName(LangStr,'marry_not'));
  CobIfMarry.ItemIndex:=2;
  CobFactory.ItemIndex:=0;//cobfactory
  //dept_code
  if userLang='E' then
  begin
    fld_name:='dept_code+'' ''+eng_abbr';
    edu_name:='edu_code+'' ''+edu_eng';
  end
  else if userLang='V' then
  begin
    fld_name:='dept_code+'' ''+vim_abbr';
    edu_name:='edu_code+'' ''+edu_vim';
  end
  else
  begin
    fld_name:='dept_code+'' ''+abbr_titl';
    edu_name:='edu_code+'' ''+edu_titl';
  end;
  sql_str:='select '+fld_name+' as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,CobDept);
  //edu_code
  for i:=1 to 21 do
    CobEdu.Items.Add(Format('%.2d', [i]));
  //sql_str:='select '+edu_name+' as edu_name from hrd_educ';
  //SetComboxList(sql_str,TtntComboBox(CobEdu));
  //pst_code
  if userLang='E' then
    fld_name:='pst_code+'' ''+pst_eng'
  else if userLang='V' then
    fld_name:='pst_code+'' ''+pst_vim'
  else
    fld_name:='pst_code+'' ''+pst_chs';
  sql_str:='select '+fld_name+' as pst_name from hrd_prof where pst_code>=''18''';
  SetComboxList(sql_str,CobProf,'60');
  //info_code
  if userLang='E' then
    fld_name:='info_code+'' ''+info_eng'
  else if userLang='V' then
    fld_name:='info_code+'' ''+info_vim'
  else
    fld_name:='info_code+'' ''+info_chs';
  sql_str:='select '+fld_name+' from hrd_inwork ';
  SetComboxList(sql_str,CobInfo,'0');
end;

function TFormHrd19.getNewEmpId():string;
//get emp_id
var
  emp_no:integer;
  emp_str,sqlstr:string;
begin
  if RbChem.Checked then//化工
    sqlstr:='SELECT MAX(emp_id) as emp_id FROM hrd_emp where emp_id<''030000'''
  else//鞋廠
    sqlstr:='SELECT MAX(emp_id) as emp_id FROM hrd_emp';;
  with DMHrdsys.SQLQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    emp_no:=FieldByName('emp_id').asinteger;
    emp_no := emp_no + 1;
    emp_str := Format('%.6d', [emp_no]);
  end;
result:=emp_str;
end;

procedure TFormHrd19.LoadPicFromServer(ImagePhoto:Timage;InputEmpId:string);
{*************************************************************************
TO DO:載入工號對應的照片到圖片中
Param:ImagePhoto-欲加載到圖片；InputEmpId-工號
Author:anil
Create Date:2005-7-25
Modify Date:2005-8-3
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

procedure TFormHrd19.SavePicToServer(EmpId,filename:string);
{*************************************************************************
TO DO:保存工號對應的照片到數據庫中
Param:EmpId-工號；filename-圖片文件對應的路徑和文件名
Author:anil
Create Date:2005-7-25
Modify Date:2005-7-25
*************************************************************************}
var
  Counter: Integer;
  Buffer: PAnsiChar;
  FieldStrm: TStream;
  PicFilestream:Tfilestream;
  tmpext,tmpfilename:string;
begin
  if filename='' then
    exit;
  tmpExt:=extractfileext(filename);
  tmpfilename:=empId+tmpExt;
  with ADODataSetPic do
    try
      PicFilestream:=TFileStream.Create(OpenPictureDialog1.FileName,fmopenRead);//打?文件
      try
        open;
        edit;
        FieldStrm := ADODataSetPic.CreateBlobStream(ADODataSetPic.FieldByName('emp_pict'), bmWrite);
        Counter := PicFilestream.Size;
        GetMem(Buffer, Counter);
        try 
          PicFilestream.ReadBuffer(Buffer^, Counter);
          FieldStrm.WriteBuffer(Buffer^, Counter);
        finally
          FreeMem(Buffer, Counter);
          FieldStrm.Free;
        end;
        fieldbyname('emp_id').AsString:=EmpId;
        fieldbyname('upd_date').AsString:=datetimetostr(date + time);
        fieldbyname('upd_user').AsString:=username;
        fieldbyname('pict_road').AsString:=tmpfilename;
        post;
      finally
        PicFilestream.Free;
      end;
    finally
  end;
end;

procedure TFormHrd19.ChangeFormStatus(flag:char);
{*************************************************************************
TO DO:改變窗口可輸入狀態
參數：flag:0-初始狀態；1-改變狀態時
*************************************************************************}
begin
case flag of
  '0':
    begin
      panelInput.Enabled:=true;
      panelDetail.Enabled:=false;
      panelFooter.Enabled:=false;
      SetEnableSave(false);
    end;
  '1':
    begin
      panelInput.Enabled:=true;
      panelDetail.Enabled:=true;
      panelFooter.Enabled:=true;
      SetEnableSave(false);
      if rbAdd.Checked then
        begin
          EditEmpId.Enabled:=false;
          EditEmpId.Color:=clBtnFace;
        end
      else 
        begin
          //if DBEditNameChs.CanFocus then
            //DBEditNameChs.SetFocus;
          EditEmpId.SetFocus;
          EditEmpId.Color:=clWhite;
        end;
    end;
end;//end case
//priv control
if rbAdd.Checked then
  EditEmpId.Enabled:=false
else
  EditEmpId.Enabled:=true;
if not pri_arr[UPD] then
  begin
    //rbAdd.Checked:=true;
    rbUpd.Enabled:=false;
    //EditEmpId.Enabled:=false;
  end;
if not pri_arr[ADD] then
  rbAdd.Enabled:=false;
//special priv control  
if (rbUpd.Checked) and (not HaveSpcPrv(username,'hrd19')) or (rbInq.Checked) then
  begin
    DBEditEpIdNo.Enabled:=false;
    DTPickEpIndt.Enabled:=false;
  end
else
  begin
    DBEditEpIdNo.Enabled:=true;
    DTPickEpIndt.Enabled:=true;
  end;
end;

procedure TFormHrd19.SetEnableSave(flag:boolean);
begin
if RbInq.Checked then
  flag:=false;//查詢時不可保存
BtnSave.Enabled:=flag;
BtnCancel.Enabled:=flag;
end;

procedure TFormHrd19.ChangeCobData();
{*************************************************************************
TO DO:改變ComboBox元件的值
參數：
*************************************************************************}
begin
if rbadd.Checked then
  begin
    SetComboxIndex(CobSex,'W');
    SetComboxIndex(CobIfMarry,'2');
    SetComboxIndex(CobDept,'-1');
    SetComboxIndex(CobEdu,'-1');
    SetComboxIndex(CobProf,'60');
    SetComboxIndex(CobInfo,'0');
    CobFactory.ItemIndex:=0;
    DTPickepIndt.date:=date;
  end
else
  with AdoDataSet1 do
  begin
    //date
    DTPickepBirth.Date:=FieldByName('epbirth').AsDateTime;
    DTPickepindt.Date:=FieldByName('epindt').AsDateTime;
    //comboBox
    SetComboxIndex(CobSex,FieldByName('epsexd').Value);
    SetComboxIndex(CobIfMarry,FieldByName('ifmarry').Value);
    SetComboxIndex(CobDept,FieldByName('dept_code').Value);
    SetComboxIndex(CobProf,FieldByName('pst_code').Value);
    SetComboxIndex(CobEdu,FieldByName('edu_code').Value,false);
    SetComboxIndex(CobInfo,FieldByName('info_code').Value);
  end;
end;

procedure TFormHrd19.EditEmpIdChange(Sender: TObject);
//get one record by emp_id
var
  sqlstr:string;
begin
if length(EditEmpId.text)=6 then
 begin
  AdoDataSet1.Active:=false;
  AdoDataSet1.CommandText:='select * from hrd_emp WHERE (emp_id = '''+EditEmpId.Text+''')';
  AdoDataSet1.Active:=true;
  SetEnableSave(false);
  if AdoDataSet1.Eof then
  begin
    ImagePhoto.Picture:=Nil;
    WideMessageDlg(GetLangName(LangStr,'msg_empid_null'),mterror,[mbOK],0);
  end
  else
  begin
    sqlstr:='select * from hrd_emp WHERE (emp_id = '''+EditEmpId.Text+''') and '+UserDeptStr;
    if not CheckRecordExist(sqlstr) then
    begin//沒有權限
      AdoDataSet1.Active:=false;
      WideMessageDlg(GetLangName(LangStr,'msg_no_priv_emp'),mterror,[mbOK],0);
      exit;
    end;
    PanelDetail.Enabled:=true;
    LoadPicFromServer(ImagePhoto,EditEmpId.text);
    ChangeFormStatus('1');//改變面板可輸入狀態
    ChangeCobData;//改變
    SetPiccText();//參保狀態
  end;//end EOF
  SelectPhotoFlag:=false;
 end;//end length=6
end;

procedure TFormHrd19.BtnChoosePhotoClick(Sender: TObject);
begin
if OpenPictureDialog1.Execute then
  begin
    imagePhoto.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    SelectPhotoFlag:=true;
    SetEnableSave(true);
  end;
end;

function TFormHrd19.CheckInputValid():boolean;
{*************************************************************************
TO DO:提交前檢查輸入的有效性
*************************************************************************}
begin
  if trim(DBEditNameChs.Text)='' then
    begin//中文姓名
      WideMessageDlg(GetLangName(LangStr,'hrd08_name_null'),mterror,[mbOK],0);
      DBEditNameChs.SetFocus;
      result:=false;
      exit;
    end;
  if trim(DBEditEpIdNo.Text)='' then
    begin//身份證號
      WideMessageDlg(GetLangName(LangStr,'hrd08_epId_null'),mterror,[mbOK],0);
      DBEditEpIdNo.SetFocus;
      result:=false;
      exit;
    end;
  if trim(EditEmpId.Text)='' then
    if CheckRecordExist('select * from hrd_emp where epid_no='''+trim(DBEditEpIdNo.Text)+'''') then
    begin//新增時身份證號不能重復
      WideMessageDlg(GetLangName(LangStr,'msg_idcard_repeat'),mterror,[mbOK],0);
      DBEditEpIdNo.SetFocus;
      result:=false;
      exit;
    end;
  if trim(CobEdu.Text)='' then
    begin//學歷代號
      WideMessageDlg(GetLangName(LangStr,'hrd08_edu_null'),mterror,[mbOK],0);
      CobEdu.SetFocus;
      result:=false;
      exit;
    end;
 { if trim(DBCobEngStatus.Text)='' then
    begin//英文程度
      WideMessageDlg(GetLangName(LangStr,'hrd08_engstatus_null'),mterror,[mbOK],0);
      DBCobEngStatus.SetFocus;
      result:=false;
      exit;
    end;
  if trim(DBCobChsStatus.Text)='' then
    begin//中文程度
      WideMessageDlg(GetLangName(LangStr,'hrd08_chsstatus_null'),mterror,[mbOK],0);
      DBCobChsStatus.SetFocus;
      result:=false;
      exit;
    end;}
  if trim(CobDept.Text)='' then
    begin//部門代號
      WideMessageDlg(GetLangName(LangStr,'hrd08_dept_null'),mterror,[mbOK],0);
      CobDept.SetFocus;
      result:=false;
      exit;
    end;
  {if trim(DBEditSpcId.Text)='' then
    begin//識別卡號
      WideMessageDlg(GetLangName(LangStr,'hrd08_SpcId_null'),mterror,[mbOK],0);
      DBEditSpcId.SetFocus;
      result:=false;
      exit;
    end;}
  if CheckRecordExist('select * from hrd_emp where spc_id='''+trim(DBEditSpcId.Text)+''' and emp_id<>'''+trim(EditEmpId.Text)+''' and epledt is null') then
    begin//識別卡號不能重复
      WideMessageDlg(GetLangName(LangStr,'msg_same_spcid'),mterror,[mbOK],0);
      DBEditSpcId.SetFocus;
      result:=false;
      exit;
    end;
  if (DTPickEpindt.Date-DTPickepBirth.Date<5840) then
    begin//進廠未滿16周歲
      WideMessageDlg(GetLangName(LangStr,'hrd08_emp_age_erorr'),mterror,[mbOK],0);
      DTPickepBirth.SetFocus;
      result:=false;
      exit;
    end;
{  if trim(CobFactory.Text)='' then
    begin//廠區
      WideMessageDlg(GetLangName(LangStr,'hrd08_factory_null'),mterror,[mbOK],0);
      CobFactory.SetFocus;
      result:=false;
      exit;
    end;}
  if ((leftstr(CobInfo.Text,1)='0') or (leftstr(CobInfo.Text,1)='B')) and (DBeditLedt.Text<>'') then
    begin//不能輸入離職日期
      WideMessageDlg(GetLangName(LangStr,'hrd08_leftdate_must_null'),mterror,[mbOK],0);
      DBeditLedt.SetFocus;
      result:=false;
      exit;
    end;
  if ((leftstr(CobInfo.Text,1)<>'0') and (leftstr(CobInfo.Text,1)<>'B')) and (DBeditLedt.Text='') then
    begin//請輸入離職日期
      WideMessageDlg(GetLangName(LangStr,'hrd08_input_leftdate'),mterror,[mbOK],0);
      DBeditLedt.SetFocus;
      result:=false;
      exit;
    end;
  if (DBeditLedt.Text<>'') and (strtodatetime(DBeditLedt.Text)<DTPickepInDt.Date) then
    begin//離職日期需大於進廠日期
      WideMessageDlg(GetLangName(LangStr,'hrd08_leftdate_great_indate'),mterror,[mbOK],0);
      DTPickepBirth.SetFocus;
      result:=false;
      exit;
    end;
{  if (DBeditiddt.Text<>'') and (strtodatetime(DBeditiddt.Text)-DTPickepBirth.Date<5840) then
    begin//身份證頒發日期未滿16周歲
      WideMessageDlg(GetLangName(LangStr,'hrd08_iddate_small'),mterror,[mbOK],0);
      DTPickepBirth.SetFocus;
      result:=false;
      exit;
    end;                 }
  result:=true;
end;

procedure TFormHrd19.BtnSaveClick(Sender: TObject);
//save data
var
  cksql:string;
begin
if wideMessageDlg(GetLangName(LangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
  exit;
if not CheckInputValid then
  exit;
AdoDataSet1.edit;
if EditEmpId.Text='' then
begin//新增
  curEmpId := getNewEmpId;//產生新工號
  AdoDataSet1.Fields.FieldByName('emp_id').Value:=curEmpId;
end
else
begin//修改
  curEmpId:=EditEmpId.Text;
  if (AdoDataSet1.FieldByName('dept_code').Value<>leftstr(CobDept.Text,6)) or (AdoDataSet1.FieldByName('pst_code').Value<>leftstr(CobProf.Text,2)) then
    SaveDeptLog;//修改部門,職稱log
end;
//以下字段重新賦值
with AdoDataSet1.Fields do
  begin
    FieldByName('upd_user').Value:=username;
    FieldByName('upd_date').AsDateTime:=GetServerDatetime;
    FieldByName('epindt').AsDateTime:=DTPickepIndt.Date;
    FieldByName('epbirth').AsDateTime:=DTPickepBirth.Date;
    FieldByName('epsexd').Value:=leftstr(CobSex.Text,1);
    FieldByName('ifmarry').Value:=leftstr(CobIfMarry.Text,1);
    FieldByName('dept_code').Value:=leftstr(CobDept.Text,6);
    FieldByName('pst_code').Value:=leftstr(CobProf.Text,2);
    FieldByName('edu_code').Value:=leftstr(CobEdu.Text,2);
    FieldByName('info_code').Value:=leftstr(Cobinfo.Text,1);
    FieldByName('factory').Value:=leftstr(CobFactory.Text,1);
  end;
//離職員工
cksql:='select * from hrd_epleav where emp_id='''+curEmpId+'''';
with DMHrdsys.ADOCommand1 do
  begin
    if AdoDataSet1.FieldByName('epledt').Value<>null then
      if not CheckRecordExist(cksql) then
        begin
          CommandText:='insert into hrd_epleav(upd_user,emp_id,leav_date,leav_reason) values('''+username+''','''+curEmpId+''','''+AdoDataSet1.FieldByName('epledt').AsString+''','''+AdoDataSet1.FieldByName('info_code').Value+''')';
          Execute;
        end;
    if AdoDataSet1.FieldByName('epledt').Value=null then
      if CheckRecordExist(cksql) then
        begin
          CommandText:='delete from hrd_epleav where emp_id='''+curEmpId+'''';
          Execute;
        end;
  end;
try
  //重新打開當前工號
  with AdoDataSet1 do
    begin
      UpdateBatch;
      Active:=false;
      CommandText:='select * from hrd_emp WHERE (emp_id = '''+curEmpId+''')';
      Active:=true;
    end;
  rbUpd.Checked:=true;
  if SelectPhotoFlag then
    SavePicToServer(CurEmpId,OpenPictureDialog1.FileName);//保存圖片
  WideShowMessage(GetLangName(LangStr,'save_success'));
except
  WideShowMessage(GetLangName(LangStr,'save_fail'));
end;
ChangeFormStatus('1');
ChangeCobData;
//SetStatusText('ok');
end;

procedure TFormHrd19.BtnCancelClick(Sender: TObject);
//cancel modify
begin
AdoDataSet1.CancelBatch;
ChangeFormStatus('1');
ChangeCobData;
end;

procedure TFormHrd19.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  SetEnableSave(true);
end;

procedure TFormHrd19.rbUpdClick(Sender: TObject);
begin
adodataset1.Active:=true;
adodataset1.Prior;
EditEmpId.Enabled:=true;
sb_FindEmp.Enabled:=true;
EditEmpId.SetFocus;
if adodataset1.FieldValues['emp_id']<>null then
  EditEmpId.Text:=adodataset1.FieldValues['emp_id'];
ChangeFormStatus('1');
imagePhoto.Picture:=nil;
SelectPhotoFlag:=false;
SetEnableSave(false);
Edit_picc.Visible:=true;
Label_picc.Visible:=true;
end;

procedure TFormHrd19.rbAddClick(Sender: TObject);
begin
//messageboxw(PanelTitle.Handle,pwidechar(GetLangName(LangStr,'hrd08_titl')),pwidechar(GetLangName(LangStr,'hrd08_titl')),1);
adodataset1.Active:=true;
adodataset1.Append;
ChangeFormStatus('1');
EditEmpId.Text:='';
ChangeCobData;
EditEmpId.Enabled:=false;
sb_FindEmp.Enabled:=false;
//DBEditNameChs.SetFocus;
imagePhoto.Picture:=nil;
SelectPhotoFlag:=false;
SetEnableSave(false);
Edit_picc.Visible:=false;
Label_picc.Visible:=false;
end;

procedure TFormHrd19.CobSexChange(Sender: TObject);
begin
SetEnableSave(true);
end;

procedure TFormHrd19.sb_FindEmpClick(Sender: TObject);
begin
  editempid.Text:=FindEmpId('emp_id');
end;

procedure TFormHrd19.CobInfoChange(Sender: TObject);
//在職狀態与離職日期檢查
begin
SetEnableSave(true);     
ADODataSet1.Edit;
if (leftstr(CobInfo.Text,1)='0') or (leftstr(CobInfo.Text,1)='B') then
  begin
    ADODataSet1.FieldByName('epledt').Value:=null;// DBeditLedt.Text:='';
    DBeditLedt.Enabled:=false;
    sb_epledt.Enabled:=false;
  end
else
  begin
    if ADODataSet1.FieldByName('epledt').Value=null then
      ADODataSet1.FieldByName('epledt').AsDateTime:=Date;
    DBeditLedt.Enabled:=true;
    sb_epledt.Enabled:=true;
  end;  
end;

procedure TFormHrd19.sb_epledtClick(Sender: TObject);
begin
  KeyFld:=midstr(TtntspeedButton(sender).Name,4,length(TtntspeedButton(sender).Name));
  with ChooseCalendar do
    begin
      ChooseCalendar.Parent:=PanelDetail;
      top:=TtntspeedButton(sender).Top+TtntspeedButton(sender).Parent.Parent.Top;
      left:=TtntspeedButton(sender).Left+40;
      Visible:=true;
    end;  
end;

procedure TFormHrd19.ChooseCalendarClick(Sender: TObject);
begin
  ChooseCalendar.Visible:=false;
  ADODataSet1.Edit;
  ADODataSet1.FieldByName(KeyFld).AsDateTime:=ChooseCalendar.Date;
end;

procedure TFormHrd19.SetPiccText();
var
  sql_str:string;
begin
  sql_str:='select * from hrd_picc where emp_id='''+EditEmpId.text+'''';
  if CheckRecordExist(sql_str) then
    Edit_picc.Text:='1'
  else
    Edit_picc.Text:='0';
end;

procedure TFormHrd19.DBEditNameChsKeyDown(Sender: TObject; var Key: Word;
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

procedure TFormHrd19.RbChemClick(Sender: TObject);
begin
  DBEditEpIdNo.MaxLength:=10;
end;

procedure TFormHrd19.RbShoesClick(Sender: TObject);
begin
  DBEditEpIdNo.MaxLength:=9;
end;

procedure TFormHrd19.SaveDeptLog;
//部門，職稱修改時寫hrd_emp_log
var
  sqlstr,pst_old,pst_new,dept_old,dept_new,up_date:string;
begin
  up_date:=FormatDateTime('yyyy/mm/dd hh:nn:ss',GetServerDateTime);
  pst_old:=ADODataSet1.FieldByName('pst_code').AsString;
  dept_old:=ADODataSet1.FieldByName('dept_code').AsString;
  pst_new:=LeftStr(CobProf.Text,2);
  dept_new:=LeftStr(CobDept.Text,6);
  //改變廠區
  ADODataSet1.Edit;
  ADODataSet1.FieldByName('factory').AsString:=LeftStr(dept_new,1);
  //寫log檔
  sqlstr:='insert into hrd_emp_upd values('''+username+''','''+up_date+''','''+CurEmpId+''','
    +''''+pst_old+''','''+dept_old+''','''+pst_new+''','''+dept_new+''','''+up_date+''')';
  with DMHrdsys.ADOCommand1 do
  begin
    CommandText:=sqlstr;
    Execute;
  end;
end;

procedure TFormHrd19.DBEditEpIdNoExit(Sender: TObject);
begin
  if Length(DBEditEpIdNo.Text)>8 then
  begin//檢查身份證
    if CheckRecordExist('select * from hrd_emp where epid_no='''+trim(DBEditEpIdNo.Text)+''' and emp_id<>'''+trim(EditEmpId.Text)+'''') then
    begin//身份證號不能重復
      WideMessageDlg(GetLangName(LangStr,'msg_idcard_repeat'),mterror,[mbOK],0);
      DBEditEpIdNo.SetFocus;
      exit;
    end;
  end;
end;

end.

