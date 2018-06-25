unit emmain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, StdCtrls, Buttons, DBGrids, dbctrls, wwDBGrid;

type
  TfmEMMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    sbPrinterSetup: TSpeedButton;
    sbExit: TSpeedButton;
    btnEQPInfo: TButton;
    btnPartsInfo: TButton;
    btnServInfo: TButton;
    btnPartsIORec: TButton;
    mmEMMain: TMainMenu;
    miFile: TMenuItem;
    mmPrSetup: TMenuItem;
    mmExit: TMenuItem;
    mmSetUp: TMenuItem;
    miReport: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    mmEQP_Type: TMenuItem;
    mmParts_Type: TMenuItem;
    mmServ_Type: TMenuItem;
    N1: TMenuItem;
    mmSupplierInfo: TMenuItem;
    mmEQPInfoRep: TMenuItem;
    mmEQPPrtsInfoRep: TMenuItem;
    N4: TMenuItem;
    mmPartsInfoRep: TMenuItem;
    mmPartsIORep: TMenuItem;
    N7: TMenuItem;
    mmServRecRep: TMenuItem;
    mmEQPTypeRep: TMenuItem;
    N10: TMenuItem;
    mmPartsTypeRep: TMenuItem;
    miServTypeRep: TMenuItem;
    mmSuppInfoRep: TMenuItem;
    N14: TMenuItem;
    N2: TMenuItem;
    mmEMControl: TMenuItem;
    mmEmCompany: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    procedure sbPrinterSetupClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure mmPrSetupClick(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure btnEQPInfoClick(Sender: TObject);
    procedure mmEQP_TypeClick(Sender: TObject);
    procedure mmParts_TypeClick(Sender: TObject);
    procedure mmServ_TypeClick(Sender: TObject);
    procedure mmSupplierInfoClick(Sender: TObject);
    procedure btnPartsInfoClick(Sender: TObject);
    procedure btnServInfoClick(Sender: TObject);
    procedure btnPartsIORecClick(Sender: TObject);
    procedure mmPartsIORepClick(Sender: TObject);
    procedure mmEMControlClick(Sender: TObject);
    procedure mmServRecRepClick(Sender: TObject);
    procedure mmEQPInfoRepClick(Sender: TObject);
    procedure mmEQPPrtsInfoRepClick(Sender: TObject);
    procedure mmPartsInfoRepClick(Sender: TObject);
    procedure mmSuppInfoRepClick(Sender: TObject);
    procedure mmEQPTypeRepClick(Sender: TObject);
    procedure mmPartsTypeRepClick(Sender: TObject);
    procedure miServTypeRepClick(Sender: TObject);
    procedure TestProgram(Funcs : array of String);
    procedure TestFunc(FuncName:String;S:String);
    procedure FormCreate(Sender: TObject);
    procedure mmEmCompanyClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TEMReport = function(companyname : String; user : String; password : String;
                       Server1 : String; Server2 : String; RepName : String;
                       SerialNo : Integer) : Boolean;

var
  fmEMMain: TfmEMMain;
  Funcs : Array [1..99] of String;
  wActiveSecurity,
  wStr,
  wUser,
  wPassword,
  wEMServer,
  wWPServer,
  wCompanyID,
  wCompanyName : string;
  Module : Thandle;
  PFunc : TFarProc;

implementation

uses eqpfind, eqptype, partstyp, servtype, suppfind, partsfnd, SrvNoFnd,
  ptsIOInf, emcontrl, emdatamd, EmCompany;

{$R *.DFM}

procedure TfmEMMain.TestProgram(Funcs : array of String);
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
    with dmEMData.quSelFuncApproved do
    begin
      if Active then
        Close;
      ParamByName('Company_ID').AsString := wCompanyID;
      ParamByName('Program_ID').AsString  := ProgramID;
      ParamByName('User_ID').AsString := wUser;
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
    if (w[1] <> 'Y') then
      for j := 1 to i do
      begin
        if (w = ' ') then
          TestFunc(Funcs[j - 1], 'N')
        else
          TestFunc(Funcs[j-1],w[j]);
      end;
    with dmEMData.dbCommon do
      if Connected then
        Connected := False;
  end;
end;

procedure TfmEMMain.TestFunc(FuncName:String;S:String);
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
//          Showmessage(Components[i].Name);
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
              // TwwDBGrid
              if Components[i].ClassName = 'TwwDBGrid' then
              begin
                if S = 'Y' then
                  TwwDBGrid(Components[i]).ReadOnly := False
                else
                  TwwDBGrid(Components[i]).ReadOnly := True;
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
       {       if Components[i].ClassName = 'TTabSheet' then
              begin
                if S = 'Y' then
                  TTabSheet(Components[i]).TabVisible := True
                else
                  TTabSheet(Components[i]).TabVisible := False;
              end;  }
            end;
          end
          else
          begin
            wString := FuncName;
            Delete(wString,1,Pos('.',FuncName));
            //=================================================================
            if Components[i].Name = Copy(FuncName,1,Pos('.',FuncName)-1) then
            begin
              // TwwDBGrid
              if Components[i].ClassName = 'TwwDBGrid' then
              begin
                if S = 'N' then
                begin
                  if wString = 'OnDblClick' then
                    TwwDbGrid(Components[i]).OnDblClick := nil;
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

procedure TfmEMMain.sbPrinterSetupClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmEMMain.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEMMain.mmPrSetupClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmEMMain.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEMMain.btnEQPInfoClick(Sender: TObject);
begin
  Application.Createform(TfmEQPFind, fmEQPFind);
  try
    fmEQPFind.Showmodal;
    fmEQPFind.Release;
  except
    fmEQPFind.Release;
  end;
end;

procedure TfmEMMain.mmEQP_TypeClick(Sender: TObject);
begin
  Application.Createform(TfmEQPType, fmEQPType);
  try
    fmEQPType.Showmodal;
    fmEQPType.Release;
  except
    fmEQPType.Release;
  end;
end;

procedure TfmEMMain.mmParts_TypeClick(Sender: TObject);
begin
  Application.Createform(TfmPrtsType, fmPrtsType);
  try
    fmPrtsType.Showmodal;
    fmPrtsType.Release;
  except
    fmPrtsType.Release;
  end;
end;

procedure TfmEMMain.mmServ_TypeClick(Sender: TObject);
begin
  Application.Createform(TfmServType, fmServType);
  try
    fmServType.Showmodal;
    fmServType.Release;
  except
    fmServType.Release;
  end;
end;

procedure TfmEMMain.mmSupplierInfoClick(Sender: TObject);
begin
  Application.Createform(TfmSuppFind, fmSuppFind);
  try
    fmSuppFind.Showmodal;
    fmSuppFind.Release;
  except
    fmSuppFind.Release;
  end;
end;

procedure TfmEMMain.btnPartsInfoClick(Sender: TObject);
begin
  Application.Createform(TfmPartsFnd, fmPartsFnd);
  try
    fmPartsFnd.Showmodal;
    fmPartsFnd.Release;
  except
    fmPartsFnd.Release;
  end;
end;

procedure TfmEMMain.btnServInfoClick(Sender: TObject);
begin
  Application.Createform(TfmSrvNoFnd, fmSrvNoFnd);
  try
    fmSrvNoFnd.Showmodal;
    fmSrvNoFnd.Release;
  except
    fmSrvNoFnd.Release;
  end;
end;

procedure TfmEMMain.btnPartsIORecClick(Sender: TObject);
begin
  Application.Createform(TfmPtsIOInf, fmPtsIOInf);
  try
    fmPtsIOInf.Showmodal;
    fmPtsIOInf.Release;
  except
    fmPtsIOInf.Release;
  end;
end;

procedure TfmEMMain.mmEMControlClick(Sender: TObject);
begin
  Application.Createform(TfmControl, fmControl);
  try
    fmControl.Showmodal;
    fmControl.Release;
  except
    fmControl.Release;
  end;
end;

procedure TfmEMMain.mmPartsIORepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'PRTS_IO_REC', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
//  emReport(wUser, wPassword, wEMServer, wWPServer, 'PRTS_IO_REC', 0);
end;

procedure TfmEMMain.mmServRecRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'SERV_REC', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
//  emReport(wUser, wPassword, wEMServer, wWPServer, 'SERV_REC', 0);
end;

procedure TfmEMMain.mmEQPInfoRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'EQP_INFO', 2);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
//  emReport(wUser, wPassword, wEMServer, wWPServer, 'EQP_INFO', 0);
end;

