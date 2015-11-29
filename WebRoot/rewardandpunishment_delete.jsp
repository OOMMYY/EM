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
	String RP_ID= request.getParameter("RP_ID");
	String sql = "delete from rewardsandpunishments where RP_ID="+RP_ID+";";
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
		response.sendRedirect("rewardandpunishment_query.jsp");
%>
<%@ include file="/footer.jsp"%>
