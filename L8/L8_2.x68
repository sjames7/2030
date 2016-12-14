        ORG     $8000
        
START   
        LEA         $A00A,sp
        move.w      xval,d2
        move.w      yval,d3
        move.w      zval,d4
        
        move.w      d2,-(sp)        
        move.w      d3,-(sp)        
        move.w      d4,-(sp)
        
        jsr         QUAD
        lea         8(sp),sp
        
EXIT:        TRAP    #14
QUAD:
*inside the sub move all registers to be used into stack and load then back before rts
        movem.w       D2-D6,-(sp)
        clr         d2
        clr         d3
        clr         d4
        move.w      14(sp),d4   ;z
        move.w      16(sp),d3   ;y
        move.w      18(sp),d2   ;x 
        

        move.w      d2,d1       ;result w is stored into d1 as final but x is needed in the 2xy calc @ d2
        muls        d1,d1
        muls        #5,d1
        
        muls.w        #2,d2
        muls.w        d3,d2
        sub.w       d2,d1       ;send party 2xy done and subtracted into d1
        
        muls.w      d4,d4
        add.w       d4,d1
        movem.w     (sp)+,d2-d6
        rts



        ORG     $9000
xVal       dc.w    1
yVal       dc.w    2
zVal       dc.w    3




        END     START



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
