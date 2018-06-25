unit SbFWOSee;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Mask, wwdbedit, ExtCtrls,
  Menus;

type
  TfmSbFWOSee = class(TForm)
    paSelect: TPanel;
    laJob_no: TLabel;
    dedJOB_NO: TwwDBEdit;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    printSetup: TPrinterSetupDialog;
    laSubJobNo: TLabel;
    dedSubJobNo: TwwDBEdit;
    mmFWODetai: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    dedDescri: TwwDBEdit;
    wwDBEdit1: TwwDBEdit;
    laFWO: TLabel;
    dedFWO_NO: TwwDBEdit;
    dedFWODescri: TwwDBEdit;
    dgrSbFWOSee: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure dgrSbFWOSeeUpdateFooter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSbFWOSee: TfmSbFWOSee;

implementation
  uses JCmain,
       JCdatadm,
       FWOdtDm;
{$R *.DFM}

procedure TfmSbFWOSee.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'btnOK';
  //=====================
//  TestProgram( Funcs );
end;

procedure TfmSbFWOSee.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmSbFWOSee.sbExitClick(Sender: TObject);
begin
  with dmJCFWO do
  begin
    with quSubFWOSee do
      if Active then
        Close;
    with quFWOSeeSum do
      if Active then
        Close;
  end;
  Close;
end;

procedure TfmSbFWOSee.dgrSbFWOSeeUpdateFooter(Sender: TObject);
begin
  with dgrSbFWOSee do
  begin
    ColumnByName('JOB_COST_CAT').FooterValue
      := IntToStr(dmJCFWO.quSubFWOSee.RecordCount) + '±ø';
  end;
end;

procedure TfmSbFWOSee.FormShow(Sender: TObject);
begin
  with dmJCFWO do
  begin
    with quSubFWOSee do
      if Not Active then
        Open;
    with quFWOSeeSum do
      if not Active then
        Open;
    with dgrSbFWOSee do
    begin
      ColumnByName('JOB_COST_CAT').FooterValue
        :=  IntToStr(dmJCFWO.quSubFWOSee.RecordCount) + '±ø';
      ColumnByName('BUDGET_AMT').FooterValue
        := dmJCFWO.quFWOSeeSumBUDGET_AMT.AsString;
      ColumnByName('JOB_REG_AMT').FooterValue
        := dmJCFWO.quFWOSeeSumJOB_REG_AMT.AsString;
      ColumnByName('JOB_PREM_AMT').FooterValue
        :=  dmJCFWO.quFWOSeeSumJOB_PREM_AMT.AsString;
    end;
  end;
end;

end.
