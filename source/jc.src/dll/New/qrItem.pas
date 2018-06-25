unit qrItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls, JCStatus, RepFwoDm;

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
    qrlItem: TQRLabel;
    qrlDescription: TQRLabel;
    qrlOrderDate: TQRLabel;
    qrlCompDate: TQRLabel;
    qrlLength: TQRLabel;
    qrlWidth: TQRLabel;
    qrlHeight: TQRLabel;
    dbJobFwo: TQRBand;
    qrlJobCostCat: TQRDBText;
    qrlCatDesc: TQRDBText;
    qrdbtCatUnit: TQRDBText;
    qrdbtPDetailQty: TQRDBText;
    PageFooterBand1: TQRBand;
    qrbFoot: TQRBand;
    qrdbtRDetailAmt: TQRDBText;
    qrdbtPDetailAmt: TQRDBText;
    qrdbtRDetailQty: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    qrlUser: TQRLabel;
    qrlUserName: TQRLabel;
    qrlQty: TQRLabel;
    QRLabel2: TQRLabel;
    QRGroup1: TQRGroup;
    qrlJobNo: TQRLabel;
    qrdbtSiteStatus: TQRDBText;
    QRDBText1: TQRDBText;
    qreP_Detail: TQRExpr;
    qreR_Detail: TQRExpr;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    sbTotal: TQRBand;
    qreP_DetailTot: TQRExpr;
    qreR_DetailTot: TQRExpr;
    qrlSum: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRGroup2: TQRGroup;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    procedure qrdbtPDetailAmtPrint(sender: TObject; var Value: String);
    procedure qreP_DetailPrint(sender: TObject; var Value: String);
    procedure qreP_DetailTotPrint(sender: TObject; var Value: String);
    procedure qrdbtRDetailAmtPrint(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmqrItem: TfmqrItem;

implementation

{$R *.DFM}

procedure TfmqrItem.qrdbtPDetailAmtPrint(sender: TObject;
  var Value: String);
begin
  if Not fmJCStatus.cbPrintAmt.Checked then
    Value := CurrencyString + '0';
end;

procedure TfmqrItem.qreP_DetailPrint(sender: TObject; var Value: String);
begin
  if Not fmJCStatus.cbPrintAmt.Checked then
    Value := CurrencyString + '0'
  else
  begin
    if Value <> '' then
      Value := CurrencyString+ Value ;
  end;
end;

procedure TfmqrItem.qreP_DetailTotPrint(sender: TObject;
  var Value: String);
begin
  if Not fmJCStatus.cbPrintAmt.Checked then
    Value := CurrencyString + '0'
  else
  begin
    if Value <> '' then
      Value := CurrencyString+ Value ;
  end;
end;

procedure TfmqrItem.qrdbtRDetailAmtPrint(sender: TObject;
  var Value: String);
begin
  if Not fmJCStatus.cbPrintAmt.Checked then
    Value := CurrencyString + '0';
end;

procedure TfmqrItem.QRDBText3Print(sender: TObject; var Value: String);
begin
  if Not fmJCStatus.cbPrintAmt.Checked then
    Value := CurrencyString + '0';
end;

end.
