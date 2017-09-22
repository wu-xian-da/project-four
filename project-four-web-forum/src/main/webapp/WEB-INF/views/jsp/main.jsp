<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>论坛</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
 	<frameset rows="100,*">
		<frame src="http://localhost:8888/top?modulesid=${param.modulesid}" name="topFrame" />
		<frame src="http://localhost:8888/forum/notes/forumlistByparentmodules/${param.modulesid}"  name="mainFramenotes"/>
	</frameset>
</html>
