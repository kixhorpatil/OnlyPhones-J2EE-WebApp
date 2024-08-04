
<%@page import="com.entity.User"%>
<%@page import="com.entity.MobileDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.MobileDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
</style>

</head>
<body>

	<!-- Getting the user object to check whether user is logged in or not -->
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%
			String ch = request.getParameter("ch"); //get search wrt to ch
			MobileDAOImpl dao = new MobileDAOImpl(DBConnect.getconn());
			List<MobileDtls> list = dao.getMobileBySearch(ch);
			for (MobileDtls m : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img src="mobile/<%=m.getPhotoName()%>" alt=""
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=m.getMobileName()%></p>
						<p><%=m.getBrand()%></p>
						<%
						if (m.getMobileCategory().equals("Old")) {
						%>
						<p>
							Category:<%=m.getMobileCategory()%></p>
						<a href="view_mobiles.jsp?mid=<%=m.getMobileId()%>"
							class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
							class="btn btn-danger btn-sm ml-1"><%=m.getPrice()%></a>
						<%
						} else {
						%>
						<p>
							Category:
							<%=m.getMobileCategory()%></p>

						<!-- For centering the buttons ml-auto-->
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
						<%
						}
						%>
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