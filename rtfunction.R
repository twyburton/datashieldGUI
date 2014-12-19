############ Real Time Analysis Function ############


#### Statistical Analysis ####
rt.ds.mean = function(){
	print(eval(parse(text="ds.mean('D$LAB_HDL','combine')")))
}

rt.ds.table2D = function(){
	print(eval(parse(text="ds.table2D('D$LAB_HDL','D$LAB_TRIG','combine')")))
}

rt.ds.histogram = function(){
	print(eval(parse(text="ds.histogram('D$LAB_HDL','combine')")))
}




#### Statistical Analysis ####
rt.ds.log = function(){

}

rt.ds.exp = function(){

}


