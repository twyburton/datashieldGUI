############ Real Time Analysis Function ############


#### Statistical Analysis ####
rt.ds.log = function(){
	
	ex.ds.log = function(){
		tkdestroy(window.ds.log)
		x <- toString(tclvalue(xinput_))
		basevar <- toString(tclvalue(baseinput_))
		newobj <- toString(tclvalue(newobjinput_))
		print(eval(parse(text=   paste0("ds.log('", x , "','" , basevar , "','", newobj ,"')" , sep="")   )))
	}

	cl.ds.log = function(){
		tkdestroy(window.ds.log)
	}

	window.ds.log = tktoplevel()
	tkwm.title(window.ds.log,'ds.log()')
	inputframe0 = tkframe(window.ds.log)

	xinput_ = tclVar( 'D$LAB_HDL' )
	baseinput_ = tclVar( 'exp(1)' )
	newobjinput_ = tclVar( 'new_obj' )

	inputframe1 = tkframe(window.ds.log)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.log)
	tkpack(tklabel(inputframe2,text='Base', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=baseinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe3 = tkframe(window.ds.log)
	tkpack(tklabel(inputframe3,text='New Object', width=20),side='left')
	tkpack(tkentry(inputframe3,width=30,textvariable=newobjinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.log),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.log),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe3)
	tkpack(inputframe0)
}

