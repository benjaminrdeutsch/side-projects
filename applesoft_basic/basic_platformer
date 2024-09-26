1 REM Unnamed Platformer
2 REM B. Deutsch (8/14/24)
3 REM All comments are on the following line due to missing support for inliners :(
10 HOME
20 LET W = 40 : LET H = 22
30 LET PX = 8 : LET PY = 12 : LET D = 0
31 REM ^ D used for requested direction; 0 -> null, 1-4 -> NESW respectively
32 REM ^ This allows one code block to take all requests for changing pos
33 REM ^ Now, it'll always be able to store last pos and erase, no need to reimplement erasure 10 times now!
35 LET T = 0 : GD = 0
36 REM ^ T used for "pausing" gravity when jumping; timer that counts down
37 REM ^ GD is boolean for whether player is 'grounded'
40 GOSUB 1000
50 GOSUB 2000
60 GOSUB 4000
70 GOSUB 5000
80 GOSUB 6000
90 GOSUB 7000
100 GOTO 40
200 END

1000 REM ~ drawFloor() ~
1010 FOR I = 1 TO W
1015 FOR J = 0 TO 3
1020 HTAB I : VTAB H-J
1030 PRINT "#"
1035 NEXT J
1040 NEXT I
1050 RETURN

2000 REM ~ drawPlayer() ~
2001 HTAB 2 : VTAB 2 : PRINT "PX: "; PX; "  PY: "; PY
2010 IF D = 0 THEN HTAB PX : VTAB PY : PRINT "@" : RETURN
2020 LET NX = PX : LET NY = PY
2030 IF D = 1 THEN NY = PY - 1
2040 IF D = 2 THEN NX = PX + 1
2050 IF D = 3 THEN NY = PY + 1
2060 IF D = 4 THEN NX = PX - 1
2070 HTAB PX : VTAB PY : PRINT " "
2080 HTAB NX : VTAB NY : PRINT "@"
2090 D = 0
2100 PX = NX : PY = NY
2101 REM ^ global pos changed after to reduce flicker; prints should stay consecutive
2200 RETURN

3000 REM ~ handleInput() [broken] ~
3010 LET K = PEEK(49152)
3011 REM ^ 49152 is address for keyboard; WASD will be used for movement
3020 LET TX = PX : LET TY = PY
3021 REM ^ Stores curr pos; will be used if new pos needs to be rejected
3022 REM ^ Will only change PX or PY after collision checking when all is confirmed
3020 IF K = 215 THEN PRINT "W: IMPLEMENT LATER"
3030 IF K = 193 THEN TX = TX - 1
3040 IF K = 211 THEN PRINT "S: IMPLEMENT LATER"
3050 IF K = 196 THEN TX = TX + 1
3060 IF K = 160 THEN PRINT "SPACE: IMPLEMENT LATER"
3200 REM Section for gravity
3210 TY = TY + 1
3400 REM Section for collision checking
3401 HTAB 2 : VTAB 3 : PRINT "TX: "; TX; "  TY: "; TY
3410 IF TY > H-3 THEN TY = PY
3411 REM ^ Prevents player from falling through floor
3420 RETURN

4000 REM ~ handleInput() ~
4010 LET K = PEEK(49152)
4020 IF K = 160 AND GD = 1 THEN T = 5
4030 IF PY + 1 < H-3 THEN D = 3
4031 REM ^ apply gravity w/ floor detection
4200 RETURN

5000 REM ~ applyGravityOrJump() ~
5010 IF T = 0 AND PY + 1 < H-3 THEN D = 3
5020 IF T > 0 THEN D = 1
5030 RETURN

6000 REM ~ updateGroundedAndTimer() ~
6010 IF T > 0 THEN T = T - 1
6020 IF PY >= H-4 THEN GD = 1 : RETURN
6030 GD = 0 : RETURN

7000 REM ~ showDebugMenu() ~
7010 HTAB 2 : VTAB 3 : PRINT "T: "; T
7019 HTAB 2 : VTAB 4 : PRINT "      "
7020 HTAB 2 : VTAB 4 : PRINT "K: "; K
7030 HTAB 2 : VTAB 5 : PRINT "GD: "; GD
7100 RETURN


