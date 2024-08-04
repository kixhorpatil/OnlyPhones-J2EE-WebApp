<%@page import="com.entity.User"%>
<%@page import="com.entity.MobileDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.MobileDAOImpl"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>OnlyPhones</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/iphone-15.jpg");
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}

.card {
	border: 1px solid #ddd;
	border-radius: 8px;
	overflow: hidden;
	margin: 6px; /* Space between cards */
	flex: 1 1 calc(25% - 20px); /* Adjust width with space */
	max-width: calc(25% - 20px); /* Adjust width with space */
}

.card img {
	width: 100%;
	height: auto;
}

.card-body {
	padding: 20px;
	text-align: center;
}

.d-flex {
	display: flex;
}

.flex-wrap {
	flex-wrap: wrap; /* Allow wrapping if needed */
}

.justify-content-around {
	justify-content: space-between; /* Ensure space between items */
}
</style>
</head>

<body style="background-color: #f7f7f7;">

	<!-- Getting the user object to check whether user is logged in or not -->
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img">
		<h2 class="text-center text-white mt-3"
			style="color: black !important; font-weight: bold;">iPhone 15</h2>
	</div>

	<!-- Start New Mobiles -->
	<div class="container">
		<h3 class="text-center mt-3"
			style="font-family: sans-serif; font-weight: bold; color: black;">Latest
			Mobiles</h3>
		<div class="d-flex flex-wrap justify-content-around">
			<%
			MobileDAOImpl dao = new MobileDAOImpl(DBConnect.getconn());
			List<MobileDtls> list = dao.getNewMobile();
			for (MobileDtls m : list) {
			%>
			<div class="card">
				<div class="card-body">
					<img src="mobile/<%=m.getPhotoName()%>" alt="">
					<p><%=m.getMobileName()%></p>
					<p><%=m.getBrand()%></p>
					<p>
						Category:
						<%=m.getMobileCategory()%></p>
					<div class="d-flex justify-content-around">
						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm"><i
							class="fa-solid fa-cart-plus"></i> Cart </a>
						<%
						} else {
						%>
						<a href="cart?mid=<%=m.getMobileId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger  btn-sm"><i
							class="fa-solid fa-cart-plus"></i> Cart </a>
						<%
						}
						%>
						<a href="view_mobiles.jsp?mid=<%=m.getMobileId()%>"
							class="btn btn-success btn-sm">View Details</a> <a href=""
							class="btn btn-danger btn-sm"><%=m.getPrice()%> <i
							class="fa-solid fa-indian-rupee-sign"></i></a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-3">
			<a href="all_new_mobile.jsp" class="btn btn-danger btn-sm"
				style="background-color: black;">View All</a>
		</div>
	</div>
	<!-- End of New Mobile -->

	<hr>

	<!-- Start Old Mobile -->
	<div class="container">
		<h3 class="text-center mt-3"
			style="font-family: sans-serif; font-weight: bold; color: black;">Old
			Mobiles</h3>
		<div class="d-flex flex-wrap justify-content-around">
			<%
			MobileDAOImpl dao3 = new MobileDAOImpl(DBConnect.getconn());
			List<MobileDtls> list3 = dao3.getOldMobile();
			for (MobileDtls m : list3) {
			%>
			<div class="card">
				<div class="card-body">
					<img src="mobile/<%=m.getPhotoName()%>" alt="">
					<p><%=m.getMobileName()%></p>
					<p><%=m.getBrand()%></p>
					<p>
						Category:
						<%=m.getMobileCategory()%></p>
					<div class="d-flex justify-content-around">
						<a href="view_mobiles.jsp?mid=<%=m.getMobileId()%>"
							class="btn btn-success btn-sm">View Details</a> <a href=""
							class="btn btn-danger btn-sm"><%=m.getPrice()%> <i
							class="fa-solid fa-indian-rupee-sign"></i></a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-3">
			<a href="all_old_mobile.jsp" class="btn btn-danger btn-sm"
				style="background-color: black;">View All</a>
		</div>
	</div>
	<!-- End of Old Mobile -->

	<hr>

	<!-- Footer -->
	<div>
		<%@include file="all_component/footer.jsp"%>
	</div>
	<!-- End of Footer -->
</body>
</html>
