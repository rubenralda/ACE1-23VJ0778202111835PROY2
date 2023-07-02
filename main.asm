NADA        equ      00
JUGADOR     equ      01
PARED       equ      02
CAJA        equ      03
OBJETIVO    equ      04
SUELO       equ      05
.MODEL SMALL
.RADIX 16
.STACK
.DATA
dim_sprite_jug    db   08, 08
data_sprite_jug   db   14, 14, 0a, 0a, 0e, 0e, 2B, 14
                  db   14, 1D, 0a, 0e, 5B, 0e, 0e, 2B
                  db   02, 1D, 5B, 0e, 00, 5C, 14, 14
                  db   14, 1D, 14, 5B, 5B, 5C, 5C, 14
                  db   14, 1D, 0a, 0a, 5B, 02, 14, 1D
                  db   35, 35, 35, 06, 2B, 06, 02, 1D
                  db   14, 5B, 02, 0a, 0a, 02, 14, 1D
                  db   14, 14, 06, 14, 14, 06, 14, 14
dim_sprite_flcha  db   08, 08
data_sprite_flcha   db   00, 00, 03, 00, 00, 00, 00, 00
                    db   00, 00, 03, 03, 00, 00, 00, 00
                    db   03, 03, 03, 03, 03, 00, 00, 00
                    db   03, 03, 03, 03, 03, 03, 00, 00
                    db   03, 03, 03, 03, 03, 03, 00, 00
                    db   03, 03, 03, 03, 03, 00, 00, 00
                    db   00, 00, 03, 03, 00, 00, 00, 00
                    db   00, 00, 03, 00, 00, 00, 00, 00
dim_sprite_vacio  db   08, 08
data_sprite_vacio db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
dim_sprite_suelo  db   08, 08
data_sprite_suelo db   14, 14, 14, 14, 14, 14, 14, 14
                  db   14, 14, 14, 14, 14, 14, 14, 14
                  db   14, 14, 14, 14, 14, 14, 14, 14
                  db   14, 14, 14, 14, 14, 14, 14, 14
                  db   14, 14, 14, 14, 14, 14, 14, 14
                  db   14, 14, 14, 14, 14, 14, 14, 14
                  db   14, 14, 14, 14, 14, 14, 14, 14
                  db   14, 14, 14, 14, 14, 14, 14, 14
dim_sprite_pared  db   08, 08
data_sprite_pared db   35, 35, 0f, 0f, 35, 35, 0f, 0f
                  db   35, 0f, 0f, 35, 35, 0f, 0f, 35
                  db   0f, 0f, 35, 35, 0f, 0f, 35, 35
                  db   0f, 35, 35, 0f, 0f, 35, 35, 0f
                  db   35, 35, 0f, 0f, 35, 35, 0f, 0f
                  db   35, 0f, 0f, 35, 35, 0f, 0f, 35
                  db   0f, 0f, 35, 35, 0f, 0f, 35, 35
                  db   0f, 35, 35, 0f, 0f, 35, 35, 0f
dim_sprite_caja   db   08, 08
data_sprite_caja  db  14,14,14,14,14,14,14,14
                  db  14,14,12,12,12,11,14,14
                  db  14,12,12,12,11,11,00,14
                  db  14,12,12,11,11,11,00,14
                  db  14,12,11,11,11,00,00,14
                  db  14,11,11,11,00,00,00,14
                  db  14,14,00,00,00,00,14,14
                  db  14,14,14,14,14,14,14,14
dim_sprite_obj    db   08, 08
data_sprite_obj   db  14,14,14,14,14,14,14,14
                  db  14,28,14,14,14,14,28,14
                  db  14,14,28,14,14,28,14,14
                  db  14,14,14,28,28,14,14,14
                  db  14,14,14,28,28,14,14,14
                  db  14,14,28,14,14,28,14,14
                  db  14,28,14,14,14,14,28,14
                  db  14,14,14,14,14,14,14,14
mapa              db   3e8 dup (0)
mensaje_iniciar_juego db "INICIAR JUEGO$"
cargar_nivel  db "CARGAR NIVEL$"
mensaje_configuracion db "CONFIGURACION$"
puntajes      db "PUNTAJES ALTOS$"
salir         db "SALIR$"
iniciales     db "RARM - 202111835$"
;; JUEGO
xJugador      db 0
yJugador      db 0
puntos        dw 0
;; MENÚS
opcion        db 0
maximo        db 0
xFlecha       dw 0
yFlecha       dw 0
;; NIVELES
nivel_1	 db  "NIV.00", 00
nivel_2  db  "NIV.01", 00
nivel_3  db  "NIV.10", 00
nivel_actual db 00
handle_nivel      dw  0000
linea             db  100 dup (0)
elemento_actual   db  0
xElemento         db  0
yElemento         db  0
;; TOKENS
tk_pared      db  05,"pared"
tk_suelo      db  05,"suelo"
tk_jugador    db  07,"jugador"
tk_caja       db  04,"caja"
tk_objetivo   db  08,"objetivo"
tk_coma       db  01,","
;;
numero        db  5 dup (30), "$"
; mensaje inicial
mensaje_inicial db "USAC-Ingenieria", 0a, "$"
mensaje_inicial1	db "Ruben Alejando Ralda Mejia", 0a, "$"
mensaje_inicial2	db "20211835", "$"
; punteo
punteo_partida dw 0
; info pantalla
hora db 0
min db 0
segundo db 0
separador_dos_puntos db ":$"
contador_hora db 0
contador_min db 0
contador_segundo db 0
; pausa
mensaje_continuar_juego db "Continuar juego$"
mensaje_salir_juego db "Salir al menu$"
; nivel arbitrario
buffer_nombre_nivel db 20, 00
	db 20 dup(0)
