; The MIT License (MIT)
; Copyright (c) 2018 Casas Oscar
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
; The above copyright notice and this permission notice shall be included in
; all copies or substantial portions of the Software.

; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
; THE SOFTWARE.

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
