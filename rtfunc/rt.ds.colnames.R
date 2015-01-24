# Real time ds.colnames function
rt.ds.colnames = function(){

	# Execute function
	ex.ds.colnames = function(){
		tkdestroy(window.ds.colnames)
		x <- toString(tclvalue(xinput_))
		print(eval(parse(text=   paste0("ds.colnames('", x ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.colnames = function(){
		tkdestroy(window.ds.colnames)
	}

	# Draw input window
	window.ds.colnames = tktoplevel()
	tkwm.title(window.ds.colnames,'ds.colnames()')
	inputframe0 = tkframe(window.ds.colnames)

	xinput_ = tclVar( 'D' )

	inputframe1 = tkframe(window.ds.colnames)
	tkpack(tklabel(inputframe1,text='Dataframe Name', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.colnames),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.colnames),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe0)
}

