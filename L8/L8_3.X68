

    ORG    $8000
START:                  
    PEA     wval
    PEA     xval
    PEA     yval
    PEA     zval
    JSR     QUAD
    LEA     16(SP),SP
    TRAP    #14
    
    
*moving into a0 and then off a0 and into registers, 
QUAD
            MOVEM.W     A0,-(SP)
            MOVEA.L     16(SP),A0
            MOVEM.W     D0-D2,-(SP)
            MOVE.W      #5,D0
            MULU        2(A0),D0        ;moving in registerrs all calc done in registers
            MULU        2(A0),D0
    
            MOVE.W      #4,D1
            MULU        2(A0),D1
            MULU        4(A0),D1
    
            MOVE.W      6(A0),D2
            MULU        6(A0),D2
    
            ADD         D2,D1
            SUB         D0,D1
    

            MOVE.W     D0,(A0)          ;final value put back into the refrenced value location
            MOVEM.W     (SP)+,D0-D2        ;resseting registers back and then address registerback
            MOVEM.W     (SP)+,A0
            RTS 
    
* Put program code here
    
    ORG     $9000
W   Ds.W 1
X   DC.W 2
Y   DC.W 3
Z   DC.W 4 

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

            
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
