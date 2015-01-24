# Real time ds.table1D function
rt.ds.table1D = function(){
	
	# Execute function
	ex.ds.table1D = function(){
		tkdestroy(window.ds.table1D)
		x <- toString(tclvalue(xinput_))
		type <- toString(tclvalue(typeinput_))
		print(eval(parse(text=   paste0("ds.table1D('", x ,"','", type ,"')" , sep="")   )))
	}

	# Cancel function
	cl.ds.table1D = function(){
		tkdestroy(window.ds.table1D)
	}

	# Draw input window
	window.ds.table1D = tktoplevel()
	tkwm.title(window.ds.table1D,'ds.table1D()')
	inputframe0 = tkframe(window.ds.table1D)

	xinput_ = tclVar( 'D$LAB_HDL' )
	typeinput_ = tclVar( 'combine' )

	inputframe1 = tkframe(window.ds.table1D)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.table1D)
	tkpack(tklabel(inputframe2,text='Type', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=typeinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.table1D),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.table1D),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe0)
}