mensaje_pedir_nivel db "Nombre Archivo: $"
; configuracion
mensaje_actuales db "Controles actuales$"
mensaje_arriba db "Arriba: $"
mensaje_abajo db "Abajo: $"
mensaje_izquierda db "Izquierda: $"
mensaje_Derecha db "Derecha: $"
control_arriba    db  48, 00, "$"
control_abajo     db  50, 00, "$"
control_izquierda db  4b, 00, "$"
control_derecha   db  4d, 00, "$"
arriba_scan db 0 ; 0 -> scan code, 1 -> caracter
abajo_scan db 0 ; 0 -> scan code, 1 -> caracter
izquierda_scan db 0 ; 0 -> scan code, 1 -> caracter
derecha_scan db 0 ; 0 -> scan code, 1 -> caracter
control_arriba_carac    db  "FLECHA ARRIBA$"
control_abajo_carac     db  "FLECHA ABAJO$"
control_izquierda_carac db  "FLECHA IZQUIERDA$"
control_derecha_carac   db  "FLECHA DERECHA$"
opcion_confi        db 0

.CODE
.STARTUP
mensaje_de_inicio:
	;; MODO VIDEO ;;
	mov AH, 00
	mov AL, 13
	int 10
	;;;;;;;;;;;;;;;;
	; mensaje inicial
	mov DL, 0d
	mov DH, 0a
	mov BH, 00
	mov AH, 02
	int 10 ;; <<-- posicionar el cursor
	push DX
	mov DX, offset mensaje_inicial
	mov AH, 09
	int 21
	pop DX
	;
	add DH, 02
	mov DL, 07
	mov BH, 00
	mov AH, 02
	int 10
	push DX
	mov DX, offset mensaje_inicial1
	mov AH, 09
	int 21
	pop DX
	add DH, 02
	mov DL, 10
	mov BH, 00
	mov AH, 02
	int 10
	push DX
	mov DX, offset mensaje_inicial2
	mov AH, 09
	int 21
	pop DX
	call delay
	call delay
	call delay
	call delay
	call delay
	call delay
	call delay
	call delay
	; fin mensaje inicial
inicio:
	; reiniciar contadores
	mov [contador_hora], 00
	mov [contador_min], 00
	mov [contador_segundo], 00
	;
	call menu_principal
	mov AL, [opcion]
	;; > INICIAR JUEGO
	cmp AL, 0
	je iniciar_juego
	;; > CARGAR NIVEL
	cmp AL, 1
	je pedir_nombre_nivel
	;; > PUNTAJES ALTOS

	;; > CONFIGURACION
	cmp AL, 3
	je configuracion
	;; > SALIR
	cmp AL, 4
	je fin

;------------------------------------------Iniciar juego--------------------------
iniciar_juego:
	call clear_pantalla
	cmp [nivel_actual], 00
	je abrir_nivel1

abrir_nivel1:
	mov AL, 02
	mov DX, offset nivel_1
	mov AH, 3d
	int 21
	jc inicio
	mov [handle_nivel], AX
	call ciclo_lineas

abrir_nivel2:
	mov AL, 02
	mov DX, offset nivel_2
	mov AH, 3d
	int 21
	jc inicio
	mov [handle_nivel], AX
	call ciclo_lineas

abrir_nivel3:
	mov AL, 02
	mov DX, offset nivel_3
	mov AH, 3d
	int 21
	jc inicio
	mov [handle_nivel], AX
	call ciclo_lineas
	jmp inicio

;------------------------------------------Cargar nivel----------------------------
pedir_nombre_nivel:
	call clear_pantalla
	mov DL, 06 ;x
	mov DH, 0b ;y
	mov BH, 00
	mov AH, 02
	int 10 ; <- posicionar el cursor
    mov DX, offset mensaje_pedir_nivel
    mov AH, 09
    int 21 ; imprimir
    mov DX, offset buffer_nombre_nivel
    mov AH, 0a
    int 21
    ; verificar que el tamaño sea mayor 0
    mov DI, offset buffer_nombre_nivel
    inc DI
    mov AL, [DI]
    cmp AL, 00
    je pedir_nombre_nivel
	; quitar el salto de linea
	inc DI
	mov AH, 00
	add DI, AX
	mov [DI], AH
	; abrir archivo
	mov AL, 02
	mov DX, offset buffer_nombre_nivel
	add DX, 02
	mov AH, 3d
	int 21
	jc inicio
	mov [handle_nivel], AX
	jmp ciclo_lineas

;---------------------------------------------ciclo lineas-------------------------
; entrada:
; [handle_nivel] 
; salida:
; carga los datos del nivel del archivo
ciclo_lineas:
	mov BX, [handle_nivel]
	call siguiente_linea
	cmp DL, 0ff      ;; fin-del-archivo?
	je fin_parseo
	cmp DH, 00      ;; línea-con-algo?
	je ciclo_lineas
	;;;;;;;;;;;;;;;;;;;;;;;
	;; lógica del parseo ;;
	;;;;;;;;;;;;;;;;;;;;;;;
	;; al principio del buffer de la línea está: pared, caja, jugador, suelo, objetivo
	mov DI, offset linea
	push DI
	mov SI, offset tk_pared
	call cadena_igual
	cmp DL, 0ff               ;; cadenas iguales
	je es_pared
	pop DI
	push DI
	mov SI, offset tk_caja
	call cadena_igual
	cmp DL, 0ff               ;; cadenas iguales
	je es_caja
	pop DI
	push DI
	mov SI, offset tk_suelo
	call cadena_igual
	cmp DL, 0ff               ;; cadenas iguales
	je es_suelo
	pop DI
	push DI
	mov SI, offset tk_objetivo
	call cadena_igual
	cmp DL, 0ff               ;; cadenas iguales
	je es_objetivo
	pop DI
	push DI
	mov SI, offset tk_jugador
	call cadena_igual
	cmp DL, 0ff               ;; cadenas iguales
	je es_jugador
	pop DI
	jmp ciclo_lineas
