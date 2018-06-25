unit CCQtyRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Dialogs;

type
  TqrSltCtCatQty = class(TQuickRep)
    qrgQuotNo: TQRGroup;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    qrdbCostCat1BudQty: TQRDBText;
    qrdbCostCat1ActQty: TQRDBText;
    qrdbCostCat1StdQty: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText2: TQRDBText;
    qrdbCostCat2BudQty: TQRDBText;
    qrdbCostCat2ActQty: TQRDBText;
    qrdbCostCat2StdQty: TQRDBText;
    qrdbCostCat3BudQty: TQRDBText;
    qrdbCostCat3ActQty: TQRDBText;
    qrdbCostCat3StdQty: TQRDBText;
    qrdbCostCat4BudQty: TQRDBText;
    qrdbCostCat4ActQty: TQRDBText;
    qrdbCostCat4StdQty: TQRDBText;
    qrdbCostCat5StdQty: TQRDBText;
    qrdbCostCat5ActQty: TQRDBText;
    qrdbCostCat5BudQty: TQRDBText;
    qrdbCostCat6BudQty: TQRDBText;
    qrdbCostCat6ActQty: TQRDBText;
    qrdbCostCat6StdQty: TQRDBText;
    QRBand1: TQRBand;
    qreCC1BudQty: TQRExpr;
    qreCC1ActQty: TQRExpr;
    qreCC1StdQty: TQRExpr;
    QRBand2: TQRBand;
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
    QRLabel2: TQRLabel;
    qreCC2BudQty: TQRExpr;
    qreCC2ActQty: TQRExpr;
    qreCC2StdQty: TQRExpr;
    qreCC3BudQty: TQRExpr;
    qreCC3ActQty: TQRExpr;
    qreCC3StdQty: TQRExpr;
    qreCC4ActQty: TQRExpr;
    qreCC4BudQty: TQRExpr;
    qreCC4StdQty: TQRExpr;
    qreCC5BudQty: TQRExpr;
    qreCC5ActQty: TQRExpr;
    qreCC5StdQty: TQRExpr;
    qreCC6BudQty: TQRExpr;
    qreCC6ActQty: TQRExpr;
    qreCC6StdQty: TQRExpr;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel16: TQRLabel;
    qrlCostCat1: TQRLabel;
    qrlCostCat2: TQRLabel;
    qrlCostCat3: TQRLabel;
    qrlCostCat4: TQRLabel;
    qrlCostCat5: TQRLabel;
    qrlCostCat6: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    procedure qrSltItmQtyBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qrSltCtCatQty: TqrSltCtCatQty;

implementation

uses
  CTCostDM, ctmain, CCRepDlg;

{$R *.DFM}

procedure TqrSltCtCatQty.qrSltItmQtyBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
var
  i : integer;
