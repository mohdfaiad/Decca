unit EditHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Menus, DBCtrls, Buttons, ExtCtrls, StdCtrls,
  DBTables, Db, Wwquery, Wwdatsrc, wwdblook, ComCtrls;

type
  TfmEditHist = class(TForm)
    paDept: TPanel;
    sbExit: TSpeedButton;
    sbPrint: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    SpeedButton1: TSpeedButton;
    dnaDept: TDBNavigator;
    ps_PrintSetup: TPrinterSetupDialog;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    bbSelect: TBitBtn;
    bbCancel: TBitBtn;
    edItemNo: TEdit;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    edTrxDocNo: TEdit;
    cbHistType: TComboBox;
    dlcWhsCode: TwwDBLookupCombo;
    dsEditHist: TwwDataSource;
    quEditHist: TwwQuery;
    quEditHistTRX_DOC_NO: TStringField;
    quEditHistITEM_NO: TStringField;
    quEditHistItem_desc: TStringField;
    quEditHistHIST_COST: TFloatField;
    quEditHistHIST_QTY: TFloatField;
    quEditHistHIST_TYPE: TStringField;
    quEditHistWHS_CODE: TStringField;
    quEditHistHIST_DATE: TDateTimeField;
    quEditHistLOT_NO: TStringField;
    quEditHistJOB_COST_CAT: TStringField;
    quEditHistTO_WHS_CODE: TStringField;
    quEditHistJobNo: TStringField;
    quEditHistFWO_NO: TStringField;
    quEditHistKIT_ITEM_NO: TStringField;
    quEditHistSITE_NO: TIntegerField;
    quEditHistJOB_NO_1: TStringField;
    quEditHistJOB_NO_2: TStringField;
    quEditHistSUB_JOB_NO: TStringField;
    quEditHistCREATED_BY: TStringField;
    quEditHistCREATE_DATE: TDateTimeField;
    quEditHistHIST_PRICE: TFloatField;
    usEditHist: TUpdateSQL;
    GroupBox1: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    quEditHistHIST_SEQ: TDateTimeField;
    quEditHistKIT_HIST_SEQ: TDateTimeField;
    quEditHistCOMMENT: TStringField;
    quEditHistLST_MS_DATE: TDateTimeField;
    quEditHistLST_UPD_DATE: TDateTimeField;
    procedure sbExitClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure bbSelectClick(Sender: TObject);
    procedure quEditHistCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditHist: TfmEditHist;

implementation

uses EditHistDtl, ICData;

{$R *.DFM}

procedure TfmEditHist.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEditHist.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TfmEditHist.wwDBGrid1DblClick(Sender: TObject);
begin
  Application.CreateForm(TfmEditHistDtl, fmEditHistDtl);
  try
    fmEditHistDtl.ShowModal;
  finally
    fmEditHistDtl.Release;
  end;
end;

procedure TfmEditHist.bbSelectClick(Sender: TObject);
begin
  with quEditHist do
  begin
    if Active then
      Close;
    with sql do
    begin
      Clear;
      Add('Select * from Item_history');
      Add('where hist_date >= :StartDate and hist_Date < :EndDate');
      if Trim(edItemNo.Text) <> '' then
        Add('and item_No = "' + edItemNo.Text + '"');
      if Trim(dlcWhsCode.Text) <> '' then
        Add('and whs_code = "' + dlcWhsCode.Text + '"');
      if Trim(edTrxDocNo.Text) <> '' then
        Add('and Trx_Doc_no = "' + edTrxDocNo.Text + '"');
      if Trim(cbHistType.Text) <> '' then
        Add('and Hist_Type = "' + Copy(cbHistType.Text, 1, 1) + '"');
      Add('order by Hist_Date, Trx_Doc_no, Item_no');
    end;
    ParamByName('startDate').AsDate := dtpStartDate.Date;
    ParamByName('EndDate').AsDate := dtpEndDate.Date;
    Open;
  end;
end;

procedure TfmEditHist.quEditHistCalcFields(DataSet: TDataSet);
begin
   with quEditHist do
  begin
    FieldByName('JobNo').AsString :=
      FieldByName('Job_No_1').AsString +
      FieldByName('Job_No_2').AsString +
      FieldByName('Sub_Job_No').AsString;
  end;
end;

procedure TfmEditHist.FormCreate(Sender: TObject);
begin
  with dmICData do
  begin
    with quWareHouse do
      if not Active then
        Open;
  end;
  dtpStartDate.Date := Date;
  dtpEndDate.Date := Date;
end;

procedure TfmEditHist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmICData do
  begin
    with quWareHouse do
      if Active then
        Close;
    with quEditHist do
      if Active then
        Close;
  end;
end;

end.
