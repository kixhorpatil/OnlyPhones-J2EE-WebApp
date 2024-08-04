<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OnlyPhones</title>

<!-- Including CSS -->
<%-- Including common CSS file --%>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">

	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Create an account on onlyphones.in</h4>

						<%-- Display success message if not empty --%>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<%-- Display error message if not empty --%>
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger ">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<!-- Registration Form -->
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter full name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname" />
								<%-- Taking input by passing the attribute name --%>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email" />
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Phone no</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno" />
								<%-- Getting data into DB with the attribute name --%>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password" />
							</div>

							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1" required="required" /> <label
									class="form-check-label" for="exampleCheck1">I agree to
									Javademy's Terms of Service and Privacy Policy.</label>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-custom mt-2 mb-2"
									style="background-color: black;">Register</button>
								<br /> <span>Already have an account? </span> <a
									href="login.jsp" style="color: black"> <span
									style="color: #28a745; text-decoration: underline">Log
										in</span>
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

   <!-- Footer -->
	<div class="footer">
		<%@include file="all_component/footer.jsp"%>
	</div>

</body>
</html>
