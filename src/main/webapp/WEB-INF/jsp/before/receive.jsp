<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%--设置当前界面的基础路径,默认表示表示该页面的请求是根路径下的--%>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>receive.jsp</title>
<link href="css/common.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		table{
			text-align: center;
			border-collapse: collapse;
		}
		.bgcolor{
		  	background-color: #F08080;
		}
	</style>
	<script type="text/javascript">
		function changeColor(obj){
			obj.className = "bgcolor";
		}
		function changeColor1(obj){
			obj.className = "";
		}
		//确认删除函数
  		function confirmDelete(){
  			var n = document.deleteForm.ids.length;  //邮件总数
  			var count = 0;  //统计没有选中的邮件个数
  			for(var i = 0; i < n; i++){
  				if(!document.deleteForm.ids[i].checked){
  					count++;
  				}else{
  					break;
  				}
  			}
  			if(n > 1){
  				if(count == n){      //如果没被选中的个数为邮件总数，即未选择，会弹出请选择提示
  					alert("请选择被删除的邮件！");
  	  				count = 0;
  	  				return;
  				}
  			}else{
  	  			if(!document.deleteForm.ids.checked){
  	  					alert("请选择被删除的邮件！");
  	  					return;
  	  			}
  			}	
  		
  			if(window.confirm("真的删除吗？really?")){
  				document.deleteForm.submit();
  			}
  		}
  		//选择全部邮件函数
  		function selectAll(){
  			var n = document.deleteForm.ids.length;
  			for(var i = 0; i < n; i++){
  				document.deleteForm.ids[i].checked = true;
  			}
  		}
	</script>
</head>
<body>
	<c:if test="${emailList.size() == 0 }">
		您还没有邮件。
	</c:if>
	<c:if test="${emailList.size() != 0 }">
		//提交后调用controller函数
		<form action="email/deleteMore" name="deleteForm">
		<table border="1" bordercolor="PaleGreen">
			<tr>
				<td width="100px">
				<input type="checkbox" name="act" onclick="selectAll()"/>
				<a href="javascript:confirmDelete();">删除</a></td>
				<td width="200px">发送人</td>
				<td width="400px">主题</td>
				<td width="100px">时间</td>
			</tr>
			
			<c:forEach items="${emailList }" var="email">
				//鼠标悬停上方改变颜色
				<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
					<td><input type="checkbox" name="ids" value="${email.id }"/></td>
					//未读邮件粗体标记
					<c:if test="${email.isopen == 0}">
						<td><a href="email/detail?id=${email.id }"><strong>${email.email_s }</strong></a></td>
						<td><a href="email/detail?id=${email.id }"><strong>${email.title }</strong></a></td>
					</c:if>
					//已读邮件正常字体
					<c:if test="${email.isopen == 1}">
						<td><a href="email/detail?id=${email.id }">${email.email_s }</a></td>
						<td><a href="email/detail?id=${email.id }">${email.title }</a></td>
					</c:if>
					<td>${email.sendtime }</td>
				</tr>
			</c:forEach>
		</table>
		</form>
	</c:if>	
</body>
</html>