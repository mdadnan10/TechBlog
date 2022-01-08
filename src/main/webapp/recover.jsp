<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page errorPage="errorpage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recover</title>

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
	clip-path: polygon(50% 0%, 100% 0, 100% 96%, 59% 96%, 25% 100%, 0 94%, 0 0);
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
							<i class="fad fa-unlock fa-2x"></i> <br> Recover your
							password
						</h5>
						<div class="card-body">

							<form id="recover-form" action="RecoverServlet" method="POST">

								<div class="form-floating mb-3">
									<input type="email" class="form-control" id="floatingEmail"
										placeholder="name@example.com" name="recover_email"
										required="required"> <label for="floatingEmail">Registered
										Email </label>
								</div>

								<div class="form-floating mb-3">
									<input type="text" class="form-control" id="floatingName"
										placeholder="Enter your registered name" name="recover_name"
										required="required"> <label for="floatingName">Registered
										Name</label>
								</div>

								<div class="form-floating mb-3">
									<input type="password" class="form-control"
										id="floatingPassword" placeholder="password"
										name="recover_password" required="required"> <label
										for="floatingPassword">New Password</label>
								</div>

								<div class="text-center"
									style="color: #2196f3 !important; display: none" id="loader">
									<i class="far fa-sync-alt fa-spin fa-2x"></i>
									<h5>Please wait...</h5>
								</div>

								<div class="text-center">
									<button type="submit"
										class="btn btn-primary primary-bg text-center">Recover</button>
								</div>
							</form>

						</div>
						<div class="card-footer primary-bg text-white"></div>
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