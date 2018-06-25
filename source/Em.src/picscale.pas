unit picscale;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Buttons, Clipbrd;

type
  TfmPicSca = class(TForm)
    dbiPhoto: TDBImage;
    paToolsBar: TPanel;
    sbClose: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    dnaPhoto: TDBNavigator;
    ps_PrinterSetup: TPrinterSetupDialog;
    sbPrint: TSpeedButton;
    ptdScreen: TPrintDialog;
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure sbPrintSetupClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPicSca: TfmPicSca;

implementation

uses
  emdatamd, eqpinfo, prtsfile, emmain;

{$R *.DFM}

procedure TfmPicSca.btnExitClick(Sender: TObject);
begin
  close;
  Release;
end;

procedure TfmPicSca.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
end;

procedure TfmPicSca.sbCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPicSca.sbPrintSetupClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmPicSca.sbPrintClick(Sender: TObject);
begin
  paToolsBar.Visible := False;
  print;
  paToolsBar.Visible := True;
end;

end.
