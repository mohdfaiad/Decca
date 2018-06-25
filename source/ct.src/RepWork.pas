unit RepWork;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrRepWork = class(TQuickRep)
    QRBand5: TQRBand;
    QRDBText7: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    qrlCompany: TQRLabel;
    QRSysData3: TQRSysData;
    QRDBText8: TQRDBText;
    QRSysData2: TQRSysData;
    qrlUser: TQRLabel;
    qrlUserID: TQRLabel;
    qrlTitle: TQRLabel;
    QRBand3: TQRBand;
    qrlItem: TQRLabel;
    qrlStdQTY: TQRLabel;
    qrlActualQTY: TQRLabel;
    qrlBudgetPre: TQRLabel;
    qrlBudgetQTY: TQRLabel;
    qrlCalculPre: TQRLabel;
    qrlDescription: TQRLabel;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRGroup1: TQRGroup;
    qrlSectionNo: TQRLabel;
    qrdbtSection: TQRDBText;
    qrdbtDescription: TQRDBText;
    qrdbtBudgetQTY: TQRDBText;
    qrdbtStdQTY: TQRDBText;
    qrdbtActQty: TQRDBText;
    qrdbtBudgetPre: TQRDBText;
    qrdbtCalcuPre: TQRDBText;
    qrlBudgetAmt: TQRLabel;
    qrlStdAmount: TQRLabel;
    qrlActAMT: TQRLabel;
    qrlUnit: TQRLabel;
    qrdbtStdAmt: TQRDBText;
    qrdbtActAmt: TQRDBText;
    qrdbtQtyUnit: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrlComment: TQRLabel;
    qrdbtBudgetAmt: TQRDBText;
    qrlMatterAns: TQRLabel;
    qrlICQmater: TQRLabel;
    qrlBedPrj: TQRLabel;
    qrlTCAns: TQRLabel;
    qrlInform: TQRLabel;
    qrlPrjOver: TQRLabel;
    qrlLine: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBRichText1: TQRDBRichText;
    QRLabel17: TQRLabel;
    procedure qrdbtCalcuPrePrint(sender: TObject; var Value: String);
    procedure qrlBedPrjPrint(sender: TObject; var Value: String);
    procedure qrlICQmaterPrint(sender: TObject; var Value: String);
    procedure qrlMatterAnsPrint(sender: TObject; var Value: String);
    procedure qrlTCAnsPrint(sender: TObject; var Value: String);
    procedure qrlInformPrint(sender: TObject; var Value: String);
    procedure qrlPrjOverPrint(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qrRepWork: TqrRepWork;

implementation
  uses CTCostDM,
       CTMain;
  var Status : String[1];     
{$R *.DFM}

procedure TqrRepWork.qrdbtCalcuPrePrint(sender: TObject;
  var Value: String);
begin
  if ((Trim(Value)<>'') and (value <>'¤£¯à­pºâ')) then
    Value := Value +'%';
end;

procedure TqrRepWork.qrlBedPrjPrint(sender: TObject; var Value: String);
begin
  if Status = '1' then
  begin
    qrlBedPrj.Frame.DrawTop := True;
    qrlBedPrj.Frame.DrawBottom := True;
    qrlBedPrj.Frame.DrawLeft := True;
    qrlBedPrj.Frame.DrawRight := True;
  end else
  begin
    qrlBedPrj.Frame.DrawTop := False;
    qrlBedPrj.Frame.DrawBottom := False;
    qrlBedPrj.Frame.DrawLeft := False;
    qrlBedPrj.Frame.DrawRight := False;
  end;
end;

procedure TqrRepWork.qrlICQmaterPrint(sender: TObject; var Value: String);
begin
  if status = '2' then
  begin
    qrlICQmater.Frame.DrawTop := True;
    qrlICQmater.Frame.DrawBottom := True;
    qrlICQmater.Frame.DrawLeft := True;
    qrlICQmater.Frame.DrawRight := True;
  end else
  begin
    qrlICQmater.Frame.DrawTop := False;
    qrlICQmater.Frame.DrawBottom := False;
    qrlICQmater.Frame.DrawLeft := False;
    qrlICQmater.Frame.DrawRight := False;
  end;
end;

procedure TqrRepWork.qrlMatterAnsPrint(sender: TObject; var Value: String);
begin
  if status = '3' then
  begin
    qrlMatterAns.Frame.DrawTop := True;
    qrlMatterAns.Frame.DrawBottom := True;
    qrlMatterAns.Frame.DrawLeft := True;
    qrlMatterAns.Frame.DrawRight := True;
  end else
  begin
    qrlMatterAns.Frame.DrawTop := False;
    qrlMatterAns.Frame.DrawBottom := False;
    qrlMatterAns.Frame.DrawLeft := False;
    qrlMatterAns.Frame.DrawRight := False;
  end;
end;

procedure TqrRepWork.qrlTCAnsPrint(sender: TObject; var Value: String);
begin
  if status = '4' then
  begin
    qrlTCAns.Frame.DrawTop := True;
    qrlTCAns.Frame.DrawBottom := True;
    qrlTCAns.Frame.DrawLeft := True;
    qrlTCAns.Frame.DrawRight := True;
  end else
  begin
    qrlTCAns.Frame.DrawTop := False;
    qrlTCAns.Frame.DrawBottom := False;
    qrlTCAns.Frame.DrawLeft := False;
    qrlTCAns.Frame.DrawRight := False;
  end
end;

procedure TqrRepWork.qrlInformPrint(sender: TObject; var Value: String);
begin
  if Status = '5' then
  begin
    qrlInform.Frame.DrawTop := True;
    qrlInform.Frame.DrawBottom := True;
    qrlInform.Frame.DrawLeft := True;
    qrlInform.Frame.DrawRight := True;
  end else
  begin
    qrlInform.Frame.DrawTop := False;
    qrlInform.Frame.DrawBottom := False;
    qrlInform.Frame.DrawLeft := False;
    qrlInform.Frame.DrawRight := False;
  end;
end;

procedure TqrRepWork.qrlPrjOverPrint(sender: TObject; var Value: String);
begin
  if status = '6' then
  begin
    qrlPrjOver.Frame.DrawTop := True;
    qrlPrjOver.Frame.DrawBottom := True;
    qrlPrjOver.Frame.DrawLeft := True;
    qrlPrjOver.Frame.DrawRight := True;
  end else
  begin
    qrlPrjOver.Frame.DrawTop := False;
    qrlPrjOver.Frame.DrawBottom := False;
    qrlPrjOver.Frame.DrawLeft := False;
    qrlPrjOver.Frame.DrawRight := False;
  end;
end;

procedure TqrRepWork.QRDBText7Print(sender: TObject; var Value: String);
begin
  Status := dmCost.quRepJobstatus.AsString ;
end;

end.
