unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    DBGrid1: TDBGrid;
    procedure btn4Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1; 
  a: string;
  sql, p : string;

implementation

{$R *.dfm}

procedure TForm1.btn4Click(Sender: TObject);
begin
edt1.Text:='';
edt2.Text:='';   
btn1.Enabled:=true;    
btn2.Enabled:=false;
btn3.Enabled:=false;
//edt3.Text:='';
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into satuan values(null,"'+edt1.Text+'","'+edt2.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from satuan');
zqry1.Open;
ShowMessage('Data Berhasil disimpan !');

end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
btn1.Enabled:=false;      
btn2.Enabled:=true;
btn3.Enabled:=true;
edt1.Text:= zqry1.Fields[1].AsString;
edt2.Text:= zqry1.Fields[2].AsString;
a:= zqry1.Fields[0].AsString;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
edt1.Text:='';
edt2.Text:='';   
btn1.Enabled:=true;
btn2.Enabled:=false;
btn3.Enabled:=false;
//edt3.Text:='';
end;

procedure TForm1.btn2Click(Sender: TObject);
begin       
with zqry1 do
begin
  SQL.Clear;
  SQL.Add('update satuan set nama="'+edt1.Text+'",diskripsi="'+edt2.Text+'" where id= "'+a+'"');
  ExecSQL ;

  SQL.Clear;
  SQL.Add('select * from satuan');
  Open;
ShowMessage('Data Berhasil diupdate !');

end;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin

with zqry1 do
begin
  SQL.Clear;
  SQL.Add('delete from satuan where id= "'+a+'"');
  ExecSQL ;

    SQL.Clear;
    SQL.Add('select * from satuan');
  Open;
ShowMessage('Data Berhasil dihapus !');

end;

end;

end.
