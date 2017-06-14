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
    <script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>
    <div class="m-wrap">
        <div class="m-header">
            <a class="btn-back iconfont" href="javascript:history.back();">&#xe600;</a>
            <h2>历史报价</h2>
        </div>
        <div id="container" class="m-container">
            <div class="page-history">
                <div class="search-hd">
                    <i class="iconfont">&#xe601;</i>
                    <span>
                        <input type="text" onkeyup="filterList(this.value)" placeholder="搜索企业名称">
                    </span>
                </div>
                <div class="search-bd">
                    <ul>
                    	<g:each var="quotation" in="${quotationList }">
                    	
                        <li>
                            <a href="<g:createLink  controller="mobile" action="quotationShow"/>?quotationId=${quotation.id}" class="search-item">
                                <h3>${quotation.companyName }</h3>
                                <p>报价金额：${quotation.totalPrice }</p>
                                <p>报价日期：${quotation.bjrq }</p>
                            </a>
                        </li>
                    	</g:each>
                       
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${resource(dir:'js',file:'sme.js') }"></script>
</html>