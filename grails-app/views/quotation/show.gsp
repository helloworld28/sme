
<%@ page import="com.cpic.sme.Quotation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'quotation.label', default: 'Quotation')}" />
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
				<ol class="property-list quotation">
			
				<g:if test="${quotationInstance?.companyName}">
				<li class="fieldcontain">
					<span id="companyName-label" class="property-label"><g:message code="quotation.companyName.label" default="Company Name" /></span>
					
						<span class="property-value" aria-labelledby="companyName-label"><g:fieldValue bean="${quotationInstance}" field="companyName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quotationInstance?.zzjgdm}">
				<li class="fieldcontain">
					<span id="zzjgdm-label" class="property-label"><g:message code="quotation.zzjgdm.label" default="Zzjgdm" /></span>
					
						<span class="property-value" aria-labelledby="zzjgdm-label"><g:fieldValue bean="${quotationInstance}" field="zzjgdm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quotationInstance?.qylxr}">
				<li class="fieldcontain">
					<span id="qylxr-label" class="property-label"><g:message code="quotation.qylxr.label" default="Qylxr" /></span>
					
						<span class="property-value" aria-labelledby="qylxr-label"><g:fieldValue bean="${quotationInstance}" field="qylxr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quotationInstance?.bjrq}">
				<li class="fieldcontain">
					<span id="bjrq-label" class="property-label"><g:message code="quotation.bjrq.label" default="Bjrq" /></span>
					
						<span class="property-value" aria-labelledby="bjrq-label"><g:formatDate date="${quotationInstance?.bjrq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${quotationInstance?.xz1}">
				<li class="fieldcontain">
					<span id="xz1-label" class="property-label"><g:message code="quotation.xz1.label" default="Xz1" /></span>
					
						<span class="property-value" aria-labelledby="xz1-label"><g:fieldValue bean="${quotationInstance}" field="xz1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quotationInstance?.xz2}">
				<li class="fieldcontain">
					<span id="xz2-label" class="property-label"><g:message code="quotation.xz2.label" default="Xz2" /></span>
					
						<span class="property-value" aria-labelledby="xz2-label"><g:fieldValue bean="${quotationInstance}" field="xz2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quotationInstance?.xz3}">
				<li class="fieldcontain">
					<span id="xz3-label" class="property-label"><g:message code="quotation.xz3.label" default="Xz3" /></span>
					
						<span class="property-value" aria-labelledby="xz3-label"><g:fieldValue bean="${quotationInstance}" field="xz3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quotationInstance?.xz4}">
				<li class="fieldcontain">
					<span id="xz4-label" class="property-label"><g:message code="quotation.xz4.label" default="Xz4" /></span>
					
						<span class="property-value" aria-labelledby="xz4-label"><g:fieldValue bean="${quotationInstance}" field="xz4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quotationInstance?.xz5}">
				<li class="fieldcontain">
					<span id="xz5-label" class="property-label"><g:message code="quotation.xz5.label" default="Xz5" /></span>
					
						<span class="property-value" aria-labelledby="xz5-label"><g:fieldValue bean="${quotationInstance}" field="xz5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quotationInstance?.xz6}">
				<li class="fieldcontain">
					<span id="xz6-label" class="property-label"><g:message code="quotation.xz6.label" default="Xz6" /></span>
					
						<span class="property-value" aria-labelledby="xz6-label"><g:fieldValue bean="${quotationInstance}" field="xz6"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quotationInstance?.totalPrice}">
				<li class="fieldcontain">
					<span id="totalPrice-label" class="property-label"><g:message code="quotation.totalPrice.label" default="Total Price" /></span>
					
						<span class="property-value" aria-labelledby="totalPrice-label"><g:fieldValue bean="${quotationInstance}" field="totalPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quotationInstance?.member}">
				<li class="fieldcontain">
					<span id="member-label" class="property-label"><g:message code="quotation.member.label" default="Member" /></span>
					
						<span class="property-value" aria-labelledby="member-label"><g:link controller="member" action="show" id="${quotationInstance?.member?.id}">${quotationInstance?.member?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			
			
				
				 <div class="am-form-group">
				 	<div class="am-u-sm-9 am-u-sm-push-3">
		            <div class="am-margin">
		          <g:form url="[resource:quotationInstance, action:'delete']" method="DELETE">
					<g:link class="am-btn am-btn-primary am-btn-xs edit" action="edit" resource="${quotationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
