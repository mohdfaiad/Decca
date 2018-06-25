program Decca;

uses
  Forms,
  Dialogs,
  Clipbrd,
  sysutils,
  Login in 'Login.pas' {fmLogin},
  DeccaData in 'DeccaData.pas' {dmDecca: TDataModule},
  DeccaMain in 'DeccaMain.pas' {fmMain},
  SelComp in 'SelComp.pas' {fmSelComp},
  Company in 'Company.pas' {fmCompany},
  Module in 'Module.pas' {fmModule},
  UserProg in 'UserProg.pas' {fmUserProg},
  User in 'User.pas' {fmUser},
  Func in 'Func.pas' {fmFunc},
  SelProg in 'SelProg.pas' {fmSelProg},
  selModule in 'selModule.pas' {fmUserMod},
  AboutBox in 'AboutBox.pas' {fmAboutBox},
  Currency in 'Currency.pas' {fmCurrency};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '達藝信息系統';
  Application.HelpFile := 'N:\co.Src\Help\Decca.hlp';
  Application.CreateForm(TdmDecca, dmDecca);
  wStr := Clipboard.AsText;
  Clipboard.Clear;
  //wCompanyID := Copy(wStr,1,Pos('|',wStr)-1);
 // Delete(wStr,1,Pos('|',wStr));
  wUserID := Copy(wStr,1,Pos('|',wStr)-1);
  Delete(wStr,1,Pos('|',wStr));
  wPassword := wStr;
  if (trim(wPassword) <> '') then
  begin
    with dmDecca do
    begin
      dbCommon.Params.Values['USER NAME']:= wUserID;
      dbCommon.Params.Values['PASSWORD'] := wPassword;
      if dbCommon.Connected = False then
          dbCommon.Connected := True;
    end;
  end
  else
  begin
    while true do
    begin
      fmLogin := TFmLogin.Create(Application);
      with fmLogin do
      begin
        try
          ShowModal;
        finally
          wUserID := fmLogin.edUser.Text;
          wPassword := fmLogin.mePassword.Text;
          with dmDecca do
          begin
            dbCommon.Params.Values['USER NAME'] := wUserID;
            dbCommon.Params.Values['PASSWORD'] := wPassword;
          end;
          Release;
        end;
      end;

{      with dmDecca.dbCommon do
      begin
        session.NetFileDir := 'C:';
        session.PrivateDir := 'C:';
      end;
}
      if (trim(wUserID) = '') then
        break
      else
      begin
        with dmDecca.dbCommon do
        begin
          if not Connected then
          begin
            try
              Connected := true;
              break;
            except
              ShowMessage('用戶和口令不正确');
            end;
          end;
        end;
      end;
    end;
  end;

  if dmDecca.dbCommon.Connected then
  begin
    Application.CreateForm(TfmMain, fmMain);
    Application.Run;
  end;
end.
