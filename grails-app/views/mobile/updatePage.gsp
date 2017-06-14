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
	var initUpdateDataUrl = '<g:createLink  controller="mobile" action="getQuotation"/>';
	var updatePwdUrl = '<g:createLink  controller="mobile" action="updatePwd"/>';
	var exitUrl ='<g:createLink  controller="mobile" action="exit"/>';
	var loginUrl ='<g:createLink  controller="mobile" action="index"/>';
	var authenticaUrl = '<g:createLink controller="mobile" action="authenticate" />';
	var homeUrl ='<g:createLink controller="mobile" action="home" />';
	var checkCompanyNameUrl ='<g:createLink controller="mobile" action="isExistsCompanyName" />';
</script>
<script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript"
	src="${resource(dir:'jquery.toast',file:'jquery.toastmessage.js') }"></script>
<script src="${resource(dir:'js',file:'sme.js') }"></script>
<style>

</style>
</head>
<body>

	<div data-role="page" id="page_update">
		<div data-role="header">
			<!--<a href="#"
				class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left" onclick="exit()">退出</a>
			--><h1>更新SME报价</h1>
			<!--<a href="#" onclick ="toPage('#page_updatepwd')"
				class="ui-btn ui-corner-all ui-shadow ui-icon-edit ui-btn-icon-left">修改密码</a>
		--></div>
		<div data-role="main" class="ui-content">
			<div style="text-align:right">
			<label><span>张三，欢迎您</span>&nbsp;<a href="#" onclick ="toPage('#page_updatepwd')">修改密码</a></label>
			</div>
			<form type="post" id="form_quotation">
			
				<div class="ui-field-contain">

					<input type="text" name="companyName" id="companyName"
						placeholder="请输入企业名称"> <input type="text" name="zzjgdm"
						id="zzjgdm" placeholder="请输入组织机构代码"> <input type="text"
						name="qylxr" id="qylxr" placeholder="请输入企业联系人"> <input
						type="date" name="bjrqStr" value="" id="bjrqStr"
						placeholder="请输入报文日期">
				</div>

				<div class="ui-field-contain">

					<div class="ui-grid-b" style="margin-bottom: 20px">
						<div class="ui-block-a" style="width: 30%; text-align: center;">
							险种</div>
						<div class="ui-block-b" style="width: 50%; text-align: center;">
							保额</div>
						<div class="ui-block-c" style="width: 20%; text-align: center;">费用</div>
					</div>


					<div class="ui-grid-b">
						<div class="ui-block-a" style="width: 30%" xz="xz1">
							团体疾病身故保险</div>
						<div class="ui-block-b" style="width: 50%">
							<fieldset data-role="controlgroup">
								<select data-mini="true" name="xz1_factor1"
									onchange="calPrice(this)" xz="xz1">
									<option value="5万">5万</option>
									<option value="10万">10万</option>
									<option value="15万">15万</option>
									<option value="20万">20万</option>
								</select>

							</fieldset>
						</div>
						<div class="ui-block-c" style="width: 20%; text-align: right;"
							id="xz1-price">25元</div>
							<input type="hidden" name="xz1_price" id="xz1_price" value ="25"/>
					</div>
				</div>
				<div class="ui-field-contain">
					<div class="ui-grid-b">
						<div class="ui-block-a" style="width: 30%" xz="xz2">
							团体意外伤害保险</div>
						<div class="ui-block-b" style="width: 50%">
							<fieldset data-role="controlgroup">
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

							</fieldset>
						</div>
						<div class="ui-block-c" style="width: 20%; text-align: right;"
							id="xz2-price">0元</div>
							<input type="hidden" name="xz2_price" id="xz2_price" value ="0"/>
					</div>
				</div>
				<div class="ui-field-contain">
					<div class="ui-grid-b">
						<div class="ui-block-a" style="width: 30%" xz="xz3">
							团体重大疾病保险</div>
						<div class="ui-block-b" style="width: 50%">
							<fieldset data-role="controlgroup">
								<select data-mini="true" name="xz3_factor1"
									onchange="calPrice(this)" xz="xz3">
									<option  value="无" >无</option>
									<option value="5万">5万</option>
									<option value="10万" >10万</option>
									<option value="15万" >15万</option>
									<option value="20万" >20万</option>
								</select>

							</fieldset>
						</div>
						<div class="ui-block-c" style="width: 20%; text-align: right;"
							id="xz3-price">0元</div>
						<input type="hidden" name="xz3_price" id="xz3_price" value ="0"/>
					</div>
				</div>
				<div class="ui-field-contain">
					<div class="ui-grid-b">
						<div class="ui-block-a" style="width: 30%" xz="xz4">
							附加团体意外伤害医疗保险（A款）</div>
						<div class="ui-block-b" style="width: 50%">
							<fieldset data-role="controlgroup">
								<select data-mini="true" name="xz4_factor1"
									onchange="calPrice(this)" xz="xz4">
									<option  value="无">无</option>
									<option value="意外住院2万" >意外住院2万</option>
									<option value="意外门诊5千意外住院1.5万" >意外门诊5千意外住院1.5万</option>
									<option value="意外门诊意外住院合计2万" >意外门诊意外住院合计2万</option>

								</select> <select data-mini="true" name="xz4_factor2"
									onchange="calPrice(this)" xz="xz4">
									<option value="次免赔额0赔付比例100%" >次免赔额0赔付比例100%</option>
									<option value="次免赔额100赔付比例90%" >次免赔额100赔付比例90%</option>
								</select>
						</div>
						<div class="ui-block-c" style="width: 20%; text-align: right;"
							id="xz4-price">0元</div>
							<input type="hidden" name="xz4_price" id="xz4_price" value ="0"/>

					</div>
				</div>
				<div class="ui-field-contain">
					<div class="ui-grid-b">
						<div class="ui-block-a" style="width: 30%" xz="xz5">附加团体疾病医疗保险（A款）
						</div>
						<div class="ui-block-b" style="width: 50%">
							<fieldset data-role="controlgroup">
								<select data-mini="true" onchange="calPrice(this)"
									name="xz5_factor2" xz="xz5">
									<option value="无">无</option>
									<option value="疾病住院2万" >疾病住院2万</option>
									<option value="疾病门诊住院共用2万" >疾病门诊住院共用2万</option>
									<option value="疾病门诊5千，住院1.5万" >疾病门诊5千，住院1.5万</option>
								</select> <select data-mini="true" onchange="calPrice(this)"
									name="xz5_factor3" xz="xz5">
									<option value="次免赔额0赔付比例100%" >次免赔额0赔付比例100%</option>
									<option value="次免赔额100赔付比例90%" >次免赔额100赔付比例90%</option>
								</select> <select data-mini="true" onchange="calPrice(this)"
									name="xz5_factor1" xz="xz5">
									<option value="有医保" >有医保</option>
									<option value="无医保" >无医保</option>
								</select>
							</fieldset>
						</div>
						<div class="ui-block-c" style="width: 20%; text-align: right;"
							id="xz5-price">0元</div>
							<input type="hidden" name="xz5_price" id="xz5_price" value="0"/>
					</div>
				</div>

				<div class="ui-field-contain">
					<div class="ui-grid-b">
						<div class="ui-block-a" style="width: 30%" xz="xz6">
							附加团体住院补贴医疗保险</div>
						<div class="ui-block-b" style="width: 50%">
							<fieldset data-role="controlgroup">
								<select data-mini="true" onchange="calPrice(this)"
									name="xz6_factor1" xz="xz6">
									<option value="无" >无</option>
									<option value="意外住院补贴50元">意外住院补贴50元</option>
									<option value="意外住院补贴100元">意外住院补贴100元</option>
									<option value="意外住院补贴150元">意外住院补贴150元</option>
									<option value="意外住院补贴200元">意外住院补贴200元</option>
								</select> <select data-mini="true" onchange="calPrice(this)"
									name="xz6_factor2" xz="xz6">
									<option value="无" >无</option>
									<option value="疾病住院补贴50元">疾病住院补贴50元</option>
									<option value="疾病住院补贴100元">疾病住院补贴100元</option>
									<option value="疾病住院补贴150元">疾病住院补贴150元</option>
									<option value="疾病住院补贴200元">疾病住院补贴200元</option>

								</select> <select data-mini="true" onchange="calPrice(this)"
									name="xz6_factor3" xz="xz6">
									<option value="免赔期0天" >免赔期0天</option>
									<option value="免赔期3天" >免赔期3天</option>
								</select>
							</fieldset>
						</div>
						<div class="ui-block-c" style="width: 20%; text-align: right;"
							id="xz6-price">0元</div>
							<input type="hidden" name="xz6_price" id="xz6_price" value ="0"/>
					</div>
				</div>

				<div class="ui-field-contain">
					<div class="ui-grid-a">
						<div class="ui-block-a" style="width: 70%;"></div>
						<div class="ui-block-b" style="width: 30%; text-align: right"
							id="total-price">合计：25元</div>
						<input type="hidden" name="totalPrice" id="totalPrice_input"
							value="25" />
					</div>

					<input type="hidden" name="id" id="id_hidden" value="${params.id }"/>
					<div class="ui-field-contain">
						<div class="ui-grid-a">
							<div class="ui-block-a">
								<a href="#" id="btn_history"onclick="toPage('#page_history')"class="ui-shadow ui-btn ui-corner-all">历史报价</a>
							
							</div>
							<div class="ui-block-b">
								<button class="ui-shadow ui-btn ui-corner-all" id="btn_qr" type="button"
									onclick="previewData2()">提交</button>
						
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div data-role="page" class="jqm-home" id="page_updatepwd">
		<div data-role="header">
				 <a href="#page_home" class="ui-btn ui-corner-all ui-icon-carat-l ui-btn-icon-notext">返回</a>
			<h1>密码修改</h1>
		</div>
		<div>
			<img src="${resource(dir:'images',file:'banner.png') }" width="100%">
		</div>
		<div data-role="main" class="ui-content">
			<div class="ui-field-contain">
				<form>
					<div>
						<h3>修改密码</h3>
						<label for="oldpassword" class="ui-hidden-accessible">旧密码:</label>
						<input type="password" name="oldpassword" id="oldpassword"
							placeholder="请输入旧密码"> <label for="newpassword"
							class="ui-hidden-accessible">新密码:</label> <input type="password"
							name="newpassword" id="newpassword" placeholder="请输入新密码">
						<label for="okpassword" class="ui-hidden-accessible">确认密码:</label>
						<input type="password" name="okpassword" id="okpassword"
							placeholder="请输入确认密码">
							 <input type="button" onclick="submitUpdatePwd()"value="确定">
					</div>
						<input type="hidden" name="memberId" id="memberId" value="${session.member.id}"/>
				</form>
			</div>
		</div>
	</div>

	<div data-role="page" class="jqm-home" id="page_success">
		<div data-role="header">
			<a href="#" onclick="resetFormData()"
				class="ui-btn ui-corner-all ui-icon-carat-l ui-btn-icon-notext">上一页</a>
			<h1>数据保存成功</h1>
		</div>
		<div data-role="main" class="ui-content">
			<div class="ui-field-contain">
				<div>
					<h3>数据保存成功</h3>
					<a href="#" class="ui-btn"onclick="resetFormData()">返回</a>
				</div>
			</div>
		</div>
	</div>
	<div data-role="page" class="jqm-home" id="page_error">
		<div data-role="header">
			<a href="#page_home"
				class="ui-btn ui-corner-all ui-icon-carat-l ui-btn-icon-notext">上一页</a>
			<h1>数据保存失败</h1>
		</div>
		<div data-role="main" class="ui-content">
			<div class="ui-field-contain">
				<div>
					<h3>数据保存失败，请稍后重试</h3>
					<a href="#" class="ui-btn" data-rel="back">返回</a>
				</div>
			</div>
		</div>
	</div>

	<div data-role="page" class="jqm-home" id="page_history">
		<div data-role="header">
			<a href="#page_home"
				class="ui-btn ui-corner-all ui-icon-carat-l ui-btn-icon-notext">返回</a>
			<h1>历史报价</h1>
		</div>
		<div data-role="main" class="ui-content">
			<div class="ui-field-contain">
				<ul data-role="listview" data-filter="true"
					data-filter-placeholder="搜索企业名称..." id="list_history"
					data-inset="true">
				</ul>
			</div>
		</div>
	</div>

