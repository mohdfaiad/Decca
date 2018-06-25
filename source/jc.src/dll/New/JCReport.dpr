library JCReport;
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
  JCStatus in 'JCStatus.pas' {fmJCStatus},
  qrJobFwo in 'qrJobFwo.pas' {fmqrJobFwo},
  SubPayCf in 'SubPayCf.pas' {fmSubPayCf},
  SubContr in 'SubContr.pas' {fmSubContr},
  Complete in 'G:\jc.src\dll\Complete.pas' {fmComplete},
  Receive in 'G:\jc.src\dll\Receive.pas' {fmReceive};


function JCReports(const ReportName,
                         pCompanyID,
                         pUserID,
                         pPassword : string) : Boolean;

begin
  Application.CreateForm(TdmRepFwo,dmRepFwo);
  Application.Title := '工程成本系統';  
  wCompanyID := pCompanyID;
  wUserID := pUserID;
  wPassword := pPassword;
  Result := False;
  with dmRepFwo do
  begin
    with dbCommon do
    begin
      if Connected then
        Close;
      Params.Values['USER NAME']:= wUserID;
      Params.Values['PASSWORD'] := wPassword;
      try
        Connected := True;
      except
        ShowMessage('未能夠連接主体系資料庫');
        Application.Terminate;
      end;
      with quCompany do
      begin
        if Active then Close;
        ParamByName('Company_ID').Value := wCompanyID;
        Open;
        if RecordCount = 1 then
        begin
          wCompanyName := quCompanyC_NAME.AsString;
          wActiveSecurity := quCompanyACTIVE_SECURITY.AsString;
        end;
      end;
      with quModule do
      begin
        if Active then Close;
        ParamByName('Company_ID').Value := wCompanyID;
        ParamByName('Module_ID').Value := 'JC';
        Open;
        wServer := '';
        if RecordCount = 1 then
          wServer := quModuleSERVER.AsString;
        if Active then
          Close;
      end;
      dbRepJcFwo.Params.Values['SERVER NAME']:= wServer;
      dbRepJcFwo.Params.Values['USER NAME']:= wUserID;
      dbRepJcFwo.Params.Values['PASSWORD'] := wPassword;
      if dbCommon.Connected then
        dbCommon.Connected := False;
    end;
    try
      with dbRepJcFwo do
        if not Connected then
          Connected := true;
      with quJCControl do
      begin
        if not Active then
          Open;
        gUseJobNo2 := quJCControlUSE_JOB_NO_2.AsString;
        gJobNo1Len := quJCControlJOB_NO_1_LEN.AsInteger;
        gJobNo2Len := quJCControlJOB_NO_2_LEN.AsInteger;
        gSubJobLen := quJCControlSUB_JOB_NO_LEN.AsInteger;
        gFWOLen := quJCControlFWO_NO_LEN.AsInteger;
        if Active then
          Close;
      end;
    except
      Abort;
    end;
  end;
  try
    if ReportName = 'ProjectFWO' then
    begin
      fmRepJcFwo.ShowModal;
      fmRepJcFwo.Destroy;
    end;

    if ReportName = 'JCStatus' then
    begin
      fmJCStatus.ShowModal;
      fmJCStatus.Destroy;
    end;
    if ReportName = 'Contract' then
    begin
      Application.CreateForm(TfmSubPayCf, fmSubPayCf);
  fmSubPayCf.ShowModal;
      fmSubPayCf.Destroy;
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
  JCReports index 1;
begin
end.
