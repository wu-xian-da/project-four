<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<body>
	<table height="50px" width="100%">
		<tr height="50px" valign="bottom">
		<td align="center"><a href="${pageContext.request.contextPath}/">首页</a></td>
		<c:forEach items="${allmodules}" var="m">
		<c:if test="${m.parentId == 0}">
		<td><a href="http://localhost:8888/main?modulesid=${m.id}">${m.name}</a></td>
		</c:if>
		</c:forEach>
		<td align="right">
			<a href="http://localhost:8888/log">登录</a>|<a href="http://localhost:8888/reg">注册</a>
		</td>
		</tr>
	</table>
	<hr/>
	<table width="100%" style="font-size: 8px;" border="1">
		<tr  align="center">
		<td width="50px">序号</td>
		<td>标题</td>
		<td>作者</td>
		<td width="200px">归属模块</td>
		<td width="150px">发布时间</td>
		</tr>
		<c:forEach items="${allnotes}" var="an">
		<tr>
		<td align="center">${an.id}</td>
		<td><a href="http://localhost:8888/forum/notes/selectnotes/${an.id}">${an.theme}</a></td>
		<td align="center">
			<c:forEach items="${allmembers}" var="memb">
					<c:if test="${memb.id == an.membersId}">${memb.username}</c:if>
			</c:forEach>
		</td>
		<td>
			<c:forEach items="${allmodules}" var="modu">
				<c:if test="${modu.id == an.parentmodules}">${modu.name} --</c:if>
				<c:if test="${modu.id == an.childsmodules}">${modu.name}</c:if>
			</c:forEach>
		</td>
		<td align="center"><fmt:formatDate value="${an.releasetime}" pattern="yyyy-MM-dd HH:mm" type="date"/></td>
		</tr>
		</c:forEach>
	</table>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/vlidate.js"></script>

</html>
<%@ include file="/WEB-INF/include/page.jsp" %>