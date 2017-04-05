unit UnitPrtHrd73;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TFormPrtHrd73 = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText19: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText23: TQRDBText;
    qrlblEmp: TQRLabel;
    qrlblName: TQRLabel;
    qrlblDept: TQRLabel;
    qrlblEntryDate: TQRLabel;
    qrlblPrintDate: TQRLabel;
    QrLblDays: TQRLabel;
    QRDBText14: TQRDBText;
    QrLblRate: TQRLabel;
    QRDBText15: TQRDBText;
    QrLblMoney: TQRLabel;
    QRDBText10: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText67: TQRDBText;
    QrLblBasePay: TQRLabel;
    qrlblJob: TQRLabel;
    QRDBText84: TQRDBText;
    qrlblTitle: TQRLabel;
    qrlblCate: TQRLabel;
    QrLblSign: TQRLabel;
    procedure QRPagePrint(sender: TObject; var Value: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrtHrd73: TFormPrtHrd73;

implementation

{$R *.dfm}

procedure TFormPrtHrd73.QRPagePrint(sender: TObject;
  var Value: WideString);
begin
  Value:=IntToStr(QuickRep1.RecordNumber);
end;

end.
