<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="100%" border="1" style="font-size: 8px;" class="td">
		<tr align="center">
			<td width="50px">序号</td>
			<td>标题</td>
			<td width="150px">所属模块</td>
			<td width="100px">状态</td>
			<td width="150px">发布时间</td>
			<td width="100px">操作管理</td>
		</tr>
		<c:forEach items="${membersallnotes}" var="man">
		<tr>
		<td align="center">${man.id}</td>
		<td>${man.theme}</td>
		<td>
			<c:forEach	items="${modulesall}" var="m">
				<c:if test="${m.id == man.parentmodules}">${m.name}--</c:if>
				<c:if test="${man.childsmodules == m.id}">${m.name}</c:if>
			</c:forEach>
		</td>
		<td align="center">${man.status.name}</td>
		<td align="center"><fmt:formatDate value="${man.releasetime}" pattern="yyyy-MM-dd HH:mm" type="date"/></td>
		<td align="center">
		<a href="${pageContext.request.contextPath}/forum/notes/update/${man.id}">编辑</a> |
		<a href="${pageContext.request.contextPath}/forum/notes/delete/${man.id}" class="deletenotes">删除</a>
		<input type="hidden" value="${man.theme}">|
		<a href="${pageContext.request.contextPath}/forum/notes/selectnotes/${man.id}">预览</a>
		</td>
		</tr>
		</c:forEach>
	</table>
	<table width="100%;" style="font-size: 8px;" class="td">
		<tr>
		<td align="left">共${totalRecord}条数据|每页面记录${page.pageSize}条数据</td>
		<!-- 首页 -->
		<td width="35px;"><a href="${pageContext.request.contextPath}/forum/notes/${membersId}?pn=0&ps=${page.pageSize}">首页</a></td>
		<!-- 上一页 -->
		<td width="50px;">
		<a id="shangyiye" href="${pageContext.request.contextPath}/forum/notes/${membersId}?pn=${bianPageShang}${jspurl}&ps=${page.pageSize}">上一页
		<input id="pagePnShang" type="hidden" name="pn" value="${bianPageShang}"/>
		</a>
		</td>
		<!-- 页面的页数数字 -->
		<td align="center">
			<c:if test="${pageNo > 0}">
			<c:forEach begin="0" end="${pageNo-1}" step="1" var="pageIndex">
				<a <c:if test="${0 == pageIndex}">class="active"</c:if>
				href="${pageContext.request.contextPath}/forum/notes/${membersId}?pn=${pageIndex}&ps=${page.pageSize}">${pageIndex+1}</a>
			</c:forEach>	
			</c:if>
		</td>
		<!-- 下一页 -->
		<td width="50px;">
		<a id="xiayiye" href="${pageContext.request.contextPath}/forum/notes/${membersId}?pn=${bianPageXia}${jspurl}&ps=${page.pageSize}">
		<input id="pagePnXia" type="hidden" name="pn" value="${bianPageXia}"/>
		<input id="totalPage" type="hidden" name="pn" value="${pageNo}"/>下一页</a>
		</td>
		<!-- 末页 -->
		<td width="35px;"><a href="${pageContext.request.contextPath}/forum/notes/${membersId}?pn=${pageNo-1}&ps=${page.pageSize}">末页</a></td>
		</tr>
	</table>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/vlidate.js"></script>
<script type="text/javascript">
	//页面跳转
	$(function(){
		$("#page_ps_select").change(function(){
			window.location.href = '${pageContext.request.contextPath}/forum/notes/${membersId}?ps='+$(this).val();
		});
		
		$(".deletenotes").click(function(){
			var name =  $(this).next(":hidden").val();
			var flag = confirm("确定删除文章-"+name);
			if (flag) {
				return true;
			}
			return false;
		});
	});
</script>
</html>