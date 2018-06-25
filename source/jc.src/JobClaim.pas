unit JobClaim;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls, StdCtrls, DBCtrls,
  wwdbdatetimepicker, Wwdotdot, Wwdbcomb, Mask, wwdbedit, Menus, Db,
  Wwdatsrc, DBTables, Wwquery;

type
  TfmJobClaim = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaSub_job: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    printSetup: TPrinterSetupDialog;
    mmClaim: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    paJobClaim: TPanel;
    paView: TPanel;
    laSUBjob_no_1: TLabel;
    laLINE_NO: TLabel;
    dedJobNo1: TwwDBEdit;
    dedLineNo: TwwDBEdit;
    dedDescrSUB: TwwDBEdit;
    paEdit: TPanel;
    laAccumApplyAMT: TLabel;
    laAcuumCertAMT: TLabel;
    laRecvAMT: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    laSub_job_no: TLabel;
    dbdtpApplyDate: TwwDBDateTimePicker;
    dbdtpRecvDate: TwwDBDateTimePicker;
    dbdtpCertDate: TwwDBDateTimePicker;
    dedSUBdescription: TwwDBEdit;
    dedSubJobNo: TwwDBEdit;
    dedApplyAmt: TwwDBEdit;
    dedCertAmt: TwwDBEdit;
    dedRecvAmt: TwwDBEdit;
    dedAccumApplyAmt: TwwDBEdit;
    dedAccumCertAmt: TwwDBEdit;
    dedAccumRecvAmt: TwwDBEdit;
    dedCurrApplyAmt: TwwDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    gbComment: TGroupBox;
    dmeComment: TDBMemo;
    quClaimSumry: TwwQuery;
    dsClaimSumry: TwwDataSource;
    quClaimSumryAPPLYAMT: TBCDField;
    quClaimSumryCERTAMT: TBCDField;
    quClaimSumryRECVAMT: TBCDField;
    dbrgClaimStatus: TDBRadioGroup;
    dedApplyNo: TwwDBEdit;
    dedCertNo: TwwDBEdit;
    dedRecvNo: TwwDBEdit;
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dedLineNoChange(Sender: TObject);
    procedure dedCurrApplyAmtEnter(Sender: TObject);
    procedure dedCurrApplyAmtExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJobClaim: TfmJobClaim;

implementation
  uses JCdatadm,
       JCmain;
{$R *.DFM}

procedure TfmJobClaim.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJobClaim.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  dedSubJobNo.MaxLength := gSubJobLen;
  with dmJCData, quJobClaim do
    with quClaimSumry do
    begin
      if Active then Close;
      ParamByName('Job_No_1').Value := quJobClaimJOB_NO_1.Value;
      ParamByName('Job_No_2').Value := quJobClaimJOB_NO_2.Value;
      ParamByName('Line_No').Value := quJobClaimLINE_NO.Value;
      Open;
    end;
end;

procedure TfmJobClaim.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmJobClaim.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmJobClaim.FormShow(Sender: TObject);
begin
  with dmJCdata do
  begin
    with quClaimSubDescri do
      if Not Active then
        Open;
  end;
end;

procedure TfmJobClaim.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quClaimSumry do
    if Active then Close;
end;

procedure TfmJobClaim.dedLineNoChange(Sender: TObject);
begin
  with dmJCData, quJobClaim do
    with quClaimSumry do
    begin
      if Active then Close;
      ParamByName('Job_No_1').Value := quJobClaimJOB_NO_1.Value;
      ParamByName('Job_No_2').Value := quJobClaimJOB_NO_2.Value;
      ParamByName('Line_No').Value := quJobClaimLINE_NO.Value;
      Open;
    end;
end;

procedure TfmJobClaim.dedCurrApplyAmtEnter(Sender: TObject);
begin
  with dmJCData, quJobClaim do
    with quClaimSumry do
      quJobClaimcalApplyAmt.Value := quJobClaimAPPLY_AMT.Value
                                   + quClaimSumryAPPLYAMT.Value;
end;

procedure TfmJobClaim.dedCurrApplyAmtExit(Sender: TObject);
begin
  with dmJCData do
    with quJobClaim do
    begin
      if (State = dsEdit) or
         (State = dsInsert) then
      begin
        with quClaimSumry do
          quJobClaimAPPLY_AMT.Value :=
            quJobClaimcalApplyAmt.Value - quClaimSumryAPPLYAMT.Value
      end;
    end;
end;

end.
