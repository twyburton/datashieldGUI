# Real Time Login Window
rTLogin = function(){

	server_conf <- ""
	url_conf <- ""
	user_conf <- ""
	password_conf <- ""
	table_conf <- ""
	autolog_conf <- "false"

	# Get config file data
	if ( file.exists("GUI.conf") ){
		conf = read.table("GUI.conf", sep="\t")

		server_conf <- toString(conf[1,2])
		url_conf <- toString(conf[2,2])
		user_conf <- toString(conf[3,2])
		password_conf <- toString(conf[4,2])
		table_conf <- toString(conf[5,2])
		autolog_conf <- toString(conf[6,2])
	}
	
	# Create window
	base = tktoplevel()
	tkwm.title(base,'DataSHIELD GUI')

	########################### WINDOW FUNCTIONS SECTION ###########################

	# Set up destory window
	destroy = function(...){
		tkdestroy(base)
		runGUI()
	}

	# Login function
	login = function(){

			tkdestroy(base)
			
			dataToWrite <- vector()

			if (  grepl( "," , toString(tclvalue(servername_)) )  ){ # Multiple Servers
				dataToWrite[1] <- paste0( "server <<- " 	, strsplit( toString(tclvalue(servername_)), 	"," ) ,sep="")
				dataToWrite[2] <- paste0( "url <<- " 		, strsplit( toString(tclvalue(url_)) ,		"," ) ,sep="")
				dataToWrite[3] <- paste0( "user <<- " 		, strsplit( toString(tclvalue(user_)) , 	"," ) ,sep="")
				dataToWrite[4] <- paste0( "password <<- " 	, strsplit( toString(tclvalue(password_)) , 	"," ) ,sep="")
				dataToWrite[5] <- paste0( "table <<- " 		, strsplit( toString(tclvalue(table_)) , 	"," ) ,sep="")
				dataToWrite[6] <- paste0( "myvars <<- " 	, strsplit( toString(tclvalue(variables_)) , 	"," ) ,sep="")
			} else {						 # Single Server
				dataToWrite[1] <- paste0( 'server <- "' 	, toString(tclvalue(servername_))	, '"' ,sep="")
				dataToWrite[2] <- paste0( 'url <- "' 		, toString(tclvalue(url_)) 		, '"' ,sep="")
				dataToWrite[3] <- paste0( 'user <- "' 		, toString(tclvalue(user_)) 		, '"' ,sep="")
				dataToWrite[4] <- paste0( 'password <- "' 	, toString(tclvalue(password_)) 	, '"' ,sep="")
				dataToWrite[5] <- paste0( 'table <- "' 	, toString(tclvalue(table_)) 		, '"' ,sep="")
				dataToWrite[6] <- paste0( 'myvars <- "' 	, toString(tclvalue(variables_)) 	, '"' ,sep="")
			}

			dataToWrite[7] <- "logindata <<- data.frame(server,url,user,password,table)"

			if ( toString(tclvalue(variables_)) == "NULL" ){
				dataToWrite[8] <- "opals <<- datashield.login(logins=logindata, assign = TRUE)"
			} else {
				dataToWrite[8] <- "opals <<- datashield.login(logins=logindata, variables=myvars , assign = TRUE)"
			}


			for( i in 1:8 ){
				eval(parse(text = dataToWrite[i]))
			}

			##### GET VARIABLES FROM SERVER #####
			cat("\nFetching List of variables from server...")

			# get the names of the variables
			varnames <- unique(unlist(ds.colnames('D')))

			# get variables types
			types <- c()
			for(i in 1:length(varnames)){
				t <- unique(unlist(ds.class(paste0('D$', varnames[i]))))
				types <- append(types, t)
			}

			# create the output table
			table2display <- data.frame(varnames,types)
			colnames(table2display) <- c("Name", "Type")

			print(table2display)

			##### continue with real time analysis
			functionSelection()
			

	}

	########################### END WINDOW FUNCTIONS SECTION ###########################

	# Create main frame to hold componenets
	windowframe = tkframe(base)

	########################### LOGIN SECTION ###########################

	# Create frame to hold login detail
	loginframe = tkframe(windowframe)

	# Create variables associated with login
	servername_ = tclVar( server_conf )
	url_ = tclVar( url_conf )
	user_ = tclVar( user_conf )
	password_ = tclVar( password_conf )
	table_ = tclVar( table_conf )

	# Create and pack input fields
	loginframe0 = tkframe(loginframe)
	tkpack(tklabel(loginframe0,text='LOGIN DETAILS', width=20),side='left')

	loginframe1 = tkframe(loginframe)
	tkpack(tklabel(loginframe1,text='Server Name', width=20),side='left')
	tkpack(tkentry(loginframe1,width=30,textvariable=servername_), side='left', pady=c(2,2), padx=c(2,5))

	loginframe2 = tkframe(loginframe)
	tkpack(tklabel(loginframe2,text='URL', width=20),side='left')
	tkpack(tkentry(loginframe2,width=30,textvariable=url_), side='left', pady=c(2,2), padx=c(2,5))

	loginframe3 = tkframe(loginframe)
	tkpack(tklabel(loginframe3,text='User', width=20),side='left')
	tkpack(tkentry(loginframe3,width=30,textvariable=user_), side='left', pady=c(2,2), padx=c(2,5))

	loginframe4 = tkframe(loginframe)
	tkpack(tklabel(loginframe4,text='Password', width=20),side='left')
	tkpack(tkentry(loginframe4,width=30,textvariable=password_), side='left', pady=c(2,2), padx=c(2,5))

	loginframe5 = tkframe(loginframe)
	tkpack(tklabel(loginframe5,text='Table', width=20),side='left')
	tkpack(tkentry(loginframe5,width=30,textvariable=table_), side='left', pady=c(2,2), padx=c(2,5))

	# Pack input frames
	tkpack(loginframe0,side='top')
	tkpack(loginframe1,side='top')
	tkpack(loginframe2,side='top')
	tkpack(loginframe3,side='top')
	tkpack(loginframe4,side='top')
	tkpack(loginframe5,side='top')

	tkpack(loginframe)

	########################### END LOGIN SECTION ###########################
        ########################### DATA SELECTION SECTION ###########################

        # Create frame to hold data section
        dataframe = tkframe(windowframe)

        dataframe0 = tkframe(dataframe)
        tkpack(tklabel(dataframe0,text='DATA SELECTION', width=20),side='left')

        dataframe1 = tkframe(dataframe)
        tkpack(tklabel(dataframe1,text='Variables', width=20),side='left')
        variables_ = tclVar( "NULL" )
        tkpack(tkentry(dataframe1,width=30,textvariable=variables_), side='left', pady=c(2,2), padx=c(2,5))

        # Pack input frames
        tkpack(dataframe0,side='top')
        tkpack(dataframe1,side='top')

        tkpack(dataframe)

        ########################### END DATA SELECTION SECTION ###########################

	tkpack(windowframe)

	# Control Buttons
	tkpack(tkbutton(windowframe,text='Login',command=login),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(windowframe,text='Back',command=destroy),side='left', pady=c(10,10) , padx=c(5,10))

	if ( autolog_conf == "true" ){
		login()
	}
	
}


