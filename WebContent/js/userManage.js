$(function(){
	$("#users").datagrid({
		url:basePath+"/getUsers",
		fit:true,
		striped:true,
		rownumbers:true,
		border:true,
		pagination:true,
		singleSelect:true,
		pageNumber:1,
		pageSize:10,
		pageList:[10,20,30],
		toolbar : '#toolbar',
		columns:[[
			{
				field: 'id',
				title: 'id',
				width: 100,
				hidden: true
			},
			{
				field: 'firstName',
				title: '姓氏',
				width: 100
			},
			{
				field: 'lastName',
				title: '名字',
				width: 100
			},
			{
				field: 'age',
				title: '年龄',
				width: 100
			},
		]],
	});
});

// var url;
function newUser(){
	$('#dlg').dialog('open').dialog('center').dialog('setTitle','添加用户');
	$('#fm').form('clear');
	// url = basePath+'/user';
}
function editUser(){
	var row = $('#users').datagrid('getSelected');
	if (row){
		$('#dlg').dialog('open').dialog('center').dialog('setTitle','修改用户');
		$('#fm').form('load',row);
		// url = basePath+'/user?id='+row.id;
	}
}
function saveUser(){
	$('#fm').form('submit',{
		url: basePath+'/user',
		onSubmit: function(param){
			if($('#id').val()){
				param._method = "PUT";
			}
			return $(this).form('validate');
		},
		success: function(result){
			if (result&&result.indexOf("success")>=0){
				$.messager.alert('提示信息','保存成功！','info');
				$('#dlg').dialog('close');
				$('#users').datagrid('reload');
			}
		}
	});
}
function destroyUser(){
	var row = $('#users').datagrid('getSelected');
	if (row){
		$.messager.confirm('确认','确定要删除用户吗?', function(r){
			if (r){
				$.post(basePath+'/user/'+row.id,{_method:"DELETE"}, function(result){
					if (result&&result.indexOf("success")>=0){
						$.messager.alert('提示信息','删除成功！','info');
						$('#users').datagrid('reload');
					} else {
						$.messager.alert('提示信息','删除失败！','info');
					}
				});
			}
		});
	}
}
