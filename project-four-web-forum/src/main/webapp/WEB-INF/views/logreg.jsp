<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录注册</title>
<script type="text/javascript">
	var errori ='<%=request.getParameter("error")%>'
	if(errori=='fail'){
		alert("账号不存在或被禁用");
	}
</script>
</head>
<body>
	<table height="200px"></table>
	<c:forEach items="${logreg}" var="lr">
	<c:if test="${'login' eq lr}">
	<form action="Log" method="post">
	<table border="1" align="center" height="100%" style="valign:middle">
		<tr><td>账号</td><td><input type="text" name="account"/></td></tr>
		<tr><td>密码</td><td><input type="password" name="password"/></td></tr>
		<tr><td colspan="2" align="center"><input type="submit" name="submit" value="登录"></td></tr>
	</table>
	</form>
	</c:if>
	<c:if test="${'register' eq lr}">
	<form action="Reg" method="post">
	<table border="1" align="center" height="100%" style="valign:middle">
		<tr><td>账号</td><td><input type="text" name="account"/></td></tr>
		<tr><td>密码</td><td><input type="password" name="password"/></td></tr>
		<tr><td colspan="2" align="center"><input type="submit" name="submit" value="注册"></td></tr>
	</table>
	</form>
	</c:if>
	</c:forEach>
	
	<c:forEach items="${logout}" var="lo">
	<c:if test="${'logout' eq lo}">
	<form action="Log" method="post">
	<table border="1" align="center" height="100%" style="valign:middle">
		<tr><td>账号</td><td><input type="text" name="account"/></td></tr>
		<tr><td>密码</td><td><input type="password" name="password"/></td></tr>
		<tr><td colspan="2" align="center"><input type="submit" name="submit" value="登录"></td></tr>
	</table>
	</form>
	</c:if>
	</c:forEach>
</body>
</html>