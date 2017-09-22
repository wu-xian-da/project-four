<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发帖</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/forum/notes">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td width="100px">条件检索</td>
            <td width="150px">标题:<input type="text" name="theme" style="width: 100px"/></td>
            <td width="300px">归属模块:
            	<select name="parentmodules" id="parentmodules" style="width: 100px">
					<option value="0">--请选择--</option>
					<c:forEach items="${allmodules}" var="m">
					<c:if test="${m.parentId == 0}">
					<option value="${m.id}">${m.name}</option>
					</c:if>
					</c:forEach>
				</select>
				<select name="childsmodules" id="childsmodules" style="width: 100px">
					<option value="0">--请选择--</option>
				</select>
			</td>
            <td width="150px">作者:
				<select name="membersId" style="width: 100px">
					<option value="0">--请选择--</option>
					<c:forEach items="${allmembers}" var="m">
					<option value="${m.id}">${m.username}</option>
					</c:forEach>
				</select>
			</td>
            <td width="180px">检索时间:<input type="text" name="beginCreateTime" style="width: 100px" class="sang_Calender"/><script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/datetime.js"></script></td>
            <td align="left" width="20px">至</td>
            <td align="left"><input type="text" name="endCreateTime" style="width: 100px" class="sang_Calender"/><script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/datetime.js"></script></td>
            <td align="right"><input  type="submit" value="查询" style="width:50px"/>&nbsp;&nbsp;</td>
          </tr>
        </table>

	</form>
	<hr>
	<table width="100%" border="1" style="font-size: 8px;">
		<tr align="center">
			<td width="50px">序号</td>
			<td>标题</td>
			<td>归属模块</td>
			<td>作者</td>
			<td width="60px">状态</td>
			<td width="120px">发布时间</td>
			<td width="100px">操作管理</td>
		</tr>
		<c:forEach items="${allnotes}" var="n">
			<tr align="center">
			<td>${n.id}</td>
			<td><a href="${pageContext.request.contextPath}/forum/notes/selectnotes/${n.id}">${n.theme}</a></td>
			<td>
				<c:forEach items="${allmodules}" var="modu">
					<c:if test="${modu.id == n.parentmodules}">${modu.name}--</c:if>
					<c:if test="${modu.id == n.childsmodules}">${modu.name}</c:if>
				</c:forEach>
			</td>
			<td>
				<c:forEach items="${allmembers}" var="memb">
					<c:if test="${memb.id == n.membersId}">${memb.username}</c:if>
				</c:forEach>
			</td>
			<td>${n.status.name}</td>
			<td><fmt:formatDate value="${n.releasetime}" pattern="yyyy-MM-dd HH:mm" type="date"/></td>
			<td>
				<c:if test="${n.status eq 'YFB'}">
				<a href="${pageContext.request.contextPath}/forum/notes/changestatusWFB/${n.id}">下刊</a>
				</c:if>
				<c:if test="${n.status eq 'WFB'}">
				<a href="${pageContext.request.contextPath}/forum/notes/changestatusYFB/${n.id}">发布</a>
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<table width="1200px;" style="font-size: 8px;" class="td">
		<tr>
		<td align="left">共${totalRecord}条数据|每页面记录${page.pageSize}条数据</td>
		<!-- 首页 -->
		<td width="35px;"><a href="${pageContext.request.contextPath}/forum/notes?pn=0&ps=${page.pageSize}">首页</a></td>
		<!-- 上一页 -->
		<td width="50px;">
		<a id="shangyiye" href="${pageContext.request.contextPath}/forum/notes?pn=${bianPageShang}${jspurl}&ps=${page.pageSize}">上一页
		<input id="pagePnShang" type="hidden" name="pn" value="${bianPageShang}"/>
		</a>
		</td>
		<!-- 页面的页数数字 -->
		<td align="center">
			<c:if test="${pageNo > 0}">
			<c:forEach begin="0" end="${pageNo-1}" step="1" var="pageIndex">
				<a <c:if test="${0 == pageIndex}">class="active"</c:if>
				href="${pageContext.request.contextPath}/forum/notes?pn=${pageIndex}&ps=${page.pageSize}">${pageIndex+1}</a>
			</c:forEach>	
			</c:if>
		</td>
		<!-- 下一页 -->
		<td width="50px;">
		<a id="xiayiye" href="${pageContext.request.contextPath}/forum/notes?pn=${bianPageXia}${jspurl}&ps=${page.pageSize}">
		<input id="pagePnXia" type="hidden" name="pn" value="${bianPageXia}"/>
		<input id="totalPage" type="hidden" name="pn" value="${pageNo}"/>下一页</a>
		</td>
		<!-- 末页 -->
		<td width="35px;"><a href="${pageContext.request.contextPath}/forum/notes?pn=${pageNo-1}&ps=${page.pageSize}">末页</a></td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	//页面跳转
	$(function(){
		$("#page_ps_select").change(function(){
			window.location.href = '${pageContext.request.contextPath}/forum/notes?ps='+$(this).val();
		});
	});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Validate_sys.js"></script>
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