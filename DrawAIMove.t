process DrawAIMove (row, col : int)

    loop
	exit when playerMoved = true
	GameBoardGrid -> centerCell (LegalRows (chooseMoveNum), LegalCols (chooseMoveNum), x, y)
	Draw.Box (x - 35, y - 35, x + 35, y + 35, red)
	Draw.Box (x - 36, y - 36, x + 36, y + 36, red)
    end loop

end DrawAIMove

