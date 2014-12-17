datashieldGUI
=============

The purpose of the GUI is to make creating and running DataSHIELD R scripts easier for someone who has not used R before.
The aim is not to make DataSHIELD useable without any R knowledge because without R knowledge the full power of R and DataSHIELD would not be available.
This should instead be used as a tool to help gain experience with R.

The GUI makes the process easier by managing opal packages. When running the GUI for the first time it will install the opal packages and its dependencies.
It will then load them each time you start the GUI.

The GUI also ensures that all DataSHIELD packages are loaded into the R environment.


The GUI:

	- Manages installing and importing opal packages
	- Manages importing correct ds packages before executing a script

Dependencies:

	- R >= Version 3.1.2 (r-base, r-base-dev)
	- libcurl4-openssl-dev

To execute use R command source("Path/To/gui.R")
