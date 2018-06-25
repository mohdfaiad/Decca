unit CategRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, ExtCtrls, Qrctrls;

type
  TfmCatRep = class(TForm)
    repCategory: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel11: TQRLabel;
    qlCompany: TQRLabel;
    qlUser: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCatRep: TfmCatRep;

implementation

uses
  CTCostDM, ctmain;

{$R *.DFM}

procedure TfmCatRep.FormCreate(Sender: TObject);
begin
  qlCompany.Caption := trim(wCompanyName);
  qlUser.Caption := trim(wUser);
end;

end.
