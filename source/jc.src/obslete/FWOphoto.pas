unit FWOphoto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit,
  StdCtrls, ExtCtrls, DBCtrls, Menus, wwdblook, wwSpeedButton,
  wwDBNavigator, wwdbdatetimepicker;

type
  TfmFWOphoto = class(TForm)
    paSelect: TPanel;
    Label1: TLabel;
    laJobNo: TLabel;
    gbSeek: TGroupBox;
    dedJobNo: TwwDBEdit;
    grJOBNO: TGroupBox;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    printSetup: TPrinterSetupDialog;
    dedFWO_No: TwwDBEdit;
    dedDescription: TwwDBEdit;
    sbPrint: TSpeedButton;
    mmFWO: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    dimPhoto: TDBImage;
    dedJobDescri: TwwDBEdit;
    drgFWOStatus: TDBRadioGroup;
    drgUpdateSJBudget: TDBRadioGroup;
    laFWO_unit: TLabel;
    laFWO_qty: TLabel;
    laFWO_Cat: TLabel;
    laProductCode: TLabel;
    dedFWO_unit: TwwDBEdit;
    dedFWO_qty: TwwDBEdit;
    gbSize: TGroupBox;
    laFWO_length: TLabel;
    laFWO_width: TLabel;
    laFWO_height: TLabel;
    dedFWO_length: TwwDBEdit;
    dedFWO_width: TwwDBEdit;
    dedFWO_height: TwwDBEdit;
    dlcbFWO_Cat: TwwDBLookupCombo;
    dedProductCode: TwwDBEdit;
    gbFWO: TGroupBox;
    dmeFWOcomment: TDBMemo;
    dnaFWOPhoto: TwwDBNavigator;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    laSub_job_no: TLabel;
    dedSubNo: TwwDBEdit;
    dedSubDescription: TwwDBEdit;
    gbCheck: TGroupBox;
    laCheckBy: TLabel;
    laCheckDate: TLabel;
    dedCheckBy: TwwDBEdit;
    dtCheckDate: TwwDBDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure dimPhotoDblClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFWOphoto: TfmFWOphoto;

implementation
  uses JCdatadm,
       FWOdtdm,
       JCmain,
       Photo;
{$R *.DFM}

procedure TfmFWOphoto.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'btnOK';
  //=====================
//  TestProgram( Funcs );

end;

procedure TfmFWOphoto.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFWOphoto.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmFWOphoto.dimPhotoDblClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfmPhoto,fmPhoto);
    fmPhoto.dimPhoto.DataSource
      := dmJCFWO.dsFWO_Photo;
    fmPhoto.ShowModal;
  finally
    fmPhoto.dimPhoto.DataSource
      := dmJCdata.dsJOB_FWO;
    fmPhoto.Release;
  end;
end;

procedure TfmFWOphoto.sbPrintClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmFWOphoto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with dmJCdata do
  begin
    with quFWO_Cat do
      if Not Active then
        Open;
  end;
  with dmJCFWO do
  begin
    with quFWO_Photo do
      if active then
        Close;
    with quSeleSubSubDescr do
      if Active then
        Close;
  end;
end;

procedure TfmFWOphoto.FormShow(Sender: TObject);
begin
  with dmJCdata do
  begin
    with quFWO_Cat do
      if Not Active then
        Open;
  end;
  with dmJCFWO do
  begin
    with quFWO_Photo do
      if NOT active then
        Open;
    with quSeleSubSubDescr do
      if Not Active then
        Open;
  end;
end;

end.
