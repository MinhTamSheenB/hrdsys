{*************************************************************************
name：人事系統主程序
author: anil
create date:2005-07-12
modify date:2005-07-28
commentate:人事系統的主界面,及系統初始化.
*************************************************************************}
unit UnitHrdMain;

interface

uses
  Windows, Messages, SysUtils,StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  ToolWin, ComCtrls, Menus, jpeg, ExtCtrls,
  Buttons, ShellAPI, ImgList, DBXpress, DB,qt,
  TntStdCtrls,TntButtons,TntComCtrls,TntMenus,WSDLIntf,tntDialogs,tntforms,
  IniFiles, TntExtCtrls, DateUtils;


const//{全局常量,對整個系統生效}
  SYS_CODE = 'H';//系統代號
  SYS_NAME = 'hrdsys';//系統名稱
type
  ThrdMainForm = class(TtntForm)
    Panel2: TPanel;
    MainMenu1: TTntMainMenu;
    N1: TTntMenuItem;
    N3: TTntMenuItem;
    N2: TTntMenuItem;
    PopupMenu1: TtntPopupMenu;
    NPClose: TtntMenuItem;
    StatusBar1: TtntStatusBar;
    PageControl1: TTntPageControl;
    PanelTopIcon: TPanel;
    ImageMin: TImage;
    ImageClose: TImage;
    Panel4: TPanel;
    StatusBar2: TTntStatusBar;
    ProgressBar1: TProgressBar;
    SheetMain: TTntTabSheet;
    TntPanel1: TTntPanel;
    TntPanel2: TTntPanel;
    TntPageControl1: TTntPageControl;
    TntTabSheet7: TTntTabSheet;
    TntTabSheet8: TTntTabSheet;
    TntTabSheet9: TTntTabSheet;
    TntTabSheet12: TTntTabSheet;
    TntTabSheet13: TTntTabSheet;
    TntGroupBox1: TTntGroupBox;
    Formhrd07: TTntStaticText;
    Formhrd12: TTntStaticText;
    FormHrd10: TTntStaticText;
    Formhrd11: TTntStaticText;
    Formhrd17: TTntStaticText;
    TntPanel3: TTntPanel;
    TntPanel4: TTntPanel;
    TntPanel5: TTntPanel;
    TntPanel6: TTntPanel;
    TntPanel7: TTntPanel;
    TntPanel8: TTntPanel;
    TntGroupBox2: TTntGroupBox;
    Formhrd14: TTntStaticText;
    FormHrd13: TTntStaticText;
    TntGroupBox3: TTntGroupBox;
    FormDut05: TTntStaticText;
    FormDut10: TTntStaticText;
    FormDut06: TTntStaticText;
    FormDut08: TTntStaticText;
    TntPanel9: TTntPanel;
    TntPanel10: TTntPanel;
    TntPanel11: TTntPanel;
    TntPanel12: TTntPanel;
    TntPanel13: TTntPanel;
    TntPanel14: TTntPanel;
    FormDut01: TTntStaticText;
    FormDut03: TTntStaticText;
    FormDut02: TTntStaticText;
    FormDut04: TTntStaticText;
    FormDut07: TTntStaticText;
    TntPanel15: TTntPanel;
    TntPanel16: TTntPanel;
    TntPanel17: TTntPanel;
    TntPanel18: TTntPanel;
    TntPanel19: TTntPanel;
    TntPanel20: TTntPanel;
    TntPanel21: TTntPanel;
    FormDut13: TTntStaticText;
    FormDut20: TTntStaticText;
    TntPanel22: TTntPanel;
    TntGroupBox4: TTntGroupBox;
    FormDut16: TTntStaticText;
    FormDut12: TTntStaticText;
    FormDut21: TTntStaticText;
    FormDut18: TTntStaticText;
    FormDut19: TTntStaticText;
    FormDut17: TTntStaticText;
    FormDut14: TTntStaticText;
    TntStaticText26: TTntStaticText;
    TntGroupBox5: TTntGroupBox;
    FormSal01: TTntStaticText;
    FormSal04: TTntStaticText;
    FormSal06: TTntStaticText;
    FormSal03: TTntStaticText;
    FormSal08: TTntStaticText;
    TntPanel23: TTntPanel;
    TntPanel24: TTntPanel;
    TntPanel25: TTntPanel;
    TntPanel26: TTntPanel;
    TntPanel27: TTntPanel;
    TntPanel28: TTntPanel;
    TntPanel29: TTntPanel;
    TntPanel30: TTntPanel;
    FormSal09: TTntStaticText;
    TntGroupBox6: TTntGroupBox;
    FormSal10: TTntStaticText;
    FormSal11: TTntStaticText;
    FormSal12: TTntStaticText;
    TntGroupBox7: TTntGroupBox;
    Formmed08: TTntStaticText;
    TntStaticText37: TTntStaticText;
    TntStaticText38: TTntStaticText;
    TntStaticText39: TTntStaticText;
    TntPanel31: TTntPanel;
    TntPanel32: TTntPanel;
    TntPanel33: TTntPanel;
    TntPanel34: TTntPanel;
    TntPanel35: TTntPanel;
    TntPanel36: TTntPanel;
    Formmed01: TTntStaticText;
    Formmed02: TTntStaticText;
    Formmed05: TTntStaticText;
    Formmed06: TTntStaticText;
    Formmed04: TTntStaticText;
    TntPanel37: TTntPanel;
    TntPanel38: TTntPanel;
    TntPanel39: TTntPanel;
    TntPanel40: TTntPanel;
    TntPanel41: TTntPanel;
    TntPanel42: TTntPanel;
    TntPanel43: TTntPanel;
    TntStaticText45: TTntStaticText;
    TntStaticText46: TTntStaticText;
    TntPanel44: TTntPanel;
    TntGroupBox8: TTntGroupBox;
    Formmed09: TTntStaticText;
    Formmed07: TTntStaticText;
    Formmed12: TTntStaticText;
    Formmed15: TTntStaticText;
    Formmed13: TTntStaticText;
    TntStaticText52: TTntStaticText;
    TntGroupBox9: TTntGroupBox;
    formfhrd105: TTntStaticText;
    formfhrd304: TTntStaticText;
    formfhrd301: TTntStaticText;
    formfhrd102: TTntStaticText;
    TntPanel45: TTntPanel;
    TntPanel47: TTntPanel;
    TntPanel48: TTntPanel;
    TntPanel49: TTntPanel;
    TntPanel50: TTntPanel;
    formfhrd103: TTntStaticText;
    formfhrd104: TTntStaticText;
    formfhrd302: TTntStaticText;
    formfhrd303: TTntStaticText;
    formfhrd101: TTntStaticText;
    TntPanel51: TTntPanel;
    TntPanel52: TTntPanel;
    TntPanel53: TTntPanel;
    TntPanel54: TTntPanel;
    TntPanel55: TTntPanel;
    TntPanel56: TTntPanel;
    TntPanel57: TTntPanel;
    formfhrd201: TTntStaticText;
    formfhrd203: TTntStaticText;
    TntPanel58: TTntPanel;
    TntGroupBox10: TTntGroupBox;
    formfhrd306: TTntStaticText;
    formfhrd401: TTntStaticText;
    formfhrd305: TTntStaticText;
    formfhrd307: TTntStaticText;
    formfhrd402: TTntStaticText;
    TntStaticText19: TTntStaticText;
    PopupMenuNil: TTntPopupMenu;
    TntTabSheet1: TTntTabSheet;
    BtnJixiao: TTntBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure InitForm;
    procedure InitLang;
    procedure showSubForm(Sender: TObject);
    procedure addMainButton(Sender:TtntGroupBox;Sender2:TScrollBox);
    procedure addSubMenu(Sender:TtntmenuItem;act_flag:char);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure NPCloseClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure TntFormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageControl1Change(Sender: TObject);
    procedure ImageMinClick(Sender: TObject);
    procedure SheetMainShow(Sender: TObject);
    procedure SheetMainHide(Sender: TObject);
    procedure TntFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TitleMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure hrd08MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure BtnJixiaoClick(Sender: TObject);
    procedure TntStaticText5Click(Sender: TObject);
    procedure TntStaticText1Click(Sender: TObject);
    procedure TntStaticText2Click(Sender: TObject);
    procedure TntStaticText4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  hrdMainForm: ThrdMainForm;
   function GetSunDayCount(DayBeg,DayEnd:Integer;YearMonth:String):Integer;
implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitRegForm, UnitHrd08;
var
  LangStr:TWideStrings;
  DebugMode:boolean;
  PreSText:TtntStaticText;
{$R *.dfm}

{*************************************************************************
過程名稱：SetPubVars
功    能：初始化時設置全局變量
*************************************************************************}
procedure SetPubVars;
var
  sIp :string;
  //
  sEndOfLockMonth: string;
begin
  //DebugMode := false;//是否位于調試模式
  with DMHrdsys.SQLQuery1 do
  begin//系統變量賦值
    close;
    sql.Clear;
    sql.Add('select * from erp_param where sys_code='''+SYS_CODE+'''');
    Open;
    if not Eof then
    begin
      RunMode:=FieldByName('run_mode').AsString;
      IsDebug:=FieldByName('is_debug').AsString;
      LockMonth:=FieldByName('lock_month').AsString;
      LockMonthPart:=FieldByName('lock_month_part').AsString;
      DebugUser:=FieldByName('debug_user').AsString;
    end
    else
    begin//默認值
      RunMode:='2';//檢查模式
      IsDebug:='0';//菲調試
      LockMonth:=FormatDateTime('yyyymm',date-45);
      LockMonthPart:=FormatDateTime('yyyymm',date-42);
    end;
    sEndOfLockMonth := FormatDateTime('YYYY/MM/DD',EndOfAMonth(StrToInt(LeftStr(LockMonth,4)),StrToInt(RightStr(LockMonth,2))));
  end;

  //
  LockLeaveDate:=DB_GetSRecord('SELECT name_cn FROM hrd_basic WHERE class=''lock_leave_date'' and code=''0'''); //取得離職鎖定日期
  //
  LockLeaveDate:= StringReplace(LockLeaveDate, '-', '/', [rfReplaceAll]);
  // 如果離職鎖定日期早於薪資已計算月份最後一天，則以薪資計算月份最後一天為鎖定日期
  if sEndOfLockMonth>LockLeaveDate then
    LockLeaveDate := sEndOfLockMonth;

  if (paramstr(1)='') or (paramstr(2)='') then
  if IsDebug='1' then//調試模式
  begin
    sIp:=GetUserIp;
    if (sIp ='192.168.22.2') or (sIp ='192.168.7.33') then//調試模式
    begin
      userName:= 'B498077'; //adam b060071 f060740 adam F060740 stella.lin ,F810230 A200026 F810002  F060740
      G_sFactory:='F';//F:fuluh,V:adidas
      G_sFactory:=AnalysisFactory();//F:fuluh,V:adidas
      //
      userLang:='C';//C,E,V
      exit;
    end
    else
      Application.Terminate
  end;
  if (paramstr(1)='') or (paramstr(2)='') then
   // Application.Terminate
  else
  begin
    userName:=paramstr(1);
    userLang:=paramstr(2);
    G_sFactory:=AnalysisFactory();//F:fuluh,V:adidas
  end;
  //2012-09-07 hyt add
  if (G_sFactory='V') or (G_sFactory='F') then
  else
  begin
    Application.Terminate;
  end;
