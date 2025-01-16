JMP startj ; Skok za tablice wektorow przerwan
DB 3 ; Wektor przerwania zegara

ORG 3
CLI ; WYLACZENIE PRZERWAN

PUSH AL
PUSHF

CMP DL, 9
JNZ poosiem
MOV AL, FF
OUT 02		;wyswietleni 8
poosiem:

CMP DL, 8
JNZ posiedem
MOV AL, 8B
OUT 02		;wyswietleni 7
posiedem:

CMP DL, 7
JNZ poszesc
MOV AL, FD
OUT 02		;wyswietleni 6 
poszesc:

CMP DL, 6
JNZ popiec
MOV AL, DD
OUT 02		;wyswietleni 5
popiec:

CMP DL, 5
JNZ pocztery
MOV AL, 4F
OUT 02		;wyœwietleni 4
pocztery:

CMP DL, 4
JNZ potrzy
MOV AL, 9F
OUT 02		;wyswietleni 3
potrzy:

CMP DL, 3
JNZ podwa
MOV AL, B7
OUT 02		;wyswietleni 2
podwa:

CMP DL, 2
JNZ pojeden
MOV AL, 0B
OUT 02		;wyswietleni 1
pojeden:

CMP DL, 1
JNZ pozero
MOV CL, 1
MOV AL, FB
OUT 02		;wyswietleni 0
pozero:

CMP DL, 0
JNZ podziewiec
MOV AL, DF
OUT 02		;wyswietleni 9
podziewiec:

JMP pominjed
startj:
JMP start
pominjed:

DEC DL
CMP DL, 0
JNS pominresdl
MOV DL, 9
pominresdl:


POPF
POP AL

STI ; WLACZENIE PRZERWAN
IRET





start:
STI
MOV DL, 1 ; resetuje timer

MOV AL, 0
OUT 01

PETLA:

CMP CL, 1
JNZ czekajnatimer
MOV CL, 0

CMP BL, 0
JNZ pominzerosw
MOV AL, 90 ; czerwone czerwone
OUT 01
MOV DL, 2 ; SZYBSZA ZMIANA
pominzerosw:

CMP BL, 1
JNZ pominjedensw
MOV AL, 98 ; szykowanie sie aut, stanie pieszych
OUT 01
MOV DL, 4 ; SZYBSZA ZMIANA
pominjedensw:

CMP BL, 2
JNZ pomindwasw
MOV AL, 84 ; auta jada, piesi stoja
OUT 01
pomindwasw:

CMP BL, 3

JMP lukaPamieci
NOP
NOP
NOP
NOP
NOP

lukaPamieci:

JNZ pomintrzysw
MOV AL, 88 ; auta zolte, piesi stoja
OUT 01
MOV DL, 5 ; SZYBSZA ZMIANA
pomintrzysw:

CMP BL, 4
JNZ pominczterysw
MOV AL, 90 ; czerwone czerwone
OUT 01
MOV DL, 2 ; SZYBSZA ZMIANA
pominczterysw:

CMP BL, 5
JNZ pominpiecsw
MOV AL, 30 ; auta staja, piesi ida
OUT 01
pominpiecsw:

INC BL
CMP BL,6
JNZ pominzmianebl
MOV BL,0
pominzmianebl:

czekajnatimer:
NOP
JMP PETLA



END