unit Photo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Buttons, ExtCtrls;

type
  TfmPhoto = class(TForm)
    dimPhoto: TDBImage;
    paWorker: TPanel;
    sbPrint: TSpeedButton;
    sbExit: TSpeedButton;
    SpeedButton1: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    psdPrinter: TPrinterSetupDialog;
    procedure sbExitClick(Sender: TObject);
    procedure sbPrintSetupClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPhoto: TfmPhoto;

implementation
  uses JCdatadm,jcmain;
{$R *.DFM}

procedure TfmPhoto.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPhoto.sbPrintSetupClick(Sender: TObject);
begin
  psdPrinter.Execute;
end;

procedure TfmPhoto.sbPrintClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmPhoto.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
end;

end.
