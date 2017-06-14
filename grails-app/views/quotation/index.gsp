
<%@ page import="com.cpic.sme.Quotation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'quotation.label', default: 'Quotation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	


<g:render template="../layouts/header"></g:render>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <g:render template="../layouts/sidebar"></g:render>
  <!-- sidebar end -->

  <div class="admin-content">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
      </strong> / <small><g:message code="default.new.label" args="[entityName]" /></small></div>
    </div>
		<g:if test="${flash.message}">
				<div  class="am-alert am-alert-success" role="status">${flash.message}</div>
			</g:if>
			
	<div class="am-alert am-alert-warning" style="display:none" id="alertNeedChooseMsg"data-am-alert>
		请先选择需要删除的记录！
	</div>
    
      <form class="am-form" action='<g:createLink action="index" />' method="post">
     <div class="am-g">
      <div class="am-u-sm-12 am-u-md-3">
        <div class="am-form-group">
          <select name="member.workLine" data-am-selected="{btnSize: 'sm'}">
            <option value=""<g:if test="${params.workLine=='' }">selected</g:if>>所有条线</option>
            <option value="产险" <g:if test="${params.workLine=='产险' }">selected</g:if>>产险</option>
            <option value="寿险"<g:if test="${params.workLine=='寿险' }">selected</g:if>>寿险</option>
            <option value="健康险"<g:if test="${params.workLine=='健康险' }">selected</g:if>>健康险</option>
          </select>
        </div>
      </div>
     
     <div class="am-u-sm-12 am-u-md-3">
        <div class="am-input-group am-input-group-sm">
          <input type="text" class="am-form-field" value="${params.company }" name="member.company"placeholder="请输入分公司">
        </div>
      </div>
       <div class="am-u-sm-12 am-u-md-2">
        <div class="am-input-group am-input-group-sm">
          <input type="text" class="am-form-field"  value="${params.org }"name="member.org"placeholder="请输入机构">
        </div>
      </div>
      
       <div class="am-u-sm-12 am-u-md-4">
        <div class="am-input-group am-input-group-sm">
          <input type="text" class="am-form-field"  name="member.name"value="${params.name }"placeholder="请输入姓名">
        </div>
      </div>
     

    
     
    </div>
    
    <div class="am-g">
    
       
       
      
       <div class="am-u-sm-12 am-u-md-3">
       
       		  <div class="am-form-group am-form-icon">
                <i class="am-icon-calendar"></i>
                <input type="text" name="bjrqq" class="am-form-field am-input-sm" value="${params.bjrqq }"placeholder="报价时间起如：2016-01-01">
              </div>
      </div>
      
       <div class="am-u-sm-12 am-u-md-3">
       	 <div class="am-form-group am-form-icon">
                <i class="am-icon-calendar"></i>
                <input type="text" name="bjrqz" class="am-form-field am-input-sm" value="${params.bjrqz }"placeholder="报价时间止如：2016-01-31">
        </div>
      </div>
      
      <div class="am-u-sm-12 am-u-md-2">
        <div class="am-input-group am-input-group-sm">
          <input type="text" class="am-form-field"  name="companyName"value="${params.companyName }"placeholder="请输入企业名称">
        </div>
      </div>
      
        <div class="am-u-sm-6 am-u-md-4">
        <div class="am-btn-toolbar">
          <div class="am-btn-group am-btn-group-xs">
            <button class="am-btn am-btn-default">搜索</button>
            <button type="button" id="btn-export" class="am-btn am-btn-default"><span class="am-icon-copy"></span> 导出查询结果</button>
          </div>
        </div>
      </div>
         
      </div>
     </form>

    <div class="am-g">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                <th class="table-check"><input type="checkbox" id="allCheckbox" /></th>
                 <th class="table-check">ID</th>
                	
						
					<g:sortableColumn property="workLine" title="${message(code: 'member.workLine.label', default: 'workLine')}" />
					<g:sortableColumn property="company" title="${message(code: 'member.company.label', default: 'Company')}"class=" am-hide-sm-only"  />
					<g:sortableColumn property="org" title="${message(code: 'member.org.label', default: 'org')}"class=" am-hide-sm-only"  />
					<g:sortableColumn property="name" title="${message(code: 'member.name.label', default: 'name')}" />
					<g:sortableColumn property="companyName" title="企业名称" />
					<g:sortableColumn property="bjrq" title="报价时间" class=" am-hide-sm-only" />
					<g:sortableColumn property="totalPrice" title="报价总额" />
				
                
              </tr>
          </thead>
          <tbody>
            
            <tr>
            	<g:each in="${quotationInstanceList}" status="i" var="quotationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td><input type="checkbox" name="checkbox" value="${quotationInstance.id}" /></td>
					<td>${quotationInstance.id}</td>
					
						<td>${quotationInstance.member.workLine}</td>
						<td>${quotationInstance.member.company}</td>
						<td>${quotationInstance.member.org}</td>
						<td>${quotationInstance.member.name}</td>
						<td>${quotationInstance.companyName}</td>
						<td><g:formatDate date="${quotationInstance.bjrq}" format="yyyy-MM-dd" /></td>
						<td>${quotationInstance.totalPrice}</td>
					
					
					</tr>
				</g:each>
       
          </tbody>
        </table>
          <div class="am-cf">
        
			  共${quotationInstanceCount ?: 0}条记录
			  <div class="am-fr">
			    <ul class="am-pagination pagination">
			        <g:paginate next="下一页" prev="上一页"
		            maxsteps="0" controller="Quotation"
		            action="index" total="${quotationInstanceCount ?: 0}" />
            
			    </ul>
			  </div>
			</div>
          <hr />
        </form>
      </div>

    </div>
  </div>
  <!-- content end -->
</div>
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
    var $createButton = $('#btn-create');
    $createButton.on('click', function() {
     	window.location = '<g:createLink action="create"/>';
    });

    var $deleteButton = $('#btn-delete');
    $deleteButton.on('click', function() {
        var ids = new Array();
    	$('input:checkbox[name=checkbox]:checked').each(function(){
        	ids.push(this.value);	
    	});
    	if(ids.length < 1){
    		$('#alertNeedChooseMsg').show();
        }else{

     		window.location = '<g:createLink action="deletes" />?ids='+ids.join(',');
         }
    });

    var $allCheckbox = $('#allCheckbox');
    $allCheckbox.on('click', function() {
        var checked  = this.checked;
    	$('input:checkbox[name=checkbox]').each(function(){
        	this.checked = checked;
    	});
    });

    $('#btn-export').on('click', function(){
		window.location = '<g:createLink action="export" params='${params}'/>';
	});
   

  })
</script>
</body>
</html>