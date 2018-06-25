unit JobRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls;

type
  TqrJobRep = class(TForm)
    qrRepJobDescr: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRBand5: TQRBand;
    QRSysData1: TQRSysData;
    qrlCompany: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData2: TQRSysData;
    qrlUser: TQRLabel;
    qrlUserID: TQRLabel;
    QRLabel2: TQRLabel;
    qrsSubJob: TQRSubDetail;
    qrlLineNo: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrtComment: TQRDBRichText;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure qrlLineNoPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  qrJobRep: TqrJobRep;

implementation
  uses CTCostDM,
       CTMain;
{$R *.DFM}

procedure TqrJobRep.FormCreate(Sender: TObject);
begin
  qrlUserID.Caption := wUser;
end;

procedure TqrJobRep.qrlLineNoPrint(sender: TObject; var Value: String);
begin
  with dmCost do
  begin
    qrtComment.Height := round(length(quRepSeleSubJobCOMMENT.AsString)/65 *15)+1;
  end;
  qrsSubJob.Height := DetailBand1.Height + qrtComment.Height;
end;

end.
