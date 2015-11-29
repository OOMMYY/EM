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
	request.setCharacterEncoding("utf-8");
	String EmployeeID = request.getParameter("EmployeeID");
	String sql = "delete from employees where EmployeeID="+EmployeeID+";";
			try{	
				conn = db.getConn();
				Statement stmt=conn.createStatement();
				out.println("<br><br>删除成功");
				stmt.executeUpdate(sql);
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}	
		response.sendRedirect("query.jsp");
%>
<%@ include file="/footer.jsp"%>