end;

procedure THrdMainForm.InitLang;
var
  keys:String;
begin
  SetComponentLang(self); //2013-03-05 hyt add

  keys:=SYS_NAME+'_titl,date,time,user,hint,query,print,transferfiles,quit,'
    +'sys_menu,other_prg,confirm_close,confirm_close_all,is_confirm_quit,'
    +'main_page,havenot_priv,havenot_prg,while_open';
  LangStr:=GetLangWideStrs(keys);
  SheetMain.Caption:=GetLangName(LangStr,'main_page');
  N1.Caption:=GetLangName(LangStr,'sys_menu');
  N2.Caption:=GetLangName(LangStr,'main_page');
  N3.Caption:=GetLangName(LangStr,'quit');
  hrdmainform.Caption:=GetLangName(LangStr,SYS_NAME+'_titl');
  //2012-09-07 hyt add
  if G_sFactory='F' then
    hrdmainform.Caption:=hrdmainform.Caption+' Mizuno(2016.09.16)'
  else
    hrdmainform.Caption:=hrdmainform.Caption+' Adidas'
end;

procedure THrdMainForm.InitForm;
{**********************************************************
To Do：初始化創建主窗体元素
author: anil
modify date:2005-07-15
**********************************************************}
var
  SelectSQL:string;
  str_cate2:TStringList;
  i:integer;
  TmpTsheet:Ttnttabsheet;
  tmpMItem:TtntmenuItem;
  tmpgrpbox,tmpgrpbox2:Ttntgroupbox;
  TmpSolBox:TScrollBox;
