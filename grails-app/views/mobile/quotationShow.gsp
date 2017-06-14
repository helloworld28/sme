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
	var quotationHistoryUrl = '<g:createLink  controller="mobile" action="quotationHistory"/>';
	var initUpdateDataUrl = '<g:createLink  controller="mobile" action="getQuotationById"/>';
	var updatePwdUrl = '<g:createLink  controller="mobile" action="updatePwd"/>';
	var exitUrl ='<g:createLink  controller="mobile" action="exit"/>';
	var loginUrl ='<g:createLink  controller="mobile" action="index"/>';
	var authenticaUrl = '<g:createLink controller="mobile" action="authenticate" />';
	var homeUrl ='<g:createLink controller="mobile" action="home" />';
	var checkCompanyNameUrl ='<g:createLink controller="mobile" action="isExistsCompanyName" />';
</script>
<script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
</head>
<body onload="previewData('${params.quotationId}')">
    <div class="m-wrap">
        <div class="m-header">
            <a class="btn-back iconfont" href="javascript:history.back();">&#xe600;</a>
            <h2>投保方案详细</h2>
        </div>
        <div id="container" class="m-container">
           <div class="page-result" >
                <p class="tips-common-tr"></p>
                <div class="common-group">
                    <ul>
                        <li>
                            <label>企业名称：</label>        
                            <span id="preview_companyName">
                                广州XXXX有限公司
                            </span>
                        </li>
                        <li>
                            <label>组织机构代码：</label>        
                            <span id="preview_zzjgdm">
                                ABDSHADHJGJ
                            </span>
                        </li>
						 <li>
                            <label>企业联系人：</label>        
                            <span id="preview_qylxr">
                                ABDSHADHJGJ
                            </span>
                        </li>
                        <li>
                            <label>报价日期：</label>        
                            <span id="preview_bjrq">
                                2016-06-02
                            </span>
                        </li>
                    </ul>
                </div>

                <div class="common-form">
                    <table>
                        <thead>
                            <tr>
                                <th class="tp-fl">险种</th>
                                <th class="tp-mid">保额</th>
                                <th class="tp-fr">保费</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="tp-fl">
                                    <p>团体疾病身故保险</p>
                                </td>
                                <td class="tp-mid">
                                    <ul>
                                        <li class="f-result">
                                            <em for="preview_xz1_factor1">5万</em>
                                        </li>
                                    </ul>
                                </td>
                                <td class="tp-fr">
                                    <p for="preview_xz1_price">99元</p>
                                </td>
                            </tr>
							 <tr>
                                <td class="tp-fl">
                                    <p>团体意外伤害保险</p>
                                </td>
                                <td class="tp-mid">
                                    <ul>
                                        <li class="f-result">
                                            <em for="preview_xz2_factor1">5万</em>
                                        </li>
                                    </ul>
                                </td>
                                <td class="tp-fr">
                                    <p for="preview_xz2_price">99元</p>
                                </td>
                            </tr>
							 <tr>
                                <td class="tp-fl">
                                    <p>团体重大疾病保险</p>
                                </td>
                                <td class="tp-mid">
                                    <ul>
                                        <li class="f-result">
                                            <em for="preview_xz3_factor1">5万</em>
                                        </li>
                                    </ul>
                                </td>
                                <td class="tp-fr">
                                    <p for="preview_xz3_price">99元</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="tp-fl">
                                    <p>附加团体意外伤害医疗保险（A款）</p>
                                </td>
                                <td class="tp-mid">
                                    <ul>
                                        <li class="f-result">
                                            <em  for="preview_xz4_factor1">意外门诊意外意外门诊意外</em>
                                        </li>
                                        <li class="f-result">
                                            <em  for="preview_xz4_factor2">意外门诊意外意外门诊意外</em>
                                        </li>
                                    </ul>
                                </td>
                                <td class="tp-fr">
                                    <p  for="preview_xz4_price">99元</p>
                                </td>
                            </tr>
							  <tr>
                                <td class="tp-fl">
                                    <p>附加团体疾病医疗保险（A款）</p>
                                </td>
                                <td class="tp-mid">
                                    <ul>
                                        <li class="f-result">
                                            <em  for="preview_xz5_factor1">意外门诊意外意外门诊意外</em>
                                        </li>
                                        <li class="f-result">
                                            <em  for="preview_xz5_factor2">意外门诊意外意外门诊意外</em>
                                        </li>
										 <li class="f-result">
                                            <em  for="preview_xz5_factor3">意外门诊意外意外门诊意外</em>
                                        </li>
                                    </ul>
                                </td>
                                <td class="tp-fr">
                                    <p  for="preview_xz5_price">99元</p>
                                </td>
                            </tr>
							  <tr>
                                <td class="tp-fl">
                                    <p>附加团体住院补贴医疗保险</p>
                                </td>
                                <td class="tp-mid">
                                    <ul>
                                        <li class="f-result">
                                            <em  for="preview_xz6_factor1">意外门诊意外意外门诊意外</em>
                                        </li>
                                        <li class="f-result">
                                            <em  for="preview_xz6_factor2">意外门诊意外意外门诊意外</em>
                                        </li>
										  <li class="f-result">
                                            <em  for="preview_xz6_factor3">意外门诊意外意外门诊意外</em>
                                        </li>
                                    </ul>
                                </td>
                                <td class="tp-fr">
                                    <p  for="preview_xz6_price">99元</p>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="3">
                                    合计：<strong id="preview_totalPrice">288元</strong>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                
                <div class="common-btnGroup">
                	<a class="btn-cancel" id="btn_share" href="#page_history">分享</a>
                    <a href="#" style="display:none" id="btn_back" onclick="showHomePage()"class="btn-cancel">返回</a>
                    <a href="<g:createLink controller="mobile" action="home" />?quotationId=${params.quotationId}" class="btn-confirm" id='btn_update'>修改</a>
                    <a href="#" class="btn-confirm"  id="btn_save"onclick="sumbitQuotation(this)">保存</a>
                    
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${resource(dir:'js',file:'sme.js') }"></script>
</html>