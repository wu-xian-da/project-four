<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/vlidate.js"></script>
<table width="100%" style="font-size: 8px;" class="td">
	<tr>
	<td align="left">共${totalRecord}条数据|每页面记录${page.pageSize}条数据</td>
	<!-- 首页 -->
	<td width="35px;"><a href="?pn=0&ps=${page.pageSize}">首页</a></td>
	<!-- 上一页 -->
	<td width="50px;">
	<a id="shangyiye" href="?pn=${bianPageShang}${jspurl}&ps=${page.pageSize}">上一页
	<input id="pagePnShang" type="hidden" name="pn" value="${bianPageShang}"/>
	</a>
	</td>
	<!-- 页面的页数数字 -->
	<td align="center">
		<%-- <c:if test="${pageNo > 0}">
		<c:forEach begin="0" end="${pageNo-1}" step="1" var="pageIndex">
			<a <c:if test="${0 == pageIndex}">class="active"</c:if>
			href="?pn=${pageIndex}&ps=${page.pageSize}">${pageIndex+1}</a>
		</c:forEach>	
		</c:if> --%>
		<c:choose>
			<c:when test="${pageNo < 9}">
				<c:set value="1" var="begin"></c:set>
				<c:set value="${pageNo}" var="end"></c:set>
			</c:when>
			<c:otherwise>
				<c:if test="${param.pn - 7 <= 0 }">  
		          <c:set var="begin" value="1"/>  
		          <c:set var="end" value="8"/>  
		        </c:if>  
		        <c:if test="${param.pn - 7 > 0 }">  
		          <c:set var="begin" value="${param.pn - 6}"/>  
		          <c:set var="end" value="${param.pn + 1}"/>  
		        </c:if>
			</c:otherwise>
		</c:choose>
		<c:if test="${7 < param.pn}">  
      		<span>...</span>  
    	</c:if>
		<c:forEach begin="${begin}" end="${end}" var="i">
			<c:choose>
				<c:when test="${i eq pn}">
					<span>${i}</span>
				</c:when>
				<c:otherwise>
					<a <c:if test="${0 == i}">class="active"</c:if>
					href="?pn=${i-1}&ps=${page.pageSize}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${end < pageNo}">  
      		<span>...</span>  
    	</c:if>
	</td>
	<!-- 下一页 -->
	<td width="50px;">
	<a id="xiayiye" href="?pn=${bianPageXia}${jspurl}&ps=${page.pageSize}">
	<input id="pagePnXia" type="hidden" name="pn" value="${bianPageXia}"/>
	<input id="totalPage" type="hidden" name="pn" value="${pageNo}"/>下一页</a>
	</td>
	<!-- 末页 -->
	<td width="35px;"><a href="?pn=${pageNo-1}&ps=${page.pageSize}">末页</a></td>
	
	<td width="180px">
		共${pageNo}页 | 跳转
		<input type="text" id="pageCode" style="width: 30px;"/> 页
		<a href="javascript:_go();" ><button style="font-size: 8px;">确定</button></a>
	</td>
	</tr>
</table>
<script type="text/javascript">
		function _go() {  
	        var pn = $("#pageCode").val() - 1;//获取文本框中的当前页码  
	        var endPage = $("#totalPage").val() - 1;
	        if(!/^[1-9]\d*$/.test(pn)) {//对当前页码进行整数校验  
	            alert('请输入正确的页码!');  
	            document.getElementById("pageCode").value="";//消除text里的数据
	            return;  
	        }  
	        if(parseInt(pn) > parseInt(endPage)) {//判断当前页码是否大于最大页  
	            alert('请输入正确的页码!');
	            document.getElementById("pageCode").value="";
	            return;  
	        }  
	        location = "?pn=" + pn;  
	    }
    
</script>
