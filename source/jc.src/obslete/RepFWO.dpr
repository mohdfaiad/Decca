library RepFWO;
uses
  Windows,
  Messages,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  SysUtils,
  Classes,
  RepJcFWO in 'RepJcFWO.pas' {fmRepJcFwo},
  RepFwoDm in 'RepFwoDm.pas' {dmRepFwo: TDataModule},
  qrJobFwo in 'qrJobFwo.pas' {fmqrJobFwo};

function JCReport(CompanyName : String; userName : String; UserPassword : String;
                  JCServer : String) : Boolean;
begin
  Application.CreateForm(TdmRepFwo,dmRepFwo);
  wUser := userName;
  wCompanyName := CompanyName;
  Result := False;

  with dmRepFwo do
  begin
    dbRepJcFwo.Params.Values['SERVER NAME']:= JCServer;
    dbRepJcFwo.Params.Values['USER NAME']:= UserName;
    dbRepJcFwo.Params.Values['PASSWORD'] := UserPassword;
    try
      if not dbRepJcFwo.Connected then
        dbRepJcFwo.Connected := True;
    except
      Abort;
    end;
  end;

  try
    Application.CreateForm(TfmRepJcFwo, fmRepJcFwo);
  fmRepJcFwo.ShowModal;
    fmRepJcFwo.Destroy;
    Result := True;
  except
    Result := False;
  end;
  dmRepFwo.Free;
end;

exports
  JCReport index 1;
begin
end.
