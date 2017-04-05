{*************************************************************************
Name：PrtSal12
Author: anil
Create date:2005-09-06
Modify date:2005-09-08
Commentate:薪資單/薪資表列印
*************************************************************************}
unit UnitPrtSal12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TFormPrtSal12 = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText19: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText26: TQRDBText;
    qrlblDuty: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText44: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText45: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText46: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText58: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText38: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel53: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText49: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText51: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRPage: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText60: TQRDBText;
    QRLabel55: TQRLabel;
    QRLabel59: TQRLabel;
    QRDBText47: TQRDBText;
    QRLabel60: TQRLabel;
    QRDBText57: TQRDBText;
    QRLabel61: TQRLabel;
    QRDBText59: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel62: TQRLabel;
    QRDBText62: TQRDBText;
    QRLabel77: TQRLabel;
    QRDBText81: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText52: TQRDBText;
    QRDBText67: TQRDBText;
    QRLabel63: TQRLabel;
    QRLabel72: TQRLabel;
    QRDBText76: TQRDBText;
    QRLabel81: TQRLabel;
    QRDBText84: TQRDBText;
    QRLabel64: TQRLabel;
    QRDBText68: TQRDBText;
    QRLabel67: TQRLabel;
    QRDBText69: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText72: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText73: TQRDBText;
    QRLabel65: TQRLabel;
    QRDBText74: TQRDBText;
    QRLabel66: TQRLabel;
    QRIfBank: TQRLabel;
    QRLabel68: TQRLabel;
    QRDBText75: TQRDBText;
    QRLabel69: TQRLabel;
    QRDBText77: TQRDBText;
    qrlblGrad: TQRLabel;
    QRDBText78: TQRDBText;
    qrlblDuoxiubukou: TQRLabel;
    QRDBText80: TQRDBText;
    procedure QRDBText13Print(sender: TObject; var Value: WideString);
    procedure QRPagePrint(sender: TObject; var Value: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrtSal12: TFormPrtSal12;

implementation
uses
  UnitSal12;
{$R *.dfm}

procedure TFormPrtSal12.QRDBText13Print(sender: TObject;
  var Value: WideString);
begin
  Value:=formatfloat(',0',TQRDBText(Sender).DataSet.fieldbyname(TQRDBText(Sender).DataField).Asfloat);
end;

procedure TFormPrtSal12.QRPagePrint(sender: TObject;
  var Value: WideString);
begin
  Value:=IntToStr(QuickRep1.RecordNumber);
end;

end.
