unit RepJob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, prmain, Buttons, ExtCtrls, Gauges, Db,
  DBTables, Wwdatsrc, Wwquery;

type
  TfmAutocalc = class(TForm)
    pacancel: TPanel;
    pabottom: TPanel;
    btnRight: TSpeedButton;
    btnRightAll: TSpeedButton;
    btnLeft: TSpeedButton;
    btnLeftAll: TSpeedButton;
    lbgetEmpl: TListBox;
    lbchoseemp: TListBox;
    patitle: TPanel;
    laemnost: TLabel;
    laemnoed: TLabel;
    sbtotal: TStatusBar;
    btnCalculate: TSpeedButton;
    btnExit: TSpeedButton;
    paview: TPanel;
    lacname1: TLabel;
    laename1: TLabel;
    laCalDat: TLabel;
    dtpSetdate: TDateTimePicker;
    dedcname: TDBEdit;
    dedename: TDBEdit;
    guPayroll: TGauge;
    procedure btnRightClick(Sender: TObject);
    procedure btnRightAllClick(Sender: TObject);
    procedure btnLeftClick(Sender: TObject);
    procedure btnLeftAllClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure lbchoseempClick(Sender: TObject);
    procedure lbgetEmplClick(Sender: TObject);
    procedure btnCalculateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAutocalc: TfmAutocalc;

implementation

uses PRDataDM;

{$R *.DFM}

procedure TfmAutocalc.btnRightClick(Sender: TObject);
begin
  if lbchoseEmp.Items.Count >0  then
  begin
    guPayroll.Progress := 0 ;
    lbgetEmpl.Items.Add(lbchoseEmp.Items.Strings[lbchoseEmp.itemindex] );
    lbchoseEmp.Items.delete(lbchoseEmp.itemindex);
    btnLeft.Enabled := true;
    btnLeftAll.Enabled := true;
    btnCalculate.Enabled := true;
    sbtotal.Panels[1].Text := inttostr(lbchoseEmp.Items.Count) + '(人)';
    sbtotal.Panels[3].Text := inttostr(lbgetEmpl.Items.Count) + '(人)';
    if lbchoseEmp.Items.Count =0  then
    begin
      btnRight.Enabled := false;
      btnRightAll.Enabled := false;
    end;
  end  else
  begin
    btnRight.Enabled := false;
    btnRightAll.Enabled := false;
    btnLeft.Enabled := true;
    btnLeftAll.Enabled := true;
  end;
end;

procedure TfmAutocalc.btnRightAllClick(Sender: TObject);
begin
  if lbchoseEmp.Items.Count >0  then
  repeat
    guPayroll.Progress := 0 ;
    lbgetEmpl.Items.Add(lbchoseEmp.Items.Strings[lbchoseEmp.itemindex] );
    lbchoseEmp.Items.delete(lbchoseEmp.itemindex);
    btnLeft.Enabled := true;
    btnLeftAll.Enabled := true;
    btnCalculate.Enabled := true;
    sbtotal.Panels[1].Text := inttostr(lbchoseEmp.Items.Count) + '(人)';
    sbtotal.Panels[3].Text := inttostr(lbgetEmpl.Items.Count) + '(人)';
    if lbchoseEmp.Items.Count =0  then
    begin
      btnRight.Enabled := false;
      btnRightAll.Enabled := false;
    end;
  until
    lbchoseEmp.Items.Count =0
  else
  begin
    btnRight.Enabled := false;
    btnRightAll.Enabled := false;
    btnLeft.Enabled := true;
    btnLeftAll.Enabled := true;
  end;
end;

