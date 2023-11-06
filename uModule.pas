unit uModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Datasnap.DBClient,
  REST.Types, Data.Bind.Components, Data.Bind.ObjectScope, REST.Client,System.JSON;

type
  TDataModule2 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1nome: TStringField;
    ClientDataSet1cep: TStringField;
    ClientDataSet1endereco: TStringField;
    ClientDataSet1bairro: TStringField;
    ClientDataSet1complemento: TStringField;
    ClientDataSet1cidade: TStringField;
    ClientDataSet1uf: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure inserirRegistro(pNome ,pEndereco,pCep, pBairro, pComplemento, pCidade, pUf: String )  ;
    function buscarCep(pCep : String) : TStringList;
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule2 }

function TDataModule2.buscarCep(pCep: String): TStringList;
var
  data: TJSONObject;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse;
  CEP: TStringList;
begin
  RESTClient1 := TRESTClient.Create(nil);
  RESTRequest1 := TRESTRequest.Create(nil);
  RESTResponse1 := TRESTResponse.Create(nil);
  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTClient1.BaseURL := 'viacep.com.br/ws/'+pCep+'/json/';
  RESTRequest1.Execute;

  data := RESTResponse1.JSONValue as TJSONObject;


  try
    CEP := TStringList.Create;
    if Assigned(data) then
    begin
        try
          CEP.Add(data.Values['logradouro'].Value);
        except
        on Exception do
            CEP.Add('');
        end;
        try
          CEP.Add(data.Values['bairro'].Value);
        except
        on Exception do
           CEP.Add('');
        end;
        try
          CEP.Add(data.Values['uf'].Value);
        except
        on Exception do
           CEP.Add('');
        end;
        try
          CEP.Add(data.Values['localidade'].Value);
        except
        on Exception do
           CEP.Add('');
        end;
        try
          CEP.Add(data.Values['complemento'].Value);
        except
        on Exception do
           CEP.Add('');
        end;
      end;
  finally
    FreeAndNil(data);
  end;
  Result := CEP;
end;

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  ClientDataSet1.CreateDataSet;
  ClientDataSet1.EmptyDataSet;
end;

procedure TDataModule2.inserirRegistro(pNome,pEndereco,pCep, pBairro, pComplemento, pCidade, pUf : String);
begin
  ClientDataSet1.Insert;
  ClientDataSet1nome.AsString           := pNome;
  ClientDataSet1cep.AsString            := pCep;
  ClientDataSet1endereco.AsString       := pEndereco;
  ClientDataSet1bairro.AsString         := pBairro;
  ClientDataSet1complemento.AsString    := pComplemento;
  ClientDataSet1cidade.AsString         := pCidade;
  ClientDataSet1uf.AsString             := pUf;
  ClientDataSet1.Post;


end;

end.