RAlt::
Send ^a
clipboard=
Send ^c
ClipWait, 0
UrlDownloadToFile % "http://www.anagrammer.com/scrabble/" . clipboard , garb.txt 
FileRead, info, garb.txt 
x:=RegExMatch(info,"Oi)" StrLen(clipboard) " letters out of ") 
y:=RegExMatch(info,"Oi)<a.*?>.*?</a>", second, x)
z:=RegExMatch(second.value,"O)[A-Z]+", unscrambledWord) ;
final:=unscrambledWord.value 

if(final="ABBE"){
final:="BABE"
}if(final="DIRE"){
final:="RIDE"
}if(final="ANEMIC"){
final:="CINEMA"
}if(final="HARDY"){
final:="HYDRA"
}if(final="WEIR"){
final:="WIRE"
}if(final="CHAIN"){
final:="CHINA"
}if(final="CARET"){
final:="CRATE"
}if(final="MAPLES"){
final:="SAMPLE"
}if(final="ONAGER"){
final:="ORANGE"
}if(final="PERI"){
final:="PIER"
}if(final="FERLY"){
final:="FLYER"
}if(final="HEIR"){
final:="HIRE"
}if(final="ARDEB"){
final:="BREAD"
}if(final="ALTS"){
final:="LAST"
}if(final="NIPA"){
final:="PAIN"
}if(final="EATH"){
final:="HEAT"
}if(final="ALOFT"){
final:="FLOAT"
}if(final="SETT"){
final:="TEST"
}if(final="OURS"){
final:="SOUR"
}if(final="POONS"){
final:="SPOON"
}if(final="ASPS"){
final:="PASS"
}if(final="PRIDES"){
final:="SPIDER"
}if(final="ALES"){
final:="SALES"
}if(final="EMOTER"){
final:="REMOTE"
}if(final="LIEN"){
final:="LINE"
}if(final="HELO"){
final:="HOLE"
}if(final="FILLER"){
final:="REFILL"
}if(final="SALES"){
final:="LEASE"
}if(final="ALME"){
final:="MALE"
}if(final="CLOD"){
final:="COLD"
}if(final="DOTIER"){
final:="EDITOR"
}if(final="CAPE"){
final:="PACE"
}if(final="FORTS"){
final:="FROST"
}if(final="HEROS"){
final:="HORSE"
}if(final="CRISTA"){
final:="RACIST"
}if(final="DEAVE"){
final:="EVADE"
}if(final="MEOUS"){
final:="MOUSE"
}if(final="GINS"){
final:="SING"
}if(final="ERINGO"){
final:="IGNORE"
}if(final="CAGER"){
final:="GRACE"
}if(final="CREWS"){
final:="SCREW"
}if(final="DORP"){
final:="DROP"
}if(final="APOS"){
final:="SOAP"
}if(final="PEINS"){
final:="SPINE"
}
clipboard:=final
Send ^v
Send ^a
sleep 50
Sendinput {DELETE}
sleep 50
Sendinput {LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}}/uns{SPACE}
Send ^v
Sendinput {ENTER}
FileDelete, garb.txt ; delete temp files
Return

!2::
Sendinput t/enter{ENTER}
Sendinput t/exit{ENTER}
Return

!3::
Sendinput t/door{ENTER}
sleep 500
Sendinput t/lock{ENTER}
Return

!4::
Sendinput t/engine{ENTER}
Return

XButton1::
Sendinput t/pkr start{ENTER}
Return

XButton2::
Sendinput t/pkr nexthand{ENTER}
Return

!9::
StopWorking=0
counter=0
loop{
 if (StopWorking=1){
break
 }
Random, r, 301,632
sleep r
Sendinput t/EXAMINE %counter%{ENTER}
counter++
}
Return

!0::
StopWorking=1
Return

!7::
Sendinput t%counter%
Return
