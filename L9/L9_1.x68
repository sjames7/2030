

        ORG         $802A       ;TRAP 6 VECTOR
        JMP         T6
        
        ORG         $8030       ;TRAP 7 VECTOR
        JMP         T7
      
        ORG         $9000       ;t6 handler
t6      
        eori.w      #%001000000000000,(A7)   ;prog initially starts in SSP this turns off cuz 1 and 0 in S bit = 0
        RTE    
        
        ORG         $9200       ;t7 handler
t7      
        andi.w      #%1101111111111111,(A7)  ;prog initially starts in SSP this turns off cuz 1 and 0 in S bit = 0
        RTE    


        ORG     $9500
main:
        move.b      #1,d0
        trap        #6         ;calling trap 7
        move.b      #2,d1
        TRAP        #7
        move.b      #2,d1
        
        TRAP        #14 
   

        END     main






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
