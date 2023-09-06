@echo off  
echo Setting JAVA_HOME

:: Coloque aqui o endereço da pasta do JDK (não é o endereço da pasta BIN, apenas do JDK)
set "JAVA_HOME=C:\Program Files\Java\jdk1.7.0"  

setx -m JAVA_HOME "%JAVA_HOME%"
echo JAVA_HOME: %JAVA_HOME% 
echo setting PATH
    for /f "tokens=* delims=" %%a in ("%JAVA_HOME%\bin") do (
      if "%%~dpnfs$PATH:a" EQU "" (
       setx -m PATH "%JAVA_HOME%\bin;%Path%"
       PATH "%JAVA_HOME%\bin";%PATH%
      )
    )