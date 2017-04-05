{*************************************************************************
Name：dut11(打印加班單/停工單)
Author: anil
Create date:2005-09-06
Modify date:2005-09-08
Commentate:員工薪資封裝作業
*************************************************************************}
unit UnitDut11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt;

type
  TFormDut11 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Panel7: TPanel;
    Panel2: TPanel;
    label_dept_begin: TTntLabel;
    Label1: TLabel;
    label_dept_end: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    BtnPrint: TTntBitBtn;
    RbOver: TTntRadioButton;
    RbStop: TTntRadioButton;
    ADOQuery1emp_id: TStringField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1name_vim: TWideStringField;
    BtnPreview: TTntButton;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure SetPrintDataset(PrintFlag:boolean);
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure CobDeptBeginChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut11: TFormDut11;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtDut11;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
{$R *.dfm}

procedure TFormDut11.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
keys:=keys+'dut11_titl,not_find_data,while_doing,total,current_location,'
  +'preview,print,while_printing,department,print_finish,'
  +'dut11_stop,dut11_over,dept_begin,dept_end,dut11_muti_dept_pre,'
  +'dut11_half_deduct,dut11_not_deduct,dut11_all_deduct';
LangStr:=GetLangWideStrs(keys);
PanelTitle.Caption:=GetLangName(LangStr,'dut11_titl');
BtnPrint.Caption:=GetLangName(LangStr,'print');
RBStop.Caption:=GetLangName(LangStr,'dut11_stop');
RBOver.Caption:=GetLangName(LangStr,'dut11_over');
label_dept_begin.Caption:=GetLangName(LangStr,'dept_begin');
label_dept_end.Caption:=GetLangName(LangStr,'dept_end');
BtnPreview.Caption:=GetLangName(LangStr,'preview');
end;                        

procedure TFormDut11.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
{  if userLang='E' then
    fld_name:='dept_code+'' ''+eng_abbr'
  else if userLang='V' then
    fld_name:='dept_code+'' ''+vim_abbr'
  else
    fld_name:='dept_code+'' ''+abbr_titl';
  sql_str:='select '+fld_name+' as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,CobDeptBegin);
  SetComboxList(sql_str,CobDeptEnd);
}
  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
end;

procedure TFormDut11.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(username,'dut11');
  InitLang;// Init language
  InitForm;// Init Form
  Application.CreateForm(TFormPrtDut11,FormPrtDut11);
end;

procedure TFormDut11.SetPrintDataset(PrintFlag:boolean);
//設置打印數據集
var
  sql_str:string;
begin
  sql_str:='select * from hrd_dept where 2>1';
  if CobDeptBegin.Text<>'' then
    sql_str:=sql_str+' and dept_code>='''+leftstr(CobDeptBegin.Text,6)+'''';
  if CobDeptEnd.Text<>'' then
    sql_str:=sql_str+' and dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';
  with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      sql.add(sql_str);
      open;
    end;
  while not DMHrdsys.SQLQuery1.EOF do
    begin
      if PrintFlag then
        SetStatusText(GetLangName(LangStr,'while_printing')+GetLangName(LangStr,'department')+DMHrdsys.SQLQuery1.fieldByName('dept_code').AsString);
      sql_str:='select * from hrd_emp where epledt is null and '
        +'dept_code='''+DMHrdsys.SQLQuery1.fieldByName('dept_code').AsString+''' ORDER BY EMP_ID';
      with ADOQuery1 do
        begin
          close;
          sql.Clear;
          sql.add(sql_str);
          open;
          if not EOF then
            //顯示部門
            with DMHrdsys.SQLQuery1 do
              FormPrtDut11.QRLabelDept.Caption:=fieldByName('dept_code').Value+' '+fieldByName('abbr_titl').Value;
            //按部門打印/預覽
            with FormPrtDut11.QuickRep1 do
              begin
                if PrintFlag then
                  Print
                else if DMHrdsys.SQLQuery1.RecNo=1 then
                  begin
                    if DMHrdsys.SQLQuery1.RecordCount>1 then
                      WideMessageDlg(GetLangName(LangStr,'dut11_muti_dept_pre'),mtConfirmation,[mbok],0);
                    Preview;
                    exit;
                  end;  
              end;
        end;
      DMHrdsys.SQLQuery1.Next;  
    end;
  if PrintFlag then
    SetStatusText(GetLangName(LangStr,'print_finish'));
end;

procedure TFormDut11.BtnPrintClick(Sender: TObject);
//打印內容設置
begin
  //打印內容設置(顯示/隱藏)
  with FormPrtDut11 do
    begin     
      if RBOver.Checked then
        begin
          QRCtitle2.ParentBand:=nil;
          QRCtitle1.ParentBand:=PageHeaderBand1;
          RBCtitleB.ParentBand:=QRCtitle1;
          RBCtitleB.Height:=105;
          QRCFooter1.ParentBand:=PageFooterBand1;
          QRCFooter2.ParentBand:=nil;
        //  QRLabel3.Caption:='';
        //  QRLabel4.Caption:='';
          QRLabel5.Caption:='';
        end
      else
        begin
          QRCtitle1.ParentBand:=nil;
          QRCtitle2.ParentBand:=PageHeaderBand1;
          RBCtitleB.ParentBand:=QRCtitle2;
          RBCtitleB.Height:=0;
          QRCFooter2.ParentBand:=PageFooterBand1;
          QRCFooter1.ParentBand:=nil;
        //  QRLabel3.Caption:=GetLangName(LangStr,'dut11_not_deduct');
        //  QRLabel4.Caption:=GetLangName(LangStr,'dut11_half_deduct');
          QRLabel5.Caption:=GetLangName(LangStr,'dut11_all_deduct');
        end;
    end;
  //打印(預覽)
  if TtntButton(Sender).Name='BtnPrint' then
    SetPrintDataset(true)
  else
    SetPrintDataset(false);
end;

procedure TFormDut11.CobDeptBeginChange(Sender: TObject);
begin
  CobDeptEnd.Text:=CobDeptBegin.Text;
end;

end.
