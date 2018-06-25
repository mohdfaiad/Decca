unit rpProgress;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, Wwquery;

type
  TqrProgress = class(TQuickRep)
    quProgress: TwwQuery;
    quProgressFwoDesc: TStringField;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand3: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRBand5: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    quProgressJOB_NO_1: TStringField;
    quProgressJOB_NO_2: TStringField;
    quProgressFWO_NO: TStringField;
    quProgressJOB_COST_CAT_UNIT_1: TStringField;
    quProgressBUDGET_QTY_1: TBCDField;
    quProgressNOW_FWO_QTY_1: TBCDField;
    quProgressFIRST_DATE_1: TDateTimeField;
    quProgressCOMPLETE_PERCENT_1: TBCDField;
    quProgressCOMPLETE_DATE_1: TDateTimeField;
    quProgressFWO_QTY_1: TBCDField;
    quProgressJOB_COST_CAT_UNIT_2: TStringField;
    quProgressBUDGET_QTY_2: TBCDField;
    quProgressNOW_FWO_QTY_2: TBCDField;
    quProgressFIRST_DATE_2: TDateTimeField;
    quProgressCOMPLETE_PERCENT_2: TBCDField;
    quProgressCOMPLETE_DATE_2: TDateTimeField;
    quProgressFWO_QTY_2: TBCDField;
    quProgressJOB_COST_CAT_UNIT_3: TStringField;
    quProgressBUDGET_QTY_3: TBCDField;
    quProgressNOW_FWO_QTY_3: TBCDField;
    quProgressFIRST_DATE_3: TDateTimeField;
    quProgressCOMPLETE_PERCENT_3: TBCDField;
    quProgressCOMPLETE_DATE_3: TDateTimeField;
    quProgressFWO_QTY_3: TBCDField;
    quProgressJOB_COST_CAT_UNIT_4: TStringField;
    quProgressBUDGET_QTY_4: TBCDField;
    quProgressNOW_FWO_QTY_4: TBCDField;
    quProgressFIRST_DATE_4: TDateTimeField;
    quProgressCOMPLETE_PERCENT_4: TBCDField;
    quProgressCOMPLETE_DATE_4: TDateTimeField;
    quProgressFWO_QTY_4: TBCDField;
    qlCostCat1: TQRLabel;
    qlCostCat2: TQRLabel;
    qlCostCat3: TQRLabel;
    qlCostCat4: TQRLabel;
    qlCostCatDesc1: TQRLabel;
    qlCostCatDesc2: TQRLabel;
    qlCostCatDesc3: TQRLabel;
    qlCostCatDesc4: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRLabel40: TQRLabel;
    QRShape9: TQRShape;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape10: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    quProgressFwoQty: TBCDField;
    QRLabel43: TQRLabel;
    QRDBText6: TQRDBText;
    qreSumBudgetQty1: TQRExpr;
    qreSumEvlt1: TQRExpr;
    qreSumHour1: TQRExpr;
    qreSumFwoQty1: TQRExpr;
    QRDBText14: TQRDBText;
    qrdPercent1: TQRDBText;
    QRLabel1: TQRLabel;
    qreSumHour2: TQRExpr;
    qreSumBudgetQty2: TQRExpr;
    qrdPercent2: TQRDBText;
    qreSumEvlt2: TQRExpr;
    qreSumFwoQty2: TQRExpr;
    QRDBText16: TQRDBText;
    qreSumBudgetQty3: TQRExpr;
    qreSumHour3: TQRExpr;
    qrdPercent3: TQRDBText;
    qreSumEvlt3: TQRExpr;
    qreSumFwoQty3: TQRExpr;
    QRDBText23: TQRDBText;
    qreSumBudgetQty4: TQRExpr;
    qreSumHour4: TQRExpr;
    qrdPercent4: TQRDBText;
    qreSumEvlt4: TQRExpr;
    qreSumFwoQty4: TQRExpr;
    QRDBText30: TQRDBText;
    quProgressPreSumHour1: TCurrencyField;
    quProgressPreSumHour2: TCurrencyField;
    quProgressPreSumHour3: TCurrencyField;
    quProgressPreSumHour4: TCurrencyField;
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure qreSumHour1Print(sender: TObject; var Value: String);
    procedure qrdPercent1Print(sender: TObject; var Value: String);
    procedure qrdPercent2Print(sender: TObject; var Value: String);
    procedure qrdPercent3Print(sender: TObject; var Value: String);
    procedure qrdPercent4Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRDBText30Print(sender: TObject; var Value: String);
    procedure quProgressCalcFields(DataSet: TDataSet);
  private

  public

  end;

var
  qrProgress: TqrProgress;

implementation
uses PrgrsDlg, JcMain;

{$R *.DFM}

procedure TqrProgress.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value := wCompanyName;
end;

procedure TqrProgress.QRLabel12Print(sender: TObject; var Value: String);
begin
  Value := Value + ' ' + wUserID;
