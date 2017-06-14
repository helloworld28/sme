package com.cpic.sme.taglib

class LoginTagLib {
//    static defaultEncodeAs = 'html'
//    static encodeAsForTags = [tagName: 'raw']
	
	def memberLoginControl={
		if(request.getSession(false) && session.member){
			out<< "${session.member.name}"
		}
	}
}
