<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="p" uri="http://java.sun.com/jsp/jstl/power" %>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
String roleid = request.getParameter("roleId");//用request得到 
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Validate_sys.js"></script>
<title>用户列表</title>
<style>
	.td{
		text-align: center;
	}
</style>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/log/logins?roleId=<%=roleid%>">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          <p:power target="logins:select">
          	<td width="100px">条件检索</td>
            <td width="350px">登录名：<input type="text" name="loginname" style="width: 150px"/></td>
            <td width="650px">IP：<input type="text" name="ip" style="width: 150px"/></td>
            <td>&nbsp;&nbsp;<input  type="submit" name="submit" value="查询" style="width:50px"/></td>
           </p:power>
          </tr>
        </table>
	</form>
	<hr/>
	<table border="1"  class="td" width="1200px" style="font-size: 8px;">
		<tr>
			<td width="50px">序号</td>
			<td width="100px">登录名</td>
			<td >登录日期</td>
			<td >参数</td>
			<td >IP</td>
			<td >状态</td>
		</tr>
		<c:forEach items="${logLogin}" var="l" >
		<tr>
			<td>${l.id}</td>
			<td>${l.loginname}</td>
			<td ><fmt:formatDate value="${l.date}" pattern="yyyy-MM-dd HH:mm" type="date" /></td>
			<td >${l.userAgent}</td>
			<td>${l.ip}</td>
			<td >${l.status.name}</td>
		</tr>
		</c:forEach>
	</table>
	<table width="1200px;" style="font-size: 8px;" class="td">
		<tr>
		<td align="left">共${totalRecord}条数据|每页面记录${page.pageSize}条数据</td>
		<!-- 首页 -->
		<td width="35px;"><a href="${pageContext.request.contextPath}/log/logins?pn=0&ps=${page.pageSize}&roleId=<%=roleid%>">首页</a></td>
		<!-- 上一页 -->
		<td width="50px;">
		<a id="shangyiye" href="${pageContext.request.contextPath}/log/logins?pn=${bianPageShang}${jspurl}&ps=${page.pageSize}&roleId=<%=roleid%>">上一页
		<input id="pagePnShang" type="hidden" name="pn" value="${bianPageShang}"/>
		</a>
		</td>
		<!-- 页面的页数数字 -->
		<td align="center">
			<c:if test="${pageNo > 0}">
			<c:forEach begin="0" end="${pageNo-1}" step="1" var="pageIndex">
				<a <c:if test="${0 == pageIndex}">class="active"</c:if>
				href="${pageContext.request.contextPath}/log/logins?pn=${pageIndex}&ps=${page.pageSize}&roleId=<%=roleid%>">${pageIndex+1}</a>
			</c:forEach>
			</c:if>	
		</td>
		<!-- 下一页 -->
		<td width="50px;">
		<a id="xiayiye" href="${pageContext.request.contextPath}/log/logins?pn=${bianPageXia}${jspurl}&ps=${page.pageSize}&roleId=<%=roleid%>">
		<input id="pagePnXia" type="hidden" name="pn" value="${bianPageXia}"/>
		<input id="totalPage" type="hidden" name="pn" value="${pageNo}"/>下一页</a>
		</td>
		<!-- 末页 -->
		<td width="35px;"><a href="${pageContext.request.contextPath}/log/logins?pn=${pageNo-1}&ps=${page.pageSize}&roleId=<%=roleid%>">末页</a></td>
		</tr>
	</table>

</body>
<script type="text/javascript">
	//页面跳转
	$(function(){
		$("#page_ps_select").change(function(){
			window.location.href = '${pageContext.request.contextPath}/log/logins?ps='+$(this).val();
		});
	});
</script>
</html>