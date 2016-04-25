%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Toggle Music Procedure
procedure toggleMusicOn
    if isMusicOn = false then

	isWindowOpen := Window.GetActive
	if isWindowOpen = 1 then
	    fork introMusic
	    isMusicOn := true
	elsif isWindowOpen = 2 then
	    fork backgroundMusic
	    isMusicOn := true
	elsif isWindowOpen = 3 then
	    fork outroMusic
	    isMusicOn := true
	end if
    end if
end toggleMusicOn

procedure toggleMusicOff
    if isMusicOn = true then
	fork click
	Time.Delay (500)
	Music.PlayFileStop
	isMusicOn := false
    else
	fork click
	Time.Delay (500)
	toggleMusicOn
    end if
end toggleMusicOff
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Checks if a move is Legal
function isLegal (player, r, c : int, GameBoard : array 1 .. *, 1 .. * of int) : boolean

    var p : int := player
    var p1 : int := p mod 2
    var north, south, east, west, northeast, northwest, southeast, southwest : boolean := false
    var isLegalVar : boolean := false

    var c2 : int := r     % x
    var c1 : int := c      % y
    %Calls are made (y,x)

    %White
    if p1 = 0 then

	%North
	c2 += 1
	if c2 < 9 then
	    if GameBoard (c2, c1) not= 0 then
		if GameBoard (c2, c1) = 1 then
		    north := true
		end if
	    end if
	end if
	%Reset
	c2 := r
	c1 := c
	%Northeast
	c1 += 1
	c2 += 1
	if c1 < 9 and c2 < 9 then
	    if GameBoard (c2, c1) not= 0 then
		if GameBoard (c2, c1) = 1 then
		    northeast := true
		end if
	    end if
	end if
	%Reset
	c2 := r
	c1 := c
	%East
	c1 += 1
	if c1 < 9 then
	    if GameBoard (c2, c1) not= 0 then
		if GameBoard (c2, c1) = 1 then
		    east := true
		end if
	    end if
	end if
	%Reset
	c2 := r
	c1 := c
	%Southeast
	c1 += 1
	c2 -= 1
	if c1 < 9 and c2 > 0 then
	    if GameBoard (c2, c1) not= 0 then
		if GameBoard (c2, c1) = 1 then
		    southeast := true
		end if
	    end if
	end if
	%Reset
	c2 := r
	c1 := c
	%South
	c2 -= 1
	if c2 > 0 then
	    if GameBoard (c2, c1) not= 0 then
		if GameBoard (c2, c1) = 1 then
		    south := true
		end if
	    end if
	end if
	%Reset
	c2 := r
	c1 := c
	%Southwest
	c2 -= 1
	c1 -= 1
	if c2 > 0 and c1 > 0 then
	    if GameBoard (c2, c1) not= 0 then
		if GameBoard (c2, c1) = 1 then
		    southwest := true
		end if
	    end if
	end if
	%Reset
	c2 := r
	c1 := c
	%west
	c1 -= 1
	if c1 > 0 then
	    if GameBoard (c2, c1) not= 0 then
		if GameBoard (c2, c1) = 1 then
		    west := true
		end if
	    end if
	end if
	%Reset
	c2 := r
	c1 := c
	%Northwest
	c2 += 1
	c1 -= 1
	if c2 < 9 and c1 > 0 then
	    if GameBoard (c2, c1) not= 0 then
		if GameBoard (c2, c1) = 1 then
		    northwest := true
		end if
	    end if
	end if


	%Reset
	c2 := r
	c1 := c

	if north = true then

	    loop
		exit when c2 = 9


		if GameBoard (c2, c1) = 2 then
		    exeDirection (1) := true
		    isLegalVar := true
		    exit
		end if

		c2 += 1

	    end loop

	end if

	%Reset
	c2 := r
	c1 := c

	if northeast = true then

	    loop
		exit when c2 = 9
		exit when c1 = 9


		if GameBoard (c2, c1) = 2 then
		    exeDirection (2) := true
		    isLegalVar := true
		    exit
		end if

		c2 += 1
		c1 += 1

	    end loop

	end if

	%Reset
	c2 := r
	c1 := c

	if east = true then

	    loop
		exit when c1 = 9



		if GameBoard (c2, c1) = 2 then
		    exeDirection (3) := true
		    isLegalVar := true
		    exit
		end if

		c1 += 1

	    end loop

	end if

	%Reset
	c2 := r
	c1 := c

	if southeast = true then

	    loop
		exit when c1 = 9
		exit when c2 = 0



		if GameBoard (c2, c1) = 2 then
		    exeDirection (4) := true
		    isLegalVar := true
		    exit
		end if

		c1 += 1
		c2 -= 1

	    end loop

	end if

	%Reset
	c2 := r
	c1 := c

	if south = true then

	    loop
		exit when c2 = 0


		if GameBoard (c2, c1) = 2 then
		    exeDirection (5) := true
		    isLegalVar := true
		    exit
		end if

		c2 -= 1
	    end loop

	end if

	%Reset
	c2 := r
	c1 := c

	if southwest = true then

	    loop
		exit when c2 = 0
		exit when c1 = 0



		if GameBoard (c2, c1) = 2 then
		    exeDirection (6) := true
		    isLegalVar := true
		    exit
		end if

		c2 -= 1
		c1 -= 1

	    end loop

	end if

	%Reset
	c2 := r
	c1 := c

	if west = true then

	    loop
		exit when c1 = 0


		if GameBoard (c2, c1) = 2 then
		    exeDirection (7) := true
		    isLegalVar := true
		    exit
		end if

		c1 -= 1

	    end loop

	end if

	%Reset
	c2 := r
	c1 := c

	if northwest = true then

	    loop
		exit when c2 = 9
		exit when c1 = 0


		if GameBoard (c2, c1) = 2 then
		    exeDirection (8) := true
		    isLegalVar := true
		    exit
		end if

		c2 += 1
		c1 -= 1

	    end loop

	end if

    end if
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Black
    if p1 not= 0 then

	var c11 : int := c
	var c21 : int := r

	%Calls are made (y,x)

	%North
	c21 += 1
	if c21 < 9 then
	    if GameBoard (c21, c11) not= 0 then
		if GameBoard (c21, c11) = 2 then
		    north := true
		end if
	    end if
	end if
	%Reset
	c21 := r
	c11 := c
	%Northeast
	c11 += 1
	c21 += 1
	if c21 < 9 and c11 < 9 then
	    if GameBoard (c21, c11) not= 0 then
		if GameBoard (c21, c11) = 2 then
		    northeast := true
		end if
	    end if
	end if
	%Reset
	c21 := r
	c11 := c
	%East
	c11 += 1
	if c11 < 9 then
	    if GameBoard (c21, c11) not= 0 then
		if GameBoard (c21, c11) = 2 then
		    east := true
		end if
	    end if
	end if

	%Reset
	c21 := r
	c11 := c
	%Southeast
	c11 += 1
	c21 -= 1
	if c11 < 9 and c21 > 0 then
	    if GameBoard (c21, c11) not= 0 then
		if GameBoard (c21, c11) = 2 then
		    southeast := true
		end if
	    end if
	end if
	%Reset
	c21 := r
	c11 := c
	%South
	c21 -= 1
	if c21 > 0 then
	    if GameBoard (c21, c11) not= 0 then
		if GameBoard (c21, c11) = 2 then
		    south := true
		end if
	    end if
	end if
	%Reset
	c21 := r
	c11 := c
	%Southwest
	c21 -= 1
	c11 -= 1
	if c11 > 0 and c21 > 0 then
	    if GameBoard (c21, c11) not= 0 then
		if GameBoard (c21, c11) = 2 then
		    southwest := true
		end if
	    end if
	end if
	%Reset
	c21 := r
	c11 := c
	%west
	c11 -= 1
	if c11 > 0 then
	    if GameBoard (c21, c11) not= 0 then
		if GameBoard (c21, c11) = 2 then
		    west := true
		end if
	    end if
	end if
	%Reset
	c21 := r
	c11 := c
	%Northwest
	c21 += 1
	c11 -= 1
	if c21 < 9 and c11 > 0 then
	    if GameBoard (c21, c11) not= 0 then
		if GameBoard (c21, c11) = 2 then
		    northwest := true
		end if
	    end if
	end if

	%Reset
	c21 := r
	c11 := c

	if north = true then

	    loop
		exit when c21 = 9


		if GameBoard (c21, c11) = 1 then
		    exeDirection (1) := true
		    isLegalVar := true
		    exit
		end if

		c21 += 1

	    end loop

	end if

	%Reset
	c21 := r
	c11 := c

	if northeast = true then

	    loop
		exit when c21 = 9
		exit when c11 = 9


		if GameBoard (c21, c11) = 1 then
		    exeDirection (2) := true
		    isLegalVar := true
		    exit
		end if

		c21 += 1
		c11 += 1

	    end loop

	end if

	%Reset
	c21 := r
	c11 := c

	if east = true then

	    loop
		exit when c11 = 9


		if GameBoard (c21, c11) = 1 then
		    exeDirection (3) := true
		    isLegalVar := true
		    exit
		end if

		c11 += 1

	    end loop

	end if

	%Reset
	c21 := r
	c11 := c

	if southeast = true then

	    loop
		exit when c11 = 9
		exit when c21 = 0



		if GameBoard (c21, c11) = 1 then
		    exeDirection (4) := true
		    isLegalVar := true
		    exit
		end if

		c11 += 1
		c21 -= 1

	    end loop

	end if

	%Reset
	c21 := r
	c11 := c

	if south = true then

	    loop

		exit when c21 = 0


		if GameBoard (c21, c11) = 1 then
		    exeDirection (5) := true
		    isLegalVar := true
		    exit
		end if

		c21 -= 1

	    end loop

	end if

	%Reset
	c21 := r
	c11 := c

	if southwest = true then

	    loop
		exit when c21 = 0
		exit when c11 = 0


		if GameBoard (c21, c11) = 1 then
		    exeDirection (6) := true
		    isLegalVar := true
		    exit
		end if

		c21 -= 1
		c11 -= 1

	    end loop

	end if

	%Reset
	c21 := r
	c11 := c

	if west = true then

	    loop
		exit when c11 = 0


		if GameBoard (c21, c11) = 1 then
		    exeDirection (7) := true
		    isLegalVar := true
		    exit
		end if

		c11 -= 1

	    end loop

	end if

	%Reset
	c21 := r
	c11 := c

	if northwest = true then

	    loop
		exit when c21 = 9
		exit when c11 = 0


		if GameBoard (c21, c11) = 1 then
		    exeDirection (8) := true
		    isLegalVar := true
		    exit
		end if

		c21 += 1
		c11 -= 1

	    end loop

	end if

    end if

    result isLegalVar

