<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OnlyPhones</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Login</h3>

						<!-- Display the failedMsg -->
						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>


						<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<!-- Bootstrap -->
						<form action="login" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">
								<!-- Declaring the attribute line name="email" -->
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>


							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleInputCheck1"> <label
									class="form-check-label" for="exampleInputCheck1">Remember
									me</label>
							</div>


							<div class="text-center">
								<button type="submit" class="btn btn-success mt-2 mb-2">Log
									in</button>
								<br /> <span style="color: purple">Don't have an
									account? </span> <a href="register.jsp" style="color: black;"> <span
									style="color: black; text-decoration: underline;">Register</span>
								</a>
							</div>


						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<footer class="footer">
		<div style="margin-top: 80px;">
			<%@include file="all_component/footer.jsp"%>
		</div>

	</footer>
</body>
</html>
