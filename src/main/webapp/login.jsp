<%@page import="entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorpage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

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
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 63% 99%, 22% 94%, 0 100%, 0 0);
}
</style>

</head>
<body>

	<!-- navbar -->
	<%@include file="navbar.jsp"%>

	<!-- Contact Modal -->
	<%@include file="contact.jsp"%>


	<main class="mycard-form primary-bg banner-bg">
		<div class="conatiner">
			<div class="row">
				<div class="col-md-4 offset-md-4">

					<div class="card">
						<h5 class="card-header primary-bg text-white text-center">
							<i class="fad fa-user-circle fa-2x"></i> <br> Login Here
						</h5>

						<%
						Message msg = (Message) session.getAttribute("msg");
						if (msg != null) {
						%>

						<div class="alert <%=msg.getCssClass()%>" role="alert">
							<%=msg.getContent()%>
						</div>

						<%
						session.removeAttribute("msg");
						}
						%>

						<div class="card-body">

							<form id="login-form" action="LoginServlet" method="POST">
								<div class="form-floating mb-3">
									<input type="email" class="form-control" id="floatingEmail"
										placeholder="name@example.com" name="email"
										required="required"> <label for="floatingEmail">Email
										address</label>
								</div>

								<div class="form-floating mb-3">
									<input type="password" class="form-control"
										id="floatingPassword" placeholder="password" name="password"
										required="required"> <label for="floatingPassword">Password</label>
								</div>

								<!-- 
								<div class="mb-3 form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Check me out</label>
								</div>
								-->

								<div class="text-center"
									style="color: #2196f3 !important; display: none" id="loader">
									<i class="far fa-sync-alt fa-spin fa-2x"></i>
									<h5>Please wait...</h5>
								</div>

								<div class="text-center">
									<button type="submit"
										class="btn btn-primary primary-bg text-center" id="btn">Login</button>
								</div>
							</form>

						</div>
						<div class="card-footer primary-bg text-white">
							<p class="text-center">
								Forget your password? <a href="recover.jsp"
									class="text-warning text-decoration-none">Recover here</a>
							</p>
							<p class="text-center">
								Dont have an account? <a href="signup.jsp"
									class="text-warning text-decoration-none">Sign Up here</a>
							</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</main>

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