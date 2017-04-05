{*************************************************************************
Name：PrtSal19_fac(離職補助金單)(鞋廠)
Author: hyt
Create date:2006-09-12
Modify date:2006-09-12
Commentate:離職補助金單(鞋廠)
*************************************************************************}
unit UnitPrtSal19_fac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TFormPrtSal19_fac = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    Label_titleA2: TQRLabel;
    QRDBText9: TQRDBText;
    DetailBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape4: TQRShape;
    QRLabel16: TQRLabel;
    QRShape5: TQRShape;
    QRLabel17: TQRLabel;
    QRShape6: TQRShape;
    QRLabel18: TQRLabel;
    QRShape7: TQRShape;
    QRLabel19: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel20: TQRLabel;
    QRShape10: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape11: TQRShape;
    QRLabel25: TQRLabel;
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
    QRLabel31: TQRLabel;
    QRShape18: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape19: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape20: TQRShape;
    QRLabel36: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel_day: TQRLabel;
    QRLabel_month: TQRLabel;
    QRLabel_year: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel_zuoyeyuan: TQRLabel;
    QRLabel_zhiyuan: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    procedure QRDBText7Print(sender: TObject; var Value: WideString);
    procedure QRDBText4Print(sender: TObject; var Value: WideString);
    procedure QRDBText8Print(sender: TObject; var Value: WideString);
    procedure QRDBText13Print(sender: TObject; var Value: WideString);
    procedure QRDBText10Print(sender: TObject; var Value: WideString);
    procedure QRDBText24Print(sender: TObject; var Value: WideString);
    procedure QRDBText11Print(sender: TObject; var Value: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrtSal19_fac: TFormPrtSal19_fac;

implementation
uses
  UnitHrdUtils,UnitSal19;
{$R *.dfm}

procedure TFormPrtSal19_fac.QRDBText7Print(sender: TObject;
  var Value: WideString);
begin
  Value:=formatDatetime('yyyy/mm/dd',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;

procedure TFormPrtSal19_fac.QRDBText4Print(sender: TObject;
  var Value: WideString);
begin
  Value:=formatfloat(',0',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).Asfloat);
end;

procedure TFormPrtSal19_fac.QRDBText8Print(sender: TObject;
  var Value: WideString);
begin
  Value:=formatDatetime('yyyy',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;

procedure TFormPrtSal19_fac.QRDBText13Print(sender: TObject;
  var Value: WideString);
begin
  Value:=formatDatetime('mm',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;

procedure TFormPrtSal19_fac.QRDBText10Print(sender: TObject;
  var Value: WideString);
begin
  Value:=formatDatetime('dd',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsDateTime );
end;

procedure TFormPrtSal19_fac.QRDBText24Print(sender: TObject;
  var Value: WideString);
var  
  lcsAmt:String;
begin
  //lcsAmt:=formatFloat('0',TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsFloat);
  //Value:=GetVNDBigAMT(strToFloat(lcsAmt));
  Value:=GetVNDBigAMT(TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsFloat,false);
end;

procedure TFormPrtSal19_fac.QRDBText11Print(sender: TObject;
  var Value: WideString);
begin
  if TQRDBText(sender).DataSet.fieldbyname(TQRDBText(sender).DataField).AsString='60' then
    Value:=QRLabel_zuoyeyuan.Caption
  else
    Value:=QRLabel_zhiyuan.Caption;
end;

end.
