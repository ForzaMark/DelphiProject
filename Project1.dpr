program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uTPokemon in 'uTPokemon.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
