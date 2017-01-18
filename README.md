It started out with a simple plan: back up the network configuration to disk, so that it can be restored after a fresh image is burned to the disk.

It seemed so simple! Microsoft has a tool specifically for this - netsh!
And for a short while, it was.

Until the meat meet the metal, of course: as of the release of Server 2008, netsh no longer records DNS settings in the interface dump.
As such, they are not restored when a technician runs the command "netsh exec {netsh dump file}".

--------

This project consists of two batch files: the first is **SaveNetworkConfig.bat.**
This script writes out the network interface information, then parses the current DNS settings and writes the appropriate commands to the end of the saved configuration information file to allow them to be automatically restored.

The second batch file, **RestoreNetworkConfig.bat** is simply a wrapper around the "netsh exec {config file}" command to ensure that the configuration file actually exists prior to running the command.

--------

NB: While SaveNetworkConfig does NOT require administration privileges to run, RestoreNetworkConfig MUST be run with administrator privileges, or else no changes will be made.


Hopefully someone out there will find this useful.

G.Ambatte

--------

Note: No configuration file is included in this repository, so RestoreNetworkConfig will not work out of the box. This is the desired function, as there is no way to know what the appropriate configuration will be for the system.