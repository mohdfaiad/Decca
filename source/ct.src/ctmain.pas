unit ctmain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Menus, CTCostDM, Grids, DBGrids, DBCtrls, Db,
  DBTables, StdCtrls, Wwdbigrd, Wwdbgrid, Wwquery, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb;

type
  TfmCTMain = class(TForm)
    mmctmain: TMainMenu;
    ps_PrintSetup: TPrinterSetupDialog;
    N1: TMenuItem;
    mmPrintSetup: TMenuItem;
    mmFileClose: TMenuItem;
    N4: TMenuItem;
    Panel1: TPanel;
    sbClose: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    naJob: TDBNavigator;
    quJobFWO: TQuery;
    mmJobNoImp: TMenuItem;
    quSubjobNo: TQuery;
    mmCatSetup: TMenuItem;
    N6: TMenuItem;
    mmDataImp: TMenuItem;
    mmCostRep: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Label1: TLabel;
    edJobNo: TEdit;
    N5: TMenuItem;
    N2: TMenuItem;
    mmQSDataImp: TMenuItem;
    Label2: TLabel;
    edKeyWord: TEdit;
    dgrJob: TwwDBGrid;
    spFind: TSpeedButton;
    u1: TMenuItem;
    mmClrCost: TMenuItem;
    N3: TMenuItem;
    mmHelp: TMenuItem;
    spHelp: TSpeedButton;
    N7: TMenuItem;
    mmAbout: TMenuItem;
    N8: TMenuItem;
    mmIEImport: TMenuItem;
    mmIEExport: TMenuItem;
    wwDBGrid1: TwwDBGrid;
    quIECTJobNo: TwwQuery;
    quIECTJobNoJOB_NO: TStringField;
    mmCostCatSum: TMenuItem;
    mmPatCCRep: TMenuItem;
    N11: TMenuItem;
    quJobFWOJOB_NO_1: TStringField;
    quJobFWOJOB_NO_2: TStringField;
    quJobFWOFWO_NO: TStringField;
    quJobFWOSUB_JOB_NO: TStringField;
    quJobFWODESCRIPTION: TStringField;
    quJob: TQuery;
    quJobJOB_NO_1: TStringField;
    quJobJOB_NO_2: TStringField;
    quJobDESCRIPTION: TStringField;
    quSubjobNoJOB_NO_1: TStringField;
    quSubjobNoDESCRIPTION: TStringField;
    quSubjobNoFWO_NO: TStringField;
    N12: TMenuItem;
    mmSeleJob: TMenuItem;
    mmSelTptal: TMenuItem;
    mmItemSumryCat: TMenuItem;
    dbcbStatus: TwwDBComboBox;
    //
    procedure TestFunc(FuncName:String;S:String);
    procedure TestProgram(Funcs : array of String);
    //
    procedure mmFileCloseClick(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure sbPrintSetupClick(Sender: TObject);
    procedure mmPrintSetupClick(Sender: TObject);
    procedure mmJobNoImpClick(Sender: TObject);
    procedure mmCatSetupClick(Sender: TObject);
    procedure mmDataImpClick(Sender: TObject);
    procedure mmCostRepClick(Sender: TObject);
    procedure mmQSDataImpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dgrJobColExit(Sender: TObject);
    procedure dgrJobDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spFindClick(Sender: TObject);
    procedure edJobNoDblClick(Sender: TObject);
    procedure edKeyWordDblClick(Sender: TObject);
    procedure mmClrCostClick(Sender: TObject);
    procedure mmHelpClick(Sender: TObject);
    procedure mmAboutClick(Sender: TObject);
    procedure mmIEImportClick(Sender: TObject);
    procedure mmIEExportClick(Sender: TObject);
    procedure mmCostCatSumClick(Sender: TObject);
    procedure mmPatCCRepClick(Sender: TObject);
    procedure mmSeleJobClick(Sender: TObject);
    procedure mmSelTptalClick(Sender: TObject);
    procedure mmItemSumryCatClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCTMain: TfmCTMain;
  Funcs : Array [1..99] of String;
  wActiveSecurity,
  wCompanyName,
  wStr,
  wUser,
  wPassword,
  wServer,
  wCompanyID : string;

implementation

uses  category, import, subjob,
   JobNoImp,  QSimport, repselct, ClrCost, About, IEImport, IEexport,
  SumRpSlt, CCRepDlg,SeleJob,SelTotal,ItemSmry;

{$R *.DFM}

procedure TfmCTMain.TestProgram(Funcs : array of String);
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
    with dmCost.quSelFuncApproved do
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
    with dmCost.dbCommon do
      if Connected then
        Connected := False;
  end;
end;

procedure TfmCTMain.TestFunc(FuncName:String;S:String);
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
              // TDBGrid
              if Components[i].ClassName = 'TDBGrid' then
              begin
                if S = 'N' then
                begin
                  if wString = 'OnDblClick' then
                    TDbGrid(Components[i]).OnDblClick := nil;
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
              if Components[i].ClassName = 'TCheckBox' then
              begin
                if S = 'N' then
                begin
                  if wString = 'Enabled' then
                    TDBEdit(Components[i]).Enabled := False;
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
              if Components[i].ClassName = 'TGroupBox' then
              begin
                if S = 'N' then
                begin
                  if wString = 'Enabled' then
                    TDBEdit(Components[i]).Enabled := False;
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


procedure TfmCTMain.mmFileCloseClick(Sender: TObject);
begin
  close;
  release;
end;

procedure TfmCTMain.sbCloseClick(Sender: TObject);
begin
  close;
  release;
end;

procedure TfmCTMain.sbPrintSetupClick(Sender: TObject);
begin
  ps_PrintSetup.Execute;
end;

procedure TfmCTMain.mmPrintSetupClick(Sender: TObject);
begin
  ps_PrintSetup.Execute;
end;

procedure TfmCTMain.mmJobNoImpClick(Sender: TObject);
begin
  Application.CreateForm(TfmJobImp, fmJobImp);
  try
    fmJobImp.showmodal;
  finally
    fmJobImp.Release;
  end;
end;


procedure TfmCTMain.mmCatSetupClick(Sender: TObject);
begin
  Application.CreateForm(TfmCateg, fmCateg);
  try
    fmCateg.Showmodal;
  finally
    fmCateg.Release;
  end;
end;

procedure TfmCTMain.mmDataImpClick(Sender: TObject);
begin
  Application.CreateForm(TfmImport, fmImport);
  try
    fmImport.showmodal;
  finally
    fmImport.release;
  end;
end;

procedure TfmCTMain.mmCostRepClick(Sender: TObject);
begin
  Application.CreateForm(TfmRepSel, fmRepSel);
  try
    fmRepSel.showmodal;
  finally
    fmRepSel.release;
  end;
end;

procedure TfmCTMain.mmQSDataImpClick(Sender: TObject);
begin
  Application.CreateForm(TfmQSimpt, fmQSimpt);
  try
    fmQSImpt.showmodal;
  finally
    fmQSImpt.release;
  end;
end;

procedure TfmCTMain.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'mmCatSetup';
  Funcs[3] := 'mmCostRep';
  Funcs[4] := 'mmCostCatSum';
  Funcs[5] := 'mmJobNoImp';
  Funcs[6] := 'mmDataImp';
  Funcs[7] := 'mmQSDataImp';
  Funcs[8] := 'naJob.nbInsert';
  Funcs[9] := 'naJob.nbDelete';
  Funcs[10] := 'dgrJob.OnDblClick';
  Funcs[11] := 'mmClrCost';
  Funcs[12] := 'mmIEImport';
  Funcs[13] := 'mmIEExport';
  Funcs[14] := 'mmPatCCRep';
  Funcs[15] := 'mmItemSumryCat';
  Funcs[16] := 'mmSeleJob';
  Funcs[17] := 'mmSelTptal';
  //=====================
  TestProgram( Funcs );
end;

procedure TfmCTMain.dgrJobColExit(Sender: TObject);
begin
  if (dmCost.quJob.State = dsEdit) or
     (dmCost.quJob.State = dsInsert) then
  begin
    with dgrJob.SelectedField do
    begin
      if (FieldName = 'JOB_NO') or
         (FieldName = 'QUOT_NO') then
       Text := UpperCase(Text);
    end;
  end;
end;

procedure TfmCTMain.dgrJobDblClick(Sender: TObject);
begin
  if dmCost.quJob.Active = True  then
  with dmCost.quJob do
  begin
    if not Prepared then
        Prepare;
    if Recordcount >= 1 then
    begin
      Application.CreateForm(TfmSubjob, fmSubjob);
      try
        fmSubjob.showmodal;
      finally
        fmSubjob.release;
      end;
    end;
  end
  else
  begin
    showmessage('請先選擇工程');
    Abort;
  end;
end;

procedure TfmCTMain.FormShow(Sender: TObject);
begin
  with dmCost.quJob do
  begin
    if not Active then
      Open;
  end;
end;

procedure TfmCTMain.spFindClick(Sender: TObject);
begin
  edJobNo.Text := trim(edJobNo.Text);
  edKeyWord.Text := trim(edKeyWord.Text);
  if ((length(trim(edJobNo.Text)) = 0) and
     (length(trim(edKeyWord.Text)) = 0)) then
  begin
    ShowMessage('請先輸入工程號或關鍵詞');
      abort;
  end;
  if (length(trim(edJobNo.Text)) > 0) then
  begin
    with dmCost.quJob do
    begin
      if Active then
         Close;
      SQL.Clear;
      SQL.Add('Select * from job');
      SQL.Add('  where Job_no like ');
      SQL.Add('"' + trim(edJobNo.Text) + '%' + '"');
      SQL.Add('  order by Job_No');
      Open;
      if RecordCount <= 0  then
        showmessage('無此工程號')
    end;
  end
  else
  begin
    with dmCost.quJob do
    begin
      if active then
         close;
      SQL.Clear;
      SQL.Add('Select * from job');
      SQL.Add('  where Keyword like ');
      SQL.Add('"' + '%' + trim(edKeyWord.Text) + '%' + '"');
      SQL.Add('  order by Job_No');
      Open;
      if RecordCount <= 0  then
        showmessage('無此工程號');
    end;
  end;
end;

procedure TfmCTMain.edJobNoDblClick(Sender: TObject);
begin
  edJobNo.Clear;
  edKeyWord.Clear;
end;

procedure TfmCTMain.edKeyWordDblClick(Sender: TObject);
begin
  edJobNo.Clear;
  edKeyWord.Clear;
end;

procedure TfmCTMain.mmClrCostClick(Sender: TObject);
begin
  Application.CreateForm(TfmClrCost, fmClrCost);
  try
    fmClrCost.showmodal;
  finally
    fmClrCost.release;
  end;
end;

procedure TfmCTMain.mmHelpClick(Sender: TObject);
begin
  Application.HelpFile := '\\SOFTWARE\DECCADB\CT.SRC\CTHLP.HLP';
//  Application.HelpJump('TApplication_HelpJump');
  Application.HelpContext(3);
//  Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TfmCTMain.mmAboutClick(Sender: TObject);
begin
  Application.CreateForm(TfmAbout, fmAbout);
  try
    fmAbout.showmodal;
  finally
    fmAbout.Release;
  end;
end;

procedure TfmCTMain.mmIEImportClick(Sender: TObject);
begin
  with dmCost.dbIECTData do
  begin
    if not Connected then
    begin
      try
        Connected := true;
      except
        ShowMessage('輸入輸出數据庫不能打開!');
        Abort;
      end;
    end;
  end;
  with quIECTJobNo do
  begin
    if not Active then Open;
    if RecordCount = 0 then
    begin
      showmessage('輸入輸出數据庫中無資料!');
      Abort;
    end;
  end;
  Application.CreateForm(TfmIEImport, fmIEImport);
  try
    fmIEImport.showmodal;
  finally
    fmIEImport.release;
  end;
end;

procedure TfmCTMain.mmIEExportClick(Sender: TObject);
begin
  with dmCost.dbIECTData do
  begin
    if not Connected then
    begin
      try
        Connected := true;
      except
        ShowMessage('輸入輸出數据庫不能打開!');
        Abort;
      end;
    end;
  end;
  Application.CreateForm(TfmIEExport, fmIEExport);
  try
    fmIEExport.showmodal;
  finally
    fmIEExport.release;
  end;
end;

procedure TfmCTMain.mmCostCatSumClick(Sender: TObject);
begin
  Application.CreateForm(TfmSumRpSlt, fmSumRpSlt);
  try
    fmSumRpSlt.showmodal;
  finally
    fmSumRpSlt.release;
  end;
end;

procedure TfmCTMain.mmPatCCRepClick(Sender: TObject);
begin
  Application.CreateForm(TfmCCRepDlg, fmCCRepDlg);
  try
    fmCCRepDlg.showmodal;
  finally
    fmCCRepDlg.release;
  end;
end;

procedure TfmCTMain.mmSeleJobClick(Sender: TObject);
begin
  Application.CreateForm(TfmSeleJob,fmSeleJob);
  Try
    fmSeleJob.ShowModal;
  finally
    fmSeleJob.Release;
  end;
end;

procedure TfmCTMain.mmSelTptalClick(Sender: TObject);
begin
  Application.CreateForm(TfmSelTotal,fmSelTotal);
  Try
    fmSelTotal.ShowModal;
  finally
    fmSelTotal.Release;
  end;    
end;

procedure TfmCTMain.mmItemSumryCatClick(Sender: TObject);
begin
  Application.CreateForm(TfmItemSmry,fmItemSmry);
  Try
    fmItemSmry.ShowModal;
  finally
    fmItemSmry.Release;
  end;
end;

end.
