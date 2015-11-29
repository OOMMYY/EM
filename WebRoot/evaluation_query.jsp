<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/header.jsp"%>
<style>
* {font-family: "宋体";font-size: 14px}
</style>
<jsp:useBean  id="db" scope="page" class="util.DB"/>
<center>
	<br>考核记录<br>
	<br>
	<table width=400>
	<tr>
	<td width=50>考核ID</td><td width=50>员工号</td><td width=50>考核项目ID</td><td width=60>考核日期</td><td>考核结果</td>
	</tr>
	</table>
<%
response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("utf-8");
Connection conn=null;
try{
	conn=db.getConn();
	Statement stmt=db.getStmt(conn);
	ResultSet rs=stmt.executeQuery("select * from evaluations;");
	while(rs.next()){
	%>
	<form action="evaluation_editHandler.jsp" method="post">
	<table>
	<tr>
	<td><input type="text" maxlength="4" size="4" name="EvaluationID" value=<%=rs.getString("EvaluationID")%> /></td>
	<td><input type="text" maxlength="2" size="5" name="EmployeeID" value=<%=rs.getString("EmployeeID")%> /></td>
	<td><input type="text" maxlength="10" size="5" name="EvaluationProjectID" value=<%=rs.getString("EvaluationProjectID") %> /></td>
	<td><input type="text" maxlength="10" size="10" name="Date" value=<%=rs.getString("Date")%> /></td>
	<td><input type="text" maxlength="10" size="10" name="Result" value=<%=rs.getString("Result")%> /></td>
	<%if(session.getAttribute("Auth_Evaluation")=="1"){
		%><td><input type="submit" value="提交修改" name="button5" /></td> <%
	}%>
	</tr>
	</table>
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
	<%if(session.getAttribute("Auth_Evaluation")=="1"){
	%>
	<form action="evaluation_addHandler.jsp" method="post">
	<table>
	<tr>
	<td><input type="text" maxlength="4" size="5" name="EvaluationID"/></td>
	<td><input type="text" maxlength="4" size="5" name="EmployeeID" /></td>
	<td><input type="text" maxlength="10" size="5" name="EvaluationProjectID"/></td>
	<td><input type="text" maxlength="10" size="10" name="Date" /></td>
	<td><input type="text" maxlength="10" size="10" name="Result" /></td>
	<td><input type="submit" value="添加考核" name="button5" /></td> 
	</tr>
	</table>
	</form>	
	<%	
	}%>
</center>
<%@ include file="footer.jsp"%>
