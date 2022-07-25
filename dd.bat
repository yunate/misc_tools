@ECHO OFF
SETLOCAL
    SET command_flag=false
    IF "%1"=="test"         SET command_flag=true & CALL :funRunExe "C:\"
    IF "%1"=="cal"          SET command_flag=true & CALL :funRunExe "calc.exe"
    IF "%1"=="ph"           SET command_flag=true & CALL :funRunExe "C:\Program Files\Process Hacker 2\ProcessHacker.exe"
    IF "%1"=="vsc"          SET command_flag=true & CALL :funRunExe "C:\Users\denghuiyu\AppData\Local\Programs\Microsoft VS Code\Code.exe"
    IF "%1"=="vs"           SET command_flag=true & CALL :funRunExe "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\devenv.exe"

    IF %command_flag%==false ECHO "no such command!"
ENDLOCAL

:: end
GOTO:EOF

::base functions

:: 将参数展开
:: 第一个参数:返回值
:: 第二个参数:开始下标[包含]
:: :DDTEST
:: SETLOCAL
::     set params=
::     call:DDEXPAND_PARAMS params 1 %*
::     echo "%params%"
:: ENDLOCAL
:: GOTO:EOF
::
:: CALL:DDTEST 1 2 3 4 5 6 7
:: 输出 2 3 4 5 6 7 
:DDEXPAND_PARAMS
SETLOCAL enabledelayedexpansion
    SET num=0
    SET /a beg=%2+2
    SET val=
    FOR %%i IN (%*) DO (
        SET /a num+=1
        IF !num! gtr %beg% (
            SET val=!val!%%i 
        )
    )
ENDLOCAL & SET %1=%val%
GOTO:EOF

:: 输出
:funcPrint
    ECHO %1
GOTO:EOF

:: 在exe目录下运行 exe
:funRunExe
    SET folder=%~dp1
    SET name=%~n1%~x1
    PUSHD "%folder%"
    set params=
    call:DDEXPAND_PARAMS params 0 %*
    START "" %params% 
    POPD
GOTO:EOF
