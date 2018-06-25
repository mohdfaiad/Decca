unit RpAlter;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, Wwquery;

type
  TqrAlter = class(TQuickRep)
    quAlterItemRep: TwwQuery;
    StringField12: TStringField;
    IntegerField2: TIntegerField;
    StringField13: TStringField;
    BlobField1: TBlobField;
    StringField14: TStringField;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRBand5: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel12: TQRLabel;
    quAlterItemRepItem_Desc: TStringField;
  private

  public

  end;

var
  qrAlter: TqrAlter;

implementation

{$R *.DFM}

end.
