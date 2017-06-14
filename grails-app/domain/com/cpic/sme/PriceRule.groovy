package com.cpic.sme

class PriceRule {
	String xz =""
	int price = 0
	String factor1 =""
	String factor2 =""
    static constraints = {
		xz()
		price()
		factor1(blankable:true,nullable:true)
		factor2(blankable:true,nullable:true)
    }
}