end isLegal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Execute Move. Needs the player playing and the array Board that stores the pieces
procedure executeMove (player, row, col : int, var GameBoard : array 1 .. *, 1 .. * of int)

    var r : int := row
    var c : int := col
    r := row
    c := col
    if Player mod 2 = 0 then
	GameBoard (row, col) := 2

	if exeDirection (1) = true then

	    loop
		r += 1
		exit when GameBoard (r, c) = 2
		GameBoard (r, c) := 2
	    end loop

	end if
	r := row
	c := col

	if exeDirection (2) = true then

	    loop
		r += 1
		c += 1
		exit when GameBoard (r, c) = 2
		GameBoard (r, c) := 2
	    end loop

	end if
	r := row
	c := col
	if exeDirection (3) = true then


	    loop
		c += 1
		exit when GameBoard (r, c) = 2
		GameBoard (r, c) := 2
	    end loop
	end if
	r := row
	c := col
	if exeDirection (4) = true then

	    loop
		r -= 1
		c += 1
		exit when GameBoard (r, c) = 2
		GameBoard (r, c) := 2
	    end loop
	end if
	r := row
	c := col
	if exeDirection (5) = true then

	    loop
		r -= 1
		exit when GameBoard (r, c) = 2
		GameBoard (r, c) := 2
	    end loop
	end if
	r := row
	c := col
	if exeDirection (6) = true then

	    loop
		r -= 1
		c -= 1
		exit when GameBoard (r, c) = 2
		GameBoard (r, c) := 2
	    end loop
	end if
	r := row
	c := col
	if exeDirection (7) = true then

	    loop
		c -= 1
		exit when GameBoard (r, c) = 2
		GameBoard (r, c) := 2
	    end loop
	end if
	r := row
	c := col
	if exeDirection (8) = true then

	    loop
		r += 1
		c -= 1
		exit when GameBoard (r, c) = 2
		GameBoard (r, c) := 2
	    end loop
	end if

    else
	GameBoard (row, col) := 1

	if exeDirection (1) = true then

	    loop
		r += 1
		exit when GameBoard (r, c) = 1
		GameBoard (r, c) := 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (2) = true then

	    loop
		r += 1
		c += 1
		exit when GameBoard (r, c) = 1
		GameBoard (r, c) := 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (3) = true then


	    loop
		c += 1
		exit when GameBoard (r, c) = 1
		GameBoard (r, c) := 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (4) = true then

	    loop
		r -= 1
		c += 1
		exit when GameBoard (r, c) = 1
		GameBoard (r, c) := 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (5) = true then

	    loop
		r -= 1
		exit when GameBoard (r, c) = 1
		GameBoard (r, c) := 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (6) = true then

	    loop
		r -= 1
		c -= 1
		exit when GameBoard (r, c) = 1
		GameBoard (r, c) := 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (7) = true then

	    loop
		c -= 1
		exit when GameBoard (r, c) = 1
		GameBoard (r, c) := 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (8) = true then

	    loop
		r += 1
		c -= 1
		exit when GameBoard (r, c) = 1
		GameBoard (r, c) := 1
	    end loop
	end if

    end if

