let jsondata;
let imgURL;
let flag;
let courseId;
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
	$('#courseForm').datagrid({
		idField : 'courseId',
		url : 'queryCourseByPage.action',
		title : '课程信息列表',
		fitColumns : false,
		fit:"true",
		height:"auto",
		frozenColumns : [[{
					field : 'ok',
					title : '',
					align : 'center',
					checkbox : true
				}, {
					field : 'courseId',
					title : '课程ID',
					align : 'center',
					width : 50
				}]],
		columns : [[{
					field : 'title',
					title : '课程名',
					editor : "string",
					align : 'center',
					width : 150
				},{
					field : 'img',
					title : '图像地址',
					align : 'center',
					width : 300
				},{
					field : 'price',
					title : '价格',
					align : 'center',
					width : 100
				},{
					field : 'isLike',
					title : '是否可收藏',
					align : 'center',
					width : 100
				},{
					field : 'rank',
					title : '级别',
					align : 'center',
					width : 100
				},{
					field : 'number',
					title : '热度',
					align : 'center',
					width : 100
				},{
					field : 'courseDesc',
					title : '课程描述',
					align : 'center',
					width : 250
				},{
					field : 'isComplete',
					title : '是否完结',
					align : 'center',
					width : 100
				},{
					field : 'praise',
					title : '奖励',
					align : 'center',
					width : 100
				},{
					field : 'shortTitle',
					title : '短标题',
					align : 'center',
					width : 200
				},{
					field : 'teacherName',
					title : '教师名称',
					align : 'center',
					width : 100
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
					text : "新增课程",
					iconCls : "icon-add",
					handler : function() {
						flag = "add";
						$("#mydiv").window({title : "课程新增"});
						$("#mydiv").window('open');
						$('#myform').get(0).reset();
					}
				}, {
					text : "修改课程",
					iconCls : "icon-edit",
					handler : function() {
						flag = "edit";
						var arr = $("#courseForm").datagrid("getSelections");
						if (arr.length != 1) {
							$.messager.show({
										title : "提示信息",
										msg : "只能选择一条记录",
										timeout : 1500
									})
						} else {
							$('#myform').get(0).reset();
							courseId=arr[0].courseId;
							$("#myform").form("load","queryCourseByCourseId.action?pureCourse.courseId="+ courseId);
							$("#mydiv").window({title : "课程修改"});
							$("#mydiv").window('open');
						}
					}
				}, {
					text : "删除课程",
					iconCls : "icon-remove",
					handler : function() {
						var arr = $("#courseForm").datagrid("getSelections");
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
					text : "查询课程",
					iconCls : "icon-search",
					handler : function() {
						 $("#lay").layout("expand","north");
					}
				}]
	});

	function deleteById(len,arr){
		var value = arr[len].courseId + "," + arr[len].title;
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
			url : "deleteCourse.action",
			data : {'pureCourse.courseId' : info[0],'pureCourse.title' : info[1]},
			dataType : "json",
			async : false,
			success : function(result) {
				$("#courseForm").datagrid("reload");
				$.messager.show({
					title : "提示信息",
					msg : result.msg,
					timeout : 1500
				});
				$("#courseForm").datagrid("unselectAll");
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
				url : "insertCourse.action",
				cache : false,
				data : jsondata,
				dataType : "json",
				success : function(result) {
					$("#mydiv").window("close");
					$("#courseForm").datagrid("reload");
					$.messager.show({
						title : "提示信息",
						msg : result.msg,
						timeout : 1500
					});
					$("#courseForm").datagrid("unselectAll");
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
			jsondata['pureCourse.img']=imgURL;
			jsondata['pureCourse.courseId']=courseId
			$.ajax({
				type : "post",
				url : "updateCourse.action",
				cache : false,
				data : jsondata,
				dataType : "json",
				success : function(result) {
					$("#mydiv").window("close");
					$("#courseForm").datagrid("reload");
					$.messager.show({
						title : "提示信息",
						msg : result.msg,
						timeout : 1500
					});
					$("#courseForm").datagrid("unselectAll");
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
			jsondata['pureCourse.'+field.name]=field.value
		});
		$.ajax({
			type : "post",
			url : "queryByTeacherName.action",
			cache : false,
			data : {'pureTeacher.name':jsondata['pureCourse.teacherName']},
			dataType : "json",
			success : function(result) {
				if(result['userid']==''){
					$.messager.show({
						title : "提示信息",
						msg : "不存在该教师",
						timeout : 1500
					});
				}else{
					var file = document.getElementsByName("img")[0].files[0];
					if(file!=null){
						var client = new OSS.Wrapper({
							region : 'oss-cn-chengdu',
							accessKeyId : 'LTAI4FkZLY3GHg6HTb2qSQUn',
							accessKeySecret : 'uv5uXZTrw3KKavVuvifmYndirp0Ft9',
							bucket : 'vue13'
						});
						var suffix = file.name.substr(file.name.indexOf("."));
						var obj=timestamp();  // 这里是生成文件名
						var storeAs = 'course_img/'+obj+suffix;  //命名空间
						client.multipartUpload(storeAs, file).then(function (result) {
							imgURL='http://vue13.oss-cn-chengdu.aliyuncs.com/'+result['name'];
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

	});

	$('#btn_cancel').click(function() {
		$("#mydiv").window('close');
		$("#courseForm").datagrid("unselectAll");
    });

    $("#search").click(function(){
		search_title=$("#search_title").val().trim();
		$.ajax({
			type : "post",
			url : "queryByCourseTitleLikely.action",
			cache : false,
			data : {'pureCourse.title':search_title},
			dataType : "json",
			success : function(result) {
				if(result['total']!='0'){
					$("#termForm").datagrid('loadData',{total:0,rows:[]});
					$("#courseForm").datagrid('loadData',result);
					$.messager.show({
						title : "提示信息",
						msg : "查询成功",
						timeout : 1500
					});
				}else{
					$.messager.show({
						title : "提示信息",
						msg : "不存在该名称的课程",
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