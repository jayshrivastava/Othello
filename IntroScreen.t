%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:
%Date:
%Course:  ICS3CU1
%Teacher:
%Program Name:
%Descriptions:  Demos how to implement a button and a process
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% main procedure to handle the intro window
procedure displayIntroWindow

    % flag that intro screen is open - global var isIntroWindowOpen
    isIntroWindowOpen := true
    % Open the window

    wininID := Window.Open ("position:top;center,graphics:1024;800,title:Welcome to Othello - Introduction Screen")

    %program to show a logo picture

    var pic : int := Pic.FileNew ("files/images/introscreenbackground.jpg")

    Pic.Draw (pic, 0, 0, 0)

    fork introMusic

    %main title

    Font.Draw ("OTHELLO", 50, 740, introfont, white)
    Font.Draw ("Singleplayer", 50, 690, introfont1, white)
    Font.Draw ("Multiplayer", 50, 580, introfont1, white)
    Font.Draw ("Tutorial", 50, 510, introfont1, white)
    Font.Draw ("Options", 50, 400, introfont1, white)
    % create buttons
    var displayTutorial := GUI.CreateButton (50, 470, 0, "Play Tutorial", displayGameWindowTutorial)
    GUI.SetColor (displayTutorial, white)
    var quitIntroWindowButton := GUI.CreateButton (maxx - 150, 25, 0, "Quit Intro Window", QuitIntroWindowButtonPressed)
    GUI.SetColor (quitIntroWindowButton, white)
    var displayInstructionsButton := GUI.CreateButton (50, 430, 0, "Display Instructions", displayInstructionsWindow)
    GUI.SetColor (displayInstructionsButton, white)
    var displayGameButton := GUI.CreateButton (50, 540, 0, "Human vs Human", displayGameWindow)
    GUI.SetColor (displayGameButton, white)
    var displayEasyButton := GUI.CreateButton (50, 650, 0, "Human vs Easy AI", displayGameWindowEasyAI)
    GUI.SetColor (displayEasyButton, white)
    var displayHardButton := GUI.CreateButton (50, 610, 0, "Human vs Hard AI", displayGameWindowHardAI)
    GUI.SetColor (displayHardButton, white)
    var displaySoundButton := GUI.CreateButton (maxx - 270, 25, 0, "Music On/Off", displaySoundButtonPressed)
    GUI.SetColor (displaySoundButton, white)
    var changeNamesButton := GUI.CreateButton (50, 360, 0, "CustomizeNames", changeNames)
    GUI.SetColor (changeNamesButton, white)

    % Window will continue until quit button is pressed
    loop
	exit when GUI.ProcessEvent or isIntroWindowOpen = false

    end loop

    %close/release the window
    % Window.Close (winID)
    % release the button
    GUI.Dispose (quitIntroWindowButton)
    GUI.Dispose (displayInstructionsButton)
    GUI.Dispose (displayGameButton)


end displayIntroWindow
