
   $PIDs = ProcessList('steamPeso.exe') ;Возвращает двумерный массив, содержащий список выполняемых процессов (имя и PID).
   For $i = 1 To $PIDs[0][0] ;$PIDs[0][0] - это количество процессов
      If ProcessExists($PIDs[$i][1]) Then ProcessClose($PIDs[$i][1]) ;Если процесс существует, то закрываем его
	  Next

   $PIDs = ProcessList('steam.exe') ;Возвращает двумерный массив, содержащий список выполняемых процессов (имя и PID).
   For $i = 1 To $PIDs[0][0] ;$PIDs[0][0] - это количество процессов
      If ProcessExists($PIDs[$i][1]) Then ProcessClose($PIDs[$i][1]) ;Если процесс существует, то закрываем его
   Next
 
 	  
	  	     $PIDs3 = ProcessList('steamwebhelper.exe') ;Возвращает двумерный массив, содержащий список выполняемых процессов (имя и PID).
   For $i = 1 To $PIDs3[0][0] ;$PIDs[0][0] - это количество процессов
      If ProcessExists($PIDs3[$i][1]) Then ProcessClose($PIDs3[$i][1]) ;Если процесс существует, то закрываем его
	  Next
	  
	     $PIDs4 = ProcessList('GameOverlayUI.exe') ;Возвращает двумерный массив, содержащий список выполняемых процессов (имя и PID).
   For $i = 1 To $PIDs4[0][0] ;$PIDs[0][0] - это количество процессов
      If ProcessExists($PIDs4[$i][1]) Then ProcessClose($PIDs4[$i][1]) ;Если процесс существует, то закрываем его
	  Next
	  	     $PIDs5 = ProcessList('justSteam.exe') ;Возвращает двумерный массив, содержащий список выполняемых процессов (имя и PID).
   For $i = 1 To $PIDs5[0][0] ;$PIDs[0][0] - это количество процессов
      If ProcessExists($PIDs5[$i][1]) Then ProcessClose($PIDs5[$i][1]) ;Если процесс существует, то закрываем его
	  Next
Exit