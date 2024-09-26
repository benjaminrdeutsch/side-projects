1 REM Expiring Inputs
2 REM B. Deutsch (8/14/24)

3 REM Context: I wrote this as a proof-of-concept for a platformer game
4 REM Without this logic, key presses are treated as MUTEX levers instead of buttons

10 HOME
20 LET PK = 0 : K = 0 : A = 0
21 REM PK = past key, K = key as registered by memory, A = input as detected by new system
30 LET CF = 0 : LET MF = 100
31 REM CF = current frame, MF = max frames (both pertaining to expiry of input)
40 GOSUB 1000
50 GOSUB 2000
100 GOTO 40

1000 REM ~ The Special Sauce ~
1010 IF CF > 0 THEN CF = CF - 1
1020 IF CF = 0 THEN A = 0
1030 PK = K : K = PEEK(49152)
1040 IF K == PK THEN RETURN
1050 REM At this point, having not returned, we assume a new input was provided.
1060 CF = MF : A = K
1070 IF CF = 0 THEN A = 0
1300 RETURN

2000 REM ~ Debug Display ~
2010 HTAB 10 : VTAB 10 : PRINT "    "
2020 HTAB 10 : VTAB 10 : PRINT A
2030 HTAB 10 : VTAB 5 : PRINT "CF: "; CF
2100 RETURN

