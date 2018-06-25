unit RpPdStat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,RepFwoDm,
  Qrctrls, quickrpt, ExtCtrls;

type
  TfmRpPdStat = class(TForm)
    qrProdStat: TQuickRep;
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
    qrlCostCat3: TQRLabel;
    QRGroup1: TQRGroup;
    qrlJobNo: TQRLabel;
    qrdbtJobNo: TQRDBText;
    qrdbtJobDesc: TQRDBText;
    dbJobFwo: TQRBand;
    qrdbtFwoNo: TQRDBText;
    qrdbtFwoDesc: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlCostCat: TQRLabel;
    qrlCostCat2: TQRLabel;
    qrlFinish: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrlFoot1: TQRLabel;
    qrdbtReceiveDate3: TQRDBText;
    qrdbtReceiveDate2: TQRDBText;
    qrdbtCompleteDate: TQRDBText;
    qrdbtQty: TQRDBText;
    qrdbtReceiveDate1: TQRDBText;
    qrlComment: TQRLabel;
    qrlFinishFlg: TQRLabel;
    QRLabel7: TQRLabel;
    qrlCostCat4: TQRLabel;
    qrdbtReceiveDate4: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    qrdbtProdStartDate1: TQRDBText;
    qrdbtLastDate1: TQRDBText;
    qrdbtProdStartDate2: TQRDBText;
    qrdbtLastDate2: TQRDBText;
    qrdbtProdStartDate3: TQRDBText;
    qrdbtLastDate3: TQRDBText;
    qrdbtProdStartDate4: TQRDBText;
    qrdbtLastDate4: TQRDBText;
    qrdbtFinishDate: TQRDBText;
    QRLabel10: TQRLabel;
    qrlSeleDate: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrlStatus4: TQRDBText;
    qrdbtStatus3: TQRDBText;
    qrdbtStatus2: TQRDBText;
    qrdbtStatus1: TQRDBText;
    qrlStatusDescr: TQRLabel;
    procedure qrdbtCompleteDatePrint(sender: TObject; var Value: String);
    procedure qrdbtReceiveDate1Print(sender: TObject; var Value: String);
    procedure qrdbtProdStartDate1Print(sender: TObject; var Value: String);
    procedure qrdbtLastDate1Print(sender: TObject; var Value: String);
    procedure qrdbtReceiveDate2Print(sender: TObject; var Value: String);
    procedure qrdbtProdStartDate2Print(sender: TObject; var Value: String);
    procedure qrdbtLastDate2Print(sender: TObject; var Value: String);
    procedure qrdbtReceiveDate3Print(sender: TObject; var Value: String);
    procedure qrdbtProdStartDate3Print(sender: TObject; var Value: String);
    procedure qrdbtLastDate3Print(sender: TObject; var Value: String);
    procedure qrdbtReceiveDate4Print(sender: TObject; var Value: String);
    procedure qrdbtProdStartDate4Print(sender: TObject; var Value: String);
    procedure qrdbtLastDate4Print(sender: TObject; var Value: String);
    procedure qrdbtFinishDatePrint(sender: TObject; var Value: String);
    procedure QRLabel7Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRpPdStat: TfmRpPdStat;

implementation

{$R *.DFM}

procedure TfmRpPdStat.qrdbtCompleteDatePrint(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.qrdbtReceiveDate1Print(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.qrdbtProdStartDate1Print(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.qrdbtLastDate1Print(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.qrdbtReceiveDate2Print(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.qrdbtProdStartDate2Print(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.qrdbtLastDate2Print(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.qrdbtReceiveDate3Print(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.qrdbtProdStartDate3Print(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.qrdbtLastDate3Print(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.qrdbtReceiveDate4Print(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.qrdbtProdStartDate4Print(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.qrdbtLastDate4Print(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.qrdbtFinishDatePrint(sender: TObject;
  var Value: String);
begin
  if Value <> '' then
    Value := dmRepFwo.DateConvert(StrToDate(Value));
end;

procedure TfmRpPdStat.QRLabel7Print(sender: TObject; var Value: String);
begin
  {if dmRepFwo.quRepProdStatusOFINISH_DATE.AsString <> '' then
    Value := 'V'
  else Value := ' '; }

end;

end.
