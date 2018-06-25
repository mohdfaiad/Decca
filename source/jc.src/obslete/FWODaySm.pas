unit FWODaySm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, wwdbedit, Grids, Wwdbigrd, Wwdbgrid, Buttons,
  ExtCtrls;

type
  TfmFWODaySm = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dgrFWODaySm: TwwDBGrid;
    paSelect: TPanel;
    Label1: TLabel;
    dedCostCat: TwwDBEdit;
    mmFWODaySm: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    printSetup: TPrinterSetupDialog;
    laJob_no: TLabel;
    laSubJobNo: TLabel;
    dedJOB_NO: TwwDBEdit;
    dedSubJobNo: TwwDBEdit;
    dedDescri: TwwDBEdit;
    wwDBEdit1: TwwDBEdit;
    laFWO: TLabel;
    dedFWO_NO: TwwDBEdit;
    dedFWODescri: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFWODaySm: TfmFWODaySm;

implementation
  uses JCmain,
       JCdatadm,
       FWOdtDm;
{$R *.DFM}

procedure TfmFWODaySm.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'btnOK';
  //=====================
//  TestProgram( Funcs );
end;

procedure TfmFWODaySm.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmFWODaySm.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmFWODaySm.sbExitClick(Sender: TObject);
begin
  Close;
end;

end.
