package sme

class MemberFilterFilters {

    def filters = {
        memberOnly(controller:'(mobile)', action:"*",actionExclude:"(index|authenticate|mobileHead)") {
            before = {
				if(!session.member?.name){
					flash.message = "sorry!member only"
					redirect(controller:"mobile", action:"index")
					return false
				}
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
	adminOnly(controller:'(user|member|priceRule|quotation)', action:"*",actionExclude:"(login|authenticate)") {
		before = {
			if(!session.user?.userName){
				flash.message = "sorry!member only"
				redirect(controller:"user", action:"login")
				return false
			}
		}
		after = { Map model ->

		}
		afterView = { Exception e ->

		}
	}
    }
}
