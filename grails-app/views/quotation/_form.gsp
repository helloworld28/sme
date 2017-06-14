<%@ page import="com.cpic.sme.Quotation" %>



<div class="am-form-group fieldcontain ${hasErrors(bean: quotationInstance, field: 'companyName', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="companyName">
		<g:message code="quotation.companyName.label" default="Company Name" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="companyName" value="${quotationInstance?.companyName}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: quotationInstance, field: 'zzjgdm', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="zzjgdm">
		<g:message code="quotation.zzjgdm.label" default="Zzjgdm" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="zzjgdm" value="${quotationInstance?.zzjgdm}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: quotationInstance, field: 'qylxr', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="qylxr">
		<g:message code="quotation.qylxr.label" default="Qylxr" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="qylxr" value="${quotationInstance?.qylxr}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: quotationInstance, field: 'bjrq', 'error')} required">
	<label class="am-u-sm-3 am-form-label" for="bjrq">
		<g:message code="quotation.bjrq.label" default="Bjrq" />
		<span class="required-indicator">*</span>
	</label>
	<div class="am-u-sm-9">
	<g:datePicker name="bjrq" precision="day"  value="${quotationInstance?.bjrq}"  />
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: quotationInstance, field: 'xz1', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="xz1">
		<g:message code="quotation.xz1.label" default="Xz1" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="xz1" value="${quotationInstance?.xz1}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: quotationInstance, field: 'xz2', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="xz2">
		<g:message code="quotation.xz2.label" default="Xz2" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="xz2" value="${quotationInstance?.xz2}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: quotationInstance, field: 'xz3', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="xz3">
		<g:message code="quotation.xz3.label" default="Xz3" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="xz3" value="${quotationInstance?.xz3}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: quotationInstance, field: 'xz4', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="xz4">
		<g:message code="quotation.xz4.label" default="Xz4" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="xz4" value="${quotationInstance?.xz4}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: quotationInstance, field: 'xz5', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="xz5">
		<g:message code="quotation.xz5.label" default="Xz5" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="xz5" value="${quotationInstance?.xz5}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: quotationInstance, field: 'xz6', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="xz6">
		<g:message code="quotation.xz6.label" default="Xz6" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="xz6" value="${quotationInstance?.xz6}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: quotationInstance, field: 'totalPrice', 'error')} required">
	<label class="am-u-sm-3 am-form-label" for="totalPrice">
		<g:message code="quotation.totalPrice.label" default="Total Price" />
		<span class="required-indicator">*</span>
	</label>
	<div class="am-u-sm-9">
	<g:field name="totalPrice" value="${fieldValue(bean: quotationInstance, field: 'totalPrice')}" required=""/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: quotationInstance, field: 'member', 'error')} required">
	<label class="am-u-sm-3 am-form-label" for="member">
		<g:message code="quotation.member.label" default="Member" />
		<span class="required-indicator">*</span>
	</label>
	<div class="am-u-sm-9">
	<g:select id="member" name="member.id" from="${com.cpic.sme.Member.list()}" optionKey="id" required="" value="${quotationInstance?.member?.id}" class="many-to-one"/>
	</div>
</div>