end executeMove
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%possiblePoints - FOR HARD AI
%Shows the pieces that would be flipped
function possiblePoints (player, row, col : int, var GameBoardArrayHard : array 1 .. *, 1 .. * of int) : int

    var totalpoints : int := 0
    var r : int := row
    var c : int := col
    r := row
    c := col
    if Player mod 2 = 0 then
	GameBoardArrayHard (row, col) := 2

	if exeDirection (1) = true then

	    loop
		r += 1
		exit when GameBoardArrayHard (r, c) = 2
		GameBoardArrayHard (r, c) := 2
		totalpoints += 1
	    end loop

	end if
	r := row
	c := col

	if exeDirection (2) = true then

	    loop
		r += 1
		c += 1
		exit when GameBoardArrayHard (r, c) = 2
		GameBoardArrayHard (r, c) := 2
		totalpoints += 1
	    end loop

	end if
	r := row
	c := col
	if exeDirection (3) = true then


	    loop
		c += 1
		exit when GameBoardArrayHard (r, c) = 2
		GameBoardArrayHard (r, c) := 2
		totalpoints += 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (4) = true then

	    loop
		r -= 1
		c += 1
		exit when GameBoardArrayHard (r, c) = 2
		GameBoardArrayHard (r, c) := 2
		totalpoints += 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (5) = true then

	    loop
		r -= 1
		exit when GameBoardArrayHard (r, c) = 2
		GameBoardArrayHard (r, c) := 2
		totalpoints += 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (6) = true then

	    loop
		r -= 1
		c -= 1
		exit when GameBoardArrayHard (r, c) = 2
		GameBoardArrayHard (r, c) := 2
		totalpoints += 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (7) = true then

	    loop
		c -= 1
		exit when GameBoardArrayHard (r, c) = 2
		GameBoardArrayHard (r, c) := 2
		totalpoints += 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (8) = true then

	    loop
		r += 1
		c -= 1
		exit when GameBoardArrayHard (r, c) = 2
		GameBoardArrayHard (r, c) := 2
		totalpoints += 1
	    end loop
	end if

    else
	GameBoardArrayHard (row, col) := 1

	if exeDirection (1) = true then

	    loop
		r += 1
		exit when GameBoardArrayHard (r, c) = 1
		GameBoardArrayHard (r, c) := 1
		totalpoints += 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (2) = true then

	    loop
		r += 1
		c += 1
		exit when GameBoardArrayHard (r, c) = 1
		GameBoardArrayHard (r, c) := 1
		totalpoints += 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (3) = true then


	    loop
		c += 1
		exit when GameBoardArrayHard (r, c) = 1
		GameBoardArrayHard (r, c) := 1
		totalpoints += 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (4) = true then

	    loop
		r -= 1
		c += 1
		exit when GameBoardArrayHard (r, c) = 1
		GameBoardArrayHard (r, c) := 1
		totalpoints += 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (5) = true then

	    loop
		r -= 1
		exit when GameBoardArrayHard (r, c) = 1
		GameBoardArrayHard (r, c) := 1
		totalpoints += 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (6) = true then

	    loop
		r -= 1
		c -= 1
		exit when GameBoardArrayHard (r, c) = 1
		GameBoardArrayHard (r, c) := 1
		totalpoints += 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (7) = true then

	    loop
		c -= 1
		exit when GameBoardArrayHard (r, c) = 1
		GameBoardArrayHard (r, c) := 1
		totalpoints += 1
	    end loop
	end if
	r := row
	c := col
	if exeDirection (8) = true then

	    loop
		r += 1
		c -= 1
		exit when GameBoardArrayHard (r, c) = 1
		GameBoardArrayHard (r, c) := 1
		totalpoints += 1
	    end loop
	end if

    end if

    result totalpoints

