if (typeof jQuery !== 'undefined') {
	(function($) {
		var nowStr = currentDate();
		$(document).on("pagebeforeshow","#page_home",function(){ 
			$('form#form_quotation input[name=bjrqStr]').val(nowStr);
			});
//		
		$(document).on("pagebeforeshow","#page_history",function(){
			initHistoryList();
			});
	})(jQuery);
	
	
}
function calPrice(obj){
	
	var xz = $(obj).attr("xz");
	var factor1 = $('select[name='+xz+'_factor1]').val();
	var factor2 = $('select[name='+xz+'_factor2]').val();
	var factor3 = $('select[name='+xz+'_factor3]').val();
	var xzName = $('p[xz='+xz+']').first().text();
	xzName = xzName.replace(" ","").replace(/[\r\n\t]/g,"").replace(/[ ]/g,"");
	$('select[name='+xz+'_factor1]').siblings('em').text(factor1);
	$('select[name='+xz+'_factor2]').siblings('em').text(factor2);
	$('select[name='+xz+'_factor3]').siblings('em').text(factor3);
	$.ajax({
		url:getPriceUrl,
		type:'post',
		data:{xz:xzName,factor1:factor1,factor2:factor2,factor3:factor3},
		dataType:'json',
		success:function(data){
			$('#'+xz+"-price").text(data+"元");
			$('#'+xz+"_price").val(data);
			
			calTotalPrice();
		}
	});
	
	
}

function calTotalPrice(){
	var xz1_price = parseFloat($('#xz1-price').text());
	var xz2_price = parseFloat($('#xz2-price').text());
	var xz3_price = parseFloat($('#xz3-price').text());
	var xz4_price = parseFloat($('#xz4-price').text());
	var xz5_price = parseFloat($('#xz5-price').text());
	var xz6_price = parseFloat($('#xz6-price').text());
	var totalPrice = xz1_price + xz2_price + xz3_price + xz4_price + xz5_price + xz6_price;
	$("#total-price").text(totalPrice+"元");
	$('#totalPrice_input').val(totalPrice);
}

var loading;
function sumbitQuotation(){
	 $.ajax({  
         type: "POST",  
         url: saveQuotationUrl,  
         data: $('#form_quotation').serialize(),
         success:function(data){  
        	 	alert('提交成功');
        	 	showHomePage();
        	 	resetFormData();
         },
         error: function () {
        	 alert('提交失败');
         }
	 });  
	 
}


function filterList(keyName){
	
	
	var data = $('li');
	if(data.length > 0){
		for(var i=0;i< data.length; i++){
			var text = $(data[i]).text();
			if(text.indexOf(keyName) > -1){
				$(data[i]).show();
			}else{
				$(data[i]).hide();
			}
			
		}
	}
}

var historyList={};
function initHistoryList(){
	$('#list_history').html('');
	 $.ajax({  
         type: "POST",
         url:historysUrl,
         data: {},
         success:function(data){  
        	 
        	
        	if(data.length > 0){
        		historyList=data;
        		for(var i=0;i< data.length; i++){
        			var htmlContent='';
	        		htmlContent = '<li onclick="previewData(this)" quotationId="'+data[i].id+'"><a><ul class="li_ul_history"><li>'+data[i].companyName+'</li>';
	        		htmlContent = htmlContent + '<li class="li_small">报价金额：'+data[i].totalPrice+'元</li>';
	        		htmlContent = htmlContent + '<li class="li_small">报价日期：'+data[i].bjrq.substring(0,10)+'</li></ul></a></li>';
	        		$('#list_history').append(htmlContent);
        		}
        	}
	       
        	
         },
         error: function () {
        	  $().toastmessage('showToast', {
                  text: '查询历史报价出错！',
                  sticky: false,
                  position: 'middle-center',
                  type: 'error'
              });
         }
	 });  
	 
	 
}
function trim(data){
	if(data == null || data == 'null' ){
		return '';
	}else{
		return data;
	}
}

