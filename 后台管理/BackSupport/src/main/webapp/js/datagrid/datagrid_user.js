let jsondata;
let avatarURL;
let flag;
let userId;
let search_username;
$(function() {
	$('#userForm').datagrid({
		idField : 'id',
		url : 'queryUserByPage.action',
		title : '用户信息列表',
		fitColumns : true,
		fit:"true",
		height:"auto",
		frozenColumns : [[{
					field : 'ok',
					title : '',
					align : 'center',
					checkbox : true
				}, {
					field : 'id',
					title : '用户ID',
					align : 'center',
					width : 80
				}]],
		columns : [[{
					field : 'username',
					title : '用户名',
					editor : "string",
					align : 'center',
					width : 120
				},{
					field : 'password',
					title : '密码',
					align : 'center',
					width : 120
				},{
					field : 'email',
					title : '邮箱',
					align : 'center',
					width : 140
				},{
					field : 'tel',
					title : '电话',
					align : 'center',
					width : 140
				},{
					field : 'sex',
					title : '性别',
					align : 'center',
					width : 80
				},{
					field : 'avatar',
					title : '头像地址',
					align : 'center',
					width : 400
				},{
					field : 'totallyWatchingNum',
					title : '观看视频次数',
					align : 'center',
					width : 120
				},{
					field : 'totallyWatchingTimes',
					title : '观看视频总时间',
					align : 'center',
					width : 130
				},{
					field : 'exp',
					title : '已获得经验值',
					align : 'center',
					width : 120
				},{
					field : 'isVip',
					title : '是否为VIP',
					align : 'center',
					width : 80
				},{
					field : 'isTeacher',
					title : '是否为教师',
					align : 'center',
					width : 80
				}
				]],
		striped : true,
		nowrap : true,
		loadMsg : "数据正在加载",
		// singleSelect:true,
		remoteSort : false,
		pagination : true,
		pageSize : 10,
		pageList : [10, 15, 20, 25, 50],
		editors : 'string',
		toolbar : [{
					text : "新增用户",
					iconCls : "icon-add",
					handler : function() {
						flag = "add";
						$("#mydiv").window({title : "用户新增"});
						$("#mydiv").window('open');
						$('#myform').get(0).reset();
						$("#myform").form('load',{'totallyWatchingNum':'0','totallyWatchingTimes':'0','exp':'0','isVip':'0'})
					}

				}, {
					text : "修改用户",
					iconCls : "icon-edit",
					handler : function() {
						flag = "edit";
						var arr = $("#userForm").datagrid("getSelections");
						if (arr.length != 1) {
							$.messager.show({
										title : "提示信息",
										msg : "只能选择一条记录",
										timeout : 1500
									})
						} else {
							$('#myform').get(0).reset();
							$("#mydiv").window({title : "用户修改"});
							$("#mydiv").window('open');
							userId=arr[0].id;
							$("#myform").form("load","queryUserById.action?pureUserInfo.id="+ arr[0].id);
						}
					}
				}, {
					text : "删除用户",
					iconCls : "icon-remove",
					handler : function() {
						var arr = $("#userForm").datagrid("getSelections");
						if (arr.length <= 0) {
							$.messager.show({
										title : "提示信息",
										msg : "请至少选择一条记录",
										timeout : 1500
									})
						} else {
							var len=arr.length-1;
							 deleteById(len,arr);
						}
					}
				}, {
					text : "查询用户",
					iconCls : "icon-search",
					handler : function() {
						 $("#lay").layout("expand","north");
					}
				}]
	});

	function deleteById(len,arr){
		var value = arr[len].id + "," + arr[len].username;
		var info = value.split(",");
		$.messager.confirm("提示信息", "你确定要删除" + info[1]+ "吗?",
			function(boo) {
				if(boo){
					deleteByAjax(info);
				}
			});
	}

	function  deleteByAjax(info){
		$.ajax({
			type : "POST",
			url : "deleteByUserId.action",
			data : {'pureUserInfo.id' : info[0],'pureUserInfo.username' : info[1]},
			dataType : "json",
			async : false,
			success : function(result) {
				$("#userForm").datagrid("reload");
				$.messager.show({
							title : "提示信息",
							msg : result.msg,
							timeout : 1500
				});
				$("#userForm").datagrid("unselectAll");
			},
			error : function(result) {
				$.messager.show({
							title : "提示信息",
							msg : result.msg,
							timeout : 1500
						});
			   }
		});
	}
	$.extend($.fn.validatebox.defaults.rules, {
		midLength : {
			validator : function(value, param) {
				return value.length >= param[0]
					&& value.length <= param[1];
			},
			message : ''
		},
		equalLength : {
			validator : function(value, param) {
				return value.length == param[0];
			},
			message : '密码必须为4个字符!'
		},
		jgEmail :{
			validator : function(value) {
				var reg=/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
				if(reg.test(value)){
					return true;
				}else{
					return false;
				}
			},
			message : '输入合法邮箱!'
		},
		jpPass :{
			validator : function(value) {
				return value.length >= 6
					&& value.length <= 20;
			},
			message : ''
		},
		jgTel :{
			validator : function(value) {
				var reg=/^\d{11}$/;
				return reg.test(value);
			},
			message : '输入正确的电话号码!'
		},
		testDec :{
			validator :function (value) {
				var reg=/^(([^0][0-9]+|0)\.([0-9]{1,2})$)|^(([^0][0-9]+|0)$)|^(([1-9]+)\.([0-9]{1,2})$)|^(([1-9]+)$)/;
				return reg.test(value);
		},
		message : '请输入小数或整数'
			},
			testNum :{
				validator :function (value) {
					var reg=/^[0-9]*$/;
					return reg.test(value);
				},
				message : '必须输入数字'
			}
	});

	function add0(m){
		return m<10?'0'+m : m;
	}

	function timestamp(){
		var time = new Date();
		var y = time.getFullYear();
		var m = time.getMonth()+1;
		var d = time.getDate();
		var h = time.getHours();
		var mm = time.getMinutes();
		var s = time.getSeconds();

		console.log(y);

		return ""+y+add0(m)+add0(d)+add0(h)+add0(mm)+add0(s);
	}

	function addOrSave(){
		if(flag=='add'){
			$.ajax({
				type : "post",
				url : "queryByUsername.action",
				cache : false,
				data : {'pureUserInfo.username':jsondata['pureUserInfo.username']},
				dataType : "json",
				success : function(result) {
					if(result['id']==''){
						$.ajax({
							type : "post",
							url : "addUser.action",
							cache : false,
							data : jsondata,
							dataType : "json",
							success : function(result) {
								$("#mydiv").window("close");
								$("#userForm").datagrid("reload");
								$.messager.show({
									title : "提示信息",
									msg : result.msg,
									timeout : 1500
								});
								$("#userForm").datagrid("unselectAll");
							},
							error : function(result) {
								$.messager.show({
									title : "提示信息",
									msg : "无法连接数据库",
									timeout : 1500
								});
							}
						});
					}else{
						$.messager.show({
							title : "提示信息",
							msg : "用户已存在",
							timeout : 1500
						});
					}
				},
				error : function(result) {
					$.messager.show({
						title : "提示信息",
						msg : "无法连接数据库",
						timeout : 1500
					});
				}
			});
		}else{
			jsondata['pureUserInfo.avatar']=avatarURL;
			jsondata['pureUserInfo.id']=userId;
			$.ajax({
				type : "post",
				url : "updateUser.action",
				cache : false,
				data : jsondata,
				dataType : "json",
				success : function(result) {
					$("#mydiv").window("close");
					$("#userForm").datagrid("reload");
					$.messager.show({
						title : "提示信息",
						msg : result.msg,
						timeout : 1500
					});
					$("#userForm").datagrid("unselectAll");
				},
				error : function(result) {
					$.messager.show({
						title : "提示信息",
						msg : "无法连接数据库",
						timeout : 1500
					});
				}
			});
		}
	}

	$('#btn_save').click(function() {
		if (!$('#myform').form('validate')) {
			$.messager.show({
				title : '提示信息',
				msg : '验证没有通过,不能提交表单!',
				timeout : 1500
			});
			return false;
		}
		jsondata={}
		$.each($("#myform").serializeArray(), function(i, field){
			jsondata['pureUserInfo.'+field.name]=field.value
		});
		var file = document.getElementsByName("avatar")[0].files[0];
		if(file!=null){
			var client = new OSS.Wrapper({
				region : 'oss-cn-chengdu',
				accessKeyId : 'LTAI4FkZLY3GHg6HTb2qSQUn',
				accessKeySecret : 'uv5uXZTrw3KKavVuvifmYndirp0Ft9',
				bucket : 'vue13'
			});
			var suffix = file.name.substr(file.name.indexOf("."));
			var obj=timestamp();  // 这里是生成文件名
			var storeAs = 'user_avatar/'+obj+suffix;  //命名空间
			client.multipartUpload(storeAs, file).then(function (result) {
				avatarURL='http://vue13.oss-cn-chengdu.aliyuncs.com/'+result['name'];
				addOrSave();
			}).catch(function (err) {
				$.messager.show({
					title : "提示信息",
					msg : "图像上传失败",
					timeout : 1500
				});
			});
		}else{
			addOrSave();
		}
	});

	$('#btn_cancel').click(function() {
		$("#mydiv").window('close');
		$("#userForm").datagrid("unselectAll");
    });
    $("#search").click(function(){
		search_username=$("#search_username").val().trim();
		$.ajax({
			type : "post",
			url : "queryByUsernameLikely.action",
			cache : false,
			data : {'pureUserInfo.username':search_username},
			dataType : "json",
			success : function(result) {
				if(result['total']!='0'){
					$("#userForm").datagrid('loadData',{total:0,rows:[]});
					$("#userForm").datagrid('loadData' , result);
					$.messager.show({
						title : "提示信息",
						msg : "查询成功",
						timeout : 1500
					});
				}else{
					$.messager.show({
						title : "提示信息",
						msg : "不存在该名称的用户",
						timeout : 1500
					});
				}
			},
			error : function(result) {
				$.messager.show({
					title : "提示信息",
					msg : "无法连接数据库",
					timeout : 1500
				});
			}
		});
    })

	$('#clear').click(function() {
		$("#search_username").val("");
	});
})