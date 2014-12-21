############ Real Time Analysis Function ############


#### Statistical Analysis ####
rt.ds.exp = function(){
	
	ex.ds.exp = function(){
		tkdestroy(window.ds.exp)
		x <- toString(tclvalue(xinput_))
		newobj <- toString(tclvalue(newobjinput_))
		print(eval(parse(text=   paste0("ds.exp('", x , "','", newobj ,"')" , sep="")   )))
	}

	cl.ds.exp = function(){
		tkdestroy(window.ds.exp)
	}

	window.ds.exp = tktoplevel()
	tkwm.title(window.ds.exp,'ds.exp()')
	inputframe0 = tkframe(window.ds.exp)

	xinput_ = tclVar( 'D$LAB_HDL' )
	newobjinput_ = tclVar( 'new_obj' )

	inputframe1 = tkframe(window.ds.exp)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.exp)
	tkpack(tklabel(inputframe2,text='New Object', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=newobjinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.exp),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.exp),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe0)
}

