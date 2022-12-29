; Calculate the number of days until the next full moon
; Input:
;  EAX = current day of the month (1-31)
;  EBX = current month (1-12)
;  ECX = current year
; Output:
;  EAX = number of days until the next full moon

fullMoon:
    push ebx       ; Save the current month on the stack
    push ecx       ; Save the current year on the stack
    push edi       ; Save the value of EDI on the stack

    mov edi, 0     ; Initialize EDI to zero
    mov ebx, eax   ; Copy the current day of the month to EBX

    ; Calculate the number of full lunar cycles since the start of the year
    div ebx, 29
    mov ecx, eax   ; ECX = number of full lunar cycles
    mul ecx, 29    ; ECX = number of days in full lunar cycles

    ; Calculate the number of days until the next full moon
    sub ebx, ecx   ; EBX = number of days since the last full moon
    mov eax, 29
    sub eax, ebx   ; EAX = number of days until the next full moon

    ; Check if the next full moon is in the next month
    cmp eax, 0
    jl nextMonth

    pop edi        ; Restore the value of EDI
    pop ecx        ; Restore the current year
    pop ebx        ; Restore the current month
    ret            ; Return the number of days until the next full moon

nextMonth:
    mov eax, ebx   ; EAX = number of days since the last full moon
    add eax, 29    ; EAX = number of days until the next full moon
    pop edi        ; Restore the value of EDI
    pop ecx        ; Restore the current year
    pop ebx        ; Restore the current month
    ret            ; Return the number of days until the next full moon
