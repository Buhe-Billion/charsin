;DESCRIPTION                : A character input demo for Linux, using NASM,
;                           : incorporating calls to both fgets() and scanf()..
;                           :
;Architecture               : X86-64
;CPU                        : Intel® Core™2 Duo CPU T6570 @ 2.10GHz × 2
;NASM                       : 2.14.02
;GCC                        : gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)
;
;
;------------------------------------------------------------------------------------------------------------------

[SECTION .data]

SPROMPT DB 'Enter string data, followed by Enter: ',0
IPROMPT DB 'Enter an integer value, followed by Enter: ',0
IFORMAT DB '%d',0
SSHOW   DB 'The string you entered was: %s',10,0
ISHOW   DB 'The integer value you entered was: %5d',10,0


;------------------------------------------------------------------------------------------------------------------
[SECTION .bss]

INTVAL RESQ 1         ;Reserve an uninitialised double word
INSTRING RESB 128     ;Reserve 128 bytes for string entry buffer



;------------------------------------------------------------------------------------------------------------------
[SECTION .text]

EXTERN stdin, fgets, printf, scanf
GLOBAL main

main:
PUSH RBP              ;Prolog
MOV RBP,RSP

MOV RDI,SPROMPT
MOV RAX,0
CALL printf

MOV RDI,INSTRING
MOV RSI,72
MOV RDX,[stdin]
CALL fgets

MOV RDI,SSHOW
MOV RSI,INSTRING
MOV RAX,0
CALL printf

;use scanf() to enter numeric data
MOV RDI,IPROMPT
MOV RAX,0
CALL printf

MOV RDI,IFORMAT
MOV RSI,INTVAL
MOV RAX,0
CALL scanf

MOV RDI,ISHOW
MOV RSI,[INTVAL]
MOV RAX,0
CALL printf

POP RBP
RET