end possiblePoints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Reset ExeDirection


procedure resetDirections

    for i : 1 .. 8

	exeDirection (i) := false

    end for


end resetDirections

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Draw Board. Draws the game board gets information from the array to draw the gameboard with peices.
procedure DrawBoard (GB : array 1 .. *, 1 .. * of int)
    var Player1StringTurn := PlayerOneName
    var Player2StringTurn := PlayerTwoName
    %Erase Everything
    Draw.FillBox (1, 1, maxx, maxy, green)

    %Declare radius Size of Game Pieces
    var piecesize : int := 35


    %Draw Player Scores, Title and Authors
    Font.Draw ("Player 1 (Black) Score:", 850, 400, font, blue)
    Font.Draw (intstr (PlayerOneScore), 975, 350, font, blue)

    Font.Draw ("Player 2 (White) Score:", 850, 275, font, blue)
    Font.Draw (intstr (PlayerTwoScore), 975, 225, font, blue)

    Font.Draw ("OTHELLO", 875, 600, font2, white)
    Font.Draw ("by Jay Shrivastava & Han Shen Wang", 760, 500, font, white)

    %draw the board
    GameBoardGrid -> setHW (75, 75)
    GameBoardGrid -> setStartxy (50, 50)
    GameBoardGrid -> setColor (black)
    GameBoardGrid -> setBG (green)
    GameBoardGrid -> setRC (8, 8)
    GameBoardGrid -> drawGrid


    %Draw the pieces
    %Used for center coordinates of grid cells
    var x, y : int

    locate (1, 1)
    for i : 1 .. 8
	for j : 1 .. 8

	    if GameBoardArray (i, j) = 1 then

		GameBoardGrid -> centerCell (i, j, x, y)
		Draw.FillOval (x, y, piecesize, piecesize, black)

	    elsif GameBoardArray (i, j) = 2 then

		GameBoardGrid -> centerCell (i, j, x, y)
		Draw.FillOval (x, y, piecesize, piecesize, white)
	    end if

	end for

    end for

    %Put whose turn it is. Note that it will have to put the opposing palyer've move after updating the screen. The first move of the game is the only one taht is not the opposite.
    %first move of the game

    if PlayerTurn mod 2 > 0 then

	Font.Draw ("Player Turn:", 700, 200, font, blue)
	Font.Draw (Player1StringTurn, 800, 150, font, red)
	Font.Draw ("Legal Moves in Blue", 850, 100, font, white)

    elsif PlayerTurn mod 2 = 0 then

	Font.Draw ("Player Turn:", 700, 200, font, blue)
	Font.Draw (Player2StringTurn, 800, 150, font, red)
	Font.Draw ("Legal Moves in Blue", 850, 100, font, white)

    end if

