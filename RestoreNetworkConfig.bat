:: SaveNetworkConfig.bat
:: Sean Robertson
:: Jan 2017

:: Run this script to restore the saved network configuration!
:: Must be run as admin!!!

@ECHO OFF

SETLOCAL EnableDelayedExpansion

IF EXIST %0\..\NETWORK.CFG (
	NETSH EXEC %0\..\NETWORK.CFG
	) ELSE (
	ECHO No network configuration found!!!
	PAUSE
	)