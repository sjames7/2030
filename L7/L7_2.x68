        ORG     $9000
RESULT:     dc.l        0
        
        ORG     $9500
START   
            andi.w      #%1101111111111111,SR   ;prog initially starts in SSP this turns off cuz 1 and 0 in S bit = 0
*            MOVE.L      #$12345678,D0
*            MOVE.L      #$9ABCDEF0,D1
*            MOVE.L      #$0FEDCBA9,D2
            LEA         $8100,A7                ;(SP)A7 = @8100
            JSR         GENMUL                  ;pushes address "GENMUL" onto the stack.. prog execution now starts there
*            MOVE.L      RESULT,D4
            TRAP        #14                     ;JSR operation: SP = SP - 4....8100-4 = 80FC.. PC-> (SP).. DST Addr -> PC

GENMUL:
            MOVE.L      D0,-(A7)
*            ;a7 = 80FC -4 = 80F8.. push long word 12345.. to memory location (A7) - @ 80F8-80FB
*            move.l      (a7)+,d4
*            move.l      a7,d5
*            move.l      (a7)+,d6
            
            MOVE.L      D1,D0                   ;overwrite d0 with 9abcd..
            MULS        D2,D0                   ;= 06C27C70
            MOVE.L      D0,RESULT
            MOVE.L      (A7)+,D0
            RTS       
            
                    


        END     START



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
