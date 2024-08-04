<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.CartDAOImpl"%>
<%@page import="com.entity.User"%>
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

<!-- Redirect to login if no user is logged in -->
<c:if test="${empty userobj}">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>

</head>

<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<!-- Success and Failure Messages -->
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="container">
		<div class="row">
			<!-- Selected Items Section -->
			<div class="col-md-6 mt-4 mb-5">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center" style="color: brown">Your Selected
							Item</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Mobile Name</th>
									<th scope="col">Brand</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getconn());
								List<Cart> cart = dao.getMobileByUser(u.getId());
								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice += c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getMobileName()%></th>
									<td><%=c.getBrand()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_mobile?mid=<%=c.getMid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- User Details and Order Form Section -->
			<div class="col-md-6 mt-4 mb-5">
				<div class="card">
					<div class="card-body p-2"></div>
					<h3 class="text-center" style="color: brown">Your Details for
						Order</h3>
					<form action="order" method="post" class="px-3">
						<input type="hidden" value="${userobj.id}" name="id" required>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Name</label> <input type="text"
									name="username" class="form-control" id="inputEmail4"
									value="${userobj.name}" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Email</label> <input type="email"
									name="email" class="form-control" id="inputPassword4"
									value="${userobj.email}" required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Phone Number</label> <input
									type="number" name="phno" class="form-control" id="inputEmail4"
									value="${userobj.phno}" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Address</label> <input type="text"
									name="address" class="form-control" id="inputPassword4"
									required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Landmark</label> <input type="text"
									name="landmark" class="form-control" id="inputEmail4" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">City</label> <input type="text"
									name="city" class="form-control" id="inputPassword4" required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">State</label> <input type="text"
									name="state" class="form-control" id="inputEmail4" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Pin Code</label> <input type="text"
									name="pincode" class="form-control" id="inputPassword4"
									required>
							</div>
						</div>

						<div class="form-group">
							<label>Payment Mode</label> <select class="form-control"
								name="payment">
								<option value="noselect">--Select--</option>
								<option value="COD">Cash On Delivery</option>
							</select>
						</div>

						<div class="text-center">
							<button class="btn btn-warning mb-3">Order Now</button>
							<a href="index.jsp" class="btn btn-success mb-3">Continue
								Shopping</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
