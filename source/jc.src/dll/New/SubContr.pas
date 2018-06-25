unit SubContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,RepFwoDm,
  Qrctrls, quickrpt, ExtCtrls;

type
  TfmSubContr = class(TForm)
    qrSubContr: TQuickRep;
    PageFooterBand1: TQRBand;
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
    qrlCertNo: TQRLabel;
    QRLabel14: TQRLabel;
    qrlEstSum: TQRLabel;
    qrlDayCer: TQRLabel;
    qrlEstFinal: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    DetailBand1: TQRBand;
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
    QRDBText9: TQRDBText;
    qrlSum: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    qrlApplyDate: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure qrlSumPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSubContr: TfmSubContr;

implementation

{$R *.DFM}

procedure TfmSubContr.QRDBText7Print(sender: TObject; var Value: String);
begin
  if Value = '' then
    Value := '0.0';
end;

procedure TfmSubContr.QRDBText8Print(sender: TObject; var Value: String);
begin
  if Value = '' then
    Value := '0.0';
end;

procedure TfmSubContr.QRDBText10Print(sender: TObject; var Value: String);
begin
  if Value = '' then
    Value := '0.0';
end;

procedure TfmSubContr.QRDBText11Print(sender: TObject; var Value: String);
begin
  if Value = '' then
    Value := '0.0';
end;

procedure TfmSubContr.QRDBText12Print(sender: TObject; var Value: String);
begin
  if Value = '' then
    Value := '0.0';
end;

procedure TfmSubContr.QRDBText13Print(sender: TObject; var Value: String);
begin
  if Value = '' then
    Value := '0.0';
  if (Trim(Value) <> '') then
  Value := '('+ Value +')';
end;

procedure TfmSubContr.QRDBText14Print(sender: TObject; var Value: String);
begin
  if Value = '' then
    Value := '0.0';
end;

procedure TfmSubContr.QRDBText15Print(sender: TObject; var Value: String);
begin
  if Value = '' then
    Value := '0.0';
  if (Trim(Value) <> '') then
  Value := '('+ Value +')';    
end;

procedure TfmSubContr.QRDBText16Print(sender: TObject; var Value: String);
begin
  if Value = '' then
    Value := '0.0';
end;

procedure TfmSubContr.QRDBText17Print(sender: TObject; var Value: String);
begin
  if Value = '' then
    Value := '0.0';
  if (Trim(Value) <> '') then
  Value := '('+ Value +')';    
end;

procedure TfmSubContr.QRDBText18Print(sender: TObject; var Value: String);
begin
  if Value = '' then
    Value := '0.0';
end;

procedure TfmSubContr.qrlSumPrint(sender: TObject; var Value: String);
begin
  if Value = '' then
    Value := '0.0';
  Value := '  '+ CurrencyString + Value;
end;

end.
