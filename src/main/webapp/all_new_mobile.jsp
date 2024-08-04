<%@page import="com.entity.User"%>
<%@page import="com.entity.MobileDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.MobileDAOImpl"%>
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
.back-img {
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -150px; /* Adjusted to center the toast */
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {from { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
	<!-- Getting the user object to check whether user is logged in or not -->
	<%
	User u = (User) session.getAttribute("userobj");
	%>


	<c:if test="${not empty addCart}">
		<div id="toast">${addCart}</div>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
    function showToast(content) {
        $('#toast').html(content); 
        $('#toast').addClass("display"); 
        setTimeout(() => { 
            $('#toast').removeClass("display"); 
        }, 3000); // 3000ms to match the animation timing
    }

    // Call the function with the content from the server-side
    $(document).ready(function() {
        showToast("${addCart}");
    });
    </script>


		<c:remove var="addCart" scope="session" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%
			MobileDAOImpl dao = new MobileDAOImpl(DBConnect.getconn());
			List<MobileDtls> list = dao.getAllNewMobile();
			for (MobileDtls m : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3 ">
					<div class="card-body text-center">
						<img src="mobile/<%=m.getPhotoName()%>" alt=""
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=m.getMobileName()%></p>
						<p><%=m.getBrand()%></p>
						<p>
							Category:
							<%=m.getMobileCategory()%></p>
						<div class="row ml-auto">
							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i> Cart </a>
							<%
							} else {
							%>

							<a href="cart?mid=<%=m.getMobileId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i> Cart </a>

							<%
							}
							%>


							<a href="view_mobiles.jsp?mid=<%=m.getMobileId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=m.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>
