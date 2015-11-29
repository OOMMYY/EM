<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/header.jsp"%>
<style type="text/css">
* {font-family: "宋体";font-size: 14px}
table{
	width:1000;
}
</style>
<jsp:useBean  id="db" scope="page" class="util.DB"/>
<center>
<br> 
角色管理

<% 
response.setContentType("text/html;charset=utf-8"); 
Connection conn=null;%><% 
try{ 
	conn=db.getConn(); 
	Statement stmt=db.getStmt(conn); 
	ResultSet rs=stmt.executeQuery("select * from roles;"); 
	while(rs.next()){ 
	%>
<form action="role_editHandler.jsp" method="post">
<input type="text" name="RoleID" size=4 value=<%=rs.getString("roleID")%>><input type="text" size=8 name="RoleName" value=<%=rs.getString("roleName")%>>
<%String str=rs.getString("Auth_Authority"); if(str.equals("1")){%><input type="checkbox" name="Auth" value="Auth_Authority" checked >Auth_Authority <%} else{%><input type="checkbox" name="Auth" value="Auth_Authority" >Auth_Authority<%}%>
<input type="checkbox" name="Auth" value="Auth_Info" <%str=rs.getString("Auth_Info"); if(str.equals("1")){%>checked<%} %> >Auth_Info
<input type="checkbox" name="Auth" value="Auth_Job" <%str=rs.getString("Auth_Job"); if(str.equals("1")){%>checked<%} %> >Auth_Job
<input type="checkbox" name="Auth" value="Auth_Attendance" <%str=rs.getString("Auth_Attendance"); if(str.equals("1")){%>checked<%} %>>Auth_Attendance
<input type="checkbox" name="Auth" value="Auth_Training" <%str=rs.getString("Auth_Training"); if(str.equals("1")){%>checked<%} %>>Auth_Training
<input type="checkbox" name="Auth" value="Auth_Evaluation" <%str=rs.getString("Auth_Evaluation"); if(str.equals("1")){%>checked<%} %>>Auth_Evaluation
<input type="checkbox" name="Auth" value="Auth_RP" <%str=rs.getString("Auth_RP"); if(str.equals("1")){%>checked<%} %>>Auth_RP
<input type="checkbox" name="Auth" value="Auth_Role" <%str=rs.getString("Auth_Role"); if(str.equals("1")){%>checked<%} %>>Auth_Role
<input type="checkbox" name="Auth" value="Auth_Encrypt" <%str=rs.getString("Auth_Encrypt"); if(str.equals("1")){%>checked<%} %>>Auth_Encrypt
<input type="submit" value="确认修改" name="button1">
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
<form action="role_addHandler.jsp" method="post">
<input type="text" name="RoleID" size=4 ><input type="text" size=8 name="RoleName" >
<input type="checkbox" name="Auth" value="Auth_Authority"  >Auth_Authority
<input type="checkbox" name="Auth" value="Auth_Info"  >Auth_Info
<input type="checkbox" name="Auth" value="Auth_Job" >Auth_Job
<input type="checkbox" name="Auth" value="Auth_Attendance" >Auth_Attendance
<input type="checkbox" name="Auth" value="Auth_Training">Auth_Training
<input type="checkbox" name="Auth" value="Auth_Evaluation" >Auth_Evaluation
<input type="checkbox" name="Auth" value="Auth_RP" >Auth_RP
<input type="checkbox" name="Auth" value="Auth_Role">Auth_Role
<input type="checkbox" name="Auth" value="Auth_Encrypt" >Auth_Encrypt
<input type="submit" value="添加" name="button1">
	</form>
</center>
<%@ include file="footer.jsp"%>
