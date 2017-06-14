<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet" href="${resource(dir:'css',file:'sme.css') }">
<script>
var getPriceUrl = '<g:createLink controller="mobile" action="getPrice"/>';
var saveQuotationUrl = '<g:createLink  controller="mobile" action="saveQuotation"/>';
var historysUrl = '<g:createLink  controller="mobile" action="quotationHistory"/>';
var initUpdateDataUrl = '<g:createLink  controller="mobile" action="getQuotationById"/>';
var updatePwdUrl = '<g:createLink  controller="mobile" action="updatePwd"/>';
var exitUrl ='<g:createLink  controller="mobile" action="exit"/>';
var loginUrl ='<g:createLink  controller="mobile" action="index"/>';
</script>
<script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript"
	src="${resource(dir:'jquery.toast',file:'jquery.toastmessage.js') }"></script>
<script src="${resource(dir:'js',file:'sme.js') }"></script>
