<%@page import="com.entity.MobileDtls"%>
<%@page import="com.dao.MobileDAOImpl"%>
<%@page import="com.db.DBConnect"%>
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
<body style="background-color: #f0f2f2;">

	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Mobiles</h4>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						MobileDAOImpl dao = new MobileDAOImpl(DBConnect.getconn());
						MobileDtls b = dao.getMobileById(id);
						%>

						<!-- Coming out of edit_books and go to the servlet with no multipart we don't take binary data as input -->
						<form action="../edit_mobiles" method="post">
							<!-- Getting the id on ui but hidding it -->
							<input type="hidden" name="id" value="<%=b.getMobileId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Mobile Name</label> <input
									type="text" name="mname" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getMobileName()%>">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Brand</label> <input type="text"
									name="brand" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=b.getBrand()%>">
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Price</label> <input
									type="number" name="price" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice()%>">
							</div>



							<!-- Removed new book  -->

							<div class="form-group">
								<label for="inputState">Mobile Status</label> <select
									id="inputState" name="mstatus" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%

									}
									%>

								</select>
							</div>

							<button type="submit" class="btn btn-success">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 20px;">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>