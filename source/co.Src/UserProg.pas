unit UserProg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, checklst, Buttons, ExtCtrls,DB, DBTables;

type
  TfmUserProg = class(TForm)
    paHeader: TPanel;
    sbExit: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    sbPrint: TSpeedButton;
    clbFunc: TCheckListBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dedCompanyID: TDBEdit;
    dedProgramID: TDBEdit;
    dedUserID: TDBEdit;
    btnSelectAll: TButton;
    btnUnselectAll: TButton;
    btnDelete: TButton;
    bbConfirm: TBitBtn;
    bbCancel: TBitBtn;
    dedFuncApp: TDBEdit;
    quSelProgramID: TQuery;
    quSelProgramIDPROGRAM_ID: TStringField;
    quSelProgramIDMODULE_ID: TStringField;
    dsSelProgramID: TDataSource;
    Label5: TLabel;
    dedModuleID: TDBEdit;
    procedure sbExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure clbFuncClickCheck(Sender: TObject);
    procedure dnaUserProgClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnUnselectAllClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure bbConfirmClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmUserProg: TfmUserProg;

implementation
uses DeccaData ,selModule, SUserPrg, SelProg;

{$R *.DFM}
var
  wMaxIndex : integer;
  wFunc : String[99];
  wState : String[20];
  wIndex : array [1..99] of integer;

procedure TfmUserProg.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmUserProg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmDecca.quUserProg do
  begin
    if Active then
      Close;
    if Prepared then
      UnPrepare;
  end;
  Close;
end;

procedure TfmUserProg.clbFuncClickCheck(Sender: TObject);
begin
  wFunc := dedFuncApp.Text;
  if clbFunc.Checked[clbFunc.ItemIndex] = True then
  begin
    Delete(wFunc, wIndex[clbFunc.ItemIndex + 1] ,1);
    Insert('Y', wFunc, wIndex[clbFunc.ItemIndex + 1]);
  end
  else
  begin
    Delete(wFunc, wIndex[clbFunc.ItemIndex+1] ,1);
    Insert('N', wFunc, wIndex[clbFunc.ItemIndex+1]);
  end;
  if wState = 'nbEdit' then
    dmDecca.quUserProg.Edit;
  dedFuncApp.Text := wFunc;
  //dedFuncApp.SetFocus;
  //dmDecca.quUserProg.Post;
  //Showmessage(IntToStr(clbFunc.ItemIndex));
end;


procedure TfmUserProg.dnaUserProgClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  //if Button in [nbFirst,nbLast,nbDelete,nbPrior,nbNext] then
   // dmDecca.quUserProg.Edit;
  if Button = nbInsert then
  begin
    wState := 'nbInsert';
    clbFunc.Items.Clear;
  end
  else
    wState := 'nbEdit';
  if Button in [nbPost,nbInsert] then
    Exit;
  FormShow(Self);
end;

procedure TfmUserProg.FormCreate(Sender: TObject);
begin
  with dmDecca.quUserProg  do
  begin
    if not Prepared then
      Prepare;
  end;
end;

procedure TfmUserProg.btnSelectAllClick(Sender: TObject);
var
  j : Integer;
  wFunc : String[99];
begin
  wFunc := '';
  with clbFunc do
  begin
    for j := 0 to wMaxIndex - 1 do
    begin
      Checked[j] := True;
      wFunc := wFunc + 'Y';
    end;
  end;
  dedFuncApp.Text := wFunc;
end;

procedure TfmUserProg.btnUnselectAllClick(Sender: TObject);
var
  j : Integer;
  wFunc : String[99];
begin
  wFunc := '';
  with clbFunc do
  begin
    for j := 0 to wMaxIndex - 1 do
    begin
      Checked[j] := False;
      wFunc := wFunc + 'N';
    end;
  end;
  dedFuncApp.Text := wFunc;
end;

procedure TfmUserProg.btnDeleteClick(Sender: TObject);
begin
  dmDecca.quUserProg.Delete;
  close;
end;

procedure TfmUserProg.bbConfirmClick(Sender: TObject);
begin
  dmDecca.quUserProg.Post;
end;

procedure TfmUserProg.bbCancelClick(Sender: TObject);
begin
  dmDecca.quUserProg.Cancel;
end;

procedure TfmUserProg.FormShow(Sender: TObject);
var
  wFunc : String[99];
  i : Integer;
begin
  with dmDecca do
    with quUserProg do
    begin
      if Active then
        Close;
      ParamByName('Company_ID').asstring := fmUserMod.edCompanyID.Text;
      ParamByName('User_ID').asstring := fmUserMod.dlcUserID.Text;
      ParamByName('Module_ID').AsString :=
        fmSelProg.quProg_DescMODULE_ID.AsString;
      ParamByName('Program_ID').asstring :=
        fmSelProg.quProg_DescProgram_ID.AsString;
      Open;
      if RecordCount = 1 then
      begin
        First;
        if State <> dsEdit then
          Edit;
      //wFunc := dmDecca.quUserProg.FieldByName('Func_Approved').AsString;
      end
      else
      begin
        Filter := '';
        Filtered := False;
        Insert;
        wFunc := '';
        quUserProgCOMPANY_ID.AsString := fmUserMod.edCompanyID.Text;
        quUserProgMODULE_ID.AsString :=
          fmSelProg.quProg_DescMODULE_ID.AsString;
        quUserProgPROGRAM_ID.AsString :=
          fmSelProg.quProg_DescPROGRAM_ID.AsString;
        quUserProgUSER_ID.AsString := fmUserMod.dlcUserID.Text;
        quUserProgFUNC_APPROVED.AsString := 'N';
      end;
    end;
 // wFunc := '';
  clbFunc.Items.Clear;
  wFunc := dmDecca.quUserProg.FieldByName('Func_Approved').AsString;
  //showmessage(dmDecca.quUserProg.FieldByName('Func_Approved').AsString);
  with dmDecca.quPwdDef do
  begin
    if Active then
      Close;
    ParamByName('Program_ID').asstring :=
      dmDecca.quUserProgPROGRAM_ID.AsString;
    Open;
    First;
    i := 0;
    while not eof do
    begin
      i := i+1;
      with fmUserProg.clbFunc do
      begin
         //Showmessage(FieldByName('Description').AsString);
        Items.Add(FieldByName('Description').AsString);
        wIndex[i] := FieldByName('Function_No').asinteger;
        if Length(wFunc) >= i then
        begin
          if wFunc[wIndex[i]] = 'Y' then
            Checked[i - 1] := True
          else
            Checked[i - 1] := False;
        end
        else
          wFunc := wFunc + 'N';
      end;
      Next;
    end;
    wMaxIndex := i;
  end;
  fmUserProg.dedFuncApp.Text := wFunc;
 // showmessage(quUserProg.FieldByName('Program_ID').AsString);
end;

end.
