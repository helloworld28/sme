
<%@ page import="com.cpic.sme.PriceRule" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'priceRule.label', default: 'PriceRule')}" />
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
				<ol class="property-list priceRule">
			
				<g:if test="${priceRuleInstance?.xz}">
				<li class="fieldcontain">
					<span id="xz-label" class="property-label"><g:message code="priceRule.xz.label" default="Xz" /></span>
					
						<span class="property-value" aria-labelledby="xz-label"><g:fieldValue bean="${priceRuleInstance}" field="xz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${priceRuleInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="priceRule.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${priceRuleInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${priceRuleInstance?.factor1}">
				<li class="fieldcontain">
					<span id="factor1-label" class="property-label"><g:message code="priceRule.factor1.label" default="Factor1" /></span>
					
						<span class="property-value" aria-labelledby="factor1-label"><g:fieldValue bean="${priceRuleInstance}" field="factor1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${priceRuleInstance?.factor2}">
				<li class="fieldcontain">
					<span id="factor2-label" class="property-label"><g:message code="priceRule.factor2.label" default="Factor2" /></span>
					
						<span class="property-value" aria-labelledby="factor2-label"><g:fieldValue bean="${priceRuleInstance}" field="factor2"/></span>
					
				</li>
				</g:if>
			
			</ol>
			
			
				
				 <div class="am-form-group">
				 	<div class="am-u-sm-9 am-u-sm-push-3">
		            <div class="am-margin">
		          <g:form url="[resource:priceRuleInstance, action:'delete']" method="DELETE">
					<g:link class="am-btn am-btn-primary am-btn-xs edit" action="edit" resource="${priceRuleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
