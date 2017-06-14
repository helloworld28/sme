<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>SME</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="${resource(dir:'assets/i',file:'favicon.png') }">
  <link rel="stylesheet" href="${resource(dir:'assets/css',file:'amazeui.min.css') }"/>
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>Welcome-SME</h1>
  </div>
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-4 am-u-md-5 am-u-sm-centered">
    <br>
    <g:if test="${flash.message}">
    <div class="am-alert am-alert-warning" data-am-alert>
    ${flash.message }
    </div>
    </g:if>
	<g:form controller="user" action="authenticate" method="post" class="am-form">
	<label for="userName">用户名:</label>
      <input type="text" name="userName" id="userName" value="">
      <br>
      <label for="password">密码:</label>
      <input type="password" name="password" id="password" value="">
      <br>
      <label for="remember-me">
        <input id="remember-me" type="checkbox">
      	  记住用户名
      </label>
      <br />
      <div class="am-cf">
        <input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
        <input type="submit" name="" value="忘记密码 ^_^? " class="am-btn am-btn-default am-btn-sm am-fr">
      </div>
	</g:form>
  </div>
</div>
</body>
</html>