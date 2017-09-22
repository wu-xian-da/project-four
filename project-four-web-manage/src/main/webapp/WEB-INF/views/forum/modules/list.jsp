<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模块</title>
</head>
<body>

	<form method="post" action="${pageContext.request.contextPath}/forum/modules">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td width="100px">条件检索</td>
            <td width="300px">模块:
            	<select name="parentId" style="width: 100px">
					<option value="0">--请选择--</option>
					<c:forEach items="${modulesalllist}" var="m">
					<c:if test="${m.parentId == 0}">
					<option value="${m.id}">${m.name}</option>
					</c:if>
					</c:forEach>
				</select>
			</td>
            <td align="right"><input  type="submit" value="查询" style="width:50px"/>&nbsp;&nbsp;</td>
            <td align="right" width="30px"><a href="${pageContext.request.contextPath}/forum/modules/insert">
            <input  type="button" value="添加" style="width:50px"/></a></td>
          </tr>
        </table>

	</form>
	<hr>
	<table width="100%" border="1" style="font-size: 8px;">
		<tr align="center">
			<td width="50px">序号</td>
			<td width="200px">模块名称</td>
			<td>描述</td>
			<td width="100px">操作管理</td>
		</tr>
		<c:forEach items="${allmodules}" var="m">
			<tr align="center">
			<td>${m.id}</td>
			<td>${m.name}</td>
			<td>${m.content}</td>
			<td>
			<a class="updatemodules" href="${pageContext.request.contextPath}/forum/modules/update/${m.id}">编辑</a>
			<!-- hidden -->
			<input type="hidden" value="${m.id}">
			<a href="${pageContext.request.contextPath}/forum/modules/delete/${m.id}" class="deletemodules">删除</a>
			<!-- hidden -->
			<input type="hidden" value="${m.name}">
			</td>
			
		</tr>
		</c:forEach>
	</table>
	<table width="1200px;" style="font-size: 8px;" class="td">
		<tr>
		<td align="left">共${totalRecord}条数据|每页面记录${page.pageSize}条数据</td>
		<!-- 首页 -->
		<td width="35px;"><a href="${pageContext.request.contextPath}/forum/modules?pn=0&ps=${page.pageSize}">首页</a></td>
		<!-- 上一页 -->
		<td width="50px;">
		<a id="shangyiye" href="${pageContext.request.contextPath}/forum/modules?pn=${bianPageShang}${jspurl}&ps=${page.pageSize}">上一页
		<input id="pagePnShang" type="hidden" name="pn" value="${bianPageShang}"/>
		</a>
		</td>
		<!-- 页面的页数数字 -->
		<td align="center">
			<c:if test="${pageNo > 0}">
			<c:forEach begin="0" end="${pageNo-1}" step="1" var="pageIndex">
				<a <c:if test="${0 == pageIndex}">class="active"</c:if>
				href="${pageContext.request.contextPath}/forum/modules?pn=${pageIndex}&ps=${page.pageSize}">${pageIndex+1}</a>
			</c:forEach>	
			</c:if>
		</td>
		<!-- 下一页 -->
		<td width="50px;">
		<a id="xiayiye" href="${pageContext.request.contextPath}/forum/modules?pn=${bianPageXia}${jspurl}&ps=${page.pageSize}">
		<input id="pagePnXia" type="hidden" name="pn" value="${bianPageXia}"/>
		<input id="totalPage" type="hidden" name="pn" value="${pageNo}"/>下一页</a>
		</td>
		<!-- 末页 -->
		<td width="35px;"><a href="${pageContext.request.contextPath}/forum/modules?pn=${pageNo-1}&ps=${page.pageSize}">末页</a></td>
		</tr>
	</table>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Validate_sys.js"></script>
<script type="text/javascript">
	//页面跳转
	$(function(){
		$("#page_ps_select").change(function(){
			window.location.href = '${pageContext.request.contextPath}/forum/modules?ps='+$(this).val();
		});
		
		$(".deletemodules").click(function(){
			var name = $(this).next(":hidden").val();
			var flag = confirm("确定删除"+name);
			if (flag) {
				return true;
			}
			return false;
		});
	});
</script>

</html>