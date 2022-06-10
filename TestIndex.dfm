object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 293
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 91
    Width = 749
    Height = 202
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 91
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 729
    object Label1: TLabel
      Left = 9
      Top = 40
      Width = 32
      Height = 13
      Caption = 'Index:'
    end
    object Label2: TLabel
      Left = 9
      Top = 51
      Width = 64
      Height = 13
      Caption = 'Filtro(range):'
    end
    object Label3: TLabel
      Left = 9
      Top = 65
      Width = 67
      Height = 13
      Caption = 'RecordCount:'
    end
    object Button4: TButton
      Left = 134
      Top = 9
      Width = 115
      Height = 25
      Caption = 'Indexar 1 campo'
      TabOrder = 0
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 250
      Top = 9
      Width = 115
      Height = 25
      Caption = 'Indexar 2 campos'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button6: TButton
      Left = 371
      Top = 9
      Width = 115
      Height = 25
      Caption = 'SetRange 1'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button1: TButton
      Left = 371
      Top = 35
      Width = 115
      Height = 25
      Caption = 'SetRange 2'
      TabOrder = 3
      OnClick = Button1Click
    end
    object btfilter1: TButton
      Left = 492
      Top = 9
      Width = 91
      Height = 25
      Caption = 'Filter 1'
      TabOrder = 4
      OnClick = btfilter1Click
    end
    object btfilter2: TButton
      Left = 492
      Top = 35
      Width = 91
      Height = 25
      Caption = 'Filter2'
      TabOrder = 5
      OnClick = btfilter2Click
    end
    object btlimpar: TButton
      Left = 492
      Top = 61
      Width = 91
      Height = 25
      Caption = 'remover filtros'
      TabOrder = 6
      OnClick = btlimparClick
    end
    object findk1: TButton
      Left = 587
      Top = 9
      Width = 75
      Height = 25
      Caption = 'findkey 1'
      TabOrder = 7
      OnClick = findk1Click
    end
    object locate2: TButton
      Left = 668
      Top = 34
      Width = 75
      Height = 25
      Caption = 'locate 2'
      TabOrder = 8
      OnClick = locate2Click
    end
    object locate1: TButton
      Left = 668
      Top = 9
      Width = 75
      Height = 25
      Caption = 'locate 1'
      TabOrder = 9
      OnClick = locate1Click
    end
    object findk2: TButton
      Left = 587
      Top = 34
      Width = 75
      Height = 25
      Caption = 'findkey 2'
      TabOrder = 10
      OnClick = findk2Click
    end
    object removeindex: TButton
      Left = 250
      Top = 35
      Width = 115
      Height = 25
      Caption = 'removeindex'
      TabOrder = 11
      OnClick = removeindexClick
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 420
    Top = 170
  end
  object DataSource1: TDataSource
    Left = 438
    Top = 88
  end
end
