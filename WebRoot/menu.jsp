<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 
<%@ include file="/header.jsp"%><div id="logout">
<%out.println("USERID:"+session.getAttribute("ID"));%>&nbsp;
<a href="<%=context%>/loginout.jsp">退出登录</a>
<a href="<%=context%>/multivaluequery.jsp" target="showframe">首页查询</a></div>
<img id="head" src="Picture.jpg"  width="1210" height="60"/>
<style>
* {font-family: "宋体";font-size: 14px}
#menu{float:left;}
#showframe{height:500;
			width:1200;
}
#logout{float:left; height:60px;width:10%;}
#head{
	float:right;height:60px;
	width:90%;
	font:25px/30px;
}
ul
{
list-style-type:none;
margin:0;
padding:0;
}
a:link,a:visited
{
display:block;
font-weight:bold;
color:#FFFFFF;
background-color:#bebebe;
width:120px;
text-align:center;
padding:4px;
text-decoration:none;
text-transform:uppercase;
}
a:hover,a:active
{
background-color:#cc0000;
}
</style>
<div id="menu">
<jsp:useBean id="db"
             scope="page"
             class="util.DB" />
             <br>
             <br>
             <br>
             <br>
             <br>
             <br><br><br>
	<br><%String EmployeeID=""; %>
	<a href="<%=context%>/personal_query.jsp?EmployeeID=<%=session.getAttribute("ID")%>"target=showframe > 个人信息查询</a>
	
	<%
		
		String sql = "select * from v_EmployeeInformation";
		Connection conn = null;
		response.setContentType("text/html;charset=utf-8");
		try {
			
			conn = db.getConn();
			Statement pstmt = db.getStmt(conn);
			ResultSet r_rs=db.getRs(pstmt,"select * from v_roles where v_roles.EmployeeID="+session.getAttribute("ID")+";");
			while(r_rs.next()){
			int Auth_Authority=r_rs.getInt("Auth_Authority");
			int Auth_Info=r_rs.getInt("Auth_Info"); 
			int Auth_Job=r_rs.getInt("Auth_Job");
			int Auth_Attendance=r_rs.getInt("Auth_Attendance");
			int Auth_Training=r_rs.getInt("Auth_Training");
			int Auth_Evaluation=r_rs.getInt("Auth_Evaluation");
			int Auth_RP=r_rs.getInt("Auth_RP");
			int Auth_Role=r_rs.getInt("Auth_Role");
			int Auth_Encrypt=r_rs.getInt("Auth_Encrypt");
			if(Auth_Authority==1){
				session.setAttribute("Auth_Authority","1");
			out.println("<a href=\"" + context + "/userrole.jsp\" target=showframe >员工角色分配</a>");
			}
			if(Auth_Info==1){
			session.setAttribute("Auth_Info","1");
			}
		//	out.println("<a href=\"" + context + "/query.jsp\">信息管理</a><BR><br>");
			if(Auth_Job==1){
				session.setAttribute("Auth_Job","1");
			}
			out.println("<a href=\"" + context + "/query.jsp \" target=showframe >人事管理</a>");
			if(Auth_Attendance==1){
				session.setAttribute("Auth_Attendance","1");
			}
			out.println("<a href=\"" + context + "/attendance_query.jsp\"target=showframe >考勤管理</a>");
			if(Auth_Training==1){
			session.setAttribute("Auth_Training","1");
			}
			out.println("<a href=\"" + context + "/training_query.jsp\"target=showframe >培训管理</a>");
			if(Auth_Evaluation==1){
				session.setAttribute("Auth_Evaluation","1");
			}
			out.println("<a href=\"" + context + "/evaluation_query.jsp\"target=showframe >考核管理</a>");
			if(Auth_RP==1){
				session.setAttribute("Auth_RP","1");
				}
			out.println("<a href=\"" + context + "/rewardandpunishment_query.jsp\"target=showframe >奖惩管理</a>");
			if(Auth_Role==1){
				session.setAttribute("Auth_Role","1");
			out.println("<a href=\"" + context + "/role_query.jsp\"target=showframe >角色管理</a>");
			}
			if(Auth_Encrypt==1){
			session.setAttribute("Auth_Encrypt","1");
			out.println("<a href=\"" + context + "/password_query.jsp\"target=showframe >用户密码管理</a>");
			}
			}
			r_rs.close();	
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
	%>
	<br><br>
	<br>
</div>
<iframe id="showframe" name="showframe" src="query.jsp" >
</iframe>
<p align="center">
Copyright &copy;2015 </p>
<%@ include file="/footer.jsp"%>