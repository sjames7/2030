        ORG     $9000
        
START   
*        move.w      val1,d0
*        move.w      val2,d1
        
ODD:    move.w      d1,d5       ;this is the one to rotate into carry flag
        lsr.w       #1,d5       ;shift into carry flag
        bcc         loop
*;if carry was set means its an odd num so add to sum - else if carry cleared then skip past checking if its at 1

        add.w       d0,d4       ;odd num so it comes here and adds the val to sum register


cond:   CMPI        #1,d1       ;if d1 (quotient) is at 1 then finish
        BEQ         EXIT        ;if not at 1 then continue with loop
        

loop:   lsl.w       #1,d0       ;double val1
        lsr.w       #1,d1       ;half val2 - then check if odd if odd then add sum
        BRA         odd
        

EXIT:        TRAP    #14



        END     START



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
