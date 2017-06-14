package com.cpic.sme



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import pl.touk.excel.export.WebXlsxExporter
import sme.UploadService

@Transactional(readOnly = true)
class MemberController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def excudeParams =[
		"controller",
		"action",
		"offset",
		"format",
		"max"
	]
	
	def UploadService uploadService
	
    def index() {
		print params
			int max = (params.max  ?:10) as int
			int offset = (params.offset ?:0)as int
			def resultList = search(max, offset)
			render(view: "index", model: [memberInstanceList: resultList, memberInstanceCount:resultList.getTotalCount()])
    }
	
	def search(int max, int offset){
		def criteria = Member.createCriteria()
		def resultList = criteria.list(max: max, offset: offset){
			params.each { param->
				if(!"".equals(param.value) && excudeParams.indexOf(param.key) == -1){
					like(param.key, "%"+param.value+"%")
				}
			}
			 
		}
		return resultList
	}

    def show(Member memberInstance) {
        respond memberInstance
    }

    def create() {
        respond new Member(params)
    }

    @Transactional
    def save(Member memberInstance) {
        if (memberInstance == null) {
            notFound()
            return
        }

        if (memberInstance.hasErrors()) {
            respond memberInstance.errors, view:'create'
            return
        }

        memberInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'memberInstance.label', default: 'Member'), memberInstance.id])
                redirect memberInstance
            }
            '*' { respond memberInstance, [status: CREATED] }
        }
    }

    def edit(Member memberInstance) {
        respond memberInstance
    }

    @Transactional
    def update(Member memberInstance) {
        if (memberInstance == null) {
            notFound()
            return
        }

        if (memberInstance.hasErrors()) {
            respond memberInstance.errors, view:'edit'
            return
        }

        memberInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Member.label', default: 'Member'), memberInstance.id])
                redirect memberInstance
            }
            '*'{ respond memberInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Member memberInstance) {

        if (memberInstance == null) {
            notFound()
            return
        }

        memberInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Member.label', default: 'Member'), memberInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'memberInstance.label', default: 'Member'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	
	@Transactional
	def deletes() {
		String[] ids = params.ids?.split(",")
		for(String id : ids){
			Member memberInstance = Member.get(id as int);
			if (memberInstance == null) {
				notFound()
				return
			}
			
			memberInstance.delete flush:true
		}

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'Member.label', default: 'Member'), params.ids])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}
	
	@Transactional
	def importData(){
		String fileDir = grailsApplication.config.upload.excel.path
		String filePath =uploadService.uploadFile(request,servletContext, fileDir)
		Thread.start{
			importFromDexcel(filePath)
		}
		flash.message = "文件已经上传成功,请稍后刷新查看数据..."
		redirect action:'index'
	}
	
	@Transactional
	def uploadPic(){
		String fileDir = grailsApplication.config.upload.excel.path
		
		String filePath =uploadService.uploadFile(request,servletContext, fileDir)
		filePath = filePath.replace(File.separator, "/");
		filePath = filePath.substring(filePath.indexOf(fileDir))
		render filePath
		
	}
	
	
	@Transactional
	def importFromDexcel(String path){
		
		//1.excel里取出数据
		MemberExcelImporter memberExcelImporter = new MemberExcelImporter(path);
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
			Member member = new Member(memberParams)
			member.password = "123456"
			if(!member.save()){
				println member.errors
			}else{
				amount++
			}
			
		}
		println Thread.currentThread().getName()+" importData cost Time is :"+(System.currentTimeMillis()-startTime)
	}
	
	def export(){
		def resultList = search(9999999, 0)
		def headers =["条线","分公司","机构 ","姓名","登陆账号","手机号","身份证号","email","部门","备注"]
		def withProperties=["workLine", "company", "org", "name", "loginName","cellpone","idNum","email","department","remark"]
		new WebXlsxExporter().with {
			setResponseHeaders(response)
			fillHeader(headers)
			add(resultList, withProperties)
			save(response.outputStream)
			}
	}
	
	
	def downloadModel(){
		
		response.setHeader("Content-disposition", "attachment; filename=model.xlsx" )
		response.contentType = "application/x-rarx-rar-compressed"
		
		def filepath = servletContext.getRealPath("/META-INF/member_model.xlsx")
		println filepath
		def out = response.outputStream
		InputStream inputStream = new FileInputStream(filepath)
		byte[] buffer = new byte[1024]
		int i = -1
		while ((i = inputStream.read(buffer)) != -1) {
		out.write(buffer, 0, i)
		}
		out.flush()
		out.close()
		inputStream.close()
	}
	
	
}
