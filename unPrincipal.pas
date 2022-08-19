unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, DB, DBCtrls, Mask,
  RpCon, RpConDS, RpDefine, RpRave, DBClient;

type
  TFrmPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnEditar: TButton;
    dsPessoa: TDataSource;
    btnRelatorio: TButton;
    RvProject1: TRvProject;
    Panel3: TPanel;
    Label1: TLabel;
    edtPesquisa: TEdit;
    btnPesquisar: TButton;
    DBGrid1: TDBGrid;
    btnCadastrar: TButton;
    dsRave: TRvDataSetConnection;
    btnExcluir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtivaDesativaBotoes;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses unDm, SqlExpr, StdConvs, unCadastro;


{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Dm.cdsPessoa.Open;
  AtivaDesativaBotoes;
end;

procedure TFrmPrincipal.btnRelatorioClick(Sender: TObject);
begin
  RvProject1.Execute;
end;

procedure TFrmPrincipal.btnEditarClick(Sender: TObject);
var
  frmCadastro: TfrmCadastro;
begin
  Try
    frmCadastro := TfrmCadastro.Create(Self);
    frmCadastro.Edicao := True;
    frmCadastro.IDPessoa := Dm.cdsPessoaID_PESSOA.AsInteger;
    frmCadastro.ShowModal;
  finally
    FreeAndNil(frmCadastro);
    Dm.cdsPessoa.Close;
    Dm.cdsPessoa.Open;
  end;
end;

procedure TFrmPrincipal.btnPesquisarClick(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) <> '' then
  begin
    with dm.cdsPessoa do
    begin
      Filter := 'NOME='+ QuotedStr(edtPesquisa.Text);
      Filtered := True;
    end;
  end
  else
    Dm.cdsPessoa.Filtered := False;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if Application.MessageBox('Sair do sistema?','Atenção',
                                MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = IDNO then
    Abort;
end;

procedure TFrmPrincipal.btnCadastrarClick(Sender: TObject);
var
  frmCadastro: TfrmCadastro;
begin
  Try
    frmCadastro := TfrmCadastro.Create(Self);
    frmCadastro.Edicao := False;
    frmCadastro.ShowModal;
  finally
    FreeAndNil(frmCadastro);
    Dm.cdsPessoa.Close;
    Dm.cdsPessoa.Open;
    AtivaDesativaBotoes;
  end;

end;

procedure TFrmPrincipal.AtivaDesativaBotoes;
begin
  btnEditar.Enabled := Dm.cdsPessoa.RecordCount > 0;
  btnRelatorio.Enabled := Dm.cdsPessoa.RecordCount > 0;
  btnExcluir.Enabled := Dm.cdsPessoa.RecordCount > 0;
end;


procedure TFrmPrincipal.btnExcluirClick(Sender: TObject);
var
  qry: TSQLQuery;
begin
  if Application.MessageBox('Excluir o registro atual?', 'Atenção', MB_YESNO +
    MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
  begin
      try
        qry := TSQLQuery.Create(Self);
        qry.SQLConnection := dm.Conexao;
        qry.SQL.Add('DELETE FROM ENDERECO');
        qry.SQL.Add('WHERE ID_PESSOA='+Dm.cdsPessoaID_PESSOA.AsString);
        qry.SQL.Add(';DELETE FROM PESSOA');
        qry.SQL.Add('WHERE ID_PESSOA='+Dm.cdsPessoaID_PESSOA.AsString);
        qry.ExecSQL;
      finally
        FreeAndNil(qry);
        Dm.cdsPessoa.Close;
        Dm.cdsPessoa.Open;
      end;
  end;
end;

end.
