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
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Validate_sys.js"></script>
<script type="text/javascript">
	//页面跳转
	$(function(){
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
<%@ include file="/WEB-INF/include/page.jsp" %>