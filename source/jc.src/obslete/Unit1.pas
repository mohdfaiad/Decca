unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, Mask, wwdbedit, StdCtrls, ExtCtrls, DBCtrls;

type
  TfmSubDetal = class(TForm)
    gbDetail: TGroupBox;
    gbComment: TGroupBox;
    dmeComment: TDBMemo;
    paLineNo: TPanel;
    laLineNo: TLabel;
    laInvcNo: TLabel;
    laSubContractNo: TLabel;
    dedLineNo: TwwDBEdit;
    dedInvcNo: TwwDBEdit;
    dedSubContractNo: TwwDBEdit;
    paEdit: TPanel;
    gbCert: TGroupBox;
    laAccumCertAMT: TLabel;
    laCertificateDate: TLabel;
    laCertNo: TLabel;
    laVoucherNo: TLabel;
    laCertDate: TLabel;
    laApplyDate: TLabel;
    dedAccumCertAMT: TwwDBEdit;
    dtCertificateDate: TwwDBDateTimePicker;
    dedCertNo: TwwDBEdit;
    dedVoucherNo: TwwDBEdit;
    dtCertDate: TwwDBDateTimePicker;
    dtApplyDate: TwwDBDateTimePicker;
    paAMT: TPanel;
    gbAMT: TGroupBox;
    laAccumApplyAMT: TLabel;
    laDLPaidAMT: TLabel;
    dedAccumApplyAMT: TwwDBEdit;
    dedDLPaidAMT: TwwDBEdit;
    gbDate: TGroupBox;
    laDlLastPayDate: TLabel;
    dtDlLastPayDate: TwwDBDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSubDetal: TfmSubDetal;

implementation

{$R *.DFM}

end.
