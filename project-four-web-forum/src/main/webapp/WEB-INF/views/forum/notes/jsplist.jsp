<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询子模块</title>
</head>
<body>
	<table border="1" width="100%" style="font-size: 8px;" class="td">
		<tr  align="center">
			<td width="50px">序号</td>
			<td>标题</td>
			<td>作者</td>
			<td width="200px">归属模块</td>
			<td width="150px">发布时间</td>
		</tr>
		<c:forEach items="${childsnotes}" var="an">
		<tr>
		<td width="50px">${an.id}</td>
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
		<td width="150px"><fmt:formatDate value="${an.releasetime}" pattern="yyyy-MM-dd HH:mm" type="date"/></td>
		</tr>
		</c:forEach>
	</table>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.0.0.js"></script>
</html>
<%@ include file="/WEB-INF/include/page.jsp" %>