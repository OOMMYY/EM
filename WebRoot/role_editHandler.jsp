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
	String RoleID = request.getParameter("RoleID");
	String RoleName = request.getParameter("RoleName");
	String[] Auth=request.getParameterValues("Auth");
	int len;
	try{
		len=Auth.length;
	}catch(Exception e){
			 len=0;
	}
//	String[] A=request.getParameterValues("LL");
//	out.print(A.length+"66666666666666");
	String temp="";
	for(int i=0;i<len;i++){
		temp+=Auth[i];
	}
	//out.print(temp);
	String Auth_Authority="0";
	String Auth_Info="0";
	String Auth_Job ="0";
	String Auth_Attendance="0";
	String Auth_Training="0";
	String Auth_Evaluation="0";
	String Auth_RP="0";
	String Auth_Role="0";
	String Auth_Encrypt="0";
	if(temp.contains("Auth_Authority")){
		Auth_Authority="1";
	}
	if(temp.contains("Auth_Info")){
		Auth_Info="1";
	}
	if(temp.contains("Auth_Job")){
		Auth_Job="1";
	}
	if(temp.contains("Auth_Attendance")){
		Auth_Attendance="1";
	}
	if(temp.contains("Auth_Training")){
		Auth_Training="1";
	}
	if(temp.contains("Auth_Evaluation")){
		Auth_Evaluation="1";
	}
	if(temp.contains("Auth_RP")){
		Auth_RP="1";
	}
	if(temp.contains("Auth_Role")){
		Auth_Role="1";
	}
	if(temp.contains("Auth_Encrypt")){
		Auth_Encrypt="1";
	}
	String sql = "update roles set Auth_Authority=? ,Auth_Info=?, Auth_Job=? ,Auth_Attendance=? ,Auth_Training=?, Auth_Evaluation=?, Auth_RP=? ,Auth_Role=?, Auth_Encrypt=? where RoleID="+RoleID+";";
	
	if (StringUtil.validateNull(RoleID)) {
		out.println("对不起，RoleID不能为空，请您重新编辑！<br>");
		out.println("><a href=\"" + context + "/role_query.jsp\">返回</a><br>");
	} else if (StringUtil.validateNull(RoleName)) {
		out.println("对不起，RoleName不能为空，请您重新输入！<br>");
		out.println("<a href=\"" + context + "/role_query.jsp\">返回</a><br>");
	} else {
			try {
				conn = db.getConn();
				//Statement stmt=db.getStmt(conn);
				//out.println(sql);
				//stmt.executeUpdate(sql);
				//stmt.close();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, StringUtil.filterHtml(Auth_Authority));
				pstmt.setString(2, StringUtil.filterHtml(Auth_Info));
				pstmt.setString(3, StringUtil.filterHtml(Auth_Job));
				pstmt.setString(4, StringUtil.filterHtml(Auth_Attendance));
				pstmt.setString(5, StringUtil.filterHtml(Auth_Training));
				pstmt.setString(6, StringUtil.filterHtml(Auth_Evaluation));
				pstmt.setString(7, StringUtil.filterHtml(Auth_RP));
				pstmt.setString(8, StringUtil.filterHtml(Auth_Role));
				pstmt.setString(9, StringUtil.filterHtml(Auth_Encrypt));
				//out.print(sql);
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
			out.println("对不起，权限修改不成功，请您重新编辑！<BR>");
			out.println("<a href=\"" + context + "/role_query.jsp\">返回</a><BR>");
		} else {
			out.println("祝贺您，权限成功。<BR>");
			out.println("<a href=\"" + context + "/role_query.jsp\">返回</a><BR>");
		}
	}
%>
<%@ include file="/footer.jsp"%>
