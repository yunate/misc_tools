@echo off
CALL:funCommand "%1" "cal"  funRunExe calc.exe
CALL:funCommand "%1" "ph"   funRunExe "C:\Program Files\Process Hacker 2\ProcessHacker.exe"
CALL:funCommand "%1" "vsc"  funRunExe "C:\Users\denghuiyu\AppData\Local\Programs\Microsoft VS Code\Code.exe"
CALL:funCommand "%1" "vs"   funRunExe "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\devenv.exe"

:: end
GOTO:tagEND


::base functions
::命令行分支选择
:funCommand
    SETLOCAL enabledelayedexpansion
    SET funCommand_Res=F
    IF /I "%~1"=="%~2"        SET funCommand_Res=T
    IF /I "%~1"=="-%~2"       SET funCommand_Res=T
    IF /I "%~1"=="/%~2"       SET funCommand_Res=T
    IF "%funCommand_Res%"=="T" (
        SET funCommand_num=0
        SET funCommand_val=
        FOR %%i IN (%*) DO (
            SET /a funCommand_num+=1
            IF !funCommand_num! gtr 3 (
                SET funCommand_val=!funCommand_val!%%i 
            )
        )
        SET funCommand_valid=T
        CALL:%~3 !funCommand_val!
    )
    SETLOCAL disabledelayedexpansion
GOTO:EOF

:: 在exe目录下运行 exe
:funRunExe
    Set funRunExe_folder=%~dp1
    Set funRunExe_name=%~n1%~x1
    PUSHD "%funRunExe_folder%"
    START "" %1
    POPD
GOTO:EOF
:: end
:tagEND
