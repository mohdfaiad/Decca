unit FwoCstCt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,db,
  Menus, ExtDlgs, ExtCtrls, DBCtrls, wwdbdatetimepicker, StdCtrls,
  wwSpeedButton, wwDBNavigator, Buttons, wwdblook, Mask, wwdbedit, Grids,
  Wwdbigrd, Wwdbgrid;

type
  TfmFwoCstCt = class(TForm)
    paJob_FWO: TPanel;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaFWOCostCat: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    paBase: TPanel;
    laFWOjob_no_1: TLabel;
    laFWO_NO: TLabel;
    dedFWOjob_no_1: TwwDBEdit;
    dedFWOdescription: TwwDBEdit;
    dedFWO_NO: TwwDBEdit;
    printSetup: TPrinterSetupDialog;
    op_Photo: TOpenPictureDialog;
    mmJobFWO: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    dedJobDescri: TwwDBEdit;
    paSize: TPanel;
    gbUnit: TGroupBox;
    laFWO_unit: TLabel;
    laFWO_Cat: TLabel;
    dedJobCostCatUnit: TwwDBEdit;
    dlcbJobCostCat: TwwDBLookupCombo;
    mmReport: TMenuItem;
    mmRepFwo: TMenuItem;
    blData: TBevel;
    laQty: TLabel;
    laAmt: TLabel;
    laBudget: TLabel;
    laReg: TLabel;
    laPrem: TLabel;
    dedBudgetQty: TwwDBEdit;
    dedRegQty: TwwDBEdit;
    dedPremQty: TwwDBEdit;
    dedBudgetAmt: TwwDBEdit;
    dedRegAmt: TwwDBEdit;
    dedPremAmt: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure mmPrintsetupClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure dedFWOsub_job_noExit(Sender: TObject);
    procedure mmRepFwoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dlcbJobCostCatCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFwoCstCt: TfmFwoCstCt;

implementation
  uses JCdatadm,
       JCmain,
       Photo,
       FWODtDM,
       PtJobFwo;
{$R *.DFM}

procedure TfmFwoCstCt.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
//  Funcs[1] := 'All';
  //=====================
//  fmJCmain.TestProgram( Funcs );
end;

procedure TfmFwoCstCt.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFwoCstCt.mmPrintsetupClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmFwoCstCt.sbPrintscreenClick(Sender: TObject);
begin
  print;
end;

procedure TfmFwoCstCt.dedFWOsub_job_noExit(Sender: TObject);
begin
  with dmJCdata do
  begin
    with quSelFWOSubDescr do
    begin
      if Active then
        Close;
      Open;
    end;
  end;
end;

procedure TfmFwoCstCt.mmRepFwoClick(Sender: TObject);
begin
  Application.CreateForm(TfmPtJobFwo,fmPtJobFwo);
  try
    fmPtJobFwo.ShowModal;
  finally
    fmPtJobFwo.Release;
  end;
end;

procedure TfmFwoCstCt.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  with dmJCFWO do
  begin
    with quFWO_Cost_Cat do
      if Active then
        Close;
    with quJob_cost_file do
      if Active then
        Close;
  end;
end;

procedure TfmFwoCstCt.FormShow(Sender: TObject);
begin
  with dmJCFWO do
  begin
    with quFWO_Cost_Cat do
      if not Active then
        Open;
    with quJob_cost_file do
      if Not Active then
        Open;
  end;
end;

procedure TfmFwoCstCt.dlcbJobCostCatCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (trim(dlcbJobCostCat.Text) <> '') then
  begin
    with dmJCFWO do
    begin
      with quFWO_Cost_Cat do
        if ((state <> dsedit) or (state <> dsedit)) then
          edit;
      quFWO_Cost_CatJOB_COST_CAT_UNIT.AsString := quJob_cost_fileJOB_COST_CAT_UNIT.AsString;
    end;
  end;
end;

end.
