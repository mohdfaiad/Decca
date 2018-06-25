program TestUserFunc;

uses
  Forms,
  TestUser in 'TestUser.pas' {fmTestUser};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmTestUser, fmTestUser);
  Application.Run;
end.
