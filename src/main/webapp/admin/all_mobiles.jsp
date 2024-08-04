<%@page import="com.entity.MobileDtls"%>
<%@page import="java.util.List"%>
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
<title>OnlyPhones: Admin</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<!-- If no user is logged in then redirect them to the log in page -->
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h3 class="text-center">Hello Admin</h3>

	<!-- Showing the message on UI -->
	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-success">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table">
		<thead class="bg-warning">
			<tr>
				<th scope="col">Mobile Id</th>
				<th scope="col">Image</th>
				<th scope="col">Mobile Name</th>
				<th scope="col">Brand</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			MobileDAOImpl dao = new MobileDAOImpl(DBConnect.getconn());
			List<MobileDtls> list = dao.getAllMobiles();
			for (MobileDtls b : list) {
			%>
			<tr>

				<td><%=b.getMobileId()%></td>
				<td><img src="../mobile/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>

				<td><%=b.getMobileName()%></td>
				<td><%=b.getBrand()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getMobileCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_mobiles.jsp?id=<%=b.getMobileId()%>"
					class="btn btn-sm btn-primary">Edit</a> <!-- comme out and Deleting with respect to the book id -->
					<a href="../delete?id=<%=b.getMobileId()%>"
					class="btn btn-sm btn-danger">Delete</a></td>


			</tr>
			<%
			}
			%>

		</tbody>
	</table>

</body>
</html>