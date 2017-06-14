package com.cpic.sme

class Quotation {
	
	String companyName
	String zzjgdm
	String qylxr
	Date bjrq
	String xz1
	String xz2
	String xz3
	String xz4
	String xz5
	String xz6
	BigDecimal xz1_price
	BigDecimal xz2_price
	BigDecimal xz3_price
	BigDecimal xz4_price
	BigDecimal xz5_price
	BigDecimal xz6_price
	
	BigDecimal totalPrice
	
	static belongsTo = [member: Member]
    static constraints = {
		companyName()
		zzjgdm(nullable:true)
		qylxr(nullable:true)
		bjrq(nullable:true)
		xz1(nullable:false)
		xz2(nullable:false)
		xz3(nullable:false)
		xz4(nullable:false)
		xz5(nullable:false)
		xz6(nullable:false)
		totalPrice()
    }
}
