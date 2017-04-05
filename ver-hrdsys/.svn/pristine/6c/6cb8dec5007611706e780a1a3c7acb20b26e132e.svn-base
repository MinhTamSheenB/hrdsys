unit UnitDut07;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, StdCtrls, Buttons, TntButtons, TntStdCtrls, Grids,StrUtils,
  DBGrids, TntDBGrids, ComCtrls, TntComCtrls, ExtCtrls, TntExtCtrls,IniFiles,
  DB, ADODB,TntDialogs, DBClient,DateUtils,WSDLIntf,FileCtrl;
type
  TRunThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure execute;override;
      
  public
    { Public declarations }
  end;
type
  TFormDut07 = class(TTntForm)
    TntPanel1: TTntPanel;
    TntPageControl1: TTntPageControl;
    TntTabSheet1: TTntTabSheet;
    TntTabSheet2: TTntTabSheet;
    TntPanel2: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntGroupBox2: TTntGroupBox;
    sb_Add: TTntSpeedButton;
    sb_Del: TTntSpeedButton;
    sb_Save: TTntSpeedButton;
    sb_post: TTntSpeedButton;
    sb_Recover: TTntSpeedButton;
    dbg_machine: TTntDBGrid;
    TntGroupBox3: TTntGroupBox;
    mm_TestInfo: TTntMemo;
    TntLabel1: TTntLabel;
    cob_Com: TTntComboBox;
    TntLabel2: TTntLabel;
    TntLabel3: TTntLabel;
    TntLabel4: TTntLabel;
    TntBitBtn3: TTntBitBtn;
    rb_TestSingle: TTntRadioButton;
    rb_TestAll: TTntRadioButton;
    bbtn_TestConn: TTntBitBtn;
    cob_BaudRate: TTntComboBox;
    cob_Parity: TTntComboBox;
    cob_DataBit: TTntComboBox;
    TntLabel5: TTntLabel;
    cob_StopBit: TTntComboBox;
    TntPanel3: TTntPanel;
    TntGroupBox4: TTntGroupBox;
    TntGroupBox5: TTntGroupBox;
    TntTabSheet3: TTntTabSheet;
    TntLabel6: TTntLabel;
    rb_ByMch: TTntRadioButton;
    rb_ByFile: TTntRadioButton;
    EditDataFile: TTntEdit;
    sb_SrcFile: TTntSpeedButton;
    TntLabel8: TTntLabel;
    cob_DealData: TTntComboBox;
    TntLabel9: TTntLabel;
    EditSavePath: TTntEdit;
    sb_SavePath: TTntSpeedButton;
    cb_RealGet: TTntCheckBox;
    dbg_DutDtl: TTntDBGrid;
    cob_Machine: TTntComboBox;
    bbtn_ClearMemo: TTntBitBtn;
    TntPanel4: TTntPanel;
    TntGroupBox6: TTntGroupBox;
    TntLabel7: TTntLabel;
    dtp_DutDay: TTntDateTimePicker;
    TntGroupBox7: TTntGroupBox;
    dbg_TrtQry: TTntDBGrid;
    qry_machine: TADOQuery;
    ds_machine: TDataSource;
    bbtn_Start: TTntBitBtn;
    bbtn_Stop: TTntBitBtn;
    bbtn_Clear: TTntBitBtn;
    OpenDialog: TTntOpenDialog;
    cob_DeptBeg: TTntComboBox;
    cob_DeptEnd: TTntComboBox;
    cb_Mach: TTntCheckBox;
    cob_QryMch: TTntComboBox;
    bbtn_ConfirmQry: TTntBitBtn;
    qry_machinemac_addr: TStringField;
    qry_machinemac_pos: TWideStringField;
    qry_machinemac_remark: TWideStringField;
    cmd_Temp: TADOCommand;
    qry_Temp: TADOQuery;
    ds_DutDtl: TDataSource;
    TntTabSheet4: TTntTabSheet;
    cb_Dept: TTntCheckBox;
    cb_Emp: TTntCheckBox;
    EditEmp: TTntEdit;
    sb_Emp: TTntSpeedButton;
    bbtn_Reset: TTntBitBtn;
    TntPanel5: TTntPanel;
    TntPanel6: TTntPanel;
    TntBitBtn2: TTntBitBtn;
    TntBitBtn4: TTntBitBtn;
    qry_TrtQry: TADOQuery;
    ds_TrtQry: TDataSource;
    TntGroupBox8: TTntGroupBox;
    TntGroupBox9: TTntGroupBox;
    TntMemo1: TTntMemo;
    TntBitBtn1: TTntBitBtn;
    dtp_DelDateBeg: TTntDateTimePicker;
    dtp_DelDateEnd: TTntDateTimePicker;
    TntLabel12: TTntLabel;
    TntCheckBox1: TTntCheckBox;
    TntEdit1: TTntEdit;
    TntSpeedButton1: TTntSpeedButton;
    TntLabel14: TTntLabel;
    TntBitBtn5: TTntBitBtn;
    TntLabel13: TTntLabel;
    TntLabel10: TTntLabel;
    qry_Del: TADOQuery;
    cob_isdel: TTntComboBox;
    lb_isdel: TTntLabel;
    qry_tmp: TADOQuery;
    qry_tmpspc_id: TStringField;
    qry_tmpuser_id: TStringField;
    qry_tmpuser_name: TWideStringField;
    qry_tmpuser_dept: TStringField;
    qry_tmptrt_date: TDateTimeField;
    qry_tmptrt_time: TStringField;
    qry_tmptrt_addr: TStringField;
    procedure TntTabSheet1Show(Sender: TObject);
    procedure TntBitBtn3Click(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure sb_DelClick(Sender: TObject);
    procedure sb_postClick(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure qry_machineAfterEdit(DataSet: TDataSet);
    procedure qry_machineAfterInsert(DataSet: TDataSet);
    procedure qry_machineAfterDelete(DataSet: TDataSet);
    procedure qry_machineAfterPost(DataSet: TDataSet);
    procedure qry_machineAfterCancel(DataSet: TDataSet);
    procedure bbtn_ClearMemoClick(Sender: TObject);
    procedure bbtn_TestConnClick(Sender: TObject);
    procedure rb_ByMchClick(Sender: TObject);
    procedure rb_ByFileClick(Sender: TObject);
    procedure bbtn_StartClick(Sender: TObject);
    procedure bbtn_StopClick(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
    procedure sb_SrcFileClick(Sender: TObject);
    procedure cob_DealDataSelect(Sender: TObject);
    procedure bbtn_ClearClick(Sender: TObject);
    procedure sb_SavePathClick(Sender: TObject);
    procedure sb_EmpClick(Sender: TObject);
    procedure SetMachineCob(aComboBox:TTntComboBox);
    procedure bbtn_ConfirmQryClick(Sender: TObject);
    procedure bbtn_ResetClick(Sender: TObject);
    procedure TntBitBtn1Click(Sender: TObject);
    procedure TntBitBtn5Click(Sender: TObject);
    function GetAddrFromFileName(FileName:string):string;
    procedure cds_DutDtlAfterScroll(DataSet: TDataSet);
    procedure qry_TrtQryAfterScroll(DataSet: TDataSet);
    procedure dbg_TrtQryTitleClick(Column: TColumn);
    procedure TntBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut07: TFormDut07;
  RunThread: TRunThread;
  ws_Words:TWideStrings;
  nPortNo:Integer;
implementation
uses
  UnitDMHrdsys,UnitHrdUtils;
{$R *.dfm}
{$i multipas.pas }
{*******************************************************************************
  公共部分
*******************************************************************************}
{===============================================================================
  設置卡机地址comboBox的值
===============================================================================}
procedure TFormDut07.SetMachineCob(aComboBox:TTntComboBox);
begin
  aComboBox.Items.Clear;
  aComboBox.Items.Add('所有考勤机');
  with qry_machine do
  begin
    First;
    while not Eof do
    begin
      aComboBox.Items.Add(FieldByName('mac_addr').AsString+' '+FieldByName('mac_pos').AsString);
      Next;
    end;
    First;
  end;
end;
{===============================================================================
  初始化界面
===============================================================================}
procedure TFormDut07.TntFormCreate(Sender: TObject);
const
  FORM_ID='dut07';
var
  PrvArr:TPrvArr;
begin
  {初始化,取用戶對該畫面擁有的權限}
  PrvArr:=GetPrvArr(UserName,FORM_ID);
  if not PrvArr[INQ] then
    TntTabSheet3.TabVisible:=false;
  if (not PrvArr[UPD]) or (not PrvArr[ADD]) then
  begin
    TntTabSheet1.TabVisible:=false;
    TntTabSheet2.TabVisible:=false;
  end;
  if not PrvArr[DEL] then
    TntTabSheet4.TabVisible:=false;
  qry_machine.Open;
  //leo upd 2006/3/2
  if not qry_tmp.Active then
    qry_tmp.Open;

  dtp_DutDay.Date:=DateOf(now);
  SetMachineCob(cob_Machine);
  SetMachineCob(cob_QryMch);
  {初始化部門下拉菜單}
  GetDeptRange(cob_DeptBeg);
  GetDeptRange(cob_DeptEnd);
  //SetComboxList('select dept_code+''-''+abbr_titl,dept_code from hrd_dept',cob_DeptBeg);
  //SetComboxList('select dept_code+''-''+abbr_titl,dept_code from hrd_dept',cob_DeptEnd);

end;
{===============================================================================
  OpenCommPort 打開通訊端口
===============================================================================}
function OpenCommPort:Boolean;
var
  nComBaud,nComDataBit,nComParity,nComStopBit:Integer;
  MyIni:TIniFile;
begin
  MyIni:=TIniFile.Create('..\ini\MULTICOM.INI');
  nPortNo:=MyIni.ReadInteger('Communication','Port',1);
  nComBaud:=MyIni.ReadInteger('Communication','BaudRate',9600);
  nComDataBit:=MyIni.ReadInteger('Communication','DataBit',8);
  nComParity:=MyIni.ReadInteger('Communication','Parity',0);
  nComStopBit:=MyIni.ReadInteger('Communication','StopBit',1);
  MyIni.Free;
  if not HM_OpenCommPort(nPortNo,nComBaud,nComDataBit,nComParity,nComStopBit) then
  begin
    messageboxW(0,'打開端口失敗！','錯誤提示',mb_iconinformation);
    Result:=false;
  end
  else
    Result:=true;
end;
{===============================================================================
  關閉通訊端口
===============================================================================}
procedure CloseCommPort;
begin
  HM_CloseCommPort(nPortNo);
end;
{******************************************************************************}
{ 卡机資料維護部分                                                             }
{******************************************************************************}
procedure TFormDut07.TntTabSheet1Show(Sender: TObject);
var
  MyIni: TIniFile;
begin
  qry_machine.Open;
  //read Com Setting From MULTICOM.INI
  MyIni:=TIniFile.Create('..\ini\MULTICOM.INI');
  try
    //Port 端口
    cob_Com.Text:='COM'+IntToStr(MyIni.ReadInteger('Communication','Port',1));
    //BaudRate 波特率
    cob_BaudRate.Text:=IntToStr(MyIni.ReadInteger('Communication','BaudRate',9600));
    //Parity 校驗位
    cob_Parity.ItemIndex:=MyIni.ReadInteger('Communication','Parity',0);
    //StopBit 停止位
    cob_StopBit.Text:=IntToStr(MyIni.ReadInteger('Communication','StopBit',1));
    //DataBit 數據位
    cob_DataBit.Text:=IntToStr(MyIni.ReadInteger('Communication','DataBit',8));
  finally
    MyIni.Free;
  end;
end;

procedure TFormDut07.TntBitBtn3Click(Sender: TObject);
var
  MyIni:TIniFile;
begin
  //Set Ini Infomation to MULTICOM.INI
  MyIni:=TIniFile.Create('..\ini\MULTICOM.INI');
  try
    //Port 端口
    MyIni.WriteInteger('Communication','Port',StrToInt(RightStr(cob_Com.Text,1)));
    //BaudRate 波特率
    MyIni.WriteInteger('Communication','BaudRate',StrToInt(cob_BaudRate.Text));
    //Parity 校驗位
    MyIni.WriteInteger('Communication','Parity',cob_Parity.ItemIndex);
    //StopBit 停止位
    MyIni.WriteInteger('Communication','StopBit',StrToInt(cob_StopBit.Text));
    //DataBit 數據位
    MyIni.WriteInteger('Communication','DataBit',StrToInt(cob_DataBit.Text));
  finally
    MyIni.Free;
  end;
end;

procedure TFormDut07.sb_AddClick(Sender: TObject);
begin
  qry_machine.Append;
end;

procedure TFormDut07.sb_DelClick(Sender: TObject);
begin
  if qry_machine.RecordCount>0 then
    qry_machine.Delete;
end;

procedure TFormDut07.sb_postClick(Sender: TObject);
begin
  qry_machine.Post;
end;

procedure TFormDut07.sb_RecoverClick(Sender: TObject);
begin
  qry_machine.CancelUpdates;
  sb_Post.Enabled:=false;
  sb_Save.Enabled:=false;
  sb_Recover.Enabled:=false;
end;

procedure TFormDut07.sb_SaveClick(Sender: TObject);
begin
  qry_machine.UpdateBatch;
  sb_Post.Enabled:=false;
  sb_Save.Enabled:=false;
  sb_Recover.Enabled:=false;
  SetMachineCob(cob_Machine);
  SetMachineCob(cob_QryMch);
end;

procedure TFormDut07.qry_machineAfterEdit(DataSet: TDataSet);
begin
  sb_Post.Enabled:=true;
  sb_Save.Enabled:=true;
  sb_Recover.Enabled:=true;
end;

procedure TFormDut07.qry_machineAfterInsert(DataSet: TDataSet);
begin
  sb_Post.Enabled:=true;
  sb_Save.Enabled:=true;
  sb_Recover.Enabled:=true;
end;

procedure TFormDut07.qry_machineAfterDelete(DataSet: TDataSet);
begin
  sb_Recover.Enabled:=true;
  sb_Save.Enabled:=true;
end;

procedure TFormDut07.qry_machineAfterPost(DataSet: TDataSet);
begin
  sb_Post.Enabled:=false;
end;

procedure TFormDut07.qry_machineAfterCancel(DataSet: TDataSet);
begin
  sb_Post.Enabled:=false;
end;

procedure TFormDut07.bbtn_ClearMemoClick(Sender: TObject);
begin
  mm_TestInfo.Clear;
end;
{===============================================================================
  測試考勤机連接狀況
===============================================================================}
procedure TFormDut07.bbtn_TestConnClick(Sender: TObject);
var
  addrStr:String;
  i,len:Integer;
begin
  bbtn_TestConn.Enabled:=false;
  if OpenCommPort then
  begin
    addrStr:='';
    if rb_TestAll.Checked then
    begin
      qry_machine.First;
      while not qry_machine.Eof do
      begin
        addrStr:=addrStr+qry_machine.FieldByName('mac_addr').AsString;
        qry_machine.Next;
      end;
    end
    else
      addrStr:=qry_machine.FieldByName('mac_addr').AsString;
    for i:=1 to Length(addrStr) do
    begin
      if HM_file_exist(nPortNo,addrStr[i],'Cooking.exe',Addr(len))<>0 then
        mm_TestInfo.Lines.Append('考勤机 '+addrStr[i]+' 連接不成功')
      else
        mm_TestInfo.Lines.Append('考勤机 '+addrStr[i]+' 連接成功');
    end;
  end;
  CloseCommPort;
  bbtn_TestConn.Enabled:=true;
end;

{******************************************************************************
  刷卡資料採集部分
*******************************************************************************}
procedure TFormDut07.rb_ByMchClick(Sender: TObject);
begin
  rb_ByMch.Checked:=true;
  if rb_ByMch.Checked then
  begin
    cob_Machine.Enabled:=true;
    cb_RealGet.Enabled:=true;
    EditDataFile.Enabled:=false;
    sb_SrcFile.Enabled:=false;
  end
  else begin
    cob_Machine.Enabled:=false;
    cb_RealGet.Enabled:=false;
  end
end;

procedure TFormDut07.rb_ByFileClick(Sender: TObject);
begin
  rb_ByFile.Checked:=true;
  if rb_ByFile.Checked then
  begin
    EditDataFile.Enabled:=true;
    sb_SrcFile.Enabled:=true;
    cob_Machine.Enabled:=false;
    cb_RealGet.Checked:=false;
    cb_RealGet.Enabled:=false;
    cb_RealGet.Enabled:=false;
  end
  else begin
    EditDataFile.Enabled:=false;
    sb_SrcFile.Enabled:=false;
    cb_RealGet.Enabled:=true;
    cb_RealGet.Checked:=false;
  end;
end;
{===============================================================================
  得到卡机地址
===============================================================================}
function GetAddrStr:String;
var
  AddrStr:string;
  FormDut07:TFormDut07;
begin
  Formdut07:=TFormdut07(Application.FindComponent('Formdut07'));
  if FormDut07.cob_Machine.ItemIndex=0 then
  begin
    {選擇所有卡机}
    with FormDut07.qry_machine do
    begin
      First;
      while not Eof do
      begin
        AddrStr:=AddrStr+FieldByName('mac_addr').AsString;
        Next;
      end;
      First;
    end;
  end
  else
    AddrStr:=LeftStr(FormDut07.cob_Machine.Text,1);
  Result:=AddrStr;
end;
{========================================================================
  刪除卡机中的資料
=========================================================================}
procedure DeleteTrtText(port:integer;Addr:Char;fileName:Pchar);
begin
  HM_delete(port,addr,filename);
end;
{===============================================================================
  處理接收到的資料(接收后數據存到數據庫)
===============================================================================}
procedure DealData(DataStr:String;AddrStr:String='');
var
  FormDut07:TFormDut07;
  TrtDate:TDateTime;
  aSQL,YMDStr,SpcId,TrtTime,TrtAddr,FileName:String;
  WriteTextFile:TextFile;
  FileHandle:Integer;
begin
  FormDut07:=TFormDut07(Application.FindComponent('FormDut07'));
  YMDStr:=MidStr(DataStr,21,2)+MidStr(DataStr,17,2)+MidStr(DataStr,19,2);
  SpcId:=LeftStr(DataStr,10);//識別卡號
  if not TryEnCodeDate(StrToInt(LeftStr(IntToStr(Yearof(Date)),2)+MidStr(DataStr,21,2)),
    StrToInt(MidStr(DataStr,17,2)),StrToInt(MidStr(DataStr,19,2)),TrtDate) then
    exit;
  TrtTime:=MidStr(DataStr,11,2)+':'+MidStr(DataStr,13,2)+':'+MidStr(DataStr,15,2);
  if AddrStr<>'' then
  TrtAddr:=AddrStr
  else
  TrtAddr:=MidStr(DataStr,23,1);
  {把接收資料寫入備份文件}
  if FormDut07.cob_DealData.ItemIndex=0 then
  begin
    FileName:=FormDut07.EditSavePath.Text+'\D'+YMDStr+'.txt';
    if not FileExists(FileName) then
    begin
      FileHandle:=FileCreate(FileName);
      FileClose(FileHandle);
    end;
    AssignFile(WriteTextFile,FileName);
    Append(WriteTextFile);
    Writeln(WriteTextFile,DataStr);
    CloseFile(WriteTextFile);
  end;
  {把接收資料寫入數據庫}
  {判斷當日資料庫是否存在，不存在則創建資料庫}
{  aSQL:='SELECT * FROM sysobjects WHERE xtype=''U'' AND name=''hrd_dut_trt'+YMDStr+'''';
  with FormDut07.qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    if Eof then
    begin
      //輸入日期的考勤表不存在，創建
      FormDut07.cmd_Temp.CommandText :=' CREATE TABLE [dbo].[hrd_dut_trt'+YMDStr+']( '+
      	'[upd_user] [varchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,'+
        '[upd_date] [datetime] NULL ,'+
        '[spc_id] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,'+
        '[trt_date] [datetime] NOT NULL ,'+
        '[trt_time] [char] (8) COLLATE Chinese_PRC_CI_AS NOT NULL,'+
        '[trt_station] [char] (1) COLLATE Chinese_PRC_CI_AS NULL,'+
        '[trt_comp] [char] (1) COLLATE Chinese_PRC_CI_AS NULL ,'+
        '[trt_check] [char] (1) COLLATE Chinese_PRC_CI_AS NULL ,'+
        '[over_flag] [char] (1) COLLATE Chinese_PRC_CI_AS NULL ,'+
        'CONSTRAINT PRK_DUT_DAY'+YMDStr+' PRIMARY KEY  NONCLUSTERED ( spc_id,trt_date,trt_time )'+
        ') ';
      FormDut07.cmd_Temp.Execute;
    end;
    Close;
  end; }
  {把採集資料寫入數據庫中}
  aSQL:='SELECT * FROM hrd_dut_trt WHERE spc_id='''+SpcId+
    ''' AND trt_date='''+FormatDateTime('yyyy/mm/dd',TrtDate)+''' AND trt_time='''+TrtTime+'''';
  with FormDut07.qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
    if Eof then
    begin
      aSQL:='INSERT INTO hrd_dut_trt (upd_user,upd_date,spc_id,trt_date,trt_time,trt_station,trt_comp,trt_check) '+
        'VALUES('''+UserName+''','''+FormatDateTime('yyyy/mm/dd hh:nn:ss',now)+''','''+SpcId+''','''+FormatDateTime('yyyy/mm/dd',TrtDate)+
        ''','''+TrtTime+''','''+TrtAddr+''',''B'',''4'')';
      FormDut07.cmd_Temp.CommandText:=aSQL;
      FormDut07.cmd_Temp.Execute;
    end;
    Close;
  end;
  {在ClientDataSet（屏幕）中顯示刷卡資料}
  aSQL:='select a.emp_id,a.emp_chs,a.dept_code,b.abbr_titl from hrd_emp a,hrd_dept b where '+
    'a.dept_code=b.dept_code and a.spc_id='''+SpcId+'''';
  with FormDut07.qry_Temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
  end;
  //leo upd 2006/3/2
  with FormDut07.qry_tmp do
  begin
    {加入ClientDataSet cds_DutDtl中}
    AppendRecord([SpcId,FormDut07.qry_Temp.FieldByName('emp_id').AsString,
      FormDut07.qry_Temp.FieldByName('emp_chs').AsString,FormDut07.qry_Temp.FieldByName('dept_code').AsString+' '+
      FormDut07.qry_Temp.FieldByName('abbr_titl').AsString,FormatDateTime('yyyy/mm/dd',TrtDate),
      TrtTime,TrtAddr]);
  end;
end;
{===============================================================================
  運行?程，資料採集
===============================================================================}
procedure TRunThread.Execute;
var
  FormDut07:TFormDut07;
  AddrStr,sStr,FileName:String;
  fName:PChar;
  ret,len,i,curr:integer;
  ReadTextFile:TextFile;
begin
  FreeOnTerminate := true;
  Formdut07:=TFormdut07(Application.FindComponent('Formdut07'));
  FormDut07.bbtn_Start.Enabled:=false;
  FormDut07.bbtn_Stop.Enabled:=true;
  {打開端口}
  if (FormDut07.rb_ByMch.Checked) and (not OpenCommPort) then
  begin
    Terminate;
    FormDut07.bbtn_Start.Enabled:=true;
    FormDut07.bbtn_Stop.Enabled:=false;
    exit;
  end;
  {得到考勤机地址 GetAddrStr}
  AddrStr:=GetAddrStr;
  SetLength(sStr,256);
  if FormDut07.cb_RealGet.Checked then
  begin
    {實時採集}
    repeat
      for i:=1 to Length(AddrStr) do
      begin
        {開始採集資料}
        ret := HM_poll(nPortNo,AddrStr[i],PChar(sStr), Addr(len));
        if ret=0 then   {接受資料成功}
        begin
          {處理接受的資料}
          DealData(sStr);
        end;
      end;

    until Terminated;
  end
  else begin
    {非實時採集}
    if FormDut07.rb_ByMch.Checked then {判斷數據來源方式}
    begin
      {數據來自考勤机}
      for i:=1 to Length(AddrStr) do
      begin
        repeat
          if Terminated then break; {停止程序，則退出}
          ret := HM_poll(nPortNo,AddrStr[i],PChar(sStr), Addr(len));
         // fName:=
          if ret=0 then   {接受資料成功}
          begin
            {處理接受的資料}
            DealData(sStr);//
          end;
          if formdut07.cob_isdel.ItemIndex=0 then
            DeleteTrtText(nPortNo,AddrStr[i],fName);
        until ret<>0
      end;
      
      if not Terminated then
        messageboxW(0,'接收完成！','提示信息',mb_iconinformation);
    end
    else if FormDut07.rb_ByFile.Checked then
    begin
      {資料來源數據文件}
      FileName:=FormDut07.EditDataFile.Text;
      AddrStr:=FormDut07.GetAddrFromFileName(FileName);
      if FileExists(FileName) then
      begin
        AssignFile(ReadTextFile,FileName);
        {打開文件}
        Reset(ReadTextFile);
        curr:=1;
        while not EOF(ReadTextFile) do
        begin
          {如果中斷程序，則退出}
          if Terminated then break;
          SetStatusText(widestring('正在處理第')+inttostr(curr)+widestring('行'));
          {讀取資料}
          Readln(ReadTextFile,sStr);
          {處理資料}
          DealData(sStr,AddrStr);
          inc(curr);
        end;
        SetStatusText('處理完成！');
        {接收成功提示}
        if not Terminated then
        messageboxW(0,'接收完成！','提示信息',mb_iconinformation);
        {關閉文件}
        CloseFile(ReadTextFile);
      end
      else
        MessageboxW(0,'不存在選擇的文件！','錯誤提示',mb_iconinformation);
    end;
  end;
  {關閉端口}
  CloseCommPort;
  FormDut07.bbtn_Start.Enabled:=true;
  FormDut07.bbtn_Stop.Enabled:=false;
end;
procedure TFormDut07.bbtn_StartClick(Sender: TObject);
begin
  RunThread:=TRunThread.Create(false);
end;

procedure TFormDut07.bbtn_StopClick(Sender: TObject);
begin
  if (RunThread<>nil) and (not RunThread.Terminated) then
    RunThread.Terminate;
end;


procedure TFormDut07.sb_SrcFileClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    EditDataFile.Text:=OpenDialog.FileName;
end;
{===============================================================================
===============================================================================}
procedure TFormDut07.cob_DealDataSelect(Sender: TObject);
begin
  if cob_DealData.ItemIndex=0 then
  begin
    EditSavePath.Enabled:=true;
    sb_SavePath.Enabled:=true;
  end
  else begin
    EditSavePath.Enabled:=false;
    sb_SavePath.Enabled:=false;
  end;
end;

procedure TFormDut07.bbtn_ClearClick(Sender: TObject);
begin
  //leo upd 2006/3/2
  qry_tmp.CancelUpdates;
end;

procedure TFormDut07.sb_SavePathClick(Sender: TObject);
var
  Dir:string;
begin
  Dir:=GetCurrentDir;
  SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],1000);
  EditSavePath.Text:=Dir;
end;
{*******************************************************************************
  刷卡資料查詢部分
*******************************************************************************}
procedure TFormDut07.sb_EmpClick(Sender: TObject);
var
  aEmpId:String;
begin
  aEmpId:=FindEmpId('emp_id');
  if aEmpId<>'' then
    EditEmp.Text:=aEmpId;
end;
{===============================================================================
  確定查詢刷卡資料情況
===============================================================================}
procedure TFormDut07.bbtn_ConfirmQryClick(Sender: TObject);
var
  aSQL:String;
begin
  aSQL:='SELECT a.emp_id,a.emp_chs,a.dept_code,b.abbr_titl,c.spc_id,c.trt_date,c.trt_time,c.trt_station'+
    ' FROM hrd_emp a,hrd_dept b,hrd_dut_trt c'+
    ' WHERE a.spc_id=c.spc_id AND a.dept_code=b.dept_code and trt_date='''+FormatDateTime('yyyy/mm/dd',dtp_DutDay.date)+''''
    +' and (A.epledt is null or A.epledt >='''+FormatDateTime('yyyy/mm/dd',dtp_DutDay.date)+''')';
  if (cb_Mach.Checked) and (cob_QryMch.ItemIndex<>0)  then
    aSQL:=aSQL+' AND c.trt_station='''+LeftStr(cob_QryMch.Text,1)+'''';
  if cb_Emp.Checked then
    aSQL:=aSQL+' AND a.emp_id='''+EditEmp.Text+'''';
  if cb_Dept.Checked then
    aSQL:=aSQL+'AND a.dept_code>='''+LeftStr(cob_DeptBeg.Text,6)+''''+
      ' AND a.dept_code<='''+LeftStr(cob_DeptEnd.Text,6)+'''';
  with qry_TrtQry do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    try
      Open;
      if EOF then
      begin
        WideMessageDlg('沒有找到查詢範圍內的資料！',mtInformation,[mbYes],0);
        Close;
        Exit;
      end;
    except
      WideMessageDlg('沒有該日的刷卡資料！',mtError,[mbYes],0);
      Exit;
    end;
  end;
  TntLabel7.Enabled:=false;
  dtp_DutDay.Enabled:=false;
  cb_Mach.Enabled:=false;
  cob_QryMch.Enabled:=false;
  cb_Emp.Enabled:=false;
  EditEmp.Enabled:=false;
  sb_Emp.Enabled:=false;
  cb_Dept.Enabled:=false;
  cob_DeptBeg.Enabled:=false;
  cob_DeptEnd.Enabled:=false;
  bbtn_ConfirmQry.Enabled:=false;
  bbtn_Reset.Enabled:=true;
end;

procedure TFormDut07.bbtn_ResetClick(Sender: TObject);
begin
  TntLabel7.Enabled:=true;
  dtp_DutDay.Enabled:=true;
  cb_Mach.Enabled:=true;
  cob_QryMch.Enabled:=true;
  cb_Emp.Enabled:=true;
  EditEmp.Enabled:=true;
  sb_Emp.Enabled:=true;
//  cb_Dept.Enabled:=true;
  cob_DeptBeg.Enabled:=true;
  cob_DeptEnd.Enabled:=true;
  bbtn_ConfirmQry.Enabled:=true;
  bbtn_Reset.Enabled:=false;
  qry_TrtQry.Close;
end;
{*******************************************************************************
  刷卡資料刪除部分
*******************************************************************************}
procedure TFormDut07.TntBitBtn1Click(Sender: TObject);
var
  QrySql,DelSql:String;
begin
  if WideMessageDlg('您真的要刪除資料?',mtConfirmation,[mbYes,mbNo],0)<>mrYes then exit;
  {QrySql:='SELECT name FROM sysobjects WHERE xtype=''U'' AND name>=''hrd_dut_trt'+
    FormatDateTime('yymmdd',dtp_DelDateBeg.Date)+''' AND name<=''hrd_dut_trt'+
    FormatDateTime('yymmdd',dtp_DelDateEnd.Date)+'''';
  with qry_Del do
  begin
    Close;
    SQL.Clear;
    SQL.Add(QrySql);
    Open;
    if Eof then
    begin
      TntMemo1.Lines.Append('在'+FormatDateTime('yyyy/mm/dd',dtp_DelDateBeg.Date)+'至'+
         FormatDateTime('yyyy/mm/dd',dtp_DelDateEnd.Date)+'內沒有要刪除的資料！');
      exit;
    end;
    while not Eof do
    begin
      DelSql:='drop table '+FieldByName('name').AsString;
      }
  DelSql:='delete from hrd_dut_trt where '
     +' trt_date>='''+FormatDateTime('yyyy/mm/dd',dtp_DelDateBeg.Date)+''''
     +' and trt_date<='''+FormatDateTime('yyyy/mm/dd',dtp_DelDateEnd.Date)+'''';
  with DMHrdsys.ADOCommand1 do
  begin        
    CommandText:=DelSql;
    try
      Execute;
      TntMemo1.Lines.Append('OK');
    except
      TntMemo1.Lines.Append('Error');
    end;
  end;
end;

procedure TFormDut07.TntBitBtn5Click(Sender: TObject);
begin
  TntMemo1.Lines.Clear;
end;
function TFormDut07.GetAddrFromFileName(FileName:string):string;
var
  tmpstr:string;
begin
  tmpstr:=UpperCase(FileName);
  if StrSplit(tmpstr,'ADDR_').Count>1 then
  begin
    tmpstr:=StrSplit(tmpstr,'ADDR_')[1];
    result:=leftstr(tmpstr,1);
  end
  else
   result:='';
end;

procedure TFormDut07.cds_DutDtlAfterScroll(DataSet: TDataSet);
begin
  //leo upd 2006/3/2
  with  qry_tmp do
  begin
    SetStatusText(inttostr(RecNo)+'/'+inttostr(Recordcount));
  end;
end;

procedure TFormDut07.qry_TrtQryAfterScroll(DataSet: TDataSet);
begin
with DataSet do
  setStatusText(inttostr(RecNo)+' '+'/'+inttostr(RecordCount));

end;

procedure TFormDut07.dbg_TrtQryTitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormDut07.TntBitBtn2Click(Sender: TObject);
begin
  showPrint(qry_TrtQry,'刷卡資料明細 列印','','');
end;

end.
