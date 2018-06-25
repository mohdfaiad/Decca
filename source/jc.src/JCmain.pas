unit JCmain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, StdCtrls,ToolWin, ComCtrls,
  Grids, DBGrids, DBCtrls, Db,
  DBTables, Wwdbigrd, Wwdbgrid, wwSpeedButton, wwDBNavigator, TestPrg;

type
  TfmJCMain = class(TForm)
    paTools: TPanel;
    printSetup: TPrinterSetupDialog;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    mmJCmain: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmSetup: TMenuItem;
    mmContrl: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    btnJob: TBitBtn;
    mmJobCC: TMenuItem;
    mmWorkRT: TMenuItem;
    N2: TMenuItem;
    mmFWO_Cat: TMenuItem;
    btnLibrary: TBitBtn;
    mmJobCost: TMenuItem;
    mmLoadTime: TMenuItem;
    N4: TMenuItem;
    btnProgress: TBitBtn;
    TestPrg: TTestPrg;
    mmExpTime: TMenuItem;
    btnJCCstTrx: TBitBtn;
    mmProdCat: TMenuItem;
    mmUserProdCat: TMenuItem;
    N7: TMenuItem;
    btnProdCtrl: TBitBtn;
    mmVendor: TMenuItem;
    mmTrade: TMenuItem;
    paMain: TPanel;
