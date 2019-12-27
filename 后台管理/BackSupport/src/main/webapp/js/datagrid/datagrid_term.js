let jsondata;
let imgURL;
let videoURL;
let flag;
let termId;
let search_title;
$(function() {
	function formattime(val){
 	  	   if(val==""||val==null){
 	  	    	return "";
 	  	    }
 	  	var datetime=new Date(val.time);
 	  	var year=datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
		var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
		var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
		var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
		var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
		return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
	}
	$('#termForm').datagrid({
		idField : 'termId',
		url : 'queryTermByPage.action',
		title : '视频信息列表',
		fitColumns : false,
		fit:"true",
		height:"auto",
		frozenColumns : [[{
					field : 'ok',
					title : '',
					align : 'center',
					checkbox : true
				}, {
					field : 'id',
					title : '视频ID',
					align : 'center',
					width : 50
				}]],
		columns : [[{
					field : 'title',
					title : '视频名',
					editor : "string",
					align : 'center',
					width : 200
				},{
					field : 'duration',
					title : '视频长度',
					align : 'center',
					width : 100
				},{
					field : 'videoUrl',
					title : '视频地址',
					align : 'center',
					width : 300
				},{
					field : 'termDesc',
					title : '视频描述',
					align : 'center',
					width : 300
				},{
					field : 'idx',
					title : 'idx',
					align : 'center',
					width : 50
				},{
					field : 'exp',
					title : '经验值',
					align : 'center',
					width : 100
				},{
					field : 'updatedAtDay',
					title : '更新天',
					align : 'center',
					width : 100
				},{
					field : 'updatedAtYearMonth',
					title : '更新年月',
					align : 'center',
					width : 100
				},{
					field : 'coverUrl',
					title : '图像地址',
					align : 'center',
					width : 300
				},{
					field : 'courseId',
					title : '课程ID',
					align : 'center',
					width : 50
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
					text : "新增视频",
					iconCls : "icon-add",
					handler : function() {
						flag = "add";
						$("#mydiv").window({title : "视频新增"});
						$("#mydiv").window('open');
						$('#myform').get(0).reset();
					}
				}, {
					text : "修改视频",
					iconCls : "icon-edit",
					handler : function() {
						flag = "edit";
						var arr = $("#termForm").datagrid("getSelections");
						if (arr.length != 1) {
							$.messager.show({
										title : "提示信息",
										msg : "只能选择一条记录",
										timeout : 1500
									})
						} else {
							$('#myform').get(0).reset();
							termId=arr[0].id;
							$("#myform").form("load","queryTermByTermId.action?pureTerm.id="+ termId);
							$("#mydiv").window({title : "视频修改"});
							$("#mydiv").window('open');
						}
					}
				}, {
					text : "删除视频",
					iconCls : "icon-remove",
					handler : function() {
						var arr = $("#termForm").datagrid("getSelections");
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
					text : "查询视频",
					iconCls : "icon-search",
					handler : function() {
						 $("#lay").layout("expand","north");
					}
				}]
	});

	function deleteById(len,arr){
		var value = arr[len].id + "," + arr[len].title;
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
			url : "deleteTerm.action",
			data : {'pureTerm.id' : info[0],'pureTerm.title' : info[1]},
			dataType : "json",
			async : false,
			success : function(result) {
				$("#termForm").datagrid("reload");
				$.messager.show({
					title : "提示信息",
					msg : result.msg,
					timeout : 1500
				});
				$("#termForm").datagrid("unselectAll");
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
		testNum :{
			validator :function (value) {
				var reg=/^[0-9]*$/;
				return reg.test(value);
			},
			message : '必须输入数字'
		},
		testDec : {
			validator: function (value) {
				var reg = /^(([^0][0-9]+|0)\.([0-9]{1,2})$)|^(([^0][0-9]+|0)$)|^(([1-9]+)\.([0-9]{1,2})$)|^(([1-9]+)$)/;
				return reg.test(value);
			},
			message: '必须输入小数或整数'
		},
		testVideoLength : {
			validator: function (value) {
				var reg = /[0-9][0-9]:[0-9][0-9]/;
				return reg.test(value);
			},
			message: '输入格式为MM:SS'
		},
		testDay :{
			validator :function (value) {
				var reg=/^[0-9]*$/;
				if(!reg.test(value)) return false;
				return value>=0&&value<=31;
			},
			message : '必须输入数字'
		}
	});
	// 数值验证组件

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
				url : "insertTerm.action",
				cache : false,
				data : jsondata,
				dataType : "json",
				success : function(result) {
					$("#mydiv").window("close");
					$("#termForm").datagrid("reload");
					$.messager.show({
						title : "提示信息",
						msg : result.msg,
						timeout : 1500
					});
					$("#termForm").datagrid("unselectAll");
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
			jsondata['pureTerm.Id']=termId;
			jsondata['pureTerm.coverUrl']=imgURL;
			jsondata['pureTerm.videoUrl']=videoURL;
			$.ajax({
				type : "post",
				url : "updateTerm.action",
				cache : false,
				data : jsondata,
				dataType : "json",
				success : function(result) {
					$("#mydiv").window("close");
					$("#termForm").datagrid("reload");
					$.messager.show({
						title : "提示信息",
						msg : result.msg,
						timeout : 1500
					});
					$("#termForm").datagrid("unselectAll");
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
		$('#mydiv').attr('disabled',true);
		$.messager.show({
			title : '提示信息',
			msg : '正在上传图像和视频请稍等!',
			timeout : 1500
		});
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
			jsondata['pureTerm.'+field.name]=field.value
		});
		$.ajax({
			type : "post",
			url : "queryCourseByCourseId.action",
			cache : false,
			data : {'pureCourse.courseId':jsondata['pureTerm.courseId']},
			dataType : "json",
			success : function(result) {
				if(result['courseId']==''){
					$.messager.show({
						title : "提示信息",
						msg : "不存在该课程ID",
						timeout : 1500
					});
				}else{
					var file = document.getElementsByName("coverUrl")[0].files[0];
					if(file!=null){
						var client = new OSS.Wrapper({
							region : 'oss-cn-chengdu',
							accessKeyId : 'LTAI4FkZLY3GHg6HTb2qSQUn',
							accessKeySecret : 'uv5uXZTrw3KKavVuvifmYndirp0Ft9',
							bucket : 'vue13'
						});
						var suffix = file.name.substr(file.name.indexOf("."));
						var obj=timestamp();
						var storeAs = 'term_img/'+obj+suffix;
						client.multipartUpload(storeAs, file).then(function (result) {
							imgURL='http://vue13.oss-cn-chengdu.aliyuncs.com/'+result['name'];
							var videoClient = new OSS.Wrapper({
								region : 'oss-cn-chengdu',
								accessKeyId : 'LTAI4FkZLY3GHg6HTb2qSQUn',
								accessKeySecret : 'uv5uXZTrw3KKavVuvifmYndirp0Ft9',
								bucket : 'vue13'
							});
							var videoFile = document.getElementsByName("videoUrl")[0].files[0];
							if(videoFile!=null){
								var videoSuffix = videoFile.name.substr(videoFile.name.indexOf("."));
								var videoObj=timestamp();
								var videoStoreAs = 'term_video/'+videoObj+videoSuffix;
								videoClient.multipartUpload(videoStoreAs, videoFile).then(function (result) {
									videoURL='http://vue13.oss-cn-chengdu.aliyuncs.com/'+result['name'];
									addOrSave();
								}).catch(function (err) {
									$.messager.show({
										title : "提示信息",
										msg : "视频上传失败",
										timeout : 1500
									});
								});
							}else{
								addOrSave();
							}
						}).catch(function (err) {
							$.messager.show({
								title : "提示信息",
								msg : "图像上传失败",
								timeout : 1500
							});
						});
					}else{
						var videoClient = new OSS.Wrapper({
							region : 'oss-cn-chengdu',
							accessKeyId : 'LTAI4FkZLY3GHg6HTb2qSQUn',
							accessKeySecret : 'uv5uXZTrw3KKavVuvifmYndirp0Ft9',
							bucket : 'vue13'
						});
						var videoFile = document.getElementsByName("videoUrl")[0].files[0];
						if(videoFile!=null){
							var videoSuffix = videoFile.name.substr(videoFile.name.indexOf("."));
							var videoObj=timestamp();
							var videoStoreAs = 'term_video/'+videoObj+videoSuffix;
							videoClient.multipartUpload(videoStoreAs, videoFile).then(function (result) {
								videoURL='http://vue13.oss-cn-chengdu.aliyuncs.com/'+result['name'];
								addOrSave();
							}).catch(function (err) {
								$.messager.show({
									title : "提示信息",
									msg : "视频上传失败",
									timeout : 1500
								});
							});
						}else{
							addOrSave();
						}
					}
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

		$('#mydiv').removeAttr('disabled');

	});

	$('#btn_cancel').click(function() {
		$("#mydiv").window('close');
		$("#termForm").datagrid("unselectAll");
    });

    $("#search").click(function(){
		search_title=$("#search_title").val().trim();
		$.ajax({
			type : "post",
			url : "queryByTermTitleLikely.action",
			cache : false,
			data : {'pureTerm.title':search_title},
			dataType : "json",
			success : function(result) {
				if(result['total']!='0'){
					$("#termForm").datagrid('loadData',{total:0,rows:[]});
					$("#termForm").datagrid('loadData' , result);
					$.messager.show({
						title : "提示信息",
						msg : "查询成功",
						timeout : 1500
					});
				}else{
					$.messager.show({
						title : "提示信息",
						msg : "不存在该名称的视频",
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
		$("#search_title").val("");
	});
})