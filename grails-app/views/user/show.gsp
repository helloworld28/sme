
<%@ page import="com.cpic.sme.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
				<ol class="property-list user">
			
				<g:if test="${userInstance?.userName}">
				<li class="fieldcontain">
					<span id="userName-label" class="property-label"><g:message code="user.userName.label" default="User Name" /></span>
					
						<span class="property-value" aria-labelledby="userName-label"><g:fieldValue bean="${userInstance}" field="userName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="user.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${userInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="user.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${userInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="user.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${userInstance}" field="role"/></span>
					
				</li>
				</g:if>
			
			</ol>
			
			
				
				 <div class="am-form-group">
				 	<div class="am-u-sm-9 am-u-sm-push-3">
		            <div class="am-margin">
		          <g:form url="[resource:userInstance, action:'delete']" method="DELETE">
					<g:link class="am-btn am-btn-primary am-btn-xs edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
