object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Formulario de Cadastro'
  ClientHeight = 492
  ClientWidth = 1475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = 39
    Width = 1481
    Height = 449
    Caption = 'Dados Cliente'
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 22
      Width = 11
      Height = 15
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 55
      Top = 22
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 9
      Top = 69
      Width = 21
      Height = 15
      Caption = 'Cep'
    end
    object Label4: TLabel
      Left = 9
      Top = 113
      Width = 49
      Height = 15
      Caption = 'Endere'#231'o'
    end
    object Label5: TLabel
      Left = 354
      Top = 113
      Width = 77
      Height = 15
      Caption = 'Complemento'
    end
    object Label6: TLabel
      Left = 9
      Top = 158
      Width = 37
      Height = 15
      Caption = 'Cidade'
    end
    object Label7: TLabel
      Left = 144
      Top = 158
      Width = 14
      Height = 15
      Caption = 'UF'
    end
    object Label8: TLabel
      Left = 181
      Top = 113
      Width = 31
      Height = 15
      Caption = 'Bairro'
    end
    object Edit1: TEdit
      Left = 9
      Top = 43
      Width = 40
      Height = 23
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 55
      Top = 43
      Width = 410
      Height = 23
      TabOrder = 1
    end
    object edtCep: TEdit
      Left = 9
      Top = 90
      Width = 158
      Height = 23
      TabOrder = 2
      OnKeyDown = edtCepKeyDown
    end
    object btnBuscarCep: TButton
      Left = 173
      Top = 90
      Width = 70
      Height = 20
      Caption = 'Buscar'
      Enabled = False
      TabOrder = 3
      OnClick = btnBuscarCepClick
    end
    object edtEndereco: TEdit
      Left = 9
      Top = 132
      Width = 158
      Height = 23
      TabOrder = 4
    end
    object edtBairro: TEdit
      Left = 181
      Top = 134
      Width = 158
      Height = 23
      TabOrder = 5
    end
    object edtCidade: TEdit
      Left = 9
      Top = 179
      Width = 129
      Height = 23
      TabOrder = 6
    end
    object edtComplemento: TEdit
      Left = 354
      Top = 134
      Width = 207
      Height = 23
      TabOrder = 7
    end
  end
  object edtUF: TEdit
    Left = 152
    Top = 218
    Width = 23
    Height = 23
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 17
    Top = 289
    Width = 1217
    Height = 135
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btnSalvar: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 3
    OnClick = btnSalvarClick
  end
  object btnInserir: TButton
    Left = 381
    Top = 258
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 4
    OnClick = btnInserirClick
  end
  object DataSource1: TDataSource
    DataSet = DataModule2.ClientDataSet1
    Left = 1191
    Top = 240
  end
end
