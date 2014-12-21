############ Real Time Analysis Function ############


#### Statistical Analysis ####
rt.ds.table2D = function(){
	
	ex.ds.table2D = function(){
		tkdestroy(window.ds.table2D)
		x <- toString(tclvalue(xinput_))
		y <- toString(tclvalue(yinput_))
		type <- toString(tclvalue(typeinput_))
		print(eval(parse(text=   paste0("ds.table2D('", x , "','" , y , "','", type ,"')" , sep="")   )))
	}

	cl.ds.table2D = function(){
		tkdestroy(window.ds.table2D)
	}

	window.ds.table2D = tktoplevel()
	tkwm.title(window.ds.table2D,'ds.table2D()')
	inputframe0 = tkframe(window.ds.table2D)

	xinput_ = tclVar( 'D$LAB_HDL' )
	yinput_ = tclVar( 'D$GENDER' )
	typeinput_ = tclVar( 'combine' )

	inputframe1 = tkframe(window.ds.table2D)
	tkpack(tklabel(inputframe1,text='X', width=20),side='left')
	tkpack(tkentry(inputframe1,width=30,textvariable=xinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe2 = tkframe(window.ds.table2D)
	tkpack(tklabel(inputframe2,text='Y', width=20),side='left')
	tkpack(tkentry(inputframe2,width=30,textvariable=yinput_), side='left', pady=c(2,2), padx=c(2,5))

	inputframe3 = tkframe(window.ds.table2D)
	tkpack(tklabel(inputframe3,text='Type', width=20),side='left')
	tkpack(tkentry(inputframe3,width=30,textvariable=typeinput_), side='left', pady=c(2,2), padx=c(2,5))

	tkpack(tkbutton(inputframe0,text='Execute',command=ex.ds.table2D),side='left', pady=c(10,10) , padx=c(10,5))
	tkpack(tkbutton(inputframe0,text='Cancel',command=cl.ds.table2D),side='left', pady=c(10,10) , padx=c(5,10))

	tkpack(inputframe1)
	tkpack(inputframe2)
	tkpack(inputframe3)
	tkpack(inputframe0)
}

