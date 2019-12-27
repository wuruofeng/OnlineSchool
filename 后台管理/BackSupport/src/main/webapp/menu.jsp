<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="header">
    <div class="dl-title">
        <!--<img src="/chinapost/Public/assets/img/top.png">-->
    </div>
    <div class="dl-log">欢迎您，
    <span id="userNameSpan" class="dl-log-user"></span>
    <a id="exitButton" href="login.html" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <ul id="J_Nav" class="nav-list ks-clear">
        	<li  class="nav-item dl-selected"><div class="nav-item-inner nav-order">用户管理</div></li>
			<li  class="nav-item dl-selected"><div class="nav-item-inner nav-order">课程视频管理</div></li>
        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten"></ul>
</div>
<script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="assets/js/bui-min.js"></script>
<script type="text/javascript" src="assets/js/common/main-min.js"></script>
<script type="text/javascript" src="assets/js/config-min.js"></script>
<script type="text/javascript" src="js/jquerysession.js"></script>
<script>
    var loginName=$.session.get('loginName');
    if(loginName==null){
        alert('请先登录');
        window.location.href="login.html";
    }
    $('#userNameSpan').html(loginName);
    BUI.use('common/main',function(){
        var config = [
            {id:'userBar',menu:[{text:'用户管理',items:[{id:'userTool',text:'用户维护',href:'user_list.html'}]}]},
            {id:'courseBar',menu:[{text:'课程视频管理',items:[{id:'courseTool',text:'课程维护',href:'course_list.html'},{id:'videoTool',text:'视频维护',href:'term_list.html'}]}]}
	     ];
        new PageUtil.MainPage({
            modulesConfig : config
        });
    });
    $('#exitButton').click(function () {
        $.session.remove('loginName');
    })
</script>
</body>
</html>

  