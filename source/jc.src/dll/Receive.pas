unit Receive;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, wwdblook, Buttons;

type
  TfmReceive = class(TForm)
    laApplyDate: TLabel;
    laContractNo: TLabel;
    bbPrint: TBitBtn;
    bbClose: TBitBtn;
    dlcCostCat: TwwDBLookupCombo;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReceive: TfmReceive;

implementation

{$R *.DFM}

end.
