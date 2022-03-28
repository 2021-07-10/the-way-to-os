    jmp near start
message db 'x', 0x04, 'y', 0x04
number db 0,0,0,0,0

start:

    mov ax, 0x7c0   ; 设置数据段
    mov ds, ax

    mov ax, 0xb800  ; 设置附件段
    mov es, ax

    cld
    mov si, message
    mov di, 0
    mov cx, (number-message)/2
    rep movsw

    mov ax, number

    ; 计算各个数位
    mov bx, ax
    mov cx, 5
    mov si, 10
digit:
    xor dx, dx
    div si
    mov [bx], dl
    inc bx
    loop digit

    ; 显示各个数位
    mov bx, number
    mov si,4 
show
  mov al, [bx+si]
  add al, 0x30
  mov ah, 0x04
  mov [es:di], ax
  add di, 2
  dec si
  jns show


    hlt

    times 510-($-$$) db 0
                     db 0x55, 0xaa