title NWD Subroutine    (fun.asm)

; This subroutine links to Visual C++ 6.0.

.386P
.model flat
public _fun

.code
_fun proc near
    push   ebp
    mov    ebp, esp
    push   ecx
    push   ebx
    push   edx

    mov    eax, [ebp + 8]    ; Load first argument into eax (a)
    mov    ebx, [ebp + 12]   ; Load second argument into ebx (b)

gcd_loop:
    cmp    ebx, 0            ; Compare ebx (b) with 0
    je     done              ; If b == 0, jump to done
    mov    edx, 0            ; Clear edx before dividing
    div    ebx               ; Divide eax by ebx, quotient in eax, remainder in edx
    mov    eax, ebx          ; Move b into eax (a = b)
    mov    ebx, edx          ; Move remainder into ebx (b = remainder)
    jmp    gcd_loop          ; Repeat loop

done:
    ; Result is in eax (NWD)
    pop    edx
    pop    ebx
    pop    ecx
    pop    ebp
    ret

_fun endp
end
