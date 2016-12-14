        ORG     $8000
        
START   
        LEA         $A00A,sp
        move.w      val1,d0
        move.w      d0,-(sp)
        jsr         QUAD
        lea         2(sp),sp
        
EXIT:        TRAP    #14
QUAD:
        move.w      4(sp),d1
        move.w      d1,d2
        muls        d1,d1
        muls        #5,d1
        muls        #2,d2
        sub.w       d2,d1
        add.w       #6,d1
        clr.w       d2
        rts



        ORG     $9000
val1       dc.w    2




        END     START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
