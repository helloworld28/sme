<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg"><a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
      </strong> / <small><g:message code="default.new.label" args="[entityName]" /></small></div>
    </div>
		<g:if test="\${flash.message}">
				<div class="message" role="status">\${flash.message}</div>
			</g:if>

    <div class="am-g">

     

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-12">
         	<g:form class="am-form am-form-horizontal" url="[resource:${propertyName}, action:'save']" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				
				 <div class="am-form-group">
				 	<div class="am-u-sm-9 am-u-sm-push-3">
		            <div class="am-margin">
		            <g:submitButton name="save"  class="am-btn am-btn-primary am-btn-xs"value="\${message(code: 'default.button.update.label', default: 'update')}" />
					    <button type="button" class="am-btn am-btn-primary am-btn-xs" id="btn-back">放弃保存</button>
					 </div>
					</div>
		        </div>
			</g:form>
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
<script src="\${resource(dir:'assets/js',file:'amazeui.ie8polyfill.min.js') }"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="\${resource(dir:'assets/js',file:'jquery.min.js') }"></script>
<!--<![endif]-->
<script src="\${resource(dir:'assets/js',file:'amazeui.min.js') }"></script>
<script src="\${resource(dir:'assets/js',file:'app.js') }"></script>
<script>
  \$(function() {
    var \$backButton = \$('#btn-back');
    \$backButton.on('click', function() {
     	window.location = '<g:createLink action="index"/>';
    });

  })
</script>
</body>
</html>