begin
  str_cate2:=TstringList.Create;
  str_cate2.Add('U');
  str_cate2.Add('P');
  str_cate2.Add('T');
  SelectSQL:='select * from sys_cate where sys_id ='''+SYS_CODE+'''';
  With DMHrdsys.SQLQuery1 do
  begin
    close;
    SQL.Clear;
    SQL.Add(SelectSQL);
    try
      open;
    except
      exit;
    end;
    while not Eof do
    begin
      //add pageSheet
     // tmpTSheet:=Ttnttabsheet.Create(self);
   //   tmpTSheet.BorderWidth:=0;
   //   tmpTSheet.PageControl:=Pagecontrol1;
   //   if UserLang='V' then
  //      tmpTSheet.Caption:=FieldByName('cate_name_vim').value
   //   else if UserLang='E' then
  //      tmpTSheet.Caption:=FieldByName('cate_name_eng').value
   //   else
     //   tmpTSheet.Caption:=FieldByName('cate_name_chs').value;
      //add cate groupbox
   //   tmpgrpbox:=Ttntgroupbox.Create(self);
   //   with tmpgrpbox do
   //   begin
   //     Name:='grpboxH'+trim(FieldByName('sys_cate').AsString);
   //     Font.Color:=$00FF0000;
   //     Font.Style:=[fsbold];
   //     Font.Size:=12;
   //     Parent:=tmpTsheet;
   //     Width:=Parent.Width;
   //     Height:=Parent.Height;// - 30;
  //      Top:=  0;
 //       Left:=(Parent.Width-Width) div 2;//tmpTsheet.Width div 20;
        //Color:=$00FFFFFF;//clMoneyGreen;//$0055CCFF;
//        Caption:=tmpTSheet.Caption;
//      end;
      //add cate2 groupbox
//      for i:=0 to 2 do
//      begin
//      TmpSolBox:=TScrollBox.Create(self);
//      with TmpSolBox do
//      begin
//        Name:='SolBox'+trim(FieldByName('sys_cate').AsString)+str_cate2.Strings[i];
//        Font.Color:=$00FF0000;
//        Parent:=tmpgrpbox;
//        Width:=(Parent.Width-10) div 3 - 10 ;
//        Height:=Parent.Height - 30;
//        Top:=20;
//        Left:=(Width+10)*i+10;
//        Ctl3D:=false;
//        Color:=$0055CCFF;//$0055CCFF;
//        BorderStyle:=bsNone;
//        Caption:=str_cate2.Strings[i];
//      end;
  //    addMainButton(tmpgrpbox,TmpSolBox); // add main panel button
    //  end;
      //add menu
      tmpMItem:=TtntMenuItem.Create(self);
      tmpMItem.Name:='N'+Trim(FieldByName('sys_cate').AsString);
      if UserLang='V' then
         tmpMItem.Caption:=(FieldByName('cate_name_vim').Value)
      else if UserLang='E' then
         tmpMItem.Caption:=Trim(FieldByName('cate_name_eng').Value)
      else
         tmpMItem.Caption:=(FieldByName('cate_name_chs').Value);
      //tmpMItem.Caption:=Trim(FieldByName('cate_name_chs').AsString);
      addSubMenu(tmpMItem,'U'); // add sub menu
      mainmenu1.Items.Add(tmpMItem);
      Next;
    end;
  end;
end;

procedure THrdMainForm.addMainButton(Sender:TtntGroupBox;Sender2:TScrollBox);
{**********************************************************
To Do：動態增加主面板按鈕
author: anil
modify date:2005-07-15
**********************************************************}
var
  TmpBtn:Ttntbutton;
  TmpSText:TtntStaticText;
  SelectSQL,cate_str,cate2_str:string;
  k:integer;
begin
 // cate_str:=rightstr(Sender.Name,1);
//  cate2_str:=rightstr(Sender2.Name,1);
//  k:=0;
//  SelectSQL:='select * from sys_form where sys_id =''H'' and form_cate='''
//    +cate_str+''' and form_cate2='''+cate2_str+''' and main_is_show=''1''';
//  With DMHrdsys.SQLQuery2 do
//  begin
//    close;
//    SQL.Clear;
//    SQL.Add(SelectSQL);
//    try
//      open;
//    except
//      exit;
//    end;
//    while not Eof do
//    begin
//      tmpBtn:=TtntButton.Create(self);
//      TmpSText:=TtntStaticText.Create(self);
//      with TmpSText do
//      begin
//        Parent:=Sender2;
//        Name:='Btn'+Trim(FieldByName('form_id').AsString);
//        if UserLang='V' then
//          Caption:=(FieldByName('form_vim').Value)
//        else if UserLang='E' then
//          Caption:=(FieldByName('form_eng').Value)
//        else
//          Caption:=(FieldByName('form_chs').Value);
//        Width:=225;
//        Left:=(Sender2.Width-Width) div 2;
//        Top:=k*30+20;
 //       Height:=30;
 //       autosize:=false;
        //BorderStyle:=sbsSingle;
  //      font.Color:=$00000000;
  //      font.Style:=[fsBold];
 //       OnMouseMove:=TitleMouseMove;
 //       OnClick:=showSubForm;
        //if debugMode show info
