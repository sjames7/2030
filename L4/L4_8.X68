*L4_6.x68     

	ORG	$8000
START  	MOVEA.L #MATRIX,A0	  
	MOVE.W	#8,D2	; bytes per row	 ... all that changes is the size of the cols per row, 
*	other off sets can be kept the same 
	MULU	#1,D2		  
	MOVE.w	4(A0,D2.L),D0 ;2 before now need to multiply by size of a word which is 4 bytes

    MULU    #3,D2   ;finishes 3 rows and now at '13' -> $900C 
	MOVE.w	6(A0,D2.L),D4   ;the 3 increments ffrom 900C to 3 bytes more to where '16 = $10' is 900F
 	
 	
    add.w	D4,D0  
	
	
	TRAP	#14

**** 4 x 4 matrix ****

	ORG	$9000		
MATRIX	DC.W	1,2,3,4
	DC.W	5,6,7,8
	DC.W	9,10,11,12
	DC.W	13,14,15,16
	END	START




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
