*Lab4_2.x68

REGION1	EQU	$000007AC
REGION2	EQU	$FFFFC000	

	ORG	$8000
START	
    MOVE.L  $7AC,D0
	MOVE.L  #$7AC,D0
	MOVE.W  REGION1,D0
	MOVE.L  REGION2,D0
	MOVE.L  $9000,$9008
	END	START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
