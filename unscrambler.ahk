RAlt::
InputBox, scrambledWord, Unscrambler, Please enter the word that needs to be unscrambled: ; Capture word
UrlDownloadToFile % "http://www.anagrammer.com/scrabble/" . scrambledWord, garb.txt ; Insert input to URL and download HTML contents of that URL, save to garb.txt
FileRead, info, garb.txt 
x:=RegExMatch(info,"Oi)" StrLen(scrambledWord) " letters out of ") 
y:=RegExMatch(info,"Oi)<a.*?>.*?</a>", second, x)
z:=RegExMatch(second.value,"O)[A-Z]+", unscrambledWord) ; Parsing garb.txt until unscrambled word is isolated
final:=unscrambledWord.value 
MsgBox, %final% 
FileDelete, garb.txt ; delete temp files
Return




