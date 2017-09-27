<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>top</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
	table,table td,table th{border-collapse:collapse;font-size: 25px;}
</style>
</head>
<body>
	<%-- <table width="100%" height="80px" cellspacing="0" cellpadding="5">  
        <tr>  
            <td  rowspan="2"><img src="">个人图片</td>  
            <td>账号:${members.account}</td>  
            <td>邮箱:${members.email}</td>  
        </tr>  
        <tr>  
            <td></td>  
            <td></td>  
        </tr>   
    </table>   --%>
	<table width="100%">
		<tr height="58px"></tr>
		<tr>
		<td>
		<a href="${pageContext.request.contextPath}/forum/notes/${members.id}" target="mainFramemember">我的帖子</a>
		</td>
		<td>
		<a href="${pageContext.request.contextPath}/member/members/${members.id}" target="mainFramemember">我的资料</a>
		</td>
		<!-- <td><a href="#" target="mainFramemember">我的评论</a></td>
		<td><a href="#" target="mainFramemember">我的动态</a></td> -->
		<td>
		<a href="${pageContext.request.contextPath}/forum/notes/insert" target="mainFramemember">发帖</a>
		</td>
		<td align="right">
		<a href="${pageContext.request.contextPath}/member/members/logout" target="_parent" id="logout">退出</a>
		</td>
		</tr>
	</table>
</body>
</html>

