unit CoSbView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Mask, wwdbedit, ExtCtrls,
  Menus, Wwdotdot, Wwdbcomb;

type
  TfmCoSbView = class(TForm)
    paSelect: TPanel;
    laJob_no: TLabel;
    dedJOB_NO: TwwDBEdit;
    grJOBNO: TGroupBox;
    dgrCoSbView: TwwDBGrid;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    printSetup: TPrinterSetupDialog;
    sbPrintscreen: TSpeedButton;
    spLoadCoSbView: TSpeedButton;
    mmSubJob: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    dcbJobSubStatus: TwwDBComboBox;
    dedDescri: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure dgrCoSbViewDblClick(Sender: TObject);
    procedure spLoadCoSbViewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCoSbView: TfmCoSbView;

implementation
  uses JCmain,
       JCdatadm,
       FWOdtDm,
       CoSbSee,
       SbFWOVie;

{$R *.DFM}

procedure TfmCoSbView.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'spLoadCoSbView';
  Funcs[3] := 'dgrCoSbView.OnDblClick';
  //=====================
//  fmJCmain.TestProgram( Funcs );
end;

procedure TfmCoSbView.sbExitClick(Sender: TObject);
begin
  with dmJCFWO.quCostSubView do
    if  Active then
      Close;
  Close;
end;

procedure TfmCoSbView.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmCoSbView.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmCoSbView.dgrCoSbViewDblClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfmCoSbSee,fmCoSbSee);
    fmCoSbSee.ShowModal;
  finally
    fmCoSbSee.Release;
  end;
end;

procedure TfmCoSbView.spLoadCoSbViewClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfmSbFWOVie,fmSbFWOVie);
    fmSbFWOVie.ShowModal;
  finally
    fmSbFWOVie.Release;
  end;
end;

procedure TfmCoSbView.FormShow(Sender: TObject);
begin
  with dmJCFWO do
  begin
    with quCostSubView do
      if Not Active then
        Open;
    with quSubViewSum do
      if not Active then
        Open;
  end;
  with dgrCoSbView do
  begin
    dgrCoSbView.ColumnByName('SUB_JOB_NO').FooterValue
      := dmJCFWO.quSubViewSumJOB_COUNT.AsString +'±ø';
    dgrCoSbView.ColumnByName('JOB_REG_AMT').FooterValue
      := CurrencyString+dmJCFWO.quSubViewSumJOB_REG_AMT.AsString;
    dgrCoSbView.ColumnByName('JOB_PREM_AMT').FooterValue
      := CurrencyString+dmJCFWO.quSubViewSumJOB_PREM_AMT.AsString;
    dgrCoSbView.ColumnByName('JOB_RETAIN_AP').FooterValue
      := CurrencyString+dmJCFWO.quSubViewSumJOB_RETAIN_AP.AsString;
    dgrCoSbView.ColumnByName('JOB_RETAIN_AR').FooterValue
      := CurrencyString+dmJCFWO.quSubViewSumJOB_RETAIN_AR.AsString;
    dgrCoSbView.ColumnByName('JOB_BILL_AMT').FooterValue
      := CurrencyString+dmJCFWO.quSubViewSumJOB_BILL_AMT.AsString;
    dgrCoSbView.ColumnByName('JOB_AMT_PAID').FooterValue
      := CurrencyString+dmJCFWO.quSubViewSumJOB_AMT_PAID.AsString;
  end;
end;

procedure TfmCoSbView.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with dmJCFWO do
  begin
    with quCostSubView do
      if Active then
        Close;
    with quSubViewSum do
      if Active then
        Close;
  end;
end;

end.
