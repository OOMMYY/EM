<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/header.jsp"%>
<style>
* {	font-family: "宋体";	font-size: 14px}
</style>
<jsp:useBean id="db"
             scope="page"
             class="util.DB" />
<%
	Connection conn = null;
//	request.setCharacterEncoding("gb2312");  
	int result = 0;
	request.setCharacterEncoding("utf-8");
	String EmployeeID = request.getParameter("EmployeeID");
	String EmployeeName = request.getParameter("EmployeeName");
	String Sex = request.getParameter("Sex");
	String BirthDay = request.getParameter("BirthDay");
	String Phone = request.getParameter("Phone");
	String DegreeID= request.getParameter("DegreeID");
	String HireDate= request.getParameter("HireDate");
	String EmployeeTypeID= request.getParameter("EmployeeTypeID");
	String DepartmentID= request.getParameter("DepartmentID");
	String Title= request.getParameter("Title");
	String Salary= request.getParameter("Salary");
	String ManagerID= request.getParameter("ManagerID");
	String sql = "insert into employees (EmployeeID,EmployeeName,Sex,BirthDay,Phone,DegreeID,HireDate,EmployeeTypeID,DepartmentID,Title,Salary,ManagerID) values(?,?,?,?,?,?,?,?,?,?,?,?);";
	
	if (StringUtil.validateNull(EmployeeID)) {
		out.println("对不起，不能为空，请您重新输入！<br>");
		out.println("><a href=\"" + context + "/employee_add.jsp\">添加新员工</a><br>");
	} else if (StringUtil.validateNull(EmployeeName)) {
		out.println("对不起，不能为空，请您重新输入！<br>");
		out.println("<a href=\"" + context + "/employee_add.jsp\">添加新员工</a><br>");
	} else {
			try {
				conn = db.getConn();
				//Statement stmt=conn.createStatement();
			//	result=stmt.executeUpdate(sql);
			//	stmt.close();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, StringUtil.filterHtml(EmployeeID));
				pstmt.setString(2, StringUtil.filterHtml(EmployeeName));
				pstmt.setString(3, StringUtil.filterHtml(request.getParameter("Sex")));
				pstmt.setString(4, StringUtil.filterHtml(request.getParameter("BirthDay")));
				pstmt.setString(5, StringUtil.filterHtml(request.getParameter("Phone")));
				pstmt.setString(6, StringUtil.filterHtml(request.getParameter("DegreeID")));
				pstmt.setString(7, StringUtil.filterHtml(request.getParameter("HireDate")));
				pstmt.setString(8, StringUtil.filterHtml(request.getParameter("EmployeeTypeID")));
				pstmt.setString(9, StringUtil.filterHtml(request.getParameter("DepartmentID")));
				pstmt.setString(10, StringUtil.filterHtml(request.getParameter("Title")));
				pstmt.setString(11, StringUtil.filterHtml(request.getParameter("Salary")));
				pstmt.setString(12, StringUtil.filterHtml(request.getParameter("ManagerID")));
				
				result = pstmt.executeUpdate();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}	


		if (result == 0) {
			out.println("对不起，员工信息添加不成功，请您重新输入！<BR>");
			out.println("<a href=\"" + context + "/employee_add.jsp\">添加新的员工信息</a><BR>");
		} else {
			out.println("祝贺您，员工信息成功添加。<BR>");
			out.println("<a href=\"" + context + "/query.jsp\">查看所有员工信息</a><BR>");
			out.println("<a href=\"" + context + "/employee_add.jsp\">继续添加员工信息</a><BR>");
		}
	}
%>
<%@ include file="/footer.jsp"%>