procedure TfmAutocalc.btnLeftClick(Sender: TObject);
begin
  if lbgetEmpl.Items.Count >0  then
  begin
    lbchoseEmp.Items.Add(lbgetEmpl.Items.Strings[lbgetEmpl.itemindex] );
    lbgetEmpl.Items.delete(lbgetEmpl.itemindex);
    if lbgetEmpl.Items.Count =0  then
    begin
      btnCalculate.Enabled := false;
      btnLeft.Enabled := false;
      btnLeftAll.Enabled := false;
      btnRight.Enabled := true;
      btnRightAll.Enabled := true;
    end
    else
    begin
      btnCalculate.Enabled := true;
      btnLeft.Enabled := true;
      btnLeftAll.Enabled := true;
      btnRight.Enabled := true;
      btnRightAll.Enabled := true;
    end;
  end
  else
  begin
    btnLeft.Enabled := false;
    btnLeftAll.Enabled := false;
    btnRight.Enabled := true;
    btnRightAll.Enabled := true;
  end;
    sbtotal.Panels[1].Text := inttostr(lbchoseEmp.Items.Count) + '(人)';
    sbtotal.Panels[3].Text := inttostr(lbgetEmpl.Items.Count) + '(人)';
end;

procedure TfmAutocalc.btnLeftAllClick(Sender: TObject);
begin
  if lbgetEmpl.Items.Count >0  then
  repeat
    lbchoseEmp.Items.Add(lbgetEmpl.Items.Strings[lbgetEmpl.itemindex] );
    lbgetEmpl.Items.delete(lbgetEmpl.itemindex);
    if lbgetEmpl.Items.Count =0  then
    begin
      btnCalculate.Enabled := false;
      btnLeft.Enabled := false;
      btnLeftAll.Enabled := false;
      btnRight.Enabled := true;
      btnRightAll.Enabled := true;
//      sbtotal.Panels[3].Text := inttostr(lbgetEmpl.Items.Count) + '(人)';
    end;
  until
    lbgetEmpl.Items.Count =0
  else
  begin
    btnLeft.Enabled := false;
    btnLeftAll.Enabled := false;
    btnRight.Enabled := true;
    btnRightAll.Enabled := true;
  end;
    sbtotal.Panels[1].Text := inttostr(lbchoseEmp.Items.Count) + '(人)';
    sbtotal.Panels[3].Text := inttostr(lbgetEmpl.Items.Count) + '(人)';
end;

procedure TfmAutocalc.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfmAutocalc.lbchoseempClick(Sender: TObject);
begin
  with dmPRData.quEmployee do
  begin
    if Active then
      Close;
    ParamByName('stnum').AsString := lbchoseEmp.Items.Strings[lbchoseEmp.itemindex];
    ParamByName('endnum').AsString:=lbchoseEmp.Items.Strings[lbchoseEmp.itemindex];
    Open;
  end;
end;

procedure TfmAutocalc.lbgetEmplClick(Sender: TObject);
begin
  with dmPRData.quEmployee do
  begin
    if Active then
      Close;
    ParamByName('stnum').AsString := lbgetEmpl.Items.Strings[lbgetEmpl.itemindex];
    ParamByName('endnum').AsString:=lbgetEmpl.Items.Strings[lbgetEmpl.itemindex];
    Open;
  end;
end;

procedure TfmAutocalc.btnCalculateClick(Sender: TObject);
var
  wJoin_Date : Tdate;
  wPension,
  wAutoCalculate,
  wProportion_Days_Flag,
  wProportion_By_Month,
  wEmployee_no : string;
  wPayAmt,
  wYearDays,
  wPayAmount,
  wActDays,
  wAmount,
  wProportion : Real;
  cYear,
  cMonth,
  cDay,
  wYear,
  wMonth,
  wDay     : word;
