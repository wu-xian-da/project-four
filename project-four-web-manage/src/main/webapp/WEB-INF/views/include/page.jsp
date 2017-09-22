<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Validate_sys.js"></script>
<table width="1200px;" style="font-size: 8px;" class="td">
	<tr>
	<td align="left">共${totalRecord}条数据|每页面记录${page.pageSize}条数据</td>
	<!-- 首页 -->
	<td width="35px;"><a href="${pageContext.request.contextPath}/system/users?pn=0&ps=${page.pageSize}&roleId=<%=roleid%>">首页</a></td>
	<!-- 上一页 -->
	<td width="50px;">
	<a id="shangyiye" href="${pageContext.request.contextPath}/system/users?pn=${bianPageShang}${jspurl}&ps=${page.pageSize}&roleId=<%=roleid%>">上一页
	<input id="pagePnShang" type="hidden" name="pn" value="${bianPageShang}"/>
	</a>
	</td>
	<!-- 页面的页数数字 -->
	<td align="center">
		<c:if test="${pageNo > 0}">
		<c:forEach begin="0" end="${pageNo-1}" step="1" var="pageIndex">
			<a <c:if test="${0 == pageIndex}">class="active"</c:if>
			href="${pageContext.request.contextPath}/system/users?pn=${pageIndex}&ps=${page.pageSize}&roleId=<%=roleid%>">${pageIndex+1}</a>
		</c:forEach>	
		</c:if>
	</td>
	<!-- 下一页 -->
	<td width="50px;">
	<a id="xiayiye" href="${pageContext.request.contextPath}/system/users?pn=${bianPageXia}${jspurl}&ps=${page.pageSize}&roleId=<%=roleid%>">
	<input id="pagePnXia" type="hidden" name="pn" value="${bianPageXia}"/>
	<input id="totalPage" type="hidden" name="pn" value="${pageNo}"/>下一页</a>
	</td>
	<!-- 末页 -->
	<td width="35px;"><a href="${pageContext.request.contextPath}/system/users?pn=${pageNo-1}&ps=${page.pageSize}&roleId=<%=roleid%>">末页</a></td>
	</tr>
</table>
	
<script type="text/javascript">
	//页面跳转
	$(function(){
		$("#page_ps_select").change(function(){
			window.location.href = '${pageContext.request.contextPath}/system/users?ps='+$(this).val();
		});
	});
</script>
