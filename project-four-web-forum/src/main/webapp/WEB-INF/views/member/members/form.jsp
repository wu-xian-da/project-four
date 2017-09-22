<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增|编辑</title>
</head>
<body>
	<form method="post">
	<input type="hidden" name="id" value="${membersform.id}">
	<table border="1" cellspacing="0" cellpadding="5"  width="400px" align="center">
		<tr align="center">
		<td  width="150px">姓名:</td>
		<td><input type="text" name="username" value="${membersform.username}"></td>
		</tr>
		<tr align="center">
		<td  width="150px">邮箱:</td>
		<td><input type="text" name="email" value="${membersform.email}"></td>
		</tr>
		<tr align="center">
		<td  width="150px">性别:</td>
		<td>
			<c:forEach items="${gender}" var="gender">
				<input type="radio" name="gender" value="${gender}" <c:if test="${membersform.gender eq gender}">checked="checked"</c:if>/>${gender.name}
			</c:forEach>
		</td>
		</tr>
		<tr align="center">
		<td  width="150px">年龄:</td>
		<td><input type="text" name="age" value="${membersform.age}"></td>
		</tr>
		<tr align="center">
		<td  width="150px">生日:</td>
		<td><input type="text" name="birthday" value="${membersform.birthday}"></td>
		</tr>
		<tr align="center">
		<td  width="150px">地址:</td>
		<td><input type="text" name="address" value="${membersform.address}"></td>
		</tr>
		<tr align="center">
		<td colspan="2"><button name="sumbit">提交</button>
		&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
		<button type="button" onclick="javascript:history.back();" >返回</button></td>
		</tr>
	</table>
	</form>
</body>
</html>