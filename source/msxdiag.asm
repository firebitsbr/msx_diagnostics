;***********************************************************
;
;   MSX DIAGNOSTICS
;   Version 0.9.0-a
;	ASM Z80 MSX
;
;	(cc) 2018-2020 Cesar Rincon "NightFox"
;	https://nightfoxandco.com
;
;
;	Compilar con asMSX 0.19 o superior
;	https://github.com/Fubukimaru/asMSX
;
;***********************************************************





;***********************************************************
; Directivas para el compilador
;***********************************************************

; ----------------------------------------------------------
; Directivas de principales
; ----------------------------------------------------------

.BIOS					; Nombres de las llamadas a BIOS

OUTPUT_FORMAT_BINARY = 1	; Formato de salida binario de BASIC
OUTPUT_FORMAT_ROM = 2		; Formato de salida ROM



; ----------------------------------------------------------
; Selecciona la directiva de compilacion (descomentar)
; ----------------------------------------------------------

;.INCLUDE "formats/f_binary.asm"		; Binario de BASIC
.INCLUDE "formats/f_rom.asm"			; Cartucho ROM




;***********************************************************
; Programa
;***********************************************************

PROGRAM_START_ADDRESS:

	; ----------------------------------------------------------
	; Punto de incicio
	; ----------------------------------------------------------

	IF (OUTPUT_FORMAT == OUTPUT_FORMAT_ROM)
		.SEARCH			; Busca un punto de inicio valido
	ENDIF


	; ----------------------------------------------------------
	; Ejecuta el programa
	; ----------------------------------------------------------

	; Ejecuta el programa
	jp FUNCTION_MAIN

	; Punto final del programa
	ret


	; ----------------------------------------------------------
	; Definicion de constantes
	; ----------------------------------------------------------

	.INCLUDE "ngn/ngn_consts.asm"	; Constantes de N'gine
	.INCLUDE "prog/consts.asm"		; Constantes del programa



	; ----------------------------------------------------------
	; Codigo principal
	; ----------------------------------------------------------

	; Archivo principal
	.INCLUDE "prog/main.asm"

	; Pantalla de bienvenida
	.INCLUDE "prog/welcome.asm"
	; Menu principal
	.INCLUDE "prog/main_menu.asm"
	; Test SCREEN 0
	.INCLUDE "prog/screen0_test.asm"
	; Test SCREEN 1
	.INCLUDE "prog/screen1_test.asm"
	; Test SCREEN 2
	.INCLUDE "prog/screen2_test.asm"
	; Test SCREEN 3
	.INCLUDE "prog/screen3_test.asm"
	; Test SPRITES
	.INCLUDE "prog/sprites_test.asm"
	; Test KEYBOARD
	.INCLUDE "prog/keyboard_test.asm"
	; Test JOYSTICK
	.INCLUDE "prog/joystick_test.asm"
	; Test PSG
	.INCLUDE "prog/psg_test.asm"

	; Procesos comunes
	.INCLUDE "prog/system.asm"
	.INCLUDE "prog/sfx.asm"
	
	

	; ----------------------------------------------------------
	; Libreria N'gine
	; ----------------------------------------------------------

	.INCLUDE "ngn/ngn.asm"



	; ----------------------------------------------------------
	; Datos del programa
	; ----------------------------------------------------------

	; Imagenes de fondo
	.INCLUDE "data/bg/bg_ngnlogo.asm"			; Total de datos: 2554 bytes
	.INCLUDE "data/bg/bg_line_pattern_b.asm"	; Total de datos: 922 bytes
	.INCLUDE "data/bg/bg_line_pattern_w.asm"	; Total de datos: 904 bytes
	.INCLUDE "data/bg/bg_color_bars.asm"		; Total de datos: 1158 bytes
	.INCLUDE "data/bg/bg_hello.asm"				; Total de datos: 1003 bytes
	.INCLUDE "data/bg/bg_joytest.asm"			; Total de datos: 560 bytes

	; Sprites
	.INCLUDE "data/sprite/ball_16x16.asm"		; Total de datos: 34 bytes
	.INCLUDE "data/sprite/spr_joytest.asm"		; Total de datos: 162 bytes

	; Datos miscelaneos
	.INCLUDE "data/bin/misc.asm"

	; Textos del programa
	.INCLUDE "data/txt/text.asm"
	.INCLUDE "data/txt/key_names.asm"



;***********************************************************
; Fin del archivo
;***********************************************************
MSXDIAG_EOF: