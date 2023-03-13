<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%--设置当前界面的基础路径,默认表示表示该页面的请求是根路径下的--%>
<base href="<%=basePath%>">
<title>writeSuccess.jsp</title>
</head>    
<body>
	<span style="font-size: xx-large; ">发送成功！</span>
</body>
</html>
