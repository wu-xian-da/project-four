<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/member/members">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td width="100px">条件检索</td>
            <td width="250px">账号：<input type="text" name="account" style="width: 150px"/></td>
            <td width="250px">姓名：<input type="text" name="username" style="width: 150px"/></td>
            <td align="right"><input  type="submit" value="查询" style="width:50px"/>&nbsp;&nbsp;</td>
          </tr>
        </table>

	</form>
	<hr>
	<table width="100%" border="1" style="font-size: 8px;">
		<tr align="center">
			<td width="50px">序号</td>
			<td>账号</td>
			<td>状态</td>
			<td>姓名</td>
			<td>邮箱</td>
			<td width="40px">性别</td>
			<td width="40px">年龄</td>
			<td width="100px">生日</td>
			<td>住址</td>
			<td width="100px">操作管理</td>
		</tr>
		<c:forEach items="${allmembers}" var="m">
			<tr align="center">
			<td>${m.id}</td>
			<td>${m.account}</td>
			<td>${m.status.name}</td>
			<td>${m.username}</td>
			<td>${m.email}</td>
			<td>${m.gender.name}</td>
			<td>${m.age}</td>
			<td>${m.birthday}</td>
			<td>${m.address}</td>
			<td>
				<c:if test="${m.status eq 'JY'}">
				<a href="${pageContext.request.contextPath}/member/members/changestatusQY/${m.id}">启用</a>
				</c:if>
				<c:if test="${m.status eq 'QY'}">
				<a href="${pageContext.request.contextPath}/member/members/changestatusJY/${m.id}">禁用</a>
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<table width="1200px;" style="font-size: 8px;" class="td">
		<tr>
		<td align="left">共${totalRecord}条数据|每页面记录${page.pageSize}条数据</td>
		<!-- 首页 -->
		<td width="35px;"><a href="${pageContext.request.contextPath}/member/members?pn=0&ps=${page.pageSize}">首页</a></td>
		<!-- 上一页 -->
		<td width="50px;">
		<a id="shangyiye" href="${pageContext.request.contextPath}/member/members?pn=${bianPageShang}${jspurl}&ps=${page.pageSize}">上一页
		<input id="pagePnShang" type="hidden" name="pn" value="${bianPageShang}"/>
		</a>
		</td>
		<!-- 页面的页数数字 -->
		<td align="center">
			<c:if test="${pageNo > 0}">
			<c:forEach begin="0" end="${pageNo-1}" step="1" var="pageIndex">
				<a <c:if test="${0 == pageIndex}">class="active"</c:if>
				href="${pageContext.request.contextPath}/member/members?pn=${pageIndex}&ps=${page.pageSize}">${pageIndex+1}</a>
			</c:forEach>	
			</c:if>
		</td>
		<!-- 下一页 -->
		<td width="50px;">
		<a id="xiayiye" href="${pageContext.request.contextPath}/member/members?pn=${bianPageXia}${jspurl}&ps=${page.pageSize}">
		<input id="pagePnXia" type="hidden" name="pn" value="${bianPageXia}"/>
		<input id="totalPage" type="hidden" name="pn" value="${pageNo}"/>下一页</a>
		</td>
		<!-- 末页 -->
		<td width="35px;"><a href="${pageContext.request.contextPath}/member/members?pn=${pageNo-1}&ps=${page.pageSize}">末页</a></td>
		</tr>
	</table>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Validate_sys.js"></script>
<script type="text/javascript">
	//页面跳转
	$(function(){
		$("#page_ps_select").change(function(){
			window.location.href = '${pageContext.request.contextPath}/member/members?ps='+$(this).val();
		});
	});
</script>
</html>