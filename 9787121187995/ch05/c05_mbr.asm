mov ax, 0x03
int 0x10

mov ax, 0xb800
mov es, ax

mov byte [es:0x00], 'G'

hlt

      times 510-($-$$) db 0
                       db 0x55, 0xaa