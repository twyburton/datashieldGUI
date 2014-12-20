# Get R source data from gui component files
source("runAnalysis.R")
source("createAnalysis.R")
source("packageInstaller.R")
source("realTime.R")

# Main GUI function
runGUI = function(){
	# Create window
	mainMenu = tktoplevel()
	tkwm.title(mainMenu,'DataSHIELD GUI')
	optionframe = tkframe(mainMenu)


	########################### FUNCTIONS SECTION ###########################

	# Function called when user pressed reun analysis
	runAnalysisButton = function(...){

		# Ask user for script file
		scriptFileName <- tclvalue(tkgetOpenFile())

		# while no file is selected display message box then ask again
		if( !nchar(scriptFileName) ){
			tkmessageBox(message = "No file was selected!")
		} else {
			destroyMainMenu() # Destroy menu window
			runAnalysisFromFile(scriptFileName)
		}
	}

	# Function called when user pressed create analysis
	createAnalysisButton = function(...){
		drawCreateAnalysisWindow()
		destroyMainMenu() # Destroy menu window
	}

	# Function called when user pressed real time analysis
	realTimeAnalysisButton = function(){
		destroyMainMenu() # Destroy menu window
		realTimeAnalysisRun()
	}

	# Function called when the user presses button to go to install packages menu
	createDatashieldPackageInstaller = function(){
		destroyMainMenu()	
		datashieldPackageInstaller()
	}


	# Destroy Window function
	destroyMainMenu = function(...)tkdestroy(mainMenu)

	########################### DRAW WINDOW SECTION ###########################

	tkpack(optionframe)

	# Control Buttons

	installerframe = tkframe(mainMenu)
	quitframe = tkframe(mainMenu)

	tkpack(tkbutton(optionframe,text='Run Script',command=runAnalysisButton),side='left',pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(optionframe,text='Create Script',command=createAnalysisButton),side='left',pady=c(10,10) , padx=c(5,5))
	tkpack(tkbutton(optionframe,text='Real Time Analysis',command=realTimeAnalysisButton),side='left',pady=c(10,10) , padx=c(10,5))


	tkpack(tkbutton(installerframe,text='DataSHIELD Package Installer',command=createDatashieldPackageInstaller),side='top',pady=c(10,10) , padx=c(5,10))
	tkpack(tkbutton(quitframe,text='Quit',command=destroyMainMenu),side='top',pady=c(10,10) , padx=c(5,10))

	tkpack(installerframe)
	tkpack(quitframe)




}


# Check Core Packages are installed and load them. If not installed then install them.
opalPackages()

# Get list available DS functions and import packages
dsFunctionList <<- getDsFunctions()


print(dsFunctionList)
# Run the first GUI window
runGUI()


# ANALYSIS
#ds.mean
#ds.table2D
#ds.histogram

# ASSIGN
#ds.log
#ds.exp
