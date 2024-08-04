<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<div class="container-fluid"
	style="height: 10px; background-color: #28a745"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<a href="/onlyphones" style="text-decoration: none;">
			<h3 style="font-family: sans-serif; color: black;">
				<strong style="margin-left: 15px;">Only</strong>Phones
			</h3>
		</a>

		<!-- Move the logout button to the right side href="home.jsp"  -->
		<div class="col-md-3 ml-auto">
			<c:if test="${not empty userobj }">
				<a class="btn btn-success text-white"><i
					class="fa-fa-user"></i><i class="fa-solid fa-user-tie"></i>
					${userobj.name}</a>
				<a data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-danger text-white"><i class="fas fa-sign-in-alt"></i>
					Logout</a>
			</c:if>
			<c:if test="${empty userobj }">
				<a href="../login.jsp" class="btn btn-success"><i
					class="fas fa-sign-in-alt"></i> Login</a>
				<a href="../register.jsp" class="btn btn-custom text-white"><i
					class="fas fa-user-plus"></i> Register</a>
			</c:if>
		</div>
	</div>
</div>


<!-- Logout Modal Begins -->

<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Do you want to Logout</h4>

					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="../logout" type="button" class="btn btn-danger text-white">Logout</a>
				</div>

			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>

<!-- Logout Modal Ends -->

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house-user"></i></a>
	<!-- Home Icon Tag -->
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp">Home<span
					class="sr-only">(current)</span></a></li>
		</ul>
	</div>
</nav>
