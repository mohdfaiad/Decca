unit JCcontro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, wwSpeedButton, wwDBNavigator, DBCtrls,
  StdCtrls, Mask, wwdbedit,db,JCdatadm, Wwdbspin, wwdbdatetimepicker,
  ComCtrls;

type
  TfmJCcontro = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    mmJCcontrol: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    paEdit: TPanel;
    printSetup: TPrinterSetupDialog;
    sbPS: TSpeedButton;
    dnaJCcontrol: TwwDBNavigator;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    gbUserTitle: TGroupBox;
    laUser_def_title01: TLabel;
    laUser_def_title02: TLabel;
    laUser_def_title06: TLabel;
    laUser_def_title07: TLabel;
    laUser_def_title03: TLabel;
    laUser_def_title08: TLabel;
    laUser_def_title09: TLabel;
    laUser_def_title05: TLabel;
    laUser_def_title04: TLabel;
    laUser_def_title10: TLabel;
    dedUse_def_title01: TwwDBEdit;
    dedUse_def_title02: TwwDBEdit;
    dedUse_def_title03: TwwDBEdit;
    dedUse_def_title04: TwwDBEdit;
    dedUse_def_title05: TwwDBEdit;
    dedUse_def_title06: TwwDBEdit;
    dedUse_def_title09: TwwDBEdit;
    dedUse_def_title10: TwwDBEdit;
    dedUse_def_title07: TwwDBEdit;
    dedUse_def_title08: TwwDBEdit;
    paCurr: TPanel;
    paLength: TPanel;
    gbDate: TGroupBox;
    laCurr_period: TLabel;
    laLst_period: TLabel;
    dtCurrPeriod: TwwDBDateTimePicker;
    dtLstPeriod: TwwDBDateTimePicker;
    paAccount: TPanel;
    gbCalcu: TGroupBox;
    dckUseRetainAP: TDBCheckBox;
    dckUseRetainAR: TDBCheckBox;
    dckUseBillACAByJob: TDBCheckBox;
    gbJob: TGroupBox;
    laJob_no_1_len: TLabel;
    sdJobNo1Len: TwwDBSpinEdit;
    gbJobNo2: TGroupBox;
    laJob_no_2_len: TLabel;
    dckUseJobNo2: TDBCheckBox;
    sdJobNo2Len: TwwDBSpinEdit;
    paFWO: TPanel;
    gbUser: TGroupBox;
    laUse_fields: TLabel;
    sdUseFields: TwwDBSpinEdit;
    gbSize: TGroupBox;
    laSub_job_no_len: TLabel;
    laFWO_no_len: TLabel;
    sdSubJobLen: TwwDBSpinEdit;
    sdFWONoLen: TwwDBSpinEdit;
    sbPrintscreen: TSpeedButton;
    gbNo: TGroupBox;
    laBill_profut_ctr_1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dedBill_profit_ctr_1: TwwDBEdit;
    dedBill_profit_ctr_2: TwwDBEdit;
    dedBILL_AC: TwwDBEdit;
    procedure mmExitClick(Sender: TObject);
    procedure mmPrintsetupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dckUseJobNo2Exit(Sender: TObject);
    procedure dtLstPeriodExit(Sender: TObject);
    procedure sdUseFieldsChange(Sender: TObject);
    procedure dedBILL_ACChange(Sender: TObject);
    procedure dedBill_profit_ctr_1Change(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJCcontro: TfmJCcontro;

implementation
  uses JCmain; 
{$R *.DFM}

procedure TfmJCcontro.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJCcontro.mmPrintsetupClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmJCcontro.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'dnaJCcontrol.nbPost';
  //=====================
//*  fmJCmain.TestProgram( Funcs );

end;

procedure TfmJCcontro.dckUseJobNo2Exit(Sender: TObject);
begin
  if not dckUseJobNo2.Checked then
  begin
    sdJobNo2Len.Enabled := False;
    sdJobNo2Len.Value := 0;
  end
  else
  begin
    sdJobNo2Len.Enabled := True;
  end;
end;

procedure TfmJCcontro.dtLstPeriodExit(Sender: TObject);
begin
  if dtLstPeriod.Date > dtCurrPeriod.Date then
  begin
    ShowMessage('上次結算日期錯誤');
    dtLstPeriod.SetFocus;
  end;
end;

procedure TfmJCcontro.sdUseFieldsChange(Sender: TObject);
begin
  case StrToInt(FloatToStr(sdUseFields.Value)) of
    1 : begin
          Height := 328;
          laUser_def_title02.Visible := False;
          dedUse_def_title02.Visible := False;
        end;
    2 : begin
          Height := 328;
          laUser_def_title02.Visible := True;
          dedUse_def_title02.Visible := True;
        end;
    3 : begin
          Height := 356;
          laUser_def_title02.Visible := True;
          dedUse_def_title02.Visible := True;
          laUser_def_title04.Visible := False;
          dedUse_def_title04.Visible := False;
        end;
    4 : begin
          Height := 356;
          laUser_def_title02.Visible := True;
          dedUse_def_title02.Visible := True;
          laUser_def_title04.Visible := True;
          dedUse_def_title04.Visible := True;
        end;
    5 : begin
          Height := 382;
          laUser_def_title06.Visible := False;
          dedUse_def_title06.Visible := False;
          laUser_def_title02.Visible := True;
          dedUse_def_title02.Visible := True;
          laUser_def_title04.Visible := True;
          dedUse_def_title04.Visible := True;
        end;
    6 : begin
          Height := 382;
          laUser_def_title02.Visible := True;
          dedUse_def_title02.Visible := True;
          laUser_def_title04.Visible := True;
          dedUse_def_title04.Visible := True;
          laUser_def_title06.Visible := True;
          dedUse_def_title06.Visible := True;
        end;
    7 : begin
          Height := 410;
          laUser_def_title02.Visible := True;
          dedUse_def_title02.Visible := True;
          laUser_def_title04.Visible := True;
          dedUse_def_title04.Visible := True;
          laUser_def_title06.Visible := True;
          dedUse_def_title06.Visible := True;
          laUser_def_title08.Visible := False;
          dedUse_def_title08.Visible := False;
        end;
    8 : begin
          Height := 410;
          laUser_def_title02.Visible := True;
          dedUse_def_title02.Visible := True;
          laUser_def_title04.Visible := True;
          dedUse_def_title04.Visible := True;
          laUser_def_title06.Visible := True;
          dedUse_def_title06.Visible := True;
          laUser_def_title08.Visible := True;
          dedUse_def_title08.Visible := True;
        end;
    9 : begin
          Height := 438;
          laUser_def_title02.Visible := True;
          dedUse_def_title02.Visible := True;
          laUser_def_title04.Visible := True;
          dedUse_def_title04.Visible := True;
          laUser_def_title06.Visible := True;
          dedUse_def_title06.Visible := True;
          laUser_def_title08.Visible := True;
          dedUse_def_title08.Visible := True;
          laUser_def_title10.Visible := False;
          dedUse_def_title10.Visible := False;
        end;
    10 : begin
          Height := 438;
          laUser_def_title02.Visible := True;
          dedUse_def_title02.Visible := True;
          laUser_def_title04.Visible := True;
          dedUse_def_title04.Visible := True;
          laUser_def_title06.Visible := True;
          dedUse_def_title06.Visible := True;
          laUser_def_title08.Visible := True;
          dedUse_def_title08.Visible := True;
          laUser_def_title10.Visible := True;
          dedUse_def_title10.Visible := True;
        end;
  else
    Height := 288;
  end;
end;

procedure TfmJCcontro.dedBILL_ACChange(Sender: TObject);
begin
  if Length(trim(dedBILL_AC.Text)) = 8 then
    dedBill_profit_ctr_1.SetFocus ;
end;

procedure TfmJCcontro.dedBill_profit_ctr_1Change(Sender: TObject);
begin
  if Length(Trim(dedBill_profit_ctr_1.Text)) = 4 then
    dedBill_profit_ctr_2.SetFocus;
end;

procedure TfmJCcontro.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('打印屏幕么?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmJCcontro.FormShow(Sender: TObject);
begin
  with dmJCdata do
  begin
    with quJCcontrol do
    begin
      if Active then
        Close;
      Open;
      First;
      if EOF then
      begin
        insert;
        quJCcontrolCONTROL_KEY.AsInteger := 1;
        quJCcontrolCURR_PERIOD.AsDateTime := now;
        quJCcontrolJOB_NO_1_LEN.AsInteger := 7;
        quJCcontrolUSE_JOB_NO_2.Value := 'N';
        quJCcontrolJOB_NO_2_LEN.AsInteger := 0;
        quJCcontrolSUB_JOB_NO_LEN.AsInteger := 3;
        quJCcontrolFWO_NO_LEN.AsInteger := 3;
        quJCcontrolLST_PERIOD.AsDateTime := now;
        quJCcontrolUSE_RETAIN_AP.Value := 'N';
        quJCcontrolUSE_RETAIN_AR.Value := 'N';
        Post;
      end;
    end;

    case  quJCcontrolUSE_FIELDS.AsInteger of
      1 : begin
            Height := 328;
            laUser_def_title02.Visible := False;
            dedUse_def_title02.Visible := False;
          end;
      2 : begin
            Height := 328;
            laUser_def_title02.Visible := True;
            dedUse_def_title02.Visible := True;
          end;
      3 : begin
            Height := 356;
            laUser_def_title04.Visible := False;
            dedUse_def_title04.Visible := False;
          end;
      4 : begin
            Height := 356;
            laUser_def_title04.Visible := True;
            dedUse_def_title04.Visible := True;
          end;
      5 : begin
            Height := 382;
            laUser_def_title06.Visible := False;
            dedUse_def_title06.Visible := False;
          end;
      6 : begin
            Height := 382;
            laUser_def_title06.Visible := True;
            dedUse_def_title06.Visible := True;
          end;
      7 : begin
            Height := 410;
            laUser_def_title08.Visible := False;
            dedUse_def_title08.Visible := False;
          end;
      8 : begin
            Height := 410;
            laUser_def_title08.Visible := True;
            dedUse_def_title08.Visible := True;
          end;
      9 : begin
            Height := 438;
            laUser_def_title10.Visible := False;
            dedUse_def_title10.Visible := False;
          end;
      10 : begin
            Height := 438;
            laUser_def_title10.Visible := True;
            dedUse_def_title10.Visible := True;
          end;
    else
      Height := 288;
    end;
  end;
end;

end.