es_pared:
	mov AL, PARED
	mov [elemento_actual], AL
	jmp continuar_parseo0
es_caja:
	mov AL, CAJA
	mov [elemento_actual], AL
	jmp continuar_parseo0
es_suelo:
	mov AL, SUELO
	mov [elemento_actual], AL
	jmp continuar_parseo0
es_objetivo:
	mov AL, OBJETIVO
	mov [elemento_actual], AL
	jmp continuar_parseo0
es_jugador:
	mov AL, JUGADOR
	mov [elemento_actual], AL
	jmp continuar_parseo0
	;; ignorar espacios
continuar_parseo0:
	pop SI         ; ignorara valor inicial de DI
	mov AL, [DI]
	cmp AL, 20
	jne ciclo_lineas
	call ignorar_espacios
	;; obtener una cadena numérica
	call leer_cadena_numerica
	push DI
	mov DI, offset numero
	call cadenaAnum
	mov [xElemento], AL
	pop DI
	;; ignorar espacios
	mov AL, [DI]
	cmp AL, 20
	je continuar_parseo1
	cmp AL, ','
	je continuar_parseo2
	jmp ciclo_lineas
continuar_parseo1:
	;; ignorar espacios
	call ignorar_espacios
continuar_parseo2:
	;; obtener una coma
	mov SI, offset tk_coma
	call cadena_igual
	cmp DL, 0ff
	jne ciclo_lineas
	;; ignorar espacios
	mov AL, [DI]
	cmp AL, 20
	jne ciclo_lineas
	call ignorar_espacios
	;; obtener una cadena numérica
	call leer_cadena_numerica
	push DI
	mov DI, offset numero
	call cadenaAnum
	mov [yElemento], AL
	pop DI
	;; ignorar_espacios
	mov AL, [DI]
	cmp AL, 20
	jne ver_final_de_linea
	call ignorar_espacios
	;; ver si es el final de la cadena
ver_final_de_linea:
	mov AL, [DI]
	cmp AL, 00
	jne ciclo_lineas
	;; usar la información
	;;
	mov DL, [elemento_actual]
	mov AH, [xElemento]
	mov AL, [yElemento]
	call colocar_en_mapa
	mov AL, JUGADOR
	cmp AL, [elemento_actual]
	je guardar_coordenadas_jugador
	jmp ciclo_lineas
guardar_coordenadas_jugador:
	mov AH, [xElemento]
	mov AL, [yElemento]
	mov [xJugador], AH
	mov [yJugador], AL
	jmp ciclo_lineas
	;;;;;;;;;;;;;;;;;;;;;;;
fin_parseo:
	;; cerrar archivo
	mov AH, 3e
	mov BX, [handle_nivel]
	int 21
	; ---------Empezar la partida 
	; obtengo la hora de inicio
    mov AH, 2C
    int 21
	mov [segundo], DH

ciclo_juego:
	call pintar_mapa
	call mostrar_info_pantalla
	call entrada_juego
	cmp CL, 0ff
	jne ciclo_juego
	ret

;---------------------------------------configuracion------------------------------
configuracion:
	call menu_configuracion
	cmp [opcion_confi], 0
	je configurar_controles
	cmp [opcion_confi], 1
	je inicio
	jmp configuracion

configurar_controles:
	call clear_pantalla
	call imprimir_texto_configuracion
	;
	mov AH, 00
	int 16 ; leo un caracter
	mov DI, offset control_abajo
	call guardar_tecla_control
	;
	call clear_pantalla
	call imprimir_texto_configuracion
	call imprimir_valor_controles
	mov AH, 00
	int 16 ; leo un caracter
	mov DI, offset control_arriba
	call guardar_tecla_control
	;
	call clear_pantalla
	call imprimir_texto_configuracion
	call imprimir_valor_controles
	mov AH, 00
	int 16 ; leo un caracter
	mov DI, offset control_derecha
	call guardar_tecla_control
	;
	call clear_pantalla
	call imprimir_texto_configuracion
	call imprimir_valor_controles
	mov AH, 00
	int 16 ; leo un caracter
	mov DI, offset control_izquierda
	call guardar_tecla_control
	;
	jmp configuracion

; DI -> variable control
; AH = escan code
; AL = caracter si es 00 no se presiono uno
guardar_tecla_control:
	cmp AL, 00
	jne guardar_con_caracter
	; se guarda como scan code
	mov [DI], AH
	inc DI
	mov [DI], AL
	ret

guardar_con_caracter:
	mov AH, 00
	mov [DI], AH
	inc DI
	mov [DI], AL
	ret

;; imprime el valor de las teclas
imprimir_valor_controles:
	mov DL, 13 ; x: 19
	mov DH, 9 ; y: 9
	mov BH, 00
	mov AH, 02
	int 10 ; <- posicionar el cursor
	mov DI, offset control_arriba
	call imprimir_tecla_control
	;
	add DH, 02
	mov BH, 00
	mov AH, 02
	int 10
	;
	mov DI, offset control_abajo
	call imprimir_tecla_control
	;
	add DH, 02
	mov BH, 00
	mov AH, 02
	int 10
	;
	mov DI, offset control_izquierda
	call imprimir_tecla_control
	;
	add DH, 02
	mov BH, 00
	mov AH, 02
	int 10
	;
	mov DI, offset control_derecha
	call imprimir_tecla_control
	ret

