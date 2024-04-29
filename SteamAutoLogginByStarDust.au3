#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=c:\users\ilyar\desktop\farmrykami\form2.kxf
$gg = GUICreate("StarDustAutoSteamLoggin", 325, 119, -1, -1)
GUISetBkColor(0xA0A0A4)
$ButtonOk = GUICtrlCreateButton("Start", 22, 56, 123, 25, $BS_NOTIFY)
GUICtrlSetFont(-1, 12, 400, 0, "Cooper Black")
GUICtrlSetBkColor(-1, 0xC0DCC0)
$ButtonCancel = GUICtrlCreateButton("Close", 159, 56, 147, 25, $BS_NOTIFY)
GUICtrlSetFont(-1, 12, 400, 0, "Cooper Black")
GUICtrlSetBkColor(-1, 0x800000)
$AccNumber = GUICtrlCreateLabel("AccNumber", 8, 12, 85, 17, 0)
GUICtrlSetFont(-1, 10, 800, 0, "Lucida Console")
GUICtrlSetBkColor(-1, 0xA6CAF0)
GUICtrlSetCursor (-1, 0)
$AccnameInput = GUICtrlCreateInput("Input1", 104, 8, 201, 29)
GUICtrlSetFont(-1, 12, 800, 0, "Segoe UI")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $AccNumber
		Case $GUI_EVENT_CLOSE
			Exit
		Case $ButtonOk
			$accnumb = GUICtrlRead($AccnameInput) ; Прочитать текст из поля ввода
			ConsoleWrite("$accnumber = " & $accnumb & @CRLF)
			Run(@ScriptDir & '\' & 'BatAccFiles' & '\' & 'acc1.bat') ; запускаем батник: 1
			 $steam = FileReadLine(@ScriptDir & '\steamnames.au3', $accnumb) ;аккаунт стима номер: 1 
			$steampass = FileReadLine(@ScriptDir & '\steamaccspasswords.au3', $accnumb) ;пароль стима номер: 1 
			
			
			
			 WinWait("Войти в Steam", "", 120) ;ждём пока откроется окно ввода кода гуарда 120 секунд
			 Sleep(7000)
			 WinActivate("Войти в Steam")
			 WinMove("Войти в Steam", "", 0, 0, 705, 440)
			 Sleep(500)
			 ControlClick("Войти в Steam", 'left',  66, 139, 1)
			 MouseClick('left',  66, 139, 1)
			 ClipPut($steam)
			 Send('+{INS}')
			 Sleep(700)
			 
			 ControlClick("Войти в Steam", 'left',  66, 214, 1)
			 MouseClick('left',  66, 214, 1)
			 ClipPut($steampass)
			 Send('+{INS}')
			 
			 ControlClick("Войти в Steam", 'left',  245, 308, 1)
			 MouseClick('left',  245, 308, 1)
			 Sleep(2280)
			 WinActivate("Войти в Steam")
			 
			 
			 
			 
			WinActivate("Steam Desktop Authenticator", "") ;активируем окно с сда
			WinWaitActive("Steam Desktop Authenticator", "", 180);ждём пока окно откроется
			WinActivate("Steam Desktop Authenticator", "") ;активируем окно с сда
			WinWaitActive("Steam Desktop Authenticator") ;ждём пока окно откроется
			WinMove("Steam Desktop Authenticator", "", 1574, 545) ;перемещяем окно с сда для удобства
			ControlClick("Steam Desktop Authenticator", "", "[NAME:listAccounts]");кликаем по меню с никами акков в сда
			Send("{end}") ;к концу списка


			$steam2faexist = 'truee'
			$sda = ControlGetText ("Steam Desktop Authenticator", "", "[NAME:groupAccount]") ;получаем ник активного кода сда
			Send("{home}") ; к началу списка
			$a = ControlGetText ("Steam Desktop Authenticator", "", "[NAME:groupAccount]") ;получаем ник активного кода сда
			$b = 0 
			$c = "Account: " & $steam ; название акка из сда 
			if $a = $c Then ; если ник в сда совпадает с именем аккаунта в переменной $steam, то:
				$b = 1 ; б = 1
				EndIf ; закончить функцию иф
			While $b <>1  ; цикл который выполняется если $b больше или меньше 1
				Send("{down 1}") ; нажать 1 раз вниз
				$a = ControlGetText ("Steam Desktop Authenticator", "", "[NAME:groupAccount]") ; активный ник в сда
				if $a = $c Then ; если, то
					$b = 1 ; то б = 1
					EndIf ; закончить функцию иф
				if $b <> 1 and $a = $sda then ; 
					$steam2faexist = 'nonee'
				EndIf
			WEnd ; цикл while закончен
			if $steam2faexist = 'truee' Then
				$sdacode = ControlGetText("Steam Desktop Authenticator", "", "[NAME:txtLoginToken]") ;получаем гуард код
				ClipPut($sdacode) ;Записывает текст в буфер обмена.
				$steamtwofaccode = $sdacode
				WinSetState("Steam Desktop Authenticator", "", @SW_MINIMIZE) ; сворачивает сда
				
				WinActivate("Войти в Steam")
				Sleep(250)
				ControlClick('left',  230, 184, 1)
				WinActivate("Войти в Steam")
				Send('+{INS}') ;вставить текст
				  Send("{enter}")
				  Sleep(10000)
			EndIf
				 

				
		

		
	Case $ButtonCancel
		Run(@ScriptDir & "\closeSteam.exe")
		
	EndSwitch
WEnd
