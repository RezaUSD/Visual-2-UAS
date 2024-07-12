program Fiture_member;

uses
  Forms,
  Udatamodule in 'Udatamodule.pas' {DataModule1: TDataModule1},
  Ukustomer in 'Ukustomer.pas' {Form1},
  Ulaporan in 'Ulaporan.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
