unit RpPdDone;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,RepFwoDm,
  Qrctrls, quickrpt, ExtCtrls;

type
  TfmRpPdDone = class(TForm)
    qrProdDone: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrlTitle: TQRLabel;
    qrlPage: TQRLabel;
    qrsPage: TQRSysData;
    qrlcompany: TQRLabel;
    qrlPrintDate: TQRLabel;
    qrsDate: TQRSysData;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    qrlUser: TQRLabel;
    qrlUserName: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    qrlFwoNo: TQRLabel;
    qrlDescription: TQRLabel;
    qrlOrderDate: TQRLabel;
    qrlCompDate: TQRLabel;
    QRGroup1: TQRGroup;
    qrlJobNo: TQRLabel;
    qrdbtJobNo: TQRDBText;
    qrdbtJobDesc: TQRDBText;
    dbJobFwo: TQRBand;
    qrdbtFwoNo: TQRDBText;
    qrdbtFwoDesc: TQRDBText;
    qrdbtFinishDate: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrlCostCat: TQRLabel;
    QRLabel6: TQRLabel;
    qrlFinish: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrlFoot1: TQRLabel;
    qrdbtLastDate: TQRDBText;
    qrdbtProdDate: TQRDBText;
    qrdbtOrderDate: TQRDBText;
    qrdbtOrderBy: TQRDBText;
    qrdbtCompleteDate: TQRDBText;
    qrdbtQty: TQRDBText;
    qrdbtReceiveDate: TQRDBText;
    qrlComment: TQRLabel;
    qrlFinishFlg: TQRLabel;
    QRLabel7: TQRLabel;
    procedure QRLabel7Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRpPdDone: TfmRpPdDone;

implementation

{$R *.DFM}

procedure TfmRpPdDone.QRLabel7Print(sender: TObject; var Value: String);
begin
  if dmRepFwo.quRepProductFINISH_FLG.AsString = 'Y' then
    Value := 'V'
  else Value := ' ';

end;

end.
