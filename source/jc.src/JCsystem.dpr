program JCsystem;

uses
  Forms,
  clipbrd,
  dialogs,
  sysutils,
  JCmain in 'JCmain.pas' {fmJCMain},
  JCdatadm in 'JCdatadm.pas' {dmJCData: TDataModule},
  JCcontro in 'JCcontro.pas' {fmJCcontro},
  CostType in 'CostType.pas' {fmCostType},
  CostFile in 'CostFile.pas' {fmCostFile},
  JobMastr in 'JobMastr.pas' {fmJobMastr},
  JCCstCat in 'JCCstCat.pas' {fmJCCstCat},
  contract in 'contract.pas' {fmContract},
  JobClaim in 'JobClaim.pas' {fmJobClaim},
  JCSubJob in 'JCSubJob.pas' {fmJCSubJob},
  WorkRate in 'WorkRate.pas' {fmWorkRate},
  FWOdtDm in 'FWOdtDm.pas' {dmJCFWO: TDataModule},
  FWO_Cat in 'FWO_Cat.pas' {fmFWO_Cat},
  SeleLib in 'SeleLib.pas' {fmSeleLib},
  SeleSUB in 'SeleSUB.pas' {fmSeleSUB},
  Photo in 'Photo.pas' {fmPhoto},
  Analysis in 'Analysis.pas' {fmAnalysis},
  JobDetai in 'JobDetai.pas' {fmJobDetai},
  SbConDtl in 'SbConDtl.pas' {fmSbConDtl},
  SelecJob in 'SelecJob.pas' {fmSelecJob},
  PtSubCon in 'PtSubCon.pas' {fmPtSubCon},
  PtSubCat in 'PtSubCat.pas' {fmPtSubCat},
  SeJobPnt in 'SeJobPnt.pas' {fmSeJobPnt},
  PtJobFwo in 'PtJobFwo.pas' {fmPtJobFwo},
  JobFWO in 'JobFWO.pas' {fmJobFWO},
  LoadTime in 'LoadTime.pas' {fmLoadTime},
  Progress in 'Progress.pas' {fmProgress},
  PrgrsDlg in 'PrgrsDlg.pas' {fmPrgrsDlg},
  rpProgress in 'rpProgress.pas' {qrProgress: TQuickRep},
  ShortPrg in 'ShortPrg.pas' {fmShortPrg},
  ExpFile in 'ExpFile.pas' {fmExpFile},
  JCCstTrx in 'JCCstTrx.pas' {fmJCCstTrx},
  MoveFWO in 'MoveFWO.pas' {fmMoveFWO},
  PtFwoCat in 'PtFwoCat.pas' {fmPtFwoCat},
  fwocstdt in 'fwocstdt.pas' {fmFWOCstDt},
  ProdCat in 'ProdCat.pas' {fmProdCat},
  ProdCtrl in 'ProdCtrl.pas' {fmProdCtrl},
  ProdStat in 'ProdStat.pas' {fmProdStat},
  UserProd in 'UserProd.pas' {fmUserProd},
  JCVendor in 'JCVendor.pas' {fmJCVendor},
  JCTrade in 'JCTrade.pas' {fmJCTrade},
  FinishDlg in 'FinishDlg.pas' {fmFinishDlg};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '工程成本系統';
  Application.CreateForm(TdmJCData, dmJCData);
  begin
    wStr :=  Clipboard.AsText;
    Clipboard.Clear;
    wCompanyID := Copy(wStr,1,Pos('|',wStr)-1);
    Delete(wStr,1,Pos('|',wStr));
    wUserID := Copy(wStr,1,Pos('|',wStr)-1);
    Delete(wStr,1,Pos('|',wStr));
    wPassword := wStr;

    wCompanyID := 'DEVELOP';
    wUserID := 'DEVELOP';
    wPassword := 'devel0p';

    if (trim(wPassword)<>'') then
    with dmJCData do
    begin
      with dbCommon do
      begin
        if Connected then
          Close;
        try
          Params.Values['USER NAME']:= wUserID;
          Params.Values['PASSWORD'] := wPassword;
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
      with quCompany do
      begin
        if Active then
           Close;
        ParamByName('iCompanyID').asstring := wCompanyID;
        Open;
        First;
        wCompanyName := FieldByName('C_Name').asstring;
        wActiveSecurity := FieldByName('Active_Security').asstring;
        close;
      end;

      with quSelServer do
      begin
        if Active then
          Close;
        ParamByName('iCompanyID').AsString := wCompanyID;
        ParamByName('iModuleID').AsString := 'TC';
        Open;
        First;
        wServer := FieldByName('Server').AsString;
        close;
      end;
      {Params.Values['SERVER NAME']:= wServer;
      Params.Values['USER NAME']:= wUserID;
      Params.Values['PASSWORD'] := wPassword; }

      with quSelServer do
      begin
        if Active then
          Close;
        ParamByName('iCompanyID').AsString := wCompanyID;
        ParamByName('iModuleID').AsString := 'JC';
        Open;
        First;
        wServer := FieldByName('Server').AsString;
        wJCServer := FieldByName('Server').AsString;
        close;
      end;
      dbJCData.Params.Values['SERVER NAME']:= wServer;
      dbJCData.Params.Values['USER NAME']:= wUserID;
      dbJCData.Params.Values['PASSWORD'] := wPassword;
      with dbJCdata do
      begin
        if not Connected then
          try
            Connected := true;
          except
            ShowMessage('用戶或口令不正确');
            Application.Terminate;
          end;
      end;
      with quSelServer do
      begin
        if Active then
          Close;
        ParamByName('iCompanyID').AsString := wCompanyID;
        ParamByName('iModuleID').AsString := 'QS';
        Open;
        First;
        wServer := FieldByName('Server').AsString;
        close;
      end;
      dbQuote.Params.Values['SERVER NAME']:= wServer;
      dbQuote.Params.Values['USER NAME']:= wUserID;
      dbQuote.Params.Values['PASSWORD'] := wPassword;
      with dbQuote do
      begin
        if not Connected then
          try
            Connected := true;
          except
            ShowMessage('QS庫不能正确連接,用戶無使用權');
//            Application.Terminate;
          end;
      end;
    end
    else
    begin
      ShowMessage('請從主菜單進入');
      Application.Terminate;
    end;
  end;
  if (dmJCData.dbJCData.Connected) THEN
  begin
    Application.CreateForm(TdmJCFWO, dmJCFWO);
    Application.CreateForm(TfmJCMain, fmJCMain);
    Application.Run;
  end;

end.
