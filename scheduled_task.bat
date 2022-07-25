@ECHO OFF
SETLOCAL

SETLOCAL
    SET command_flag=false
    IF "%1"=="regist"                  SET command_flag=true & CALL:funcRegist
    IF "%1"=="runtask"                 SET command_flag=true & CALL:funcRunTask
    IF %command_flag%==false ECHO "no such command!"
ENDLOCAL

::end
GOTO:EOF

:funcRegist
SETLOCAL
    SET TIME_POINT=02:10
    SET fullTaskPath=%~dp0%~n0%~x0
    SET taskName=runtask
    CALL SCHTASKS /Create /TN fetch_edge /TR "%fullTaskPath% %taskName%" /ST %TIME_POINT% /SC DAILY /F
ENDLOCAL
GOTO:EOF

:funcRunTask
SETLOCAL
    calc.exe
ENDLOCAL
GOTO:EOF
