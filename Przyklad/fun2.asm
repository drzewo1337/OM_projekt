title Sum Subroutine    (fun2.asm)

; This subroutine links to Visual C++ 6.0.

.386P
.model flat
public _fun2

.code
_fun2 proc near
    push   ebp
    mov    ebp, esp
    push   ecx
    push   ebx
    push   edx
    push   esi

    mov    ecx, [ebp + 12]   ; Load number of elements into ecx (y)
    mov    esi, [ebp + 8]    ; Load address of the array into esi (x)
    xor    eax, eax          ; Clear eax to use it as sum
    xor    ebx, ebx          ; Clear ebx to use it as index

sum_loop:
    cmp    ebx, ecx          ; Compare index with count
    jge    done              ; If index >= count, jump to done
    add    eax, [esi + ebx*4] ; Add array element to sum
    inc    ebx               ; Increment index
    jmp    sum_loop          ; Repeat loop

done:
    ; Result (sum) is in eax

    pop    esi
    pop    edx
    pop    ebx
    pop    ecx
    pop    ebp
    ret

_fun2 endp
end
