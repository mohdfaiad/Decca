unit IcTrxFil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Buttons, Menus, StdCtrls, Mask, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, wwdbdatetimepicker;

type
  TfmIcTrxFil = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dedTrxDocNo: TDBEdit;
    dedCreateBy: TDBEdit;
    dedDocNo: TDBEdit;
    ps_PrintSetup: TPrinterSetupDialog;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    paDept: TPanel;
    sbSave: TSpeedButton;
    sbExit: TSpeedButton;
    sbPrint: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    dnaDept: TDBNavigator;
    GroupBox1: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    drgTrxType: TDBRadioGroup;
    Label5: TLabel;
    Label6: TLabel;
    dtpCreateDate: TwwDBDateTimePicker;
    dmeComment: TDBMemo;
    dedVendorNo: TDBEdit;
    SpeedButton1: TSpeedButton;
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmIcTrxFil: TfmIcTrxFil;

implementation
uses IcData,IcTrxDetail,IcMain, PostDlgpas;
{$R *.DFM}

procedure TfmIcTrxFil.wwDBGrid1DblClick(Sender: TObject);
begin
  with dmICData.quIcTrxFil do
  begin
    if Modified then
      try
        Post;
      except
        Abort;
      end;
    if FieldByName('Doc_NO').AsString = '' then
    begin
      ShowMessage('請填寫處理單號和類型!');
      Abort;
    end;
  end;
  Application.CreateForm(TfmIcTrxDetail,fmIcTrxDetail);
  fmIcTrxDetail.gbTrx.Caption :=
    drgTrxType.Items.Strings[drgTrxType.ItemIndex];
  try
    fmIcTrxDetail.ShowModal;
  finally
    fmIcTrxDetail.Release;
  end;
end;

procedure TfmIcTrxFil.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmIcTrxFil.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TfmIcTrxFil.FormCreate(Sender: TObject);
begin
  with dmICData do
  begin
    with quIcTrxFil do
      if not Active then
        Open;
    with quIcTrxDetail do
      if not Active then
        Open;
    with quIcTrxLot do
      if not Active then
        Open;
    with quStockStatus do
      if not Active then
        Open;
    with quStockLoc do
      if not Active then
        Open;
    with quTrxItem do
      if not Active then
        Open;
    with quTrxItemPhoto do
      if not Active then
        Open;
  end;
end;

procedure TfmIcTrxFil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmICData do
  begin
    with quIcTrxFil do
      if Active  then
        Close;
    with quIcTrxDetail do
      if  Active then
        Close;
    with quIcTrxLot do
      if Active then
        Close;
    with quStockStatus do
      if Active then
        Close;
    with quStockLoc do
      if Active then
        Close;
    with quTrxItem do
      if Active then
        Close;
    with quLotFil do
      if Active then
        Close;
    with quTrxItemPhoto do
      if Active then
        Close;
  end;
end;

procedure TfmIcTrxFil.sbSaveClick(Sender: TObject);
begin
  with  dmICData.dbICData do
  begin
    if InTransaction then
      Commit;
  end;
  Application.CreateForm(TfmPostDialog,fmPostDialog);
  try
    fmPostDialog.ShowModal;
  finally
    fmPostDialog.Free;
  end;
end;

procedure TfmIcTrxFil.FormShow(Sender: TObject);
begin
  dedDocNo.SetFocus;
end;

end.
