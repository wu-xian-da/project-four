<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人主页</title>
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="5"  width="400px" align="center">
		<tr align="center">
		<td  width="150px">账号:</td>
		<td>${memberslist.account}</td>
		</tr>
		<tr align="center">
		<td  width="150px">姓名:</td>
		<td>${memberslist.username}</td>
		</tr>
		<tr align="center">
		<td  width="150px">邮箱:</td>
		<td>${memberslist.email}</td>
		</tr>
		<tr align="center">
		<td  width="150px">性别:</td>
		<td>${memberslist.gender.name}</td>
		</tr>
		<tr align="center">
		<td  width="150px">年龄:</td>
		<td>${memberslist.age}</td>
		</tr>
		<tr align="center">
		<td  width="150px">生日:</td>
		<td>${memberslist.birthday}</td>
		</tr>
		<tr align="center">
		<td  width="150px">地址:</td>
		<td>${memberslist.address}</td>
		</tr>
		<tr align="center">
		<td colspan="2"><a href="${pageContext.request.contextPath}/member/members/update/${memberslist.id}">
		<button>完善资料</button></a></td>
		</tr>
	</table>
</body>
</html>