
<%@ page import="com.cpic.sme.Member" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}" />
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
      <form class="am-form" action='<g:createLink action="index" />' method="post">
      <div class="am-u-sm-12 am-u-md-4">
        <div class="am-form-group">
          选择条线：
          <select name="workLine" data-am-selected="{btnSize: 'sm'}">
            <option value=""<g:if test="${params.workLine=='' }">selected</g:if>>所有条线</option>
            <option value="产险" <g:if test="${params.workLine=='产险' }">selected</g:if>>产险</option>
            <option value="寿险"<g:if test="${params.workLine=='寿险' }">selected</g:if>>寿险</option>
            <option value="健康险"<g:if test="${params.workLine=='健康险' }">selected</g:if>>健康险</option>
          </select>
        </div>
      </div>
     
     <div class="am-u-sm-12 am-u-md-2">
        <div class="am-input-group am-input-group-sm">
          <input type="text" class="am-form-field" value="${params.company }" name="company"placeholder="请输入分公司">
        </div>
      </div>
       <div class="am-u-sm-12 am-u-md-2">
        <div class="am-input-group am-input-group-sm">
          <input type="text" class="am-form-field"  value="${params.org }"name="org"placeholder="请输入机构">
        </div>
      </div>
      
       <div class="am-u-sm-12 am-u-md-2">
        <div class="am-input-group am-input-group-sm">
          <input type="text" class="am-form-field"  name="name"value="${params.name }"placeholder="请输入姓名">
        </div>
      </div>

      <div class="am-u-sm-12 am-u-md-2">
        <div class="am-input-group am-input-group-sm">
          <span class="am-input-group-btn">
            <button class="am-btn am-btn-default">搜索</button>
          </span>
        </div>
      </div>
      </form>
    </div>
    
    <div class="am-g">
      <div class="am-u-sm-6 am-u-md-12">
        <div class="am-btn-toolbar">
          <div class="am-btn-group am-btn-group-xs">
            <button type="button" id="btn-create" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
            <button type="button" id="btn-delete" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
              <button type="button" id="btn-import" class="am-btn am-btn-default"  data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 400, height: 120}"><span class="am-icon-arrow-circle-down"></span> Excel导入</button>
            <button type="button" id="btn-export" class="am-btn am-btn-default"><span class="am-icon-copy"></span> 导出查询结果</button>
           
          </div>
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
                 <th class="table-check am-hide-sm-only"  >ID</th>
                	
					<g:sortableColumn property="workLine" title="${message(code: 'member.workLine.label', default: 'workLine')}" />
					<g:sortableColumn property="company" title="${message(code: 'member.company.label', default: 'Company')}"class=" am-hide-sm-only"  />
					<g:sortableColumn property="org" title="${message(code: 'member.org.label', default: 'org')}"class=" am-hide-sm-only"  />
					<g:sortableColumn property="name" title="${message(code: 'member.name.label', default: 'name')}" />
					<g:sortableColumn property="loginName" title="${message(code: 'member.loginName.label', default: 'loginName')}" />
					<g:sortableColumn property="cellphone" title="${message(code: 'member.cellphone.label', default: 'Cellphone')}" class=" am-hide-sm-only" />
					<g:sortableColumn property="idNum" title="${message(code: 'member.idNum.label', default: 'Id Num')}" />
					<g:sortableColumn property="email" title="${message(code: 'member.email.label', default: 'email')}" class=" am-hide-sm-only" />
				
				
                <th>操作</th>
              </tr>
          </thead>
          <tbody>
            
            <tr>
            	<g:each in="${memberInstanceList}" status="i" var="memberInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td><input type="checkbox" name="checkbox" value="${memberInstance.id}" /></td>
					<td class=" am-hide-sm-only"  >${memberInstance.id}</td>
					
						<td>${fieldValue(bean: memberInstance, field: "workLine")}</td>
						<td class=" am-hide-sm-only">${fieldValue(bean: memberInstance, field: "company")}</td>
						<td class=" am-hide-sm-only">${fieldValue(bean: memberInstance, field: "org")}</td>
						<td><g:link action="show" id="${memberInstance.id}">${fieldValue(bean: memberInstance, field: "name")}</g:link></td>
						<td><g:link action="show" id="${memberInstance.id}">${fieldValue(bean: memberInstance, field: "loginName")}</g:link></td>
					
						<td class=" am-hide-sm-only">${fieldValue(bean: memberInstance, field: "cellphone")}</td>
						<td >${fieldValue(bean: memberInstance, field: "idNum")}</td>
					
						<td class=" am-hide-sm-only">${fieldValue(bean: memberInstance, field: "email")}</td>
						<td>
						 <div class="am-btn-toolbar">
		                  <div class="am-btn-group am-btn-group-xs">
		                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary" type="button" onclick="editData(this)" dataId="${memberInstance.id}"><span class="am-icon-pencil-square-o"></span> 编辑</button>
		                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"  type="button" onclick="deleteData(this)" dataId="${memberInstance.id}"><span class="am-icon-trash-o"></span> 删除</button>
		                  </div>
		                </div>
						</td>
					
					</tr>
				</g:each>
       
          </tbody>
        </table>
          <div class="am-cf">
        
			  共${memberInstanceCount ?: 0}条记录
			  <div class="am-fr">
			    <ul class="am-pagination pagination">
			        <g:paginate next="下一页" prev="上一页"
		            maxsteps="0" controller="Member"params="${params}" 
		            action="index" total="${memberInstanceCount ?: 0}" />
            
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
<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">导入excel数据
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd">
      <g:form controller="member" action="importData" type="post" enctype="multipart/form-data">
      	<g:field type="file" name="file" required=""/>
      	<g:submitButton name="导入" class="am-btn am-btn-primary am-btn-xs"  ></g:submitButton>
      	<a href="<g:createLink action="downloadModel"/>">下载模板</a>
      </g:form>
    </div>
  </div>
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

<script type="text/javascript">
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
   

  });
  function editData(obj){
  	var dataId = $(obj).attr('dataId');
  	window.location = '<g:createLink action="edit"/>/'+dataId;
   }

  function deleteData(obj){
		var dataId = $(obj).attr('dataId');
		if(confirm('你确定删除吗？')){
			window.location= '<g:createLink action="deletes" />?ids='+dataId;
		}
  }
</script>
<script>
  $(function() {
    var $modal = $('#doc-modal-1');

    $modal.siblings('.am-btn').on('click', function(e) {
      var $target = $(e.target);
      if (($target).hasClass('js-modal-open')) {
        $modal.modal();
      } else if (($target).hasClass('js-modal-close')) {
        $modal.modal('close');
      } else {
        $modal.modal('toggle');
      }
    });
  });
</script>
</body>
</html>