unit ptsIOInf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, wwdblook, StdCtrls, wwSpeedButton,
  wwDBNavigator, Buttons, ExtCtrls, Menus;

type
  TfmPtsIOInf = class(TForm)
    mmEQPInfo: TMainMenu;
    miFile: TMenuItem;
    miPrintSetUp: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miInfo: TMenuItem;
    miReport: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    patoolsbar: TPanel;
    sbexit: TSpeedButton;
    sbPrinterSetup: TSpeedButton;
    wwDBNavigator1: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    gbEQPStatus: TGroupBox;
    ckIn: TCheckBox;
    ckOut: TCheckBox;
    edServ_No: TEdit;
    wwDBLookupCombo1: TwwDBLookupCombo;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    DateTimePicker2: TDateTimePicker;
    dgrSupplierFind: TwwDBGrid;
    procedure miPrintSetUpClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPtsIOInf: TfmPtsIOInf;

implementation

uses emdatamd;

{$R *.DFM}

procedure TfmPtsIOInf.miPrintSetUpClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmPtsIOInf.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPtsIOInf.FormCreate(Sender: TObject);
begin

end;

end.
