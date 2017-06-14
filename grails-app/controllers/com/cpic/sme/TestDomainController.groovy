package com.cpic.sme



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TestDomainController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TestDomain.list(params), model:[testDomainInstanceCount: TestDomain.count()]
    }

    def show(TestDomain testDomainInstance) {
        respond testDomainInstance
    }

    def create() {
        respond new TestDomain(params)
    }

    @Transactional
    def save(TestDomain testDomainInstance) {
        if (testDomainInstance == null) {
            notFound()
            return
        }

        if (testDomainInstance.hasErrors()) {
            respond testDomainInstance.errors, view:'create'
            return
        }

        testDomainInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'testDomainInstance.label', default: 'TestDomain'), testDomainInstance.id])
                redirect testDomainInstance
            }
            '*' { respond testDomainInstance, [status: CREATED] }
        }
    }

    def edit(TestDomain testDomainInstance) {
        respond testDomainInstance
    }

    @Transactional
    def update(TestDomain testDomainInstance) {
        if (testDomainInstance == null) {
            notFound()
            return
        }

        if (testDomainInstance.hasErrors()) {
            respond testDomainInstance.errors, view:'edit'
            return
        }

        testDomainInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TestDomain.label', default: 'TestDomain'), testDomainInstance.id])
                redirect testDomainInstance
            }
            '*'{ respond testDomainInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TestDomain testDomainInstance) {

        if (testDomainInstance == null) {
            notFound()
            return
        }

        testDomainInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TestDomain.label', default: 'TestDomain'), testDomainInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'testDomainInstance.label', default: 'TestDomain'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
