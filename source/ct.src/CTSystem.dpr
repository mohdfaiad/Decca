program CTSystem;

uses
  Forms,
  clipbrd,
  dialogs,
  ctmain in 'ctmain.pas' {fmCTMain},
  CTCostDM in 'CTCostDM.pas' {dmCost: TDataModule},
  Subjobct in 'subjobct.pas' {fmSJCost},
  subjob in 'subjob.pas' {fmSubjob},
  Import in 'import.pas' {fmImport},
  ItemSmry in 'ItemSmry.pas' {fmItemSmry},
  JobNoImp in 'JobNoImp.pas' {fmJobImp},
  QSimport in 'QSimport.pas' {fmQSImpt},
  SJEdit in 'SJEdit.pas' {fmSJEdit},
  repselct in 'repselct.pas' {fmRepSel},
  picscale in 'picscale.pas' {fmPicSca},
  SJRepSel in 'SJRepSel.pas' {fmSJSel},
  SJSelRep in 'SJSelRep.pas' {fmSJRep},
  costrep in 'costrep.pas' {fmCosRep},
  ctdtlrep in 'ctdtlrep.pas' {fmDtlRep},
  CategRep in 'CategRep.pas' {fmCatRep},
  ClrCost in 'ClrCost.pas' {fmClrCost},
  About in 'About.pas' {fmAbout},
  IEImport in 'IEImport.pas' {fmIEImport},
  IEexport in 'IEexport.pas' {fmIEExport},
  SumRpSlt in 'SumRpSlt.pas' {fmSumRpSlt},
  SumRep in 'SumRep.pas' {fmSumRep},
  SumDtRep in 'SumDtRep.pas' {fmSumDtlRep},
  CCRepDlg in 'CCRepDlg.pas' {fmCCRepDlg},
  CCAmtRep in 'CCAmtRep.pas' {qrSltCtCatAmt: TQuickRep},
  CCQtyRep in 'CCQtyRep.pas' {qrSltCtCatQty: TQuickRep},
  SelTotal in 'SelTotal.pas' {fmSelTotal},
  JobRep in 'JobRep.pas' {qrJobRep},
  SeleJob in 'SeleJob.pas' {fmSeleJob},
  RepWork in 'RepWork.pas' {qrRepWork: TQuickRep},
  category in 'category.pas' {fmCateg};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmCost, dmCost);
  Application.Title := '成本核算系統';
  begin
    wStr := Clipboard.AsText;
    Clipboard.Clear;
    wCompanyID := Copy(wStr,1,Pos('|',wStr)-1);
    Delete(wStr,1,Pos('|',wStr));
    wUser := Copy(wStr,1,Pos('|',wStr)-1);
    Delete(wStr,1,Pos('|',wStr));
    wPassword := wStr;
{    wPassword := '';
    wUser := '';
    wCompanyID := 'DEVELOP';}
    with dmCost do
    begin
      dbCommon.Params.Values['USER NAME']:= wUser;
      dbCommon.Params.Values['PASSWORD'] := wPassword;
      if dbCommon.Connected = False then
        try
          dbCommon.Connected := True;
        except
            ShowMessage('用戶和口令不正确');
            Application.Terminate;
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
        ParamByName('iModuleID').AsString := 'CT';
        Open;
        First;
        wServer := FieldByName('Server').AsString;
        close;
      end;
    end;
    with dmCost do
    begin
      dbCTData.Params.Values['SERVER NAME']:= wServer;
      dbCTData.Params.Values['USER NAME']:= wUser;
      dbCTData.Params.Values['PASSWORD'] := wPassword;
      with dbCTData do
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
      dbIECTData.Params.Values['USER NAME']:= wUser;
      dbIECTData.Params.Values['PASSWORD'] := wPassword;
      with quQSServer do
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
      dbQuote.Params.Values['USER NAME']:= wUser;
      dbQuote.Params.Values['PASSWORD'] := wPassword;
      with dbQuote do
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
      with quLBServer do
      begin
        if Active then
          Close;
        ParamByName('iCompanyID').AsString := wCompanyID;
        ParamByName('iModuleID').AsString := 'JC';
        Open;
        First;
        wServer := FieldByName('Server').AsString;
        close;
      end;
      dbJCData.Params.Values['SERVER NAME']:= wServer;
      dbJCData.Params.Values['USER NAME']:= wUser;
      dbJCData.Params.Values['PASSWORD'] := wPassword;
      with dbJCData do
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
  if ((dmCost.dbCTData.Connected) and
      (dmCost.dbQuote.Connected) and
      (dmCost.dbJCData.Connected)) then
  begin
    Application.CreateForm(Tfmctmain, fmctmain);
    Application.Run;
  end;

end.