//
//    procedure TestFunc(FuncName:String;S:String);
//    procedure TestProgram(Funcs : array of String);
//
    procedure mmPrintsetupClick(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure mmContrlClick(Sender: TObject);
    procedure mmJobCCClick(Sender: TObject);
    procedure btnJobClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mmWorkRTClick(Sender: TObject);
    procedure mmFWO_CatClick(Sender: TObject);
    procedure btnLibraryClick(Sender: TObject);
    procedure mmJobCostClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mmLoadTimeClick(Sender: TObject);
    procedure btnProgressClick(Sender: TObject);
    procedure mmExpTimeClick(Sender: TObject);
    procedure btnJCCstTrxClick(Sender: TObject);
    procedure btnProdCtrlClick(Sender: TObject);
    procedure mmProdCatClick(Sender: TObject);
    procedure mmUserProdCatClick(Sender: TObject);
    procedure mmVendorClick(Sender: TObject);
    procedure mmTradeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJCMain: TfmJCMain;
  Funcs : Array [1..99] of String;
  wActiveSecurity,
  wCompanyName,
  wStr,
  wUserID,
  wPassword,
  wServer,
  wJCServer,
  wCompanyID : string;
  gInSingle : Boolean;
  gCalcQty : real;
  gUseFields,
  gJobNo1Len,
  gJobNo2Len,
  gSubJobLen,
  gFWOLen : Integer;
  gBillACByJob,
  gUseRetainAP,
  gUseRetainAR,
  gUseJobNo2 : string;

implementation
  uses jccontro,
       CostType,
       SelecJob,
       JCCstCat,
       JCdatadm,
       WorkRate,
       FWO_Cat,
       CostFile,
       SeleLib,
       LoadTime,
       Progress,
       ExpFile,
       JCCstTrx, ProdCtrl, ProdCat, UserProd, JCVendor, JCTrade;
{$R *.DFM}

{
procedure TfmJCmain.TestProgram(Funcs : array of String);
var
  i, j :Integer;
  w : String;
  ProgramID : String;
begin
  if (wActiveSecurity = 'Y') then
  begin
    with Screen do
      ProgramID := Uppercase(Forms[FormCount-1].Name) ;
      Delete(ProgramID,1,2);
    with dmJCData.quSelFuncApproved do
    begin
      if Active then
        Close;
      ParamByName('Company_ID').AsString := wCompanyID;
      ParamByName('Program_ID').AsString  := ProgramID;
      ParamByName('User_ID').AsString := wUserID;
      Open;
      w := ' ';
      i := 99;
      if (RecordCount > 0) then
      begin
        First;
        w := FieldByName('Func_Approved').AsString;
        i := Length(w);
      end;
    end;
    if (w[1] = 'Y') then Exit;
    for j := 1 to i do
    begin
      if (w = ' ') then
        TestFunc(Funcs[j - 1], 'N')
      else
        TestFunc(Funcs[j-1],w[j]);
    end;
  end;
end;

procedure TfmJCmain.TestFunc(FuncName:String;S:String);
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
              // TLabel
              if Components[i].ClassName = 'TLabel' then
              begin
                if S = 'Y' then
                  TLabel(Components[i]).Enabled := True
                else
                  TLabel(Components[i]).Enabled := False;
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
              //TRadioGroup;
              if Components[i].ClassName = 'TRadioGroup' then
              begin
                if S = 'Y' then
                  TRadioGroup(Components[i]).Enabled  := True
                else
                  TRadioGroup(Components[i]).Enabled  := False;
              end;
              // TTabSheet;
            end;
          end
          else
          begin
            wString := FuncName;
            Delete(wString,1,Pos('.',FuncName));
            //=================================================================
            if Components[i].Name = Copy(FuncName,1,Pos('.',FuncName)-1) then
            begin
              // TDBGrid
              if Components[i].ClassName = 'TDBGrid' then
              begin
                if S = 'N' then
                begin
                  if wString = 'OnDblClick' then
                    TDbGrid(Components[i]).OnDblClick := nil;
                end;
              end;
              //TwwDBGrid
              if Components[i].ClassName = 'TwwDBGrid' then
              begin
                if S = 'N' then
                begin
                  if wString = 'OnDblClick' then
                    TwwDBGrid(Components[i]).OnDblClick := nil;
                end;
              end;
              // OnEnter
              if Components[i].ClassName = 'TDBEdit' then
              begin
                if S = 'Y' then
                begin
                  if wString = 'OnEnter' then
                    TDBEdit(Components[i]).OnEnter := nil;
                end;
              end;
              // ReadOnly
              if Components[i].ClassName = 'TDBEdit' then
              begin
                if S = 'N' then
                begin
                  if wString = 'ReadOnly' then
                    TDBEdit(Components[i]).ReadOnly := true;
                end;
              end;
              //TGroupBox
              if Components[i].ClassName = 'TGroupBox' then
              begin
                if S = 'N' then
                begin
                  if wString = 'OnDblClick' then
                    TGroupBox(Components[i]).OnDblClick := nil;
                end;
              end;
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

procedure TfmJCMain.mmPrintsetupClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmJCMain.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJCMain.mmContrlClick(Sender: TObject);
begin
  Application.CreateForm(TfmJCcontro,fmJCcontro);
  try
    fmJCcontro.ShowModal;
  finally
    fmJCcontro.Release;
  end;
end;

procedure TfmJCMain.mmJobCCClick(Sender: TObject);
begin
  Application.CreateForm(TfmCostType,fmCostType);
  try
    fmCostType.ShowModal;
  finally
    fmCostType.Release;
  end;
end;

procedure TfmJCMain.btnJobClick(Sender: TObject);
begin
  Application.CreateForm(TfmSelecJob,fmSelecJob);
  try
    with dmJCdata.quJCcontrol do
      if not Active then
        Open;
    fmSelecJob.ShowModal;
  finally
    fmSelecJob.Release;
  end;
end;

procedure TfmJCMain.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
{  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'mmWorkRT';
  Funcs[3] := 'mmFWO_CAT';
  Funcs[4] := 'mmJobCC';
  Funcs[5] := 'mmContrl';
  Funcs[6] := 'btnJob';
  Funcs[7] := 'btnBudget';
  Funcs[8] := 'btnCost';
  Funcs[9] := 'mmJobCost';
  //=====================
//  TestProgram( Funcs );}
  TestPrg.TestProgram('JC', wCompanyID, wUserID, wActiveSecurity);
end;

procedure TfmJCMain.mmWorkRTClick(Sender: TObject);
begin
  Application.CreateForm(TfmWorkRate,fmWorkRate);
  try
    fmWorkRate.ShowModal;
  finally
    fmWorkRate.Release;
  end;
end;

procedure TfmJCMain.mmFWO_CatClick(Sender: TObject);
begin
  try
    Application.CreateForm( TfmFWO_Cat,fmFWO_Cat);
    fmFWO_Cat.ShowModal;
  finally
    fmFWO_Cat.Release;
  end;
end;

procedure TfmJCMain.btnLibraryClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfmSeleLib,fmSeleLib);
    fmSeleLib.ShowModal;
  finally
    fmSeleLib.Release;
  end;
end;

procedure TfmJCMain.mmJobCostClick(Sender: TObject);
begin
  Application.CreateForm(Tfmcostfile,fmCostFile);
  Try
    fmcostfile.ShowModal;
  finally
    fmcostfile.Release;
  end;
end;

procedure TfmJCMain.FormShow(Sender: TObject);
begin
  with dmJCdata do
  begin
    with quJCcontrol do
    begin
      if not Active then
        Open;
      gJobNo1Len := quJCcontrolJOB_NO_1_LEN.AsInteger;
      gUseJobNo2 := quJCcontrolUSE_JOB_NO_2.AsString;
      gJobNo2Len := quJCcontrolJOB_NO_2_LEN.AsInteger;
      gBillACByJob := quJCcontrolUSE_BILL_AC_BY_JOB.AsString;
      gUseRetainAP := quJCcontrolUSE_RETAIN_AP.AsString;
      gUseRetainAR := quJCcontrolUSE_RETAIN_AR.AsString;
      gUseFields := quJCcontrolUSE_FIELDS.AsInteger;
      Close;
    end;
  end;
end;

procedure TfmJCMain.mmLoadTimeClick(Sender: TObject);
begin
  Application.CreateForm(TfmLoadTime, fmLoadTime);
  try
    fmLoadTime.ShowModal;
  finally
    fmLoadTime.Free;
  end;
end;

procedure TfmJCMain.btnProgressClick(Sender: TObject);
begin
  Application.CreateForm(TfmProgress,fmProgress);
  try
    fmProgress.ShowModal;
  finally
    fmProgress.Release;
  end;
end;

procedure TfmJCMain.mmExpTimeClick(Sender: TObject);
begin
  Application.CreateForm(TfmExpFile, fmExpFile);
  try
    fmExpFile.ShowModal;
  finally
    fmExpFile.Free;
  end;
end;

procedure TfmJCMain.btnJCCstTrxClick(Sender: TObject);
begin
  Application.CreateForm(TfmJCCstTrx,fmJCCstTrx);
  try
    fmJCCstTrx.ShowModal;
  finally
    fmJCCstTrx.Free;
  end;
end;

procedure TfmJCMain.btnProdCtrlClick(Sender: TObject);
begin
  Application.CreateForm(TfmProdCtrl,fmProdCtrl);
  try
    fmProdCtrl.ShowModal;
  finally
    fmProdCtrl.Free;
  end;
end;

procedure TfmJCMain.mmProdCatClick(Sender: TObject);
begin
  Application.CreateForm(TfmProdCat,fmProdCat);
  try
    fmProdCat.ShowModal;
  finally
    fmProdCat.Release;
  end;
end;

procedure TfmJCMain.mmUserProdCatClick(Sender: TObject);
begin
  Application.CreateForm(TfmUserProd,fmUserProd);
  try
    fmUserProd.ShowModal;
  finally
    fmUserProd.Release;
  end;
end;

procedure TfmJCMain.mmVendorClick(Sender: TObject);
begin
  Application.CreateForm(TfmJCVendor,fmJCVendor);
  try
    fmJCVendor.ShowModal;
  finally
    fmJCVendor.Release;
  end;
end;

procedure TfmJCMain.mmTradeClick(Sender: TObject);
begin
  Application.CreateForm(TfmJCTrade,fmJCTrade);
  try
    fmJCTrade.ShowModal;
  finally
    fmJCTrade.Release;
  end;
end;

end.
