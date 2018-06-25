unit CtDaySmy;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, wwdbedit, StdCtrls, wwdblook, Grids, Wwdbigrd, Wwdbgrid,
  Buttons, ExtCtrls;

type
  TfmCtDaySmy = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dgrCtDaySum: TwwDBGrid;
    paSelect: TPanel;
    laJob_no: TLabel;
    laCostCat: TLabel;
    dedJOB_NO: TwwDBEdit;
    dedCostCat: TwwDBEdit;
    mmCostCat: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    printSetup: TPrinterSetupDialog;
    dedSubNo: TwwDBEdit;
    laSubNo: TLabel;
    dedDescri: TwwDBEdit;
    dedCatDescri: TwwDBEdit;
    dedSubDescription: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCtDaySmy: TfmCtDaySmy;

implementation

uses JCdatadm,
     FWOdtDm,
     JCmain;

{$R *.DFM}

procedure TfmCtDaySmy.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
//  Funcs[1] := 'All';
  //=====================
//  fmJCmain.TestProgram( Funcs );
  with dmJCFWO do
  begin
    with quCatSeeSubDescript do
      if Not Active then
        Open;

  end;
end;

procedure TfmCtDaySmy.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCtDaySmy.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmCtDaySmy.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

end.
