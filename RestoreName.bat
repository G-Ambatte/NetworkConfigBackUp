@ECHO OFF

IF NOT EXIST NAME.CFG (
	ECHO Name not saved!
	) ELSE (
	<NAME.CFG (SET /P NAME=)
	RENAMECOMPUTER.BAT %NAME%
	)