unit uFhrd307ReportA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, StdCtrls, TntStdCtrls, DB, ADODB, QRCtrls,strUtils;

type
  TFhrd307ReportA = class(TForm)
    Fhrd307QRep: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRLabel29: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fhrd307ReportA: TFhrd307ReportA;

implementation

uses
  uFhrd307;

{$R *.dfm}


procedure TFhrd307ReportA.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{  night_price.Caption :=
  FloatToStr(strToFloat(QRDBText8.DataSet.FieldValues['night1_price'])+
  strToFloat(QRDBText8.DataSet.FieldValues['night2_price'])+
  strToFloat(QRDBText8.DataSet.FieldValues['night3_price']));

  QRLabel19.Caption :=
  FloatToStr(strtofloat(QRDBText8.DataSet.FieldValues['sal_bas'])+
  strtofloat(QRDBText8.DataSet.FieldValues['sal_frn'])+
  strtofloat(QRDBText8.DataSet.FieldValues['fix_add'])+
  strtofloat(QRDBText8.DataSet.FieldValues['f_award'])+
  strtofloat(night_price.Caption)+
  strtofloat(QRDBText8.DataSet.FieldValues['adjust'])+
  strtofloat(QRDBText8.DataSet.FieldValues['dinner_price']));
  QRLabel20.Caption :=
  FloatToStr(strtofloat(QRDBText8.DataSet.FieldValues['sal_bas'])+
  strtofloat(QRDBText8.DataSet.FieldValues['sal_frn'])+
  strtofloat(QRDBText8.DataSet.FieldValues['fix_add'])+
  strtofloat(QRDBText8.DataSet.FieldValues['night1_price'])+
  strtofloat(QRDBText8.DataSet.FieldValues['adjust'])+
  strtofloat(QRDBText8.DataSet.FieldValues['f_award'])+
  strtofloat(QRDBText8.DataSet.FieldValues['dinner_price'])-
  strtofloat(QRDBText8.DataSet.FieldValues['local_amt']));}

end;

end.
