<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/header.jsp"%>
<style type="text/css">
* {font-family: "宋体";font-size: 14px}
table{
	width:100;
}
</style>
<jsp:useBean  id="db" scope="page" class="util.DB"/>
<center>
<br> 
员工密码管理


<table>
<tr>
<th  width=40 >员工ID</th><th width=40 >密码</th>
</tr>

<%
response.setContentType("text/html;charset=utf-8");
Connection conn=null;
try{
	conn=db.getConn();
	Statement stmt=db.getStmt(conn);
	ResultSet rs=stmt.executeQuery("select * from users;");
	while(rs.next()){
	%>
	<form action="password_editHandler.jsp" method="post">
	<tr>
	<td><input type="text" maxlength="10"  size="10" name="EmployeeID" value=<%=rs.getString("EmployeeID")%> /></td>
	<td><input type="text" maxlength="10" size="10" name="Password" value=<%=rs.getString("Password") %> /></td> 
	<td><input type="submit" name="button3" value="确认修改"> </td>
	</tr>
	</form>
	<%	
	}
	rs.close();
	stmt.close();
	}catch(SQLException e){
	e.printStackTrace();
	} finally{
		try{
		conn.close();
		}catch(SQLException e){
			e.printStackTrace();	
		}
	}
%>
	</table>
</center>
<%@ include file="footer.jsp"%>
