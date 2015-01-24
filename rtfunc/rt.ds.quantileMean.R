# Real time ds.quantileMean function
rt.ds.quantileMean = function(){

	# Execute function
	ex.ds.quantileMean = function(){
		tkdestroy(window.ds.quantileMean)
		x <- toString(tclvalue(xinput_))
		type <- toString(tclvalue(typeinput_))
		print(eval(parse(text=   paste0("ds.quantileMean('", x ,"','", type ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.quantileMean = function(){
		tkdestroy(window.ds.quantileMean)
	}

	# Draw input window
	window.ds.quantileMean = tktoplevel()
	tkwm.title(window.ds.quantileMean,'ds.quantileMean()')
	inputframe0 = tkframe(window.ds.quantileMean)

	xinput_ = tclVar( 'D$LAB_HDL' )
	typeinput_ = tclVar( 'combine' )

	inputframe1 = tkframe(window.ds.quantileMean)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.quantileMean)
	tkpack(tklabel(inputframe2,text='Type', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=typeinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.quantileMean),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.quantileMean),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe0)
}

