unit test;

interface

uses
  Windows, Messages, SysUtils, Classes,RepFwoDm, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TfmTest = class(TForm)
    qrtest: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    qrlDecca: TQRLabel;
    qrlTitle: TQRLabel;
    qrlContractNo: TQRLabel;
    qrlContractTitle: TQRLabel;
    qrlSubConName: TQRLabel;
    qrlConstWork: TQRLabel;
    qrlSubconNo: TQRLabel;
    qrlWorkPeriod: TQRLabel;
    qrlLimitRet: TQRLabel;
    qrdbtJobNo: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qrlPrintDate: TQRLabel;
    qrsDate: TQRSysData;
    qrlDoubleLine: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel14: TQRLabel;
    qrlEstSum: TQRLabel;
    qrlDayCer: TQRLabel;
    qrlEstFinal: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrlOne: TQRLabel;
    qrlTwi: TQRLabel;
    qrlThree: TQRLabel;
    qrlFour: TQRLabel;
    qrlFive: TQRLabel;
    qrlSix: TQRLabel;
    qrlSeven: TQRLabel;
    qrlEight: TQRLabel;
    qrmNote: TQRMemo;
    qrlNote: TQRLabel;
    qrlPrepayBy: TQRLabel;
    qrlDate: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrlSubMiss: TQRLabel;
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
    qrlSubPer: TQRLabel;
    qrlQua1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrlExecl: TQRLabel;
    qrlGood: TQRLabel;
    qrlFair: TQRLabel;
    qrlPoor: TQRLabel;
    qrlReason: TQRLabel;
    qrlInsuff: TQRLabel;
    qrlPoorWork: TQRLabel;
    qrlApprove: TQRLabel;
    qrlProject: TQRLabel;
    qrlDate1: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTest: TfmTest;

implementation

{$R *.DFM}

end.
