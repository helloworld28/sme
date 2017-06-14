
<%@ page import="com.cpic.sme.TestDomain" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'testDomain.label', default: 'TestDomain')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	


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
				<div  class="am-alert am-alert-success" role="status">${flash.message}</div>
			</g:if>
			
	<div class="am-alert am-alert-warning" style="display:none" id="alertNeedChooseMsg"data-am-alert>
		请先选择需要删除的记录！
	</div>
    <div class="am-g">
      <div class="am-u-sm-12 am-u-md-6">
        <div class="am-btn-toolbar">
          <div class="am-btn-group am-btn-group-xs">
            <button type="button" id="btn-create" class="am-btn am-btn-default"  data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 400, height: 225}"><span class="am-icon-plus"></span> 新增</button>
            <button type="button" id="btn-delete" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
          </div>
        </div>
      </div>
      <div class="am-u-sm-12 am-u-md-3">
        <div class="am-form-group">
          <select data-am-selected="{btnSize: 'sm'}">
            <option value="option1">所有类别</option>
            <option value="option2">IT业界</option>
            <option value="option3">数码产品</option>
            <option value="option3">笔记本电脑</option>
            <option value="option3">平板电脑</option>
            <option value="option3">只能手机</option>
            <option value="option3">超极本</option>
          </select>
        </div>
      </div>
      <div class="am-u-sm-12 am-u-md-3">
        <div class="am-input-group am-input-group-sm">
          <input type="text" class="am-form-field">
          <span class="am-input-group-btn">
            <button class="am-btn am-btn-default" type="button">搜索</button>
          </span>
        </div>
      </div>
    </div>

    <div class="am-g">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                <th class="table-check"><input type="checkbox" id="allCheckbox" /></th>
                 <th class="table-check">ID</th>
                	
                
              </tr>
          </thead>
          <tbody>
            
            <tr>
            	<g:each in="${testDomainInstanceList}" status="i" var="testDomainInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td><input type="checkbox" name="checkbox" value="${testDomainInstance.id}" /></td>
					<td>${testDomainInstance.id}</td>
					
					
					</tr>
				</g:each>
       
          </tbody>
        </table>
          <div class="am-cf">
        
			  共${testDomainInstanceCount ?: 0}条记录
			  <div class="am-fr">
			    <ul class="am-pagination pagination">
			        <g:paginate next="下一页" prev="上一页"
		            maxsteps="0" controller="TestDomain"
		            action="list" total="${testDomainInstanceCount ?: 0}" />
            
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

  })
</script>
</body>
</html>