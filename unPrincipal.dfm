object FrmPrincipal: TFrmPrincipal
  Left = 507
  Top = 239
  Width = 830
  Height = 510
  Caption = 'Wister'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 452
    Width = 814
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 410
    Width = 814
    Height = 42
    Align = alBottom
    TabOrder = 1
    object btnEditar: TButton
      Left = 124
      Top = 8
      Width = 105
      Height = 30
      Caption = 'Editar'
      TabOrder = 0
      OnClick = btnEditarClick
    end
    object btnRelatorio: TButton
      Left = 356
      Top = 8
      Width = 105
      Height = 30
      Caption = 'Relat'#243'rio'
      TabOrder = 1
      OnClick = btnRelatorioClick
    end
    object btnCadastrar: TButton
      Left = 14
      Top = 8
      Width = 105
      Height = 30
      Caption = 'Cadastrar'
      TabOrder = 2
      OnClick = btnCadastrarClick
    end
    object btnExcluir: TButton
      Left = 235
      Top = 8
      Width = 105
      Height = 30
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 814
    Height = 57
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 75
      Height = 13
      Caption = 'Pesquisar nome'
    end
    object edtPesquisa: TEdit
      Left = 8
      Top = 29
      Width = 425
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object btnPesquisar: TButton
      Left = 440
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 814
    Height = 353
    Align = alClient
    DataSource = dsPessoa
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_PESSOA'
        Title.Caption = 'C'#243'd'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG'
        Title.Caption = 'Rg.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Title.Caption = 'C.P.F.'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAE'
        Title.Caption = 'Nome da M'#227'e'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAI'
        Title.Caption = 'Nome do Pai'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Title.Caption = 'Cep'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'Nro.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Title.Caption = 'Cidade'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Width = 20
        Visible = True
      end>
  end
  object dsPessoa: TDataSource
    AutoEdit = False
    DataSet = Dm.cdsPessoa
    Left = 776
    Top = 352
  end
  object RvProject1: TRvProject
    ProjectFile = 'Pessoa.rav'
    Left = 536
    Top = 16
  end
  object dsRave: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = Dm.cdsPessoa
    Left = 568
    Top = 16
  end
end
