object FormApprove: TFormApprove
  Left = 0
  Top = 0
  Caption = 'FormApprove'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object DBGridRequests: TDBGrid
    Left = 8
    Top = 16
    Width = 529
    Height = 321
    DataSource = DataSourceRequests
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object ApplyButton: TButton
    Left = 32
    Top = 360
    Width = 169
    Height = 57
    Caption = #1044#1086#1079#1074#1086#1083#1080#1090#1080
    TabOrder = 1
    OnClick = BtnApproveClick
  end
  object RejectButton: TButton
    Left = 216
    Top = 360
    Width = 169
    Height = 57
    Caption = #1042#1110#1076#1093#1080#1083#1080#1090#1080
    TabOrder = 2
    OnClick = BtnRejectClick
  end
  object Button2: TButton
    Left = 543
    Top = 16
    Width = 48
    Height = 49
    Caption = '<-'
    TabOrder = 3
    OnClick = Button2Click
  end
  object FDQueryRequests: TFDQuery
    Left = 544
    Top = 16
  end
  object DataSourceRequests: TDataSource
    DataSet = FDQueryRequests
    Left = 544
    Top = 88
  end
  object FDQueryInsert: TFDQuery
    Left = 544
    Top = 48
  end
end
