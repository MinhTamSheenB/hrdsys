unit UnitHrd28Prt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TFormHrd28Prt = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel63: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel64: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel65: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText1: TQRDBText;
    procedure QRDBText26Print(sender: TObject; var Value: WideString);
    procedure QRDBText25Print(sender: TObject; var Value: WideString);
    procedure QRDBText27Print(sender: TObject; var Value: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd28Prt: TFormHrd28Prt;

implementation

{$R *.dfm}

procedure TFormHrd28Prt.QRDBText26Print(sender: TObject;
  var Value: WideString);
begin
   Value:=formatDatetime('mm',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;

procedure TFormHrd28Prt.QRDBText25Print(sender: TObject;
  var Value: WideString);
begin
  Value:=formatDatetime('yyyy',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;

procedure TFormHrd28Prt.QRDBText27Print(sender: TObject;
  var Value: WideString);
begin
   Value:=formatDatetime('dd',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;

end.
