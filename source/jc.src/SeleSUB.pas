unit SeleSUB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, ExtCtrls, Menus, TestPrg;

type
  TfmSeleSUB = class(TForm)
    paSelect: TPanel;
    Label1: TLabel;
    edFWO_No: TEdit;
    grJOBNO: TGroupBox;
    dgrSeleSub: TwwDBGrid;
    dcbStatus: TwwDBComboBox;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    printSetup: TPrinterSetupDialog;
    sbLoadLibrary: TSpeedButton;
    dedJobNo: TwwDBEdit;
    laJobNo: TLabel;
    mmSeleSub: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    btnOK: TBitBtn;
    dedDescription: TwwDBEdit;
    TestPrg: TTestPrg;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure sbLoadLibraryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dgrSeleSubTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgrSeleSubDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSeleSUB: TfmSeleSUB;

implementation
  uses JCdatadm,
       JCmain,
       FWOdtDM,
       Analysis,
       JobFWO;
{$R *.DFM}

procedure TfmSeleSUB.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
{  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'btnOK';
  Funcs[3] := 'dgrSeleSub.OnDblClick';
  Funcs[4] := 'spLoadLibrary';
  //=====================
  fmJCmain.TestProgram( Funcs ); }
  TestPrg.TestProgram('JC', wCompanyID, wUserID, wActiveSecurity);
end;

procedure TfmSeleSUB.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSeleSUB.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmSeleSUB.btnOKClick(Sender: TObject);
var fwono : String;
    i :Integer;
begin
  with dmJCFWO  do
  begin
    With quSeleSub_FWO do
    begin
      if Active  then
         Close;
      if ((Length(Trim(edFWO_No.Text)) > 0 ) and
        (Length(Trim(edFWO_No.Text))<4)) then
        for i:= 1  to 4 - Length(Trim(edFWO_No.Text)) do
          fwono := Trim(fwono) + '%';
      fwono := Trim(edFWO_No.Text) + fwono;

      ParamByName('iFwoNo').AsString := fwono ;
      Open;
    end;
  end;
end;

procedure TfmSeleSUB.sbLoadLibraryClick(Sender: TObject);
begin
  try
    with dmJCData do
    begin
      quJOB_FWO.RequestLive := False;
      quJOB_FWO.CachedUpdates := False;
    end;
    Application.CreateForm(TfmJobFWO,fmJobFWO);
    fmJobFWO.ShowModal;
  finally
    fmJobFWO.Release;
    with dmJCData do
    begin
      quJOB_FWO.RequestLive := True;
      quJob_FWO.CachedUpdates := True;
    end;
  end;
end;

procedure TfmSeleSUB.FormShow(Sender: TObject);
begin
  with  dmJCFWO do
  begin
    with quSeleSub_FWO do
    begin
      if Active then
        Close;
      ParamByName('iFwoNO').AsString := '';
      Open;
    end;
  end;
end;

procedure TfmSeleSUB.dgrSeleSubTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
  wFWONo :string;
  i : integer;
begin
  if (AFieldName = 'OFWO_NO') or
     (AFieldName = 'OSUB_NO') or
     (AFieldName = 'OQUOT_NO') then
  begin
    with dmJCFWO do
      with quSeleSub_FWO do
      begin
        if Active then
          Close;
        with SQL do
        begin
          Clear;
          Add('Select * from Get_SUB_FWO( :iJobNo1,:iJobNo2,:iFwoNo)');
          if (AFieldName = 'OFWO_NO') then
            Add('  order by oFWO_NO')
          else
            if (AFieldName = 'OSUB_NO') then
              Add('  order by oSUB_NO, oFWO_No')
            else
               Add('  order by oQuot_No, oFWO_No')
        end;
        if ((Length(Trim(edFWO_No.Text)) > 0 ) and
           (Length(Trim(edFWO_No.Text))<4)) then
          for i:= 1  to 4 - Length(Trim(edFWO_No.Text)) do
            wFWONo := Trim(wFWONo) + '%';
        ParamByName('iFwoNo').Value := wFWONo;
        Open;
      end;
  end;
end;

procedure TfmSeleSUB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with  dmJCFWO do
  begin
    with quSeleSub_FWO do
      if Active then
        Close;
  end;
end;

procedure TfmSeleSUB.dgrSeleSubDblClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfmAnalysis,fmAnalysis);
    fmAnalysis.ShowModal;
  finally
    fmAnalysis.Release;
  end;
end;

end.
