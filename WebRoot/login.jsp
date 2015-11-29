<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ page import="java.sql.*,util.*"%>

<style>
* {font-family: "宋体";font-size: 14px}
</style>
<center>
<jsp:useBean id="db"
             scope="page"
             class="util.DB" />
	<%
		Boolean flag=false;		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String sql = "select Password from users where EmployeeID ="+username;
		Connection conn = null;
		response.setContentType("text/html;charset=utf-8");
		try {	
			conn = db.getConn();
			Statement pstmt = db.getStmt(conn);
			ResultSet rs = db.getRs(pstmt,sql);
			if(rs.next()){
			String pwd=rs.getString("PassWord");
			if(password.equals(pwd)){
				out.println("登陆成功");
				flag=true;
			}
			}	
			if(!flag){
				out.println("登陆失败");
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
		if(!flag)
			response.sendRedirect("login.html");
		else{
			session.setAttribute("ID",username);
			response.sendRedirect("menu.jsp");
		}
	%>
</center>