procedure TfmEMMain.mmEQPPrtsInfoRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'EQP_PARTS', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
//  emReport(wUser, wPassword, wEMServer, wWPServer, 'EQP_PARTS', 0);
end;

procedure TfmEMMain.mmPartsInfoRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'PARTS_INFO', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
//  emReport(wUser, wPassword, wEMServer, wWPServer, 'PARTS_INFO', 0);
end;

procedure TfmEMMain.mmSuppInfoRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'SUPPLIER_INFO', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
//  emReport(wUser, wPassword, wEMServer, wWPServer, 'SUPPLIER_INFO', 0);
end;

procedure TfmEMMain.mmEQPTypeRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'EQP_TYPE', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
//  emReport(wUser, wPassword, wEMServer, wWPServer, 'EQP_TYPE', 0);
end;

procedure TfmEMMain.mmPartsTypeRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'PARTS_TYPE', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
//  emReport(wUser, wPassword, wEMServer, wWPServer, 'PARTS_TYPE', 0);
end;

procedure TfmEMMain.miServTypeRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'SERVICE_TYPE', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
//  emReport(wUser, wPassword, wEMServer, wWPServer, 'SERVICE_TYPE', 0);
end;

procedure TfmEMMain.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'btnEQPInfo';
  Funcs[3] := 'btnPartsInfo';
  Funcs[4] := 'btnServInfo';
  Funcs[5] := 'btnPartsIORec';
  Funcs[6] := 'mmEQP_Type';
  Funcs[7] := 'mmParts_Type';
  Funcs[8] := 'mmServ_Type';
  Funcs[9] := 'mmSupplierInfo';
  Funcs[10] := 'mmEMControl';
  Funcs[11] := 'mmPartsIORep';
  Funcs[12] := 'mmServRecRep';
  Funcs[13] := 'mmEQPInfoRep';
  Funcs[14] := 'mmEQPPrtsInfoRep';
  Funcs[15] := 'mmPartsInfoRep';
  Funcs[16] := 'mmSuppInfoRep';
  Funcs[17] := 'mmEQPTypeRep';
  Funcs[18] := 'mmPartsTypeRep';
  Funcs[19] := 'mmServTypeRep';
  Funcs[20] := 'mmEMCompany';

  //=====================
  TestProgram( Funcs );
end;

procedure TfmEMMain.mmEmCompanyClick(Sender: TObject);
begin
  Application.Createform(TfmEMComp, fmEMComp);
  try
    fmEMComp.Showmodal;
  finally
    fmEMComp.Release;
  end;
end;

procedure TfmEMMain.N3Click(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'EQP_INFO', 1);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmEMMain.N5Click(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'EQP_INFO', 3);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

end.
