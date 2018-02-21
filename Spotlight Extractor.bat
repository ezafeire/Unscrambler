@echo off
:START 
IF NOT EXIST C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets GOTO END2
IF NOT EXIST C:\Users\%username%\Desktop\temp GOTO NODIR 
cd C:\Users\%username%\Desktop\temp
del /q *.* 
copy "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets" "C:\Users\%username%\Desktop\temp"     >NUL
rename * *.jpg     
timeout 1         >NUL
set "TARGETDIR=."             
set "FILES=*.jpg"             
for /F "tokens=*" %%F in (' 
    robocopy "%TARGETDIR%" "%TARGETDIR%" "%FILES%" ^
        /L /IS /FP /NC /NS /NDL /NP /NJH /NJS ^
        /MIN:0 /MAX:200000
') do (
    del "%%F"
)  			       

goto END                      

:NODIR                         
@echo There's no directory folder ; creating one
mkdir C:\Users\%username%\Desktop\temp  
goto START  
:END
@echo All spotlights have been saved at %cd%
:END2
pause