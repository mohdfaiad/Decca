unit SJEdit;

interface

uses
  Clipbrd, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CTCostDM, StdCtrls, DBCtrls, ExtCtrls, Mask, Buttons, ExtDlgs, Menus, wwdblook,
  db, wwdbdatetimepicker;

type
  TfmSJEdit = class(TForm)
    Panel1: TPanel;
    sbClose: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    naSJEdit: TDBNavigator;
    ps_PrintSetup: TPrinterSetupDialog;
    op_picture: TOpenPictureDialog;
    Label1: TLabel;
    Label2: TLabel;
    deJobNo: TDBEdit;
    deJobDesc: TDBEdit;
    gbxSize: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    dbeLength: TDBEdit;
    dbeWidth: TDBEdit;
    dbeHeight: TDBEdit;
    dbeQty: TDBEdit;
    dmeComment: TDBMemo;
    gbxPicture: TGroupBox;
    diPicture: TDBImage;
    Label3: TLabel;
    gbxLine: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbeLineNo: TDBEdit;
    dbeFWO: TDBEdit;
    dbeQSLineNo: TDBEdit;
    dbeDescription: TDBEdit;
    gbxStatus: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    dbrgStatus: TDBRadioGroup;
    deAuthorizer: TDBEdit;
    Button1: TButton;
    Label14: TLabel;
    sbProChange: TSpeedButton;
    Label15: TLabel;
    dbeUnit: TDBEdit;
    dbluCategory: TwwDBLookupCombo;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    pmClearPic: TPopupMenu;
    rmClearPic: TMenuItem;
    procedure diPictureDblClick(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure naSJEditClick(Sender: TObject; Button: TNavigateBtn);
    procedure sbProChangeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rmClearPicClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSJEdit: TfmSJEdit;

implementation

uses picscale, ctmain;

{$R *.DFM}

procedure TfmSJEdit.diPictureDblClick(Sender: TObject);
begin
  if op_picture.Execute then
  begin
    dmCost.quSubjob.Edit;
    diPicture.Picture.Create.LoadFromFile(op_picture.FileName);
  end;
end;

procedure TfmSJEdit.sbCloseClick(Sender: TObject);
begin
  Close;
  Release;
end;

procedure TfmSJEdit.N1Click(Sender: TObject);
begin
  Application.CreateForm(Tfmpicsca, fmpicsca);
  try
    fmpicsca.showmodal;
  finally
    fmpicsca.release;
  end;
end;

procedure TfmSJEdit.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'naSJEdit.nbInsert';
  Funcs[3] := 'naSJEdit.nbDelete';
  Funcs[4] := 'sbProChange';
  //=====================
  fmCTMain.TestProgram( Funcs );
  with dmCost.taCategory do
    if not Active then
      Open;
      
  with dmCost.quSubjob do
  begin
    if FieldByName('Status').Value = 'C' then
    begin
      gbxLine.Enabled := False;
      gbxSize.Enabled := False;
      gbxStatus.Enabled := False;
      gbxPicture.Enabled := False;
      dmeComment.Enabled := False;
    end
    else
    begin
      gbxLine.Enabled := True;
      gbxSize.Enabled := True;
      gbxStatus.Enabled := True;
      gbxPicture.Enabled := True;
      dmeComment.Enabled := True;
    end;
  end;
end;

procedure TfmSJEdit.naSJEditClick(Sender: TObject; Button: TNavigateBtn);
begin
  with dmCost.quSubjob do
  begin
    if FieldByName('Status').Value = 'C' then
    begin
      gbxLine.Enabled := False;
      gbxSize.Enabled := False;
      gbxStatus.Enabled := False;
      gbxPicture.Enabled := False;
      dmeComment.Enabled := False;
    end
    else
    begin
      gbxLine.Enabled := True;
      gbxSize.Enabled := True;
      gbxStatus.Enabled := True;
      gbxPicture.Enabled := True;
      dmeComment.Enabled := True;
    end;
  end;
end;

procedure TfmSJEdit.sbProChangeClick(Sender: TObject);
begin
  gbxLine.Enabled := True;
  gbxSize.Enabled := True;
  gbxStatus.Enabled := True;
  gbxPicture.Enabled := True;
  dmeComment.Enabled := True;
end;

procedure TfmSJEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmCost.taCategory do
    if Active then
      Close;
end;

procedure TfmSJEdit.rmClearPicClick(Sender: TObject);
begin
  with dmCost.quSubJob do
  begin
    Edit;
    if MessageDlg('刪除圖片嗎?', mtConfirmation, [mbOk, mbNo], 0) = mrOk then
       FieldByName('Photo').Clear;
  end;
end;

end.
