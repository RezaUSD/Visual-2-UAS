unit Ulaporan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet;

type
  TForm2 = class(TForm)
    frxrprt1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    procedure Preview;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Udatamodule;

{$R *.dfm}


{ TForm2 }

procedure TForm2.Preview;
begin
  frxdbdtst1.DataSet := DataModule1.zKustomer;
  frxrprt1.ShowReport;
end;

end.
 