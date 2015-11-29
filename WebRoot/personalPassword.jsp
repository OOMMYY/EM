<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/header.jsp"%>
<style type="text/css">
* {font-family: "宋体";font-size: 14px}
table{
	width:300;
}
</style>
<jsp:useBean  id="db" scope="page" class="util.DB"/>
<center>
<br> 
<form action="personalPasswordHandler.jsp?EmployeeID=<%=session.getAttribute("ID")%>" method="post">
<h2>密码管理</h2><br>
<a >原密码:</a><input type="password" align="left" name="oldpassword"><br>
<a >新密码:</a><input type="password" align="left" name="newpassword0"><br>
<a >重新输入:</a><input type="password" align="left" name="newpassword1"><br>
<input type="submit" name="button3" value="确认">
</form>
</center>
<%@ include file="footer.jsp"%>
