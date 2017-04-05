{*************************************************************************
name：通用報表模板
create date:2005-09-14
modify date:2005-09-16
commentate:通用報表模板
*************************************************************************}
unit UnitPrtTpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBClient, Provider, StdCtrls,
  TntStdCtrls, QRExport, QREditor, ToolWin, ComCtrls, TntComCtrls,
  QRPrntr, ADODB,TntForms;

type
  TFormPrtTpl = class(TtntForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    Label_Date: TQRLabel;
    Label_count: TQRLabel;
    Label_page: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBEG: TQRDBText;
    procedure QRDBEGPrint(sender: TObject; var Value: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrtTpl: TFormPrtTpl;

implementation
uses
  UnitPrtSet;
{$R *.dfm}

procedure TFormPrtTpl.QRDBEGPrint(sender: TObject;
  var Value: WideString);
begin
  with TQRDBText(Sender).DataSet do
  begin
    if FieldByName(TQRDBText(Sender).DataField).DataType in [ftSmallint,ftInteger,ftCurrency,ftBCD,ftFloat,ftLargeint,ftFMTBcd] then
      Value:=FormatFloat(',0',FieldByName(TQRDBText(Sender).DataField).AsFloat);
  end;
end;

end.
