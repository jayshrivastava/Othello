%MUSIC
process introMusic
	Music.PlayFileLoop ("files/music/Greg Edmonson - Nate's Theme.mp3")
end introMusic
%MUSIC
process backgroundMusic
	Music.PlayFileLoop ("files/music/Audiomachine - Rising Dawn.mp3")
	Music.PlayFileLoop ("files/music/Audiomachine - Transcendence.mp3")
end backgroundMusic
%MUSIC
process outroMusic
	Music.PlayFileLoop ("files/music/Audiomachine - Veni Vidi Vici.mp3")
end outroMusic
%BUTTON
process click
    Music.PlayFile ("files/music/click.wav")
end click
