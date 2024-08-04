<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: black;"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<a href="/onlyphones" style="text-decoration: none;">
				<h2 style="font-family: sans-serif; color: black;">
					<strong>Only</strong>Phones
				</h2>
			</a>
		</div>

		<!-- name=ch action=searchMobile and it will talk to search mbile servlet -->
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp"
				method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search" />
				<button class="btn btn-custom my-2 my-sm-0"
					style="background-color: black; color: white;" type="submit">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</form>
		</div>

		<!-- when user is logged in  -->
		<c:if test="${not empty userobj }">
			<div class="col-md-3">
				<a href="checkout.jsp" class="btn"
					style="color: brown; padding: 0; margin: 1px;"> <i
					class="fa-solid fa-cart-plus fa-2x"></i>
				</a> <a href="login.jsp" class="btn btn-success"
					style="background-color: Emerald;"> <i
					class="fa-solid fa-user-plus"></i> ${userobj.name}
				</a> <a href="logout" class="btn btn-custom text-white"
					style="background-color: RED;"> <i
					class="fa-solid fa-arrow-right-to-bracket"></i> Logout
				</a>
			</div>
		</c:if>


		<!-- when user is not logged in  -->
		<c:if test="${empty userobj }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"
					style="background-color: Emerald;"><i
					class="fa-solid fa-arrow-right-to-bracket"></i> Login</a> <a
					href="register.jsp" class="btn  text-white"
					style="background-color: Black;"><i
					class="fa-solid fa-user-plus"></i> Register</a>
			</div>
		</c:if>



	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark "
	style="background-color: black;">
	<a class="navbar-brand" href="../onlyphones"><i
		class="fa-solid fa-house-user"></i></a>
	<!-- Home Icon Tag -->
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse " id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link "
				href="/onlyphones">Home<span class="sr-only">(current)</span></a></li>

			<li class="nav-item active .btn-custom:hover"><a
				class="nav-link" href="all_new_mobile.jsp"><i
					class="fa-solid fa-mobile-screen-button"></i> Latest Mobile</a></li>

			<li class="nav-item active .btn-custom:hover"><a
				class="nav-link disabled" href="all_old_mobile.jsp"><i
					class="fa-solid fa-mobile-screen-button"></i> Old Mobile</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">

			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"> <i class="fa-solid fa-gear"></i> Setting
			</a> <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-1"
				type="submit"> <i class="fa-solid fa-square-phone"></i> Contact
				us
			</a>

		</form>
	</div>
</nav>
