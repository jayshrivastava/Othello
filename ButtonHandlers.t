% Button File - code to handle button events
% Intro Window Procedures



%Displays Instructions
procedure QuitInstructionsWindowButtonPressed
    fork click
    isInstructionsWindowOpen := false
    GUI.Quit
    delay (100)
    GUI.ResetQuit
    delay (100)
end QuitInstructionsWindowButtonPressed

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

procedure QuitOthelloWindowButtonPressed
    fork click
    GUI.CloseWindow (wininID)
end QuitOthelloWindowButtonPressed

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


procedure playagainbuttonpressed
    fork click
    GUI.CloseWindow (winoutID)
    fork introMusic
    Window.Show (wininID)
    Window.SetActive (wininID)
end playagainbuttonpressed

procedure quitgame
    fork click
    GUI.CloseWindow (winoutID)
    GUI.CloseWindow (wininID)
    Music.PlayFileStop
end quitgame

procedure QuitIntroWindowButtonPressed
    fork click
    GUI.CloseWindow (wininID)
    Music.PlayFileStop
end QuitIntroWindowButtonPressed


procedure displaySoundButtonPressed
    fork click
    toggleMusicOff
end displaySoundButtonPressed

procedure changeNames

    % Open the window

    winnameID := Window.Open ("position:top;center,graphics:400;400,title:Change Player Name")

    %program to show a logo picture

    var pic : int := Pic.FileNew ("files/images/introscreenbackground.jpg")

    Pic.Draw (pic, 0, 0, 0)

    var p1, p2 : string := ""

    put "Enter name for Player 1 (black)"
    get p1
    PlayerOneName := p1

    put "Enter name for Player 2 (white)"
    get p2
    PlayerTwoName := p2

    Window.Close (winnameID)

end changeNames
