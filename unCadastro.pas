unit unCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FMTBcd, DB, SqlExpr,
  IdTCPConnection, IdTCPClient, IdHTTP,
  xmldom, XMLIntf, msxmldom, XMLDoc, IdBaseComponent, IdComponent;

type
  TEndereco = class
    IDEndereco: Integer;
    IDPessoa:Integer;
    CEP:String;
    Endereco:String;
    Numero:String;
    Cidade:String;
    Estado:String;
    public
      constructor create;
  end;

  TPessoa = class
    IDPessoa:Integer;
    Nome:String;
    Rg:String;
    Cpf:String;
    Mae:String;
    Pai:String;
    Endereco: TEndereco;
    public
      constructor create(IDPEssoa:Integer);
  end;

  TfrmCadastro = class(TForm)
    btnSalvar: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtNome: TEdit;
    edtRG: TEdit;
    edtCPF: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtPai: TEdit;
    Label5: TLabel;
    edtMae: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtCep: TEdit;
    edtEndereco: TEdit;
    edtNumero: TEdit;
    edtCidade: TEdit;
    edtUF: TEdit;
    IdHTTP1: TIdHTTP;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
  private
    FEdicao: Boolean;
    FIDPessoa: integer;
    FIDEndereco: integer;
    { Private declarations }
    function ValidarDados:Boolean;
    procedure CarregarPessoaEndereco(id_pessoa:Integer);
    procedure ConsultaCEP(const Cep: string);
  public
    { Public declarations }
    Property Edicao: Boolean read FEdicao write FEdicao;
    property IDPessoa: integer read FIDPessoa write FIDPessoa;
    property IDEndereco: integer read FIDEndereco write FIDEndereco;
  end;

var
  frmCadastro: TfrmCadastro;

implementation

uses unDm;

{$R *.dfm}

procedure TfrmCadastro.btnSalvarClick(Sender: TObject);
var
  qry: TSQLQuery;
  vID_Pessoa:integer;
begin
  if Edicao = False then
  begin
    if ValidarDados then
    begin
      try
        qry := TSQLQuery.Create(Self);
        qry.SQLConnection := dm.Conexao;

        qry.SQL.Add('INSERT INTO PESSOA');
        qry.SQL.Add('(NOME,RG,CPF,MAE,PAI)');
        qry.SQL.Add('VALUES');
        qry.SQL.Add('(:NOME,:RG,:CPF,:MAE,:PAI);');
        qry.ParamByName('NOME').AsString := edtNome.Text;
        qry.ParamByName('RG').AsString := edtRG.Text;
        qry.ParamByName('CPF').AsString := edtCPF.Text;
        qry.ParamByName('MAE').AsString := edtMae.Text;
        qry.ParamByName('PAI').AsString := edtPai.Text;
        qry.ExecSQL;

        qry.SQL.Clear;
        qry.SQL.Add('SELECT MAX(ID_PESSOA) AS ID_PESSOA FROM PESSOA');
        qry.Open;
        vID_Pessoa := qry.FieldByName('ID_Pessoa').AsInteger;

        qry.SQL.Clear;
        qry.SQL.Add('INSERT INTO ENDERECO');
        qry.SQL.Add('(CEP,ENDERECO,NUMERO,CIDADE,Uf,ID_PESSOA)');
        qry.SQL.Add('VALUES');
        qry.SQL.Add('(:CEP,:ENDERECO,:NUMERO,:CIDADE,:UF,:ID_PESSOA)');
        qry.ParamByName('CEP').AsString := edtCep.Text;
        qry.ParamByName('ENDERECO').AsString := edtEndereco.Text;
        qry.ParamByName('NUMERO').AsString := edtNumero.Text;
        qry.ParamByName('CIDADE').AsString := edtCidade.Text;
        qry.ParamByName('UF').AsString := edtUF.Text;
        qry.ParamByName('ID_PESSOA').AsInteger := vID_Pessoa;
        qry.ExecSQL;
      finally
        FreeAndNil(qry);
        Showmessage('Cadastro Efetuado');
        Self.Close;
      end;
    end;
  end
  else
  begin
  if ValidarDados then
  begin
    try
      qry := TSQLQuery.Create(Self);
      qry.SQLConnection := dm.Conexao;

      qry.SQL.Add('UPDATE PESSOA SET NOME=:NOME,RG=:RG,CPF=:CPF,MAE=:MAE,PAI=:PAI');
      qry.SQL.Add('WHERE ID_PESSOA='+IntToStr(IDPessoa));
      qry.ParamByName('NOME').AsString := edtNome.Text;
      qry.ParamByName('RG').AsString := edtRG.Text;
      qry.ParamByName('CPF').AsString := edtCPF.Text;
      qry.ParamByName('MAE').AsString := edtMae.Text;
      qry.ParamByName('PAI').AsString := edtPai.Text;
      qry.ExecSQL;

      qry.SQL.Clear;
      qry.SQL.Add('UPDATE ENDERECO SET CEP=:CEP,ENDERECO=:ENDERECO,NUMERO=:NUMERO,');
      qry.SQL.Add('CIDADE=:CIDADE,UF=:UF');
      qry.SQL.Add('WHERE ID_ENDERECO='+IntToStr(IDEndereco));
      qry.ParamByName('CEP').AsString := edtCep.Text;
      qry.ParamByName('ENDERECO').AsString := edtEndereco.Text;
      qry.ParamByName('NUMERO').AsString := edtNumero.Text;
      qry.ParamByName('CIDADE').AsString := edtCidade.Text;
      qry.ParamByName('UF').AsString := edtUF.Text;
      qry.ExecSQL;
    finally
      FreeAndNil(qry);
      Showmessage('Alteração Efetuada');
      Self.Close;
    end;
  end;
  end;