function previewData2(){
	
	var companyName = $('form#form_quotation input[name=companyName]').val();
	var quotationId = $('form#form_quotation input[name=id]').val();
	if(companyName == ''){
		alert("公司名称不能为空");
		return false;
	}else if(quotationId == ''){
		//说明不是更新，属于新增需要校验公司名称是否已经存在
		$.ajax({
			type:"POST",
			url:checkCompanyNameUrl,
			data:{companyName:companyName},
			async :false,
			dataType:'text',
			success:function(data){
				if(data == 'yes'){
					alert('该企业已存在历史报价方案，请到历史记录进行查询修改');
					return false;
				}else{
					
					 setPreviewData();
				}
			}
		});
	}else{
		
		setPreviewData();
	}
	
}

function setPreviewData(){
	
		$('span#preview_companyName').text($('form#form_quotation input[name=companyName]').val());
		$('span#preview_zzjgdm').text($('form#form_quotation input[name=zzjgdm]').val());
		$('span#preview_bjrq').text($('form#form_quotation input[name=bjrqStr]').val());
		
		$('span#preview_qylxr').text($('form#form_quotation input[name=qylxr]').val());
		$('strong#preview_totalPrice').text($('form#form_quotation input[name=totalPrice]').val()+'元');
		for(var n=1; n < 7; n++){
			for(var i=1;i< 4;i++){
				$('em[for=preview_xz'+n+'_factor'+i+']').text($('form#form_quotation select[name=xz'+n+'_factor'+i+']').val());
			}
			$('p[for=preview_xz'+n+'_price]').text($('form#form_quotation input[name=xz'+n+'_price]').val()+'元');
		}
		
		setAddPreviewBtn();
}

function showHomePage(){
	$('div.page-home').show();
	$('div.page-result').hide();
}


function setAddPreviewBtn(){
	$('#btn_save').show();
	$('#btn_back').show();
	$('#btn_update').hide();
	$('#btn_share').hide();
	$('#btn_backhistory').attr("href", "#page_home");
	$('div.page-home').hide();
	$('div.page-result').show();
	
	
}
function setUpdatePreviewBtn(){
	$('#btn_save').hide();
	$('#btn_back').hide();
	$('#btn_update').show();
	$('#btn_share').show();
	$('#btn_backhistory').attr("href", "#page_history");
}

function previewData(quotationId){
	setUpdatePreviewBtn();
	 $.ajax({  
         type: "POST",  
         url:initUpdateDataUrl,  
         data: {quotationId:quotationId},
         success:function(data){  
        	 
        	if(data.length != ''){
        		$('span#preview_companyName').text(data['companyName']);
        		$('span#preview_zzjgdm').text(trim(data['zzjgdm']));
        		$('span#preview_bjrq').text(data['bjrq'].substring(0,10));
        		
        		$('span#preview_qylxr').text(trim(data['qylxr']));
        		$('strong#preview_totalPrice').text(data['totalPrice']+'元');
        		for(var n=1; n < 7; n++){
        			var xz = data['xz'+n].split('#');
            		for(var i=0;i< xz.length;i++){
            			$('em[for=preview_xz'+n+'_factor'+(i+1)+']').text(xz[i]);
            		}
            		$('p[for=preview_xz'+n+'_price]').text(data['xz'+n+'_price']+'元');
        		}
        		
        		$('#btn_update').attr('quotationId', quotationId);
        	}
        	
         },
         error: function () {
        	 location.href=homeUrl;
         }
	 });  
	 
}



function initUpdateData(quotationId){
	
	if(quotationId == null ||quotationId==''|| quotationId =='null' || quotationId.indexOf('#')>-1){
		return;
	}
	 $.ajax({  
         type: "POST",  
         url: initUpdateDataUrl,  
         data: {quotationId:quotationId},
         dataType:"JSON",
         success:function(data){  
        	 
        	if(data.length != ''){
        		$('form#form_quotation input[name=companyName]').val(data['companyName']);
        		$('form#form_quotation input[name=zzjgdm]').val(data['zzjgdm']);
        		$('form#form_quotation input[name=bjrqStr]').val(data['bjrq'].substring(0,10));
        		$('form#form_quotation input[name=qylxr]').val(data['qylxr']);
        		$('form#form_quotation input[name=totalPrice]').val(data['totalPrice']);
        		$("#total-price").text(data['totalPrice']+"元");
        		$('#id_hidden').val(quotationId);
        		for(var n=1; n < 7; n++){
        			var xz = data['xz'+n].split('#');
            		for(var i=0;i< xz.length;i++){
            			$('select[name=xz'+n+'_factor'+(i+1)+']').find("option[value='"+xz[i]+"']").attr("selected","selected");
            			$('select[name=xz'+n+'_factor'+(i+1)+']').siblings('em').text(xz[i]);
            		}
            		$('#xz'+n+'-price').text(data['xz'+n+'_price']+'元');
            		$('#xz'+n+'_price').val(data['xz'+n+'_price']);
        		}
        		
        	}
        	
         },
         error: function () {
        	 $('#id_hidden').val('');
         }
	 });  
	 
	 
}

