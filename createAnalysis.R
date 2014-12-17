drawCreateAnalysisWindow = function(){

	server_conf <- ""
	url_conf <- ""
	user_conf <- ""
	password_conf <- ""
	table_conf <- ""

	# Get config file data
	if ( file.exists("GUI.conf") ){
		conf = read.table("GUI.conf", sep="\t")

		server_conf <- toString(conf[1,2])
		url_conf <- toString(conf[2,2])
		user_conf <- toString(conf[3,2])
		password_conf <- toString(conf[4,2])
		table_conf <- toString(conf[5,2])

	}
	
	# Create window
	base = tktoplevel()
	tkwm.title(base,'DataSHIELD GUI')

	# Set up destory window
	destroy = function(...)tkdestroy(base)
	run = function(...){
		# Save ds script to file
		filenameToSave <- toString(tclvalue(savename_))

		fileConnection <- file(filenameToSave)

			dataToWrite <- vector()
			dataToWrite[1] <- "#%ds%1"
			dataToWrite[2] <- paste0( "server <- '" , toString(tclvalue(servername_)) , "'" ,sep="")
			dataToWrite[3] <- paste0( "url <- '" , toString(tclvalue(url_)) , "'" ,sep="")
			dataToWrite[4] <- paste0( "user <- '" , toString(tclvalue(user_)) , "'" ,sep="")
			dataToWrite[5] <- paste0( "password <- '" , toString(tclvalue(password_)) , "'" ,sep="")
			dataToWrite[6] <- paste0( "table <- '" , toString(tclvalue(table_)) , "'" ,sep="")
			dataToWrite[7] <- paste0( "myvars <- '" , toString(tclvalue(variables_)) , "'" ,sep="")
			dataToWrite[8] <- "logindata <- data.frame(server,url,user,password,table)"
			dataToWrite[9] <- "opals <- datashield.login(logins=logindata, variables=myvars , assign = TRUE)"

		writeLines(dataToWrite,fileConnection)

		# Close file connection
		close(fileConnection)

		tkdestroy(base)
		runGUI()
	}

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
	########################### DS FUNCTIONS SECTION ###########################

	########################### END DS FUNCTIONS SECTION ###########################
	########################### SAVE SECTION ###########################

	# Create frame to hold data section
	saveframe = tkframe(windowframe)

	saveframe0 = tkframe(saveframe)
	tkpack(tklabel(saveframe0,text='SAVE SCRIPT', width=20),side='left')

	saveframe1 = tkframe(saveframe)
	tkpack(tklabel(saveframe1,text='Script Save Name', width=20),side='left')
	savename_ = tclVar( "myscript.ds" )
	tkpack(tkentry(saveframe1,width=30,textvariable=savename_), side='left', pady=c(2,2), padx=c(2,5))

	# Pack input frames
	tkpack(saveframe0,side='top')
	tkpack(saveframe1,side='top')

	tkpack(saveframe)

	########################### END SAVE SECTION ###########################

	# Pack frames into window
	tkpack(windowframe)

	# Control Buttons
	tkpack(tkbutton(windowframe,text='Save Script',command=run),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(windowframe,text='Quit',command=destroy),side='left', pady=c(10,10) , padx=c(5,10))
}
