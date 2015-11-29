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
	String oldpassword = request.getParameter("oldpassword");
	String newpassword0 = request.getParameter("newpassword0");
	String newpassword1 = request.getParameter("newpassword1");
	if(newpassword0.equals(newpassword1)){
	String sql_0 = "update users set password=? where EmployeeID="+request.getParameter("EmployeeID")+";";
	String sql_1="select password from users where EmployeeID="+request.getParameter("EmployeeID")+";";
	if (StringUtil.validateNull(oldpassword)) {
		out.println("对不起，密码不能为空，请您重新输入！<br>");
		out.println("<a href=\"" + context + "/personalPassword.jsp\">返回</a><br>");
	} else {
			try {
				conn = db.getConn();
				Statement stmt=db.getStmt(conn);
				//out.println(sql);
				ResultSet rs=stmt.executeQuery(sql_1);
				//out.print(sql_0);
				//out.print(sql_0);
				String pwd="";
				while(rs.next()){
					pwd=rs.getString("password");
				}
				stmt.close();
				if(oldpassword.equals(pwd)){
				PreparedStatement pstmt = conn.prepareStatement(sql_0);
				pstmt.setString(1, StringUtil.filterHtml(newpassword0));
				result = pstmt.executeUpdate();
				pstmt.close();
				}
				else{
				result=0;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}	
		}
	}
	else{
	result=0;
	}
		if (result == 0) {
			out.println("对不起，密码编辑不成功，请您重新编辑！<BR>");
			out.println("<a href=\"" + context + "/personalPasswod.jsp\">返回</a><BR>");
		} else {
			out.println("祝贺您，密码编辑成功。<BR>");
			out.println("<a href=\"" + context + "/personalPassword.jsp\">返回</a><BR>");
		}
%>
<%@ include file="/footer.jsp"%>