imprimir_tecla_control:
	mov AL, [DI]
	cmp AL, 00
	je imprimir_normal_control
	cmp AL, 48
	je imprimir_arriba_confi
	cmp AL, 50
	je imprimir_abajo_confi
	cmp AL, 4B
	je imprimir_izquierda_confi
	cmp AL, 4D
	je imprimir_derecha_confi
	jmp imprimir_normal_control

imprimir_arriba_confi:
	mov DI, offset control_arriba_carac
	jmp fin_imprimir

imprimir_abajo_confi:
	mov DI, offset control_abajo_carac
	jmp fin_imprimir


imprimir_izquierda_confi:
	mov DI, offset control_izquierda_carac
	jmp fin_imprimir

imprimir_derecha_confi:
	mov DI, offset control_derecha_carac
	jmp fin_imprimir

imprimir_normal_control:
	inc DI
	jmp fin_imprimir

fin_imprimir:
	push DX
	mov DX, DI
	mov AH, 09
	int 21
	pop DX
	ret

;; muestra en pantalla la informacion sin poner el valor de teclas
imprimir_texto_configuracion:
	;; IMPRIMIR Informacion
	mov DL, 0c
	mov DH, 05
	mov BH, 00
	mov AH, 02
	int 10 ; <- posicionar el cursor
	push DX
	mov DX, offset mensaje_actuales
	mov AH, 09
	int 21
	pop DX
	;;;;
	add DH, 04
	mov DL, 07
	mov BH, 00
	mov AH, 02
	int 10
	push DX
	mov DX, offset mensaje_arriba
	mov AH, 09
	int 21
	pop DX
	;;;;
	add DH, 02
	mov BH, 00
	mov AH, 02
	int 10
	push DX
	mov DX, offset mensaje_abajo
	mov AH, 09
	int 21
	pop DX
	;;;;
	add DH, 02
	mov BH, 00
	mov AH, 02
	int 10
	push DX
	mov DX, offset mensaje_izquierda
	mov AH, 09
	int 21
	pop DX
	;;;;
	add DH, 02
	mov BH, 00
	mov AH, 02
	int 10
	push DX
	mov DX, offset mensaje_Derecha
	mov AH, 09
	int 21
	pop DX
	;;;; CONFIGURACION
	mov DL, 0c
	mov DH, 14 ; y
	mov BH, 00
	mov AH, 02
	int 10
	push DX
	mov DX, offset mensaje_configuracion
	mov AH, 09
	int 21
	pop DX
	;;
	;;;; SALIR
	add DH, 02
	mov BH, 00
	mov AH, 02
	int 10
	push DX
	mov DX, offset salir
	mov AH, 09
	int 21
	pop DX
	ret

;; menu_configuracion
;; ..
;; SALIDA
;;    - [opcion_confi] -> código numérico de la opción elegida
menu_configuracion:
	call clear_pantalla
	mov AL, 0
	mov [opcion_confi], AL ; reinicio de la variable de salida
	mov AX, 50
	mov BX, 0A0
	mov [xFlecha], AX
	mov [yFlecha], BX
	;;
	call imprimir_texto_configuracion
	call imprimir_valor_controles
	call pintar_flecha
	;;;;
	;; LEER TECLA
	;;;;
entrada_menu_configuracion:
	mov AH, 00
	int 16
	cmp AH, 48
	je restar_opcion_configuracion
	cmp AH, 50
	je sumar_opcion_configuracion
	cmp AH, 3b  ;; le doy F1
	je fin_menu_configuracion
	jmp entrada_menu_configuracion

restar_opcion_configuracion:
	mov AL, [opcion_confi]
	dec AL
	cmp AL, 0ff
	je volver_a_cero_confi
	mov [opcion_confi], AL
	jmp mover_flecha_menu_configuracion

sumar_opcion_configuracion:
	mov AL, [opcion_confi]
	mov AH, 2 ; numero opciones
	inc AL
	cmp AL, AH
	je volver_a_maximo_confi
	mov [opcion_confi], AL
	jmp mover_flecha_menu_configuracion

volver_a_cero_confi:
	mov AL, 0
	mov [opcion_confi], AL
	jmp mover_flecha_menu_configuracion

volver_a_maximo_confi:
	mov AL, 2 ; numero opciones
	dec AL
	mov [opcion_confi], AL
	jmp mover_flecha_menu_configuracion

mover_flecha_menu_configuracion:
	mov AX, [xFlecha]
	mov BX, [yFlecha]
	mov SI, offset dim_sprite_vacio
	mov DI, offset data_sprite_vacio
	call pintar_sprite
	mov AX, 50
	mov BX, 0A0
	mov CL, [opcion_confi]

ciclo_ubicar_flecha_menu_configuracion:
	cmp CL, 0
	je pintar_flecha_menu_configuracion
	dec CL
	add BX, 10
	jmp ciclo_ubicar_flecha_menu_configuracion

pintar_flecha_menu_configuracion:
	mov [xFlecha], AX
	mov [yFlecha], BX
	call pintar_flecha
	jmp entrada_menu_configuracion
	;;
fin_menu_configuracion:
	ret
;------------------------------------------------------------------------------
;; pintar_pixel - pintar un pixel
;; ENTRADA:
;;     AX --> x pixel
;;     BX --> y pixel
;;     CL --> color
;; SALIDA: pintar pixel
;; AX + 320*BX
pintar_pixel:
		push AX
		push BX
		push CX
		push DX
		push DI
		push SI
		push DS
		mov DX, 0a000
		mov DS, DX
		;; (
		;; 	posicionarse en X
		mov SI, AX
		mov AX, 140
		mul BX
		add AX, SI
		mov DI, AX
		;;
		mov [DI], CL  ;; pintar
		;; )
		pop DS
		pop SI
		pop DI
		pop DX
		pop CX
		pop BX
		pop AX
		ret

