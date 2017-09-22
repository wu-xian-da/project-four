<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>论坛内容</title>
</head>
<body>
	<%-- <table border="" cellspacing="0" width="100%">
		<c:forEach items="${notes}" var="n">
		<tr align="center">
		<td width="50px">${n.id}</td>
		<td align="left"><a href="http://localhost:8888/forum/notes/selectnotes/${n.id}">${n.theme}</a></td>
		<td width="150px"><fmt:formatDate value="${n.releasetime}" pattern="yyyy-MM-dd HH:mm" type="date" /></td>
		</tr>
		</c:forEach>
	</table> --%>
	<table width="100%" style="font-size: 8px;" border="1">
		<tr  align="center">
		<td width="50px">序号</td>
		<td>标题</td>
		<td>作者</td>
		<td width="200px">归属模块</td>
		<td width="150px">发布时间</td>
		</tr>
		<c:forEach items="${notesbymembersId}" var="an">
		<tr>
		<td align="center">${an.id}</td>
		<td><a href="http://localhost:8888/forum/notes/selectnotes/${an.id}">${an.theme}</a></td>
		<td align="center">
			<c:forEach items="${allmembers}" var="memb">
					<c:if test="${memb.id == an.membersId}">${memb.username}</c:if>
			</c:forEach>
		</td>
		<td>
			<c:forEach items="${allmodules}" var="modu">
				<c:if test="${modu.id == an.parentmodules}">${modu.name} --</c:if>
				<c:if test="${modu.id == an.childsmodules}">${modu.name}</c:if>
			</c:forEach>
		</td>
		<td align="center"><fmt:formatDate value="${an.releasetime}" pattern="yyyy-MM-dd HH:mm" type="date"/></td>
		</tr>
		</c:forEach>
	</table>
	<table width="100%;" style="font-size: 8px;" class="td">
		<tr>
		<td align="left">共${totalRecord}条数据|每页面记录${page.pageSize}条数据</td>
		<!-- 首页 -->
		<td width="35px;"><a href="${pageContext.request.contextPath}/forum/notes/memForumlist/${membersId}?pn=0&ps=${page.pageSize}">首页</a></td>
		<!-- 上一页 -->
		<td width="50px;">
		<a id="shangyiye" href="${pageContext.request.contextPath}/forum/notes/memForumlist/${membersId}?pn=${bianPageShang}${jspurl}&ps=${page.pageSize}">上一页
		<input id="pagePnShang" type="hidden" name="pn" value="${bianPageShang}"/>
		</a>
		</td>
		<!-- 页面的页数数字 -->
		<td align="center">
			<c:if test="${pageNo > 0}">
			<c:forEach begin="0" end="${pageNo-1}" step="1" var="pageIndex">
				<a <c:if test="${0 == pageIndex}">class="active"</c:if>
				href="${pageContext.request.contextPath}/forum/notes/memForumlist/${membersId}?pn=${pageIndex}&ps=${page.pageSize}">${pageIndex+1}</a>
			</c:forEach>	
			</c:if>
		</td>
		<!-- 下一页 -->
		<td width="50px;">
		<a id="xiayiye" href="${pageContext.request.contextPath}/forum/notes/memForumlist/${membersId}?pn=${bianPageXia}${jspurl}&ps=${page.pageSize}">
		<input id="pagePnXia" type="hidden" name="pn" value="${bianPageXia}"/>
		<input id="totalPage" type="hidden" name="pn" value="${pageNo}"/>下一页</a>
		</td>
		<!-- 末页 -->
		<td width="35px;"><a href="${pageContext.request.contextPath}/forum/notes/memForumlist/${membersId}?pn=${pageNo-1}&ps=${page.pageSize}">末页</a></td>
		</tr>
	</table>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/vlidate.js"></script>
<script type="text/javascript">
	//页面跳转
	$(function(){
		$("#page_ps_select").change(function(){
			window.location.href = '${pageContext.request.contextPath}/forum/notes/memForumlist/${membersId}?ps='+$(this).val();
		});
	});
</script>
</body>
</html>