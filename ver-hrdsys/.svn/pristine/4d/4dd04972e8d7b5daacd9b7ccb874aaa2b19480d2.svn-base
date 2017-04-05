unit UnitPrthrd12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TFormPrthrd12 = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    Label_titleA2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape5: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape8: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape11: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape12: TQRShape;
    QRLabel28: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel29: TQRLabel;
    QRShape16: TQRShape;
    QRLabel30: TQRLabel;
    QRShape17: TQRShape;
    QRLabel33: TQRLabel;
    QRShape19: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel51: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel67: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape1: TQRShape;
    QRDBText8: TQRDBText;
    QRLabel68: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape2: TQRShape;
    QRLabel69: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel70: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRDBText12: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    DetailBand1: TQRBand;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRLabel21: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape10: TQRShape;
    QRDBText4: TQRDBText;
    QRShape18: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape20: TQRShape;
    QRDBText6: TQRDBText;
    QRShape21: TQRShape;
    QRLabel32: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape25: TQRShape;
    QRDBText14: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel55: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel_zhiyuan: TQRLabel;
    procedure QRDBText8Print(sender: TObject; var Value: WideString);
    procedure QRDBText11Print(sender: TObject; var Value: WideString);
    procedure QRDBText9Print(sender: TObject; var Value: WideString);
     private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrthrd12: TFormPrthrd12;

implementation

{$R *.dfm}

procedure TFormPrthrd12.QRDBText8Print(sender: TObject;
  var Value: WideString);
begin
  Value:=formatDatetime('dd',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;

procedure TFormPrthrd12.QRDBText11Print(sender: TObject;
  var Value: WideString);
begin
  Value:=formatDatetime('yyyy',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;

procedure TFormPrthrd12.QRDBText9Print(sender: TObject;
  var Value: WideString);
begin
  Value:=formatDatetime('mm',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;
    end.
