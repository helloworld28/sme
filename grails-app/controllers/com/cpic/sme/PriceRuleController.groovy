package com.cpic.sme



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.apache.commons.lang.StringUtils

@Transactional(readOnly = true)
class PriceRuleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PriceRule.list(params), model:[priceRuleInstanceCount: PriceRule.count()]
    }

    def show(PriceRule priceRuleInstance) {
        respond priceRuleInstance
    }

    def create() {
        respond new PriceRule(params)
    }

    @Transactional
    def save(PriceRule priceRuleInstance) {
        if (priceRuleInstance == null) {
            notFound()
            return
        }

        if (priceRuleInstance.hasErrors()) {
            respond priceRuleInstance.errors, view:'create'
            return
        }

        priceRuleInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'priceRuleInstance.label', default: 'PriceRule'), priceRuleInstance.id])
                redirect priceRuleInstance
            }
            '*' { respond priceRuleInstance, [status: CREATED] }
        }
    }

    def edit(PriceRule priceRuleInstance) {
        respond priceRuleInstance
    }

    @Transactional
    def update(PriceRule priceRuleInstance) {
        if (priceRuleInstance == null) {
            notFound()
            return
        }

        if (priceRuleInstance.hasErrors()) {
            respond priceRuleInstance.errors, view:'edit'
            return
        }

        priceRuleInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PriceRule.label', default: 'PriceRule'), priceRuleInstance.id])
                redirect priceRuleInstance
            }
            '*'{ respond priceRuleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PriceRule priceRuleInstance) {

        if (priceRuleInstance == null) {
            notFound()
            return
        }

        priceRuleInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PriceRule.label', default: 'PriceRule'), priceRuleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceRuleInstance.label', default: 'PriceRule'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	@Transactional
	def importData(){
		String fileDir = grailsApplication.config.priceRule.excel.path
		PriceRule.executeUpdate("delete PriceRule c ")
		Thread.start{
			String realBaseBpath = servletContext.getRealPath(fileDir)
			importFromDexcel(realBaseBpath)
		}
		flash.message = "文件已经上传成功,请稍后刷新查看数据..."
		redirect action:'index'
	}
	
	@Transactional
	def importFromDexcel(String path){
		
		//1.excel里取出数据
		PriceRuleExcelImporter memberExcelImporter = new PriceRuleExcelImporter(path);
		List<Map> rows = memberExcelImporter.getRows()
		//3.多线程进行数据的保存
		//每个线程所负责处理的记录数
		int threadRowsNum = grailsApplication.config.importdata.thread.rownum
		int maxthreadnum = grailsApplication.config.importdata.thread.maxthreadnum
		 
		int rowsSize = rows.size()
		if((rowsSize/threadRowsNum) > maxthreadnum){
			threadRowsNum = Math.round(rowsSize/maxthreadnum)
			println "#the size of thread too large ,so the threadRows num chang to "+threadRowsNum
		}
		int threadSize= 0;
		int i=0
		for(i=0;i<rowsSize;i+=threadRowsNum){
			int fromIndex = i
			int toIndex = i
			if((i+threadRowsNum) < rowsSize){
				toIndex = i+threadRowsNum
			}else{
				toIndex = rowsSize
			}
			Thread.start{
				batchSaveRows(rows.subList(fromIndex, toIndex))
			}
			threadSize ++
		}
		println "###threadSize :::"+threadSize
		
//		flash.message = "文件已经上传成功,预计导入记录总数目:"+rows.size()+",请稍后刷新查看数据..."
		
	}
	
	@Transactional
	def batchSaveRows(rows){
		long startTime = System.currentTimeMillis()
		int amount = 0
		rows.each{Map memberParams->
			PriceRule member = new PriceRule(memberParams)
			if(!member.save()){
				println member.errors
			}else{
				amount++
			}
			
		}
		println Thread.currentThread().getName()+" importData cost Time is :"+(System.currentTimeMillis()-startTime)
	}
	
	
	
}
