

DUART EQU $C001
SRA EQU 2
RBA EQU 6                                                                                                                                                                                                                                                                           6       ;recieve bufferA
CR      EQU         $0D     ;return
LF      EQU         $0A     ;line feed
 
        ORG     $8000
MAIN:   MOVea.l     #TEXT,A1    ;A1  PTS at text
        BSR         INSTR       ;msg on A1 and call outstr to use a1 
        TRAP        #14   
       
TEXT:   DS.B    1

*____________________________________________________
        ORG     $8100
INSTR:  MOVE.L      A0,-(A7)
        MOVE.w      D7,-(a7)    ;working reg

        MOVEA.L     #DUART,A0   ;a0 ->base duart
OUTCHR2: MOVE.b     SRA(A0),D7  ;status?
        ANDI.B      #1,D7       ;EMPTY?
        BEQ         OUTCHR2     ;if it is empty then keep checking
        MOVE.B      RBA(A0),D2  ;NOT empty so store into d2

        CMPI.b      #$0D,D2     ;check if carriage rtn stored
        
        BNE         STORE       ;if return not hit then skip this and just store 
        MOVE.B      #$0,d2    ;if it is a return hit then modify input to null 0
        BRA         RESTORE     ;exit function
        
        
Store  MOVE.B      D2,(A1)+    ;increment after storing
        CMPI        #0,D2       ;shouldnt be 0 inside d2, so repeat
        BNE         OUTCHR2     ;back to function
                                                                    
restore:    MOVE.B      D2,(A1)+    ;increment after storing null
            MOVE.W     (A7)+,D7
            MOVE.L      (a7)+,A0
        RTS

        END     MAIN




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
