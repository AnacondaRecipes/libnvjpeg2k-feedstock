@echo on
REM reset ERRORLEVEL inherited
ver > nul

if not exist "%PREFIX%" mkdir "%PREFIX%"
if errorlevel 1 exit /b 1

move lib\*.lib %LIBRARY_LIB%
if errorlevel 1 exit 1

move bin\*.dll %LIBRARY_BIN%
if errorlevel 1 exit 1

move include\* %LIBRARY_INC%
if errorlevel 1 exit 1
