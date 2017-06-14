package com.cpic.sme


class Member {
	static searchable = true
	String workLine
	String company
	String org
	String name
	String loginName
	String password
	String cellphone
	String idNum
	String email
	String department
	String remark
	Date lastLoginTime
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [ quotations : Quotation ]
	static constraints = {
		workLine()
		company()
		org()
		name(blank:false)
		loginName(blank:false, size:6..20)
		cellphone(nullable:true)
		idNum(blank:false,unique:true )
		email(nullable:true,email:true)
		department(nullable:true)
		remark(nullable:true)
		lastLoginTime(nullable:true)
		password password:true,nullable:false,size:6..20
	}
}
