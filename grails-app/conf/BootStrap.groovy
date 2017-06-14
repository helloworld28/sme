import grails.converters.JSON
import grails.util.Environment

import com.cpic.sme.User

class BootStrap {
	
    def init = { servletContext ->
		
         JSON.registerObjectMarshaller(Date) {
            return it?.format("yyyy-MM-dd ")
         }
		switch(Environment.getCurrent()){
			
			case "DEVELOPMENT":
				def admin = new User(
					userName: "admin",
					password: "admin",
					email:"rer@qq.com",
					role: "admin"
					)
				
				admin.save(flush:true)
				
				if(admin.hasErrors()){
					println admin.errors
				}
				
				
				def jobe = new User(
					userName: "jode",
					password: "jode",
					email:"rer@qq.com",
					role: "user"
					)
				
				jobe.save()
				break

			case "PRODUCTION":
				def admin = new User(
						userName: "admin",
						password: "admin",
						email:"rer@qq.com",
						role: "admin"
				)

				admin.save(flush:true)

				if(admin.hasErrors()){
					println admin.errors
				}

				break
		}
		
    }
    def destroy = {
    }
}
