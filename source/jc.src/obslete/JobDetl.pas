unit JobDetl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdblook, wwdbdatetimepicker, Wwdotdot, Wwdbcomb, Mask, wwdbedit,
  StdCtrls, wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls, DBCtrls;

type
  TfmJobDetl = class(TForm)
    gbComment: TGroupBox;
    dmeComment: TDBMemo;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaJob_File: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    paJob_master: TPanel;
    laJob_no_1: TLabel;
    laDescription: TLabel;
    laJob_Status: TLabel;
    laJob_type: TLabel;
    laBill_currency: TLabel;
    laCost_currency: TLabel;
    laLst_ext_date: TLabel;
    laJob_end_date: TLabel;
    laIncharge_pension: TLabel;
    laCreated_by: TLabel;
    laCreate_date: TLabel;
    laTerritory: TLabel;
    laCustomer_no: TLabel;
    laBill_AC: TLabel;
    laBILL_PROFIT_CTR_1: TLabel;
    laBILL_PROFIT_CTR_2: TLabel;
    dedJob_no_1: TwwDBEdit;
    dedJobNo2: TwwDBEdit;
    dedDescription: TwwDBEdit;
    dcbJob_status: TwwDBComboBox;
    dtCreate_date: TwwDBDateTimePicker;
    dtJob_end_date: TwwDBDateTimePicker;
    dedIncharge_person: TwwDBEdit;
    dedCreated_by: TwwDBEdit;
    dedBill_AC: TwwDBEdit;
    dedBILL_PROFIT_CTR_1: TwwDBEdit;
    dedBILL_PROFIT_CTR_2: TwwDBEdit;
    dtLST_EST_DATE: TwwDBDateTimePicker;
    dedTerritory: TwwDBEdit;
    dlcbJob_type: TwwDBLookupCombo;
    dedCustomer_no: TwwDBEdit;
    dedBill_currency: TwwDBEdit;
    dedCost_currency: TwwDBEdit;
    printSetup: TPrinterSetupDialog;
    laJobNo2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure printSetupClose(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJobDetl: TfmJobDetl;

implementation
  uses JCdatadm;
{$R *.DFM}

procedure TfmJobDetl.FormCreate(Sender: TObject);
begin
  Caption := Application.Title +' = '+ Caption ;
  with dmJCdata do
  begin
    if quJCcontrolUSE_JOB_NO_2.AsString = 'Y' then
    begin
      dedJobNo2.visible := True;
      dedJobNo2.Enabled := true;
      laJobNo2.Visible := True;
      laJobNo2.Enabled := true;
    end else
    begin
      dedJobNo2.Visible := False;
      dedJobNo2.Enabled := False;
      laJobNo2.Visible := False;
      laJobNo2.Enabled := False;
    end;

//Field length
    dedJob_no_1.MaxLength := quJCcontrolJOB_NO_1_LEN.AsInteger;
    dedJobNo2.MaxLength := quJCcontrolJOB_NO_2_LEN.AsInteger;

//Use Bill account by job
    if quJCcontrolUSE_BILL_AC_BY_JOB.AsString ='N' then
    begin
      dedBill_AC.Enabled := false;
      laBill_AC.Enabled := false;
      dedBILL_PROFIT_CTR_1.Enabled := false;
      laBILL_PROFIT_CTR_1.Enabled := false;
      dedBILL_PROFIT_CTR_2.Enabled := false;
      laBILL_PROFIT_CTR_2.Enabled := false;
    end else
    begin
      dedBill_AC.Enabled := true;
      laBill_AC.Enabled := true;
      dedBILL_PROFIT_CTR_1.Enabled := true;
      laBILL_PROFIT_CTR_1.Enabled := true;
      dedBILL_PROFIT_CTR_2.Enabled := true;
      laBILL_PROFIT_CTR_2.Enabled := true;
    end;
  end;
end;

procedure TfmJobDetl.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJobDetl.sbPrintscreenClick(Sender: TObject);
begin
  print;
end;

procedure TfmJobDetl.printSetupClose(Sender: TObject);
begin
  printSetup.Execute;
end;

end.
