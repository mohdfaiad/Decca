unit Analysis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit,
  StdCtrls, ExtCtrls,db, wwSpeedButton, wwDBNavigator, Menus;

type
  TfmAnalysis = class(TForm)
    paInitial: TPanel;
    Label1: TLabel;
    laSub_job_no: TLabel;
    laJobNo: TLabel;
    dedJobNo: TwwDBEdit;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    printSetup: TPrinterSetupDialog;
    grJOBNO: TGroupBox;
    dgrAnalysis: TwwDBGrid;
    dnaAnalysis: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    dedOSUB_NO: TwwDBEdit;
    dedOFWO_NO: TwwDBEdit;
    sbPrintscreen: TSpeedButton;
    mmAnalysis: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    dedDescrSUB: TwwDBEdit;
    dedSubDescri: TwwDBEdit;
    dedFWODescri: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure dgrAnalysisColEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAnalysis: TfmAnalysis;

implementation
  uses JCdatadm,
       FWOdtDm,
       JCmain; 
{$R *.DFM}

procedure TfmAnalysis.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'btnOK';
  //=====================
//  TestProgram( Funcs );

end;

procedure TfmAnalysis.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmAnalysis.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmAnalysis.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAnalysis.dgrAnalysisColEnter(Sender: TObject);
begin
  with dmJCFWO do
  begin
    if ((quFWO_Cost_Analysis.State = dsedit) or
      (quFWO_Cost_Analysis.State = dsinsert)) then
    begin
      if dgrAnalysis.SelectedField.FieldName = 'QUOT_ITEM_NO' then
        quFWO_Cost_AnalysisQUOT_ITEM_NO.AsString
          := UpperCase(quFWO_Cost_AnalysisQUOT_ITEM_NO.AsString);
      if dgrAnalysis.SelectedField.FieldName = 'SECTION_NO' then
        quFWO_Cost_AnalysisSECTION_NO.AsString
          := UpperCase(quFWO_Cost_AnalysisSECTION_NO.AsString);
      if dgrAnalysis.SelectedField.FieldName = 'QUOT_ITEM_UNIT' then
        quFWO_Cost_AnalysisQUOT_ITEM_UNIT.AsString
          := UpperCase(quFWO_Cost_AnalysisQUOT_ITEM_UNIT.AsString);
    end;
  end;
end;

procedure TfmAnalysis.FormShow(Sender: TObject);
begin
  with dmJCFWO do
    with quFWO_Cost_Analysis do
      if Not Active then
        Open;
end;

procedure TfmAnalysis.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with dmJCFWO do
    with quFWO_Cost_Analysis do
      if Active then
        Close;
end;

end.
