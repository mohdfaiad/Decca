unit DeccaMain;

interface

uses
  Windows, Messages, SysUtils, ShellApi, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus,clipbrd, ComCtrls, DBCtrls, Grids,
  DBGrids, Db, DBTables, TestPrg;

type
  TfmMain = class(TForm)
    MainMenu1: TMainMenu;
    mmFile: TMenuItem;
    mmExit: TMenuItem;
    mmEdit: TMenuItem;
    mmPrintSetup: TMenuItem;
    mmHelp: TMenuItem;
    mmDesc: TMenuItem;
    mmSelItem: TMenuItem;
    N3: TMenuItem;
    mmVer: TMenuItem;
    ps_: TPrinterSetupDialog;
    paWorker: TPanel;
    sbPrintSetup: TSpeedButton;
    sbPrint: TSpeedButton;
    sbExit: TSpeedButton;
    Panel2: TPanel;
    btCT: TButton;
    btEM: TButton;
    btPM: TButton;
    btIC: TButton;
    btMD: TButton;
    btQS: TButton;
    btAP: TButton;
    btTC: TButton;
    btWP: TButton;
    btPO: TButton;
    btJC: TButton;
    btBF: TButton;
    btGL: TButton;
    btPR: TButton;
    btAR: TButton;
    mmSelCompany: TMenuItem;
    mmCompanyDtl: TMenuItem;
    mmCompanySystem: TMenuItem;
    mmUser: TMenuItem;
    mmUserFunc: TMenuItem;
    mmFuncDesc: TMenuItem;
    anSign: TAnimate;
    N1: TMenuItem;
    mmSystem: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    mmCurrency: TMenuItem;
    sbMS: TSpeedButton;
    TestPrg: TTestPrg;
