unit Complete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, wwdblook, Buttons;

type
  TfmComplete = class(TForm)
    bbPrint: TBitBtn;
    bbClose: TBitBtn;
    laApplyDate: TLabel;
    laContractNo: TLabel;
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
  fmComplete: TfmComplete;

implementation

{$R *.DFM}

end.
