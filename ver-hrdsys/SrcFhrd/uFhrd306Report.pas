unit uFhrd306Report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, StdCtrls, TntStdCtrls, DB, ADODB, QRCtrls;

type
  TFhrd306Report = class(TForm)
    Fhrd306QRep: TQuickRep;
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
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    valid_date: TQRDBText;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel33: TQRLabel;
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
    QRLabel48: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel24: TQRLabel;
    procedure QRLabel24Print(sender: TObject; var Value: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fhrd306Report: TFhrd306Report;

implementation

uses uFhrd306;

{$R *.dfm}

procedure TFhrd306Report.QRLabel24Print(sender: TObject;
  var Value: WideString);
begin
  QRlabel24.Caption := IntToStr(Fhrd306Qrep.PageNumber);
end;

end.
