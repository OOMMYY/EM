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
	int result = 0;
	request.setCharacterEncoding("utf-8");
	String RP_ID = request.getParameter("RP_ID");
	String EmployeeID = request.getParameter("EmployeeID");
	String Type = request.getParameter("Type");
	String Date= request.getParameter("Date");
	String  Reason = request.getParameter("Reason");
	String  Remark = request.getParameter("Remark");
	String sql = "insert into Rewardsandpunishments (EmployeeID,Type,Date,Reason,Remark) values(?,?,?,?,?);";
	
	if (StringUtil.validateNull(EmployeeID)) {
		out.println("对不起，员工编号不能为空，请您重新输入！<br>");
		out.println("><a href=\"" + context + "/rewardandpunishment_query.jsp\">返回</a><br>");
	} else if (StringUtil.validateNull(Type)) {
		out.println("对不起，培训类型不能为空，请您重新输入！<br>");
		out.println("<a href=\"" + context + "/rewardandpunishment_query.jsp\">返回</a><br>");
	} else if (StringUtil.validateNull(Date)) {
		out.println("对不起，奖惩日期不能为空，请您重新输入！<br>");
		out.println("<a href=\"" + context + "/rewardandpunishment_query.jsp\">返回</a><br>");
	}else if (StringUtil.validateNull(Reason)) {
		out.println("对不起,奖惩原因不能为空，请您重新输入！<br>");
		out.println("<a href=\"" + context + "/rewardandpunishment_query.jsp\">返回</a><br>");
	}else if (StringUtil.validateNull(Remark)) {
		out.println("对不起,remark不能为空，请您重新输入！<br>");
		out.println("<a href=\"" + context + "/rewardandpunishment_query.jsp\">返回</a><br>");
	}else {
			try {
				conn = db.getConn();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, StringUtil.filterHtml(EmployeeID));
				pstmt.setString(2, StringUtil.filterHtml(Type));
				pstmt.setString(3,StringUtil.filterHtml(Date));
				pstmt.setString(4,StringUtil.filterHtml(Reason));
				pstmt.setString(5,StringUtil.filterHtml(Remark));
					//out.println(pstmt);
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
			out.println("对不起，奖惩记录添加不成功，请您重新添加！<BR>");
			out.println("<a href=\"" + context + "/rewardandpunishment_query.jsp\">返回</a><BR>");
		} else {
			//out.println("祝贺您,培训信息成功添加。<BR>");
			//out.println("<a href=\"" + context + "/training_query.jsp\">查看所有培训信息</a><BR>");
			response.sendRedirect("rewardandpunishment_query.jsp");
		}
	}
%>
<%@ include file="/footer.jsp"%>
