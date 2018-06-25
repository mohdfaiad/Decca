unit CoSbSee;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls, DBCGrids, StdCtrls,
  Mask, wwdbedit, wwdblook, Grids, Wwdbigrd, Wwdbgrid, Menus;

type
  TfmCoSbSee = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    paSelect: TPanel;
    laJob_no: TLabel;
    dedJOB_NO: TwwDBEdit;
    laSubJobNo: TLabel;
    dedSubJobNo: TwwDBEdit;
    printSetup: TPrinterSetupDialog;
    mmSubDetai: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    dedDescri: TwwDBEdit;
    dedSubDescri: TwwDBEdit;
    dgrCoSbSee: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure dgrCoSbSeeDblClick(Sender: TObject);
    procedure dgrCoSbSeeUpdateFooter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCoSbSee: TfmCoSbSee;

implementation
  uses JCdatadm,
       FWOdtDm,
       JCmain;
{$R *.DFM}

procedure TfmCoSbSee.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
{  //=====================
  Funcs[1] := 'All';
  //=====================
  fmJCmain.TestProgram( Funcs );}

end;

procedure TfmCoSbSee.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCoSbSee.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('打印屏幕么?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmCoSbSee.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmCoSbSee.dgrCoSbSeeDblClick(Sender: TObject);
begin
{  if not dmJCFWO.quCostSubSee.IsEmpty then
  begin
    Application.CreateForm(TfmSbDaySmy,fmSbDaySmy);
    try
      fmSbDaySmy.ShowModal;
    finally
      fmSbDaySmy.Release;
    end;
  end else
    ShowMessage('無資料可以選取!');}
end;

procedure TfmCoSbSee.dgrCoSbSeeUpdateFooter(Sender: TObject);
begin
  with dgrCoSbSee do
  begin
    ColumnByName('JOB_COST_CAT').FooterValue
      := IntToStr(dmJCFWO.quCostSubSee.RecordCount) + '條';
    ColumnByName('BUDGET_AMT').FooterValue
      := dmJCFWO.quSubSeeSumBUDGET_AMT.AsString;
    ColumnByName('JOB_REG_AMT').FooterValue
      := dmJCFWO.quSubSeeSumJOB_REG_AMT.AsString;
    ColumnByName('JOB_PREM_AMT').FooterValue
      := dmJCFWO.quSubSeeSumJOB_PREM_AMT.AsString;
  end;
end;

procedure TfmCoSbSee.FormShow(Sender: TObject);
begin
  with dmJCdata do
  begin
    with quJob_cost_file_VIEW do
      if not Active then
        Open;
  end;
  with dmJCFWO do
  begin
    with quCostSubSee do
      if not Active then
        Open;
    with quSubSeeSum do
      if Not Active then
        Open;
  end;
end;

procedure TfmCoSbSee.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with dmJCFWO do
  begin
    with quCostSubSee do
      if  Active then
        Close;
    with quSubSeeSum do
      if Active then
        Close;
  end;
end;

end.
