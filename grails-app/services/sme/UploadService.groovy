package sme

import grails.transaction.Transactional

import javax.servlet.ServletContext
import javax.servlet.http.HttpServletRequest

@Transactional
class UploadService {

    def serviceMethod() {

    }
	
	def uploadFile(HttpServletRequest request,ServletContext servletContext,String outputFilePath){
		def fileName
		def filePath
		def uploadFile = request.getFile("file")
		if(!uploadFile.empty){
			String originalFileName = uploadFile.originalFilename
			String ext = originalFileName.split("\\.")[-1]
			println ext
			fileName = UUID.randomUUID().toString()+"."+ext
			String basePath = outputFilePath
			String realBaseBpath = servletContext.getRealPath(basePath)
			
			filePath = realBaseBpath + "/" + fileName
			uploadFile.transferTo(new File(filePath))
		}
		return filePath
	}
}
