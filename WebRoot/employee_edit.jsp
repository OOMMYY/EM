<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/header.jsp"%>
<style>
* {font-family: "宋体";font-size: 14px}
</style>
<center>
<jsp:useBean id="db"
             scope="page"
             class="util.DB" />
	
	<%
		String emID=request.getParameter("EmployeeID");
		String sql = "select * from employees where EmployeeID="+emID+";";
		Connection conn = null;
		response.setContentType("text/html;charset=utf-8");
		try {
			
			conn = db.getConn();
			Statement pstmt = db.getStmt(conn);
			ResultSet rs = db.getRs(pstmt,sql);
			while (rs.next()) {

	%>
	<form id="form1" name="form1" method="post"
	action="<%=context%>/employee_editHandler.jsp"
	>
	<table width="650" height="200" border="0" align="center">
		<tr>
			<td width="150">EmployeeID：</td>
			<td width="500">
				<input name="EmployeeID" type="text" value=<%=rs.getString("EmployeeID")%> size="40" maxlength="20" />
			</td>
		</tr>
		<tr>
			<td>EmployeeName：</td>
			<td>
				<input name="EmployeeName" type="text" value=<%=rs.getString("EmployeeName")%> size="40" maxlength="40" />
			</td>
		</tr>
		<tr>
			<td>Sex：</td>
			<td>
				<input name="Sex" type="text" value=<%=rs.getString("Sex")%> size="40" maxlength="20" />
			</td>
		</tr>
		<tr>
			<td>BirthDay：</td>
			<td>
				<input name="BirthDay" type="text" value=<%=rs.getString("BirthDay")%> size="40" maxlength="20" />
			</td>
		</tr>
			<tr>
			<td>Phone：</td>
			<td>
				<input name="Phone" type="text" value=<%=rs.getString("Phone")%> size="40" maxlength="20" />
			</td>
		</tr>
		<tr>
			<td>DegreeID：</td>
			<td>
				<input name="DegreeID" type="text" value=<%=rs.getString("DegreeID")%> size="40" maxlength="20" />
			</td>
		</tr>
			<tr>
			<td>HireDate：</td>
			<td>
				<input name="HireDate" type="text" value=<%=rs.getString("HireDate")%> size="40" maxlength="20" />
			</td>
		</tr>
			<tr>
			<td>EmployeeTypeID：</td>
			<td>
				<input name="EmployeeTypeID" type="text" value=<%=rs.getString("EmployeeTypeID")%> size="40" maxlength="20" />
			</td>
		</tr>
			<tr>
			<td>DepartmentID：</td>
			<td>
				<input name="DepartmentID" type="text" value=<%=rs.getString("DepartmentID")%> size="40" maxlength="20" />
			</td>
		</tr>
			<tr>
			<td>Title：</td>
			<td>
				<input name="Title" type="text" value=<%=rs.getString("Title")%> size="40" maxlength="20" />
			</td>
		</tr>
			<tr>
			<td>Salary：</td>
			<td>
				<input name="Salary" type="text" value=<%=rs.getString("Salary")%> size="40" maxlength="20" />
			</td>
		</tr>
		<tr>
			<td>ManagerID：</td>
			<td>
				<input name="ManagerID" type="text" value=<%=rs.getString("ManagerID")%> size="40" maxlength="20" />
			</td>
		</tr>
		<tr>
			
			<td>

			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" name="Submit" value="提交" />
				<input type="reset" name="Reset" value="重置" />
			</td>
		</tr>
	</table>
</form>
	<%
			}
			rs.close();
			pstmt.close();
		}  catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	%>
</center>
<%@ include file="/footer.jsp"%>