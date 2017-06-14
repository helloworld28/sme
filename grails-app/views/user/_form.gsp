<%@ page import="com.cpic.sme.User" %>



<div class="am-form-group fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} required">
	<label class="am-u-sm-3 am-form-label" for="userName">
		<g:message code="user.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="am-u-sm-9">
	<g:textField name="userName" required="" value="${userInstance?.userName}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label class="am-u-sm-3 am-form-label" for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<div class="am-u-sm-9">
	<g:textField name="password" required="" value="${userInstance?.password}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="email" value="${userInstance?.email}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: userInstance, field: 'role', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="role">
		<g:message code="user.role.label" default="Role" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="role" value="${userInstance?.role}"/>
	</div>
</div>


