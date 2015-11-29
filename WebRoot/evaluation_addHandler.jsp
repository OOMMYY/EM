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
	String EvaluationID= request.getParameter("EvaluationID");
	String EmployeeID = request.getParameter("EmployeeID");
	String EvaluationProjectID= request.getParameter("EvaluationProjectID");
	String Date= request.getParameter("Date");
	String Result= request.getParameter("Result");
	String sql ="insert into evaluations (EvaluationID,EmployeeID,EvaluationProjectID,Date,Result) values(?,?,?,?,?);";
	
	if (StringUtil.validateNull(EmployeeID)) {
		out.println("对不起，不能为空，请您重新输入！<br>");
		out.println("><a href=\"" + context + "/employee_edit.jsp\">重新编辑</a><br>");
	} else if (StringUtil.validateNull(EvaluationID)) {
		out.println("对不起，不能为空，请您重新输入！<br>");
		out.println("<a href=\"" + context + "/employee_edit.jsp\">重新编辑</a><br>");
	} else {
			try {
				conn = db.getConn();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, StringUtil.filterHtml(EvaluationID));
				pstmt.setString(2, StringUtil.filterHtml(EmployeeID));
				pstmt.setString(3, StringUtil.filterHtml(EvaluationProjectID));
				pstmt.setString(4, StringUtil.filterHtml(Date));
				pstmt.setString(5, StringUtil.filterHtml(Result));
				out.print(sql);
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
			out.println("对不起，考核信息添加不成功，请您重新编辑！<BR>");
			out.println("<a href=\"" + context + "/evaluation_query.jsp\">返回</a><BR>");
		} else {
			out.println("祝贺您，考核信息添加成功。<BR>");
			out.println("<a href=\"" + context + "/evaluation_query.jsp\">返回</a><BR>");
		}
	}
%>
<%@ include file="/footer.jsp"%>
