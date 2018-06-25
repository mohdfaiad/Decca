unit JCRepFwo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,RepFwoDm,
  Qrctrls, quickrpt, ExtCtrls;

type
  TfmJCRepFwo = class(TForm)
    qrRepFwo: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrlTitle: TQRLabel;
    qrlPage: TQRLabel;
    qrsPage: TQRSysData;
    qrlcompany: TQRLabel;
    qrlPrintDate: TQRLabel;
    qrsDate: TQRSysData;
    qrlSelectDate: TQRLabel;
    qrlSelectJobNo: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    qrlFwoNo: TQRLabel;
    qrlDescription: TQRLabel;
    qrlOrderDate: TQRLabel;
    qrlCompDate: TQRLabel;
    qrlLength: TQRLabel;
    qrlWidth: TQRLabel;
    qrlHeight: TQRLabel;
    qrlUnit: TQRLabel;
    QRGroup1: TQRGroup;
    qrlJobNo: TQRLabel;
    qrdbtSiteStatus: TQRDBText;
    QRDBText1: TQRDBText;
    dbJobFwo: TQRBand;
    qrdbtSiteMemoNo: TQRDBText;
    qrdbtSiteMemoDate: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrdbtWidth: TQRDBText;
    qrdbtLength: TQRDBText;
    qrdbtHeight: TQRDBText;
    qrdbtUnit: TQRDBText;
    PageFooterBand1: TQRBand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJCRepFwo: TfmJCRepFwo;

implementation

{$R *.DFM}

end.
