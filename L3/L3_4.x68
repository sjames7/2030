;Evaluate: Sample program 4
	
	ORG	$8000

START   MOVE.W	W,D1	;W =1    
	    MOVE.W	X,D2    ;X=3	
	    MOVE.B	Y,D3    ;Y=3
	    EXT.W   D3      ;sign extensio
	    
	    MULU.W    D3,D1   ;SRC X DST => dst (3*1 =  3 goes into d1)
	    DIVU.W    #3,D2   ;dst / src => dst (d2 (3)/#3 = 1 GOES into D2)
	    
	    EXT.L   D1  ;longed
	    EXT.L   D2
	    
	    ADD.L   D2,D1   ;D2 added into d1 (3 + 3 = 6 into d1)
	    MOVE.L  D1,Z
	    MOVE.L  Z,D0    ;;moving it out of Z into D0
  
	    
	    
		
	    TRAP	#14		

	ORG	$9000
W   DC.W	1	;16 bit vals each (2 byets)
X	DC.W	3
Y	DC.B	3
Z	DS.L	1   ;long is 32 bit (4 words)
		
	END	START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
