unit uFhrd305Report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, StdCtrls, TntStdCtrls, DB, ADODB, QRCtrls;

type
  TFhrd305Report = class(TForm)
    Fhrd305QRep: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    TitleBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel21: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel51: TQRLabel;
    procedure QRLabel2Print(sender: TObject; var Value: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fhrd305Report: TFhrd305Report;

implementation

uses uFhrd305;

{$R *.dfm}

procedure TFhrd305Report.QRLabel2Print(sender: TObject;
  var Value: WideString);
begin
  QRLabel2.Caption := IntToStr(Fhrd305QRep.PageNumber);
end;

end.
