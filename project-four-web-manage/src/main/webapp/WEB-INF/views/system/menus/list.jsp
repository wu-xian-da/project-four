<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="p" uri="http://java.sun.com/jsp/jstl/power" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Validate_sys.js"></script>
<title>用户列表</title>
<style>
	.td{
		text-align: center;
	}
</style>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/system/menus">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<p:power target="menus:select">
          	<td width="100px">条件检索</td>
            <td width="250px">名称：<input type="text" name="name" style="width: 150px"/></td>
            <td width="650px">权限标识：<input type="text" name="permission" style="width: 150px"/></td>
            <td>&nbsp;&nbsp;<input  type="submit" name="submit" value="查询" style="width:50px"/></td>
            </p:power>
            <p:power target="menus:insert">
            <td>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/system/menus/insert"><input  type="button" value="添加" style="width:50px"/></a></td>            
            </p:power>
          </tr>
        </table>
	</form>
	<hr/>
	<table border="1"  class="td" width="1200px" style="font-size: 8px;">
		<tr>
			<td width="50px">序号</td>
			<td width="100px">名称</td>
			<td >父级链接</td>
			<td >子级链接</td>
			<td >权限标识</td>
			<td >权限类型</td>
			<td >排序号</td>
			<td width="100px">管理</td>
		</tr>
		<c:forEach items="${menus}" var="m" >
		<tr>
			<td>${m.id}</td>
			<td>${m.name}</td>
			<td >${m.parenthref}</td>
			<td >${m.childshref}</td>
			<td>${m.permission}</td>
			<td >${m.type.name}</td>
			<td>${m.sort}</td>
			<td>
				<p:power target="menus:update">
				<a href="${pageContext.request.contextPath}/system/menus/update/${m.id}"><i></i>编辑</a>
				</p:power>
				<p:power target="menus:delete">
				<a href="${pageContext.request.contextPath}/system/menus/delete/${m.id}" class="deletemenu"><i></i>删除</a>
				</p:power>
				<!-- hidden -->
				<input type="hidden" value="${m.name}"/>
				<!-- hidden角色与权限的关联 -->
				<c:forEach items="${rolename}" var="ruhidden">
					<c:if test="${ruhidden.menusId eq m.id}"><input type="hidden" value="${ruhidden.roles}"/></c:if>
				</c:forEach>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
<%@ include file="/WEB-INF/include/page.jsp" %>