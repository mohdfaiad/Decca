unit RpPdDaly;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,RepFwoDm,
  Qrctrls, quickrpt, ExtCtrls;

type
  TfmRpPdDaly = class(TForm)
    qrProdDaly: TQuickRep;
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
    qrlCostCat3: TQRLabel;
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
    qrlCostCat2: TQRLabel;
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
    qrlCostCat4: TQRLabel;
    qrdbtReceiveDate4: TQRDBText;
    qrlSeleDate: TQRLabel;
    procedure QRLabel7Print(sender: TObject; var Value: String);
    procedure qrdbtCompleteDatePrint(sender: TObject; var Value: String);
    procedure qrdbtOrderDatePrint(sender: TObject; var Value: String);
    procedure qrdbtReceiveDatePrint(sender: TObject; var Value: String);
    procedure qrdbtProdDatePrint(sender: TObject; var Value: String);
    procedure qrdbtLastDatePrint(sender: TObject; var Value: String);
    procedure qrdbtReceiveDate4Print(sender: TObject; var Value: String);
    procedure qrdbtFinishDatePrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRpPdDaly: TfmRpPdDaly;

implementation

{$R *.DFM}

procedure TfmRpPdDaly.QRLabel7Print(sender: TObject; var Value: String);
begin
 { if dmRepFwo.quRepDailyReceiveFINISH_FLG.AsString = 'Y' then
    Value := 'V'
  else Value := ' ';  }

end;

procedure TfmRpPdDaly.qrdbtCompleteDatePrint(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdDaly.qrdbtOrderDatePrint(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdDaly.qrdbtReceiveDatePrint(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdDaly.qrdbtProdDatePrint(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdDaly.qrdbtLastDatePrint(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdDaly.qrdbtReceiveDate4Print(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdDaly.qrdbtFinishDatePrint(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

end.