end DrawBoard

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Check if the baord is full; if all spots are occupied
function isFullyOccupied (GameBoard : array 1 .. *, 1 .. * of int) : boolean

    for i : 1 .. 8
	for j : 1 .. 8

	    if GameBoardArray (i, j) = 0 then
		result false
	    end if

	end for
    end for

    result true

end isFullyOccupied

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Check for winner or draw.
function ResultWinnerorDraw (GameBoard : array 1 .. *, 1 .. * of int) : boolean

    if PlayerOneScore > PlayerTwoScore then

	Winnerisblack := true

    elsif PlayerOneScore < PlayerTwoScore then

	Winnerisblack := false

    elsif PlayerOneScore = PlayerTwoScore then

	Winnerisblack := false

    end if

    result Winnerisblack

end ResultWinnerorDraw

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initialize Array to the starting position
procedure setBoardStartingPosition

    Player := 1

    for j : 1 .. 8
	for i : 1 .. 8
	    if i = 4 and j = 4 then
		GameBoardArray (i, j) := 2
	    elsif i = 5 and j = 5 then
		GameBoardArray (i, j) := 2
	    elsif i = 4 and j = 5 then
		GameBoardArray (i, j) := 1
	    elsif i = 5 and j = 4 then
		GameBoardArray (i, j) := 1
	    else

		GameBoardArray (i, j) := 0
	    end if
	end for
    end for

