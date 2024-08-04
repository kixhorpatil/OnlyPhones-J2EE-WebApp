<%@page import="com.entity.MobileDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.mysql.cj.Session"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.MobileDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OnlyPhones</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<h4 class="text-center text-danger p-2">Old Mobile For Sale</h4>

		<%-- Display success message if not empty --%>
		<c:if test="${not empty succMsg }">
			<div class="alert alert-success">
				<p class="text-center text-success">${succMsg}</p>
			</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Mobile Name</th>
					<th scope="col">Brand</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();

				MobileDAOImpl dao = new MobileDAOImpl(DBConnect.getconn());
				List<MobileDtls> list = dao.getMobileByOld(email, "Old");

				if (list == null || list.isEmpty()) {
					out.println("<tr><td colspan='5' class='text-center'>No old mobile available for sale</td></tr>");
				} else {
					for (MobileDtls m : list) {
				%>
				<tr>
					<td><%=m.getMobileName()%></td>
					<td><%=m.getBrand()%></td>
					<td><%=m.getPrice()%></td>
					<td><%=m.getMobileCategory()%></td>
					<td><a
						href="delete_old_mobile?em=<%=email%>&&id=<%=m.getMobileId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				}
				%>


			</tbody>
		</table>
	</div>

</body>
</html>