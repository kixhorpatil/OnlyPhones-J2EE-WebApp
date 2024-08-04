<%@page import="com.dao.MobileDAOImpl"%>
<%@page import="com.entity.Mobile_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.MobileOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f0f1f2;">

	<!-- For securing the page so that user cannot access without logging into the website -->
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<h4 class="text-center text-danger p-2">Your Orders</h4>

		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Mobile No</th>
					<th scope="col">Brand</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u = (User) session.getAttribute("userobj");
				MobileOrderImpl dao = new MobileOrderImpl(DBConnect.getconn());
				List<Mobile_Order> mlist = dao.getMobile(u.getEmail());
				for (Mobile_Order m : mlist) {
				%>
				<tr>
					<th scope="row"><%=m.getOrderId()%></th>
					<td><%=m.getUserName()%></td>
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
	</div>

</body>
</html>