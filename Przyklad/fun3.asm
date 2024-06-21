title Average Subroutine    (fun3.asm)

; This subroutine links to Visual C++ 6.0.

.386P
.model flat
public _fun3

.code
_fun3 proc near
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
    jge    calculate_average ; If index >= count, jump to calculate_average
    add    eax, [esi + ebx*4] ; Add array element to sum
    inc    ebx               ; Increment index
    jmp    sum_loop          ; Repeat loop

calculate_average:
    ; Check if count is zero to avoid division by zero
    test   ecx, ecx
    jz     zero_count        ; If count is zero, jump to zero_count

    cdq                      ; Sign-extend eax into edx:eax
    idiv   ecx               ; Divide sum (edx:eax) by count

    ; Result (average) is in eax
    pop    esi
    pop    edx
    pop    ebx
    pop    ecx
    pop    ebp
    ret

zero_count:
    ; If count is zero, return 0 (or handle the error as needed)
    xor    eax, eax          ; Clear eax (result = 0)
    pop    esi
    pop    edx
    pop    ebx
    pop    ecx
    pop    ebp
    ret

_fun3 endp
end
