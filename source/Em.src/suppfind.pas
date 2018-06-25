unit suppfind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls, Menus, StdCtrls,
  ComCtrls, Grids, Wwdbigrd, Wwdbgrid;

type
  TfmSuppFind = class(TForm)
    mmSuppFind: TMainMenu;
    miFile: TMenuItem;
    miPrintSetUp: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miReport: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    patoolsbar: TPanel;
    sbexit: TSpeedButton;
    sbPrinterSetup: TSpeedButton;
    sbExplorer: TSpeedButton;
    dnaSupplierFind: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    Panel1: TPanel;
    Label1: TLabel;
    edSupplier_NO: TEdit;
    gbEQPStatus: TGroupBox;
    ckNo: TCheckBox;
    ckHold: TCheckBox;
    GroupBox1: TGroupBox;
    dgrSupplierFind: TwwDBGrid;
    ckRegular: TCheckBox;
    miSupplierInfoRep: TMenuItem;
    procedure miPrintSetUpClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure dgrSupplierFindDblClick(Sender: TObject);
    procedure sbExplorerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miSupplierInfoRepClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSuppFind: TfmSuppFind;

implementation

uses
  emdatamd, suppinfo, emmain;

{$R *.DFM}

procedure TfmSuppFind.miPrintSetUpClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmSuppFind.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSuppFind.dgrSupplierFindDblClick(Sender: TObject);
begin
  if not dmEMData.quSupplierInfo.Active then
    Abort;
  Application.Createform(TfmSuppInfo, fmSuppInfo);
  try
    fmSuppInfo.Showmodal;
  except
    fmSuppInfo.Release;
  end;
end;

procedure TfmSuppFind.sbExplorerClick(Sender: TObject);
var
  SupplierNo,
  Suppstatuses : String;
begin
  SupplierNo := Trim(edSupplier_NO.Text);
  Suppstatuses := '';
  if ckRegular.Checked then
    Suppstatuses := '"R"';
  if ckHold.Checked then
    Suppstatuses := Suppstatuses + ',"H"';
  if ckNo.Checked then
    Suppstatuses := Suppstatuses + ',"N"';
  Suppstatuses := Trim(Suppstatuses);
  if Pos(',', Suppstatuses) = 1 then
    Delete(Suppstatuses, 1, 1);
  with dmEMData.quSupplierInfo do
  begin
    if Active then Close;
    Prepare;
    with SQL do
    begin
      Clear;
      Add('Select * from SUPPLIER');
      Add('Where Supplier_No like ');
      if Length(SupplierNo) < 6 then
        Add('"' + SupplierNo + '%"')
      else
        Add('"' + SupplierNo + '"');
      if Trim(Suppstatuses) <> '' then
      begin
        Add(' And Status in ');
        Add('(' + SuppStatuses + ')');
      end;
      Add(' order by Status, Supplier_NO');
    end;
    Open;
  end;
end;

procedure TfmSuppFind.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmEMData.quSupplierInfo do
  begin
    if Active then Close;
  end;  
end;

procedure TfmSuppFind.miSupplierInfoRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'SUPPLIER_INFO', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmSuppFind.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'miSupplierInfoRep';
  Funcs[3] := 'dgrSupplierFind.OnDblClick';
  //=====================
  fmEMMain.TestProgram( Funcs );
end;

end.
