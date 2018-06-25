unit JCTrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid;

type
  TfmJCTrade = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJCTrade: TfmJCTrade;

implementation

uses JCDatadm, JCMain;

{$R *.DFM}

procedure TfmJCTrade.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  with dmJCData do
    with quTrade do
      if not Active then Open;
end;

procedure TfmJCTrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCData do
    with quTrade do
      if Active then Close;
end;

procedure TfmJCTrade.sbExitClick(Sender: TObject);
begin
  Close;
end;

end.
