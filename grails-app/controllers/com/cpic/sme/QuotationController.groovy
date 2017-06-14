package com.cpic.sme



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import java.text.SimpleDateFormat

import org.apache.commons.lang.StringUtils

import pl.touk.excel.export.WebXlsxExporter

@Transactional(readOnly = true)
class QuotationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def excudeParams =[
		"controller",
		"action",
		"offset",
		"format",
		"max",
		"member",
		"bjrqq",
		"bjrqz"
	]
    def index() {
		println params
			int max = (params.max  ?:10) as int
			int offset = (params.offset ?:0)as int
			def resultList = search(max, offset)
			println resultList
			render(view: "index", model: [quotationInstanceList: resultList, quotationInstanceCount:resultList.getTotalCount()])
    }
	
	def search(int max, int offset){
		def criteria = Quotation.createCriteria()
		def resultList = criteria.list(max: max, offset: offset){
			createAlias("member", "member")
			params.each { param->
				if(!"".equals(param.value) && excudeParams.indexOf(param.key) == -1){
					like(param.key, "%"+param.value+"%")
				}
				
			}
			SimpleDateFormat sdf_convert = new SimpleDateFormat("yyyy-MM-dd")
			if(StringUtils.isNotBlank(params.bjrqq) ){
				Date bjrqq = sdf_convert.parse(params.bjrqq)
				ge("bjrq", bjrqq)
			}
			if( StringUtils.isNotBlank(params.bjrqz)){
				Date bjrqz = sdf_convert.parse(params.bjrqz)
				le("bjrq", bjrqz)
			}
			order("bjrq", "desc")
			 
		}
		
		return resultList
	}

	def export(){
		def resultList = search(9999999, 0)
		def headers =["条线","分公司","机构 ","业务经办","企业名称","报价时间","报价金额","企业联系人","组织机构代码"] 
		def withProperties=["member.workLine", "member.company", "member.org", "member.name", "companyName",new DateToStringGetter("bjrq"),"totalPrice","qylxr","zzjgdm"]
		new WebXlsxExporter().with {
			setResponseHeaders(response)
			fillHeader(headers)
			add(resultList, withProperties)
			save(response.outputStream)
			}
	}
	

    def show(Quotation quotationInstance) {
        respond quotationInstance
    }

    def create() {
        respond new Quotation(params)
    }

    @Transactional
    def save(Quotation quotationInstance) {
        if (quotationInstance == null) {
            notFound()
            return
        }

        if (quotationInstance.hasErrors()) {
            respond quotationInstance.errors, view:'create'
            return
        }

        quotationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'quotationInstance.label', default: 'Quotation'), quotationInstance.id])
                redirect quotationInstance
            }
            '*' { respond quotationInstance, [status: CREATED] }
        }
    }

    def edit(Quotation quotationInstance) {
        respond quotationInstance
    }

    @Transactional
    def update(Quotation quotationInstance) {
        if (quotationInstance == null) {
            notFound()
            return
        }

        if (quotationInstance.hasErrors()) {
            respond quotationInstance.errors, view:'edit'
            return
        }

        quotationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Quotation.label', default: 'Quotation'), quotationInstance.id])
                redirect quotationInstance
            }
            '*'{ respond quotationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Quotation quotationInstance) {

        if (quotationInstance == null) {
            notFound()
            return
        }

        quotationInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Quotation.label', default: 'Quotation'), quotationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'quotationInstance.label', default: 'Quotation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	
	def updateQuotation(){
		
	}
	
}
