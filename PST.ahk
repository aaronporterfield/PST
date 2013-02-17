#NoEnv
#Persistent
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%  
Menu Tray, icon, PST.ico


bkeyon = 0 
skeyon = 0
Gui, Color, FFFF00
Gui, Font, s14, Calibri
WinSet, TransColor, FFFF00 
Gui +AlwaysOnTop -Caption 

Gui, Add, Picture, x0 y0 w50 h50 GuiMove, png/PST.png

Gui, Add, Picture, x0 y50 w50 h50 gcl9, png/save.png
Gui, Add, Picture, x0 y100 w50 h50 gcl3, png/newlayer.png
Gui, Add, Picture, x0 y150 w50 h50 gcl1, png/copy.png
Gui, Add, Picture, x0 y200 w50 h50 gcl2, png/paste.png
Gui, Add, Picture, x0 y250 w50 h50 gcl10, png/ellipse.png
Gui, Add, Picture, x0 y300 w50 h50 gcl4, png/zoom.png
Gui, Add, Picture, x0 y350 w50 h50 gcl5, png/rotate.png
Gui, Add, Picture, x0 y400 w50 h50 vMypic gcl11, png/brushsize.png
Gui, Add, Picture, x0 y450 w50 h50 gcl6, png/brush.png
Gui, Add, Picture, x0 y500 w50 h50 gcl12, png/undo.png

Gui, Show, x40 y63 W50 H550 NoActivate
return

cl1:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
send ^{c}
return

cl2:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
send ^{v}
return

cl3:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
send +^{n}
return

cl4:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
send {z}
return

cl5:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
send {r}
return

cl6:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
send {b}
return

cl9:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
send ^{s}
return

cl10:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
send {n}
Gui, 2:Color, FFFF00
Gui, 2:Font, s14, Calibri
Gui 2:+AlwaysOnTop -Caption -ToolWindow 

Gui, 2:Add, Picture, x0 y0 w50 h50 GuiMove, png/ellipse_menu.png

Gui, 2:Add, Picture, x50 y0 w50 h50 gcl13, png/ellipse_scale.png
Gui, 2:Add, Picture, x100 y0 w50 h50 gcl14, png/ellipse_stroke.png
Gui, 2:Add, Picture, x150 y0 w50 h50 gcl15, png/ellipse_fill.png
Gui, 2:Add, Picture, x200 y0 w50 h50 gcl16, png/ellipse_done.png

Gui, 2:Show, x90 y313 W250 H50 NoActivate
return

cl11:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
if (bkeyon = 0){
send {Alt Down}
GuiControl,, Mypic, png/brushsize_on.png
bkeyon = 1
}
else {
send {Alt Up}
bkeyon = 0
GuiControl,, Mypic, png/brushsize.png
}  
return

cl12:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
send ^!{z}
return

cl13:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
if (skeyon = 0){
send ^{t}
skeyon = 1
}
else {
send {Enter}
skeyon = 0
}  
return

cl14:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
send ^!{.}
return

cl15:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
send ^!{,}
return

cl16:
ifWinExist, ahk_class Photoshop
WinActivate, ahk_class Photoshop
send ^!{/}
Gui, 2:Hide
return

uiMove:
PostMessage, 0xA1, 2,,, A
Return

GuiClose:
ExitApp