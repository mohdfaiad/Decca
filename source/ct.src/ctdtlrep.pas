unit ctdtlrep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls,  Db, DBTables;

type
  TfmDtlRep = class(TForm)
    repCosting: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel9: TQRLabel;
    qrbLineNo: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRBand5: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBImage1: TQRDBImage;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    qrgLineNo: TQRGroup;
    QRExpr4: TQRExpr;
    QRLabel14: TQRLabel;
    QRDBText13: TQRDBText;
    qrgSectionNo: TQRGroup;
    qrbSectionNo: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    qlTitle: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText19: TQRDBText;
    procedure repCostingBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDtlRep: TfmDtlRep;

implementation

uses
  CTCostDM, repselct;

{$R *.DFM}


procedure TfmDtlRep.repCostingBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  dmCost.quCostRep.First;
end;

procedure TfmDtlRep.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  with dmCost.quCostRep do
  begin
    if not Eof then
      Next;
  end;
end;

procedure TfmDtlRep.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with dmCost.quCostRep do
  begin
    if not Bof then
      Prior;
  end;
end;

end.
