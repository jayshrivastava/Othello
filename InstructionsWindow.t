
% This is the font window file


% opens a new window and displays the graphics messages to this window
proc displayInstructionsWindow
    fork click
    % Open the window
    var wininstructID : int
    wininstructID := Window.Open ("position:top;center,graphics:1200;900,title:Read the Instructions")

    isInstructionsWindowOpen := true
    var quitButton := GUI.CreateButton (maxx - 100, 25, 0, "Close", QuitInstructionsWindowButtonPressed)

    var stream : int
    var sword : string

    open : stream, "Files/Text/Instructions.txt", get

    loop
	exit when eof (stream)
	get : stream, sword : *

	put sword
    end loop

    close : stream

    % Window will continue until quit button is pressed
    loop
	exit when GUI.ProcessEvent or isInstructionsWindowOpen = false
    end loop
    %close/release the window
   Window.Hide (wininstructID)
    % release the button
    GUI.Dispose (quitButton)

end displayInstructionsWindow
