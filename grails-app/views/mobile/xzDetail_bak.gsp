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
	var checkCompanyNameUrl ='<g:createLink controller="mobile" action="isExistsCompanyName" />';
</script>
<script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">  
$(document).bind("mobileinit", function()   
{   
   if (navigator.userAgent.indexOf("Android") != -1)   
   {   
 $.mobile.defaultPageTransition = 'none';   
 $.mobile.defaultDialogTransition = 'none';   
   }   
});  
</script> 
<script src="${resource(dir:'js',file:'jquery.mobile-1.4.5.js') }"></script>
<script type="text/javascript"
	src="${resource(dir:'jquery.toast',file:'jquery.toastmessage.js') }"></script>
<script src="${resource(dir:'js',file:'sme.js') }"></script>
<style>
.ui-page { -webkit-backface-visibility: hidden; }
</style>
</head>
<body>


	<div data-role="page" class="jqm-home" id="page_history">
		<div data-role="header">
			<a href="#page_home"
				class="ui-btn ui-corner-all ui-icon-carat-l ui-btn-icon-notext">返回</a>
			<h1>险种介绍</h1>
		</div>
		<div data-role="main" class="ui-content">
			<div class="ui-field-contain">
				<ul data-role="listview" data-filter="true"
					 id="list_xz"
					data-inset="true">
					<li><a href="#mypanel1">团体疾病身故保险</a></li>
					<li><a href="#mypanel2">团体意外伤害保险</a></li>
					<li><a href="#mypanel3">团体重大疾病保险</a></li>
					<li><a href="#mypanel4">附加团体意外伤害医疗保险（A款）</a></li>
					<li><a href="#mypanel5">附加团体疾病医疗保险（A款）</a></li>
					<li><a href="#mypanel6">附加团体住院补贴医疗保险</a></li>
				</ul>
			</div>
		</div>
		
			<div data-role="panel" id="mypanel1" data-position="right" data-display="push">
			   <h3> 团体疾病身故保险</h3> 
			   <p>被保险人或投保人可指定一人或数人为身故保险金受益人。身故保险金受益人为数人时，应确定其受益顺序和受益份额；未确定受益份额的，各身故保险金受益人按照相等份额享有受益权。投保人指定受益人时须经被保险人同意</p>  
			    <a href="#demo-links" data-rel="close" class="ui-btn ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left ">关闭</a>
			</div>
			<div data-role="panel" id="mypanel2" data-position="right" data-display="push">
			   <h3> 团体意外伤害保险</h3> 
			   <p>被保险人或投保人可指定一人或数人为身故保险金受益人。身故保险金受益人为数人时，应确定其受益顺序和受益份额；未确定受益份额的，各身故保险金受益人按照相等份额享有受益权。投保人指定受益人时须经被保险人同意</p>  
			    <a href="#demo-links" data-rel="close" class="ui-btn ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left">关闭</a>
			</div>
			<div data-role="panel" id="mypanel3" data-position="right" data-display="push">
			   <h3> 团体重大疾病保险</h3> 
			   <p>被保险人或投保人可指定一人或数人为身故保险金受益人。身故保险金受益人为数人时，应确定其受益顺序和受益份额；未确定受益份额的，各身故保险金受益人按照相等份额享有受益权。投保人指定受益人时须经被保险人同意</p>  
			    <a href="#demo-links" data-rel="close" class="ui-btn ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left">关闭</a>
			</div>
			<div data-role="panel" id="mypanel4" data-position="right" data-display="push">
			   <h3>附加团体意外伤害医疗保险（A款）</h3> 
			   <p>被保险人或投保人可指定一人或数人为身故保险金受益人。身故保险金受益人为数人时，应确定其受益顺序和受益份额；未确定受益份额的，各身故保险金受益人按照相等份额享有受益权。投保人指定受益人时须经被保险人同意</p>  
			    <a href="#demo-links" data-rel="close" class="ui-btn ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left">关闭</a>
			</div>
			<div data-role="panel" id="mypanel5" data-position="right" data-display="push">
			   <h3> 附加团体疾病医疗保险（A款）</h3> 
			   <p>被保险人或投保人可指定一人或数人为身故保险金受益人。身故保险金受益人为数人时，应确定其受益顺序和受益份额；未确定受益份额的，各身故保险金受益人按照相等份额享有受益权。投保人指定受益人时须经被保险人同意</p>  
			    <a href="#demo-links" data-rel="close" class="ui-btn ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left">关闭</a>
			</div>
			<div data-role="panel" id="mypanel6" data-position="right" data-display="push">
			   <h3> 附加团体住院补贴医疗保险</h3> 
			   <p>被保险人或投保人可指定一人或数人为身故保险金受益人。身故保险金受益人为数人时，应确定其受益顺序和受益份额；未确定受益份额的，各身故保险金受益人按照相等份额享有受益权。投保人指定受益人时须经被保险人同意</p>  
			    <a href="#demo-links" data-rel="close" class="ui-btn ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left">关闭</a>
			</div>
			
	</div>

</body>

</html>