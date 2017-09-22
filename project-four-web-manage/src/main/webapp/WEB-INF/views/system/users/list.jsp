<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="p" uri="http://java.sun.com/jsp/jstl/power" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Validate_sys.js"></script>
<title>用户列表</title>
<style>
	.td{
		text-align: center;
		
	}
	.roleclass{
		text-align: left
	}
</style>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/system/users">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <p:power target="users:select">
          	<td width="100px">条件检索</td>
            <td width="250px">姓名：<input type="text" name="username" style="width: 150px"/></td>
            <td width="250px">昵称：<input type="text" name="nickname" style="width: 150px"/></td>
           <!--  <td width="200px">性别：
            	<select name="gender" >
            		<option value="">全部(单选)</option>
					<c:forEach items="${gender}" var="sex">
						<option value="${sex}">${sex.name}</option>
					</c:forEach>
				</select>
			</td> -->
            <td width="250px">检索时间：<input type="text" name="beginCreateTime" style="width: 150px" class="sang_Calender"/><script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/datetime.js"></script></td>
            <td align="center" width="35px">至</td>
            <td align="left"><input type="text" name="endCreateTime" style="width: 150px" class="sang_Calender"/><script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/datetime.js"></script></td>
            <td>&nbsp;&nbsp;<input  type="submit" value="查询" style="width:50px"/></td>
            </p:power>
           	<p:power target="users:insert">
          	<td>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/system/users/insert"><input  type="button" value="添加" style="width:50px"/></a></td>
          	</p:power> 
          </tr>
        </table>

	</form>
	<hr/>
	<table border="1"  class="td" width="1200px" style="font-size: 8px;">
		<tr style="width: 1178px">
			<td>序号</td>
			<td>用户名</td>
			<td>密码</td>
			<td>昵称</td>
			<td>归属角色</td>
			<td>性别</td>
			<td>年龄</td>
			<td>注册时间</td>
			<td>登录时间</td>
			<td>IP</td>
			<td>管理</td>
		</tr>
		<c:forEach items="${users}" var="u" >
		<tr>
			<td>${u.id}</td>
			<td>${u.username}</td>
			<td>${u.password}</td>
			<td>${u.nickname}</td>
			<td class="roleclass">
				<c:forEach items="${userRole}" var="ru">
				<c:if test="${ru.userId eq u.id}">
					${ru.roles}
				</c:if>
				</c:forEach>
			</td>
			<td>${u.gender.name}</td>
			<td>${u.age}</td>
			<td><fmt:formatDate value="${u.createTime}" pattern="yyyy-MM-dd HH:mm" type="date" /></td>
			<td><fmt:formatDate value="${u.loginTime}" pattern="yyyy-MM-dd HH:mm" type="date" /></td>
			<td>${u.ip}</td>
			<td>
				<p:power target="users:update">
					<a href="${pageContext.request.contextPath}/system/users/update/${u.id}"><i></i>编辑</a>
				</p:power>
				<p:power target="users:delete">
					<a href="${pageContext.request.contextPath}/system/users/delete/${u.id}" class="deleteuser"><i></i>删除</a>
				</p:power>
				<!-- hidden -->
				<input type="hidden" value="${u.username}"/>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
<%@ include file="/WEB-INF/include/page.jsp" %>