//    procedure TestFunc(FuncName:String;S:String);
//    procedure TestProgram(Funcs : array of String);
    procedure sbExitClick(Sender: TObject);
    procedure btQSClick(Sender: TObject);
    procedure mmSelCompanyClick(Sender: TObject);
    procedure mmCompanyDtlClick(Sender: TObject);
    procedure mmCompanySystemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mmUserFuncClick(Sender: TObject);
    procedure mmFuncDescClick(Sender: TObject);
    procedure mmUserClick(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure sbPrintSetupClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btWPClick(Sender: TObject);
    procedure btTCClick(Sender: TObject);
    procedure btJCClick(Sender: TObject);
    procedure btPRClick(Sender: TObject);
    procedure mmVerClick(Sender: TObject);
    procedure mmDescClick(Sender: TObject);
    procedure mmSelItemClick(Sender: TObject);
    procedure mmCurrencyClick(Sender: TObject);
    procedure btCTClick(Sender: TObject);
    procedure btPOClick(Sender: TObject);
    procedure btICClick(Sender: TObject);
    procedure sbMSClick(Sender: TObject);
    procedure btPMClick(Sender: TObject);
    procedure btEMClick(Sender: TObject);
    procedure btMDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wPassword : String;
  end;

var
  fmMain: TfmMain;
  wActiveSecurity,
  wStr,
  wPassword,
  wCompanyID,
  wCompanyName,
  wUserID,
  wServer : String;
//  Funcs : array [1..99] of String;
implementation

uses SelComp, DeccaData,Company,Module, UserProg,Func,User, SUserPrg,
  selModule, AboutBox, Currency;

{$R *.DFM}

var
  wCompany : String;

{
procedure TfmMain.TestProgram(Funcs : array of String);
var
  j :Integer;
  i : integer;
  w : String;
  ProgramID : String;
begin
  if (wActiveSecurity = 'Y') then
  begin
    with Screen do
    begin
      ProgramID := Forms[FormCount-1].Name ;
      ProgramID := UpperCase(ProgramID);
      Delete(ProgramID,1,2);
    end;
    w := '';
    with dmDecca.quSelFuncApproved do
    begin
      if Active then
        Close;
      ParamByName('Company_ID').AsString := wCompanyID;
      ParamByName('Program_ID').AsString  := ProgramID;
      ParamByName('User_ID').AsString := wUser;
      Open;
      if (recordCount > 0) then
      begin
        First;
        w := FieldByName('Func_Approved').AsString;
      end;
    end;
    if (w[1] = 'Y') then Exit;
    for j := 1 to 99 do
    begin
      if trim(Funcs[j-1]) <> '' then
      begin
        if j > length(w) then
          TestFunc(Funcs[j-1],'N')
        else
          TestFunc(Funcs[j-1],w[j]);
      end;
    end;
  end;
end;

procedure TfmMain.TestFunc(FuncName:String;S:String);
var
  i: integer;
  wString ,
  wFuncName : String;
begin
  wFuncName := FuncName + '|';
  while Pos('|',wFuncName) > 0 do
  begin
    FuncName := Copy(wFuncName,1,Pos('|',wFuncName)-1);
    Delete(wFuncName,1,Pos('|',wFuncName));

    with Screen do
    begin
      with Forms[FormCount-1] do
      begin
        //
        for i := 0 to ComponentCount-1 do
        begin
          //Showmessage(Components[i].Name);
          if Pos('.',FuncName) = 0 then
          begin
            if Components[i].Name = FuncName then
            begin
              // TBoutton
              if Components[i].ClassName = 'TButton' then
              begin
                if S = 'Y' then
                  TButton(Components[i]).Enabled := True
                else
                  TButton(Components[i]).Enabled := False;
              end;
              // TSpeedBoutton
              if Components[i].ClassName = 'TSpeedButton' then
              begin
                if S = 'Y' then
                  TSpeedButton(Components[i]).Enabled := True
                else
                  TSpeedButton(Components[i]).Enabled := False;
              end;
              // TBitBtn
              if Components[i].ClassName = 'TBitBtn' then
              begin
                if S = 'Y' then
                  TBitBtn(Components[i]).Enabled := True
                else
                  TBitBtn(Components[i]).Enabled := False;
              end;
              // TMenuItem
              if Components[i].ClassName = 'TMenuItem' then
              begin
                if S = 'Y' then
                  TMenuItem(Components[i]).Enabled := True
                else
                  TMenuItem(Components[i]).Enabled := False;
              end;
              // TDBGrid
              if Components[i].ClassName = 'TDBGrid' then
              begin
                if S = 'Y' then
                  TDBGrid(Components[i]).ReadOnly := False
                else
                  TDBGrid(Components[i]).ReadOnly := True;
              end;
              // TDBEdit;
              if Components[i].ClassName = 'TDBEdit' then
              begin
                if S = 'Y' then
                  TDBGrid(Components[i]).Enabled := True
                else
                  TDBGrid(Components[i]).Enabled := False;
              end;
              // TEdit;
              if Components[i].ClassName = 'TEdit' then
              begin
                if S = 'Y' then
                  TDBGrid(Components[i]).Enabled  := True
                else
                  TDBGrid(Components[i]).Enabled  := False;
              end;
              // TTabSheet;
              if Components[i].ClassName = 'TTabSheet' then
              begin
                if S = 'Y' then
                  TTabSheet(Components[i]).TabVisible := True
                else
                  TTabSheet(Components[i]).TabVisible := False;
              end;
              //TDBNavigator
              if Components[i].ClassName = 'TDBNavigator' then
              begin
                if S = 'Y' then
                  TDBNavigator(Components[i]).Enabled := True
                else
                  TDBNavigator(Components[i]).Enabled := False;
              end;
              //TDBCheckBox
              if Components[i].ClassName = 'TDBCheckBox' then
              begin
                if S = 'Y' then
                  TDBCheckBox(Components[i]).Enabled := True
                else
                  TDBCheckBox(Components[i]).Enabled := False;
              end;
              //TPanel;
              if Components[i].ClassName = 'TPanel' then
              begin
                if S = 'Y' then
                  TPanel(Components[i]).Enabled := True
                else
                  TPanel(Components[i]).Enabled := False;
              end;
            end;
          end
          else
          begin
            wString := FuncName;
            Delete(wString,1,Pos('.',FuncName));
            //=================================================================
            if Components[i].Name = Copy(FuncName,1,Pos('.',FuncName)-1) then
            begin
              // TDBNavigator
              if Components[i].ClassName = 'TDBNavigator' then
              begin
                if S = 'Y' then
                begin
                  if wString = 'nbDelete' then
                    TDBNavigator(Components[i]).VisibleButtons :=
                      TDBNavigator(Components[i]).VisibleButtons + [nbDelete];
                  if wString = 'nbInsert' then
                    TDBNavigator(Components[i]).VisibleButtons :=
                      TDBNavigator(Components[i]).VisibleButtons + [nbInsert];
                  if wString = 'nbEdit' then
                    TDBNavigator(Components[i]).VisibleButtons :=
                      TDBNavigator(Components[i]).VisibleButtons + [nbEdit];
                  TDBNavigator(Components[i]).Width :=
                    TDBNavigator(Components[i]).Width + TDBNavigator(Components[i]).Height;
                end
                else
                begin
                  if wString = 'nbDelete' then
                    TDBNavigator(Components[i]).VisibleButtons :=
                      TDBNavigator(Components[i]).VisibleButtons - [nbDelete];
                  if wString = 'nbInsert' then
                    TDBNavigator(Components[i]).VisibleButtons :=
                      TDBNavigator(Components[i]).VisibleButtons - [nbInsert];
                  if wString = 'nbEdit' then
                    TDBNavigator(Components[i]).VisibleButtons :=
                      TDBNavigator(Components[i]).VisibleButtons - [nbEdit];
                  TDBNavigator(Components[i]).Width :=
                    TDBNavigator(Components[i]).Width - TDBNavigator(Components[i]).Height;
                  TDBNavigator(Components[i]).Left :=
                    TDBNavigator(Components[i]).Left  + TDBNavigator(Components[i]).Height;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;
}

procedure TfmMain.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.btQSClick(Sender: TObject);
var
  wStr : array [0..60] of char;
  wPath : String[60];
begin
  with dmDecca do
    with quCompanyMod do
    begin
      if Active then
        Close;
      Open;
      Filter := 'Company_ID =' + '''' + wCompanyID + '''' + ' and ' +
                'Module_ID = ' + '''' + 'QS' + '''';
      Filtered := True;
      First;
      wPath := quCompanyModPROG_PATH.AsString;
      Clipboard.Clear;
      Clipboard.AsText := wPassword;
      strpcopy(wStr, wPath);
      if WinExec(wStr, SW_SHOW) < 32 then
      begin
        wPath := quCompanyModPROG_PATH_2.AsString;
        strpcopy(wStr, wPath);
        if WinExec(wStr, SW_SHOW) < 32 then
        begin
          ShowMessage('未能夠打開工程預算系統');
          Clipboard.Clear;
        end;
      end;
      with dbCommon do
        if Connected then
          Connected := False;
    end;
end;

procedure TfmMain.mmSelCompanyClick(Sender: TObject);
var
  wLst_Company,
  wFix_Company : String;
begin
  wLst_Company := '';
  wFix_Company := 'N';
  with dmDecca do
  begin
    with quSel1User do
    begin
      if Active then
        Close;
      ParamByName('User_ID').asstring := wUserID;
      Open;
      wLst_Company := quSel1UserLST_COMPANY.AsString;
      wFix_Company := quSel1UserFIX_COMPANY.AsString;
      Close;
    end;
  end;

  if (wFix_Company = 'Y') and
     (trim(wLst_Company) <> '') then
  begin
    wPassword := wLst_Company + '|'
               + UpperCase(dmDecca.dbCommon.Params.Values['USER NAME']) + '|'
               + dmDecca.dbCommon.Params.Values['PASSWORD'] ;
    mmSelCompany.Visible := False;
  end
  else
  begin
    Application.CreateForm(TfmSelComp, fmSelComp);
    try
      fmSelComp.ShowModal;
    finally
      wLst_Company := fmSelComp.cbSelCompany.Text;
      wPassword := fmSelComp.cbSelCompany.Text + '|'
                 + UpperCase(dmDecca.dbCommon.Params.Values['USER NAME']) + '|'
                 + dmDecca.dbCommon.Params.Values['PASSWORD'] ;
      fmSelComp.Free;
    end;
  end;

  if trim(wLst_Company) <> '' then
  begin
    with dmDecca.quSel1Company do
    begin
      if Active then
        Close;
      ParamByName('Company_ID').value := wLst_Company;
      Open;
      if not RecordCount > 0 then
      begin
        ShowMessage('公司不存在');
        Application.Terminate;
      end
      else
      begin
        btIC.Enabled := True;
        btEM.Enabled := True;
        btWP.Enabled := True;
        btPR.Enabled := True;
        btJC.Enabled := True;
        btAR.Enabled := True;
        btAP.Enabled := True;
        btGL.Enabled := True;
        btMD.Enabled := True;
        btBF.Enabled := True;
        btPO.Enabled := True;
        btQS.Enabled := True;
        btCT.Enabled := True;
        btPM.Enabled := True;
        btTC.Enabled := True;

        wUserID := UpperCase(dmDecca.dbCommon.Params.Values['USER NAME']);
        wCompanyID := wLst_Company;
        fmMain.Caption := FieldByName('C_Name').value;
        wCompany := fmMain.Caption;

        with dmDecca do
        begin
          with quSel1User do
          begin
            if Active then
              Close;
            ParamByName('User_ID').asstring := wUserID;
            Open;
            Edit;
            FieldByName('Lst_Company').asstring := wCompanyID;
            Post;
            Close;
            with quUserFile do
            begin
              if Active then
                Close;
              Open;
            end;
          end;
        end;
      end;
    end
  end;

  //=================================================================
  with dmDecca.quCompany do
  begin
    //ShowMessage(FieldByName('Company_ID').AsString);
    wActiveSecurity := FieldByName('ACTIVE_SECURITY').AsString;
    if (wActiveSecurity = 'Y') then
    begin
{      Funcs[1] := 'All';
      Funcs[2] := 'mmFuncDesc';
      Funcs[3] := 'mmUserFunc';
      Funcs[4] := 'mmCompanyDtl';
      Funcs[5] := 'mmCompanySystem';
      Funcs[6] := 'mmUser';
      Funcs[7] := 'btEM';
      Funcs[8] := 'btIC';
      Funcs[9] := 'btTC';
      Funcs[10] := 'btPM';
      Funcs[11] := 'btWP';
      Funcs[12] := 'btQS';
      Funcs[13] := 'btOE';
      Funcs[14] := 'btPO';
      Funcs[15] := 'btCT';
      Funcs[16] := 'btJC';
      Funcs[17] := 'btPR';
      Funcs[18] := 'btAP';
      Funcs[19] := 'btAR';
      Funcs[20] := 'btBF';
      Funcs[21] := 'btGL';
      Funcs[22] := 'sbMail';
      Funcs[23] := 'mmCurrency';
      TestProgram(Funcs);
      //==============================================================}
      TestPrg.TestProgram('SY', wCompanyID, wUserID, wActiveSecurity);
    end
    else
    begin
      mmCompanySystem.Enabled := True;
      mmUser.Enabled := True;
      mmUserFunc.Enabled := True;
      mmFuncDesc.Enabled := True;
      mmCompanyDtl.Enabled := True;
      btEM.Enabled := True;
      btIC.Enabled := True;
      btTC.Enabled := True;
      btPM.Enabled := True;
      btWP.Enabled := True;
      btQS.Enabled := True;
      btMD.Enabled := True;
      btPO.Enabled := True;
      btJC.Enabled := True;
      btCT.Enabled := True;
      btPR.Enabled := True;
      btAP.Enabled := True;
      btAR.Enabled := True;
      btBF.Enabled := True;
      btGL.Enabled := True;
    end;
    with anSign do
    begin
      try
        FileName := FieldByName('COMPANY_ANIMATION').AsString;
        if FileName <> '' then Active := True;
      except
//        ShowMessage('動畫文件錯誤!');
        Active := False;
        FileName := '';
      end;
    end;
    Filtered := False;
  end;
end;

procedure TfmMain.mmCompanyDtlClick(Sender: TObject);
begin
  with dmDecca.quCompany do
  begin
    if not Active then Open;
    First;
  end;
  Application.CreateForm(TfmCompany,fmCompany);
  try
    fmCompany.ShowModal;
  finally
    fmCompany.Release;
  end;

  with dmDecca.quCompany do
  begin
    Filter := 'Company_ID =' + '''' + wCompanyID + '''';
    Filtered := True;
    Open;
    if RecordCount = 0 then
    begin
      Filtered := false;
      mmSelCompanyClick(Self);
    end;
    Filtered := false;
    Close;
  end;
end;

procedure TfmMain.mmCompanySystemClick(Sender: TObject);
begin
  with dmDecca.quCompanyMod do
  begin
    if not Active then Open;
    First;
  end;
  Application.CreateForm(TfmModule,fmModule);
  try
    fmModule.ShowModal;
  finally
    fmModule.Release;
  end;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  with dmDecca do
  begin
    with quCompany do
    begin
      if not Prepared then
        Prepare;
      if not Active then
        Open;
    end;
    with quCompanyMod do
    begin
      if not Prepared then
        Prepare;
      if not Active then
        Open;
    end;
    with quUserFile do
    begin
      if not Prepared then
        Prepare;
      if not Active then
        Open;
    end;
    with quPwdDef do
    begin
      if not Prepared then
        Prepare;
      if not Active then
        Open;
    end;
    with quSel1User do
    begin
      if not Prepared then
        Prepare;
    end;

    {if not quSelProgramID.Active then
      quSelProgramID.Open;
    if dbCommon.Params.Values['PASSWORD'] = 'masterkey' then
    begin
      mmSelCompany.Enabled := True;
      mmCompanyDtl.Enabled := True;
      mmCompanySystem.Enabled := True;
      mmUser.Enabled := True;
      mmUserFunc.Enabled := True;
      mmFuncDesc.Enabled := True;
    end; }
  end;
end;

procedure TfmMain.mmUserFuncClick(Sender: TObject);
begin
  {with dmDecca.quUserProg  do
  begin
    if not Active then Open;
      First;
  end;}
  Application.CreateForm(TfmUserMod,fmUserMod);
  try
    fmUserMod.ShowModal;
  finally
    fmUserMod.Release;
    //dmDecca.quUserProg.Close;
    //dmDecca.quUserProg.Open;
  end;
end;

procedure TfmMain.mmFuncDescClick(Sender: TObject);
begin
  Application.CreateForm(TfmFunc,fmFunc);
  try
    fmFunc.ShowModal;
  finally
    fmFunc.Release;
  end;
end;

procedure TfmMain.mmUserClick(Sender: TObject);
begin
  Application.CreateForm(TfmUser,fmUser);
  try
    fmUser.ShowModal;
  finally
    fmUser.Release;
  end;
end;

procedure TfmMain.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.sbPrintSetupClick(Sender: TObject);
begin
  try
    ps_.Execute;
  except
    ShowMessage('打印机錯誤!');
  end;
end;

procedure TfmMain.sbPrintClick(Sender: TObject);
begin
  Print;
end;


procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmDecca do
  begin
    with quCompany do
    begin
      if Active then
        close;
      if Prepared then
        Unprepare;
    end;
    with quCompanyMod do
    begin
      if Active then
        Close;
      if Prepared then
        Unprepare;
    end;
    with quUserFile do
    begin
      if Active then
        Close;
      if Prepared then
        Unprepare;
    end;
    with quPwdDef do
    begin
      if Active then
        Close;
      if Prepared then
        Unprepare;
    end;
    with quSel1User do
    begin
      if Active then
        Close;
      if Prepared then
        Unprepare;
    end;
  end;
  Application.Terminate;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  mmSelCompanyClick(Self);
end;

procedure TfmMain.btWPClick(Sender: TObject);
var
  wStr : array [0..60] of char;
  wPath : String[60];
begin
  with dmDecca do
    with quCompanyMod do
    begin
      if Active then
        Close;
      Open;
      Filter := 'Company_ID =' + '''' + wCompanyID + '''' + ' and ' +
                'Module_ID = ' + '''' + 'WP' + '''';
      Filtered := True;
      First;
      wPath := quCompanyModPROG_PATH.AsString;
      Clipboard.Clear;
      Clipboard.AsText := wPassword;
      strpcopy(wStr, wPath);
      if WinExec(wStr, SW_SHOW) < 32 then
      begin
        wPath := quCompanyModPROG_PATH_2.AsString;
        strpcopy(wStr, wPath);
        if WinExec(wStr, SW_SHOW) < 32 then
        begin
          ShowMessage('未能夠打開工程預算系統');
          Clipboard.Clear;
        end;
      end;
      with dbCommon do
        if Connected then
          Connected := False;
    end;
end;

procedure TfmMain.btTCClick(Sender: TObject);
var
  wStr : array [0..60] of char;
  wPath : String[60];
begin
  with dmDecca do
    with quCompanyMod do
    begin
      if Active then
        Close;
      Open;
      Filter := 'Company_ID =' + '''' + wCompanyID + '''' + ' and ' +
                'Module_ID = ' + '''' + 'TC' + '''';
      Filtered := True;
      First;
      wPath := quCompanyModPROG_PATH.AsString;
      Clipboard.Clear;
      Clipboard.AsText := wPassword;
      strpcopy(wStr, wPath);
      if WinExec(wStr, SW_SHOW) < 32 then
      begin
        wPath := quCompanyModPROG_PATH_2.AsString;
        strpcopy(wStr, wPath);
        if WinExec(wStr, SW_SHOW) < 32 then
        begin
          ShowMessage('未能夠打開工程預算系統');
          Clipboard.Clear;
        end;
      end;
      with dbCommon do
        if Connected then
          Connected := False;
    end;
end;

procedure TfmMain.btJCClick(Sender: TObject);
var
  wStr : array [0..60] of char;
  wPath : String[60];
begin
  with dmDecca do
    with quCompanyMod do
    begin
      if Active then
        Close;
      Open;
      Filter := 'Company_ID =' + '''' + wCompanyID + '''' + ' and ' +
                'Module_ID = ' + '''' + 'JC' + '''';
      Filtered := True;
      First;
      wPath := quCompanyModPROG_PATH.AsString;
      Clipboard.Clear;
      Clipboard.AsText := wPassword;
      strpcopy(wStr, wPath);
      if WinExec(wStr, SW_SHOW) < 32 then
      begin
        wPath := quCompanyModPROG_PATH_2.AsString;
        strpcopy(wStr, wPath);
        if WinExec(wStr, SW_SHOW) < 32 then
        begin
          ShowMessage('未能夠打開工程預算系統');
          Clipboard.Clear;
        end;
      end;
      with dbCommon do
        if Connected then
          Connected := False;
    end;
end;

procedure TfmMain.btPRClick(Sender: TObject);
var
  wStr : array [0..60] of char;
  wPath : String[60];
begin
  with dmDecca do
    with quCompanyMod do
    begin
      if Active then
        Close;
      Open;
      Filter := 'Company_ID =' + '''' + wCompanyID + '''' + ' and ' +
                'Module_ID = ' + '''' + 'PR' + '''';
      Filtered := True;
      First;
      wPath := quCompanyModPROG_PATH.AsString;
      Clipboard.Clear;
      Clipboard.AsText := wPassword;
      strpcopy(wStr, wPath);
      if WinExec(wStr, SW_SHOW) < 32 then
      begin
        wPath := quCompanyModPROG_PATH_2.AsString;
        strpcopy(wStr, wPath);
        if WinExec(wStr, SW_SHOW) < 32 then
        begin
          ShowMessage('未能夠打開工程預算系統');
          Clipboard.Clear;
        end;
      end;
      with dbCommon do
        if Connected then
          Connected := False;
    end;
end;

procedure TfmMain.mmVerClick(Sender: TObject);
begin
  Application.CreateForm(TfmAboutBox,fmAboutBox);
  try
    fmAboutBox.ShowModal;
  finally
    fmAboutBox.Release;
  end;
end;

procedure TfmMain.mmDescClick(Sender: TObject);
begin
  ShellExecute(handle,nil,pchar(Application.HelpFile),nil,nil,sw_shownormal);
 // Application.HelpCommand(HELP_CONTENTS,0);
end;

procedure TfmMain.mmSelItemClick(Sender: TObject);
begin
  Application.HelpCommand(Help_PartialKey,0);
end;

procedure TfmMain.mmCurrencyClick(Sender: TObject);
begin
  Application.CreateForm(TfmCurrency, fmCurrency);
  try
    fmCurrency.ShowModal;
  finally
    fmCurrency.Release;
  end;
end;

procedure TfmMain.btCTClick(Sender: TObject);
var
  wStr : array [0..60] of char;
  wPath : String[60];
begin
  with dmDecca do
    with quCompanyMod do
    begin
      if Active then
        Close;
      Open;
      Filter := 'Company_ID =' + '''' + wCompanyID + '''' + ' and ' +
                'Module_ID = ' + '''' + 'CT' + '''';
      Filtered := True;
      First;
      wPath := quCompanyModPROG_PATH.AsString;
      Clipboard.Clear;
      Clipboard.AsText := wPassword;
      strpcopy(wStr, wPath);
      if WinExec(wStr, SW_SHOW) < 32 then
      begin
        wPath := quCompanyModPROG_PATH_2.AsString;
        strpcopy(wStr, wPath);
        if WinExec(wStr, SW_SHOW) < 32 then
        begin
          ShowMessage('未能夠打開工程預算系統');
          Clipboard.Clear;
        end;
      end;
      with dbCommon do
        if Connected then
          Connected := False;
    end;
end;

procedure TfmMain.btPOClick(Sender: TObject);
var
  wStr : array [0..60] of char;
  wPath : String[60];
begin
  with dmDecca do
    with quCompanyMod do
    begin
      if Active then
        Close;
      Open;
      Filter := 'Company_ID =' + '''' + wCompanyID + '''' + ' and ' +
                'Module_ID = ' + '''' + 'PO' + '''';
      Filtered := True;
      First;
      wPath := quCompanyModPROG_PATH.AsString;
      Clipboard.Clear;
      Clipboard.AsText := wPassword;
      strpcopy(wStr, wPath);
      if WinExec(wStr, SW_SHOW) < 32 then
      begin
        wPath := quCompanyModPROG_PATH_2.AsString;
        strpcopy(wStr, wPath);
        if WinExec(wStr, SW_SHOW) < 32 then
        begin
          ShowMessage('未能夠打開工程預算系統');
          Clipboard.Clear;
        end;
      end;
      with dbCommon do
        if Connected then
          Connected := False;
    end;
end;

procedure TfmMain.btICClick(Sender: TObject);
var
  wStr : array [0..60] of char;
  wPath : String[60];
begin
  with dmDecca do
    with quCompanyMod do
    begin
      if Active then
        Close;
      Open;
      Filter := 'Company_ID =' + '''' + wCompanyID + '''' + ' and ' +
                'Module_ID = ' + '''' + 'IC' + '''';
      Filtered := True;
      First;
      wPath := quCompanyModPROG_PATH.AsString;
      Clipboard.Clear;
      Clipboard.AsText := wPassword;
      strpcopy(wStr, wPath);
      if WinExec(wStr, SW_SHOW) < 32 then
      begin
        wPath := quCompanyModPROG_PATH_2.AsString;
        strpcopy(wStr, wPath);
        if WinExec(wStr, SW_SHOW) < 32 then
        begin
          ShowMessage('未能夠打開工程預算系統');
          Clipboard.Clear;
        end;
      end;
      with dbCommon do
        if Connected then
          Connected := False;
    end;
end;

procedure TfmMain.sbMSClick(Sender: TObject);
var
  wStr : array [0..60] of char;
  wPath : String[60];
begin
  with dmDecca.quCompanyMod do
  begin
    if Active then
      Close;
    Open;
    Filter := 'Company_ID =' + '''' + wCompanyID + '''' + ' and ' +
              'Module_ID = ' + '''' + 'MS' + '''';
    Filtered := True;
    First;
    wPath := FieldByName('Prog_path').AsString;
  end;
  Clipboard.Clear;
  Clipboard.AsText := wPassword;
  strpcopy(wStr, wPath);
  if WinExec(wStr, SW_SHOW) < 32 then
  begin
    ShowMessage('未能夠打開系統');
    Clipboard.Clear;
  end
  else
  begin
    with dmDecca.dbCommon do
    begin
      if Connected then
        Connected := False;
    end;
  end;
end;

procedure TfmMain.btPMClick(Sender: TObject);
var
  wStr : array [0..60] of char;
  wPath : String[60];
begin
  with dmDecca do
    with quCompanyMod do
    begin
      if Active then
        Close;
      Open;
      Filter := 'Company_ID =' + '''' + wCompanyID + '''' + ' and ' +
                'Module_ID = ' + '''' + 'PM' + '''';
      Filtered := True;
      First;
      wPath := quCompanyModPROG_PATH.AsString;
      Clipboard.Clear;
      Clipboard.AsText := wPassword;
      strpcopy(wStr, wPath);
      if WinExec(wStr, SW_SHOW) < 32 then
      begin
        wPath := quCompanyModPROG_PATH_2.AsString;
        strpcopy(wStr, wPath);
        if WinExec(wStr, SW_SHOW) < 32 then
        begin
          ShowMessage('未能夠打開工程預算系統');
          Clipboard.Clear;
        end;
      end;
      with dbCommon do
        if Connected then
          Connected := False;
    end;
end;

procedure TfmMain.btEMClick(Sender: TObject);
var
  wStr : array [0..60] of char;
  wPath : String[60];
begin
  with dmDecca do
    with quCompanyMod do
    begin
      if Active then
        Close;
      Open;
      Filter := 'Company_ID =' + '''' + wCompanyID + '''' + ' and ' +
                'Module_ID = ' + '''' + 'EM' + '''';
      Filtered := True;
      First;
      wPath := quCompanyModPROG_PATH.AsString;
      Clipboard.Clear;
      Clipboard.AsText := wPassword;
      strpcopy(wStr, wPath);
      if WinExec(wStr, SW_SHOW) < 32 then
      begin
        wPath := quCompanyModPROG_PATH_2.AsString;
        strpcopy(wStr, wPath);
        if WinExec(wStr, SW_SHOW) < 32 then
        begin
          ShowMessage('未能夠打開工程預算系統');
          Clipboard.Clear;
        end;
      end;
      with dbCommon do
        if Connected then
          Connected := False;
    end;
end;

procedure TfmMain.btMDClick(Sender: TObject);
var
  wStr : array [0..60] of char;
  wPath : String[60];
begin
  with dmDecca do
  with quCompanyMod do
  begin
    if Active then
      Close;
    Open;
    Filter := 'Company_ID =' + '''' + wCompanyID + '''' + ' and ' +
              'Module_ID = ' + '''' + 'MD' + '''';
    Filtered := True;
    First;
    wPath := quCompanyModPROG_PATH.AsString;
    Clipboard.Clear;
    Clipboard.AsText := wPassword;
    strpcopy(wStr, wPath);
    if WinExec(wStr, SW_SHOW) < 32 then
    begin
      wPath := quCompanyModPROG_PATH_2.AsString;
      strpcopy(wStr, wPath);
      if WinExec(wStr, SW_SHOW) < 32 then
      begin
        ShowMessage('未能夠打開物料分攤系統');
        Clipboard.Clear;
      end;
    end;
    with dbCommon do
      if Connected then
        Connected := False;
  end;
end;

end.
