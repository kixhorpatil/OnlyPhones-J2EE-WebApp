<%@page import="com.entity.MobileDtls"%>
<%@page import="com.dao.MobileDAOImpl"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OnlyPhones</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	int mid = Integer.parseInt(request.getParameter("mid"));
	MobileDAOImpl dao = new MobileDAOImpl(DBConnect.getconn());
	MobileDtls m = dao.getMobileById(mid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">

				<img alt="" src="mobile/<%=m.getPhotoName()%>"
					style="height: 150px; width: 150px" /> <br>
				<h4 class="mt-3">
					Mobile Name <span class="text-success"><%=m.getMobileName()%></span>
				</h4>
				<h4>
					Brand: <span class="text-success"><%=m.getBrand()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=m.getMobileCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=m.getMobileName()%></h2>

				<%
				if ("Old".equals(m.getMobileCategory())) {
				%>
				<h5>Contact to Seller</h5>
				<h5>
					<i class="fa-solid fa-envelope"></i> Email:<%=m.getEmail()%></h5>
				<%
				}
				%>


				<div class="row">

					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<%
				if ("Old".equals(m.getMobileCategory())) {
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i
						class="fa-solid fa-cart-plus"></i> Continue Shopping</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i> <%=m.getPrice()%></a>
				</div>
				<%
				} else {
				%>


				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-plus"></i> Add to cart</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i><%=m.getPrice()%></a>
				</div>
				<%
				}
				%>
			</div>
		</div>

	</div>

</body>
</html>