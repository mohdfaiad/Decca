unit JCSelJob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, Buttons, wwdblook, Wwdbdlg, Menus;

type
  TfmSelecJob = class(TForm)
    paSelect: TPanel;
    grJOBNO: TGroupBox;
    dgrJob_file: TwwDBGrid;
    dcbView: TwwDBComboBox;
    laJob_no_1: TLabel;
    laJobNo2: TLabel;
    Label1: TLabel;
    laSub_job_no: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    printSetup: TPrinterSetupDialog;
    edJobNo1: TEdit;
    edJobNo2: TEdit;
    edSubJobNo: TEdit;
    edFWO_No: TEdit;
    mmJobSele: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    procedure dgrJob_fileDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edJobNo1KeyPress(Sender: TObject; var Key: Char);
    procedure edJobNo2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edJobNo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelecJob: TfmSelecJob;

implementation
   uses JCdatadm,JobMastr,JCmain;
{$R *.DFM}

procedure TfmSelecJob.dgrJob_fileDblClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfmJobMastr,fmJobMastr);
    fmJobMastr.ShowModal;
  finally
    fmJobMastr.Release;
  end;
end;

procedure TfmSelecJob.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'btnOK';
  //=====================
//  TestProgram( Funcs );
  with dmJCdata do
  begin
    with quJCcontrol do
    if not Active then
      Open;

    edJobNo1.MaxLength
      := quJCcontrolJOB_NO_1_LEN.AsInteger ;
    edJobNo2.MaxLength
      := quJCcontrolJOB_NO_2_LEN.AsInteger;

    with qujob_fileview do
    Begin
      if Active then
        Close;
      ParamByName('iJobno1').AsString :='JOBNO1' ;
      ParamByName('iJobno2').AsString := 'N2';
      ParamByName('iSUBNO').AsString :='SUBN';
      ParamByName('iFWONO').AsString :='FWON';
      Open;
    end;
  end;
end;

procedure TfmSelecJob.sbExitClick(Sender: TObject);
begin
  with dmJCdata.quJob_file do
    if  Active then
      Close;
  Close;
end;

procedure TfmSelecJob.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmSelecJob.btnOKClick(Sender: TObject);
var
    jobno1,
    jobno2,
    subno,
    fwono : String;
    i :Integer;
begin
  with dmJCdata  do
  begin
    fwono := '';
    subno := '';
    jobno1 := '';
    jobno2 := '';
    if Trim(edJobNo1.Text) <> '' then
    begin
      for i := 1 to 6-Length(Trim(edJobNo1.Text)) do
        jobno1 := Trim(jobno1) + '%';
      jobno1 := trim(edJobNo1.Text) + jobno1;
    end;

    if Trim(edJobNo2.Text) <>'' then
    begin
      if (Length(Trim(edJobNo2.Text))<=1) then
        jobno2 :=trim(edJobNo2.Text) + '%'
      else
        jobno2 :=trim(edJobNo2.Text);
    end;

    if Trim(edSubJobNo.Text) <> '' then
    begin
      for i := 1 to 4 - Length(Trim(edSubJobNo.Text)) do
         subno := trim(subno) + '%';
      subno :=trim(edSubJobNo.Text) + subno;
    end;

    if Trim(edFWO_No.Text) <> '' then
    begin
      for i := 1 to 4 - Length(Trim(edFWO_No.Text)) do
         fwono := trim(fwono) + '%';
      fwono :=trim(edFWO_No.Text) + Trim(fwono);
    end;

    with qujob_fileview do
    Begin
      if Active then
        Close;
      ParamByName('iJobno1').AsString := jobno1;
      ParamByName('iJobno2').AsString := jobno2;
      ParamByName('iSUBNO').AsString := subno;
      ParamByName('iFWONO').AsString := fwono;
      Open;
    end;
  end;
end;

procedure TfmSelecJob.btnCancelClick(Sender: TObject);
begin
  with dmJCdata do
  begin
    with  quJob_FileView do
    begin
      if Active then
        Close;
      ParamByName('iJobno1').AsString := 'JOBNO1';
      ParamByName('iJobno2').AsString := 'N2';
      ParamByName('iSUBNO').AsString  := 'SUBN';
      ParamByName('iFWONO').AsString  := 'FWON';
      Open;
    end;
  end;
end;

procedure TfmSelecJob.edJobNo1KeyPress(Sender: TObject; var Key: Char);
begin
{  if ((Length(edJobNo1.Text)
    = dmJCdata.quJCcontrolJOB_NO_1_LEN.AsInteger)
     and edJobNo2.Visible = True) then
    edJobNo2.SetFocus;}
end;

procedure TfmSelecJob.edJobNo2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  ((key = VK_BACK) and (trim(edJobNo2.Text) ='')) then
    edJobNo1.SetFocus;
end;

procedure TfmSelecJob.edJobNo1Change(Sender: TObject);
begin
  if ((Length(edJobNo1.Text)
    = dmJCdata.quJCcontrolJOB_NO_1_LEN.AsInteger)
     and edJobNo2.Visible = True) then
    edJobNo2.SetFocus;
end;

end.
