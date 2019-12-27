$(function(){
	
	$('#switch_qlogin').click(function(){
		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({left:'0px',width:'70px'});
		$('#qlogin').css('display','none');
		$('#web_qr_login').css('display','block');
		
		});
	$('#switch_login').click(function(){
		
		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({left:'154px',width:'70px'});
		
		$('#qlogin').css('display','block');
		$('#web_qr_login').css('display','none');
		});
if(getParam("a")=='0')
{
	$('#switch_login').trigger('click');
}

	});
	
function logintab(){
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({left:'154px',width:'96px'});
	$('#qlogin').css('display','none');
	$('#web_qr_login').css('display','block');
	
}


//根据参数名获得该参数 pname等于想要的参数名 
function getParam(pname) { 
    var params = location.search.substr(1);
    var ArrParam = params.split('&'); 
    if (ArrParam.length == 1) { 
        //只有一个参数的情况 
        return params.split('=')[1]; 
    } 
    else { 
         //多个参数参数的情况 
        for (var i = 0; i < ArrParam.length; i++) { 
            if (ArrParam[i].split('=')[0] == pname) { 
                return ArrParam[i].split('=')[1]; 
            } 
        } 
    } 
}  


var reMethod = "GET",
	pwdmin = 6;

$(document).ready(function() {
	
	$('#login').click(function() {
		if ($('#loginUsername').val().trim() == "") {
			$('#loginUsername').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#loginInfo').html("<font color='red'><b>×用户名不能为空</b></font>");
			return false;
		}

		if ($('#loginUsername').val().length < 4 || $('#loginUsername').val().length > 16) {
			$('#loginUsername').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#loginInfo').html("<font color='red'><b>×用户名必须4-16字符</b></font>");
			return false;
		}
		
		if ($('#loginPassword').val().trim() == "") {
			$('#loginPassword').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#loginInfo').html("<font color='red'><b>×密码不能为空</b></font>");
			return false;
		}
		
		if ($('#loginPassword').val().trim().length < 6 || $('#loginPassword').val().trim().length >20) {
			$('#loginPassword').focus();
			$('#loginInfo').html("<font color='red'><b>×密码必须6-20</b></font>");
			return false;
		}
		
		$.ajax({
			type : "POST",
			url : "queryByAdminNameAction.action",
			data : {'adminInfo.adminName' : $('#loginUsername').val().trim()},
			dataType : "json",
			async : false,
			success : function(resultOuter) {
				if(resultOuter["success"]==true){
					$.ajax({
						type : "POST",
						url : "queryByAdminNameAndAdminPasswordAction.action",
						data : {'adminInfo.adminName' : $('#loginUsername').val().trim(),'adminInfo.adminPassword' : $('#loginPassword').val().trim()},
						dataType : "json",
						async : false,
						success : function(resultInner) {
							if(resultInner["success"]==true){
								$.session.set('loginName',$('#loginUsername').val().trim());
								window.location.href="menu.jsp";
							}else{
								$('#loginInfo').html("<font color='red'><b>×密码错误</b></font>");
							}
						},
						error : function(resultInner) {
							$('#loginInfo').html("<font color='red'><b>×无法连接数据库</b></font>");
						}
					});
				}else{
					$('#loginInfo').html("<font color='red'><b>×用户名不存在</b></font>");
				}
			},
			error : function(resultOuter) {
				$('#loginInfo').html("<font color='red'><b>×无法连接数据库</b></font>");
			}
		});
		return false;
	});
	

	$('#reg').click(function() {
		if ($('#user').val().trim() == "") {
			$('#user').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
			return false;
		}
		if ($('#user').val().trim().length < 4 || $('#user').val().length > 16) {
			$('#user').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名位4-16字符</b></font>");
			return false;
		}
		if ($('#oldPasswd').val().trim() == "") {
			$('#oldPasswd').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×原式密码不能为空</b></font>");
			return false;
		}
		if ($('#oldPasswd').val().trim().length < 6 || $('#oldPasswd').val().trim().length >20) {
			$('#oldPasswd').focus();
			$('#userCue').html("<font color='red'><b>×原式密码必须6-20</b></font>");
			return false;
		}
		if ($('#newPasswd').val().trim() == "") {
			$('#newPasswd').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>新密码不能为空</b></font>");
			return false;
		}
		if ($('#newPasswd').val().trim().length < 6 || $('#newPasswd').val().trim().length >20) {
			$('#newPasswd').focus();
			$('#userCue').html("<font color='red'><b>×新密码必须6-20</b></font>");
			return false;
		}
		$.ajax({
			type: reMethod,
			url: "queryByAdminNameAction.action",
			data: {'adminInfo.adminName':$('#user').val().trim()},
			dataType: 'json',
			success: function(result) {
				if(result['success']==true){
					$.ajax({
						type: reMethod,
						url: "queryByAdminNameAndAdminPasswordAction.action",
						data: {'adminInfo.adminName':$('#user').val().trim(),'adminInfo.adminPassword':$('#oldPasswd').val().trim()},
						dataType: 'json',
						success: function(result) {
							if(result['success']==true){
								$.ajax({
									type: reMethod,
									url: "updateAdmin.action",
									data: {'adminInfo.adminName':$('#user').val().trim(),'adminInfo.adminPassword':$('#newPasswd').val().trim()},
									dataType: 'json',
									success: function(result) {
										if(result['success']==true){
											$('#userCue').html("<font color='blue'><b>修改成功</b></font>");
										}else{
											$('#userCue').html("<font color='red'><b>×修改失败</b></font>");
										}
									},
									error: function (result) {
										$('#userCue').html("<font color='red'><b>×无法连接数据库</b></font>");
									}
								});
							}else{
								$('#userCue').html("<font color='red'><b>×密码错误</b></font>");
							}
						},
						error: function (result) {
							$('#userCue').html("<font color='red'><b>×无法连接数据库</b></font>");
						}
					});
				}else{
					$('#userCue').html("<font color='red'><b>×用户名不存在</b></font>");
				}
			},
			error: function (result) {
				$('#userCue').html("<font color='red'><b>×无法连接数据库</b></font>");
			}
		});
	});
});