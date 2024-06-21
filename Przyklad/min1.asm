title The fun Subroutine    (fun3.asm)

; This subroutine links to Visual C++ 6.0.

.386P
.model flat
public _min1

.code
_min1 proc near   ;**********************
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]	; pierwszy argument funkcji
	sub eax, 1

    pop ebp
    ret                   
_min1 endp
end

