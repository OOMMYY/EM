<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/header.jsp"%>
<%request.setCharacterEncoding("utf-8"); %>
<style>
span {
	font-weight:bold;
	
	color:#ff9955;
	}
input[type="text"]{
	margin-right:auto;
	backgroud-color:#b0e0e6;
}
div#form{
	position:absolute;
	right:500;
	top:100;
	backgroud-color:#b0e0e6;
}
</style>
<head>
</head>
<div id="form">
<form action="multivaluequeryHandler.jsp" method="post">
<table>
<tr><td>EmployeeID </td><td><input  type="text" id="Employee" name="EmployeeID" size=20></td></tr>
<tr><td>EmployeeName</td><td><input   type="text" id="EmployeeName" name="EmployeeName" size=20/></td></tr>
<tr><td>Sex</td><td><input  id="Sex" name="Sex"  type="text" size=20></td></tr>
<tr><td>BirthDay</td><td><input  id="BirthDay" name="BirthDay" type="text"  size=20></td></tr>
<tr><td>Phone</td><td><input  id="Phone" name="Phone" size=20></td></tr>
<tr><td>DegreeName</td><td><input  id="DegreeName" name="DegreeName"  type="text" size=20></td></tr>
<tr><td>HireDate</td><td><input  id="HireDate" name="HireDate"  type="text" size=20></td></tr>
<tr><td>DepartmentName</td><td><input  id="DepartmentName" name="DepartmentName" type="text"  size=20></td></tr>
<tr><td>Title</td><td><input   type="text" id="Title" name="Title" size=20></td></tr>
<tr><td>Salary</td><td><input  type="text"  id="Salary" name="Salary" size=20></td></tr>
<tr><td><input type="reset" id="reset" value="重置" ></td><td><input type="submit" id="submit"  value="查询" ></td></tr>
</table>
</form>
</div>
<%@ include file="footer.jsp"%>
