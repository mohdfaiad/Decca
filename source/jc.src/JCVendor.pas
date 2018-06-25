unit JCVendor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBTables, Wwquery, wwSpeedButton, wwDBNavigator, Buttons,
  ExtCtrls, Grids, DBGrids, Wwdbigrd, Wwdbgrid;

type
  TfmJCVendor = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaJob_cost_type: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBGrid1: TwwDBGrid;
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJCVendor: TfmJCVendor;

implementation

uses JCDatadm, JCMain;
{$R *.DFM}

procedure TfmJCVendor.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJCVendor.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  with dmJCData do
    with quVendor do
      if not Active then Open;
end;

procedure TfmJCVendor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCData do
    with quVendor do
      if Active then Close;
end;

end.
