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
  qrItem in 'qrItem.pas' {fmqrItem},
  PrjItem in 'PrjItem.pas' {fmPrjItem},
  qrJobFwo in 'qrJobFwo.pas' {fmqrJobFwo};

function JCReport(ReportName : string; CompanyName : String; userName : String; UserPassword : String;
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
    with dbCommon do
    begin
      if Connected then
        Close;
      try
        Params.Values['USER NAME']:= UserName;
        Params.Values['PASSWORD'] := UserPassword;
      except
        ShowMessage('未能夠更新數据庫裝置');
      end;
      try
        Connected := True;
      except
        ShowMessage('未能夠連接主体系資料庫');
        Application.Terminate;
      end;
    end;
    try
      if not dbRepJcFwo.Connected then
        dbRepJcFwo.Connected := True;
    except
      Abort;
    end;
  end;

  try
    if ReportName = 'ProjectFWO' then
    begin
      Application.CreateForm(TfmRepJcFwo, fmRepJcFwo);
      fmRepJcFwo.ShowModal;
      fmRepJcFwo.Destroy;
    end;

    if ReportName = 'ProjectItem' then
    begin
      Application.CreateForm(TfmPrjItem, fmPrjItem);
      fmPrjItem.ShowModal;
      fmPrjItem.Destroy;
    end;
    dmRepFwo.dbCommon.Connected := False;
    dmRepFwo.dbRepJcFwo.Connected := False;
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
