program clientsocket;

uses
  Vcl.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  UnitAdd in 'UnitAdd.pas' {FormAddress};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TFormAddress, FormAddress);
  Application.CreateForm(TFormAddress, FormAddress);
  Application.Run;
end.
