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

<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: orange;
}
</style>

</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<h2 class="text-center p-2">Hello, ${userobj.name}</h2>
		<div class="row p-3">
			<div class="col-md-4">
				<a href="sell_mobile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-mobile-screen-button fa-3x"></i>
							</div>
							<h3>Sell Old Mobile</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="old_mobile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div style="color: coral">
								<i class="fa-solid fa-mobile-screen-button fa-3x"></i>
							</div>
							<h3>Old Mobile</h3>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-info">
								<i class="fa-solid fa-address-card fa-3x"></i>
							</div>
							<h3>Edit Profile</h3>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div style="color: brown;">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h3>Your Order</h3>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<!--  <div style="color: brown;">-->
							<div class="text-success">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h3>Help Center</h3>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>


		</div>
	</div>

	<!-- Footer -->
	<div>
		<%@include file="all_component/footer.jsp"%>
	</div>
	<!-- End of Footer -->
</body>
</html>
