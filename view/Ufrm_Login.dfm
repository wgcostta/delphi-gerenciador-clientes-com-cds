object frm_Login: Tfrm_Login
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  BorderWidth = 1
  Caption = 'frm_Login'
  ClientHeight = 132
  ClientWidth = 308
  Color = 7884599
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 105
    Width = 308
    Height = 27
    Align = alBottom
    Color = 7884599
    ParentBackground = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 308
    Height = 72
    Align = alClient
    Color = 15920615
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 31
      Top = 6
      Width = 35
      Height = 17
      Caption = 'Login:'
    end
    object Label2: TLabel
      Left = 24
      Top = 41
      Width = 38
      Height = 17
      Caption = 'Senha:'
    end
    object btnAcessar: TButton
      Left = 216
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Acessar'
      TabOrder = 2
      OnClick = btnAcessarClick
    end
    object btnCancelar: TButton
      Left = 216
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object EditSenha: TEdit
      Left = 75
      Top = 38
      Width = 121
      Height = 25
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 1
      OnKeyPress = EditSenhaKeyPress
    end
    object EditUsuario: TEdit
      Left = 75
      Top = 6
      Width = 121
      Height = 25
      MaxLength = 20
      TabOrder = 0
      OnKeyPress = EditUsuarioKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 308
    Height = 33
    Align = alTop
    Color = 7884599
    ParentBackground = False
    TabOrder = 2
    object Label3: TLabel
      Left = 31
      Top = 9
      Width = 234
      Height = 18
      Caption = 'Login - Gerenciador de Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
