<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/include/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增|编辑</title>
<script type="text/javascript">
	$().ready(function(){
		$("#commitForm").validate();
	});
</script>

</head>
<body>
	<form method="post" id="commitForm">
	<input type="hidden" name="id" value="${membersform.id}">
	<table border="1" cellspacing="0" cellpadding="5" align="center">
		<tr>
		<td align="center" width="150px">姓名:</td>
		<td><input type="text" name="username" value="${membersform.username}" minlength="2" required></td>
		<td rowspan="6" width="200px" align="center">
		<!-- <input type="text" id="image" name="image"/> -->
		<a href="javascript:void(0)" onclick="upImage()">
		<img id="showImage" name="uploadImage" src="${pageContext.request.contextPath}/STATIC/ueditor/dialogs/image/images/image.png"><br/>
		</a>
		<textarea id="uploadImage"></textarea>
		</td>
		</tr>
		<tr>
		<td align="center" width="150px">邮箱:</td>
		<td><input type="email" name="email" value="${membersform.email}" required></td>
		</tr>
		<tr>
		<td align="center" width="150px">性别:</td>
		<td>
			<c:forEach items="${gender}" var="gender">
				<input type="radio" name="gender" value="${gender}" <c:if test="${membersform.gender eq gender}">checked="checked"</c:if>/>${gender.name}
			</c:forEach>
		</td>
		</tr>
		<tr>
		<td align="center" width="150px">年龄:</td>
		<td><input type="text" name="age" value="${membersform.age}" minlength="2" required></td>
		</tr>
		<tr>
		<td align="center" width="150px">生日:</td>
		<td>
		
		<input type="dateISO" name="birthday" value="${membersform.birthday}" required>
		<%-- <select >
			<c:forEach begin="1980" end="2017" var="year">
				<option value="${year}">${year}</option>
			</c:forEach>
		</select>-
		<select >
			<c:forEach begin="1" end="12" var="month">
				<option value="${month}">${month}</option>
			</c:forEach>
		</select>-
		<select >
			<c:forEach begin="1" end="30" var="day">
				<option value="${day}">${day}</option>
			</c:forEach>
		</select> --%>
		</td>
		</tr>
		<tr>
		<td align="center" width="150px">地址:</td>
		<td><input type="text" name="address" value="${membersform.address}" required></td>
		</tr>
		<tr align="center">
		<td colspan="3"><button name="sumbit" id="submitForm">提交</button>
		&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
		<button type="button" onclick="javascript:history.back();" >返回</button></td>
		</tr>
	</table>
	</form>
</body>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/STATIC/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/STATIC/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/STATIC/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/STATIC/ueditor/dialogs/image/image.js"></script>
<script type="text/javascript">
	var _editor = UE.getEditor('uploadImage');
	
	_editor.ready(function(){
		_editor.setDisabled();
		_editor.hide();
		
		_editor.addListener('beforeinsertimage',function(t,arg){
			//alert(3)
			//$().attr("value",arg[0].src);
			//alert(arg[0].src)
			//$("#image").val(arg[0].src);
			$("#showImage").attr("src",arg[0].src);
		});
	});
	function upImage(){
		var myImage = _editor.getDialog("insertimage");
		myImage.open();
	};
</script>
<script type="text/javascript">
	$(function(){
		$("#submitForm").click(function(){
			var checksLen = $('input[type="radio"]:checked').length;
			if(checksLen == 0){
				alert("-请选择性别");
				return false;
		 	}
		});
	});
</script>
</html>