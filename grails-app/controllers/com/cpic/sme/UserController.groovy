package com.cpic.sme



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }
	
	def list(Integer max){
		 params.max = Math.min(max ?: 10, 100)
		respond view:"index", User.list(params), model:[userInstanceCount: User.count()]
	}

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userInstance.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInstance.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def login(){
		
	}
	def logout(){
		session.user= null
		redirect(action:"login")
	}
	
	def authenticate(){
		User user = User.findByUserNameAndPassword(params.userName,params.password);
		println params
		if(user){
			session.user = user
			if("admin".equals(user.role)){
				redirect(controller:"member", action:"index")
			}else{
				render "会员登录成功"
			}
		}else{
			flash.message ="用户名或密码不正确"
			redirect(action:"login")
		}
	}
	
	def adminIndex(){
		render view:"admin-index"
	}
	@Transactional
	def deletes(){
		String[] idArray = params.ids?.split(",")
		if(idArray.length > 0){
			for(String id : idArray){
				User user = User.get(Integer.valueOf(id))
				 user.delete(flush:true)
			}
		}
		
		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), params.ids])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}
}