function clearSelected(selectName){
	var options = $('select[name='+selectName+'] option');
	$.each(options, function(i){
		$(options[i]).removeAttr("selected");
	});
}
function toPage(pageId){
	 $.mobile.changePage(pageId);
}

function resetFormData(){
	$('#form_quotation')[0].reset();
	$('#xz1-price').text('25元');
	$('#total-price').text('合计：25元');
	for(var i=2;i<7;i++){
		$('#xz'+i+'-price').text('0元');
		var text1 = $('select[name=xz'+i+'_factor1]').find('option:eq(0)').text();
		var text2 = $('select[name=xz'+i+'_factor2]').find('option:eq(0)').text();
		var text3 = $('select[name=xz'+i+'_factor3]').find('option:eq(0)').text();
		$('select[name=xz'+i+'_factor1]').siblings('em').text(text1);
		$('select[name=xz'+i+'_factor2]').siblings('em').text(text2);
		$('select[name=xz'+i+'_factor3]').siblings('em').text(text3);
	}
	var text = $('select[name=xz1_factor1]').find('option:eq(0)').text();
	$('select[name=xz1_factor1]').siblings('em').text(text);
	document.getElementById('bjrqStr').valueAsDate = new Date();
}

function submitUpdatePwd(){
	var oldpassword = $('#oldpassword').val();
	var newpassword = $('#newpassword').val();
	var okpassword = $('#okpassword').val();
	var memberId = $('#memberId').val();
	if(oldpassword == ''){
		alert('旧密码不能为空');
		return false;
	}
	if(newpassword == ''){
		alert('新密码不能为空');
		return false;
	}
	if(okpassword != newpassword){
		alert('确认密码与新密码不相符');
		return false;
	}
	$.ajax({
		url:updatePwdUrl,
		data:{oldPassword:oldpassword,newPassword:newpassword,id:memberId},
		dataType:'text',
		success:function(data){
			if(data.indexOf('ok') > -1){
	              alert("修改成功！");
			}else{
				alert(data);
			}
		},
		error:function(data){
			alert(data);
		}
		
	});
	
}

function exit(){
	if(confirm("确定退出系统")){
		$.post(exitUrl);
		$.mobile.changePage(loginUrl);  
	}
	
}

function submitForm(){
	var loginName = $('#loginName').val();
	var password = $('#password').val();
	var option = $('#history_list option[label="'+loginName+'"]');
	if(option.length > 0){
		password = $(option).attr('val');
		$('#password').val(password);
	}
	if(loginName == ''){
		alert('请输入登录名');
		return;
	}
	if(password == ''){
		alert('请输入密码');
		return;
	}
	$.ajax({
		url:authenticaUrl,
		data:$('#loginForm').serialize(),
		dataType:'text',
		type:'POST',
		success:function(data){
			if(data.indexOf('ok')>-1){
				 window.location.href = homeUrl;
				}else{
					alert('用户或密码错误');
					}
			},
			error:function(){
				alert('用户或密码错误');
			}
			
		});
	
}

function setLoginNamePassword(obj){
	alert(1);
	var password = $(obj).attr('val');
	var loginName = $(obj).text();
	$('#loginName').val(loginName);
	$('#password').val(password);
	$('#btn_close').click();
}



function currentDate()
{ 
    var now = new Date();
   
    var year = now.getFullYear();       //年
    var month = now.getMonth() + 1;     //月
    var day = now.getDate();            //日
   
   
    var clock = year + "-";
   
    if(month < 10)
        clock += "0";
   
    clock += month + "-";
   
    if(day < 10)
        clock += "0";
    clock +=day;
    return(clock); 
} 
