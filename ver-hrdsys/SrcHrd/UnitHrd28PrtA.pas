unit UnitHrd28PrtA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TFormHrd28PrtA = class(TForm)
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
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText35: TQRDBText;
    procedure QRDBText25Print(sender: TObject; var Value: WideString);
    procedure QRDBText26Print(sender: TObject; var Value: WideString);
    procedure QRDBText27Print(sender: TObject; var Value: WideString);
    procedure QRDBText8Print(sender: TObject; var Value: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHrd28PrtA: TFormHrd28PrtA;

implementation

{$R *.dfm}

procedure TFormHrd28PrtA.QRDBText25Print(sender: TObject; var Value: WideString);
begin
  Value:=formatDatetime('yyyy',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;

procedure TFormHrd28PrtA.QRDBText26Print(sender: TObject; var Value: WideString);
begin
   Value:=formatDatetime('mm',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;

procedure TFormHrd28PrtA.QRDBText27Print(sender: TObject; var Value: WideString);
begin
   Value:=formatDatetime('dd',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;

procedure TFormHrd28PrtA.QRDBText8Print(sender: TObject;
  var Value: WideString);
begin
   // Value:=copy( TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).Value,1,10) ;
end;

end.
