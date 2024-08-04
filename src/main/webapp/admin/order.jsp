<%@page import="com.entity.Mobile_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.MobileOrderImpl"%>
<%@page import="com.dao.MobileOrderDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OnlyPhones: Admin</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>


	<h3 class="text-center">Hello Admin</h3>

	<table class="table">
		<thead class="bg-warning">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Mobile Name</th>
				<th scope="col">Brand</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>

			</tr>
		</thead>
		<tbody>
			<%
			MobileOrderImpl dao = new MobileOrderImpl(DBConnect.getconn());
			List<Mobile_Order> mlist = dao.getAllOrder();
			for (Mobile_Order m : mlist) {
			%>
			<tr>
				<th scope="row"><%=m.getOrderId()%></th>
				<td><%=m.getUserName()%></td>
				<td><%=m.getEmail()%></td>
				<td><%=m.getFulladd()%></td>
				<td><%=m.getPhno()%></td>
				<td><%=m.getMobileName()%></td>
				<td><%=m.getBrand()%></td>
				<td><%=m.getPrice()%></td>
				<td><%=m.getPaymentType()%></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>

</body>
</html>