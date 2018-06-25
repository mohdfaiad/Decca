unit JobMaster;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls,
  StdCtrls, DBCtrls, Wwdotdot, Wwdbcomb, Mask, wwdbedit, wwdbdatetimepicker,
  wwdblook, Grids, Wwdbigrd, Wwdbgrid;

type
  TfmJobMastr = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    dnaJob_Master: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    mmJobMaster: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    printSetup: TPrinterSetupDialog;
    StatusBar1: TStatusBar;
    sbPrintscreen: TSpeedButton;
    pcJobMaster: TPageControl;
    tsJob_Master: TTabSheet;
    tsSub_job_file: TTabSheet;
    tsJob_FWO: TTabSheet;
    dgrJob_file: TwwDBGrid;
    dgrSub_job: TwwDBGrid;
    dgrJob_FWO: TwwDBGrid;
    dcbView: TwwDBComboBox;
    dcbSub_status: TwwDBComboBox;
    dcbFWO_status: TwwDBComboBox;
    tsJob_claim: TTabSheet;
    dgrJob_claim: TwwDBGrid;
    tsJob_cost_cat: TTabSheet;
    dgrJOB_COST_CAT: TwwDBGrid;
    tsSUBCONTRACT: TTabSheet;
    procedure mmExitClick(Sender: TObject);
    procedure mmPrintsetupClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgrJob_fileDblClick(Sender: TObject);
    procedure dgrSub_jobDblClick(Sender: TObject);
    procedure dgrJob_FWODblClick(Sender: TObject);
    procedure dgrJOB_COST_CATDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJobMastr: TfmJobMastr;

implementation
  uses jcdatadm,db,JCmain,Job_File,Sub_Job,Job_FWO,Job_C_C;
{$R *.DFM}

procedure TfmJobMastr.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJobMastr.mmPrintsetupClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmJobMastr.sbPrintscreenClick(Sender: TObject);
begin
  print;
end;

procedure TfmJobMastr.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
//  Funcs[1] := 'All';
  //=====================
//  fmJCmain.TestProgram( Funcs );
  with dmJCdata do
  begin
    with  quJCcontrol do
    begin
      if not Active then
        Open;
    end;

    with quJob_file do
    begin
      if not Active then
        Open;
    end;

    with quJob_Claim do
    begin
      if not Active then
        Open;
    end;

    with  quSub_job do
    begin
      if not Active then
        Open;
    end;

    with quJOB_FWO DO
    begin
      if not Active then
        Open;
    end;

    with quJob_cost_type do
    begin
      if not Active then
        Open;
    end;

    with quJOB_COST_CAT do
    begin
      if not Active then
        Open;
    end;

    with quJob_cost_file_VIEW do
    begin
      if Active then
        Open;
    end;
  end;  
end;

procedure TfmJobMastr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCdata do
  begin
    with quJob_file do
    begin
      if Active then
        Close;
    end;

    with  quSub_job do
    begin
      if Active then
        Close;
    end;

    with quSub_job_VIEW do
    begin
      if Active then
        Close;
    end;

    with quJOB_FWO_VIEW do
    begin
      if Active then
        Close;
    end;
  end;
end;

procedure TfmJobMastr.dgrJob_fileDblClick(Sender: TObject);
begin
  Application.CreateForm(TfmJob_file,fmJob_file);
  try
    fmJob_file.ShowModal;
  finally
    fmJob_file.ShowModal;
  end;
end;

procedure TfmJobMastr.dgrSub_jobDblClick(Sender: TObject);
begin
  Application.CreateForm(TfmSub_Job,fmSub_Job);
  try
    fmSub_Job.ShowModal;
  finally
    fmSub_Job.Release;
  end;
end;

procedure TfmJobMastr.dgrJob_FWODblClick(Sender: TObject);
begin
  Application.CreateForm(TfmJob_FWO,fmJob_FWO);
  try
    fmJob_FWO.ShowModal;
  finally
    fmJob_FWO.Release;
  end;
end;

procedure TfmJobMastr.dgrJOB_COST_CATDblClick(Sender: TObject);
begin
  Application.CreateForm(TfmJOB_COST_CAT,fmJOB_COST_CAT);
  try
    fmJOB_COST_CAT.ShowModal;
  finally
    fmJOB_COST_CAT.Release;
  end;
end;

end.
