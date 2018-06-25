unit SbFWOVie;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Mask, wwdbedit, ExtCtrls,
  Menus, Wwdotdot, Wwdbcomb;

type
  TfmSbFWOVie = class(TForm)
    grJOBNO: TGroupBox;
    dgrSbFWOVie: TwwDBGrid;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    printSetup: TPrinterSetupDialog;
    mmSubFWO: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    dcbJobSubFWOStatus: TwwDBComboBox;
    paSelect: TPanel;
    laJob_no: TLabel;
    laSubJobNo: TLabel;
    dedJOB_NO: TwwDBEdit;
    dedSubJobNo: TwwDBEdit;
    dedDescri: TwwDBEdit;
    dedCostSubViewDescription: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure dgrSbFWOVieDblClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure dgrSbFWOVieUpdateFooter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSbFWOVie: TfmSbFWOVie;

implementation
  uses JCmain,
       JCdatadm,
       FWOdtDm,
       SbFWOSee;
{$R *.DFM}

procedure TfmSbFWOVie.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'btnOK';
  //=====================
//  TestProgram( Funcs );

end;

procedure TfmSbFWOVie.dgrSbFWOVieDblClick(Sender: TObject);
begin
//  if  not dmJCFWO.quSubFWOView.IsEmpty then
  begin
    try
      Application.CreateForm(TfmSbFWOSee,fmSbFWOSee);
      fmSbFWOSee.ShowModal;
    finally
      fmSbFWOSee.Release;
    end;
  end;// else
    //ShowMessage('無資料可以選取!');
end;

procedure TfmSbFWOVie.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('打印屏幕么?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmSbFWOVie.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmSbFWOVie.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSbFWOVie.dgrSbFWOVieUpdateFooter(Sender: TObject);
begin
  dgrSbFWOVie.ColumnByName('FWO_NO').FooterValue
    := IntToStr(dmJCFWO.quSubFWOView.RecordCount) +'條';
end;

procedure TfmSbFWOVie.FormShow(Sender: TObject);
begin
  with dmJCFWO do
  begin
    with quSubFWOView do
    begin
      if Not Active then
        Open;
    end;
  end;
end;

end.
