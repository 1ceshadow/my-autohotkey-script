#Requires AutoHotkey v2

RCtrl::{                 ; CapsLock map to RCtrl
  ; 切换大小写
  current_state := GetKeyState("CapsLock", "T")  ; 获取CapsLock的状态
  SetCapsLockState(! current_state)              ; 取反状态
}

; Install the keyboard hook to capture the real key state of the keyboard
InstallKeybdHook(true)

; Disable the CapsLock key
SetCapsLockState("alwaysoff")

; Send esc key when Capslock is pressed as default
g_DoNotAbortSendEsc := true

$*Capslock::{                       ; Capture CapsLock key press
  global g_DoNotAbortSendEsc        ; use global variable g_DoNotAbortSendEsc
  g_DoNotAbortSendEsc := true       ; set g_DoNotAbortSendEsc to true
  Send("{LControl Down}")           ; send Ctrl key down
  KeyWait("CapsLock")               ; capture CapsLock key up
  Send("{LControl Up}")             ; send Ctrl key up
  if (A_PriorKey == "CapsLock"      ; if the last key is Capslock
     && g_DoNotAbortSendEsc) {      ; if the g_DoNotAbortSendEsc is true
    Send("{Esc}")                   ; send Esc key
  }
  return
}

; capture any key with Ctrl key down
~^*a:: ; * means can be used with any modifier key, ~ means donot block the original key, ^ means Ctrl key, a means the key is a
~^*b::
~^*c::
~^*d::
~^*e::
~^*f::
~^*g::
~^*h::
~^*i::
~^*j::
~^*k::
~^*l::
~^*m::
~^*n::
~^*o::
~^*p::
~^*q::
~^*r::
~^*s::
~^*t::
~^*u::
~^*v::
~^*w::
~^*x::
~^*y::
~^*z::
~^*1::
~^*2::
~^*3::
~^*4::
~^*5::
~^*6::
~^*7::
~^*8::
~^*9::
~^*0::
~^*Space::
~^*Backspace::
~^*Delete::
~^*Insert::
~^*Home::
~^*End::
~^*PgUp::
~^*PgDn::
~^*Tab::
~^*Enter::
~^*,::
~^*.::
~^*/::
~^*;::
~^*'::
~^*[::
~^*]::
~^*\::
~^*-::
~^*=::
~^*`::
~^*F1::
~^*F2::
~^*F3::
~^*F4::
~^*F5::
~^*F6::
~^*F7::
~^*F8::
~^*F9::
~^*F10::
~^*F11::
~^*F12::{
  global g_DoNotAbortSendEsc
  g_DoNotAbortSendEsc := false
}

; 下面的脚本 是 切换输入法用的，其实没什么用
/*
; default: ctrl + space --> Rshift
g_MapToRShift := true

$*RShift::{
  global g_MapToRShift
  g_MapToRShift := true
  if (A_PriorKey == "RShift" && g_MapToRShift) {
    Send("^{Space}")
  }
  return
}


~>+*a::
~>+*b::
~>+*c::
~>+*d::
~>+*e::
~>+*f::
~>+*g::
~>+*h::
~>+*i::
~>+*j::
~>+*k::
~>+*l::
~>+*m::
~>+*n::
~>+*o::
~>+*p::
~>+*q::
~>+*r::
~>+*s::
~>+*t::
~>+*u::
~>+*v::
~>+*w::
~>+*x::
~>+*y::
~>+*z::
~>+*1::
~>+*2::
~>+*3::
~>+*4::
~>+*5::
~>+*6::
~>+*7::
~>+*8::
~>+*9::
~>+*0::
~>+*Space::
~>+*Backspace::
~>+*Delete::
~>+*Insert::
~>+*Home::
~>+*End::
~>+*PgUp::
~>+*PgDn::
~>+*Tab::
~>+*Enter::
~>+*`;::
~>+*'::
~>+*[::
~>+*]::
~>+*`::
~>+*F1::
~>+*F2::
~>+*F3::
~>+*F4::
~>+*F5::
~>+*F6::
~>+*F7::
~>+*F8::
~>+*F9::
~>+*F10::
~>+*F11::
~>+*F12::
{
  
  global g_MapToRShift
  g_MapToRShift := false       ; 标记有其他键与右 Shift 一起按下
  return
}

; Emacs 风格按键模拟

; 上下左右
;^n::Send("{Down}")
;^p::Send("{Up}")
;^f::Send("{Right}")
;^b::Send("{Left}")

;^a::Send("{Home}")
;^e::Send("{End}")

!f::Send("^{Right}")
!b::Send("^{Left}")
!>::Send("^{Home}")
!<::Send("^{End}")
*/
