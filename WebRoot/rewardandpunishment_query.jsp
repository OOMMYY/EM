<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/header.jsp"%>
<style type="text/css">
* {font-family: "宋体";font-size: 14px}
table{
	width:1100;
}
</style>
<jsp:useBean  id="db" scope="page" class="util.DB"/>
<center>
<br>
员工奖惩记录
<br>
<table>
<tr>
<td  width=60 >奖惩编号</td><td width=70 >员工编号</td><td width=100>奖励/惩罚</td><td width=100>奖惩日期</td><td>奖惩原因</td><td>备注</td>
</tr>

<%
response.setContentType("text/html;charset=utf-8");
Connection conn=null;
try{
	conn=db.getConn();
	Statement stmt=db.getStmt(conn);
	ResultSet rs=stmt.executeQuery("select * from RewardsAndPunishments;");
	while(rs.next()){
	%>
	<form action="rewardandpunishment_delete.jsp" method="post">
	<table>
	<tr>
	<td><input type="text" maxlength="2" size="5" name="RP_ID" value=<%=rs.getString("RP_ID")%> /></td>
	<td><input type="text" maxlength="10" size="10" name="EmployeeID" value=<%=rs.getString("EmployeeID") %> /></td>
	<td><input type="text" maxlength="10" size="10" name="Type" value=<%=rs.getString("Type")%> /></td>
	<td><input type="text" maxlength="10" size="10" name="Date" value=<%=rs.getString("Date")%> /></td>
	<td><input type="text" maxlength="255" size="50" name="Reason" value=<%=rs.getString("Reason")%> /></td>
	<td><input type="text" maxlength="255" size="50" name="Remark" value=<%=rs.getString("Remark")%> /></td>
	<%if(session.getAttribute("Auth_RP")=="1"){
		%><td><input type="submit" value="删除" name="button5" /></td> <%
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
	<%if(session.getAttribute("Auth_RP")=="1"){
	%>
	<form action="rewardandpunishment_addHandler.jsp" method="post" >
  <input type="text" maxlength="4" size="10" value="" name="EmployeeID">
  <input type="text" maxlength="10" size="10" value="" name="Type">
  <input type="text" maxlength="10" size="10" value="" name="Date">
 <input type="text" maxlength="255" size="20" value="" name="Reason">
  <input type="text" maxlength="255" size="20" value="" name="Remark">
  <br><input type="submit" value="提交奖惩记录" name="button4">
  </form>	
	<%	
	}%>
	</table>
</center>
<%@ include file="footer.jsp"%>
