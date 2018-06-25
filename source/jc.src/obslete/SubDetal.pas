unit SubDetal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, Mask, wwdbedit, StdCtrls, ExtCtrls, DBCtrls,
  wwSpeedButton, wwDBNavigator, Buttons, Menus;

type
  TfmSbConDtl = class(TForm)
    gbDetail: TGroupBox;
    gbComment: TGroupBox;
    dmeComment: TDBMemo;
    paLineNo: TPanel;
    laLineNo: TLabel;
    laInvcNo: TLabel;
    laSubContractNo: TLabel;
    dedLineNo: TwwDBEdit;
    dedInvcNo: TwwDBEdit;
    dedSubContractNo: TwwDBEdit;
    paEdit: TPanel;
    gbCert: TGroupBox;
    laAccumCertAMT: TLabel;
    laCertificateDate: TLabel;
    laCertNo: TLabel;
    laVoucherNo: TLabel;
    laCertDate: TLabel;
    laApplyDate: TLabel;
    dedAccumCertAMT: TwwDBEdit;
    dtCertificateDate: TwwDBDateTimePicker;
    dedCertNo: TwwDBEdit;
    dedVoucherNo: TwwDBEdit;
    dtCertDate: TwwDBDateTimePicker;
    dtApplyDate: TwwDBDateTimePicker;
    paAMT: TPanel;
    gbAMT: TGroupBox;
    laAccumApplyAMT: TLabel;
    laDLPaidAMT: TLabel;
    dedAccumApplyAMT: TwwDBEdit;
    dedDLPaidAMT: TwwDBEdit;
    gbDate: TGroupBox;
    laDlLastPayDate: TLabel;
    dtDlLastPayDate: TwwDBDateTimePicker;
    mmConTract: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    printSetup: TPrinterSetupDialog;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaContract: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    laDate: TLabel;
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
  fmSbConDtl: TfmSbConDtl;

implementation
  uses JCdatadm,JCmain;
{$R *.DFM}

procedure TfmSbConDtl.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
end;

procedure TfmSbConDtl.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSbConDtl.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmSbConDtl.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

end.
