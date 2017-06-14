package com.cpic.sme



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import java.text.SimpleDateFormat

import org.apache.commons.lang.StringUtils

@Transactional(readOnly = true)
class MobileController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index(Integer max) {
		String openId = params.openId
		println "openId:"+openId
		def memberList
		if(StringUtils.isNotBlank(openId)){
			memberList = MemberOpenId.findAllByOpenId(openId)
			println memberList
		}
		session.openId = openId
		render(view: "index", model: [memberList: memberList])
    }
	def home() {
	}
	def success(){
		
	}
	
	def quotationHistory(){
		println "sessionId:"+session.member.id
		def results = Quotation.findAllByMember(session.member,
			[max: 100, sort: "bjrq", order: "desc", offset: 0])
		respond results, [formats:[ 'json']]
	}
	def history(){
		def results = Quotation.findAllByMember(session.member,
			[max: 100, sort: "bjrq", order: "desc", offset: 0])
		render(view: "history", model: [quotationList: results])
	}
	def quotationShow(){
		
	}
	
	def editPass(){
		
	}
	
	def getQuotationById(){
		Quotation quotation = Quotation.get(params.quotationId);
		respond quotation,[formats:['json']]
	}
	def test(){
		println "testttt"
	}
	def xzDetail_bak(){}
	@Transactional
	def authenticate(){
		println params
		Member member = Member.findByLoginNameAndPassword(params.loginName, params.password)
		if(member){
			session.member = member
			if(StringUtils.isNotBlank(session.openId)){
				println "绑定一个openid与一个会员"
				MemberOpenId.findOrSaveByOpenIdAndMember(session.openId, member)
			}
			render "ok"
		}else{
			render "error"
		}
		
	}
	@Transactional
	def updatePwd(){
		println params
		Member member = Member.get(params.id)
		if(member){
			if(member.password.equals(params.oldPassword)){
				member.password = params.newPassword
				member.save(flush:true)
				if (member.hasErrors()) {
					render "新密码长度必须为六位以上"
				}else{
					render "ok"
				}
			}else{
				render "旧密码不正确"
			}
		}else{
			render "用户不存在"
		}
	}
	
	def getPrice(){
		PriceRule priceRule;
		float price
		println(params)
		String xz = StringUtils.trim(params.xz)
		String factor1 = StringUtils.trim(params.factor1)
		String factor2 = StringUtils.trim(params.factor2)
		String factor3 = StringUtils.trim(params.factor3)
		println "团体疾病身故保险" == factor1
		if(params.factor2 == null){
			
			priceRule= PriceRule.findByXzAndFactor1(xz, factor1)
			println "fa:"+priceRule;
		}else{
			priceRule= PriceRule.findByXzAndFactor1AndFactor2(params.xz, params.factor1, params.factor2)
			println "fd:"+priceRule;
		}
		if("附加团体住院补贴医疗保险".equals(params.xz) && "免赔期3天".equals(params.factor3)){
			price = priceRule.price * 0.85
		}else if("附加团体疾病医疗保险（A款）".equals(params.xz)&& "疾病住院2万".equals(params.factor2) && "次免赔额100赔付比例90%".equals(params.factor3)){
			price = priceRule.price * 0.9
		}else if("附加团体疾病医疗保险（A款）".equals(params.xz)&& !"疾病住院2万".equals(params.factor2) && "次免赔额100赔付比例90%".equals(params.factor3)){
			price = priceRule.price * 0.7
		}else{
			price = priceRule.price
		}
		println "price:"+price
		render ""+price
	}
	@Transactional
	def saveQuotation(){
		println params
		if(params.id != null && !"".equals(params.id)){
			Quotation oldQuotation = Quotation.get(params.id)
			if(oldQuotation != null){
				oldQuotation.delete()
			}
		}
		Quotation quotation = new Quotation(params)
		quotation.companyName = params.companyName
		quotation.xz1 = params.xz1_factor1
		quotation.xz2 = params.xz2_factor1
		quotation.xz3 = params.xz3_factor1+"#"
		quotation.xz4 = params.xz4_factor1+"#"+ params.xz4_factor2
		quotation.xz5 = params.xz5_factor1+"#"+ params.xz5_factor2+"#"+ params.xz5_factor3
		quotation.xz6 = params.xz6_factor1+"#"+ params.xz6_factor2+"#"+ params.xz6_factor3
		SimpleDateFormat sdf_convert = new SimpleDateFormat("yyyy-MM-dd")
		quotation.bjrq = sdf_convert.parse(params.bjrqStr)
		quotation.member = session.member
		quotation.save(flush:true)
				
		if(quotation.hasErrors()){
			println quotation.errors
		}else{
			render(status: 200, text: 'success')
		}
		
	}
	
	def isExistsCompanyName(){
		Quotation quotation = Quotation.findByMemberAndCompanyName(session.member, params.companyName)
		if(quotation != null){
			render "yes"
		}else{
			render "no"
		}
	}
	
	def exit(){
		session.member = null
		render "ok"
	}
	
	def xzDetail(){}
}
