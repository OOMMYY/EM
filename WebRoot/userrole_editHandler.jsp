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
	String RoleID = request.getParameter("RoleID");
	String sql = "update userrole set roleID=? where EmployeeID="+EmployeeID+";";
	if (StringUtil.validateNull(EmployeeID)) {
		out.println("对不起，用户名不能为空，请您重新编辑！<br>");
		out.println("><a href=\"" + context + "/userrole.jsp\">返回</a><br>");
	} else if (StringUtil.validateNull(RoleID)) {
		out.println("对不起，RoleID不能为空，请您重新输入！<br>");
		out.println("<a href=\"" + context + "/userrole.jsp\">返回</a><br>");
	} else {
			try {
				conn = db.getConn();
				Statement stmt=db.getStmt(conn);
				//out.println(sql);
				//stmt.executeUpdate(sql);
				stmt.close();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, StringUtil.filterHtml(RoleID));
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
			out.println("对不起，用户角色编辑不成功，请您重新编辑！<BR>");
			out.println("<a href=\"" + context + "/userrole.jsp\">返回</a><BR>");
		} else {
			out.println("祝贺您，用户角色编辑成功。<BR>");
			out.println("<a href=\"" + context + "/userrole.jsp\">返回</a><BR>");
		}
	}
%>
<%@ include file="/footer.jsp"%>