end setBoardStartingPosition

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gets a move from one of the players
procedure getMove (player : int, var row, col : int)

    %vars for Mouse.ButtonWait
    var x, y : int
    var btnNumber, btnUpDown : int

    %Flag to ensure that the player clicked inside the board
    var isInside : boolean := true

    loop
	Mouse.ButtonWait ("down", x, y, btnNumber, btnUpDown)

	if x < 50 or y < 50 or x > (75 * 8 + 50) or y > (75 * 8 + 50) then
	    isInside := false

	else

	    isInside := true

	end if

	exit when isInside = true


    end loop

    GameBoardGrid -> fromPoints (x, y, row, col)

end getMove

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Displays Game End screen with resulting winner or draw. (Calls ResultWinnerorDraw)
procedure displayEndGame

    put ResultWinnerorDraw (GameBoardArray)

end displayEndGame

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Used to calculate the scores of each player (the pieces each player owns)
procedure countScores (GB : array 1 .. *, 1 .. * of int)

    %Reset Scores
    PlayerOneScore := 0
    PlayerTwoScore := 0

    %Calculate & extrapolaterino Scores from GameBoardArray
    for i : 1 .. 8
	for j : 1 .. 8

	    if GameBoardArray (i, j) = 1 then
		PlayerOneScore += 1
	    elsif GameBoardArray (i, j) = 2 then
		PlayerTwoScore += 1
	    end if

	end for
    end for

end countScores

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Check if spot is Occupied
function isOccupied (r, c : int) : boolean
    var isOccupied : boolean := true

    if GameBoardArray (r, c) = 0 then
	isOccupied := false
    end if
    result isOccupied

end isOccupied


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Show the possible legal moves
procedure possibleMoves (player : int)

    var x, y : int

    %Drawpossible legal moves

    for i : 1 .. 8
	for j : 1 .. 8

	    if isLegal (Player, i, j, GameBoardArray) = true then
		if isOccupied (i, j) = false then
		    GameBoardGrid -> centerCell (i, j, x, y)

		    Draw.Box (x - 35, y - 35, x + 35, y + 35, blue)
		    Draw.Box (x - 36, y - 36, x + 36, y + 36, blue)
		end if
	    end if


	end for
    end for

    %reset array used in isLegal to communicate with executeMove
    resetDirections

end possibleMoves

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ends the Game if there are no legal moves left
function endgame (player : int) : boolean
    var variable : boolean := false

    for i : 1 .. 8
	for j : 1 .. 8

	    if isLegal (Player, i, j, GameBoardArray) = true then
		if isOccupied (i, j) = false then

		    variable := true


		end if
	    end if

	end for
    end for

    resetDirections

    result variable

