<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/include/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录注册</title>
<script type="text/javascript">
	var errori ='<%=request.getParameter("error")%>'
	if(errori=='fail'){
		alert("账号不存在");
	}
	if(errori=='jy'){
		alert("账号被禁用,请联系管理员");
	}
	if(errori=='reg'){
		alert("用户已被注册,请重新输入");
	}
	
	$().ready(function(){
		$("#formvalidate").validate();
	});
</script>
</head>
<body>
	<table align="center" width="600px">
		<tr height="200px"></tr>
	</table>
	<c:forEach items="${logreg}" var="lr">
	<c:if test="${'login' eq lr}">
	<form action="Log" method="post" id="formvalidate">
	<table border="1" align="center"style="valign:middle">
		<tr><td>账号</td><td><input type="text" name="account" minlength="3" required/></td></tr>
		<tr><td>密码</td><td><input type="password" name="password" minlength="3" required/></td></tr>
		<tr><td colspan="2" align="center"><input type="submit" name="submit" value="登录"></td></tr>
	</table>
	</form>
	</c:if>
	<c:if test="${'register' eq lr}">
	<form action="Reg" method="post" id="formvalidate">
	<table border="1" align="center"height="30px" style="valign:middle">
		<tr><td>账号</td><td><input type="text" name="account" minlength="3" required/></td></tr>
		<tr><td>密码</td><td><input type="password" name="password" minlength="3" required/></td></tr>
		<tr><td colspan="2" align="center"><input type="submit" name="submit" value="注册"></td></tr>
	</table>
	</form>
	</c:if>
	</c:forEach>
</body>
</html>