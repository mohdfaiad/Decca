unit Job_FWO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, Wwdotdot, Wwdbcomb, Mask, wwdbedit, StdCtrls,
  DBCtrls, wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls;

type
  TfmJobFWO = class(TForm)
    paJob_FWO: TPanel;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaJob_FWO: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    gbFWO: TGroupBox;
    dmeFWOcomment: TDBMemo;
    laFWOjob_no_1: TLabel;
    laFWOjob_no_2: TLabel;
    laFWOdescription: TLabel;
    laFWOstatus: TLabel;
    laFWO_NO: TLabel;
    laFWOsub_job_no: TLabel;
    laFWOcreated_by: TLabel;
    laFWO_qty: TLabel;
    laFWOcreate_date: TLabel;
    laFWO_unit: TLabel;
    laFWO_length: TLabel;
    laFWO_width: TLabel;
    laFWO_height: TLabel;
    dedFWOjob_no_1: TwwDBEdit;
    dedFWOjob_no_2: TwwDBEdit;
    dedFWOdescription: TwwDBEdit;
    dcbFWO_status: TwwDBComboBox;
    dedFWOcreated_by: TwwDBEdit;
    dedFWOsub_job_no: TwwDBEdit;
    dedFWO_NO: TwwDBEdit;
    dedFWO_qty: TwwDBEdit;
    dtFWOcreate_date: TwwDBDateTimePicker;
    dedFWO_unit: TwwDBEdit;
    dedFWO_length: TwwDBEdit;
    dedFWO_width: TwwDBEdit;
    dedFWO_height: TwwDBEdit;
    printSetup: TPrinterSetupDialog;
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
  fmJobFWO: TfmJobFWO;

implementation
  uses JCdatadm;
{$R *.DFM}

procedure TfmJobFWO.FormCreate(Sender: TObject);
begin
  Caption := Application.Title +' = '+ Caption ;
  with dmJCdata do
  begin
    if quJCcontrolUSE_JOB_NO_2.AsString = 'Y' then
    begin
      dedFWOjob_no_2.Enabled := true;
      laFWOjob_no_2.Enabled := true;
    end else
    begin
      dedFWOjob_no_2.Enabled := false;
      laFWOjob_no_2.Enabled := False;
    end;

//Field length
    dedFWOsub_job_no.MaxLength := quJCcontrolSUB_JOB_NO_LEN.AsInteger;
    dedFWO_NO.MaxLength := quJCcontrolFWO_NO_LEN.AsInteger;
  end;
end;

procedure TfmJobFWO.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJobFWO.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmJobFWO.sbPrintscreenClick(Sender: TObject);
begin
  print;
end;

end.
