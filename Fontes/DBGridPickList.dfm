object frmDBGridPickList: TfrmDBGridPickList
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'DBGrid Pick List'
  ClientHeight = 309
  ClientWidth = 639
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object DBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 639
    Height = 309
    DataSource = DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridDrawColumnCell
    OnTitleClick = DBGridTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'LAST_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIRST_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CITY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATE'
        PickList.Strings = (
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RJ'
          'RN'
          'RS'
          'RO'
          'RR'
          'SC'
          'SP'
          'SE'
          'TO')
        Visible = True
      end>
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    FileName = 'M:\Projetos\DBGrid\Data\clients.xml'
    Params = <>
    Left = 24
    Top = 259
    object ClientDataSetLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
    end
    object ClientDataSetFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
    end
    object ClientDataSetCITY: TStringField
      FieldName = 'CITY'
    end
    object ClientDataSetSTATE: TStringField
      FieldName = 'STATE'
      Size = 2
    end
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 96
    Top = 259
  end
end
