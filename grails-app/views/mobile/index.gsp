<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="browsermode" content="application">
    <meta name="x5-page-mode" content="app">
    <title> SME报价 </title>
    <link rel="stylesheet" href="${resource(dir:'sa/css',file:'weui.css') }">
    <link rel="stylesheet" href="${resource(dir:'sa/css',file:'global.css') }">
    <script>
        (function(d,c){var e=d.documentElement,b="orientationchange" in window?"orientationchange":"resize";var a=function(){var f=e.clientWidth<640?e.clientWidth:640;if(!f){return}e.style.fontSize=20*(f/320)+"px"};if(!d.addEventListener){return}c.addEventListener(b,a,false);d.addEventListener("DOMContentLoaded",a,false);a()})(document,window);
    </script>
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
</head>
<body>
    <div class="m-wrap">
        <div class="m-header">
            <h2>账号登录</h2>
        </div>
        <div id="container" class="m-container">
            <div class="page-index">
                <div class="index-banner">
                    <img src="${resource(dir:'sa/img',file:'banner.jpg') }" alt="">
                </div>
                <form method="post"id="loginForm" >
                <div class="form-main">
                    <div class="form-item">
                     <input type="text" name="loginName"  id="loginName" list="history_list"placeholder="账号" required="required">
                       <datalist id="history_list" >
                        <g:each var="memberOpenId" in="${memberList}">
							<option   label="${memberOpenId.member.loginName }"val="${memberOpenId.member.password }" value="${memberOpenId.member.loginName }" />
				         </g:each>
						</datalist>
                    </div>
                    <div class="form-item">
                    <input type="password" name="password" id="password"  placeholder="密码" required="required">
                    </div>
                </div>
              
                <a href="#" onclick="submitForm()" class="btn-common1">登录</a>
                </form>
            </div>
        </div>
    </div>
</body>
<script src="${resource(dir:'js',file:'sme.js') }"></script>
</html>