;; pintar_sprite - pinta un sprite
;; Entrada:
;;    - DI: offset del sprite
;;    - SI: offset de las dimensiones
;;    - AX: x sprite 320x200
;;    - BX: y sprite 320x200
pintar_sprite:
		push DI
		push SI
		push AX
		push BX
		push CX
		inc SI
		mov DH, [SI]  ;; vertical
		dec SI        ;; dirección de tam horizontal
		;;
inicio_pintar_fila:
		cmp DH, 00
		je fin_pintar_sprite
		push AX
		mov DL, [SI]
pintar_fila:
		cmp DL, 00
		je pintar_siguiente_fila
		mov CL, [DI]
		call pintar_pixel
		inc AX
		inc DI
		dec DL
		jmp pintar_fila
pintar_siguiente_fila:
		pop AX
		inc BX
		dec DH
		jmp inicio_pintar_fila
fin_pintar_sprite:
		pop CX
		pop BX
		pop AX
		pop SI
		pop DI
		ret

;; delay - subrutina de retardo
delay:
		push SI
		push DI
		mov SI, 0200
cicloA:
		mov DI, 0130
		dec SI
		cmp SI, 0000
		je fin_delay
cicloB:
		dec DI
		cmp DI, 0000
		je cicloA
		jmp cicloB
fin_delay:
		pop DI
		pop SI
		ret
		

;; clear_pantalla - limpia la pantalla
;; ..
;; ..
clear_pantalla:
		mov CX, 19  ;; 25
		mov BX, 00
clear_v:
		push CX
		mov CX, 28  ;; 40
		mov AX, 00
clear_h:
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		add AX, 08
		loop clear_h
		add BX, 08
		pop CX
		loop clear_v
		ret


;; menu_principal - menu principal
;; ..
;; SALIDA
;;    - [opcion] -> código numérico de la opción elegida
menu_principal:
	call clear_pantalla
	mov AL, 0
	mov [opcion], AL      ;; reinicio de la variable de salida
	mov AL, 5
	mov [maximo], AL
	mov AX, 50
	mov BX, 28
	mov [xFlecha], AX
	mov [yFlecha], BX
	;; IMPRIMIR OPCIONES ;;
	;;;; INICIAR JUEGO
	mov DL, 0c
	mov DH, 05
	mov BH, 00
	mov AH, 02
	int 10
	;; <<-- posicionar el cursor
	push DX
	mov DX, offset mensaje_iniciar_juego
	mov AH, 09
	int 21
	pop DX
	;;
	;;;; CARGAR NIVEL
	add DH, 02
	mov BH, 00
	mov AH, 02
	int 10
	push DX
	mov DX, offset cargar_nivel
	mov AH, 09
	int 21
	pop DX
	;;
	;;;; PUNTAJES ALTOS
	add DH, 02
	mov BH, 00
	mov AH, 02
	int 10
	push DX
	mov DX, offset puntajes
	mov AH, 09
	int 21
	pop DX
	;;
	;;;; CONFIGURACION
	add DH, 02
	mov BH, 00
	mov AH, 02
	int 10
	push DX
	mov DX, offset mensaje_configuracion
	mov AH, 09
	int 21
	pop DX
	;;
	;;;; SALIR
	add DH, 02
	mov BH, 00
	mov AH, 02
	int 10
	push DX
	mov DX, offset salir
	mov AH, 09
	int 21
	pop DX
	;;;;
	call pintar_flecha
	;;;;
	;; LEER TECLA
	;;;;
entrada_menu_principal:
	mov AH, 00
	int 16
	cmp AH, 48
	je restar_opcion_menu_principal
	cmp AH, 50
	je sumar_opcion_menu_principal
	cmp AH, 3b  ;; le doy F1
	je fin_menu_principal
	jmp entrada_menu_principal
restar_opcion_menu_principal:
		mov AL, [opcion]
		dec AL
		cmp AL, 0ff
		je volver_a_cero
		mov [opcion], AL
		jmp mover_flecha_menu_principal
sumar_opcion_menu_principal:
		mov AL, [opcion]
		mov AH, [maximo]
		inc AL
		cmp AL, AH
		je volver_a_maximo
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_cero:
		mov AL, 0
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_maximo:
		mov AL, [maximo]
		dec AL
		mov [opcion], AL
		jmp mover_flecha_menu_principal
mover_flecha_menu_principal:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 28
		mov CL, [opcion]
ciclo_ubicar_flecha_menu_principal:
		cmp CL, 0
		je pintar_flecha_menu_principal
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_principal
pintar_flecha_menu_principal:
		mov [xFlecha], AX
		mov [yFlecha], BX
		call pintar_flecha
		jmp entrada_menu_principal
		;;
fin_menu_principal:
		ret

;; pintar_flecha - pinta una flecha
pintar_flecha:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_flcha
		mov DI, offset data_sprite_flcha
		call pintar_sprite
		ret

;; adaptar_coordenada - 40x25->320x200
;; ENTRADA:
;;    AH -> x 40x25
;;    AL -> y 40x25
;; SALIDA:
;;    AX -> x 320x200
;;    BX -> y 320x200
adaptar_coordenada:
		mov DL, 08
		mov CX, AX
		mul DL
		mov BX, AX
		;;
		mov AL, CH
		mul DL
		ret
		
;; colocar_en_mapa - coloca un elemento en el mapa
;; ENTRADA:
;;    - DL -> código numérico del elemento
;;    - AH -> x
;;    - AL -> y
;; ...
colocar_en_mapa:
		mov CX, AX     ;;;   AH -> x -> CH
		mov BL, 28
		mul BL   ;; AL * BL  = AX
		mov CL, CH
		mov CH, 00     ;;; CX el valor de X completo
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov [DI], DL
		ret


