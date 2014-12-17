#install.packages('dsBaseClient', repos='http://cran.obiba.org', type='source')
#install.packages('dsModellingClient', repos='http://cran.obiba.org', type='source')
#install.packages('dsGraphicsClient', repos='http://cran.obiba.org', type='source')
#install.packages('dsStatsClient', repos='http://cran.obiba.org', type='source')

# opalPackages() function checks that the required opal packages are loaded.
# If they are not installed then they are installed and loaded.

opalPackages = function(){

	# GUI component package
	if( !require(tcltk) ){
		install.packages("tcltk")
		library(tcltk)
	}

	# DataSHIELD dependencies
	if ( !require(fields) ){
		install.packages("fields")
		library(fields)
	}


	# Opal packages
	if( !require(opal) ){
		install.packages("rjson")	
		install.packages("RCurl")

		install.packages('opal', repos='http://cran.obiba.org', type='source')
		library(opal)
	}
	if( !require(opaladmin) ){
		install.packages('opaladmin', repos='http://cran.obiba.org', type='source')
		library(opaladmin)
	}
}


# getDsFunctions() returns a list of all the DataSHIELD functions installed on the R client.
# If a DS package is installed then it is also loaded at the same time.

getDsFunctions = function() {

	# List of all packages to look for
	packagesToCheck = c("dsBaseClient","dsStatsClient","dsGraphicsClient","dsModellingClient")

	# Get list of packages installed
	packageNames <- installed.packages()
	packageList <- as.vector(packageNames[,1])

	# Initilise list to add all packages too
	dsPackagesInstalled <- vector()

	# check if each of the packages to search for in installed. If it is then add to list
	for( i in 1:length(packagesToCheck) ){
		if ( match( packagesToCheck[i] , packageList , nomatch = -1 ) > 0 ) {
			dsPackagesInstalled <- c( dsPackagesInstalled , packagesToCheck[i] )
			library( packagesToCheck[i] , character.only = TRUE)
		}
	}


	# Initilise list of all functions
	dsAllFunctions <- vector()

	# Go through all the ds packages and add all its functions to dsAllFunctions list
	for( i in 1:length(dsPackagesInstalled) ){
		functions <- ls(paste0( "package:" , dsPackagesInstalled[i]))
		
		for( j in 1:length(functions) ){
			dsAllFunctions <- c (dsAllFunctions, functions[j])
		}

	}

	return( dsAllFunctions ) # <<<<<<<<<<<<< RETURN LIST OF ALL FUNCTIONS AVAILABLE

}

datashieldPackageInstaller = function(){
# Create window
        dspackageinstaller = tktoplevel()
        tkwm.title(dspackageinstaller,'DataSHIELD GUI')
        optionframe = tkframe(dspackageinstaller)


        ########################### FUNCTIONS SECTION ###########################

	installBase = function(){
		if( !require( dsBaseClient ) ){
			install.packages('dsBaseClient', repos='http://cran.obiba.org', type='source')			
		}
	}

	installGraphics = function(){
		if( !require( dsGraphicsClient ) ){
			install.packages('dsGraphicsClient', repos='http://cran.obiba.org', type='source')			
		}
	}

	installModelling = function(){
		if( !require( dsModellingClient ) ){
			install.packages('dsModellingClient', repos='http://cran.obiba.org', type='source')			
		}
	}

	installStats = function(){
		if( !require( dsStatsClient ) ){
			install.packages('dsStatsClient', repos='http://cran.obiba.org', type='source')			
		}
	}

        # Function called when user pressed create analysis
        mainMenu = function(...){
                destroydspackageinstaller() # Destroy menu window
		runGUI()
        }


        # Destroy Window function
        destroydspackageinstaller = function(...)tkdestroy(dspackageinstaller)

        ########################### DRAW WINDOW SECTION ###########################

        tkpack(optionframe)

	optionframeA = tkframe(optionframe)
	optionframe0 = tkframe(optionframe)
	optionframe1 = tkframe(optionframe)
	optionframe2 = tkframe(optionframe)
	optionframe3 = tkframe(optionframe)
	optionframe4 = tkframe(optionframe)
	optionframeB = tkframe(optionframe)

	tkpack(tklabel(optionframeA,text='DS PACKAGE INSTALLER', width=20),side='left')
	tkpack(tklabel(optionframeB,text='Restart GUI after install', width=20),side='left')

        # Control Buttons
        tkpack(tkbutton(optionframe0,text='   dsBaseClient  ',command=installBase),side='left',pady=c(10,5) , padx=c(10,10))
        tkpack(tkbutton(optionframe1,text=' dsGraphicsClient',command=installGraphics),side='left',pady=c(5,5) , padx=c(10,10))
        tkpack(tkbutton(optionframe2,text='dsModellingClient',command=installModelling),side='left',pady=c(5,5) , padx=c(10,10))
        tkpack(tkbutton(optionframe3,text='  dsStatsClient  ',command=installStats),side='left',pady=c(5,10) , padx=c(10,10))
        tkpack(tkbutton(optionframe4,text='Back',command=mainMenu),side='left',pady=c(5,5) , padx=c(10,10))

        tkpack(optionframeA)
        tkpack(optionframe0)
        tkpack(optionframe1)
        tkpack(optionframe2)
        tkpack(optionframe3)
        tkpack(optionframeB)
        tkpack(optionframe4)

}
