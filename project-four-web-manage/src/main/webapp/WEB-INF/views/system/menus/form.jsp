<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/FormValid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Validate_sys.js"></script>
<title>菜单</title>
<style type="text/css">
	.td1{
		width: 80px;text-align: right;
	}
	.tr1{
		height: 50px;
	}
</style>
</head>
<body>
	<div>
		<h2>${empty menus.id ? "新增" : "编辑" }权限</h2><hr/>
		<form method="post" onsubmit="return validator(this)">
		<input type="hidden" name="id" value="${menus.id }">
		<table width="1100px">
			<tr class="tr1">
				<td class="td1">名称：</td>
				<td><input id="namevalid" type="text" name="name" value="${menus.name}" valid="required"  errmsg="名称不能为空!" placeholder="名称"><span id="errname"></span></td>
			</tr>
			
			<tr class="tr1">
				<td class="td1">权限标识：</td>
				<td><input id="permissionvalid" type="text" name="permission" value="${menus.permission}"  valid="required"  errmsg="权限标识不能为空!" placeholder="权限标识"><span id="errpermission1"></span><span id="errpermission2"></span></td>
			</tr>
			<tr class="tr1">
				<td class="td1">排序号：</td>
				<td><input id="sortvalid" type="text" name="sort" value="${menus.sort}"  valid="required"  errmsg="排序号不能为空!" placeholder="排序号"><span id="errsort"></span></td>
			</tr>
			<tr class="tr1">
				<td class="td1">类型：</td>
				<td>
					<c:forEach items="${type}" var="t">
						<input type="radio" name="type" value="${t}"
						<c:if test="${menus.type eq t}">checked="checked"<c:set value="${t}" var="ts"></c:set></c:if>/>${t.name}
					</c:forEach>
				</td>
			</tr>
			
			<tr class="tr1">
				<td class="td1">父级链接：</td>
				<td>
					<input id="namevalid" type="text" name="parenthref" value="${menus.parenthref}" 
					valid="required"  errmsg="名称不能为空!" placeholder="名称"><span id="errhref"></span>	
				</td>
			</tr>
			<tr class="tr1">
				<td class="td1">子级链接：</td>
				<td>
					<input id="namevalid" type="text" name="childshref" value="${menus.childshref}" 
					placeholder="子级链接"><span id="errhref"></span>
				</td>
			</tr>
				
			<tr class="tr1">
				<td  class="td1"><button type="submit" id="menusubmit">${empty menus.id ? "新增" : "编辑"}</button></td>
				<td><button type="button" onclick="javascript:history.back();">返回</button></td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>