end;

procedure TqrProgress.QRLabel8Print(sender: TObject; var Value: String);
begin
  Value := Trim(fmPrgrsDlg.dbdJobNo1.Text) + '  (' +
           Trim(fmPrgrsDlg.lbJobDesc.Caption) + ')';
end;

procedure TqrProgress.QRExpr1Print(sender: TObject; var Value: String);
begin
  if Value = TQRExpr(Sender).Expression then
  begin
    Value := '';
    TQRExpr(Sender).Color := clWhite;
  end
  else
  begin
    if Pos('-', Value) > 0 then
      TQRExpr(Sender).Color := clYellow
    else
      TQRExpr(Sender).Color := clWhite;
  end;
end;

procedure TqrProgress.QRDBText8Print(sender: TObject; var Value: String);
begin
  Value := '(' + Trim(Value) + ')';
end;

procedure TqrProgress.QRDBText14Print(sender: TObject; var Value: String);
begin
  Value :=IntToStr(Round((StrToCurr(qreSumBudgetQty1.Caption) - StrToCurr(qreSumHour1.Caption))
                 / StrToCurr(qreSumBudgetQty1.Caption) *100));
end;

procedure TqrProgress.qreSumHour1Print(sender: TObject; var Value: String);
begin
  if Pos('SUM',Value) > 0  then
    Value := '0.00'
end;

procedure TqrProgress.qrdPercent1Print(sender: TObject; var Value: String);
begin
  Value := Format('%3.2f', [StrToCurr(qreSumEvlt1.Caption)/
                 StrToCurr(qreSumBudgetQty1.Caption) * 100]);
  if Value = '' then
    Value := '0.0%'
end;

procedure TqrProgress.qrdPercent2Print(sender: TObject; var Value: String);
begin
  Value := Format('%3.2f', [StrToCurr(qreSumEvlt2.Caption)/
                 StrToCurr(qreSumBudgetQty2.Caption) * 100]);
  if Value = '' then
    Value := '0.0%'
end;

procedure TqrProgress.qrdPercent3Print(sender: TObject; var Value: String);
begin
  Value := Format('%3.2f', [StrToCurr(qreSumEvlt3.Caption)/
                 StrToCurr(qreSumBudgetQty3.Caption) * 100]);
  if Value = '' then
    Value := '0.0%'
end;

procedure TqrProgress.qrdPercent4Print(sender: TObject; var Value: String);
begin
  Value := Format('%3.2f', [StrToCurr(qreSumEvlt4.Caption)/
                 StrToCurr(qreSumBudgetQty4.Caption) * 100]);
  if Value = '' then
    Value := '0.0%'
end;

procedure TqrProgress.QRDBText16Print(sender: TObject; var Value: String);
begin
   Value :=IntToStr(Round((StrToCurr(qreSumBudgetQty2.Caption) - StrToCurr(qreSumHour2.Caption))
                 / StrToCurr(qreSumBudgetQty2.Caption) *100));
end;

procedure TqrProgress.QRDBText23Print(sender: TObject; var Value: String);
begin
   Value :=IntToStr(Round((StrToCurr(qreSumBudgetQty3.Caption) - StrToCurr(qreSumHour3.Caption))
                 / StrToCurr(qreSumBudgetQty3.Caption) *100));
end;

procedure TqrProgress.QRDBText30Print(sender: TObject; var Value: String);
begin
  Value :=IntToStr(Round((StrToCurr(qreSumBudgetQty4.Caption) - StrToCurr(qreSumHour4.Caption))
                 / StrToCurr(qreSumBudgetQty4.Caption) *100));
end;

procedure TqrProgress.quProgressCalcFields(DataSet: TDataSet);
begin
  if quProgressCOMPLETE_PERCENT_1.AsCurrency <> 0 then
    quProgressPreSumHour1.AsCurrency := 100 * quProgressFWO_QTY_1.AsCurrency /
                                        quProgressCOMPLETE_PERCENT_1.AsCurrency;
  if quProgressCOMPLETE_PERCENT_2.AsCurrency <> 0 then
    quProgressPreSumHour2.AsCurrency := 100 * quProgressFWO_QTY_2.AsCurrency /
                                        quProgressCOMPLETE_PERCENT_2.AsCurrency;
  if quProgressCOMPLETE_PERCENT_3.AsCurrency <> 0 then
    quProgressPreSumHour3.AsCurrency := 100 * quProgressFWO_QTY_3.AsCurrency /
                                        quProgressCOMPLETE_PERCENT_3.AsCurrency;
  if quProgressCOMPLETE_PERCENT_4.AsCurrency <> 0 then
    quProgressPreSumHour4.AsCurrency := 100 * quProgressFWO_QTY_4.AsCurrency /
                                        quProgressCOMPLETE_PERCENT_4.AsCurrency;


end;

end.
