<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
String name = request.getParameter("user");//用request得到 
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bg</title>
</head>
<body>
	<h1>欢迎<%=name%>进入用户管理系统</h1>
	
	<c:forEach items="${tmbname}" var="tn">
		<c:if test="${tn.roleTMB.type eq 'TITLE'}">
		<c:set value="${tn.roleTMB.parenthref}" var="parent"></c:set>
			${tn.roleTMB.name}--${parent}
		
		<c:forEach items="${tmbname}" var="mn">
		<c:if test="${mn.roleTMB.type eq 'MENU'}">
		<c:if test="${mn.roleTMB.parenthref eq parent}">
			${mn.roleTMB.name}==${parent}
		</c:if>
		</c:if>
		
		</c:forEach>
		</c:if>
	</c:forEach>
	<hr>
	
</body>
</html>