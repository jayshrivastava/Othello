%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:
%Date:
%Course:  ICS3CU1
%Teacher:
%Program Name:
%Descriptions:  Demos how to implement a button and a process
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% main procedure to handle the intro window
procedure displayOutroWindow

    var Player1String, Player2String : string
    Player1String := PlayerOneName + " is Victorious"
    Player2String := PlayerTwoName + " is Victorious"

    % flag that intro screen is open - global var isIntroWindowOpen
    isGameWindowOpen := true
    % Open the window and set as active


    winoutID := Window.Open ("position:top;center,graphics:1024;800,title:EndScreen - Game Over")

    Window.SetActive (winoutID)
    %program to show a logo picture
    displayEndGame
    var pic : int
    if Winnerisblack = true then
	pic := Pic.FileNew ("files/images/outroscreenblack.jpg")
    elsif Winnerisblack = false then
	pic := Pic.FileNew ("files/images/outroscreenwhite.jpg")
    end if

    Pic.Draw (pic, 0, 0, 0)

    fork outroMusic
    %main title

    % create a button
    var quitOutroWindowButton := GUI.CreateButton (maxx - 100, 25, 0, "Quit", quitgame)
    GUI.SetColor (quitOutroWindowButton, white)
    var playagainWindowButton := GUI.CreateButton (250, 25, 0, "Play Again", playagainbuttonpressed)
    GUI.SetColor (playagainWindowButton, white)
    var displaySoundButton := GUI.CreateButton (maxx - 270, 25, 0, "Music On/Off", displaySoundButtonPressed)
    GUI.SetColor (displaySoundButton, white)
    %var displayStartGame := GUI.CreateButton (maxx - 250, maxy div 1, 0, "Start the Game", displayStartGame)


    if Winnerisblack = true then
	Font.Draw (Player1String, 50, 700, introfont, white)
    elsif Winnerisblack = false then
	Font.Draw (Player2String, 50, 700, introfont, white)
    end if

    %Hall of Fame : High Scores

    %Hall of Shame : lost to easy AI

    % Window will continue until quit button is pressed
    loop
	exit when GUI.ProcessEvent or isIntroWindowOpen = false
    end loop

    % release the button
    GUI.Dispose (quitOutroWindowButton)


end displayOutroWindow
