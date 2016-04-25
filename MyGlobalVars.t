%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:
%Date:
%Course:  ICS3CU1
%Teacher:
%Program Name:
%Descriptions:  Final Program Name Here and a brief description of the game
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   MyGlobalVars.t
%   All global variables are coded in this file.
%   These will have FILE scope.
%   These must be document thoroughly - Descriptive name,
%   where used and for what purpose

var isIntroWindowOpen : boolean % Flag for Introduction Window state open or closed
var isInstructionsWindowOpen : boolean
var isGameWindowOpen : boolean


var GameBoardArray : array 1 .. 8, 1 .. 8 of int %Array used to store the peices on the Game Board
var GameBoardArrayHard : array 1 .. 8, 1 .. 8 of int %Array used for temp storage
var GameBoardGrid : pointer to Grid
new GameBoardGrid
var Player : int := 1 %Variable whose value used to determine which player's turn it is. Odd numbers are player 1; even ones are player 2.
var PlayerTurn : int := 1
var PlayerOneScore : int := 0 %Score counter for player 1
var PlayerTwoScore : int := 0 %Scout counter for player 2
var Winnerisblack : boolean
var row, col : int %Output parameters used to store the values of the row and column selected by the players for their moves



proc setInitialGameValues

    isIntroWindowOpen := false
    isInstructionsWindowOpen := false

end setInitialGameValues

%Global Vars for execute move, taken from isLegal
var exeDirection : array 1 .. 8 of boolean
var directionText : array 1 .. 8 of string := init ("north", "northeast", "east", "southeast", "south", "southwest", "west", "northwest")

for i : lower (exeDirection) .. upper (exeDirection)
    exeDirection (i) := false
end for

%Global Vars for Text Fonts
var introfont : int
var introfont1 : int
introfont := Font.New ("Impact:30:bold, italic")
introfont1 := Font.New ("Impact:16")

%Declare Font
var font : int
font := Font.New ("serif:20")

var font2 : int
font2 := Font.New ("serif:35")


%Global Vars for Windows\
var wininID : int
var winoutID : int
var winID : int
var winnameID : int

%Global Vars for procedure togglemusic
var isMusicOn : boolean := true
var isWindowOpen : int

%Global Vars for AI ARRAY
var chooseMoveNum : int
var x, y : int
var LegalRows : array 1 .. 100 of int
var LegalCols : array 1 .. 100 of int

var playerMoved : boolean := false

%Player Names
var PlayerOneName : string := "Player 1"
var PlayerTwoName : string := "Player 2"
