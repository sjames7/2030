*L5_4: Sample program 3
	
	ORG $8000

START   
         move.b  num1,d0
         move.b  num2,d1
         move.b  num3,d2

         cmp     d1,d0
         blt     mainElse
        
         cmp     d2,d0
         blt     innerElse
         move.b  num1,d3
         
         TRAP    #14
         
innerElse move.b  num3,d3
         TRAP    #14
         
mainElse  cmp     d2,d1
         blt     mainE2
         move.b  num2,d3
         TRAP    #14
 
mainE2    move.b  num3,d3
         TRAP    #14
	
	ORG $9000


num1    dc.b    2
num2    dc.b    5
num3    dc.b    10
biggest dc.b    0
    
	END	START











*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