//        if debugMode then
//          Caption:=Caption+Fieldbyname('form_id').AsString+' '+FieldByName('author_flag').AsString;
//        Next;
//        k:=k+1;
//      end;
//    end;
//  end;
{  //other
    tmpBtn:=TtntButton.Create(self);
    tmpBtn.Caption:=GetLangName(LangStr,'other_prg');//'其他程序';
    tmpBtn.Name:='BtnOther'+cate_str;
    tmpBtn.Parent:=Sender;
    tmpBtn.Width:=160;
    tmpBtn.Left:=((k mod 3)+1)*(sender.Width div 3) -180;
    tmpBtn.Top:=(k div 3)*40+30;
    tmpBtn.Enabled:=false;}
end;

procedure THrdMainForm.addSubMenu(Sender:TtntmenuItem;act_flag:char);
{**********************************************************
To Do：動態增加子菜單
author: anil
modify date:2005-07-15
**********************************************************}
var
  tmpMItem:TtntmenuItem;
  SelectSQL,cate_str,tmp_str:string;
begin
  cate_str:=rightstr(Sender.Name,1);
  SelectSQL:='select * from sys_form '+
             'where sys_id ='''+SYS_CODE+''' '+
             'and form_cate='''+ cate_str +''' '+
             'and form_cate2='''+act_flag+''' '+
             'and main_is_show=''1'' and len(form_id)<>6 ';
  With DMHrdsys.SQLQuery2 do
  begin
    close;
    SQL.Clear;
    SQL.Add(SelectSQL);
    try
      open;
    except
      exit;
    end;
    while not Eof do
    begin
      tmpMItem:=TtntMenuItem.Create(self);
      tmpMItem.Name:='Hmnn'+Trim(FieldByName('form_id').AsString);
      tmp_str:=FieldByName('form_vim').Value;
      if UserLang='V' then
        tmpMItem.Caption:=(FieldByName('form_vim').Value)
      else if UserLang='E' then
        tmpMItem.Caption:=(FieldByName('form_eng').Value)
      else
        tmpMItem.Caption:=(FieldByName('form_chs').Value);
      tmpMItem.Caption:=tmpMItem.Caption+'('+FieldByName('form_id').AsString+')';
//      if debugMode then
//        tmpMItem.Caption:=tmpMItem.Caption+' '+FieldByName('author_flag').AsString;
      tmpMItem.OnClick := showSubForm; //menu event
      Sender.Add(tmpMItem);
      Next;
    end;
  end;
  if act_flag='U' then
  begin
  //separate line
  tmpMItem:=TtntMenuItem.Create(self);
  tmpMItem.Caption:='-';
  Sender.Add(tmpMItem);
  //print
  tmpMItem:=TtntMenuItem.Create(self);
  tmpMItem.Caption:=GetLangName(LangStr,'query')+'/'+GetLangName(LangStr,'print');//'列印';
  tmpMItem.Name:='NP'+rightstr(Sender.Name,1);
  addSubMenu(tmpMItem,'P');
  Sender.Add(tmpMItem);
  //select
  tmpMItem:=TtntMenuItem.Create(self);
  tmpMItem.Caption:=GetLangName(LangStr,'transferfiles');//'轉檔';
  tmpMItem.Name:='NS'+rightstr(Sender.Name,1);
  addSubMenu(tmpMItem,'T');
  Sender.Add(tmpMItem);
  end;
end;

procedure THrdMainForm.showSubForm(Sender: TObject);
{**********************************************************
To Do：菜單(按鈕)事件:動態創建Form
Author: anil
Create date:2005-07-12
Modify date:2005-07-28
**********************************************************}
var
  key_str,sqlstr,open_sts, formspc, Filename:string;
  key_caption:widestring;
  tmpForm:TForm;
  tmpFindForm:TComponent;
  tmpFormClass:TFormClass;
  H:Hwnd;
   myinifile:Tinifile;
begin
//  if  TntPageControl1.ActivePageIndex <= 5 then
      key_str:=MidStr(TMenuItem(Sender).Name,5,length(TMenuItem(Sender).Name)-4);
//  else
//     key_str:=MidStr(TMenuItem(Sender).Name,2,length(TMenuItem(Sender).Name));
  if Sender.ClassType=TtntMenuItem then
    key_caption:=TtntMenuItem(Sender).Caption
  else
    key_caption:=TTntStaticText(Sender).Caption;
  //check priv
  //sqlstr:='select * from user_form where user_id='''+username+''' and form_id='''+key_str+'''';
  sqlstr:='select * from sys_form A left join user_form B on A.form_id=B.form_id'
    +' where A.form_id='''+key_str+''' and B.user_id='''+username+''' ' ;//or author_flag='''+username+''')';
  With DMHrdsys.SQLQuery3 do
    begin
      close;
      SQL.Clear;
      SQL.Add(sqlstr);
      try
        open;
      except
        exit;
      end;
      if EOF then
        begin

          wideshowmessage(GetLangName(LangStr,'havenot_priv'));//沒有權限
          exit;
        end;
    end;
  //create form
  // 2008.03.27 <<
   with DMHrdsys.SQLQuery1 do
   begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT form_id FROM  sys_form_spc WHERE form_id='''+key_str+'''');
    Open;
    formspc := '' ;
    if not Eof then
       Formspc := fieldbyname('form_id').AsString 
    else
      formspc := '';
    Close;
  end;
  // 2008.03.27 >>
  Filename:=ExtractFilePath(Paramstr(0))+'system.ini';
  myinifile:=Tinifile.Create(filename);

  if formspc <> ''  then
     begin
        h:=Findwindow(nil ,'grpsys - [grpsys]');
        if  h> 0   then
            myinifile.writestring('status', 'grpsys' , formspc )
        else
           begin
            myinifile.writestring('status', 'grpsys' , 'Formmain' ) ;
            Winexec(PAnsiChar('grpsys.exe '+UserName+' '+' 1' + ' ' + formspc  ), sw_Normal)
           end
     end
  else
     begin
       tmpFormclass := TFormClass(GetClass('TForm'+key_str));
       tmpFindForm:=application.FindComponent('Form'+key_str);
       if (tmpFindForm<>nil) then
          begin
            TForm(tmpFindForm).Show;
            TForm(tmpFindForm).Parent.Show;
          end
       else
          try
            SetStatusText(GetLangName(LangStr,'while_open')+key_caption+'...');
            application.CreateForm(tmpformclass, tmpform);
            tmpform.Name:='Form'+key_str;
            tmpForm.Position:=poDesktopCenter;
            tmpForm.Show;
            tmpForm.ManualDock(PageControl1);
             tmpForm.Parent.Name:='Sheet'+key_str;
            TtntTabSheet(tmpForm.Parent).Name:=key_str;
            TtntTabSheet(tmpForm.Parent).Caption:=key_str;
            TtntTabSheet(tmpForm.Parent).PopupMenu:=PopupMenuNil;
             SetStatusText('');
         except
            on E: Exception do wideshowmessage(GetLangName(LangStr,'havenot_prg'));//'該程序暫無'
         end;
    end;
  //訪問紀錄
  sqlstr:='insert into LogonInfoLog(LogonIp,LogonUser,logonForm,logonSts)'
    +' values('''+GetUserIp+''','''+username+''','''+key_str+''',''open'')';
  With DMHrdsys.ADOCommand1 do
    begin
      CommandText:=sqlstr;
      Execute;
    end;
end;

procedure ThrdMainForm.N2Click(Sender: TObject);
//show Main Page
begin
  PageControl1.Pages[0].Show;
end;

procedure ThrdMainForm.N3Click(Sender: TObject);
//Terminate application
begin
hrdMainForm.Close;
application.Terminate;
end;

procedure ThrdMainForm.FormCreate(Sender: TObject);
begin
  setPubVars;//設置公共變量
  regAllForm;//register all form class(UnitRegForm)
  InitLang;//init language text
  InitForm;//init general form
  StatusBar2.Panels[0].Text:=GetLangName(LangStr,'user')+':'+username;
  StatusBar2.Panels[1].Text:=GetLangName(LangStr,'date')+':'+formatdatetime('yyyy-mm-dd',date);
  panelTopIcon.Left:=self.Width-panelTopIcon.Width-8;
  panelTopIcon.Top:=4;
  panelTopIcon.Hide;
  ProgressBar1.Left:=StatusBar2.Left-ProgressBar1.Width-1;
end;

procedure ThrdMainForm.TntFormClose(Sender: TObject;
  var Action: TCloseAction);
    var   H:Hwnd;
    var i :integer ;
//close all
begin
  if widemessagedlg(GetLangName(LangStr,'is_confirm_quit')+GetLangName(LangStr,SYS_NAME+'_titl'),mtConfirmation,[mbyes,mbno],0)=mryes then
      begin
        for i := 1 to 10 do
          begin
        h:=Findwindow(nil ,'grpsys - [grpsys]');
        if   h=0   then
         // winexec('Calc',SW_RESTORE)
            exit
        else
          begin
            sendmessage(h,wm_close,0,0);   //改成??也???；
          end;
          end;
       Action:=cafree;
      end
  else
    Action:=caNone;
end;

procedure ThrdMainForm.PageControl1Change(Sender: TObject);
begin
  SetStatusText('');
end;

procedure ThrdMainForm.NPCloseClick(Sender: TObject);
{**********************************************************
To Do : free sub form resources
author: anil
modify date:2005-07-28
**********************************************************}
var
  curIndex:integer;
begin
with PageControl1 do
  begin
    curIndex:=ActivePageIndex;
    if curIndex =0 then
      hrdMainForm.close
    else if widemessagedlg(GetLangName(LangStr,'confirm_close'),mtConfirmation,[mbyes,mbno],1)=mryes then
        begin
          Pages[curIndex].Hide;
          Pages[curIndex].Free;
          PageControl1.Pages[curIndex-1].Show;
        end;
  end;  
end;

procedure ThrdMainForm.ImageMinClick(Sender: TObject);
begin
  with PageControl1 do
    if ActivePageIndex = 0 then
      application.Minimize
    else
      PageControl1.Pages[ActivePageIndex-1].Show;
end;

procedure ThrdMainForm.SheetMainShow(Sender: TObject);
begin
  PanelTopIcon.Visible:=false;
end;

procedure ThrdMainForm.SheetMainHide(Sender: TObject);
begin
  PanelTopIcon.Visible:=true;
end;

procedure ThrdMainForm.TntFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{*************************************************************************
TO DO:快捷鍵設置
*************************************************************************}
var
  tmpFindForm,tmpCpt:TComponent;
begin
tmpFindForm:=application.FindComponent('Form'+PageControl1.Pages[PageControl1.ActivePageIndex].name);
if Shift=[ssCtrl] then
  begin
    if key=115 then//ctrl+F4
      begin
        TForm(tmpFindForm).Close;
        PageControl1.Pages[0].Show;
      end;
    if key=83 then//ctrl+s
      begin
        tmpCpt:=TForm(tmpFindForm).FindComponent('BtnSave');
        if tmpCpt<>nil then
          if TtntButton(tmpCpt).Enabled then
            TtntButton(tmpCpt).OnClick(Sender);
      end;
  end;
if Shift=[] then
  begin
    if key=113 then//F2
      begin
        tmpCpt:=TForm(tmpFindForm).FindComponent('BtnSave');
        if tmpCpt<>nil then
          if TtntButton(tmpCpt).Enabled then
            TtntButton(tmpCpt).OnClick(Sender);
      end;
  end;
end;

procedure ThrdMainForm.TitleMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  TheSText:TtntStaticText;
begin
  TheSText:=TtntStaticText(Sender);
  if TheSText=PreSText then
    exit;
  TheSText.Font.Color:=$000000FF;
  if PreSText<>nil then
    PreSText.Font.Color:=$00000000;
  PreSText:=TtntStaticText(Sender);
end;

procedure ThrdMainForm.hrd08MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  TheSText:TtntStaticText;
begin
  TheSText:=TtntStaticText(Sender);
  if TheSText=PreSText then
    exit;
  TheSText.Font.Color:=$000000FF;
  if PreSText<>nil then
    PreSText.Font.Color:=$00000000;
  PreSText:=TtntStaticText(Sender);
end;

procedure ThrdMainForm.BtnJixiaoClick(Sender: TObject);
begin
  Winexec('project2.exe', sw_Normal);
end;

procedure ThrdMainForm.TntStaticText5Click(Sender: TObject);
var
   H:Hwnd;
   myinifile:Tinifile;
  formspc, Filename  :string ;
begin
  Filename:=ExtractFilePath(Paramstr(0))+'system.ini';
  myinifile:=Tinifile.Create(filename);
  formspc := 'grp05' ;
  h:=Findwindow(nil ,'grpsys - [grpsys]');
  if  h> 0   then
      myinifile.writestring('status', 'grpsys' , formspc )
  else
    begin
      myinifile.writestring('status', 'grpsys' , 'Formmain' ) ;
      Winexec(PAnsiChar('grpsys.exe '+UserName+' '+' 1' + ' ' + formspc  ), sw_Normal)  ;
    end ;

end;

procedure ThrdMainForm.TntStaticText1Click(Sender: TObject);
var
   H:Hwnd;
   myinifile:Tinifile;
  formspc, Filename  :string ;
begin
  Filename:=ExtractFilePath(Paramstr(0))+'system.ini';
  myinifile:=Tinifile.Create(filename);
  formspc := 'grp03' ;
  h:=Findwindow(nil ,'grpsys - [grpsys]');
  if  h> 0   then
      myinifile.writestring('status', 'grpsys' , formspc )
  else
    begin
      myinifile.writestring('status', 'grpsys' , 'Formmain' ) ;
      Winexec(PAnsiChar('grpsys.exe '+UserName+' '+' 1' + ' ' + formspc  ), sw_Normal)  ;
    end ;
end;

procedure ThrdMainForm.TntStaticText2Click(Sender: TObject);
var
   H:Hwnd;
   myinifile:Tinifile;
  formspc, Filename  :string ;
begin
  Filename:=ExtractFilePath(Paramstr(0))+'system.ini';
  myinifile:=Tinifile.Create(filename);
  formspc := 'grp02' ;
  h:=Findwindow(nil ,'grpsys - [grpsys]');
  if  h> 0   then
      myinifile.writestring('status', 'grpsys' , formspc )
  else
    begin
      myinifile.writestring('status', 'grpsys' , 'Formmain' ) ;
      Winexec(PAnsiChar('grpsys.exe '+UserName+' '+' 1' + ' ' + formspc  ), sw_Normal)  ;
    end ;
end;

procedure ThrdMainForm.TntStaticText4Click(Sender: TObject);
var
   H:Hwnd;
   myinifile:Tinifile;
  formspc, Filename  :string ;
begin
  Filename:=ExtractFilePath(Paramstr(0))+'system.ini';
  myinifile:=Tinifile.Create(filename);
  formspc := 'grp01' ;
  h:=Findwindow(nil ,'grpsys - [grpsys]');
  if  h> 0   then
      myinifile.writestring('status', 'grpsys' , formspc )
  else
    begin
      myinifile.writestring('status', 'grpsys' , 'Formmain' ) ;
      Winexec(PAnsiChar('grpsys.exe '+UserName+' '+' 1' + ' ' + formspc  ), sw_Normal)  ;
    end ;

end;
{===============================================================================
  函數名稱:GetSunDayCount -- 得到輸入範圍內的星期天數
  參數:    DayBeg -- 開始日期 DayEnd -- 結束日期 YearMonth -- 年月
===============================================================================}
function GetSunDayCount(DayBeg,DayEnd:Integer;YearMonth:String):Integer;
var
  i,Count:Integer;
  SDate,EDate:TDateTime;
begin
  TryEnCodeDate(StrToInt(LeftStr(YearMonth,4)),StrToInt(RightStr(YearMonth,2)),DayBeg,SDate);
  TryEnCodeDate(StrToInt(LeftStr(YearMonth,4)),StrToInt(RightStr(YearMonth,2)),DayEnd,EDate);
  Count:=GetRestDayCount(SDate,EDate);
  {Count:=0;
  for i:=DayBeg to DayEnd do
  begin
    if TryEnCodeDate(StrToInt(LeftStr(YearMonth,4)),StrToInt(RightStr(YearMonth,2)),i,aDay) then
    begin
      if DayOfWeek(aDay)=1 then
        Inc(Count);
    end;
  end;}
  Result:=Count;
end;

end.