<!--####     page_preview         ##################### -->
	<div data-role="page" id="page_preview">
		<div data-role="header">
			<a href="#page_history"
				class="ui-btn ui-corner-all ui-icon-carat-l ui-btn-icon-notext" id="btn_backhistory">返回</a>
			<h1>方案详情</h1>
		</div>
		<div data-role="main" class="ui-content">

			<div class="ui-field-contain">
				<label for="preview_companyName">企业名称：广东方欣科技有限公司</label> <label
					for="preview_zzjgdm">组织机构代码：20155445</label> <label
					for="preview_qylxr">企业联系人：张三</label> <label for="preview_bjrq">报价日期：2016-01-01</label>
			</div>
			<div class="ui-field-contain">
				<div class="ui-grid-b" style="margin-bottom: 20px">
					<div class="ui-block-a" style="width: 40%; text-align: center;">
						险种</div>
					<div class="ui-block-b" style="width: 40%; text-align: center;">
						保额</div>
					<div class="ui-block-c" style="width: 20%; text-align: center;">费用</div>
				</div>
				<div class="ui-grid-b">
					<div class="ui-block-a" style="width: 40%" >团体疾病身故保险
					</div>
					<div class="ui-block-b" style="width: 40%; text-align: center;">
						<label for="preview_xz1_factor1">5万</label>
					</div>
					<div class="ui-block-c" style="width: 20%; text-align: right;">
						<label for="preview_xz1_price">10元</label>
					</div>
				</div>
			</div>
			<div class="ui-field-contain">
				<div class="ui-grid-b">
					<div class="ui-block-a" style="width: 40%" >团体意外伤害保险
					</div>
					<div class="ui-block-b" style="width: 40%; text-align: center;">
						<label for="preview_xz2_factor1">5万</label>
					</div>
					<div class="ui-block-c" style="width: 20%; text-align: right;">
						<label for="preview_xz2_price">10元</label>
					</div>
				</div>
			</div>
			<div class="ui-field-contain">
				<div class="ui-grid-b">
					<div class="ui-block-a" style="width: 40%">团体重大疾病保险
					</div>
					<div class="ui-block-b" style="width: 40%; text-align: center;">
						<label for="preview_xz3_factor1">20万</label>
					</div>
					<div class="ui-block-c" style="width: 20%; text-align: right;">
						<label for="preview_xz3_price">10元</label>
					</div>
				</div>
			</div>
			<div class="ui-field-contain">
				<div class="ui-grid-b">
					<div class="ui-block-a" style="width: 40%">
						附加团体意外伤害医疗保险（A款）</div>
					<div class="ui-block-b" style="width: 40%">
						<fieldset data-role="controlgroup;text-align:center;">
							<label for="preview_xz4_factor1">意外门诊意外住院合计2万</label> <label
								for="preview_xz4_factor2">次免赔额100赔付比例90%</label>
						</fieldset>
					</div>
					<div class="ui-block-c" style="width: 20%; text-align: right;">
						<label for="preview_xz4_price">10元</label>
					</div>
				</div>
			</div>
			<div class="ui-field-contain">
				<div class="ui-grid-b">
					<div class="ui-block-a" style="width: 40%">
						附加团体意外伤害医疗保险（A款）</div>
					<div class="ui-block-b" style="width: 40%">
						<fieldset data-role="controlgroup;text-align:center;">
							<label for="preview_xz5_factor2">疾病住院2万</label> <label
								for="preview_xz5_factor3">次免赔额0赔付比例100%</label> <label
								for="preview_xz5_factor1">有医保</label>
						</fieldset>
					</div>
					<div class="ui-block-c" style="width: 20%; text-align: right;">
						<label for="preview_xz5_price">10元</label>
					</div>
				</div>
			</div>
			<div class="ui-field-contain">
				<div class="ui-grid-b">
					<div class="ui-block-a" style="width: 40%" >
						附加团体住院补贴医疗保险</div>
					<div class="ui-block-b" style="width: 40%" >
						<fieldset data-role="controlgroup;text-align:center;">
							<label for="preview_xz6_factor1">意外住院补贴50元</label> <label
								for="preview_xz6_factor2">疾病住院补贴50元%</label> <label
								for="preview_xz6_factor3">免赔期0天</label>
						</fieldset>

					</div>
					<div class="ui-block-c" style="width: 20%; text-align: right;">
						<label for="preview_xz6_price">10元</label>
					</div>
				</div>
			</div>
			<div class="ui-field-contain">
				<div class="ui-grid-a">
					<div class="ui-block-a" style="width: 70%;"></div>
					<div class="ui-block-b" style="width: 30%; text-align: right" ><label for="preview_totalPrice">合计：元</label></div>
				</div>


				<div class="ui-field-contain">
					<div class="ui-grid-a">
						<div class="ui-block-a">
							<a class="ui-shadow ui-btn ui-corner-all" id="btn_share" href="#page_history">分享</a>
								<a href="#" style="display:none" id="btn_back" class="ui-btn" data-rel="back">返回</a>
						</div>
						<div class="ui-block-b">
							<button class="ui-shadow ui-btn ui-corner-all" id='btn_update' quoationId='' onclick="initUpdateData(this)">修改</button>
							
								<button style="display:none" id="btn_save"class="ui-shadow ui-btn ui-corner-all" type="button"
									onclick="sumbitQuotation()">保存</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
<!--####     page_preview end         ##################### -->
</body>

</html>