end;

procedure TfrmCadastro.CarregarPessoaEndereco(id_pessoa: Integer);
var
  Pessoa: TPessoa;
begin
  try
    Pessoa := TPessoa.create(id_pessoa);
    edtNome.Text := Pessoa.Nome;
    edtRG.Text := Pessoa.Rg;
    edtCPF.Text := Pessoa.Cpf;
    edtPai.Text := Pessoa.Pai;
    edtMae.Text := Pessoa.Mae;
    edtCep.Text := Pessoa.Endereco.CEP;
    edtEndereco.Text := Pessoa.Endereco.Endereco;
    edtNumero.Text := Pessoa.Endereco.Numero;
    edtCidade.Text := Pessoa.Endereco.Cidade;
    edtUF.Text := Pessoa.Endereco.Estado;
    IDEndereco := Pessoa.Endereco.IDEndereco;
  finally
    FreeAndNil(Pessoa);
  end;
end;

function TfrmCadastro.ValidarDados: Boolean;
begin
  Result := True;
  if Trim(edtNome.Text)='' then
  begin
    Result := False;
    Showmessage('Informe o nome');
    edtNome.SetFocus;
  end;

  if Trim(edtRG.Text)='' then
  begin
    Result := False;
    Showmessage('Informe o Rg.');
    edtRg.SetFocus;
  end;

  if Trim(edtCPF.Text)='' then
  begin
    Result := False;
    Showmessage('Informe o CPF.');
    edtCPF.SetFocus;
  end;

  if Trim(edtCep.Text)='' then
  begin
    Result := False;
    Showmessage('Informe o CEP.');
    edtCEP.SetFocus;
  end;

  if Trim(edtEndereco.Text)='' then
  begin
    Result := False;
    Showmessage('Informe o Endereço.');
    edtEndereco.SetFocus;
  end;

  if Trim(edtNumero.Text)='' then
  begin
    Result := False;
    Showmessage('Informe o número.');
    edtNumero.SetFocus;
  end;

  if Trim(edtCidade.Text)='' then
  begin
    Result := False;
    Showmessage('Informe a Cidade.');
    edtCidade.SetFocus;
  end;

  if Trim(edtUF.Text)='' then
  begin
    Result := False;
    Showmessage('Informe o Estado.');
    edtUF.SetFocus;
  end;
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
begin
  if Edicao then
  begin
    CarregarPessoaEndereco(IDPessoa);
  end;
end;

procedure TfrmCadastro.ConsultaCEP(const Cep: string);
var
  sUrl: String;
  xml: TXMLDocument;
  node: IXMLNode;
  nodes: IXMLNodeList;
  Resp: TStringStream;
  i: Integer;
begin
  Resp := TStringStream.Create('');
  xml := TXMLDocument.Create(Self);
  sUrl := 'http://viacep.com.br/ws/'+Cep+'/xml';
  IdHTTP1.Get(sUrl,Resp);
  xml.LoadFromStream(Resp);

  node := xml.DocumentElement;
  Nodes := Node.ChildNodes;

     if Node.HasChildNodes then
     begin
          for I := 0 to Nodes.Count - 1 do
          begin
             if Nodes[I].NodeName = 'erro' then
             begin
                Application.MessageBox('Cep não encontrado', 'Atenção', MB_OK
                  + MB_ICONWARNING + MB_DEFBUTTON2);
                edtEndereco.Clear;
                edtNumero.Clear;
                edtCidade.Clear;
                edtUF.Clear;
                Exit;
             end;

             if Nodes[I].NodeName = 'logradouro' then
                edtEndereco.Text := nodes[i].Text
             else
                if Nodes[I].NodeName = 'localidade' then
                   edtCidade.Text := nodes[i].Text
                else
                  if Nodes[I].NodeName = 'uf' then
                     edtUF.Text := nodes[i].Text
          end;
     end


end;

procedure TfrmCadastro.edtCepExit(Sender: TObject);
begin
  if Trim(edtCPF.Text)<> '' then
    ConsultaCEP(edtCep.Text);
end;

{ TPessoa }

constructor TPessoa.create(IDPEssoa:Integer);
var
  qry: TSQLQuery;
begin
  Endereco := TEndereco.create;
  try
    qry := TSQLQuery.Create(Application);
    qry.SQLConnection := dm.Conexao;

    qry.SQL.Add('SELECT P.*,E.* FROM Pessoa P');
    qry.SQL.Add('LEFT JOIN ENDERECO E ON E.ID_PESSOA = P.ID_PESSOA');
    qry.SQL.Add('WHERE P.ID_PESSOA=:ID_PESSOA');

    qry.ParamByName('ID_PESSOA').AsInteger := IDPEssoa;
    qry.Open;

    Nome:= qry.FieldByName('NOME').AsString;
    RG:= qry.FieldByName('RG').AsString;
    CPF:= qry.FieldByName('CPF').AsString;
    Pai:= qry.FieldByName('PAI').AsString;
    Mae:= qry.FieldByName('MAE').AsString;

    Endereco.IDEndereco:= qry.FieldByName('ID_ENDERECO').AsInteger;
    Endereco.CEP := qry.FieldByName('CEP').AsString;
    Endereco.Endereco := qry.FieldByName('Endereco').AsString;
    Endereco.Numero := qry.FieldByName('Numero').AsString;
    Endereco.Cidade := qry.FieldByName('Cidade').AsString;
    Endereco.Estado := qry.FieldByName('UF').AsString;
  finally
    FreeAndNil(qry);
  end;

end;

{ TEndereco }

constructor TEndereco.create;
begin

end;

end.
