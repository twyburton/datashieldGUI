packages = function(){

	# GUI component package
	if( !require(tcltk) ){
		install.packages("tcltk")
		library(tcltk)
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
