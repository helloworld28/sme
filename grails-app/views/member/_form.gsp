<%@ page import="com.cpic.sme.Member" %>



<div class="am-form-group fieldcontain ${hasErrors(bean: memberInstance, field: 'workLine', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="workLine">
		<g:message code="member.workLine.label" default="Work Line" />
		
	</label>
	<div class="am-u-sm-9">
	<select id="workLineList" data-am-selected name="workLine">
		  <option value="产险">产险</option>
		  <option value="寿险" >寿险</option>
		  <option value="健康险">健康险</option>
	</select>
	</div>
</div>


<div class="am-form-group fieldcontain ${hasErrors(bean: memberInstance, field: 'company', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="company">
		<g:message code="member.company.label" default="Company" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="company" value="${memberInstance?.company}"placeholder="输入所属公司"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: memberInstance, field: 'org', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="org">
		<g:message code="member.org.label" default="Org" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="org" value="${memberInstance?.org}"placeholder="输入所属机构"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: memberInstance, field: 'name', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="name">
		<g:message code="member.name.label" default="Name"/>
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="name" value="${memberInstance?.name}" placeholder="输入会员姓名"/>
	</div>
</div>
<div class="am-form-group fieldcontain ${hasErrors(bean: memberInstance, field: 'loginName', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="loginName">
		<g:message code="member.loginName.label" default="Login Name" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="loginName" value="${memberInstance?.loginName}" placeholder="输入会员登录帐号"/>
	</div>
</div>
<div class="am-form-group fieldcontain ${hasErrors(bean: memberInstance, field: 'cellphone', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="cellphone">
		<g:message code="member.cellphone.label" default="Cellphone" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="cellphone" value="${memberInstance?.cellphone}"  placeholder="输入会员手机号"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: memberInstance, field: 'idNum', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="idNum">
		<g:message code="member.idNum.label" default="Id Num" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="idNum" value="${memberInstance?.idNum}"placeholder="输入会员身份证号码"/>
	</div>
</div>


<div class="am-form-group fieldcontain ${hasErrors(bean: memberInstance, field: 'email', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="email">
		<g:message code="member.email.label" default="Email" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="email" value="${memberInstance?.email}"placeholder="输入邮箱地址"/>
	</div>
</div>


<div class="am-form-group fieldcontain ${hasErrors(bean: memberInstance, field: 'password', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="password">
		<g:message code="member.password.label" default="Password" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="password" maxlength="20" value="${memberInstance?.password}"/>
	</div>
</div>



<div class="am-form-group fieldcontain ${hasErrors(bean: memberInstance, field: 'department', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="department">
		<g:message code="member.department.label" default="Department" />
	</label>
	<div class="am-u-sm-9">
	<g:textField name="department" value="${memberInstance?.department}" placeholder="输入会员所属部门"/>
	</div>
</div>




<div class="am-form-group fieldcontain ${hasErrors(bean: memberInstance, field: 'remark', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="remark">
		<g:message code="member.remark.label" default="Remark" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="remark" value="${memberInstance?.remark}" placeholder="输入备注"/>
	</div>
</div>



