unit qrJobItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls,RepFwoDm;

type
  TfmqrItem = class(TForm)
    qrJob: TQuickRep;
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
    qrdbtUnit: TQRDBText;
    PageFooterBand1: TQRBand;
    QRBand1: TQRBand;
    qrlFoot1: TQRLabel;
    qrlFoot2: TQRLabel;
    qrdbtHeight: TQRDBText;
    qrdbtWidth: TQRDBText;
    qrdbtLength: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    qrlUser: TQRLabel;
    qrlUserName: TQRLabel;
    qrlSeleFwoType: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmqrItem: TfmqrItem;

implementation
  uses PrjItem;
{$R *.DFM}

end.
