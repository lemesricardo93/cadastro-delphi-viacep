program Cadastro;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uModule in 'uModule.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
