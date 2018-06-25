unit User;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, Buttons, ExtCtrls, Wwdbigrd, Wwdbgrid;

type
  TfmUser = class(TForm)
    paWorker: TPanel;
    sbExit: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    sbPrint: TSpeedButton;
    DBNavigator1: TDBNavigator;
    dbgUser: TwwDBGrid;
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmUser: TfmUser;

implementation
uses DeccaData;
{$R *.DFM}

procedure TfmUser.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmUser.FormCreate(Sender: TObject);
begin
  with dmDecca do
    with quUserFile do
      if not Active then Open;
end;

procedure TfmUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmDecca do
    with quUserFile do
      if Active then Close;
end;

end.
