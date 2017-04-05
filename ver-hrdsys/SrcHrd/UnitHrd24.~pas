{*************************************************************************
Name：dut11(打印加班單/停工單)
Author: anil
Create date:2005-09-06
Modify date:2005-09-08
Commentate:打印加班單/停工單
*************************************************************************}
unit UnitHrd24;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt,
  QuickRpt, DateUtils, DBClient;

type
  //0: 周 1: 月 2: 年   2013.09.05 LX Add
  TAryOverTime= array[0..2] of Double;
  //
  TFormHrd24 = class(TForm)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    Panel7: TPanel;
    Panel2: TPanel;
    lblemp: TTntLabel;
    Label1: TLabel;
    BtnPrint: TTntBitBtn;
    BtnPreview: TTntButton;
    edtEmp: TTntEdit;
    mmo1: TTntMemo;
    //my define
    procedure InitLang;
    procedure SetPrintDataset(PrintFlag:boolean);
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd24: TFormHrd24;

implementation
uses
  UnitHrdUtils,unitDMHrdsys, UnitPrtHrd24;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
{$R *.dfm}

procedure TFormHrd24.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
  SetComponentLang(self);
  keys:=keys+'vietnam_chingluh_company,hrd24_titl,not_find_data,while_doing,total,current_location,'
    +'preview,print,while_printing,department,print_finish,';
  LangStr:=GetLangWideStrs(keys);
  PanelTitle.Caption:=GetLangName(LangStr,'hrd24_titl');
  BtnPrint.Caption:=GetLangName(LangStr,'print');
  BtnPreview.Caption := GetLangName(Langstr,'preview');

  BtnPreview.Caption:=GetLangName(LangStr,'preview');
end;                        

procedure TFormHrd24.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(username,'dut11');
  InitLang;// Init language
  Application.CreateForm(TFormPrtHrd24, FormPrtHrd24);
  //Application.CreateForm(TFormPrtDut11_Stop, FormPrtDut11_Stop);
end;

procedure TFormHrd24.SetPrintDataset(PrintFlag:boolean);
//設置打印數據集
var
  sql_str:string;
