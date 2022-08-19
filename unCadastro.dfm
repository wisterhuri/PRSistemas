object frmCadastro: TfrmCadastro
  Left = 722
  Top = 331
  Width = 517
  Height = 404
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnSalvar: TButton
    Left = 13
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 0
    OnClick = btnSalvarClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 481
    Height = 153
    Caption = ' Dados '
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 28
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 9
      Top = 52
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Rg.'
    end
    object Label3: TLabel
      Left = 9
      Top = 75
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'C.P.F'
    end
    object Label4: TLabel
      Left = 9
      Top = 99
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nome do Pai'
    end
    object Label5: TLabel
      Left = 9
      Top = 123
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nome da M'#227'e'
    end
    object edtNome: TEdit
      Left = 88
      Top = 24
      Width = 379
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 0
    end
    object edtRG: TEdit
      Left = 88
      Top = 48
      Width = 379
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 13
      TabOrder = 1
    end
    object edtCPF: TEdit
      Left = 88
      Top = 72
      Width = 379
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 15
      TabOrder = 2
    end
    object edtPai: TEdit
      Left = 88
      Top = 96
      Width = 379
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 3
    end
    object edtMae: TEdit
      Left = 88
      Top = 120
      Width = 379
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 168
    Width = 481
    Height = 153
    Caption = ' Dados '
    TabOrder = 2
    object Label6: TLabel
      Left = 9
      Top = 28
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'CEP'
    end
    object Label7: TLabel
      Left = 9
      Top = 52
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Endere'#231'o'
    end
    object Label8: TLabel
      Left = 9
      Top = 75
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'N'#250'mero'
    end
    object Label9: TLabel
      Left = 9
      Top = 99
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cidade'
    end
    object Label10: TLabel
      Left = 9
      Top = 123
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Estado'
    end
    object edtCep: TEdit
      Left = 88
      Top = 24
      Width = 379
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 0
      OnExit = edtCepExit
    end
    object edtEndereco: TEdit
      Left = 88
      Top = 48
      Width = 379
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 1
    end
    object edtNumero: TEdit
      Left = 88
      Top = 72
      Width = 379
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 2
    end
    object edtCidade: TEdit
      Left = 88
      Top = 96
      Width = 379
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 3
    end
    object edtUF: TEdit
      Left = 88
      Top = 120
      Width = 379
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 4
    end
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 96
    Top = 328
  end
end
