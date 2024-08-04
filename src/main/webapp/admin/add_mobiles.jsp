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
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Mobiles</h4>
						
						<!-- Showing the message on UI -->
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg} </p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-success">${failedMsg} </p>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>

						<!-- Coming out of add_books with multipart we take binary data as input -->
						<form action="../add_mobiles" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Mobile Name</label> <input
									type="text" name="mname" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Brand</label> <input
									type="text" name="brand" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Price</label> <input
									type="number" name="price" class="form-control"
									id="exampleInputPassword1">
							</div>


							<div class="form-group">
								<label for="inputState">Mobile Category</label> <select
									id="inputState" name="mtype" class="form-control">
									<option selected>--select--</option>
									<option value="New">New</option>
									<option value="Old">Old</option>
								</select>
							</div>


							<div class="form-group">
								<label for="inputState">Mobile Status</label> <select
									id="inputState" name="mstatus" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>


							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									type="file" name="mimg" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-success">Add</button>


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