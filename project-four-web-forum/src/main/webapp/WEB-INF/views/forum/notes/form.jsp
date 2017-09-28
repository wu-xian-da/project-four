<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增|编辑</title>
<style type="text/css">
	#ueditor{width: 1200px;}
</style>
</head>
<body>
	<h2>${empty forumnotes.id ? "新增" : "编辑" }文章</h2><hr/>
	<form method="post" onsubmit="return validator(this)">
	<input type="hidden" name="id" value="${forumnotes.id }">
	<table border="1">
		<tr>
			<td width= "100px;">文章标题：</td><td width= "550px;"><input type="text" name="theme" value="${forumnotes.theme}" style="width: 500px;height: 20px"></td>
			<td width= "100px;">归属模块：</td>
			<td width= "550px;">
				<select name="parentmodules" id="parentmodules" style="width: 85px;height: 27px">
					<option value="0">--请选择--</option>
					<c:forEach items="${modulesall}" var="m">
					<c:if test="${m.parentId == 0}">
					<option value="${m.id}" <c:if test="${forumnotes.parentmodules eq m.id}">selected="selected"</c:if>>${m.name}</option>
					</c:if>
					</c:forEach>
				</select>
				<select name="childsmodules" id="childsmodules" style="width: 85px;height: 27px">
					<!-- <option value="0">--请选择--</option> -->
					<c:forEach items="${modulesall}" var="mc">
					<c:if test="${mc.id == forumnotes.childsmodules}">
					<option value="${forumnotes.childsmodules}">${mc.name}</option>
					</c:if>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td width= "100px;">文章内容：</td>
			<td colspan="3" width= "1200px;">
				<textarea id="editor" name="content">${forumnotes.content}</textarea>
				
				<input type="hidden" name="membersId" value="${membersId}">
			</td>
		</tr>
		<tr>
			<td><button type="submit">${empty forumnotes.id ? "新增" : "编辑"}</button></td>
			<td colspan="3"><button type="button" onclick="javascript:history.back();">返回</button></td>
		</tr>
	</table>
	</form>
</body>

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/STATIC/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/STATIC/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/STATIC/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript">
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	var ue = UE.getEditor('editor');
	
</script>
<script language="javascript">
	$(function(){
		$("#parentmodules").change(function(){
			$("#childsmodules").find("option").remove();
			$("#childsmodules").append("<option value='0'>--请选择--</option>")
			// 拿到父模块的id
			var id = $(this).children('option:selected').val();
			if(id != 0){
				$.ajax({
					type:"get",
					url:"${pageContext.request.contextPath}/forum/notes/modules/"+id,
					success:function(data){
						$("#childsmodules").empty();
						if(data != ""){
							var array = data.split("-");
							for(var i=0;i<array.length;i++){
								var arrays =array[i].split(",");
								$("#childsmodules").append("<option value='"+arrays[0]+"'>"+arrays[1]+"</option>")
							}
						} else {
							alert("该部门下暂时没有任何职位")
						}
					}
				})
			}else{
				alert("请选择父模块");
			}
		})
	});
</script>
</html>