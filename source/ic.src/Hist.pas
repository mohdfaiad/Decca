unit Hist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Menus, DBCtrls, Buttons, ExtCtrls, wwdblook,
  StdCtrls, ComCtrls, Db, DBTables, Wwquery, Wwdatsrc;

type
  TfmHist = class(TForm)
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
    wwDBGrid1: TwwDBGrid;
    Panel1: TPanel;
    bbSelect: TBitBtn;
    bbCancel: TBitBtn;
    edItemNo: TEdit;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edTrxDocNo: TEdit;
    cbHistType: TComboBox;
    Label4: TLabel;
    dlcWhsCode: TwwDBLookupCombo;
    Label5: TLabel;
    Label6: TLabel;
    dsHist: TwwDataSource;
    quHist: TwwQuery;
    quHistITEM_NO: TStringField;
    quHistWHS_CODE: TStringField;
    quHistHIST_DATE: TDateTimeField;
    quHistSITE_NO: TIntegerField;
    quHistHIST_TYPE: TStringField;
    quHistTRX_DOC_NO: TStringField;
    quHistLOT_NO: TStringField;
    quHistTO_WHS_CODE: TStringField;
    quHistCREATED_BY: TStringField;
    quHistCREATE_DATE: TDateTimeField;
    quHistJOB_NO_1: TStringField;
    quHistJOB_NO_2: TStringField;
    quHistJOB_COST_CAT: TStringField;
    quHistSUB_JOB_NO: TStringField;
    quHistFWO_NO: TStringField;
    quHistKIT_ITEM_NO: TStringField;
    quHistHIST_QTY: TFloatField;
    quHistHIST_COST: TFloatField;
    quHistHIST_PRICE: TFloatField;
    quHistItem_desc: TStringField;
    quHistJobNo: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure quHistCalcFields(DataSet: TDataSet);
    procedure bbSelectClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmHist: TfmHist;

implementation
uses Icdata;
{$R *.DFM}

procedure TfmHist.FormCreate(Sender: TObject);
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

procedure TfmHist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmICData do
  begin
    with quWareHouse do
      if Active then
        Close;
    with quHist do
      if Active then
        Close;
  end;
end;

procedure TfmHist.quHistCalcFields(DataSet: TDataSet);
begin
  with quHist do
  begin
    FieldByName('JobNo').AsString :=
      FieldByName('Job_No_1').AsString +
      FieldByName('Job_No_2').AsString +
      FieldByName('Sub_Job_No').AsString;
  end;
end;

procedure TfmHist.bbSelectClick(Sender: TObject);
begin
  with quHist do
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

procedure TfmHist.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TfmHist.sbExitClick(Sender: TObject);
begin
  Close;
end;

end.