;; obtener_de_mapa - obtiene un elemento en el mapa
;; ENTRADA:
;;    - AH -> x
;;    - AL -> y
;; SALIDA:
;;    - DL -> código numérico del elemento
obtener_de_mapa:
		mov CX, AX
		mov BL, 28
		mul BL
		mov CL, CH
		mov CH, 00
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov DL, [DI]
		ret


;; pintar_mapa - pinta los elementos del mapa
;; ENTRADA:
;; SALIDA:
pintar_mapa:
		mov AL, 01   ;; fila
		;;
ciclo_v:
		cmp AL, 18
		je fin_pintar_mapa
		mov AH, 00   ;; columna
		;;
ciclo_h:
		cmp AH, 28
		je continuar_v
		push AX
		call obtener_de_mapa
		pop AX
		;;
                cmp DL, NADA
		je pintar_vacio_mapa
		;;
                cmp DL, JUGADOR
		je pintar_jugador_mapa
		;;
                cmp DL, PARED
		je pintar_pared_mapa
		;;
                cmp DL, CAJA
		je pintar_caja_mapa
		;;
                cmp DL, OBJETIVO
		je pintar_objetivo_mapa
		;;
                cmp DL, SUELO
		je pintar_suelo_mapa
		;;
		jmp continuar_h
pintar_vacio_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_suelo_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_suelo
		mov DI, offset data_sprite_suelo
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_jugador_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_jug
		mov DI, offset data_sprite_jug
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_pared_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_pared
		mov DI, offset data_sprite_pared
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_caja_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_caja
		mov DI, offset data_sprite_caja
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_objetivo_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_obj
		mov DI, offset data_sprite_obj
		call pintar_sprite
		pop AX
		jmp continuar_h
continuar_h:
		inc AH
		jmp ciclo_h
continuar_v:
		inc AL
		jmp ciclo_v
fin_pintar_mapa:
		ret


;; mapa_quemado - mapa de prueba
mapa_quemado:
		mov DL, SUELO
		mov AH, 2
		mov AL, 2
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 3
		mov AL, 2
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 4
		mov AL, 2
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 2
		mov AL, 3
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 3
		mov AL, 3
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 4
		mov AL, 3
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 2
		mov AL, 4
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 3
		mov AL, 4
		call colocar_en_mapa
		mov DL, SUELO
		mov AH, 4
		mov AL, 4
		call colocar_en_mapa
		;;
		mov DL, JUGADOR
		mov AH, [xJugador]
		mov AL, [yJugador]
		call colocar_en_mapa
		;;
		mov DL, CAJA
		mov AH, 2
		mov AL, 3
		call colocar_en_mapa
		;;
		mov DL, OBJETIVO
		mov AH, 4
		mov AL, 2
		call colocar_en_mapa
		;;
		mov DL, PARED
		mov AH, 1
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 2
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 3
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 4
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 1
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 1
		mov AL, 2
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 2
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 1
		mov AL, 3
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 3
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 1
		mov AL, 4
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 4
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 1
		mov AL, 5
		call colocar_en_mapa

		mov DL, PARED
		mov AH, 2
		mov AL, 5
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 3
		mov AL, 5
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 4
		mov AL, 5
		call colocar_en_mapa
		mov DL, PARED
		mov AH, 5
		mov AL, 5
		call colocar_en_mapa
		ret


;; entrada_juego - manejo de las entradas del juego
;; salida:
;; CL -> 0FF finalizar partida
entrada_juego:
	mov AH, 01
	int 16
	jz fin_entrada_juego  ;; nada en el buffer de entrada
	mov AH, 00
	int 16
	;; AH <- scan code
	cmp AL, 00 ; significa que selecciono un caracter
	jne mover_con_caracter
	cmp AH, [control_arriba]
	je mover_jugador_arr
	cmp AH, [control_abajo]
	je mover_jugador_aba
	cmp AH, [control_izquierda]
	je mover_jugador_izq
	cmp AH, [control_derecha]
	je mover_jugador_der
	cmp AH, 3c ; f2
	je menu_pausa
	mov CL, 00 ; no salir
	ret

mover_con_caracter:
	mov DI, offset [control_arriba]
	inc DI
	cmp AL, [DI]
	je mover_jugador_arr
	mov DI, offset [control_abajo]
	inc DI
	cmp AL, [DI]
	je mover_jugador_aba
	mov DI, offset [control_izquierda]
	inc DI
	cmp AL, [DI]
	je mover_jugador_izq
	mov DI, offset [control_derecha]
	inc DI
	cmp AL, [DI]
	je mover_jugador_der
	mov CL, 00 ; no salir
	ret

mover_jugador_arr:
	mov AH, [xJugador]
	mov AL, [yJugador]
	dec AL
	; aqui se puede hacer algo generico!!!!!!!
	push AX
	call obtener_de_mapa
	pop AX
	;; DL <- elemento en mapa
	cmp DL, PARED
	je fin_entrada_juego ; no hago nada
	cmp DL, OBJETIVO
	je fin_entrada_juego ; tampoco hago nada
	cmp DL, CAJA
	je mover_caja_arriba

actualizar_arriba_jugador:	
	mov [xJugador], AH
	mov [yJugador], AL
	;;
	mov DL, JUGADOR
	push AX
	call colocar_en_mapa
	pop AX
	;;
	mov DL, SUELO
	inc AL
	call colocar_en_mapa
	mov CL, 00 ;no salir
	ret

