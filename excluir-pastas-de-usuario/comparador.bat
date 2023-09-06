@setlocal enableextensions enabledelayedexpansion
@echo off
set deletavel=true

set str1=%1%
set str2=%1%

if not x%str1:admin=%==x%str1% (	
	set deletavel=false
	echo "%1% NAO SERA EXCLUIDO" >> log.txt 2>&1
)


if not x%str2:public=%==x%str2% (
	set deletavel=false
	echo "%1% NAO SERA EXCLUIDO" >> log.txt 2>&1
)


if "%deletavel%"=="true" (
	echo "%1% SERA EXCLUIDO" >> log.txt 2>&1
	rmdir /s /q "%1%" >> log.txt 2>&1
)
endlocal