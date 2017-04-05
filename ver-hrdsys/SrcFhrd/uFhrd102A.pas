unit uFhrd102A;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, ExtCtrls, TntExtCtrls, Grids, DBGrids,
  TntDBGrids, DB, TntButtons, tntDialogs,ADODB, DBCtrls, WSDLIntf,Buttons;

type
  TFormFhrd102A = class(TForm)
    TntPanel1: TTntPanel;
    TntPanel2: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    resumeQry: TADOQuery;
    saveData: TTntBitBtn;
    closeSubForm: TTntBitBtn;
    resumeMemo: TTntMemo;
    empid: TEdit;
    fetchQry: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure closeSubFormClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure saveDataClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InitLang;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFhrd102A: TFormFhrd102A;

implementation

uses
  UnitHrdUtils,unitDMHrdsys,uFhrd102;
{$R *.dfm}

{***定義全局變量***}
var
  g_sLangStr : TWideStrings;

procedure TFormfhrd102A.InitLang;
var
  sKeys:string;
begin
  sKeys:='fhrd102A,save,close,save_fail,resume';
  g_sLangStr:=GetLangWideStrs(sKeys);
  saveData.Caption := GetLangName(g_sLangStr,'save');
  closeSubForm.Caption := GetLangName(g_sLangStr,'close');
  TntGroupBox1.Caption := GetLangName(g_sLangStr,'resume');
  FormFhrd102A.Caption := GetLangName(g_sLangStr,'fhrd102A');
end;

procedure TFormFhrd102A.FormCreate(Sender: TObject);
begin
  resumeMemo.Text := '';
  InitLang;
end;

procedure TFormFhrd102A.closeSubFormClick(Sender: TObject);
begin
  FormFhrd102A.Close;
end;

procedure TFormFhrd102A.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFormFhrd102A.saveDataClick(Sender: TObject);
begin
  with resumeQry do
  begin
    close;
    sql.Clear;
    sql.Add('select * from fhrd_empresume where emp_id='''+empid.Text+''' ');
    open;
    if RecordCount>0 then
    begin
      close;
      sql.Clear;
      sql.Add('update fhrd_empresume set resume='''+resumeMemo.Text+''' '+
      'where emp_id='''+empid.Text+'''');
    end
    else
    begin
      close;
      sql.Clear;
      sql.Add('insert into fhrd_empresume (upd_user,emp_id,resume) values '+
      '('''+userName+''','''+empid.Text+''','''+resumeMemo.Text+''')');
    end;
    try
      ExecSQL;
    except
      widemessagedlg(GetLangName(g_sLangStr,'save_fail'),mtError,[mbyes],1);
    end;
  end;
end;

procedure TFormFhrd102A.FormShow(Sender: TObject);
begin
  try
    with fetchQry do
    begin
      close;
      sql.Clear;
      sql.Add('select resume from fhrd_empresume '+
      'where emp_id='''+empid.Text+'''');
      open;
      if RecordCount >0 then
        resumeMemo.Text := FieldByName('resume').Value
      else
        resumeMemo.Text := '';
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'save_fail'),mtError,[mbyes],1);
  end;
end;

end.
