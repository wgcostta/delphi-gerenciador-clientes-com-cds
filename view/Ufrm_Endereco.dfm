object frm_Endereco: Tfrm_Endereco
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  BorderWidth = 1
  Caption = 'frm_Endereco'
  ClientHeight = 181
  ClientWidth = 401
  Color = 7884599
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 401
    Height = 33
    Align = alTop
    Color = 7884599
    ParentBackground = False
    TabOrder = 0
    VerticalAlignment = taAlignBottom
    object Label6: TLabel
      Left = 120
      Top = 7
      Width = 151
      Height = 20
      Caption = 'Cadastro de Endere'#231'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 156
    Width = 401
    Height = 25
    Align = alBottom
    Color = 7884599
    ParentBackground = False
    TabOrder = 1
    VerticalAlignment = taAlignBottom
  end
  object Panel3: TPanel
    Left = 0
    Top = 33
    Width = 401
    Height = 123
    Align = alClient
    Color = 15920615
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 27
      Height = 15
      Caption = 'Tipo:'
    end
    object Label2: TLabel
      Left = 112
      Top = 19
      Width = 52
      Height = 15
      Caption = 'Endere'#231'o:'
    end
    object Label3: TLabel
      Left = 341
      Top = 19
      Width = 14
      Height = 15
      Caption = 'N'#186
    end
    object Label4: TLabel
      Left = 16
      Top = 65
      Width = 40
      Height = 15
      Caption = 'Cidade:'
    end
    object Label5: TLabel
      Left = 181
      Top = 65
      Width = 24
      Height = 15
      Caption = 'CEP:'
    end
    object btnSalvar: TButton
      Left = 262
      Top = 82
      Width = 57
      Height = 25
      Caption = 'Salvar'
      TabOrder = 5
      OnClick = btnSalvarClick
    end
    object btnVoltar: TButton
      Left = 325
      Top = 82
      Width = 57
      Height = 25
      Caption = 'Voltar'
      TabOrder = 6
      OnClick = btnVoltarClick
    end
    object EditCidade: TEdit
      Left = 16
      Top = 82
      Width = 159
      Height = 23
      MaxLength = 20
      TabOrder = 3
    end
    object EditEndereco: TEdit
      Left = 112
      Top = 38
      Width = 223
      Height = 23
      MaxLength = 50
      TabOrder = 1
    end
    object EditNumeroEnd: TEdit
      Left = 341
      Top = 38
      Width = 41
      Height = 23
      MaxLength = 5
      TabOrder = 2
    end
    object EditTipoEnd: TEdit
      Left = 16
      Top = 38
      Width = 90
      Height = 23
      MaxLength = 20
      TabOrder = 0
    end
    object EditCep: TMaskEdit
      Left = 181
      Top = 82
      Width = 66
      Height = 23
      EditMask = '00.000-000;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  .   -   '
    end
  end
  object DS_Endereco: TDataSource
    DataSet = DM_Dados.CDS_EndCli
    Left = 224
    Top = 142
  end
end
