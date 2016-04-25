% MAIN PROGRAM STEPS %
procedure displayGameWindow

    % flag that intro screen is open - global var isIntroWindowOpen
    isGameWindowOpen := true
    % Open the window
    var winID : int
    winID := Window.Open ("position:top;center,graphics:1250;700,title:Othello")
    Window.Hide (wininID)

    fork click
    fork backgroundMusic


    %The Game
    %Othello

    % Othello Game. Put pieces into starting position
    setBoardStartingPosition
    countScores (GameBoardArray)

    %displayIntroWindow

    % display board with starting black and white chips
    DrawBoard (GameBoardArray)

    % Player 1's turn.
    loop
	if Player mod 2 = 0 then

	    %draw all legal moves
	    possibleMoves (Player)
	    % Player pick a cell using a mouse click.
	    loop
		getMove (Player, row, col)
		if isOccupied (row, col) = false then
		    exit when isLegal (Player, row, col, GameBoardArray) = true
		end if
		% Check if legal click/selection - if not legal go to a.
	    end loop
	    

	    PlayerTurn += 1

	    % Flip white chips to black.
	    executeMove (Player, row, col, GameBoardArray)
	    resetDirections
	    countScores (GameBoardArray)
	    DrawBoard (GameBoardArray)

	    % Change Player
	    Player += 1

	    % Check for winning condition
	    if isFullyOccupied (GameBoardArray) = true or endgame (Player) = false then

		% if it is full, end Game. displayEngGame will determine a winner by calling ResultWinnerorDraw
		Time.Delay (2000)
		Window.Close (winID)
		displayOutroWindow


	    end if

	else

	    %draw all legal moves
	    possibleMoves (Player)
	    % Player pick a cell using a mouse click.
	    loop
		getMove (Player, row, col)
		if isOccupied (row, col) = false then
		    exit when isLegal (Player, row, col, GameBoardArray) = true
		end if
		% Check if legal click/selection - if not legal go to a.
	    end loop
	    
	    
	    PlayerTurn += 1

	    % Flip white chips to black.
	    executeMove (Player, row, col, GameBoardArray)
	    resetDirections
	    countScores (GameBoardArray)
	    DrawBoard (GameBoardArray)

	    % Change Player
	    Player += 1

	    % Check for winning condition
	    if isFullyOccupied (GameBoardArray) = true or endgame (Player) = false then

		% if it is full, end Game. displayEngGame will determine a winner by calling ResultWinnerorDraw
		Time.Delay (2000)
		Window.Close (winID)
		displayOutroWindow


	    end if

	end if

    end loop

end displayGameWindow


