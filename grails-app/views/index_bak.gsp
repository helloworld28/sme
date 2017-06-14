<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="pragma" content="no-cache">
 <meta http-equiv="cache-control" content="no-cache">
 <meta http-equiv="expires" content="0">   
<link rel="stylesheet"
	href="http://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet" href="${resource(dir:'css',file:'sme.css') }">
<link rel="stylesheet" href="${resource(dir:'css',file:'myblue.css') }">
<script>
var getPriceUrl = '<g:createLink controller="mobile" action="getPrice"/>';
var saveQuotationUrl = '<g:createLink  controller="mobile" action="saveQuotation"/>';
var historysUrl = '<g:createLink  controller="mobile" action="quotationHistory"/>';
var initUpdateDataUrl = '<g:createLink  controller="mobile" action="getQuotationById"/>';
var updatePwdUrl = '<g:createLink  controller="mobile" action="updatePwd"/>';
var exitUrl ='<g:createLink  controller="mobile" action="exit"/>';
var loginUrl ='<g:createLink  controller="mobile" action="index"/>';
var authenticaUrl = '<g:createLink controller="mobile" action="authenticate" />';
var homeUrl ='<g:createLink controller="mobile" action="home" />';
</script>
<script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript"
	src="${resource(dir:'jquery.toast',file:'jquery.toastmessage.js') }"></script>
<script src="${resource(dir:'js',file:'sme.js') }"></script>
<style type="text/css">
</style>

</head>
<body>
<div data-role="page" class="jqm-home">

  	<div data-role="header" data-position="inline">
    <h1 style="font-weight:thin">账号登录</h1>
  </div>
<div><img src="${resource(dir:'images',file:'banner.png') }" width="100%"></div>
  <div data-role="main" class="ui-content">
		
		 <div class="ui-field-contain">
			
			
			<form method="post"id="loginForm" >
			<div>
			  <h3>登录信息</h3>
			  <label for="usrnm" class="ui-hidden-accessible">用户名:</label>
			  <input type="text" name="loginName" id="loginName" placeholder="请输入登录帐号">
			  <label for="pswd" class="ui-hidden-accessible">密码:</label>
			  <input type="password" name="password" id="password" placeholder="请输入登录密码">
		  
			  <input type="button" onclick="submitForm()" value="登录">
			</div>
			</form>
      </div>
	  
	  
	
	
  </div>


</div>
</body>

</html>