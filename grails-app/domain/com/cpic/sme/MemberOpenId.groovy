package com.cpic.sme

import java.util.Date;

class MemberOpenId {
	String openId
	Member member
	Date dateCreated
	Date lastUpdated
    static constraints = {
		openId(nullable:false)
		member(nullable:false)
    }
}
