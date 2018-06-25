unit ShortPrg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, wwSpeedButton, wwDBNavigator, Buttons, StdCtrls, wwdblook,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, ComCtrls,
  Wwdatsrc, wwdbdatetimepicker, Mask, DBCtrls, wwdbedit;

type
  TfmShortPrg = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    Label2: TLabel;
    dtpCompleteDate: TDateTimePicker;
    btnOK: TBitBtn;
    BitBtn1: TBitBtn;
    spUpdateProgress: TStoredProc;
    Label4: TLabel;
    dbluJobCostCat: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmShortPrg: TfmShortPrg;

implementation
uses JcDatadm, jcmain, Progress;
{$R *.DFM}

procedure TfmShortPrg.FormCreate(Sender: TObject);
begin
  Caption := wCompanyName + ' == ' + Caption;
  dtpStartDate.Date := Date;
  dtpEndDate.Date := Date;
  dtpCompleteDate.Date := Date;
end;

procedure TfmShortPrg.sbExitClick(Sender: TObject);
begin
  Close;
end;


procedure TfmShortPrg.sbPrintscreenClick(Sender: TObject);
begin
 // quShortPrg.OnCalcFields := nil;
end;

procedure TfmShortPrg.btnOKClick(Sender: TObject);
begin
  with spUpdateProgress do
  begin
    ParamByName('JobCostCat').Value := dbluJobCostCat.Text;
    ParamByName('CompleteDate').AsDate := dtpCompleteDate.Date;
    ParamByName('StartDate').AsDate := dtpStartDate.Date;
    ParamByName('EndDate').AsDate := dtpEndDate.Date + 1;
    Prepare;
    ExecProc;
    UnPrepare;
  end;
end;

end.
