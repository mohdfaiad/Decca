unit SumDtRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TfmSumDtlRep = class(TForm)
    repSumDetail: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel11: TQRLabel;
    qlUser: TQRLabel;
    QRBand2: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel22: TQRLabel;
    QRBand3: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    qrbJobNo: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRSysData4: TQRSysData;
    qrbSectionNo: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    qlCompany: TQRLabel;
    QRExpr1: TQRExpr;
    qrgJobNo: TQRGroup;
    qrgSectionNo: TQRGroup;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSumDtlRep: TfmSumDtlRep;

implementation

uses
  CTCostDM, ctmain;

{$R *.DFM}

procedure TfmSumDtlRep.FormCreate(Sender: TObject);
begin
  qlCompany.Caption := trim(wCompanyName);
  qlUser.Caption := trim(wUser);
end;

end.