mover_caja_arriba:
	push AX ; guardo las coordenadas de la caja y futuro movimiento jugador
	dec AL
	call obtener_de_mapa
	pop AX
	;; DL <- elemento en mapa
	cmp DL, PARED
	je fin_entrada_juego ; no hago nada
	cmp DL, CAJA
	je fin_entrada_juego ; no hago nada
	cmp DL, OBJETIVO
	je actualizar_conteo_cajas
	; unica opcion que sea suelo
	mov DL, CAJA
	push AX
	dec AL
	call colocar_en_mapa
	pop AX
	jmp actualizar_arriba_jugador

actualizar_conteo_cajas:
	; aqui restar la cantidad de cajas
	jmp actualizar_arriba_jugador

mover_jugador_aba:
	mov AH, [xJugador]
	mov AL, [yJugador]
	inc AL
	push AX
	call obtener_de_mapa
	pop AX
	;; DL <- elemento en mapa
	cmp DL, PARED
	je fin_entrada_juego
	mov [yJugador], AL
	;;
	mov DL, JUGADOR
	push AX
	call colocar_en_mapa
	pop AX
	;;
	mov DL, SUELO
	dec AL
	call colocar_en_mapa
	mov CL, 00 ;no salir
	ret

mover_jugador_izq:
	mov AH, [xJugador]
	mov AL, [yJugador]
	dec AH
	push AX
	call obtener_de_mapa
	pop AX
	;; DL <- elemento en mapa
	cmp DL, PARED
	je fin_entrada_juego
	mov [xJugador], AH
	;;
	mov DL, JUGADOR
	push AX
	call colocar_en_mapa
	pop AX
	;;
	mov DL, SUELO
	inc AH
	call colocar_en_mapa
	mov CL, 00 ;no salir
	ret

mover_jugador_der:
	mov AH, [xJugador]
	mov AL, [yJugador]
	inc AH
	push AX
	call obtener_de_mapa
	pop AX
	;; DL <- elemento en mapa
	cmp DL, PARED
	je fin_entrada_juego
	mov [xJugador], AH
	;;
	mov DL, JUGADOR
	push AX
	call colocar_en_mapa
	pop AX
	;;
	mov DL, SUELO
	dec AH
	call colocar_en_mapa
	mov CL, 00 ;no salir	
	ret

menu_pausa:
	call clear_pantalla
	;; IMPRIMIR OPCIONES ;;
	mov DL, 0c ; x
	mov DH, 0a ; y
	mov BH, 00
	mov AH, 02
	int 10 ; <-- posicionar el cursor
	push DX
	mov DX, offset mensaje_continuar_juego
	mov AH, 09
	int 21
	pop DX
	;;
	add DH, 02
	mov BH, 00
	mov AH, 02
	int 10
	push DX
	mov DX, offset mensaje_salir_juego
	mov AH, 09
	int 21
	pop DX
	;;
	mov AH, 08
    int 21 ; AL = CARACTER LEIDO
    cmp AL, 3c ; F2 ascii
    je reanudar_contador
    cmp AL, 73 ; s minúscula ascii
    je salir_juego
	jmp menu_pausa

salir_juego:
	mov CL, 0ff ; valor para salir
	je fin_entrada_juego

reanudar_contador:
	mov AH, 2C
    int 21
	mov [segundo], DH
	ret

fin_entrada_juego:
	ret


;; siguiente_linea - extrae la siguiente línea del archivo referenciado por el handle en BX
;; ENTRADA:
;;    - BX: handle
;; SALIDA:
;;    - [linea]: contenido de la línea que se extrajo, finalizada en 00 (nul0)
;;    - DL: si el archivo llegó a su fin
;;    - DH: la cantidad de caracteres en la línea
siguiente_linea:
		mov SI, 0000
		mov DI, offset linea
		;;
ciclo_sig_linea:
	mov AH, 3f
	mov CX, 0001
	mov DX, DI
	int 21
	cmp AX, 0000
	je fin_siguiente_linea
	mov AL, [DI]
	cmp AL, 0a
	je quitar_nl_y_fin
	cmp AL, 0D
    je quitar_nl_y_fin
	inc SI
	inc DI
	jmp ciclo_sig_linea
quitar_nl_y_fin:
		mov AL, 00
		mov [DI], AL
		mov DX, SI
		mov DH, DL
		mov DL, 00    ;; no ha finalizado el archivo
		ret
fin_siguiente_linea:
		mov DL, 0ff   ;; ya finalizó el archivo
		ret


;; cadena_igual - verifica que dos cadenas sean iguales
;; ENTRADA:
;;    - SI: cadena 1, con su tamaño en el primer byte
;;    - DI: cadena 2
;; SALIDA:
;;    - DL: 0ff si son iguales, 00 si no lo son
cadena_igual:
		mov CH, 00
		mov CL, [SI]
		inc SI
ciclo_cadena_igual:
		mov AL, [SI]
		cmp AL, [DI]
		jne fin_cadena_igual
		inc SI
		inc DI
		loop ciclo_cadena_igual
cadenas_son_iguales:
		mov DL, 0ff
		ret
fin_cadena_igual:
		mov DL, 00
		ret


;; ignorar_espacios - ignora una sucesión de espacios
;; ENTRADA:
;;    - DI: offset de una cadena cuyo primer byte se supone es un espacio
;; ...
ignorar_espacios:
ciclo_ignorar:
		mov AL, [DI]
		cmp AL, 20
		jne fin_ignorar
		inc DI
		jmp ciclo_ignorar
fin_ignorar:
		ret


;; memset - memset
;; ENTRADA:
;;    - DI: offset del inicio de la cadena de bytes
;;    - CX: cantidad de bytes
;;    - AL: valor que se pondrá en cada byte
memset:
		push DI
ciclo_memset:
		mov [DI], AL
		inc DI
		loop ciclo_memset
		pop DI
		ret


