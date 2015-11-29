<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/header.jsp"%>
<style>
* {font-family: "宋体";font-size: 14px}
</style>
<jsp:useBean  id="db" scope="page" class="util.DB"/>
<center>
	<br>培训项目<br>
	<br>
	<table width=750>
	<tr>
	<td width=60>项目编号</td><td width=80> 开始日期</td><td width=80>结束日期</td><td width=80>项目类型</td><td>简介</td>
	</tr>
	</table>
<%
response.setContentType("text/html;charset=utf-8");
Connection conn=null;
try{
	conn=db.getConn();
	Statement stmt=db.getStmt(conn);
	ResultSet rs=stmt.executeQuery("select * from Training;");
	while(rs.next()){
	%>
	<form action="training_editHandler.jsp" method="post">
	<table>
	<tr>
	<td><input type="text" maxlength="2" size="5" name="TrainingID" value=<%=rs.getString("TrainingID")%> /></td>
	<td><input type="text" maxlength="10" size="10" name="BeginDate" value=<%=rs.getString("BeginDate") %> /></td>
	<td><input type="text" maxlength="10" size="10" name="EndDate" value=<%=rs.getString("EndDate")%> /></td>
	<td><input type="text" maxlength="10" size="10" name="TrainingType" value=<%=rs.getString("TrainingType")%> /></td>
	<td><input type="text" maxlength="255" size="50" name="Description" value=<%=rs.getString("Description")%> /></td>
	<%if(session.getAttribute("Auth_Training")=="1"){
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
	<%if(session.getAttribute("Auth_Training")=="1"){
	%>
	<form action="training_add.jsp" method="post" >
  <input type="text" maxlength="2" size="2" value="" name="TrainingID">
  <input type="text" maxlength="10" size="10" value="" name="BeginDate">
  <input type="text" maxlength="10" size="10" value="" name="EndDate">
  <input type="text" maxlength="5" size="8" value="培训类型：" name="T"><input type="text" maxlength="20" size="20" value="" name="TrainingType"><br>
  <input type="text" maxlength="10" size="10" value="简介" name="D">
   <input type="text" maxlength="255" size="100" value="" name="Description"> 
  <br><input type="submit" value="提交" name="button4">
  </form>	
	<%	
	}%>
</center>
<%@ include file="footer.jsp"%>
