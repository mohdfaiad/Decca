unit picscale;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Buttons, Clipbrd, Menus, wwSpeedButton,
  wwDBNavigator;

type
  TfmPicSca = class(TForm)
    DBImage1: TDBImage;
    Panel1: TPanel;
    sbClose: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    DBNavigator1: TDBNavigator;
    procedure btnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure sbCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPicSca: TfmPicSca;

implementation

uses
  CTCostDM, SJEdit, ctmain;

{$R *.DFM}

procedure TfmPicSca.btnExitClick(Sender: TObject);
begin
  close;
  Release;
end;

procedure TfmPicSca.FormShow(Sender: TObject);
begin
{  fmSJEdit.diPicture.CopyToClipboard;
  try
    Image1.Picture.LoadFromClipBoardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
  except
    exit;
  end; }
end;

procedure TfmPicSca.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin

{  fmSJEdit.diPicture.CopyToClipboard;
//  if not Image1.Enabled then
//     Image1.Enabled := True;
  try
    Image1.Picture.LoadFromClipBoardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
  except
    Image1.Destroy;
    Application.Create(Image1);
    exit;
  end;   }

{ form1.DBIMAGE1.CopyToClipboard;
 Bitmap := TBitMap.create;
 bitmap.CleanupInstance;
 try
   Bitmap.LoadFromClipBoardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
   canvas.draw(88,64,Bitmap);
 except
   Bitmap.free;
   halt;
 end;
 }
end;

procedure TfmPicSca.sbCloseClick(Sender: TObject);
begin
  close;
  release;
  if fmSJEdit.sbProChange.Enabled = False then
  with fmSJEdit, dmCost.quSubjob do
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



procedure TfmPicSca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  close;
  release;
  if fmSJEdit.sbProChange.Enabled = False then
  with fmSJEdit, dmCost.quSubjob do
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

procedure TfmPicSca.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
end;

end.
