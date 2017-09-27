<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
String roleid = request.getParameter("roleid");//用request得到 
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>left</title>
<style type="text/css">
	.leftsidebar_box dt{
		text-align: center;
		font-size: 25px;
	}
	#line{
		text-align: center;
		font-size: 25px;
	}
</style>

</head>

<body>

<div class="container">
	
	<div class="leftsidebar_box">
		<div class="line"></div>
		<c:forEach items="${tmbname}" var="tn">
			<c:if test="${tn.roleTMB.type eq 'TITLE'}">
			<dl>
				<c:set value="${tn.roleTMB.parenthref}" var="parent"></c:set>
				<dt>${tn.roleTMB.name}</dt>
				<c:forEach items="${tmbname}" var="mn">
					<c:if test="${mn.roleTMB.type eq 'MENU'}">
					<c:if test="${mn.roleTMB.parenthref eq parent}">
						<dd>
						<a href="http://localhost:8080${mn.roleTMB.childshref}?roleId=<%=roleid%>" target="mainFrame">
						${mn.roleTMB.name}</a>
						</dd>
					</c:if>
					</c:if>
				
				</c:forEach>
			</dl>
			</c:if>
		</c:forEach>
		<div id="line"><a href="${pageContext.request.contextPath}/system/users/logout" target="_parent">退出</a></div>
	</div>
	
</div>

<script src="http://localhost:8080/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".leftsidebar_box dd").hide();
	$(".leftsidebar_box dt").click(function(){
		$(this).parent().find('dd').removeClass("menu_chioce");
		$(".menu_chioce").slideUp(); 
		$(this).parent().find('dd').slideToggle();
		$(this).parent().find('dd').addClass("menu_chioce");
	});
})
</script>
</body>
</html>
