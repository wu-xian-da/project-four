<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/FormValid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Validate_sys.js"></script>
<style type="text/css">
	.td1{
		width: 80px;text-align: right;
	}
	.tr1{
		height: 50px;
	}
	table{  
     border-collapse: collapse;  
     border: none;  
	} 
</style>
</head>
<body>
<div>
	<h2>${empty roles.id ? "新增" : "编辑" }角色</h2><hr/>
	<form method="post" onsubmit="return validator(this)" id="role_form">
	<input type="hidden" name="id" value="${roles.id}"/>
	<table>
		<tr class="tr1"><td class="td1">角色名称：</td><td><input id="rolenamevalid" type="text" name="rolename" value="${roles.rolename}" maxlength="10" valid="required"  errmsg="角色名称不能为空!" placeholder="角色名称"><span id="errrolename"></span></td></tr>
		<tr class="tr1"><td class="td1">角色描述：</td><td><input type="text" name="counts" value="${roles.counts}" valid="required"  errmsg="角色描述不能为空!" placeholder="角色描述"></td></tr>
		<tr class="tr1"><td class="td1" valign="top">授权：</td>
			<td>
			<table>
			<c:choose>
				
				<c:when test="${empty roles.id}"><!-- 当添加权限时 -->
					<!-- 一级 -->
					<c:forEach items="${title}" var="t">
						<c:if test="${t.type == 'TITLE'}">
						<c:set value="${t.parenthref}" var="thref"></c:set>
							<tr><td>
							<input data-d="${t.id}" type="checkbox" name="menubutton" value="${t.id}">${t.name}</td>
							</tr>
						</c:if>
						<!-- 二级 -->
						<c:forEach items="${menu}" var="m">
							<c:if test="${thref == m.parenthref}">
								<c:if test="${m.type == 'MENU'}">
								<c:set value="${m.childshref}" var="mhref"></c:set>
									<tr>
									<td width="150px;">&nbsp;&nbsp;&nbsp;&nbsp;
									<input data-p="${t.id}" type="checkbox" name="menubutton" value="${m.id}">${m.name}
									</td>
									</tr>
								</c:if>
								<tr>
								<!-- 三级 -->
								<c:forEach items="${button}" var="b">
									<c:if test="${b.type == 'BUTTON'}">
										<c:if test="${mhref eq b.parenthref}">
											<td width="150px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input data-p="${t.id}" data-c="${m.id}" type="checkbox" name="menubutton" value="${b.id}">${b.name}
											</td>
										</c:if>
									</c:if>
								</c:forEach>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</c:when>
				
				<c:otherwise><!-- 当编辑权限时 -->
					<!-- 一级 -->
					<c:forEach items="${title}" var="t">
						<c:if test="${t.type == 'TITLE'}">
							<c:set value="${t.parenthref}" var="tmhref"></c:set>
							<c:set value="0" var="bian"></c:set>
							<tr><td>
							<!-- 角色与权限关联 -->
							<c:forEach items="${menubutton}" var="titleId">
								<c:if test="${titleId.menusId eq t.id}">
								<c:set value="1" var="bian"></c:set>
								</c:if>
							</c:forEach>
							
							<c:if test="${bian == '0'}">
								<input type="checkbox" name="menubutton" value="${t.id}">${t.name}
							</c:if>
							<c:if test="${bian == '1'}">
								<input type="checkbox" name="menubutton" value="${t.id}" checked="checked">${t.name}
							</c:if>
							
							</td>
							</tr>
						</c:if>
						<!-- 二级 -->
						<c:forEach items="${menu}" var="m">
						<c:if test="${tmhref == m.parenthref}">
							<c:set value="2" var="bian"></c:set>
							<!-- 确保权限不重复 -->
							<c:if test="${m.type == 'MENU'}">
							<c:set value="${m.childshref}" var="mbhref"></c:set>
								<!-- 角色与权限关联 -->
								<c:forEach items="${menubutton}" var="menuId">
									<c:if test="${menuId.menusId eq m.id}">
										<c:set value="3" var="bian"></c:set>
									</c:if>
								</c:forEach>
								<tr>
								<td width="150px;">&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${bian == '2'}">
									<input data-p="${t.id}" type="checkbox" name="menubutton" value="${m.id}">${m.name}
								</c:if>
								<c:if test="${bian == '3'}">
									<input data-p="${t.id}" type="checkbox" name="menubutton" value="${m.id}" checked="checked">${m.name}
								</c:if>
								</td>
								</tr>
							</c:if>
							<!-- 三级 -->
							<tr>	
							<c:forEach items="${button}" var="b">
							<c:if test="${b.type == 'BUTTON'}">
								<c:set value="4" var="bian"></c:set>
								<!-- 确保权限不重复 -->
								<c:if test="${mbhref == b.parenthref}">
									<!-- 角色与权限关联 -->
									<c:forEach items="${menubutton}" var="buttonId">
										<c:if test="${buttonId.menusId eq b.id}">
											<c:set value="5" var="bian"></c:set>
										</c:if>
									</c:forEach>
									<td width="150px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<c:if test="${bian == '4'}">
										<input data-p="${t.id}" data-c="${m.id}" type="checkbox" name="menubutton" value="${b.id}">${b.name}
									</c:if>
									<c:if test="${bian == '5'}">
										<input data-p="${t.id}" data-c="${m.id}" type="checkbox" name="menubutton" value="${b.id}" checked="checked">${b.name}
									</c:if>
									</td>
								</c:if>
							</c:if>
							</c:forEach>
							</tr>
						</c:if>
						</c:forEach>	
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</table>
			</td>
		</tr>
		<tr class="tr1">
			<td class="td1"><button id="rolesumbit" type="button" onclick="Submit();">${empty roles.id ? "新增" : "编辑"}</button></td>
			<td><button type="button" onclick="javascript:history.back();">返回</button></td>
		</tr>
	</table>
	</form>
</div>
</body>
<script type="text/javascript">
//角色选择
function Submit(){
	var checksLen = $('input[type="checkbox"]:checked').length;
	if(checksLen == 0){
		alert("-请选择授权信息");
		return;
 	}
	$("#role_form").submit();
}
$(function(){
	$("#role_form").validate({
		errorPlacement: function(error,element){
			error.appendTo(element.parent());
		}
	});
	
	$('input[type="checkbox"]').on('click',function(){
		var _statusT = $(this).prop("checked");
		
		//父级菜单节点
		var parent_t = $(this).data("t");
		if(parent_t != null && parent_t != '' && _statusP){
			$('input[value='+parent_t+']').prop("checked", true);
		}
		
		//子级菜单及按钮节点
		$('input[data-p='+$(this).val()+']').each(function(){
			var _statusMB = $(this).prop("checked");
			//alert(_statusMB)
			if(_statusT){
				if(!_statusMB){
					$(this).click();
				}
			}
			else{
				if(_statusMB){
					$(this).click();
				}
			}
		});
	
		var _statusM = $(this).prop("checked");
		
		//子级菜单节点
		var parent_m = $(this).data("m");
		if(parent_m != null && parent_m != '' && _statusP){
			$('input[value='+parent_m+']').prop("checked", true);
		}
		
		//按钮节点
		$('input[data-c='+$(this).val()+']').each(function(){
			var _statusB = $(this).prop("checked");
			//alert(_statusB)
			if(_statusM){
				if(!_statusB){
					$(this).click();
					$('input[data-d='+$(this).val()+']').prop("checked");
				}
			}
			else{
				if(_statusB){
					$(this).click();
					$('input[data-d='+$(this).val()+']').prop("checked");
				}
			}
		});
 	});
});
</script>
</html>