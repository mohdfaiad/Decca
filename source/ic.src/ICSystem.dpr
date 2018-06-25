program ICSystem;

uses
  Forms,
  Dialogs,
  clipbrd,
  sysutils,
  IcMain in 'IcMain.pas' {fmICMain},
  ICData in 'ICData.pas' {dmICData: TDataModule},
  ICCtr in 'ICCtr.pas' {fmICCtr},
  ProfitCtr in 'ProfitCtr.pas' {fmProfitCtr},
  WareHouse in 'WareHouse.pas' {fmWareHouse},
  Location in 'Location.pas' {fmLocation},
  ItemCatFil in 'ItemCatFil.pas' {fmItemCatFil},
  ItemSubCat in 'ItemSubCat.pas' {fmItemSub},
  AlterItm in 'AlterItm.pas' {fmAlterItm},
  SelAlter in 'SelAlter.pas' {fmSelAlter},
  UserWhs in 'UserWhs.pas' {fmUserWhs},
  ItemFil in 'ItemFil.pas' {fmItemFil},
  KitFil in 'KitFil.pas' {fmKitFil},
  KitDetail in 'KitDetail.pas' {fmKitDetail},
  IcTrxFil in 'IcTrxFil.pas' {fmIcTrxFil},
  IcTrxDetail in 'IcTrxDetail.pas' {fmIcTrxDetail},
  FindItem in 'FindItem.pas' {fmFindItem},
  IcTrxLot in 'IcTrxLot.pas' {fmIcTrxLot},
  ICTrxCom in 'ICTrxCom.pas' {fmICTrxCom},
  PostDlgpas in 'PostDlgpas.pas' {fmPostDialog},
  EditHist in 'EditHist.pas' {fmEditHist},
  Hist in 'Hist.pas' {fmHist},
  EditHistDtl in 'EditHistDtl.pas' {fmEditHistDtl},
  rpWhs in 'rpWhs.pas' {qrWhs: TQuickRep},
  rpUserWhs in 'rpUserWhs.pas' {qrUserWhs: TQuickRep},
  RpItemFil in 'RpItemFil.pas' {qrItemFil: TQuickRep},
  RpItemCat in 'RpItemCat.pas' {qrItemCat: TQuickRep},
  RpSubCat in 'RpSubCat.pas' {qrSubCat: TQuickRep},
  RpStckStts in 'RpStckStts.pas' {qrStockStatus: TQuickRep},
  RpAlter in 'RpAlter.pas' {qrAlter: TQuickRep},
  rpLotFil in 'rpLotFil.pas' {qrLotFil: TQuickRep},
  PrjRpDlg in 'PrjRpDlg.pas' {fmPrjRpDlg},
  rpPrjUseF in 'rpPrjUseF.pas' {qrPrjUseF: TQuickRep},
  rpPrjUseI in 'rpPrjUseI.pas' {qrPrjUseI: TQuickRep},
  Login in '..\co.Src\Login.pas' {fmLogin};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '倉庫管理系統';
  Application.CreateForm(TdmICData, dmICData);
  begin
    wStr := Clipboard.AsText;
    Clipboard.Clear;
    wCompanyID := Copy(wStr,1,Pos('|',wStr)-1);
    Delete(wStr,1,Pos('|',wStr));
    wUser := Copy(wStr,1,Pos('|',wStr)-1);
    Delete(wStr,1,Pos('|',wStr));
    wPassword := wStr;
    if (trim(wPassword) <> '') then
    begin
      with dmICData do
      begin
        dbCommon.Params.Values['USER NAME']:= wUser;
        dbCommon.Params.Values['PASSWORD'] := wPassword;
        if dbCommon.Connected = False then
          dbCommon.Connected := True;
        with quSelServer do
        begin
          if Active then
            Close;
          ParamByName('Company_ID').AsString := wCompanyID;
          ParamByName('Module_ID').AsString := 'IC';
          Open;
          First;
          wServer := FieldByName('Server').AsString;
          close;
        end;
        with dbICData do
        begin
          Params.Values['SERVER NAME']:= wServer;
          Params.Values['USER NAME']:= wUser;
          Params.Values['PASSWORD'] := wPassword;
        end;
        with quSelServer do
        begin
          if Active then
            Close;
          ParamByName('Company_ID').AsString := wCompanyID;
          ParamByName('Module_ID').AsString := 'JC';
          Open;
          First;
          wServer := FieldByName('Server').AsString;
          Close;
        end;
        with dbJcData do
        begin
          Params.Values['SERVER NAME']:= wServer;
          Params.Values['USER NAME']:= wUser;
          Params.Values['PASSWORD'] := wPassword;
        end;
        with quCompany do
        begin
          if Active then
            Close;
          ParamByName('Company_ID').asstring := wCompanyID;
          Open;
          First;
          wCompanyName := FieldByName('C_Name').asstring;
          wActiveSecurity := FieldByName('Active_Security').asstring;
          close;
        end;
        with dbICData do
        begin
          if not Connected then
          begin
            try
              Connected := true;
              //break;
            except
              ShowMessage('用戶和口令不正确');
              Application.Terminate;
            end;
          end;
        end;
      end;
    end
    else
{   begin
      ShowMessage('請從主菜單進入');
      Application.Terminate;
    end;}
    begin
     fmLogin := TFmLogin.Create(Application);
      with fmLogin do
      begin
        try
          ShowModal;
        finally
          wUser := UpperCase(fmLogin.edUser.Text);
          wPassword := fmLogin.mePassword.Text;

          with dmICData do
          begin
            with dbICData do
            begin
              Params.Values['USER NAME']:= fmLogin.edUser.Text;
              Params.Values['PASSWORD'] := fmLogin.mePassword.Text;
            end;
          end;
          Release;
        end;
      end;

      if fmLogin.edUser.Text <> '' then
      begin
        with dmICData do
        begin
          dbCommon.Params.Values['USER NAME']:= fmLogin.edUser.Text;
          dbCommon.Params.Values['PASSWORD'] := fmlogin.mePassword.Text;
          if dbCommon.Connected = False then
            dbCommon.Connected := True;
        end;

        with dmICData.dbJCData do
        begin
          Params.Values['USER NAME']:= wUser;
          Params.Values['PASSWORD'] := wPassword;
        end;

        with dmICData.dbICData do
        begin
          if not Connected then
          begin
            try
              Connected := true;
            except
              ShowMessage('用戶和口令不正确');
            end;
          end;
        end;
      end;
    end;
  end;


  if dmICData.dbICData.Connected then
  begin
    Application.CreateForm(TfmICMain, fmICMain);
    Application.Run;
  end

end.
