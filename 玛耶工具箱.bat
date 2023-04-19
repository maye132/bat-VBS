@echo off
title 玛耶的工具箱
color 3a
echo ------------------------
echo       玛耶出品            
echo ------------------------
echo 是否要跳过调整界面颜色？
choice /c YN /m "确认请按 Y，否请按 N。"
if %errorlevel%==2 goto colorchange
if %errorlevel%==1 goto xuanzhe

:colorchange

echo ___________________________________________________________                                                            
echo 第一个为背景，第二个则为文字颜色。
echo 每个数字可以为以下任何值之一:                            
echo    0 = 黑色        8 = 灰色                                                                       
echo    1 = 蓝色        9 = 淡蓝色                                  
echo    2 = 绿色        A = 淡绿色                                  
echo    3 = 湖蓝色    B = 淡浅绿色                                
echo    4 = 红色        C = 淡红色                                  
echo    5 = 紫色        D = 淡紫色                                  
echo    6 = 黄色        E = 淡黄色                                  
echo    7 = 白色        F = 亮白色                                                             
echo 例如: "COLOR fc" 亮白色背景，淡红色文字颜色。                          
echo ____________________________________________________________
set /p colorchange=请输入(01~fe):
color %colorchange%

:xuanzhe
cls
echo ------------------------
echo       玛耶出品            
echo ------------------------
echo 1.批量更改文件后缀名
echo 2.更改界面颜色
echo 3.校园网自动登录
echo 4.退出
echo 更多效果敬请期待。
set /p var3=请输入(1~4):
if %var3%==2 goto colorchange
if %var3%==3 goto autologin
if %var3%==4 goto end
if not %var3%==1  (
	echo 请输入正确的数字！
	pause
	goto xuanzhe
)
set /p var4=请输入需要更改的文件夹路径(不要带引号！！！):
if not exist %var4% (
	echo 请输入正确的路径！
	goto xuanzhe
)
echo 您选择更改后缀，路径为%var4%。

pause


if %var3%==1 goto changetail
  
:changetail
set /p var1=请输入待更改的后缀(txt,jpg,png,bat等):
set /p var2=请输入更改后的后缀(txt,jpg,png,bat等):
echo 是否要遍历目录下所有文件

choice /c YN /m "确认请按 Y，否请按 N。"
if %errorlevel%==1 goto xunhuan
if %errorlevel%==2 goto buxunhuan

:xunhuan
echo ------------------------
echo      %var1%转%var2%
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
echo 处理完毕
goto final

:buxunhuan
set /a suijishu=%random% + 123123
echo ren *.%var1% *.%var2% > %var1%to%var2%%suijishu%.txt
ren %var1%to%var2%%suijishu%.txt %var1%to%var2%%suijishu%.bat
copy %var1%to%var2%%suijishu%.bat %var4%
choice /t 1 /d y /n >nul
del %var1%to%var2%%suijishu%.bat
echo ------------------------
echo      %var1%转%var2%
echo ------------------------
set var41=%var4%\%var1%to%var2%%suijishu%.bat
cd /d %var4%
call %var1%to%var2%%suijishu%.bat /c
del %var1%to%var2%%suijishu%.*
echo 处理完毕
pause
goto final

:autologin
set /p user=请输入账号:
set /p pasd=请输入密码:
echo 正在创建快速启动脚本。
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
echo 创建完毕，只需双击启动autologin.vbs即可
pause

:final
echo 是否返回主界面？
choice /c YN /m "确认请按 Y，否请按 N。"
if %errorlevel%==1 goto xuanzhe
if %errorlevel%==2 goto end

:end
echo 感谢您的使用。                                                                                                    ┌玛耶┐
pause