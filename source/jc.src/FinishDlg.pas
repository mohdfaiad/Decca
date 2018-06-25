unit FinishDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TfmFinishDlg = class(TForm)
    dtpFinishDate: TDateTimePicker;
    btnOK: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFinishDlg: TfmFinishDlg;

implementation
uses JcMain, ProdStat;
{$R *.DFM}

procedure TfmFinishDlg.FormCreate(Sender: TObject);
begin
  Caption := wCompanyName + ' == ' + Caption;
  dtpFinishDate.Date := Date;
end;

procedure TfmFinishDlg.btnOKClick(Sender: TObject);
begin
  if MessageDlg('設置齊料?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with fmProdStat do
    begin
      quFwoProductionFINISH_DATE.ReadOnly := False;
      with quTest do
      begin
        if Active then
          Close;
        ParamByName('production_id').AsString :=
          quFwoProduction.ParamByName('Production_id').AsString;
        ParamByName('job_no_1').AsString :=
          quFwoProduction.ParamByName('job_no_1').AsString;
        ParamByName('Fwo_no').AsString :=
          quFwoProduction.ParamByName('Fwo_no').AsString;
        ParamByName('Production_cat').AsString := edProdCat.Text;

        Open;
        if not IsEmpty then
        begin
          while not eof do
          begin
            ShowMessage('此記錄加工未完工' + ' ' +
                      quTestJOB_COST_CAT.AsString + ' ' +
                      quTestSUBPRODUCTION_START_DATE.AsString + ' ' +
                      quTestSUBPRODUCTION_END_DATE.AsString );


            Next;
          end;
          quFwoProductionFINISH_DATE.ReadOnly := True;
          Abort;
        end;
      end;
      with quFwoProduction do
      begin
        dgrFwoProduction.Enabled := False;
        First;
        while not eof do
        begin
          Edit;
          FieldByName('Finish_date').AsDateTime := dtpFinishDate.Date;
          Post;
          Next;
        end;
        dgrFwoProduction.Enabled := True;
        //EnableConstraints;
      end;
      quFwoProductionFINISH_DATE.ReadOnly := True;
    end;
  end;
end;

end.
