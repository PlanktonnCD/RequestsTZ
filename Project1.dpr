program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FormAccessRequests},
  UnitLogin in 'UnitLogin.pas' {TFormLogin},
  UnitGlobals in 'UnitGlobals.pas',
  UnitServices in 'UnitServices.pas' {RequestForm},
  UnitDebug in 'UnitDebug.pas' {DebugForm},
  UnitAccess in 'UnitAccess.pas' {AccessForm},
  UnitAccessGive in 'UnitAccessGive.pas' {FormApprove},
  UnitOwnerCreate in 'UnitOwnerCreate.pas' {OwnerCreateForm},
  UnitMain in 'UnitMain.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormAccessRequests, FormAccessRequests);
  Application.CreateForm(TRequestForm, RequestForm);
  Application.CreateForm(TDebugForm, DebugForm);
  Application.CreateForm(TAccessForm, AccessForm);
  Application.CreateForm(TFormApprove, FormApprove);
  Application.CreateForm(TOwnerCreateForm, OwnerCreateForm);
  Application.Run;
end.

