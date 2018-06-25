unit CoCtSee;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdblook, ExtCtrls, DBCGrids, StdCtrls, Mask, wwdbedit, wwSpeedButton,
  wwDBNavigator, Buttons, Grids, Wwdbigrd, Wwdbgrid, Menus;

type
  TfmCoCtSee = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    paSelect: TPanel;
    laJob_no: TLabel;
    laCostCat: TLabel;
    dedJOB_NO: TwwDBEdit;
    dedCostCat: TwwDBEdit;
    printSetup: TPrinterSetupDialog;
    mmCatDetai: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    dedDescri: TwwDBEdit;
    dgrCoCtSee: TwwDBGrid;
    wwDBEdit1: TwwDBEdit;
    procedure sbExitClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dgrCoCtSeeUpdateFooter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCoCtSee: TfmCoCtSee;

implementation
  uses JCdatadm,
       FWOdtDm,
       JCmain;
{$R *.DFM}

procedure TfmCoCtSee.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCoCtSee.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmCoCtSee.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmCoCtSee.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  //Funcs[1] := 'All';
  //=====================
  //fmJCmain.TestProgram( Funcs );

end;

procedure TfmCoCtSee.dgrCoCtSeeUpdateFooter(Sender: TObject);
begin
  with dmJCFWO do
    with dgrCoCtSee do
    begin
      ColumnByName('SUB_JOB_NO').FooterValue :=
        IntToStr(quCostByJobSubJob.RecordCount) + '±ø';
      ColumnByName('DRAFT_BUDGET_AMT').FooterValue :=
        quCostByJobSubJobDRAFT_BUDGET_AMT.AsString;
      ColumnByName('BUDGET_AMT').FooterValue :=
        quCostByJobSubJobBUDGET_AMT.AsString;
      ColumnByName('JOB_REG_AMT').FooterValue :=
        quCostByJobSubJobJOB_REG_AMT.AsString;
      ColumnByName('JOB_PREM_AMT').FooterValue :=
        quCostByJobSubJobJOB_PREM_AMT.AsString;
    end;
end;

procedure TfmCoCtSee.FormShow(Sender: TObject);
begin
  with dmJCFWO do
  begin
    with quCostByJobSubJob do
      if not Active then
        Open;
    with quJobCostCatSmry do
      if not Active then
        Open;
  end;
end;

procedure TfmCoCtSee.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCFWO do
    with quCostByJobSubJob do
      if Active then
        Close;
end;

end.
