unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,REST.Client, REST.Types,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, Vcl.Grids, Vcl.DBGrids,uModule;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    edtNome: TEdit;
    Label2: TLabel;
    edtCep: TEdit;
    Label3: TLabel;
    btnBuscarCep: TButton;
    Label4: TLabel;
    edtEndereco: TEdit;
    Label5: TLabel;
    edtBairro: TEdit;
    edtCidade: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtUF: TEdit;
    DBGrid1: TDBGrid;
    btnSalvar: TButton;
    btnInserir: TButton;
    DataSource1: TDataSource;
    Label8: TLabel;
    edtComplemento: TEdit;
    procedure btnInserirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnBuscarCepClick(Sender: TObject);
    procedure edtCepKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure limparCampos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnSalvarClick(Sender: TObject);
var
numero : integer;
begin

 If  MessageDlg('Voc� deseja inserir os registros?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
      numero :=1;
   DataModule2.ADOQuery1.Close;
   DataModule2.ADOQuery1.SQL.Clear;
   DataModule2.ClientDataSet1.First;

 while not   DataModule2.ClientDataSet1.Eof do
   begin
     DataModule2.ADOQuery1.SQL.Add('INSERT INTO   CLIENTE ');
     DataModule2.ADOQuery1.SQL.Add('( ID,    NOME,');
     DataModule2.ADOQuery1.SQL.Add(' 	ENDERECO ,  ');
	   DataModule2.ADOQuery1.SQL.Add(' BAIRRO ,     ');
     DataModule2.ADOQuery1.SQL.Add(' 	CIDADE,     ');
	   DataModule2.ADOQuery1.SQL.Add(' UF ,         ');
	   DataModule2.ADOQuery1.SQL.Add(' CEP    )      ');

     DataModule2.ADOQuery1.SQL.Add('VALUES(');
     DataModule2.ADOQuery1.SQL.Add(':ID,');
     DataModule2.ADOQuery1.SQL.Add(':NOME,');
     DataModule2.ADOQuery1.SQL.Add(' 	:ENDERECO ,  ');
	   DataModule2.ADOQuery1.SQL.Add(' :BAIRRO ,     ');
     DataModule2.ADOQuery1.SQL.Add(' 	:CIDADE,     ');
	   DataModule2.ADOQuery1.SQL.Add(':UF ,         ');
	   DataModule2.ADOQuery1.SQL.Add(' :CEP )         ');


     DataModule2.ADOQuery1.Parameters.ParamByName('ID').Value := numero;
     DataModule2.ADOQuery1.Parameters.ParamByName('NOME').Value := DataModule2.ClientDataSet1.FieldByName('nome').AsString;
     DataModule2.ADOQuery1.Parameters.ParamByName('ENDERECO').Value := DataModule2.ClientDataSet1.FieldByName('ENDERECO').AsString;
     DataModule2.ADOQuery1.Parameters.ParamByName('BAIRRO').Value := DataModule2.ClientDataSet1.FieldByName('BAIRRO').AsString;
     DataModule2.ADOQuery1.Parameters.ParamByName('CIDADE').Value := DataModule2.ClientDataSet1.FieldByName('CIDADE').AsString;
     DataModule2.ADOQuery1.Parameters.ParamByName('UF').Value := DataModule2.ClientDataSet1.FieldByName('UF').AsString;
     DataModule2.ADOQuery1.Parameters.ParamByName('CEP').Value := DataModule2.ClientDataSet1.FieldByName('CEP').AsString;;
     DataModule2.ADOQuery1.ExecSQL;
     numero  := numero +1;
     DataModule2.ClientDataSet1.Next;
  end;
 end;


end;

procedure TForm1.edtCepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if(Length(edtCep.Text) > 7) then
    begin
      btnBuscarCep.Enabled := true;
    end
    else
     btnBuscarCep.Enabled := false;
end;

procedure TForm1.limparCampos;
begin
 edtNome.Clear;
 edtCep.Clear;
 edtEndereco.Clear;
 edtBairro.Clear;
 edtCidade.Clear;
 edtUF.Clear;
 edtComplemento.Clear;
 dataModule2.ClientDataSet1.EmptyDataSet;
end;

procedure TForm1.btnBuscarCepClick(Sender: TObject);
var
 dadosCep : TStringList;

begin
  dadosCep            :=  DataModule2.buscarCep(edtCep.Text);
  edtEndereco.Text    := dadosCep[0];
  edtBairro.Text      := dadosCep[1];
  edtUF.Text          := dadosCep[2];
  edtCidade.Text      := dadosCep[3];
  edtComplemento.Text := dadosCep[4];

end;

procedure TForm1.btnInserirClick(Sender: TObject);
begin

   DataModule2.inserirRegistro(edtNome.Text,edtEndereco.Text,edtCep.Text, edtBairro.Text, edtComplemento.Text, edtCidade.Text, edtUf.Text  );

   btnSalvar.Enabled  := not DataModule2.ClientDataSet1.IsEmpty;
end;

end.
