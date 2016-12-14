*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:      move.b  hexVal,d0                ; first instruction of program
            add.b   #$30,d0
            CMPI    #$39,d0
            BLE     EXIT
            add.b   #$7,d0
            move.b  d0,charCode  
* Put program code here

EXIT    SIMHALT             ; halt simulator

* Put variables and constants here
       ORG     $9000
hexVal      Dc.b    $A
charCode    Dc.b    $0

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
