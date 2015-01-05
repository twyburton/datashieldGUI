datashieldGUI
=============

GUI Purpose
-----------

The purpose of the GUI is to make running DataSHIELD easier for someone who has not used R before.
The aim is not to make DataSHIELD useable without any R knowledge because without R knowledge the full power of R and DataSHIELD would not be available.
This should instead be used as a tool to help gain experience with R.


Package Installer
-----------------

The GUI makes the process easier by managing opal packages. When running the GUI for the first time it will install the opal packages and its dependencies.
It will then load them each time you start the GUI.

The GUI also ensures that all DataSHIELD packages are loaded into the R environment.

The DataSHIELD Package Installer is used to install DataSHIELD packages on R. The user can select which packages from the four options (base,graphics,modelling,stats) to install.

The Package Installer:

- Manages installing and importing opal packages
- Manages installing DataSHIELD packages
- Manages importing required DS packages.

Real Time Analysis
------------------

The Real Time Analysis Tool allows a user to login to an Opal/DataSHIELD server and perform an analysis by clicking the button for the function they wish to use.
The user can then type in the appropriate input to execute the function into the popup boxes.
At the end of the analysis session the user can then logout of the Opal/DataSHIELD server.

Script Creator
--------------

The Script Creator allows the user to create a DataSHIELD R script that they can then save.
This can then be run at a later date and can be run multiple times very easily.
The user does not need to be log onto a server to create a script.
The GUI automatically handles importing the required packages for the script to run.

GUI.conf File
-------------

The GUI.conf file can be used to save login details so that the user does not need to type on the login data every time.

Requirements
------------

- R >= Version 3.1.2 (r-base, r-base-dev)
- libcurl4-openssl-dev

How To Run The GUI
------------------

To execute use R function
```
source("Path/To/gui.R")
```
