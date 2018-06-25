unit EmCompany;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, DBCtrls, Buttons, ExtCtrls;

type
  TfmEMComp = class(TForm)
    patoolsbar: TPanel;
    sbexit: TSpeedButton;
    sbPrinterSetup: TSpeedButton;
    dnaEMCompany: TDBNavigator;
    dgrEMCompany: TwwDBGrid;
    ps_PrinterSetup: TPrinterSetupDialog;
    procedure sbexitClick(Sender: TObject);
    procedure sbPrinterSetupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEMComp: TfmEMComp;

implementation

uses EMDataMD;

{$R *.DFM}

procedure TfmEMComp.sbexitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEMComp.sbPrinterSetupClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmEMComp.FormShow(Sender: TObject);
begin
  with dmEMData do
    with quEmCompany do
    begin
      if Active then Close;
      Prepare;
      Open;
    end;
end;

procedure TfmEMComp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmEMData do
    with quEmCompany do
    begin
      if Active then Close;
      if Prepared then Unprepare;
    end;
end;

end.
