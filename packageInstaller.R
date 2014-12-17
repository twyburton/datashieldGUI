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