;; leer_cadena_numerica - lee una cadena que debería estar compuesta solo de números
;; ENTRADA:
;;    - DI: offset del inicio de la cadena numérica
;; SALIDA:
;;    - [numero]: el contenido de la cadena numérica
leer_cadena_numerica:
		mov SI, DI
		;;
		mov DI, offset numero
		mov CX, 0005
		mov AL, 30
		call memset
		;;
		mov DI, SI
		mov CX, 0000
ciclo_ubicar_ultimo:
		mov AL, [DI]
		cmp AL, 30
		jb copiar_cadena_numerica
		cmp AL, 39
		ja copiar_cadena_numerica
		inc DI
		inc CX
		jmp ciclo_ubicar_ultimo
copiar_cadena_numerica:
		push DI   ;;   <----
		dec DI
		;;
		mov SI, offset numero
		add SI, 0004
ciclo_copiar_num:
		mov AL, [DI]
		mov [SI], AL
		dec DI
		dec SI
		loop ciclo_copiar_num
		pop DI
		ret

;; cadenaAnum
;; ENTRADA:
;;    DI -> dirección a una cadena numérica
;; SALIDA:
;;    AX -> número convertido
;;;;
cadenaAnum:
		mov AX, 0000    ; inicializar la salida
		mov CX, 0005    ; inicializar contador
		;;
seguir_convirtiendo:
		mov BL, [DI]
		cmp BL, 00
		je retorno_cadenaAnum
		sub BL, 30      ; BL es el valor numérico del caracter
		mov DX, 000a
		mul DX          ; AX * DX -> DX:AX
		mov BH, 00
		add AX, BX 
		inc DI          ; puntero en la cadena
		loop seguir_convirtiendo
retorno_cadenaAnum:
		ret

;; numAcadena
;; ENTRADA:
;;     AX -> número a convertir    
;; SALIDA:
;;    [numero] -> numero convertido en cadena
numAcadena:
    mov CX, 0005
    mov DI, offset numero

ciclo_poner30s:
    mov BL, 30
    mov [DI], BL
    inc DI
    loop ciclo_poner30s
    ;; tenemos '0' en toda la cadena
    cmp AX, 0000
    je retorno_convertirAcadena
    mov CX, AX    ; inicializar contador
    mov DI, offset numero
    add DI, 0004
    
ciclo_convertirAcadena:
    mov BL, [DI]
    inc BL
    mov [DI], BL
    cmp BL, 3a
    je aumentar_siguiente_digito_primera_vez
    loop ciclo_convertirAcadena
    jmp retorno_convertirAcadena

aumentar_siguiente_digito_primera_vez:
	push DI

aumentar_siguiente_digito:
    mov BL, 30     ; poner en '0' el actual
    mov [DI], BL
    dec DI         ; puntero a la cadena
    mov BL, [DI]
    inc BL
    mov [DI], BL
    cmp BL, 3a
    je aumentar_siguiente_digito
    pop DI         ; se recupera DI
    loop ciclo_convertirAcadena
retorno_convertirAcadena:
	ret
;; informacion juego
;; salida: muestra en pantalla la informacion
mostrar_info_pantalla:
	mov DL, 00 ; x
	mov DH, 18 ; y
	mov BH, 00
	mov AH, 02
	int 10 ; cursor en la equina inferior izquierda
	;
	mov DX, offset iniciales
	mov AH, 09
	int 21
	;
	mov DL, 22 ; x
	mov DH, 00 ; y
	mov BH, 00
	mov AH, 02
	int 10 ; cursor en la equina superior derecha
	;
	mov AX, [punteo_partida]
	call numAcadena
	mov DX, offset numero
	mov AH, 09
	int 21
	;
	mov DL, 1E ; x
	mov DH, 18 ; y
	mov BH, 00
	mov AH, 02
	int 10 ; cursor en la equina inferior derecha
	; obtengo la hora
    mov AH, 2C
    int 21
	;
	mov AL, [segundo]
	mov [segundo], DH
	cmp DH, AL ; si el nuevo (DH) es menor
	jb sumar_60
	jmp actualizar_contador

sumar_60:
	add DH, 3C

actualizar_contador:
	sub DH, AL ; le resto al nuevo seg lo viejo
	add [contador_segundo], DH
	;
	cmp [contador_segundo], 3B ; 59 segundos
	jg sumar_minutos
	jmp mostrar_contador_juego
	
sumar_minutos:
	sub [contador_segundo], 3C
	add [contador_min], 1
	cmp [contador_min], 3B ; 59 minutos
	jg sumar_hora
	jmp mostrar_contador_juego

sumar_hora:
	sub [contador_min], 3C
	add [contador_hora], 1
	cmp [contador_hora], 17 ; 24 horas
	jg reiniciar_contador_juego
	jmp mostrar_contador_juego

reiniciar_contador_juego:
	mov [contador_hora], 00
	mov [contador_min], 00
	mov [contador_segundo], 00

mostrar_contador_juego:
	mov AH, 0
	mov AL, [contador_hora]
	call numAcadena
	mov DX, offset numero
	add DX, 3
	mov AH, 09
	int 21 ; imprime la hora
	mov DX, offset separador_dos_puntos
	mov AH, 09
	int 21 ; imprime
	;
	mov AH, 0
	mov AL, [contador_min]
	call numAcadena
	mov DX, offset numero
	add DX, 3
	mov AH, 09
	int 21 ; imprime el min
	mov DX, offset separador_dos_puntos
	mov AH, 09
	int 21 ; imprime
	;
	mov AH, 0
	mov AL, [contador_segundo]
	call numAcadena
	mov DX, offset numero
	add DX, 3
	mov AH, 09
	int 21 ; imprime
	ret



fin:
.EXIT
END
