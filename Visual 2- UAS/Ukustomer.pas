unit Ukustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    edt2: TEdit;
    btn6: TButton;
    lbl3: TLabel;
    edt3: TEdit;
    lbl4: TLabel;
    edt4: TEdit;
    lbl5: TLabel;
    edt5: TEdit;
    lbl6: TLabel;
    edt6: TEdit;
    lbl10: TLabel;
    cbb1: TComboBox;
    lbl8: TLabel;
    lbl9: TLabel;
    dbgrd1: TDBGrid;
    btn7: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btn7Click(Sender: TObject);
  private
    procedure posisiawal;
    procedure baru;
    procedure ubah;
    procedure UpdateGrid;
    procedure member;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Udatamodule, Ulaporan;

{$R *.dfm}

procedure TForm1.baru;
begin
  btn1.Enabled := False;
  btn2.Enabled := True;
  btn3.Enabled := False;
  btn4.Enabled := False;
  btn5.Enabled := True;
  edt1.Enabled := True;
  edt2.Enabled := True;
  edt3.Enabled := True;
  edt4.Enabled := True;
  edt5.Enabled := True;
  cbb1.Enabled := True;
end;

procedure TForm1.posisiawal;
begin
  btn1.Enabled := True;
  btn2.Enabled := False;
  btn3.Enabled := False;
  btn4.Enabled := False;
  btn5.Enabled := False;
  edt1.Enabled := False;
  edt2.Enabled := False;
  edt3.Enabled := False;
  edt4.Enabled := False;
  edt5.Enabled := False;
  cbb1.Enabled := False;
  cbb1.Text := '---PILIH---';
end;

procedure TForm1.ubah;
begin
  btn1.Enabled := False;
  btn2.Enabled := False;
  btn3.Enabled := True;
  btn4.Enabled := True;
  btn5.Enabled := True;
  edt1.Enabled := True;
  edt2.Enabled := True;
  edt3.Enabled := True;
  edt4.Enabled := True;
  edt5.Enabled := True;
  cbb1.Enabled := True;
end;

procedure TForm1.UpdateGrid;
begin
  DataModule1.zKustomer.Close;
  DataModule1.zKustomer.SQL.Clear;
  DataModule1.zKustomer.SQL.Add('SELECT * FROM kustomer');
  DataModule1.zKustomer.Open;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  posisiawal();
  member();
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  baru();
  cbb1.Clear;
  cbb1.Text := '---PILIH---';
  member();
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
  ubah();
  edt1.Text := DataModule1.zKustomer.fieldbyname('nik').AsString;
  edt3.Text := DataModule1.zKustomer.fieldbyname('name').AsString;
  edt4.Text := DataModule1.zKustomer.fieldbyname('telp').AsString;
  edt5.Text := DataModule1.zKustomer.fieldbyname('email').AsString;
  edt6.Text := DataModule1.zKustomer.fieldbyname('alamat').AsString;
  cbb1.Text := DataModule1.zKustomer.fieldbyname('member').AsString;
  cbb1Change(cbb1); // Call change event to update lbl9 accordingly
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  DataModule1.zKustomer.Append;
  DataModule1.zKustomer.FieldByName('nik').AsString := edt1.Text;
  DataModule1.zKustomer.FieldByName('name').AsString := edt3.Text;
  DataModule1.zKustomer.FieldByName('telp').AsString := edt4.Text;
  DataModule1.zKustomer.FieldByName('email').AsString := edt5.Text;
  DataModule1.zKustomer.FieldByName('alamat').AsString := edt6.Text;
  DataModule1.zKustomer.FieldByName('member').AsString := cbb1.Text;

  DataModule1.zKustomer.Post;
  UpdateGrid();
  edt1.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  cbb1.Clear;
  edt1.SetFocus;

  ShowMessage('Data Berhasil di Simpan');
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  DataModule1.zKustomer.Edit;
  DataModule1.zKustomer.FieldByName('nik').AsString := edt1.Text;
  DataModule1.zKustomer.FieldByName('name').AsString := edt3.Text;
  DataModule1.zKustomer.FieldByName('telp').AsString := edt4.Text;
  DataModule1.zKustomer.FieldByName('email').AsString := edt5.Text;
  DataModule1.zKustomer.FieldByName('alamat').AsString := edt6.Text;
  DataModule1.zKustomer.FieldByName('member').AsString := cbb1.Text;

  DataModule1.zKustomer.Post;
  UpdateGrid();
  edt1.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  cbb1.ItemIndex := -1;
  member();
  edt1.SetFocus;

  ShowMessage('Data Berhasil di Ubah');
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  if DataModule1.zKustomer.RecordCount <= 0 then
    MessageDlg('Data Tidak Ada', mtWarning, [mbOK], 0)
  else
  begin
    if MessageDlg('Anda yakin ingin menghapus data ini?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DataModule1.zKustomer.Delete;
      ShowMessage('Data Berhasil Dihapus');
    end;
  end;

  edt1.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  cbb1.Clear;
  edt1.SetFocus;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  posisiawal();
  edt1.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  UpdateGrid();
end;

procedure TForm1.btn6Click(Sender: TObject);
var
  searchText: string;
begin
  ubah();
  searchText := edt2.Text;

  DataModule1.zKustomer.SQL.Clear;
  DataModule1.zKustomer.SQL.Add('SELECT * FROM kustomer WHERE name LIKE :searchText');
  DataModule1.zKustomer.Params.ParamByName('searchText').AsString := '%' + searchText + '%';
  DataModule1.zKustomer.Open;

  if DataModule1.zKustomer.RecordCount = 0 then
    ShowMessage('Data tidak ditemukan');
  edt2.Clear;
end;

procedure TForm1.cbb1Change(Sender: TObject);
begin
  if cbb1.Text = 'Yes' then
    lbl9.Caption := '10%'
  else if cbb1.Text = 'No' then
    lbl9.Caption := '5%';
end;

procedure TForm1.member;
begin
  cbb1.Items.Clear;
  cbb1.Items.Add('Yes');
  cbb1.Items.Add('No');
  cbb1.OnChange := cbb1Change; // Set event handler for change event
end;

procedure TForm1.btn7Click(Sender: TObject);
begin
   Form2.Preview;
end;

end.

