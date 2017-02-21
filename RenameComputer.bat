@ECHO OFF

IF [%1]==[] (
	ECHO No name supplied!
	) ELSE (
	WMIC ComputerSystem Where Name="%COMPUTERNAME%" Call Rename Name="%1"
	ECHO Computer renamed to %1! Restarting...
	SHUTDOWN /R /T 10
	)