begin
  //
  sql_str:='select * from hrd_emp where emp_id='+QuotedStr(edtEmp.Text);
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sql_str);
    Open;

    if recordcount=0 then
    begin
      WideShowMessage(GetLangName(Langstr,'not_find_data'));
      edtEmp.SetFocus;
      Exit;
    end;

    if FieldByName('epledt').AsDateTime = 0 then
    begin
      WideShowMessage(GetLangName(GetLangWideStrs('hrd24_err01'),'hrd24_err01'));
      edtEmp.SetFocus;
      Exit;
    end;
    //
    if PrintFlag then
      SetStatusText(GetLangName(LangStr,'while_printing')+GetLangName(LangStr,'department')+ADOQuery1.fieldByName('dept_code').AsString);
    //
    with FormPrtHrd24 do
    begin
      qrlbl1.Caption := mmo1.Lines.Strings[0];
      qrlbl2.Caption := mmo1.Lines.Strings[1];
      qrlbl3.Caption := mmo1.Lines.Strings[2];
      qrlbl4.Caption := mmo1.Lines.Strings[3];
      qrlbl5.Caption := mmo1.Lines.Strings[4];
      qrlbl6.Caption := mmo1.Lines.Strings[5];
      qrlbl7.Caption := mmo1.Lines.Strings[8];
      qrlbl8.Caption := mmo1.Lines.Strings[9];
      qrlbl10.Caption := mmo1.Lines.Strings[10];
      qrlbl11.Caption := mmo1.Lines.Strings[11];
      qrlbl12.Caption := mmo1.Lines.Strings[12];
      qrlbl13.Caption := mmo1.Lines.Strings[13];
      qrlbl14.Caption := mmo1.Lines.Strings[14];
      qrlbl15.Caption := mmo1.Lines.Strings[15];
      qrlbl16.Caption := mmo1.Lines.Strings[16];
      qrlbl17.Caption := mmo1.Lines.Strings[17];
      qrlbl18.Caption := mmo1.Lines.Strings[18];
      qrlbl19.Caption := mmo1.Lines.Strings[19];
      qrlbl20.Caption := mmo1.Lines.Strings[20];
      qrlbl21.Caption := mmo1.Lines.Strings[21];
      qrlbl22.Caption := mmo1.Lines.Strings[22];
      qrlbl23.Caption := mmo1.Lines.Strings[23];
      qrlbl24.Caption := mmo1.Lines.Strings[24];
      qrlbl25.Caption := mmo1.Lines.Strings[25];
      qrlbl26.Caption := mmo1.Lines.Strings[26];
      qrlbl27.Caption := mmo1.Lines.Strings[27];
      qrlbl28.Caption := mmo1.Lines.Strings[28];
      qrlbl29.Caption := mmo1.Lines.Strings[29];
      qrlbl30.Caption := mmo1.Lines.Strings[30];
      qrlbl31.Caption := mmo1.Lines.Strings[31];
      qrlbl32.Caption := mmo1.Lines.Strings[32];
      qrlbl33.Caption := mmo1.Lines.Strings[33];
      qrlbl34.Caption := mmo1.Lines.Strings[34];
      qrlbl35.Caption := mmo1.Lines.Strings[35];
      qrlbl36.Caption := mmo1.Lines.Strings[36];
      qrlbl37.Caption := mmo1.Lines.Strings[37];
      qrlbl38.Caption := mmo1.Lines.Strings[38];
      qrlbl39.Caption := mmo1.Lines.Strings[39];
      qrlbl40.Caption := mmo1.Lines.Strings[40];
      qrlbl41.Caption := mmo1.Lines.Strings[41];
      qrlbl42.Caption := mmo1.Lines.Strings[42];
      qrlbl43.Caption := mmo1.Lines.Strings[43];
      qrlbl44.Caption := mmo1.Lines.Strings[44];
      qrlbl45.Caption := mmo1.Lines.Strings[45];
      qrlbl46.Caption := mmo1.Lines.Strings[46];
      qrlbl47.Caption := mmo1.Lines.Strings[47];
      qrlbl48.Caption := mmo1.Lines.Strings[48];
      //qrlbl49.Caption := mmo1.Lines.Strings[49];
      qrlbl50.Caption := mmo1.Lines.Strings[6];
      qrlbl51.Caption := mmo1.Lines.Strings[7];

      qrlbl100.Caption := FormatDateTime('DD',ADOQuery1.FieldByName('epledt').AsDateTime);
      qrlbl101.Caption := FormatDateTime('MM',ADOQuery1.FieldByName('epledt').AsDateTime);
      qrlbl102.Caption := FormatDateTime('YYYY',ADOQuery1.FieldByName('epledt').AsDateTime);
      qrlbl103.Caption := ADOQuery1.FieldByName('name_vim').Value;
      qrlbl104.Caption := FormatDateTime('DD/MM/YYYY',ADOQuery1.FieldByName('epbirth').AsDateTime);
      qrlbl105.Caption := ADOQuery1.FieldByName('epid_no').AsString;
      qrlbl106.Caption := FormatDateTime('DD/MM/YYYY',ADOQuery1.FieldByName('epid_date').AsDateTime);
      if not ADOQuery1.FieldByName('epid_vim').IsNull then
        qrlbl107.Caption := ADOQuery1.FieldByName('epid_vim').Value;
      qrlbl108.Caption := ADOQuery1.FieldByName('emp_id').AsString;
      qrlbl109.Caption := ADOQuery1.FieldByName('dept_code').AsString;
      qrlbl110.Caption := FormatDateTime('DD/MM/YYYY',ADOQuery1.FieldByName('epledt').AsDateTime);
      //
      if not ADOQuery1.FieldByName('left_reason').IsNull then
        qrlbl111.Caption := ADOQuery1.FieldByName('left_reason').Value;
      qrlbl112.Caption := ADOQuery1.FieldByName('name_vim').Value;
      qrlbl113.Caption := ADOQuery1.FieldByName('name_vim').Value;

      if PrintFlag then
        qrep1.Print
      else
        qrep1.Preview;
    end;
    //
  end;
  //
  if PrintFlag then
    SetStatusText(GetLangName(LangStr,'print_finish'));
end;

//打印內容設置
procedure TFormHrd24.BtnPrintClick(Sender: TObject);
begin

  //打印(預覽)
  if TtntButton(Sender).Name='BtnPrint' then
    SetPrintDataset(True)
  else
    SetPrintDataset(False);
end;

end.
