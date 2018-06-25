unit ProfitCtr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  Mask, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TfmProfitCtr = class(TForm)
    dgrProdDept: TwwDBGrid;
    paDept: TPanel;
    SpeedButton4: TSpeedButton;
    sbExit: TSpeedButton;
    sbPrint: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    dnaDept: TDBNavigator;
    ps_PrintSetup: TPrinterSetupDialog;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    wwDBComboBox1: TwwDBComboBox;
    procedure MenuItem4Click(Sender: TObject);
    procedure sbPrintSetupClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure rgProfitCtrSegClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProfitCtr: TfmProfitCtr;

implementation
uses IcData;
{$R *.DFM}

procedure TfmProfitCtr.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TfmProfitCtr.sbPrintSetupClick(Sender: TObject);
begin
  ps_PrintSetup.Execute;
end;

procedure TfmProfitCtr.sbPrintClick(Sender: TObject);
begin
  Print;
end;

procedure TfmProfitCtr.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmProfitCtr.rgProfitCtrSegClick(Sender: TObject);
begin
 //if rgProfitCtrSeg.ItemIndex  then
end;

procedure TfmProfitCtr.FormCreate(Sender: TObject);
begin
  with  dmICData.quProfitCtr  do
  begin
    if not Active then
      Open;
  end;
end;

procedure TfmProfitCtr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with  dmICData.quProfitCtr  do
  begin
    if Active then
      Close;
  end;
end;

end.
