@echo off
title ��Ү�Ĺ�����
color 3a
echo ------------------------
echo       ��Ү��Ʒ            
echo ------------------------
echo �Ƿ�Ҫ��������������ɫ��
choice /c YN /m "ȷ���밴 Y�����밴 N��"
if %errorlevel%==2 goto colorchange
if %errorlevel%==1 goto xuanzhe

:colorchange

echo ___________________________________________________________                                                            
echo ��һ��Ϊ�������ڶ�����Ϊ������ɫ��
echo ÿ�����ֿ���Ϊ�����κ�ֵ֮һ:                            
echo    0 = ��ɫ        8 = ��ɫ                                                                       
echo    1 = ��ɫ        9 = ����ɫ                                  
echo    2 = ��ɫ        A = ����ɫ                                  
echo    3 = ����ɫ    B = ��ǳ��ɫ                                
echo    4 = ��ɫ        C = ����ɫ                                  
echo    5 = ��ɫ        D = ����ɫ                                  
echo    6 = ��ɫ        E = ����ɫ                                  
echo    7 = ��ɫ        F = ����ɫ                                                             
echo ����: "COLOR fc" ����ɫ����������ɫ������ɫ��                          
echo ____________________________________________________________
set /p colorchange=������(01~fe):
color %colorchange%

:xuanzhe
cls
echo ------------------------
echo       ��Ү��Ʒ            
echo ------------------------
echo 1.���������ļ���׺��
echo 2.���Ľ�����ɫ
echo 3.У԰���Զ���¼
echo 4.�˳�
echo ����Ч�������ڴ���
set /p var3=������(1~4):
if %var3%==2 goto colorchange
if %var3%==3 goto autologin
if %var3%==4 goto end
if not %var3%==1  (
	echo ��������ȷ�����֣�
	pause
	goto xuanzhe
)
set /p var4=��������Ҫ���ĵ��ļ���·��(��Ҫ�����ţ�����):
if not exist %var4% (
	echo ��������ȷ��·����
	goto xuanzhe
)
echo ��ѡ����ĺ�׺��·��Ϊ%var4%��

pause


if %var3%==1 goto changetail
  
:changetail
set /p var1=����������ĵĺ�׺(txt,jpg,png,bat��):
set /p var2=��������ĺ�ĺ�׺(txt,jpg,png,bat��):
echo �Ƿ�Ҫ����Ŀ¼�������ļ�

choice /c YN /m "ȷ���밴 Y�����밴 N��"
if %errorlevel%==1 goto xunhuan
if %errorlevel%==2 goto buxunhuan

:xunhuan
echo ------------------------
echo      %var1%ת%var2%
echo ------------------------
set /a suijishu=%random% + 123123
setlocal enabledelayedexpansion
echo for /r %%%%i in (*.%var1%) do ( >> %var1%to%var2%%suijishu%.bat
echo ren %%%%i *.%var2% >> %var1%to%var2%%suijishu%.bat
echo ) >> %var1%to%var2%%suijishu%.bat
copy %var1%to%var2%%suijishu%.bat %var4%
choice /t 1 /d y /n >nul
del %var1%to%var2%%suijishu%.bat
::set var41=%var4%\%var1%to%var2%%suijishu%.bat
cd /d %var4%
call %var1%to%var2%%suijishu%.bat /c
choice /t 1 /d y /n >nul
del %var1%to%var2%%suijishu%.*
echo �������
goto final

:buxunhuan
set /a suijishu=%random% + 123123
echo ren *.%var1% *.%var2% > %var1%to%var2%%suijishu%.txt
ren %var1%to%var2%%suijishu%.txt %var1%to%var2%%suijishu%.bat
copy %var1%to%var2%%suijishu%.bat %var4%
choice /t 1 /d y /n >nul
del %var1%to%var2%%suijishu%.bat
echo ------------------------
echo      %var1%ת%var2%
echo ------------------------
set var41=%var4%\%var1%to%var2%%suijishu%.bat
cd /d %var4%
call %var1%to%var2%%suijishu%.bat /c
del %var1%to%var2%%suijishu%.*
echo �������
pause
goto final

:autologin
set /p user=�������˺�:
set /p pasd=����������:
echo ���ڴ������������ű���
echo set WshShell = CreateObject("wscript.Shell") >> autologin.txt
echo username=%user% >> autologin.txt
echo password=%pasd% >> autologin.txt
echo WshShell.Run("http://10.0.0.55/") >> autologin.txt
echo WScript.Sleep 2000 >> autologin.txt
echo WshShell.SendKeys "{TAB}" >> autologin.txt
echo WshShell.SendKeys "{TAB}" >> autologin.txt
echo WshShell.SendKeys "{TAB}" >> autologin.txt
echo WshShell.SendKeys "{TAB}" >> autologin.txt
echo WshShell.SendKeys "{TAB}" >> autologin.txt
echo WshShell.SendKeys "{TAB}" >> autologin.txt
echo WshShell.SendKeys "{TAB}" >> autologin.txt
echo WshShell.SendKeys "{TAB}" >> autologin.txt
echo WshShell.SendKeys username >> autologin.txt
echo WScript.Sleep 2000 >> autologin.txt
echo WshShell.SendKeys "{TAB}" >> autologin.txt
echo WshShell.SendKeys password>> autologin.txt
echo WshShell.SendKeys "{ENTER}" >> autologin.txt
ren autologin.txt autologin.vbs
choice /t 3 /d y /n >nul
echo ������ϣ�ֻ��˫������autologin.vbs����
pause

:final
echo �Ƿ񷵻������棿
choice /c YN /m "ȷ���밴 Y�����밴 N��"
if %errorlevel%==1 goto xuanzhe
if %errorlevel%==2 goto end

:end
echo ��л����ʹ�á�                                                                                                    ����Ү��
pause