end endgame

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Easy AI Randomly selected moves
procedure EasyAIMove
    var CounterOfLegalMoves : int := 0

    %Count number of legal moves
    for i : 1 .. 8
	for j : 1 .. 8

	    if isLegal (Player, i, j, GameBoardArray) = true then
		if isOccupied (i, j) = false then

		    CounterOfLegalMoves += 1

		end if
	    end if

	end for
    end for

    resetDirections

    %Store legal moves
    var c : int := 0
    for i : 1 .. 8
	for j : 1 .. 8


	    if isLegal (Player, i, j, GameBoardArray) = true then
		if isOccupied (i, j) = false then

		    c += 1

		    LegalRows (c) := i
		    LegalCols (c) := j

		    resetDirections

		end if
	    end if

	end for
    end for

    resetDirections

    %Choose move within array
    chooseMoveNum := Rand.Int (1, CounterOfLegalMoves)

    if isLegal (Player, LegalRows (chooseMoveNum), LegalCols (chooseMoveNum), GameBoardArray) = true then

	fork DrawAIMove (chooseMoveNum, chooseMoveNum)
	Time.Delay (1000)
	executeMove (Player, LegalRows (chooseMoveNum), LegalCols (chooseMoveNum), GameBoardArray)

    end if

    resetDirections
    CounterOfLegalMoves := 0

end EasyAIMove

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Hard AI Picks best possible moves
procedure HardAIMove
    var moveresult : int := 0
    var bestmoveresult : int := 0
    var bestmoverowcol : int := 0
    var CounterOfLegalMovesHard : int := 0

    %Count number of legal moves
    for i : 1 .. 8
	for j : 1 .. 8

	    if isLegal (Player, i, j, GameBoardArray) = true then
		if isOccupied (i, j) = false then

		    CounterOfLegalMovesHard += 1

		end if
	    end if

	end for
    end for

    resetDirections

    %Store legal moves
    var c : int := 0
    for i : 1 .. 8
	for j : 1 .. 8


	    if isLegal (Player, i, j, GameBoardArray) = true then
		if isOccupied (i, j) = false then

		    c += 1

		    LegalRows (c) := i
		    LegalCols (c) := j

		    resetDirections

		end if
	    end if

	end for
    end for

    resetDirections

    %Make Copy of Gameboard, then execute all possible moves #Bruteforce is best force

    for i : 1 .. 8
	for j : 1 .. 8
	    GameBoardArrayHard (i, j) := GameBoardArray (i, j)
	end for
    end for

    %Choose best move
    for i : 1 .. CounterOfLegalMovesHard

	if isLegal (Player, LegalRows (i), LegalCols (i), GameBoardArrayHard) = true then

	    moveresult := possiblePoints (Player, LegalRows (i), LegalCols (i), GameBoardArrayHard)

	    if moveresult > bestmoveresult then
		bestmoveresult := moveresult
		bestmoverowcol := i
	    end if

	end if

	moveresult := 0
	resetDirections

	%Make Copy of Gameboard, then execute all possible moves #Bruteforce is best force

	for h : 1 .. 8
	    for s : 1 .. 8
		GameBoardArrayHard (h, s) := GameBoardArray (h, s)
	    end for
	end for

    end for

    %Choose move within array
    chooseMoveNum := bestmoverowcol

    if isLegal (Player, LegalRows (chooseMoveNum), LegalCols (chooseMoveNum), GameBoardArray) = true then

	fork DrawAIMove (chooseMoveNum, chooseMoveNum)
	Time.Delay (1000)
	executeMove (Player, LegalRows (chooseMoveNum), LegalCols (chooseMoveNum), GameBoardArray)

    end if

    %Reset temp array
    for i : 1 .. 8
	for j : 1 .. 8
	    GameBoardArrayHard (i, j) := 0
	end for
    end for
    resetDirections
    CounterOfLegalMovesHard := 0
    bestmoverowcol := 0
    bestmoveresult := 0

end HardAIMove
