unit CCAmtRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrSltCtCatAmt = class(TQuickRep)
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
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel16: TQRLabel;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    qrdbCostCat1BudAmt: TQRDBText;
    qrdbCostCat1ActAmt: TQRDBText;
    qrdbCostCat1StdAmt: TQRDBText;
    QRDBText14: TQRDBText;
    qrlCostCat1: TQRLabel;
    qrlCostCat2: TQRLabel;
    qrlCostCat3: TQRLabel;
    qrlCostCat4: TQRLabel;
    qrlCostCat5: TQRLabel;
    qrlCostCat6: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    qrdbCostCat2BudAmt: TQRDBText;
    qrdbCostCat2ActAmt: TQRDBText;
    qrdbCostCat2StdAmt: TQRDBText;
    qrdbCostCat3BudAmt: TQRDBText;
    qrdbCostCat3ActAmt: TQRDBText;
    qrdbCostCat3StdAmt: TQRDBText;
    qrdbCostCat4BudAmt: TQRDBText;
    qrdbCostCat4ActAmt: TQRDBText;
    qrdbCostCat4StdAmt: TQRDBText;
    qrdbCostCat5StdAmt: TQRDBText;
    qrdbCostCat5ActAmt: TQRDBText;
    qrdbCostCat5BudAmt: TQRDBText;
    qrdbCostCat6BudAmt: TQRDBText;
    qrdbCostCat6ActAmt: TQRDBText;
    qrdbCostCat6StdAmt: TQRDBText;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    qreCC1BudAmt: TQRExpr;
    qreCC1ActAmt: TQRExpr;
    qreCC1StdAmt: TQRExpr;
    qreCC2BudAmt: TQRExpr;
    qreCC2ActAmt: TQRExpr;
    qreCC2StdAmt: TQRExpr;
    qreCC3BudAmt: TQRExpr;
    qreCC3ActAmt: TQRExpr;
    qreCC3StdAmt: TQRExpr;
    qreCC4BudAmt: TQRExpr;
    qreCC4ActAmt: TQRExpr;
    qreCC4StdAmt: TQRExpr;
    qreCC5BudAmt: TQRExpr;
    qreCC5ActAmt: TQRExpr;
    qreCC5StdAmt: TQRExpr;
    qreCC6BudAmt: TQRExpr;
    qreCC6ActAmt: TQRExpr;
    qreCC6StdAmt: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    procedure qrSltCtCatAmtBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qrSltCtCatAmt: TqrSltCtCatAmt;

implementation

uses
  CTCostDM, ctmain, CCRepDlg;

{$R *.DFM}


procedure TqrSltCtCatAmt.qrSltCtCatAmtBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
var
  i : integer;