begin
  DecodeDate(now, cYear, cMonth, cDay);
  guPayroll.Visible := true;
  guPayroll.MaxValue := lbgetEmpl.Items.Count ;
  repeat
    guPayroll.Progress := guPayroll.Progress + 1 ;
    wAmount := 0 ;
    wPayAmt := 0 ;
    wEmployee_no :=trim(lbgetEmpl.Items.Strings[lbgetEmpl.ItemIndex]);
    with dmPRData do
    begin
      with  quDelPayDetail do
      begin
        ParamByName('Employee_no').Value:= wEmployee_no  ;
        ParamByName('Period').Value:=
          StrToDate(DateTimeToStr(dtpSetDate.Date));
        ExecSQL;
      end;

      with quEmployee do
      begin
        if Active then
         Close;
        ParamByName('stnum').Value := wEmployee_no;
        ParamByName('endnum').Value := wEmployee_no;
        Open;
        if  IsEmpty then
          Continue;
        wJoin_Date := quEmployeeJOIN_DATE.AsDateTime;
      end;

      with quEmpPayCode do
      begin
        if Active then
          Close;
        ParamByName('iemployee_no').AsString := wEmployee_no;
        Open;
        if IsEmpty then
        begin
          lbgetEmpl.Items.delete(lbgetEmpl.itemindex);
          Continue;
        end;
      end;

      with quPayroll do
      begin
        if Active then
          Close;
        ParamByName('iemployee_no').Value := wEmployee_no;
        ParamByName('iperiod').Value :=
          strtodate(datetostr(dtpSetDate.date));
        Open;
        if IsEmpty then
        begin
          Insert;
          quPayrollEMPLOYEE_NO.AsString := wEmployee_no;
          quPayrollPERIOD.AsDateTime :=
            dtpSetdate.Date;
        end else
          Edit;
        quPayrollPAID_FLG.AsString := 'N';
        quPayrollPAY_AMT.AsFloat := 0.0;
        quPayrollQTY.AsFloat := 0.0;
        post;
      end;

      with quPayDetail do
      begin
        if Active then
          Close;
        ParamByName('iEmployee_no').AsString :=wEmployee_no;
        ParamByName('iPeriod').AsDate := dtpSetDate.Date;
        Open;
      end;

      with quEmpPayCode do
      begin
        while not Eof do
        begin
          with quSel1Paycode do
          begin
            if Active then
              Close;
            ParamByName('Pay_Code').AsString := quEmpPayCodePAY_CODE.AsString;
            Open;
            if IsEmpty then
            begin
              ShowMessage('員工薪酬歷史檔案中薪酬代碼 "'+quEmpPayCodePAY_CODE.AsString + '"'#13'設置錯誤');
              quEmpPayCode.Next;
              Continue;
            end;
            wProportion_days_flag := 'N';
            wProportion_By_Month := 'N';
            wAutoCalculate := 'N';
            wPension := 'N';
            if not IsEmpty then
            begin
              wPension := quSel1PayCodePENSION_FLG.AsString;
              wAutoCalculate := quSel1PayCodeAUTO_CALC.AsString;
              wProportion_days_flag := quSel1PayCodePROPORTION_DAYS_FLAG.AsString;
              wProportion_By_Month := quSel1PayCodePROPORTION_BY_MONTH.AsString;
            end;
            if wAutoCalculate = 'N' then
            begin
              quEmpPayCode.Next;
              Continue;
            end;
          end;

          if (wProportion_days_flag = 'Y') or
             (wProportion_By_Month = 'Y') then
          begin
            DecodeDate(wJoin_Date, wYear, wMonth, wDay);
            DecodeDate(dtpSetdate.Date,cYear,cMonth,cDay);
            wProportion := quEmpPayCodeAMOUNT.AsFloat;
            if quEmpPayCodePAY_TYPE.AsString = 'P' then
            begin
              wAmount := quEmpPayCodeAMOUNT.AsFloat;
              with quEmployPayCode do
              begin
                if Active then
                  Close;
                ParamByName('emno').AsString := wEmployee_no;
                ParamByName('paycode').AsString :=
                  quEmpPayCodePROP_PAY_CODE.AsString;
                Open;
                if IsEmpty then
                  wProportion := 0;
              end;
              try
                if quEmployPayCodePAY_TYPE.AsString = 'F' then
                  wProportion := wAmount
                               * quEmployPayCodeAMOUNT.AsFloat
                               / 100;
              except
                showmessage('薪酬代碼:''' + quEmpPayCode.FieldValues['prop_pay_code']+'''設置錯誤,或未設置');
              end;
            end;

            wYearDays := 1;
            wActDays := 1;
            if (wProportion_days_flag = 'Y') then
            begin
              wYearDays := EncodeDate(wYear+1,01,01) - EncodeDate(wYear,01,01);
              wActDays := dtpSetdate.Date - wJoin_Date + 1;
            end
            else
            begin
              if (wYear = cYear) and
                 (wMonth = cMonth) then
              begin
                if (cMonth + 1 = 13) then
                  wYearDays := EncodeDate(cYear+1,cMonth,01)
                             - EncodeDate(cYear,cMonth,01)
                else
                  wYearDays := EncodeDate(cYear,cMonth+1,01)
                             - EncodeDate(cYear,cMonth,01);
                wActDays := dtpSetdate.Date - wJoin_Date;
              end
            end;
            wProportion := wProportion * wActDays /wYearDays ;
            if wPayAmount > trunc(wPayAmount) then
              wPayAmount := trunc(wPayAmount) + 1;
            with quPayDetail do
            begin
              Insert;
              quPayDetailEMPLOYEE_NO.AsString := wEmployee_no;
              quPayDetailPERIOD.AsDateTime := dtpSetDate.Date;
              quPayDetailPAY_CODE.AsString := quEmpPayCodePAY_CODE.AsString;
              quPayDetailAMOUNT.AsFloat := wProportion;
              if wPension = 'Y' then
                wPayAmt := wPayAmt + quPayDetailAMOUNT.AsFloat;
              try
                post;
              except
                showmessage('薪酬歷史記錄處理錯誤,'#13'程序中斷！');
                Abort;
              end;
            end;
            Next;
            Continue;
          end
          else
          begin
            if quEmpPayCodePAY_TYPE.AsString = 'F' then
            begin
              with quPayDetail do
              begin
                Insert;
                quPayDetailEMPLOYEE_NO.AsString := wEmployee_no;
                quPayDetailPERIOD.AsDateTime
                  := dtpSetDate.Date;
                quPayDetailPAY_CODE.AsString
                  := quEmpPayCodePAY_CODE.AsString;
                quPayDetailAMOUNT.AsFloat
                  := quEmpPayCodeAMOUNT.AsFloat;
                if wPension = 'Y' then
                  wPayAmt := wPayAmt + quPayDetailAMOUNT.AsFloat;
                try
                  post;
                except
                  showmessage('薪酬歷史記錄處理錯誤,'#13'程序中斷！');
                  Abort;
                end;
              end;
            end   else
            begin
              if quEmpPayCodePAY_TYPE.AsString = 'P' then
              with quSel1PayCode do
              begin
                wAmount := quEmpPayCodeAMOUNT.AsFloat;
                if Active then
                  Close;
                ParamByName('PayCode').AsString :=
                  quEmpPayCodePROP_PAY_CODE.AsString;
                Open;
                if not IsEmpty then
                begin
                  if quSel1PayCodeAUTO_CALC.AsString = 'Y' then
                  begin
                    with quPayDetail do
                    begin
                      Insert;
                      quPayDetailEMPLOYEE_NO.AsString := wEmployee_no;
                      quPayDetailPERIOD.AsDateTime :=
                        dtpSetDate.Date;
                      quPayDetailPAY_CODE.AsString :=
                         quEmpPayCodePAY_CODE.AsString;
                      with quEmployPayCode do
                      begin
                        if Active then
                          Close;
                        ParamByName('emno').AsString := wEmployee_no;
                        ParamByName('paycode').AsString :=
                          quEmpPayCodePROP_PAY_CODE.AsString;
                        Open;
                      end;
                      if quEmployPayCodePAY_TYPE.AsString = 'F' then
                        quPayDetailAMOUNT.AsFloat
                          := wAmount
                            * quEmployPayCodeAMOUNT.AsFloat
                            / 100
                      else
                      begin
                        showmessage('薪酬代碼:''' + quEmpPayCode.FieldValues['prop_pay_code']+'''設置錯誤,或未設置');
                        quPayDetailAMOUNT.AsFloat := 0 ;
                      end;
                      if wPension = 'Y' then
                        wPayAmt := wPayAmt
                                  + quPayDetailAMOUNT.AsFloat;
                      try
                        Post;
                      except
                        showmessage('員工薪酬歷史記錄處理錯誤，'#13'程序中斷');
                      end;
                    end;
                  end;
                end else
                  showmessage('員工工號 = '''+lbgetEmpl.Items.Strings[lbgetEmpl.ItemIndex]+''' 的薪酬代碼'#13'未錄入,或輸入方法錯誤!!');
              end;
            end;
          end;
          quEmpPayCode.Next;
        end;  // while not quEmpPayCode.Eof do
      end;    //with quEmpPayCode do

      if wPayAmt > 0.0 then
      begin
        with quEmployee do
        begin
          if quEmployeePENSION_FLG.AsString = 'Y' then
          begin
            with quPayDetail do
            begin
              Insert;
              quPayDetailEMPLOYEE_NO.AsString := wEmployee_no;
              quPayDetailPERIOD.AsDateTime := dtpSetDate.Date;
              quPayDetailPAY_CODE.AsString :=
                trim(quEmployeePLAN_CODE.AsString);
            end;
            with quPension do
            begin
              if Active then
                Close;
              ParamByName('Plan_Code').AsString :=
                trim(quEmployeePLAN_CODE.AsString);
              Open;
              if Not IsEmpty then
              begin
                wYear := 9999;
                wMonth := 0;
                wDay := 0;
                if (quPensionUSE_DATE.AsString = 'J') and
                   (not quEmployeeJOIN_DATE.IsNull) then
                  DecodeDate(quEmployeeJOIN_DATE.AsDateTime, wYear, wMonth, wDay);

                if (quPensionUSE_DATE.AsString = 'P') and
                   (not quEmployeePERM_DATE.IsNull) then
                  DecodeDate(quEmployeePERM_DATE.AsDateTime, wYear, wMonth, wDay);

                if (wYear < cYear) or
                   ((wYear = cYear) and (wMonth < cMonth)) or
                   ((wYear = cYear) and (wMonth = cMonth) and (wDay = 1)) then
                begin
                  if quPensionEMPL_CONT5.AsFloat > 0 then
                    quPayDetailAMOUNT.AsFloat
                      := (-1)
                         * wPayAmt
                         * quPensionEMPL_CONT5.AsFloat
                         / 100
                  else
                  if quPensionEMPL_CONT4.AsFloat > 0 then
                    quPayDetailAMOUNT.AsFloat
                      :=(-1)
                        * wPayAmt
                        * quPensionEMPL_CONT4.AsFloat
                        / 100
                  else
                  if quPensionEMPL_CONT3.AsFloat > 0 then
                    quPayDetailAMOUNT.AsFloat
                      := (-1)
                        * wPayAmt
                        * quPensionEMPL_CONT3.AsFloat
                        / 100
                  else
                  if quPensionEMPL_CONT2.AsFloat > 0 then
                    quPayDetailAMOUNT.AsFloat
                      := (-1)
                        * wPayAmt
                        * quPensionEMPL_CONT2.AsFloat
                        / 100
                  else
                  if quPensionEMPL_CONT1.AsFloat > 0 then
                    quPayDetailAMOUNT.AsFloat
                      :=(-1)
                        * wPayAmt
                        * quPensionEMPL_CONT1.AsFloat
                        / 100
                end;
                quPayDetail.post;
              end;//if RecordCount > 0 then
            end;//with quPension do
          end;//if quEmployeePENSION_FLG.AsString = 'Y' then
        end;//with quEmployee do
      end;//  if wPayAmt > 0.0 then
    end;//    with dmPRData do
    lbgetEmpl.Items.delete(lbgetEmpl.itemindex);
  until  lbgetEmpl.Items.Count = 0 ;
  ShowMessage('計算完畢!');
  guPayroll.Visible := false;
  btnLeft.Enabled := false;
  btnLeftAll.Enabled := false;
  btnCalculate.Enabled := false;
end;


procedure TfmAutocalc.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  with dmPRData do
  begin
    with quEmployee_no do
    begin
      if Active then
        Close;
      Open;
      dtpSetDate.Date := Date;
      if Not IsEmpty then
      begin
        First;
        repeat
          lbchoseemp.Items.Add(fieldvalues['employee_no']);
          Next;
        until eof;
        btnCalculate.Enabled := False;
        sbtotal.Panels[1].Text := inttostr(lbchoseEmp.Items.Count) + '(人)';
        sbtotal.Panels[3].Text := '0 (人)';
      end  else
      begin
        Application.MessageBox('員工檔案中無數据,請查閱!','錯誤信息',  MB_OK);
        Close;
      end;
    end;
  end;
end;

end.
