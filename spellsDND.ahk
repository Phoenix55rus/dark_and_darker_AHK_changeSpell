#Persistent
#NoEnv
#SingleInstance, Force

; Основные настройки
move_key := "q"  ; Клавиша, которая удерживается при перемещении мыши

; Горячие клавиши
move_top_center := "9"
move_top_left := "0"
move_bottom_left := "NumpadAdd"
move_bottom_right := "NumpadSub"
move_top_right := "="
exit_script := "F10"

; Определите центр экрана
SysGet, screen_width, 78
SysGet, screen_height, 79
center_x := screen_width // 2
center_y := screen_height // 2

; Определите регионы
regions := []
regions.push({name: "top_center", x: center_x - screen_width // 10, y: 0, width: screen_width // 5, height: screen_height // 3})
regions.push({name: "top_left", x: 0, y: 0, width: screen_width // 2, height: screen_height // 3})
regions.push({name: "top_right", x: screen_width // 2, y: 0, width: screen_width // 2, height: screen_height // 3})
regions.push({name: "bottom_left", x: 0, y: screen_height * 0.7, width: screen_width // 2, height: screen_height * 0.3})
regions.push({name: "bottom_right", x: screen_width // 2, y: screen_height * 0.7, width: screen_width // 2, height: screen_height * 0.3})

; Назначение горячих клавиш
Hotkey, %move_top_center%, MoveToTopCenter
Hotkey, %move_top_left%, MoveToTopLeft
Hotkey, %move_bottom_left%, MoveToBottomLeft
Hotkey, %move_bottom_right%, MoveToBottomRight
Hotkey, %move_top_right%, MoveToTopRight
Hotkey, %exit_script%, ExitApp

MoveToRegion(region) {
    global move_key, center_x, center_y
    x := region.x + region.width // 2
    y := region.y + region.height // 2
    Send, {%move_key% Down}
    MouseMove, %x%, %y%, 2
    Sleep, 10
    Send, {%move_key% Up}
}

MoveToTopCenter:
MoveToRegion(regions[1])
return

MoveToTopLeft:
MoveToRegion(regions[2])
return

MoveToBottomLeft:
MoveToRegion(regions[4])
return

MoveToBottomRight:
MoveToRegion(regions[5])
return

MoveToTopRight:
MoveToRegion(regions[3])
return

ExitApp:
ExitApp