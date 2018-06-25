program emsystem;

uses
  Dialogs,
  Clipbrd,
  Forms,
  emmain in 'emmain.pas' {fmEMMain},
  emdatamd in 'emdatamd.pas' {dmEMData: TDataModule},
  eqpfind in 'eqpfind.pas' {fmEQPFind},
  EQPType in 'EQPType.pas' {fmEQPType},
  partstyp in 'partstyp.pas' {fmPrtsType},
  servtype in 'servtype.pas' {fmServType},
  suppfind in 'suppfind.pas' {fmSuppFind},
  suppinfo in 'suppinfo.pas' {fmSuppInfo},
  eqpinfo in 'eqpinfo.pas' {fmEQPInfo},
  partsfnd in 'partsfnd.pas' {fmPartsFnd},
  prtsfile in 'prtsfile.pas' {fmPrtsFile},
  SrvNoFnd in 'SrvNoFnd.pas' {fmSrvNoFnd},
  ServInfo in 'ServInfo.pas' {fmServInfo},
  ptsIOInf in 'ptsIOInf.pas' {fmPtsIOInf},
  picscale in 'picscale.pas' {fmPicSca},
  emcontrl in 'emcontrl.pas' {fmControl},
  EmCompany in 'EmCompany.pas' {fmEMComp};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmEMData, dmEMData);
  Application.Title := '机修管理系統';
  begin
    wStr := Clipboard.AsText;
    Clipboard.Clear;
    wCompanyID := Copy(wStr,1,Pos('|',wStr)-1);
    Delete(wStr,1,Pos('|',wStr));
    wUser := Copy(wStr,1,Pos('|',wStr)-1);
    Delete(wStr,1,Pos('|',wStr));
    wPassword := wStr;
    with dmEMData do
    begin
      dbCommon.Params.Values['USER NAME']:= wUser;
      dbCommon.Params.Values['PASSWORD'] := wPassword;
      if dbCommon.Connected = False then
        dbCommon.Connected := True;
      with quCompany do
      begin
        if Active then
          Close;
        ParamByName('iCompanyID').AsString := wCompanyID;
        Open;
        First;
        wCompanyName := FieldByName('C_Name').asstring;
        wActiveSecurity := FieldByName('Active_Security').asstring;
        Close;
      end;
      with quEMServer do
      begin
        if Active then
          Close;
        ParamByName('Company_ID').AsString := wCompanyID;
        Open;
        First;
        wEMServer := FieldByName('Server').AsString;
        Close;
      end;
      dbEMData.Params.Values['SERVER NAME']:= wEMServer;
      dbEMData.Params.Values['USER NAME']:= wUser;
      dbEMData.Params.Values['PASSWORD'] := wPassword;
      with quWPServer do
      begin
        if Active then
          Close;
        ParamByName('Company_ID').AsString := wCompanyID;
        Open;
        First;
        wWPServer := FieldByName('Server').AsString;
        Close;
      end;
      dbWPData.Params.Values['SERVER NAME']:= wWPServer;
      dbWPData.Params.Values['USER NAME']:= wUser;
      dbWPData.Params.Values['PASSWORD'] := wPassword;
      with dbEMData do
      begin
        if not Connected then
        begin
          try
            Connected := true;
          except
            ShowMessage('用戶和口令不正确');
            Application.Terminate;
          end;
        end;
      end;
      with dbWPData do
      begin
        if not Connected then
        begin
          try
            Connected := true;
          except
            ShowMessage('用戶和口令不正确');
            Application.Terminate;
          end;
        end;
      end;
    end;
  end;
  if (dmEMData.dbEMData.Connected and dmEMData.dbWPData.Connected) then
  begin
    Application.CreateForm(TfmEMMain, fmEMMain);
    Application.Run;
  end;
{  Application.Initialize;
  Application.CreateForm(TfmEMMain, fmEMMain);
  Application.CreateForm(TdmEMData, dmEMData);
  wUser := 'SYSDBA';
  wPassword := 'masterkey';
  wServer := '\\software\d:\deccadb\emdata.gdb';
  Application.Run;  }
end.
