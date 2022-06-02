.model small
.stack 100h
.data

.code
main proc
    mov ax, 0fh
    mov bx, 2
    mov dx, 22
    mul bx
    ;notice after multiplication dx become 0
    mov ah, 4ch
    int 21h
main endp
end main