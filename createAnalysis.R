drawCreateAnalysisWindow = function(){
	# Create window
	base = tktoplevel()
	tkwm.title(base,'DataSHIELD GUI')

	# Set up destory window
	destroy = function(...)tkdestroy(base)
	run = function(...)tkdestroy(base)

	# Create main frame to hold componenets
	windowframe = tkframe(base)

	########################### LOGIN SECTION ###########################

	# Create frame to hold login detail
	loginframe = tkframe(windowframe)

	# Create variables associated with login
	servername_ = tclVar('')
	user_ = tclVar('')
	password_ = tclVar('')
	table_ = tclVar('')

	# Create and pack input fields
	loginframe0 = tkframe(loginframe)
	tkpack(tklabel(loginframe0,text='LOGIN DETAILS', width=20),side='left')

	loginframe1 = tkframe(loginframe)
	tkpack(tklabel(loginframe1,text='Server Name', width=20),side='left')
	tkpack(tkentry(loginframe1,width=10,textvariable=servername_), side='left', pady=c(2,2))

	loginframe2 = tkframe(loginframe)
	tkpack(tklabel(loginframe2,text='User', width=20),side='left')
	tkpack(tkentry(loginframe2,width=10,textvariable=user_), side='left', pady=c(2,2))

	loginframe3 = tkframe(loginframe)
	tkpack(tklabel(loginframe3,text='Password', width=20),side='left')
	tkpack(tkentry(loginframe3,width=10,textvariable=password_), side='left', pady=c(2,2))

	loginframe4 = tkframe(loginframe)
	tkpack(tklabel(loginframe4,text='Table', width=20),side='left')
	tkpack(tkentry(loginframe4,width=10,textvariable=table_), side='left', pady=c(2,2))

	# Pack input frames
	tkpack(loginframe0,side='top')
	tkpack(loginframe1,side='top')
	tkpack(loginframe2,side='top')
	tkpack(loginframe3,side='top')
	tkpack(loginframe4,side='top')

	tkpack(loginframe)

	########################### END LOGIN SECTION ###########################

	# Pack frames into window
	tkpack(windowframe)

	# Control Buttons
	tkpack(tkbutton(windowframe,text='Analyse',command=run),side='left')
	tkpack(tkbutton(windowframe,text='Quit',command=destroy),side='left')
}
