<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/FormValid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Validate_sys.js"></script>
<title>用户</title>
<style type="text/css">
	.td1{
		width: 50px;
	}
	.tr1{
		height: 50px;
	}
</style>
</head>
<body>
	<div>
		<h2>${empty users.id ? "新增" : "编辑" }用户</h2><hr/>
		<form method="post" onsubmit="return validator(this)">
		<input type="hidden" name="id" value="${users.id }">
		<table width="1100px">
			<tr class="tr1"><td class="td1">姓名：</td><td><input id="usernamevalid" type="text" name="username" value="${users.username}" maxlength="10" valid="required"  errmsg="姓名不能为空!" placeholder="姓名"><span id="errusername"></span></td></tr>
			<tr class="tr1"><td class="td1">密码：</td><td><input id="passwordvalid" type="password" name="password" value="${users.password}" maxlength="10" valid="required"  errmsg="密码不能为空!" placeholder="密码"><span id="errpassword1"></span><span id="errpassword2"></span></td></tr>
			<tr class="tr1"><td class="td1">昵称：</td><td><input id="nicknamevalid" type="text" name="nickname" value="${users.nickname}" maxlength="10" valid="required"  errmsg="昵称不能为空!" placeholder="昵称"><span id="errnickname"></span></td></tr>
			<tr class="tr1"><td class="td1">性别：</td>
				<td>
				<c:forEach items="${gender}" var="gender">
					<c:choose>
						<c:when test="${empty users.id}">
							<input type="radio" name="gender" value="${gender}" <c:if test="${'NAN' eq gender}">checked="checked"</c:if>/>${gender.name}	
						</c:when>
						<c:otherwise>
							<input type="radio" name="gender" value="${gender}" <c:if test="${users.gender eq gender}">checked="checked"</c:if>/>${gender.name}
						</c:otherwise>
					</c:choose>
				</c:forEach>
				</td>
			</tr>
			<tr class="tr1"><td class="td1">年龄：</td><td><input id="useragevalid" type="text" name="age" value="${users.age}" maxlength="10" valid="required"  errmsg="年龄不能为空!" placeholder="年龄"><span id="errage1"></span><span id="errage2"></span></td></tr>
			<tr class="tr1"><td class="td1">角色：</td>
				<td>
				
					<c:choose>
						<c:when test="${empty users.id}">
						<c:forEach items="${roles}" var="r">
							<input type="radio" name="roleIds" value="${r.id}" />${r.rolename}
						</c:forEach>
						</c:when>
						
						<c:otherwise>
						<c:forEach items="${roles}" var="r">
						<c:set value="0" var="bian"></c:set>
						<c:forEach items="${userRole}" var="ur">
						<c:if test="${users.id eq ur.userId}">
						<c:if test="${ur.roleId eq r.id}">
						<c:set value="1" var="bian"></c:set>
						</c:if>
						</c:if>
						</c:forEach>
						<c:if test="${bian == '0'}">
							<input type="radio" name="roleIds" value="${r.id}"/>${r.rolename}
						</c:if>
						<c:if test="${bian == '1'}">
							<input type="radio" name="roleIds" value="${r.id}" checked="checked"/>${r.rolename}
						</c:if>
						</c:forEach>	
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr class="tr1">
				<td><button type="submit" id="usersubmit">${empty users.id ? "新增" : "编辑"}</button></td>
				<td><button type="button" onclick="javascript:history.back();">返回</button></td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>