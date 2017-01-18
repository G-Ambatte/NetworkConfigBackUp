:: SaveNetworkConfig.bat
:: Sean Robertson
:: Jan 2017

:: Run this script to save the network configuration!

@ECHO OFF

SETLOCAL EnableDelayedExpansion

IF EXIST %0\..\NETWORK.CFG DEL %0\..\NETWORK.CFG
netsh interface dump > %0\..\NETWORK.CFG

REM IF EXIST DNS.TXT DEL DNS.TXT

for /F "tokens=*" %%G in ('netsh interface ip show dnsservers') do (
	set TOKEN=%%G
	set BLANK=0

	REM echo T: !TOKEN!
	if "!TOKEN:~0,27!"=="Configuration for interface" (
		REM echo O: !TOKEN:~29,-1!
		set NAME=!TOKEN:~29,-1!
		set BLANK=1
		)
	if "!TOKEN:~0,38!"=="DNS servers configured through DHCP:  " (
		REM echo O: !TOKEN:~38!
		set BLANK=1
		)
	if "!TOKEN:~0,38!"=="Register with which suffix:           " (
		REM echo O: !TOKEN:~38!
		set BLANK=1
		)
	if "!TOKEN:~0,38!"=="Statically Configured DNS Servers:    " (
		REM echo O: !TOKEN:~38!
		if "!TOKEN:~38!" NEQ "None" (
			REM echo interface ip set dns name="!NAME!" source=static address=!TOKEN:~38! >> DNS.TXT
			echo interface ip set dns name="!NAME!" source=static address=!TOKEN:~38! >> %0\..\NETWORK.CFG
			)
		set BLANK=1
		)
	if !BLANK!==0 (
		REM echo O: !TOKEN!
		REM echo interface ip add dns name="!NAME!" addr=!TOKEN! index=2 >> DNS.TXT
		echo interface ip add dns name="!NAME!" addr=!TOKEN! index=2 >> %0\..\NETWORK.CFG
		)
	)

REM ECHO ====================

REM IF EXIST DNS.TXT TYPE DNS.TXT