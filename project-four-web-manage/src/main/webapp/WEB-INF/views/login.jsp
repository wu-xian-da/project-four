<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/CheckForm.js"></script>
<script type="text/javascript">
	var errori ='<%=request.getParameter("error1")%>'
	if(errori=='nickname'){
		alert("昵称错误！请重新输入！");
	}
	var errori ='<%=request.getParameter("error2")%>'
	if(errori=='password'){
		alert("密码错误！请重新输入！");
	}
	var errori ='<%=request.getParameter("error3")%>'
	if(errori=='fail'){
		alert("登录失败！请重新输入！");
	}
</script>
</head>
<body>
<div id="panel">

	<div id="login_view">

		<form method="post">

			<table >

				<tr height="40px">
					<td>昵称:</td>
					<td><input type="text" id="nickname" name="nickname"></td>
					
				</tr>
				<tr height="40px">
					<td>密码:</td>
					<td><input type="text" id="password" name="password"></td>

				</tr>
				<tr>
					<td rowspan="2"><input type="submit" name="submit" value="登录"></td>
				</tr>
			</table>
		</form>

	</div>
</div>
</body>
</html>