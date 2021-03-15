<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=basePath%>/jquery-easyui-1.9.14/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/jquery-easyui-1.9.14/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/jquery-easyui-1.9.14/locale/easyui-lang-zh_CN.js" ></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jquery-easyui-1.9.14/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jquery-easyui-1.9.14/themes/icon.css" />
<title>用户维护</title>
</head>
<body>
<div style="width:800px;height:450px;margin:auto;">
	<table id="users"></table>
	<div id="toolbar">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="newUser()">添加用户</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="editUser()">修改用户</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="destroyUser()">删除用户</a>
	</div>
</div>

<div id="dlg" class="easyui-dialog" style="width:400px" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
	<form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
		<input type="hidden" name="id" id="id" />
		<h3>用户信息</h3>
		<div style="margin-bottom:10px">
			<input name="firstName" class="easyui-textbox" required data-options="label:'姓氏：'" style="width:100%">
		</div>
		<div style="margin-bottom:10px">
			<input name="lastName" class="easyui-textbox" required data-options="label:'姓名：'" style="width:100%">
		</div>
		<div style="margin-bottom:10px">
			<input name="age" class="easyui-numberbox" required data-options="label:'年龄：'" style="width:100%">
		</div>
	</form>
</div>
<div id="dlg-buttons">
	<a class="easyui-linkbutton c6" data-options="iconCls:'icon-ok'" onclick="saveUser()" style="width:90px">保存</a>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#dlg').dialog('close')" style="width:90px">取消</a>
</div>
<script>
	var basePath="<%=basePath%>";
</script>
<script src="<%=basePath%>/js/userManage.js"></script>
</body>
</html>