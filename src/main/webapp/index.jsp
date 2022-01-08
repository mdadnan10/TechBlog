<%@page import="dao.PostDao"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page errorPage="errorpage.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tech Blog</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- My CSS -->
<link type="text/css" rel="stylesheet" href="css/mystyle.css">

<!-- Font awesome -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v6.0.0-beta3/css/all.css">

<style type="text/css">
.banner-bg {
	clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 95%, 77% 100%, 50% 95%, 23% 100%,
		0 94%, 0% 35%, 0 0);
}
</style>

</head>
<body>

	<!-- navbar -->
	<%@include file="navbar.jsp"%>

	<!-- Contact Modal -->
	<%@include file="contact.jsp"%>

	<!-- Banner -->
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-bg mybanner text-white banner-bg">
			<div class="container">
				<h3 class="display-5 welcome">Welcome to Tech Blog</h3>
				<p>Welcome to technical blog, world of technology Computer
					programming is the process of designing and building an executable
					computer program to accomplish a specific computing result or to
					perform a particular task.</p>
				<p>Programming involves tasks such as analysis, generating
					algorithms, profiling algorithms' accuracy and resource
					consumption.</p>

				<a href="signup.jsp" class="btn btn-outline-light mt-2"> <i
					class="fas fa-user-plus"></i> Start ! It's Free
				</a> <a href="login.jsp" class="btn btn-outline-light mt-2"> <i
					class="fad fa-user-circle fa-spin"></i> Login
				</a>
				<div class="banner-bottom"></div>
			</div>
		</div>
	</div>

	<br>

	<!-- cards -->
	<div class="container">
		<div class="row">

			<%
			PostDao postDao = new PostDao(ConnectionProvider.getConnection());
			List<Post> posts = postDao.getAllPost();

			for (Post p : posts) {
			%>


			<div class="col-md-4 mb-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"><%=p.getpTitle()%></h5>
						<p class="card-text"><%=p.getpContent()%></p>
						<a href="IndexServlet?post_id=<%=p.getpId()%>"
							class="btn primary-bg text-white">Read more...</a>
					</div>
				</div>
			</div>

			<%
			}
			%>


		</div>
	</div>
	<br>

	<%@include file="footer.jsp"%>

	<!--Bootstrap CDN -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>

	<!-- JQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

	<!-- Sweet Alert CDN -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<!-- My JS -->
	<script type="text/javascript" src="js/myjs.js"></script>

</body>
</html>