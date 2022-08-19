unit unDm;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, Provider, DBClient,
  IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP,messages, xmldom, XMLIntf, msxmldom,
  XMLDoc;

type
  TDm = class(TDataModule)
    Conexao: TSQLConnection;
    qryPessoa: TSQLQuery;
    cdsPessoa: TClientDataSet;
    dspPessoa: TDataSetProvider;
    qryPessoaID_PESSOA: TIntegerField;
    qryPessoaNOME: TStringField;
    qryPessoaRG: TStringField;
    qryPessoaCPF: TStringField;
    qryPessoaMAE: TStringField;
    qryPessoaPAI: TStringField;
    cdsPessoaID_PESSOA: TIntegerField;
    cdsPessoaNOME: TStringField;
    cdsPessoaRG: TStringField;
    cdsPessoaCPF: TStringField;
    cdsPessoaMAE: TStringField;
    cdsPessoaPAI: TStringField;
    qryPessoaID_ENDERECO: TIntegerField;
    qryPessoaCEP: TStringField;
    qryPessoaENDERECO: TStringField;
    qryPessoaNUMERO: TStringField;
    qryPessoaCIDADE: TStringField;
    qryPessoaUF: TStringField;
    cdsPessoaID_ENDERECO: TIntegerField;
    cdsPessoaCEP: TStringField;
    cdsPessoaENDERECO: TStringField;
    cdsPessoaNUMERO: TStringField;
    cdsPessoaCIDADE: TStringField;
    cdsPessoaUF: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation
uses
  Dialogs,Forms,Windows;

{$R *.dfm}


procedure TDm.DataModuleCreate(Sender: TObject);
begin
  try
    Conexao.Connected := True
  except
    Showmessage('Erro ao conectar ao banco de dados');
    Application.Terminate;
  end;
end;


end.