begin
  qrlCompany.Caption := wCompanyName;
  qrlUserID.Caption := wUser;
  i := fmCCRepDlg.DstList.Items.Count;
  if i = 1 then
  begin
    qrdbCostCat2BudAmt.Enabled := False;
    qrdbCostCat2ActAmt.Enabled := False;
    qrdbCostCat2StdAmt.Enabled := False;
    qrdbCostCat3BudAmt.Enabled := False;
    qrdbCostCat3ActAmt.Enabled := False;
    qrdbCostCat3StdAmt.Enabled := False;
    qrdbCostCat4BudAmt.Enabled := False;
    qrdbCostCat4ActAmt.Enabled := False;
    qrdbCostCat4StdAmt.Enabled := False;
    qrdbCostCat5BudAmt.Enabled := False;
    qrdbCostCat5ActAmt.Enabled := False;
    qrdbCostCat5StdAmt.Enabled := False;
    qrdbCostCat6BudAmt.Enabled := False;
    qrdbCostCat6ActAmt.Enabled := False;
    qrdbCostCat6StdAmt.Enabled := False;
    qreCC2BudAmt.Enabled := False;
    qreCC2ActAmt.Enabled := False;
    qreCC2StdAmt.Enabled := False;
    qreCC3BudAmt.Enabled := False;
    qreCC3ActAmt.Enabled := False;
    qreCC3StdAmt.Enabled := False;
    qreCC4BudAmt.Enabled := False;
    qreCC4ActAmt.Enabled := False;
    qreCC4StdAmt.Enabled := False;
    qreCC5BudAmt.Enabled := False;
    qreCC5ActAmt.Enabled := False;
    qreCC5StdAmt.Enabled := False;
    qreCC6BudAmt.Enabled := False;
    qreCC6ActAmt.Enabled := False;
    qreCC6StdAmt.Enabled := False;
  end
  else
  if i = 2 then
  begin
    qrdbCostCat3BudAmt.Enabled := False;
    qrdbCostCat3ActAmt.Enabled := False;
    qrdbCostCat3StdAmt.Enabled := False;
    qrdbCostCat4BudAmt.Enabled := False;
    qrdbCostCat4ActAmt.Enabled := False;
    qrdbCostCat4StdAmt.Enabled := False;
    qrdbCostCat5BudAmt.Enabled := False;
    qrdbCostCat5ActAmt.Enabled := False;
    qrdbCostCat5StdAmt.Enabled := False;
    qrdbCostCat6BudAmt.Enabled := False;
    qrdbCostCat6ActAmt.Enabled := False;
    qrdbCostCat6StdAmt.Enabled := False;
    qreCC3BudAmt.Enabled := False;
    qreCC3ActAmt.Enabled := False;
    qreCC3StdAmt.Enabled := False;
    qreCC4BudAmt.Enabled := False;
    qreCC4ActAmt.Enabled := False;
    qreCC4StdAmt.Enabled := False;
    qreCC5BudAmt.Enabled := False;
    qreCC5ActAmt.Enabled := False;
    qreCC5StdAmt.Enabled := False;
    qreCC6BudAmt.Enabled := False;
    qreCC6ActAmt.Enabled := False;
    qreCC6StdAmt.Enabled := False;
  end
  else
  if i = 3 then
  begin
    qrdbCostCat4BudAmt.Enabled := False;
    qrdbCostCat4ActAmt.Enabled := False;
    qrdbCostCat4StdAmt.Enabled := False;
    qrdbCostCat5BudAmt.Enabled := False;
    qrdbCostCat5ActAmt.Enabled := False;
    qrdbCostCat5StdAmt.Enabled := False;
    qrdbCostCat6BudAmt.Enabled := False;
    qrdbCostCat6ActAmt.Enabled := False;
    qrdbCostCat6StdAmt.Enabled := False;
    qreCC4BudAmt.Enabled := False;
    qreCC4ActAmt.Enabled := False;
    qreCC4StdAmt.Enabled := False;
    qreCC5BudAmt.Enabled := False;
    qreCC5ActAmt.Enabled := False;
    qreCC5StdAmt.Enabled := False;
    qreCC6BudAmt.Enabled := False;
    qreCC6ActAmt.Enabled := False;
    qreCC6StdAmt.Enabled := False;
  end
  else
  if i = 4 then
  begin
    qrdbCostCat5BudAmt.Enabled := False;
    qrdbCostCat5ActAmt.Enabled := False;
    qrdbCostCat5StdAmt.Enabled := False;
    qrdbCostCat6BudAmt.Enabled := False;
    qrdbCostCat6ActAmt.Enabled := False;
    qrdbCostCat6StdAmt.Enabled := False;
    qreCC5BudAmt.Enabled := False;
    qreCC5ActAmt.Enabled := False;
    qreCC5StdAmt.Enabled := False;
    qreCC6BudAmt.Enabled := False;
    qreCC6ActAmt.Enabled := False;
    qreCC6StdAmt.Enabled := False;
  end
  else
  if i = 5 then
  begin
    qrdbCostCat6BudAmt.Enabled := False;
    qrdbCostCat6ActAmt.Enabled := False;
    qrdbCostCat6StdAmt.Enabled := False;
    qreCC6BudAmt.Enabled := False;
    qreCC6ActAmt.Enabled := False;
    qreCC6StdAmt.Enabled := False;
  end

end;

end.
