<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/include/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
<title>新增|编辑</title>
<style type="text/css">
	#ueditor{width: 1200px;}
</style>
<script language="javascript">
	$().ready(function(){
		$("#commitForm").validate();
	});
</script>
</head>
<body>
	<h2>${empty forumnotes.id ? "新增" : "编辑" }文章</h2><hr/>
	<form method="post" id="commitForm">
	<input type="hidden" name="id" value="${forumnotes.id }">
	<table border="1">
		<tr>
			<td width= "100px;">文章标题：</td><td width= "550px;"><input type="text" name="theme" value="${forumnotes.theme}" style="width: 500px;height: 20px" required></td>
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
					<option value="">--请选择--</option>
					<c:forEach items="${modulesall}" var="mc">
					<c:if test="${mc.id == forumnotes.childsmodules}">
					<option value="${forumnotes.childsmodules}"<c:if test="${forumnotes.childsmodules eq mc.id}">selected="selected"</c:if>>${mc.name}</option>
					</c:if>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td width= "100px;" valign="top">文章内容：</td>
			<td colspan="3" width= "1200px;">
				<textarea id="editor" name="content" required>${forumnotes.content}</textarea>
				
				<input type="hidden" name="membersId" value="${membersId}">
			</td>
		</tr>
		<tr>
			<td width= "100px;" valign="top">文章附件：</td>
			<td colspan="3" width= "1200px;">
				<!-- <input type="text" id="file" > 
				<img id="file" src="" >
				<a id="fileurl" href="">${sessionScope.FileName}</a>
				<a href="javascript:void(0)" onclick="upFiles()" >
				上传附件</a>
				-->
				
				<button type="button" id="j_upload_file_btn">附件上传</button>
				<ul style="overflow:hidden;margin:0px;list-style-type:none;padding-left: 0px;"></ul>
				<ul style="overflow:hidden;margin:0px;list-style-type:none;padding-left: 0px;" id="upload_file_wrap">${forumnotes.uploadFiles}</ul>
				<textarea name="uploadFiles"  id="textarea_upload_file_wrap" style="display:none;"></textarea>
				<textarea id="uploadUeditor" style="display:none;"></textarea>
				
				<%-- <div id="dialogId" title="修改信息">   
                   	<table>
                   	${forumnotes.uploadFiles}
                   	</table>
                </div>   
	            <div>  
	                <div class="control-group" style="margin-top:12px;">  
	                    <input name="auditStatus" class="btn btn-primary" type="button" onclick='showDialog();' value="附件修改"/>  
	                </div>  
	            </div> --%>
			</td>
		</tr>
		<tr>
			<td><button type="submit" id="submitForm">${empty forumnotes.id ? "新增" : "编辑"}</button></td>
			<td colspan="3"><button type="button" onclick="javascript:history.back();">返回</button></td>
		</tr>
	</table>
	</form>
</body>

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/STATIC/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/STATIC/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/STATIC/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script type="text/javascript">
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	var ue = UE.getEditor('editor');
</script>
<script type="text/javascript">
/*$(function() {  
	    $("#dialogId").hide();  
	});
	function showDialog() {
		
	    $("#dialogId").dialog({
	        height: 300,
	        width: 400,
	        // 模态开启  
	        modal: true,
	        // 是否可拖拽  
	        draggable: true,
	        // 最小宽度  
	        minWidth: 300,
	        buttons: {  
	            "提交": function() {
	            	$("#form").submit();
	            },
	    		"取消": function() {
	    			$(this).dialog("close");
	    		}
	        },  
	         close: function() {
	        	$(this).remove(); 
	        } 
	    });  
	}*/
</script>
<script type="text/javascript">
	var _editor = UE.getEditor("uploadUeditor");
	_editor.ready(function(){
		_editor.hide();
		_editor.addListener('afterUpfile',_afterUpfile);
	});
	
	document.getElementById("j_upload_file_btn").onclick = function(){
		var dialog = _editor.getDialog("attachment");
		dialog.render();
		dialog.open();
	}
	//单独上传附件插件
	function _afterUpfile(t, result) {
        var fileHtml = '';
        var uploadfileHtml = '';
        //var i, item, icon, title;
        //html = '',
        var me = this;
        function getFileIcons(url){
            var ext = url.substr(url.lastIndexOf('.') + 1).toLowerCase(),
                maps = {
                    "rar":"icon_rar.gif","zip":"icon_rar.gif","tar":"icon_rar.gif","gz":"icon_rar.gif","bz2":"icon_rar.gif",
                    "doc":"icon_doc.gif","docx":"icon_doc.gif",
                    "pdf":"icon_pdf.gif",
                    "mp3":"icon_mp3.gif",
                    "xls":"icon_xls.gif",
                    "chm":"icon_chm.gif",
                    "ppt":"icon_ppt.gif","pptx":"icon_ppt.gif",
                    "avi":"icon_mv.gif","rmvb":"icon_mv.gif","wmv":"icon_mv.gif","flv":"icon_mv.gif","swf":"icon_mv.gif","rm":"icon_mv.gif",
                    "exe":"icon_exe.gif",
                    "psd":"icon_psd.gif",
                    "txt":"icon_txt.gif",
                    "jpg":"icon_jpg.gif","png":"icon_jpg.gif","jpeg":"icon_jpg.gif","gif":"icon_jpg.gif","ico":"icon_jpg.gif","bmp":"icon_jpg.gif"
                };
            return maps[ext] ? maps[ext]:maps['txt'];
        }
        for(var i in result){
        	
        	var URL = me.getOpt('UEDITOR_HOME_URL');
            var iconDir = URL + (URL.substr(URL.length - 1) == '/' ? '':'/') + 'dialogs/attachment/fileTypeImages/';
            //alert(iconDir)
        	icon = iconDir + getFileIcons(result[i].url);
        	//alert(icon)
            fileHtml += '<li><img style="vertical-align: middle; margin-right: 2px;" src="'+ icon + '" _src="' + icon + '"/>' +
            '<a href="'+result[i].url+'" target="_blank">'+result[i].title+'</a></li>';
            
            uploadfileHtml += '<li><img style="vertical-align: middle; margin-right: 2px;" src="'+ icon + '" _src="' + icon + '"/>' +
            '<a href="'+result[i].url+'" target="_blank">'+result[i].title+'</a></li>';
            
           
        }
        document.getElementById('upload_file_wrap').innerHTML = fileHtml;
        document.getElementById('textarea_upload_file_wrap').innerHTML = uploadfileHtml;
    }
</script>
<script type="text/javascript">
	$(function(){
		$("#submitForm").click(function(){
			var id = $("#parentmodules").val();
			if (id == 0) {
				alert("请选择归属模块!");
				return false;
			}
		});
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
								if(arrays[0] == 0){
									alert("该模块不完全")
									$("#childsmodules").append("<option value=''>--请选择--</option>")
									//详见http://www.cnblogs.com/Luouy/p/5806833.html,有具体解释
									$("#parentmodules").val("0");
								}else {
									$("#childsmodules").append("<option value='"+arrays[0]+"'>"+arrays[1]+"</option>");
								}
							}
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