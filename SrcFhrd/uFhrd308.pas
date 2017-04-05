{********************************************
Name:       uFhrd308
Func:       維護海外幹部赴越之前的調升記錄
Author:     Tristan
Create Date:2006/01/07
*********************************************}
unit uFhrd308;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TntExtCtrls, StdCtrls, TntStdCtrls, ComCtrls, StrUtils,
  TntComCtrls, Grids, DBGrids, TntDBGrids, DB, ADODB, Buttons, TntButtons;

type
  TFormfhrd308 = class(TForm)
    TntPanel1: TTntPanel;
    TntPanel2: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntGroupBox2: TTntGroupBox;
    dataGrid: TTntDBGrid;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    TntLabel4: TTntLabel;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    valid_date: TTntDateTimePicker;
    emp_id: TTntEdit;
    dept_code: TTntEdit;
    dept_title: TTntEdit;
    TntBitBtn1: TTntBitBtn;
    dataQry: TADOQuery;
    saveQry: TADOQuery;
    pst_code: TTntComboBox;
    TntLabel3: TTntLabel;
    DataSource: TDataSource;
    TntLabel9: TTntLabel;
    emp_name: TTntEdit;
    prnData: TTntBitBtn;

    // user create function or procedure

    procedure InitGrid;
    procedure InitPst;

    // system create procedure

    procedure FormCreate(Sender: TObject);
    procedure TntBitBtn1Click(Sender: TObject);
    procedure emp_idChange(Sender: TObject);
    procedure prnDataClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd308: TFormfhrd308;

implementation

uses
  UnitHrdMain,UnitDMHrdsys,UnitHrdUtils, UnitPrtTpl, UnitPrtSet;

{$R *.dfm}

procedure TFormfhrd308.FormCreate(Sender: TObject);
begin
  InitGrid;
  InitPst;
  valid_date.Date := Date;
end;

procedure TFormfhrd308.InitPst;
begin
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from fhrd_prof order by pst_code');
    try
      open;
    except
      showmessage('初始化職稱失敗');
      exit;
    end;
    pst_code.Clear;
    while Not Eof do
    begin
      pst_code.Items.Add(FieldBYName('pst_code').Value+'/'+
      FieldBYName('pst_name').Value);
      next;
    end;
  end;
end;

procedure TFormfhrd308.InitGrid;
begin
  with dataQry do
  begin
    close;
    sql.Clear;
    sql.Add('select distinct valid_date,emp_id,(select emp_name from fhrd_emp '+
    'where emp_id=tf.emp_id) as emp_name,pst_name,dept_title '+
    'from fhrd_tranhist_before as tf order by emp_id,valid_date');
    try
      open;
    except
      showmessage('取調升資料錯誤');
      exit;
    end;
  end;
end;

procedure TFormfhrd308.TntBitBtn1Click(Sender: TObject);
var
  sDeptCode,sDeptTitle : string;
begin
  if emp_id.Text='' then
  begin
    showmessage('請輸入工號');
    emp_id.SetFocus;
    exit;
  end;
  if pst_code.Text='' then
  begin
    showmessage('請選擇職稱');
    pst_code.SetFocus;
    exit;
  end;

  if dept_code.Text='' then
    sDeptCode := ''
  else
    sDeptCode := dept_code.Text;
  if dept_title.Text='' then
    sDeptTitle := ''
  else
    sDeptTitle := dept_title.Text;

  with saveQry do
  begin
    close;
    sql.Clear;
    sql.Add('insert into fhrd_tranhist_before (upd_user,upd_date,'+
    'valid_date,emp_id,pst_code,pst_name,dept_code,dept_title) '+
    'values (:upd_user,:upd_date,:valid_date,:emp_id,:pst_code,'+
    ':pst_name,:dept_code,:dept_title)');
    Parameters.ParamValues['upd_user'] := userName;
    Parameters.ParamValues['upd_date'] := FormatDateTime('yyyy/mm/dd hh:nn:ss',Now);
    Parameters.ParamValues['valid_date'] := FormatDateTime('yyyy/mm/dd',valid_date.Date);
    Parameters.ParamValues['emp_id'] := emp_id.Text;
    Parameters.ParamValues['pst_code'] := LeftStr(pst_code.Text,2);
    Parameters.ParamValues['pst_name'] := RightStr(pst_code.Text,Length(pst_code.Text)-3);
    Parameters.ParamValues['dept_code'] := sDeptCode;
    Parameters.ParamValues['dept_title'] := sDeptTitle;
    try
      ExecSQL;
    except
      showmessage('保存數據失敗');
      exit;
    end;
  end;
  InitGrid;
  dept_code.Text:='';
  dept_title.Text:='';
  emp_id.Text :='';
  emp_id.SetFocus;
end;

procedure TFormfhrd308.emp_idChange(Sender: TObject);
begin
  if Length(emp_id.Text)=6 then
    with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select emp_name from fhrd_emp where emp_id='''+emp_id.Text+''' ');
      try
        open;
      except
      end;
      if RecordCount=0 then
        showmessage('此員工不存在')
      else
        emp_name.Text := FieldBYName('emp_name').Value;
    end;
end;

procedure TFormfhrd308.prnDataClick(Sender: TObject);
begin
  Application.CreateForm(TFormPrtTpl, FormPrtTpl);
  Application.CreateForm(TFormPrtSet, FormPrtSet);
  showPrint(dataQry,'越南清祿公司化工廠海外幹部調升記錄明細表');
end;

end.