begin
  qrlCompany.Caption := wCompanyName;
  qrlUserID.Caption := wUser;
  i := fmCCRepDlg.DstList.Items.Count;
  if i = 1 then
  begin
    qrdbCostCat2BudQty.Enabled := False;
    qrdbCostCat2ActQty.Enabled := False;
    qrdbCostCat2StdQty.Enabled := False;
    qrdbCostCat3BudQty.Enabled := False;
    qrdbCostCat3ActQty.Enabled := False;
    qrdbCostCat3StdQty.Enabled := False;
    qrdbCostCat4BudQty.Enabled := False;
    qrdbCostCat4ActQty.Enabled := False;
    qrdbCostCat4StdQty.Enabled := False;
    qrdbCostCat5BudQty.Enabled := False;
    qrdbCostCat5ActQty.Enabled := False;
    qrdbCostCat5StdQty.Enabled := False;
    qrdbCostCat6BudQty.Enabled := False;
    qrdbCostCat6ActQty.Enabled := False;
    qrdbCostCat6StdQty.Enabled := False;
    qreCC2BudQty.Enabled := False;
    qreCC2ActQty.Enabled := False;
    qreCC2StdQty.Enabled := False;
    qreCC3BudQty.Enabled := False;
    qreCC3ActQty.Enabled := False;
    qreCC3StdQty.Enabled := False;
    qreCC4BudQty.Enabled := False;
    qreCC4ActQty.Enabled := False;
    qreCC4StdQty.Enabled := False;
    qreCC5BudQty.Enabled := False;
    qreCC5ActQty.Enabled := False;
    qreCC5StdQty.Enabled := False;
    qreCC6BudQty.Enabled := False;
    qreCC6ActQty.Enabled := False;
    qreCC6StdQty.Enabled := False;
  end
  else
  if i = 2 then
  begin
    qrdbCostCat3BudQty.Enabled := False;
    qrdbCostCat3ActQty.Enabled := False;
    qrdbCostCat3StdQty.Enabled := False;
    qrdbCostCat4BudQty.Enabled := False;
    qrdbCostCat4ActQty.Enabled := False;
    qrdbCostCat4StdQty.Enabled := False;
    qrdbCostCat5BudQty.Enabled := False;
    qrdbCostCat5ActQty.Enabled := False;
    qrdbCostCat5StdQty.Enabled := False;
    qrdbCostCat6BudQty.Enabled := False;
    qrdbCostCat6ActQty.Enabled := False;
    qrdbCostCat6StdQty.Enabled := False;
    qreCC3BudQty.Enabled := False;
    qreCC3ActQty.Enabled := False;
    qreCC3StdQty.Enabled := False;
    qreCC4BudQty.Enabled := False;
    qreCC4ActQty.Enabled := False;
    qreCC4StdQty.Enabled := False;
    qreCC5BudQty.Enabled := False;
    qreCC5ActQty.Enabled := False;
    qreCC5StdQty.Enabled := False;
    qreCC6BudQty.Enabled := False;
    qreCC6ActQty.Enabled := False;
    qreCC6StdQty.Enabled := False;
  end
  else
  if i = 3 then
  begin
    qrdbCostCat4BudQty.Enabled := False;
    qrdbCostCat4ActQty.Enabled := False;
    qrdbCostCat4StdQty.Enabled := False;
    qrdbCostCat5BudQty.Enabled := False;
    qrdbCostCat5ActQty.Enabled := False;
    qrdbCostCat5StdQty.Enabled := False;
    qrdbCostCat6BudQty.Enabled := False;
    qrdbCostCat6ActQty.Enabled := False;
    qrdbCostCat6StdQty.Enabled := False;
    qreCC4BudQty.Enabled := False;
    qreCC4ActQty.Enabled := False;
    qreCC4StdQty.Enabled := False;
    qreCC5BudQty.Enabled := False;
    qreCC5ActQty.Enabled := False;
    qreCC5StdQty.Enabled := False;
    qreCC6BudQty.Enabled := False;
    qreCC6ActQty.Enabled := False;
    qreCC6StdQty.Enabled := False;
  end
  else
  if i = 4 then
  begin
    qrdbCostCat5BudQty.Enabled := False;
    qrdbCostCat5ActQty.Enabled := False;
    qrdbCostCat5StdQty.Enabled := False;
    qrdbCostCat6BudQty.Enabled := False;
    qrdbCostCat6ActQty.Enabled := False;
    qrdbCostCat6StdQty.Enabled := False;
    qreCC5BudQty.Enabled := False;
    qreCC5ActQty.Enabled := False;
    qreCC5StdQty.Enabled := False;
    qreCC6BudQty.Enabled := False;
    qreCC6ActQty.Enabled := False;
    qreCC6StdQty.Enabled := False;
  end
  else
  if i = 5 then
  begin
    qrdbCostCat6BudQty.Enabled := False;
    qrdbCostCat6ActQty.Enabled := False;
    qrdbCostCat6StdQty.Enabled := False;
    qreCC6BudQty.Enabled := False;
    qreCC6ActQty.Enabled := False;
    qreCC6StdQty.Enabled := False;
  end

end;

end.
