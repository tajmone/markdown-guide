@ECHO OFF
ECHO ==============================================================================
ECHO                          WRITE PANDOC SPECS TO FILES                          
ECHO ==============================================================================
ECHO -------------------{ v1.1 (2017-02-11) by Tristano Ajmone }-------------------
ECHO ------------------------------------------------------------------------------
ECHO Extract lists of supported features from current version of pandoc and write
ECHO them to text files (containing pandoc version number in their name).
ECHO ------------------------------------------------------------------------------
::   ------------------------- GET PANDOC VERSION NUMBER --------------------------
::   ------------------------------------------------------------------------------
pandoc -v > tempFile
SET /P _TEMP_VAR= < tempFile
DEL tempFile
SET _PANDOCVER=%_TEMP_VAR:~7%
ECHO Pandoc version: %_PANDOCVER%
ECHO ------------------------------------------------------------------------------
::   ------------------------ EXTRACT INFOS TO TEXT FILES -------------------------
::   ------------------------------------------------------------------------------
pandoc --list-input-formats         > pandoc-%_PANDOCVER%-input-formats.txt
pandoc --list-output-formats        > pandoc-%_PANDOCVER%-output-formats.txt
pandoc --list-extensions            > pandoc-%_PANDOCVER%-markdown-extensions.txt
pandoc --list-highlight-languages   > pandoc-%_PANDOCVER%-highlight-languages.txt
pandoc --list-highlight-styles      > pandoc-%_PANDOCVER%-highlight-styles.txt
::   ------------------------------------------------------------------------------
::   ------------------------ PRINT OUT CREATED FILES LIST ------------------------
::   ------------------------------------------------------------------------------
ECHO The following files were created:
ECHO.
ECHO   pandoc-%_PANDOCVER%-input-formats.txt
ECHO   pandoc-%_PANDOCVER%-output-formats.txt
ECHO   pandoc-%_PANDOCVER%-markdown-extensions.txt
ECHO   pandoc-%_PANDOCVER%-highlight-languages.txt
ECHO   pandoc-%_PANDOCVER%-highlight-styles.txt
ECHO ------------------------------------------------------------------------------
EXIT /B
:: ==============================================================================
::                                   CHANGELOG                                   
:: ==============================================================================
:: v.1.1 (2017-02-11)
::	 -- pandoc v1.19.2.1
::   -- Start reading pandoc version number from 7th character instead of 11th.
::		(result of "pandoc -v" changed with pandoc v1.19.2.1)
:: v1.0 (2016-12-19)
::   -- First release.
::	 -- pandoc v1.19.1