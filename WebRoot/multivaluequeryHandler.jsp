<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/header.jsp"%>
<style>
* {font-family: "宋体";font-size: 14px}
</style>
<jsp:useBean  id="db" scope="page" class="util.DB"/>
<% 
	response.setContentType("text/html;charset=utf-8");
	request.setCharacterEncoding("utf-8");
	String sql="select * from v_employeeinformation where EmployeeID>0 ";
		if(!request.getParameter("EmployeeID").isEmpty()){
			sql+=" and EmployeeID="+request.getParameter("EmployeeID");
		}
		if(!request.getParameter("EmployeeName").isEmpty()){
			sql+=" and EmployeeName='"+request.getParameter("EmployeeName")+"'";
		}
		if(!request.getParameter("Sex").isEmpty()){
			sql+=" and Sex='"+request.getParameter("Sex")+"'";
		}
		if(!request.getParameter("BirthDay").isEmpty()){
			sql+=" and BirthDay='"+request.getParameter("BirthDay")+"'";
		}
		if(!request.getParameter("Phone").isEmpty()){
			sql+=" and Phone='"+request.getParameter("Phone")+"'";
		}
		if(!request.getParameter("DegreeName").isEmpty()){
			sql+=" and DegreeName='"+request.getParameter("DegreeName")+"'";
		}
		if(!request.getParameter("HireDate").isEmpty()){
			sql+=" and HireDate='"+request.getParameter("HireDate")+"'";
		}
		if(!request.getParameter("DepartmentName").isEmpty()){
			sql+=" and DepartmentName='"+request.getParameter("DepartmentName")+"'";
		} 
		if(!request.getParameter("Title").isEmpty()){
			sql+=" and Title='"+request.getParameter("Title")+"'";
		}
		 if(!request.getParameter("Salary").isEmpty()){
			sql+=" and Salary="+request.getParameter("Salary");
		}
	sql+=";";
	//out.print(sql);
	Connection conn=null;
	conn=db.getConn();
	Statement stmt=db.getStmt(conn);
	ResultSet rs=db.getRs(stmt,sql);
	try{
	while(rs.next()){
		//out.print(rs.getString("EmployeeID"));
		%>
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
		<%
	}
	db.closeRs(rs);
	}catch(Exception e){
		e.printStackTrace();
	}
	db.closeStmt(stmt);
	db.closeConn(conn);
%>
<%@ include file="footer.jsp"%>
