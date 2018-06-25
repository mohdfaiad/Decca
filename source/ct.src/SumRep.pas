unit SumRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TfmSumRep = class(TForm)
    repSumSimple: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel11: TQRLabel;
    qlCompany: TQRLabel;
    qlUser: TQRLabel;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel16: TQRLabel;
    QRBand4: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand6: TQRBand;
    QRLabel13: TQRLabel;
    QRSysData4: TQRSysData;
    qrbSectionNo: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    qrgSectionNo: TQRGroup;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSumRep: TfmSumRep;

implementation

uses
  CTCostDm, ctmain;

{$R *.DFM}

procedure TfmSumRep.FormCreate(Sender: TObject);
begin
  qlCompany.Caption := trim(wCompanyName);
  qlUser.Caption := trim(wUser);
end;

end.