### RUN REAL TIME ANALYSIS CORE FUNCTION
functionSelection = function(){

	# Create window
	base = tktoplevel()
	tkwm.title(base,'DataSHIELD Lite')

	###########################  REAL TIME ANALYSIS FUNCTIONS ##########################################################
	## LOGOUT OF OPALS ##
	logout = function(){
		datashield.logout(opals)
		tkdestroy(base)
		runGUI()
	}

	########################### END REAL TIME ANALYSIS FUNCTIONS ##########################################################

	# Create main frame to hold componenets
	windowframe = tkframe(base)

	# Create frames to hold analysis and assign
	analysisframe = tkframe(windowframe)
	assignframe = tkframe(windowframe)

	######## ANALYSIS FUNCTION BUTTONS ########

        analysisframe0 = tkframe(analysisframe)
        tkpack(tklabel(analysisframe0,text='Analysis', width=20),side='left')

        analysisframe1 = tkframe(analysisframe)
	tkpack(tkbutton(analysisframe1,text='ds.mean',command=rt.ds.mean),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(analysisframe1,text='ds.table2D',command=rt.ds.table2D),side='left', pady=c(10,10) , padx=c(5,5))
	tkpack(tkbutton(analysisframe1,text='ds.histogram',command=rt.ds.histogram),side='left', pady=c(10,10) , padx=c(5,5))
	tkpack(tkbutton(analysisframe1,text='ds.colnames',command=rt.ds.colnames),side='left', pady=c(10,10) , padx=c(5,10))

        analysisframe2 = tkframe(analysisframe)
	tkpack(tkbutton(analysisframe2,text='ds.quantileMean',command=rt.ds.quantileMean),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(analysisframe2,text='ds.table1D',command=rt.ds.table1D),side='left', pady=c(10,10) , padx=c(5,10))
	
	tkpack(analysisframe)
	tkpack(analysisframe0)
	tkpack(analysisframe1)
	tkpack(analysisframe2)

	######## ASSIGN FUNCTION BUTTONS ########

        assignframe0 = tkframe(assignframe)
        tkpack(tklabel(assignframe0,text='Assign', width=20),side='left')

        assignframe1 = tkframe(assignframe)
	tkpack(tkbutton(assignframe1,text='ds.log',command=rt.ds.log),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(assignframe1,text='ds.exp',command=rt.ds.exp),side='left', pady=c(10,10) , padx=c(5,5))


	tkpack(assignframe)
	tkpack(assignframe0)
	tkpack(assignframe1)




	tkpack(windowframe)

	# Control Buttons
	tkpack(tkbutton(windowframe,text='Logout',command=logout),side='left', pady=c(10,10) , padx=c(10,5))

}





#### MAIN INITILISER FUNCTION
realTimeAnalysisRun = function (){

	# Import source files for rt functions
	for( i in 1:length(dsFunctionList) ){
		fileToSource <- paste0("rtfunc/rt.", dsFunctionList[i]  ,".R", sep="")

		if ( file.exists( fileToSource )  ){
			source(fileToSource)
		}
	}

	# Start login
	rTLogin()
}

