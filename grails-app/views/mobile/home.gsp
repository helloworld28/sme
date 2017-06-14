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
<body onload="initUpdateData('${params.quotationId}')">
    <div class="m-wrap">
        <div class="m-header">
            <a class="btn-back iconfont" href="javascript:history.back();">&#xe600;</a>
            <h2>SME报价</h2>
        </div>
        <div id="container" class="m-container">
        <form type="post" id="form_quotation">
            <div class="page-home">
                <p class="tips-common-tr">${session.member?.name }，欢迎您<a href="<g:createLink controller="mobile" action="editPass" />">修改密码</a></p>
                <div class="common-group">
                    <ul>
                        <li>
                            <label>企业名称：</label>        
                            <span>
                               <input type="text" name="companyName" id="companyName">
                            </span>
                        </li>
                        <li>
                            <label>组织机构代码：</label>        
                            <span>
                               <input type="text" name="zzjgdm"
						id="zzjgdm">
                            </span>
                        </li>
                         <li>
                            <label>企业联系人：</label>        
                            <span>
                               <input type="text" name="qylxr"
						id="qylxr">
                            </span>
                        </li>
                        <li>
                            <label>报价日期：</label>        
                            <span>
                                <input type="date" name="bjrqStr" id="bjrqStr">
                            </span>
                            <input type="hidden" name="memberId" id="memberId" value="${session.member.id}"/>
                            <input type="hidden" name="id" id="id_hidden" value="${params.id }"/>
                        </li>
                    </ul>
                </div>

                <div class="common-form">
                    <table>
                        <thead>
                            <tr>
                                <th class="tp-fl">
                                    <a href="<g:createLink  controller="mobile" action="xzDetail"/>">险种<i class="iconfont">&#xe604;</i></a>
                                </th>
                                <th class="tp-mid">保额</th>
                                <th class="tp-fr">保费</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="tp-fl">
                                    <p xz="xz1">团体疾病身故保险</p>
                                </td>
                                <td class="tp-mid">
                                    <ul>
                                        <li class="f-select">
                                            <em>5万</em>
                                          <select data-mini="true" name="xz1_factor1"
											onchange="calPrice(this)" xz="xz1">
											<option value="5万">5万</option>
											<option value="10万">10万</option>
											<option value="15万">15万</option>
											<option value="20万">20万</option>
										</select>
                                        </li>
                                    </ul>
                                </td>
                                <td class="tp-fr">
                                    <p id="xz1-price">25元</p>
									<input type="hidden" name="xz1_price" id="xz1_price" value ="25"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="tp-fl">
                                    <p xz="xz2">团体意外伤害保险</p>
                                </td>
                                <td class="tp-mid">
                                    <ul>
                                        <li class="f-select">
                                            <em>无</em>
                                           <select data-mini="true" name="xz2_factor1"
											onchange="calPrice(this)" xz="xz2">
											<option value="无" >无</option>
											<option value="5万">5万</option>
											<option  value="10万">10万</option>
											<option value="15万">15万</option>
											<option value="20万">20万</option>
											<option value="25万">25万</option>
											<option value="30万">30万</option>
											<option value="35万">35万</option>
											<option value="40万">40万</option>
											<option value="45万">45万</option>
											<option value="50万">50万</option>
										</select>
                                        </li>
                                      
                                    </ul>
                                </td>
                                <td class="tp-fr">
                                    <p id="xz2-price">0元</p>
									<input type="hidden" name="xz2_price" id="xz2_price" value ="0"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="tp-fl">
                                    <p xz="xz3">团体重大疾病保险</p>
                                </td>
                                <td class="tp-mid">
                                    <ul>
                                        <li class="f-select">
                                            <em>无</em>
                                           <select data-mini="true" name="xz3_factor1"
											onchange="calPrice(this)" xz="xz3">
											<option  value="无" >无</option>
											<option value="5万">5万</option>
											<option value="10万" >10万</option>
											<option value="15万" >15万</option>
											<option value="20万" >20万</option>
										</select>
                                        </li>
                                      
                                    </ul>
                                </td>
                                <td class="tp-fr">
                                    <p id="xz3-price">0元</p>
									<input type="hidden" name="xz3_price" id="xz3_price" value ="0"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="tp-fl">
                                    <p xz="xz4">附加团体意外伤害医疗保险（A款）</p>
                                </td>
                                <td class="tp-mid">
                                    <ul>
                                        <li class="f-select">
                                            <em>无</em>
                                          <select data-mini="true" name="xz4_factor1"
											onchange="calPrice(this)" xz="xz4">
											<option  value="无">无</option>
											<option value="意外住院2万" >意外住院2万</option>
											<option value="意外门诊5千意外住院1.5万" >意外门诊5千意外住院1.5万</option>
											<option value="意外门诊意外住院合计2万" >意外门诊意外住院合计2万</option>

										</select>
                                        </li>
                                        <li class="f-select">
                                            <em>次免赔额0赔付比例100%</em>
                                           <select data-mini="true" name="xz4_factor2"
									onchange="calPrice(this)" xz="xz4">
									<option value="次免赔额0赔付比例100%" >次免赔额0赔付比例100%</option>
									<option value="次免赔额100赔付比例90%" >次免赔额100赔付比例90%</option>
								</select>
                                        </li>
                                    </ul>
                                </td>
                                <td class="tp-fr">
                                    <p id="xz4-price">0元</p>
									<input type="hidden" name="xz4_price" id="xz4_price" value ="0"/>

                                </td>
                            </tr>
							  <tr>
                                <td class="tp-fl">
                                    <p xz="xz5">附加团体疾病医疗保险（A款）</p>
                                </td>
                                <td class="tp-mid">
                                    <ul>
                                        <li class="f-select">
                                            <em>无</em>
                                         <select data-mini="true" onchange="calPrice(this)"
									name="xz5_factor2" xz="xz5">
									<option value="无">无</option>
									<option value="疾病住院2万" >疾病住院2万</option>
									<option value="疾病门诊住院共用2万" >疾病门诊住院共用2万</option>
									<option value="疾病门诊5千，住院1.5万" >疾病门诊5千，住院1.5万</option>
								</select> 
                                        </li>
                                        <li class="f-select">
                                            <em>次免赔额0赔付比例100%</em>
                                          <select data-mini="true" onchange="calPrice(this)"
									name="xz5_factor3" xz="xz5">
									<option value="次免赔额0赔付比例100%" >次免赔额0赔付比例100%</option>
									<option value="次免赔额100赔付比例90%" >次免赔额100赔付比例90%</option>
								</select>
                                        </li>
									<li class="f-select">
									 <em>有医保</em>
									<select data-mini="true" onchange="calPrice(this)"
									name="xz5_factor1" xz="xz5">
									<option value="有医保" >有医保</option>
									<option value="无医保" >无医保</option>
								</select>
									</li>
                                    </ul>
                                </td>
                                <td class="tp-fr">
                                    <p id="xz5-price">0元</p>
									<input type="hidden" name="xz5_price" id="xz5_price" value="0"/>

                                </td>
                            </tr>
							
							 <tr>
                                <td class="tp-fl"  >
                                    <p xz="xz6">附加团体住院补贴医疗保险</p>
                                </td>
                                <td class="tp-mid">
                                    <ul>
                                        <li class="f-select">
                                            <em>无</em>
                                        <select data-mini="true" onchange="calPrice(this)"
									name="xz6_factor1" xz="xz6">
									<option value="无" >无</option>
									<option value="意外住院补贴50元">意外住院补贴50元</option>
									<option value="意外住院补贴100元">意外住院补贴100元</option>
									<option value="意外住院补贴150元">意外住院补贴150元</option>
									<option value="意外住院补贴200元">意外住院补贴200元</option>
								</select>
                                        </li>
                                        <li class="f-select" >
                                            <em>无</em>
                                        <select data-mini="true" onchange="calPrice(this)"
									name="xz6_factor2" xz="xz6">
									<option value="无" >无</option>
									<option value="疾病住院补贴50元">疾病住院补贴50元</option>
									<option value="疾病住院补贴100元">疾病住院补贴100元</option>
									<option value="疾病住院补贴150元">疾病住院补贴150元</option>
									<option value="疾病住院补贴200元">疾病住院补贴200元</option>

								</select> 
                                        </li>
									<li class="f-select">
									 <em>免赔期0天</em>
									 <select data-mini="true" onchange="calPrice(this)"
									name="xz6_factor3" xz="xz6">
									<option value="免赔期0天" >免赔期0天</option>
									<option value="免赔期3天" >免赔期3天</option>
								</select>
									</li>
                                    </ul>
                                </td>
                                <td class="tp-fr">
                                    <p id="xz6-price">0元</p>
									<input type="hidden" name="xz6_price" id="xz6_price" value ="0"/>

                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="3">
                                    合计：<strong id="total-price">25元</strong>
									<input type="hidden" name="totalPrice" id="totalPrice_input"
							value="25" />
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                
                <div class="common-btnGroup">
                    <a href="<g:createLink  controller="mobile" action="history"/>" id="btn_history" class="btn-cancel">历史报价</a>
                    <a href="#" id="btn_qr"
									onclick="previewData2()" class="btn-confirm">提交</a>
                </div>
            </div>
            </form>
            <div class="page-result" style="display:none">
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
                    <a href="#" class="btn-confirm" id='btn_update'onclick="initUpdateData(this)">修改</a>
                    <a href="javascript:void(0)" class="btn-confirm"  id="btn_save"onclick="sumbitQuotation(this)">保存</a>
                    
                </div>
            </div>
        </div>
    </div>
</body>
<script>
document.getElementById('bjrqStr').valueAsDate = new Date();
</script>
<script src="${resource(dir:'js',file:'sme.js') }"></script>
</html>