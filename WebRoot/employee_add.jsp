<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/header.jsp"%>
<style>
* {	font-family: "宋体"; font-size: 14px }
</style>

<p align="center">
	添加员工
</p>
<p align="center">
	<a href="<%=context%>/query.jsp">查看员工信息</a>
</p>
<form id="form1" name="form1" method="post"
	action="<%=context%>/addEmployeeHandler.jsp"
	>
	<table width="650" height="200" border="0" align="center">
		<tr>
			<td width="150">EmployeeID：</td>
			<td width="500">
				<input name="EmployeeID" type="text" id="EmployeeID" size="40" maxlength="20" />
			</td>
		</tr>
		<tr>
			<td>EmployeeName：</td>
			<td>
				<input name="EmployeeName" type="text" id="EmployeeName" size="40" maxlength="40" />
			</td>
		</tr>
		<tr>
			<td>Sex：</td>
			<td>
				<input name="Sex" type="text" id="Sex" size="40" maxlength="20" />
			</td>
		</tr>
		<tr>
			<td>BirthDay：</td>
			<td>
				<input name="BirthDay" type="text" id="BirthDay" size="40" maxlength="20" />
			</td>
		</tr>
			<tr>
			<td>Phone：</td>
			<td>
				<input name="Phone" type="text" id="Phone" size="40" maxlength="20" />
			</td>
		</tr>
		<tr>
			<td>DegreeID：</td>
			<td>
				<input name="DegreeID" type="text" id="DegreeID" size="40" maxlength="20" />
			</td>
		</tr>
			<tr>
			<td>HireDate：</td>
			<td>
				<input name="HireDate" type="text" id="HireDate" size="40" maxlength="20" />
			</td>
		</tr>
			<tr>
			<td>EmployeeTypeID：</td>
			<td>
				<input name="EmployeeTypeID" type="text" id="EmployeeTypeID" size="40" maxlength="20" />
			</td>
		</tr>
			<tr>
			<td>DepartmentID：</td>
			<td>
				<input name="DepartmentID" type="text" id="DepartmentID" size="40" maxlength="20" />
			</td>
		</tr>
			<tr>
			<td>Title：</td>
			<td>
				<input name="Title" type="text" id="Title" size="40" maxlength="20" />
			</td>
		</tr>
			<tr>
			<td>Salary：</td>
			<td>
				<input name="Salary" type="text" id="Salary" size="40" maxlength="20" />
			</td>
		</tr>
		<tr>
			<td>ManagerID：</td>
			<td>
				<input name="ManagerID" type="text" id="ManagerID" size="40" maxlength="20" />
			</td>
		</tr>
		<tr>
			
			<td>

			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" name="Submit" value="提交" />
				<input type="reset" name="Reset" value="重置" />
			</td>
		</tr>
	</table>
</form>
<%@ include file="/footer.jsp"%>
