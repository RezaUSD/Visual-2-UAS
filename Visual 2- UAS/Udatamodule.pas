unit Udatamodule;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TDataModule1 = class(TDataModule)
    Zconnection: TZConnection;
    zKustomer: TZQuery;
    dsKustomer: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

uses
  Ukustomer;

{$R *.dfm}


{ TDataModule1 }

end.
