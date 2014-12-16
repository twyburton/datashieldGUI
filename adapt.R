getFunctions = function() {

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

	return( dsAllFunctions) # <<<<<<<<<<<<< RETURN LIST OF ALL FUNCTIONS AVAILABLE

}
