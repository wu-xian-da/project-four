<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" uri="http://java.sun.com/jsp/jstl/power" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/member/members">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <p:power target="members:select">
          <tr>
          	<td width="100px">条件检索</td>
            <td width="250px">账号：<input type="text" name="account" style="width: 150px"/></td>
            <td width="250px">姓名：<input type="text" name="username" style="width: 150px"/></td>
            <td align="right"><input  type="submit" value="查询" style="width:50px"/>&nbsp;&nbsp;</td>
          </tr>
        </p:power>
        </table>

	</form>
	<hr>
	<table width="100%" border="1" style="font-size: 8px;">
		<tr align="center">
			<td width="50px">序号</td>
			<td>账号</td>
			<td>状态</td>
			<td>姓名</td>
			<td>邮箱</td>
			<td width="40px">性别</td>
			<td width="40px">年龄</td>
			<td width="100px">生日</td>
			<td>住址</td>
			<td width="100px">操作管理</td>
		</tr>
		<c:forEach items="${allmembers}" var="m">
			<tr align="center">
			<td>${m.id}</td>
			<td>${m.account}</td>
			<td>${m.status.name}</td>
			<td>${m.username}</td>
			<td>${m.email}</td>
			<td>${m.gender.name}</td>
			<td>${m.age}</td>
			<td>${m.birthday}</td>
			<td>${m.address}</td>
			<td>
				<c:if test="${m.status eq 'JY'}">
				<p:power target="members:changestatusQY">
				<a href="${pageContext.request.contextPath}/member/members/changestatusQY/${m.id}">启用</a>
				</p:power>
				</c:if>
				<c:if test="${m.status eq 'QY'}">
				<p:power target="members:changestatusJY">
				<a href="${pageContext.request.contextPath}/member/members/changestatusJY/${m.id}">禁用</a>
				</p:power>
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Validate_sys.js"></script>
</html>
<%@ include file="/WEB-INF/include/page.jsp" %>