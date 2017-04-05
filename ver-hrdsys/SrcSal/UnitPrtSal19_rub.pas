{*************************************************************************
Name：PrtSal19_rub(離職補助金單)(化工)
Author: hyt
Create date:2006-09-12
Modify date:2006-09-12
Commentate:離職補助金單(化工)
*************************************************************************}
unit UnitPrtSal19_rub;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TFormPrtSal19_rub = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    Label_titleA2: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText9: TQRDBText;
    QRSysData1: TQRSysData;
    PageFooterBand1: TQRBand;
    DetailBand1: TQRBand;
    QRShape17: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData2: TQRSysData;
    procedure QRDBText7Print(sender: TObject; var Value: WideString);
    procedure QRDBText4Print(sender: TObject; var Value: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrtSal19_rub: TFormPrtSal19_rub;

implementation
uses
  UnitSal19;
{$R *.dfm}

procedure TFormPrtSal19_rub.QRDBText7Print(sender: TObject;
  var Value: WideString);
begin
  Value:=formatDatetime('yyyy/mm/dd',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;

procedure TFormPrtSal19_rub.QRDBText4Print(sender: TObject;
  var Value: WideString);
begin
  Value:=formatfloat(',0',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).Asfloat);
end;

end.
