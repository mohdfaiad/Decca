�
 TFMTESTUSER 0�  TPF0TfmTestUser
fmTestUserLeftMTop� WidthHeight� Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OnCreate
FormCreatePixelsPerInch`
TextHeight TSpeedButtonSpeedButton1Left� TopWidthHeight  TButtonButton1Left� TopPWidthKHeightCaptionButton1TabOrder OnClickButton1Click  TBitBtnBitBtn1Left8TopPWidthKHeightCaptionBitBtn1TabOrder  	TDatabasedbCommon	AliasNameCOMMON	Connected	DatabaseNamedbCommonLoginPromptParams.Strings+SERVER NAME=\\DECCANT\d:\deccadb\Common.gdbUSER NAME=SYSDBAOPEN MODE=READ/WRITESCHEMA CACHE SIZE=8LANGDRIVER=DB950TW0SQLQRYMODE=SERVER"SQLPASSTHRU MODE=SHARED AUTOCOMMITSCHEMA CACHE TIME=-1MAX ROWS=-1BATCH COUNT=200ENABLE SCHEMA CACHE=FALSESCHEMA CACHE DIR=ENABLE BCD=FALSEBLOBS TO CACHE=64BLOB SIZE=32PASSWORD=masterkey SessionNameDefaultLeft Top  TQueryquSelFuncAppCachedUpdates	DatabaseNamedbCommonSQL.Stringsselect * fromuser_prg"where Company_ID = :Company_ID and      User_ID = :User_ID and      Program_ID = :Program_ID  Params.Data
.     
Company_ID    User_ID    
Program_ID    LeftpTop  TDataSourcedsSelFuncAppDataSetquSelFuncAppLeftpTop0   