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
	<h2>${empty entitymodules.id ? "新增" : "编辑" }模块</h2><hr/>
	<form method="post">
	<input type="hidden" id="entitymodulesId" name="id" value="${entitymodules.id}">
	<table border="1">
		<tr><td>模块名称:</td><td><input type="text" name="name" value="${entitymodules.name}"/></td></tr>
		<tr>
			<td valign="top">模块描述:</td>
			<td><textarea id="ueditor" name="content" style="width: 1080px;height: 360px">${entitymodules.content}</textarea></td>
		</tr>
		<tr>
			<td>模块归属:</td>
			<td>
				<c:forEach items="${modulesalllist}" var="m">
				<c:set value="0" var="parent"></c:set>	
					<c:if test="${m.parentId == 0}">
					<c:if test="${m.id != entitymodules.id}">
					<input class="updatemodules" type="radio" name="parentId" value="${m.id}" 
					<c:if test="${m.id == entitymodules.parentId}">checked="checked"</c:if>/>${m.name}
					</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${parent == 0}">
				<input type="radio" name="parentId" value="0" 
				<c:if test="${0 == entitymodules.parentId}">checked="checked"</c:if>/>父模块
				</c:if>
			</td>
		</tr>
		<tr class="tr1">
			<td>
			<c:if test="${empty entitymodules.id}">
			<button type="submit">新增</button>
			</c:if>
			<c:if test="${!empty entitymodules.id}">
			<button type="submit">编辑</button>
			</c:if>
			</td>
			<td><button type="button" onclick="javascript:history.back();">返回</button></td>
		</tr>
	</table>
	</form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ueditor/zh-cn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript">
    UE.getEditor('ueditor');
</script>
<script language="javascript">
$(function(){
	$(".updatemodules").click(function(){
		//var id = $(this).next(":hidden").val();
		var id = $("#entitymodulesId").val();
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/forum/modules/selectmodulesById/"+id,
			success:function(data){
				if(data == 1){
					alert("该模块下有子模块,不可修改");
					$("input[type='radio']").removeAttr('checked');
				}else {
					return true;
				}
				return false;
			}
		})
	});
});
</script>
</html>