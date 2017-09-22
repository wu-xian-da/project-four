<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
String roleid = request.getParameter("modulesid");//用request得到 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>top</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
	table,table td,table th{border-collapse:collapse;font-size: 25px;}
</style>
</head>
<body>
	<table height="85px" width="100%">
		<tr height="45px"></tr>
		<tr height="30px">
		<c:forEach items="${allmodules}" var="m">
		<c:set value="" var="id"></c:set>
		<c:if test="${m.parentId == param.modulesid}">
		<td><a href="${pageContext.request.contextPath}/forum/notes/jsplist/${m.id}" target="mainFramenotes">${m.name}</a></td>
		</c:if>
		</c:forEach>
		</tr>
	</table>
</body>
</html>
