
<%@ page import="com.cpic.sme.Member" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->


<g:render template="../layouts/header"></g:render>

<div class="am-cf admin-main">
   <!-- sidebar start -->
  <g:render template="../layouts/sidebar"></g:render>
  <!-- sidebar end -->

  <!-- content start -->
 <div class="admin-content">
   <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
      </strong> / <small><g:message code="default.new.label" args="[entityName]" /></small></div>
    </div>
		<g:if test="${flash.message}">
				<div class="am-alert am-alert-success" data-am-alert>${flash.message}</div>
			</g:if>

    <div class="am-g">

     

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-12">
				<ol class="property-list member">
			
					<g:if test="${memberInstance?.workLine}">
				<li class="fieldcontain">
					<span id="workLine-label" class="property-label"><g:message code="member.workLine.label" default="Work Line" /></span>
					
						<span class="property-value" aria-labelledby="workLine-label"><g:fieldValue bean="${memberInstance}" field="workLine"/></span>
					
				</li>
				</g:if>
				
				
				<g:if test="${memberInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="member.company.label" default="Company" /></span>
					
						<span class="property-value" aria-labelledby="company-label"><g:fieldValue bean="${memberInstance}" field="company"/></span>
					
				</li>
				</g:if>
				
					<g:if test="${memberInstance?.org}">
				<li class="fieldcontain">
					<span id="org-label" class="property-label"><g:message code="member.org.label" default="Org" /></span>
					
						<span class="property-value" aria-labelledby="org-label"><g:fieldValue bean="${memberInstance}" field="org"/></span>
					
				</li>
				</g:if>
				
					<g:if test="${memberInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="member.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${memberInstance}" field="name"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${memberInstance?.loginName}">
				<li class="fieldcontain">
					<span id="loginName-label" class="property-label"><g:message code="member.loginName.label" default="Login Name" /></span>
					
						<span class="property-value" aria-labelledby="loginName-label"><g:fieldValue bean="${memberInstance}" field="loginName"/></span>
					
				</li>
				</g:if>
			
			
			
				<g:if test="${memberInstance?.cellphone}">
				<li class="fieldcontain">
					<span id="cellphone-label" class="property-label"><g:message code="member.cellphone.label" default="Cellphone" /></span>
					
						<span class="property-value" aria-labelledby="cellphone-label"><g:fieldValue bean="${memberInstance}" field="cellphone"/></span>
					
				</li>
				</g:if>
			
			
				<g:if test="${memberInstance?.idNum}">
				<li class="fieldcontain">
					<span id="idNum-label" class="property-label"><g:message code="member.idNum.label" default="Id Num" /></span>
					
						<span class="property-value" aria-labelledby="idNum-label"><g:fieldValue bean="${memberInstance}" field="idNum"/></span>
					
				</li>
				</g:if>
				
			
			
				<g:if test="${memberInstance?.department}">
				<li class="fieldcontain">
					<span id="department-label" class="property-label"><g:message code="member.department.label" default="Department" /></span>
					
						<span class="property-value" aria-labelledby="department-label"><g:fieldValue bean="${memberInstance}" field="department"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="member.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${memberInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				
			
				<g:if test="${memberInstance?.remark}">
				<li class="fieldcontain">
					<span id="remark-label" class="property-label"><g:message code="member.remark.label" default="Remark" /></span>
					
						<span class="property-value" aria-labelledby="remark-label"><g:fieldValue bean="${memberInstance}" field="remark"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.lastLoginTime}">
				<li class="fieldcontain">
					<span id="lastLoginTime-label" class="property-label"><g:message code="member.lastLoginTime.label" default="Last Login Time" /></span>
					
						<span class="property-value" aria-labelledby="lastLoginTime-label"><g:formatDate date="${memberInstance?.lastLoginTime}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${memberInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="member.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${memberInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			
				<g:if test="${memberInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="member.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${memberInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			
		
			
			
			
			</ol>
			
			
				
				 <div class="am-form-group">
				 	<div class="am-u-sm-9 am-u-sm-push-3">
		            <div class="am-margin">
		          <g:form url="[resource:memberInstance, action:'delete']" method="DELETE">
					<g:link class="am-btn am-btn-primary am-btn-xs edit" action="edit" resource="${memberInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="am-btn am-btn-primary am-btn-xs delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					    <button type="button" class="am-btn am-btn-primary am-btn-xs" id="btn-back">返回</button>
					    	
				</g:form>
					 </div>
					</div>
		        </div>
      </div>
    </div>
  </div>
  <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<g:render template="../layouts/footer"></g:render>
<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="${resource(dir:'assets/js',file:'amazeui.ie8polyfill.min.js') }"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${resource(dir:'assets/js',file:'jquery.min.js') }"></script>
<!--<![endif]-->
<script src="${resource(dir:'assets/js',file:'amazeui.min.js') }"></script>
<script src="${resource(dir:'assets/js',file:'app.js') }"></script>
<script>
  $(function() {
    var $backButton = $('#btn-back');
    $backButton.on('click', function() {
     	window.location = '<g:createLink action="index"/>';
    });

  })
</script>
</body>
</html>
