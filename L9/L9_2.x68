*       Shiju james - 0926393 - CIS*2030 - NOV 14/16
        
        ORG     $8024
        JMP     T5
        
        
        
        ORG     $9500
MAIN:
        
        LINK        A6,#-2          ;one word local val
        move.w      #$4D2,-2(A6)
        MOVE.w      -2(A6),-(SP)    ;pushing val onto stack - pass copy of val to funct
        TRAP        #5         ;calling the recursive funct
        
        UNLK        A6
EXIT:   TRAP        #14   
        
        ORG     $9700
t5:        
        LINK        A6,#-4      ;
        CLR         d0
        MOVE.w      10(a6),d0    ;=12 =C
        BEQ         RETURN      ;if passed n = 0 then finish and return
        divu        #10,d0       ;d0 = 0002 0001 remainder in first half 0002 & quotient in second half of register 0001
        move.w      d0,-4(a6)    ;QUOTIENT for next call stored on stack frame
        move.w      #$0000,d0    ;d0 = 0002 0000 
        divu        #$100,d0     ;d0 = 0000 0200
        divu        #$100,d0     ;d0 = 0000 0002
        move.w      d0,-2(a6)    ;remainder on -2(a6) stack frame so this val can be displayed onto screen afte
       
        JSR         t5
disp                          
        CLR         D1          ;this is the steps given to display the letter on screen on the easy68k
        CLR         D0
        move.b      -1(A6),d0
        add.b       #$30,d0
        trap        #1
        
RETURN:
        UNLK        A6
        rts
        END     MAIN





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
