unit RepJcFWO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, wwdblook, Buttons, Printers, quickrpt;

type
  TfmRepJcFwo = class(TForm)
    laJobNoSt: TLabel;
    laJobNoEd: TLabel;
    laStartDate: TLabel;
    laEndDate: TLabel;
    rgFormat: TRadioGroup;
    dblcJobNoSt: TwwDBLookupCombo;
    dblcJobNoEd: TwwDBLookupCombo;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    bbPrint: TBitBtn;
    bbClose: TBitBtn;
    laSeleFwo: TLabel;
    dblcSeleFwo: TwwDBLookupCombo;
    procedure bbPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
   { Public declarations }
  end;

var
  fmRepJcFwo: TfmRepJcFwo;

implementation
  uses qrJobFwo, RepFWOdm;
{$R *.DFM}

procedure TfmRepJcFwo.bbPrintClick(Sender: TObject);
var SqlString : String;
begin
  with dmRepFwo do
  begin
    if Trim(dblcJobNoSt.Text) <> '' then
      SqlString := ' ((fwo.Job_No_1 >= '''+ quRepSelStJOB_NO_1.AsString
               + ''') and (fwo.Job_No_2 >= ''' + quRepSelStJOB_NO_2.AsString +'''))';
    if (Trim(SqlString) <> '') then
    begin
      if  (Trim(dblcJobNoEd.Text) <> '') then
        SqlString := SqlString + ' and   ((fwo.Job_No_1 <= '''+ quRepSelEdJOB_NO_1.AsString
               + ''') and (fwo.Job_No_2 <= ''' + quRepSelEdJOB_NO_2.AsString +'''))';;
    end else
    begin
      if  (Trim(dblcJobNoEd.Text) <> '') then
        SqlString := ' ((fwo.Job_No_1 <= '''+ quRepSelEdJOB_NO_1.AsString
           + ''') and (fwo.Job_No_2 <= ''' + quRepSelEdJOB_NO_2.AsString +'''))';;
    end;
    with quRepFwoPrint do
    begin
      if Active then
        Close;
      with sql do
      begin
        Clear;
        Add('select jf.job_no_1,jf.job_no_2,jf.Description job_Description,'
           +' fwo.fwo_no,fwo.Description FWO_Description,fwo.order_date,'
           +' fwo.COMPLETION_DATE,fwo.FWO_LENGTH ,fwo.FWO_WIDTH ,fwo.FWO_HEIGHT,'
           +' fwo.FWO_UNIT  from job_file jf ,job_fwo fwo '
           +' where ((fwo.job_no_1 = jf.job_no_1) and (fwo.job_no_2 = jf.job_no_2))'
           +' and ((fwo.order_date >=:iStartDate) and (fwo.order_date <=:iEndDate)) ');
        if (Trim(SqlString) <> '') then
          Add( ' And  (' + SqlString + ' )');
        if Trim(dblcSeleFwo.Text) <> '' then
          Add(' And ( fwo.Fwo_cat = ''' + Trim(dblcSeleFwo.Text) + ''')' );
        Add(' order by jf.job_no_1,jf.job_no_2,fwo.fwo_no ');
//        ShowMessage(Text);
//        Abort;
      end;
      ParamByName('iStartDate').AsDate := dtpStartDate.Date;
      ParamByName('iEndDate').AsDate := dtpEndDate.Date;
      Open;
    end;
  end;
  Application.CreateForm(TfmqrJobFwo,fmqrJobFwo);
  if rgFormat.ItemIndex = 0 then
  begin
    with fmqrJobFwo.qrdbtHeight.Frame do
    begin
      DrawTop := False;
      DrawRight := False;
    end;
    fmqrJobFwo.qrdbtHeight.Visible := False;
    fmqrJobFwo.qrlLength.Caption := '';
    fmqrJobFwo.qrdbtLength.DataField := '';
    with fmqrJobFwo.qrdbtWidth.Frame do
    begin
      DrawTop := False;
      DrawRight := False;
    end;
    fmqrJobFwo.qrdbtWidth.Visible := False;
    with fmqrJobFwo.qrdbtLength.Frame do
    begin
      DrawTop := False;
      DrawRight := False;
    end;
    fmqrJobFwo.qrdbtLength.Visible := False;
    fmqrJobFwo.qrJob.Page.Orientation :=  poPortrait;
    fmqrJobFwo.qrlFoot2.Frame.DrawTop := False;
    fmqrJobFwo.qrlUser.Left := 623;
    fmqrJobFwo.qrlPage.Left := 623;
    fmqrJobFwo.qrsPage.Left := 667;
    fmqrJobFwo.qrlUserName.Left :=  667;
  end else
  begin
    fmqrJobFwo.qrJob.Page.Orientation :=  poLandscape;
    fmqrJobFwo.qrlFoot2.Frame.DrawTop := True;
    fmqrJobFwo.qrlUser.Left := 823;
    fmqrJobFwo.qrlPage.Left := 823;
    fmqrJobFwo.qrsPage.Left := 867;
    fmqrJobFwo.qrlUserName.Left :=  867;
    with fmqrJobFwo.qrdbtHeight.Frame do
    begin
      DrawTop := True;
      DrawRight := True;
    end;
    fmqrJobFwo.qrdbtHeight.Visible := True;
    with fmqrJobFwo.qrdbtWidth.Frame do
    begin
      DrawTop := True;
      DrawRight := True;
    end;
    fmqrJobFwo.qrdbtWidth.Visible := True;
    with fmqrJobFwo.qrdbtLength.Frame do
    begin
      DrawTop := True;
      DrawRight := True;
    end;
    fmqrJobFwo.qrdbtLength.Visible := True;
    fmqrJobFwo.qrlLength.Caption := '長度';
    fmqrJobFwo.qrdbtLength.DataField := 'FWO_LENGTH';
  end;
  fmqrJobFwo.qrlcompany.Caption := wCompanyName;
  fmqrJobFwo.qrlUserName.Caption := wUserId;
  fmqrJobFwo.qrlSelectJobNo.Caption := '工程 :' + dblcJobNoSt.Text + ' -> ' + dblcJobNoEd.Text;
  fmqrJobFwo.qrlSelectDate.Caption := ' 日期 :' + DateToStr(dtpStartDate.Date ) +' -> '+ DateToStr(dtpEndDate.Date);
  if ((dblcSeleFwo.Text) <> '') then
    fmqrJobFwo.qrlSeleFwoType.Caption := '厂單類型 :' + dmRepFwo.quRepSelFwoFWO_CAT.AsString + ' ' + dmRepFwo.quRepSelFwoDESCRIPTION.AsString
  else
    fmqrJobFwo.qrlSeleFwoType.Caption := '厂單類型 : 未選擇';
  Try
    fmqrJobFwo.qrJob.Prepare;
    fmqrJobFwo.qrJob.Preview;
  finally
    dmRepFwo.quRepFwoPrint.Close;
    fmqrJobFwo.Release;
  end;
end;

procedure TfmRepJcFwo.FormShow(Sender: TObject);
begin
  Caption :=  wCompanyName+ '=='+Caption  ;
  with dmRepFwo do
  begin
    with quRepSelSt do
      if Not Active then
        Open;
    with quRepSelEd do     
      if Not Active then
        Open;
    with quRepSelFwo   do
      if Not Active then
        Open;
  end;
  dtpStartDate.Date := date -1;
  dtpEndDate.Date := Date;
end;

procedure TfmRepJcFwo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with dmRepFwo do
  begin
    with quRepSelSt do
      if Active then
        Close;
    with quRepSelEd do
      if Active then
        Close;
    with quRepSelFwo   do
      if Active then
        Close;
    if dbRepJcFwo.Connected  then
      dbRepJcFwo.Connected  := False;
  end;
end;

end.
