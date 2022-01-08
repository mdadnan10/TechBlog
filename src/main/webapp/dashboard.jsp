<%@ page errorPage="errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- My CSS -->
<link type="text/css" rel="stylesheet" href="css/mystyle.css">

<!-- Font awesome -->
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v6.0.0-beta3/css/all.css">

</head>
<body>

	<!-- nav bar -->
	<%@include file="loggedinnavbar.jsp"%>
	
	<!-- Contact Modal -->
	<%@include file="contact.jsp"%>

	<!-- Create post -->
	<%@include file="createpost.jsp"%>
	
	<!-- Profile -->
	<%@include file="profile.jsp"%>

	<!-- main body of the page -->
	<main>
		<div class="container">
			<div class="row mt-3">

				<!-- first half category -->
				<div class="col-md-4">
					<div class="list-group">

						<a href="#" onclick="getPosts(0, this)"
							class="c-link list-group-item list-group-item-action active">All
							Posts</a>

						<%
						for (Category c : list) {
						%>

						<a href="#" onclick="getPosts(<%=c.getcId()%>, this)"
							class="c-link list-group-item list-group-item-action "> <%=c.getcName()%>
						</a>

						<%
						}
						%>

					</div>
				</div>

				<!-- Second half post -->
				<div class="col-md-8">

					<div class="container text-center"
						style="color: #2196f3 !important" id="post-loader">
						<i class="far fa-sync-alt fa-spin fa-3x"></i>
						<h4 class="mt-2">Loading your posts...</h4>
					</div>
					<div class="container-fluid mt-2" style="overflow-y: scroll; height:88vh;" id="post-container"></div>
				</div>

			</div>
		</div>
	</main>

	<!-- footer -->
	<%@ include file="footer.jsp" %>

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

	<!-- loading post using ajax -->
	<script type="text/javascript">
		function getPosts(catId, clicked) {
			$('#post-loader').show();
			$('#post-container').hide();
			
			$(".c-link").removeClass('active');
			
			$.ajax({
				url : "loadposts.jsp",
				data : {
					cid : catId
				},
				success : function(data, textStatus, jqXHR) {
					$('#post-loader').hide();
					$('#post-container').show();
					$('#post-container').html(data);
					$(clicked).addClass('active');
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$('#post-container').html(jqXHR);
				}
			});
		}
		$(document).ready(function(e) {
			let allPostRef = $('.c-link')[0];
			getPosts(0, allPostRef);
		});
	</script>

</body>
</html>