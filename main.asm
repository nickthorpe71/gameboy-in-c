;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Mac OS X x86_64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _set_sprite_data
	.globl _joypad
	.globl _delay
	.globl _TILESET
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:11: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:15: set_sprite_data(0, 2, TILESET);
	ld	hl, #_TILESET
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;/Users/DreamMachine/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), #0x00
;/Users/DreamMachine/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/Users/DreamMachine/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, #0x4e
	ld	(hl+), a
	ld	(hl), #0x58
;main.c:18: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:20: while (1)
00107$:
;main.c:22: switch (joypad())
	call	_joypad
	ld	a, e
	dec	a
	jr	Z, 00102$
	ld	a,e
	cp	a,#0x02
	jr	Z, 00101$
	cp	a,#0x04
	jr	Z, 00103$
	sub	a, #0x08
	jr	Z, 00104$
	jr	00105$
;main.c:24: case J_LEFT:
00101$:
;/Users/DreamMachine/gbdk/include/gb/gb.h:1234: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
;/Users/DreamMachine/gbdk/include/gb/gb.h:1235: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	add	a, #0xf6
	ld	(bc), a
;main.c:26: break;
	jr	00105$
;main.c:27: case J_RIGHT:
00102$:
;/Users/DreamMachine/gbdk/include/gb/gb.h:1234: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;/Users/DreamMachine/gbdk/include/gb/gb.h:1235: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	add	a, #0x0a
	ld	(bc), a
;main.c:29: break;
	jr	00105$
;main.c:30: case J_UP:
00103$:
;/Users/DreamMachine/gbdk/include/gb/gb.h:1234: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;/Users/DreamMachine/gbdk/include/gb/gb.h:1235: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0xf6
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;main.c:32: break;
	jr	00105$
;main.c:33: case J_DOWN:
00104$:
;/Users/DreamMachine/gbdk/include/gb/gb.h:1234: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;/Users/DreamMachine/gbdk/include/gb/gb.h:1235: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0x0a
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;main.c:36: }
00105$:
;main.c:37: delay(50);
	ld	hl, #0x0032
	push	hl
	call	_delay
	add	sp, #2
;main.c:39: }
	jr	00107$
_TILESET:
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xe8	; 232
	.db #0x17	; 23
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xdf	; 223
	.db #0x20	; 32
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0x2f	; 47
	.db #0xd0	; 208
	.db #0xaf	; 175
	.db #0x50	; 80	'P'
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xdf	; 223
	.db #0x20	; 32
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xe8	; 232
	.db #0x17	; 23
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xdf	; 223
	.db #0x20	; 32
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0x2f	; 47
	.db #0xd0	; 208
	.db #0xaf	; 175
	.db #0x50	; 80	'P'
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xdf	; 223
	.db #0x20	; 32
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.area _CODE
	.area _CABS (ABS)
