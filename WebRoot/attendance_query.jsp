<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/header.jsp"%>
<style>
* {font-family: "宋体";font-size: 14px}
</style>
<jsp:useBean  id="db" scope="page" class="util.DB"/>
<center>
	<br>出勤日志<br>
	<table>
	<tr>
	<td>职工姓名</td><td>日期</td><td>出勤状态</td>
	</tr>
<%
response.setContentType("text/html;charset=utf-8");
Connection conn=null;
try{
	conn=db.getConn();
	Statement stmt=db.getStmt(conn);
	ResultSet rs=stmt.executeQuery("select * from v_attendances;");
	while(rs.next()){
	%>
	<tr>
	<td><%=rs.getString("EmployeeName")%></td><td><%=rs.getString("Date") %></td><td><%=rs.getString("Status")%>
	</tr>
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
