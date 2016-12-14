*template


	ORG	$8000

*Put Code Here

    MOVE.L  #-2,D0
    MULS.W  #9,D0
    DIVS.W  #5,D0
    ADD.W   #32,D0
    
      
	TRAP	#14
	
	END	$8000

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
