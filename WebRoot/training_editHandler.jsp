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
	String TrainingID = request.getParameter("TrainingID");
	String BeginDate = request.getParameter("BeginDate");
	String EndDate = request.getParameter("EndDate");
	String TrainingType= request.getParameter("TrainingType");
	String  Description = request.getParameter("Description");
	String sql = "update Training set TrainingID=? ,BeginDate=? ,EndDate=? ,TrainingType=? ,Description=?  where TrainingID="+TrainingID+";";
	
	if (StringUtil.validateNull(TrainingID)) {
		out.println("对不起，培训代号不能为空，请您重新输入！<br>");
		out.println("><a href=\"" + context + "/training_query.jsp\">添加新培训</a><br>");
	} else if (StringUtil.validateNull(BeginDate)) {
		out.println("对不起，开始日期不能为空，请您重新输入！<br>");
		out.println("<a href=\"" + context + "/training_query.jsp\">添加新培训</a><br>");
	} else if (StringUtil.validateNull(EndDate)) {
		out.println("对不起，结束日期不能为空，请您重新输入！<br>");
		out.println("<a href=\"" + context + "/training_query.jsp\">添加新培训</a><br>");
	}else if (StringUtil.validateNull(TrainingType)) {
		out.println("对不起,培训类型不能为空，请您重新输入！<br>");
		out.println("<a href=\"" + context + "/training_query.jsp\">添加新培训</a><br>");
	}else if (StringUtil.validateNull(Description)) {
		out.println("对不起,培训简介不能为空，请您重新输入！<br>");
		out.println("<a href=\"" + context + "/training_query.jsp\">添加新培训</a><br>");
	}else {
			try {
				conn = db.getConn();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, StringUtil.filterHtml(TrainingID));
				pstmt.setString(2, StringUtil.filterHtml(BeginDate));
				pstmt.setString(3,StringUtil.filterHtml(EndDate));
				pstmt.setString(4,StringUtil.filterHtml(TrainingType));
				pstmt.setString(5,StringUtil.filterHtml(Description));
				//	out.println(pstmt);
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
			out.println("对不起，培训信息保存不成功，请您重新编辑！<BR>");
			out.println("<a href=\"" + context + "/training_query.jsp\">重新编辑培训信息</a><BR>");
		} else {
			out.println("祝贺您,培训信息保存成功。<BR>");
			out.println("<a href=\"" + context + "/training_query.jsp\">查看所有培训信息</a><BR>");
			response.sendRedirect("training_query.jsp");
		}
	}
%>
<%@ include file="/footer.jsp"%>
