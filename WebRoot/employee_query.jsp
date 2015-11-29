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
		String emID=request.getParameter("text3");
		String sql = "select * from v_EmployeeInformation where EmployeeID="+emID+";";
		Connection conn = null;
		response.setContentType("text/html;charset=utf-8");
		try {
			
			conn = db.getConn();
			Statement pstmt = db.getStmt(conn);
			ResultSet rs = db.getRs(pstmt,sql);
			while (rs.next()) {

	%>
	<br><br>
	<table width="600" border="1" bordercolor="000000"
		style="table-layout: fixed; word-break: break-all">
		<tr>
			<td width="100" bordercolor="ffffff">
				EmployeeID:
			</td>
			<td width="500" bordercolor="ffffff"><%=rs.getInt("EmployeeID")%></td>
		</tr>
		<tr>
			<td bordercolor="ffffff">
				EmployeeName:
			</td>
			<td bordercolor="ffffff"><%=rs.getString("EmployeeName")%></td>
		</tr>
			<tr>
			<td bordercolor="ffffff">
				sex:
			</td>
			<td bordercolor="ffffff"><%=rs.getString("sex")%></td>
		</tr>
			<tr>
			<td bordercolor="ffffff">
				BirthDay:
			</td>
			<td bordercolor="ffffff"><%=rs.getString("Birthday")%></td>
		</tr>
			<tr>
			<td bordercolor="ffffff">
				Phone:
			</td>
			<td bordercolor="ffffff"><%=rs.getString("Phone")%></td>
		</tr>
			<tr>
			<td bordercolor="ffffff">
				HireDate:
			</td>
			<td bordercolor="ffffff"><%=rs.getString("HireDate")%></td>
		</tr>
			<tr>
			<td bordercolor="ffffff">
				Title:
			</td>
			<td bordercolor="ffffff"><%=rs.getString("Title")%></td>
		</tr>
			<tr>
			<td bordercolor="ffffff">
				Salary:
			</td>
			<td bordercolor="ffffff"><%=rs.getString("Salary")%></td>
		</tr>
			<tr>
			<td bordercolor="ffffff">
				DegreeName:
			</td>
			<td bordercolor="ffffff"><%=rs.getString("DegreeName")%></td>
		</tr>
			<tr>
			<td bordercolor="ffffff">
				DepartmentName:
			</td>
			<td bordercolor="ffffff"><%=rs.getString("DepartmentName")%></td>
		</tr>
		
	</table>
	<br>
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