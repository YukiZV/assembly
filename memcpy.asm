; Memcpy alternativo escrito por Casas Oscar.
; FASM!
; FASTCALL!
; ECX = hMemDest
; EDX = hMemSrc
; PUSH memLEN
proc i_memcpy
     push ecx
     mov esi,edx
     mov edi,ecx
     cmp edx,ecx
     jz .FIN
        mov ecx,DWORD[esp+4*2] ; memLen:DWORD
        mov edx,ecx
        shr ecx,2
        and edx,3
        repe movsd
        test edx,edx
        jz .FIN
           mov al,BYTE[esi]
           mov BYTE[edi],al
           cmp edx,2
           jb .FIN
              mov al,BYTE[esi+1]
                  mov BYTE[edi+1],al
                  cmp edx,3
                  jb .FIN
                     mov al,BYTE[esi+2]
                     mov BYTE[edi+2],al
.FIN:
     pop edi
     ret 0
endp       
