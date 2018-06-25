unit JobDetai;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,db,
  Menus, ExtDlgs, ExtCtrls, DBCtrls, wwdbdatetimepicker, StdCtrls,
  wwSpeedButton, wwDBNavigator, Buttons, wwdblook, Mask, wwdbedit, Grids,
  Wwdbigrd, Wwdbgrid, Wwdbspin;

type
  TfmJobDetai = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaJobDetai: TwwDBNavigator;
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
    laFWOjob_no_2: TLabel;
    laFWOdescription: TLabel;
    laFWO_NO: TLabel;
    laFWOsub_job_no: TLabel;
    dedFWOjob_no_1: TwwDBEdit;
    dedFWOjob_no_2: TwwDBEdit;
    dedFWOdescription: TwwDBEdit;
    dedFWOsub_job_no: TwwDBEdit;
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
    dedSubDescr: TwwDBEdit;
    laSubJobCostCat: TLabel;
    dblcJobCostCat: TwwDBLookupCombo;
    laJobCostCat: TLabel;
    dlcbSubJobCostCat: TwwDBLookupCombo;
    gbNumber: TGroupBox;
    laSiteNo: TLabel;
    laDocNo: TLabel;
    dbseSiteNo: TwwDBSpinEdit;
    dbseDocNo: TwwDBSpinEdit;
    gbSize: TGroupBox;
    laFWO_width: TLabel;
    laFWO_height: TLabel;
    dbdtHistSeq: TwwDBDateTimePicker;
    dbdtpHisDate: TwwDBDateTimePicker;
    gbFWO: TGroupBox;
    dmeFWOcomment: TDBMemo;
    gbDetail: TGroupBox;
    laDetailType: TLabel;
    laRetainAmt: TLabel;
    dedDetailType: TwwDBEdit;
    dedRetainAmt: TwwDBEdit;
    gbItem: TGroupBox;
    laItemNo: TLabel;
    laWareHouse: TLabel;
    laItemUnitCost: TLabel;
    laItemUnit: TLabel;
    dedItemNo: TwwDBEdit;
    dedWhsCode: TwwDBEdit;
    dedItemUnitCost: TwwDBEdit;
    dedItemUnit: TwwDBEdit;
    gbInvc: TGroupBox;
    laInvcNo: TLabel;
    laInveDate: TLabel;
    dedInvcNo: TwwDBEdit;
    dbdtpInvcDate: TwwDBDateTimePicker;
    gbCheque: TGroupBox;
    laChqNo: TLabel;
    laChqDate: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    dedUserID: TwwDBEdit;
    laUserID: TLabel;
    laAcctNo: TLabel;
    dedAcctNo: TwwDBEdit;
    dedPftCtr1: TwwDBEdit;
    dedPftCtr2: TwwDBEdit;
    laDetailAmt: TLabel;
    laDetail: TLabel;
    dedDetailAmt: TwwDBEdit;
    dedDetailQty: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure mmPrintsetupClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure dedFWOsub_job_noExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJobDetai: TfmJobDetai;

implementation
  uses JCdatadm,
       JCmain,
       FWODtDM;
{$R *.DFM}

procedure TfmJobDetai.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
//  Funcs[1] := 'All';
  //=====================
//  fmJCmain.TestProgram( Funcs );
end;

procedure TfmJobDetai.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJobDetai.mmPrintsetupClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmJobDetai.sbPrintscreenClick(Sender: TObject);
begin
  print;
end;

procedure TfmJobDetai.dedFWOsub_job_noExit(Sender: TObject);
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

procedure TfmJobDetai.FormShow(Sender: TObject);
begin
  if gUseJobNo2 = 'Y' then
  begin
    laFWOjob_no_2.Visible := true;
    dedFWOjob_no_2.Visible := true;
  end
  else
  begin
    laFWOjob_no_2.Visible := false;
    dedFWOjob_no_2.Visible := false;
  end;

  with dmJCdata do
  begin
    with qufwo_cat do
      if Not Active then
        Open;
    with quJobDetail do
      if Not Active then
        Open;
    with quJob_cost_file do
      if Not Active then
        Open;
  end;
end;

procedure TfmJobDetai.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCdata do
  begin
    with qufwo_cat do
      if  Active then
        Close;
    with quJobDetail do
      if Active then
        Close;
    with quJob_cost_file do
      if Active then
        Close;
  end;
end;

end.
