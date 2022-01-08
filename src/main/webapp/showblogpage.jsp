<%@page import="dao.LikeDao"%>
<%@page import="dao.UserDao"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorpage.jsp"%>
<%@page import="entities.*"%>
<%
User userSBP = (User) session.getAttribute("currentUser");
if (userSBP == null) {
	response.sendRedirect("login.jsp");
}

int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao postDao = new PostDao(ConnectionProvider.getConnection());
Post p = postDao.getPostById(postId);

UserDao userDao = new UserDao(ConnectionProvider.getConnection());
User userPost = userDao.getUserById(p.getUserId());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle()%></title>

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
.post-title {
	font-weight: 100;
	font-size: 25px;
}

.post-content {
	font-size: 20px;
}
</style>
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


	<!-- main content of the body -->
	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">

					<div class="card-header primary-bg text-white">

						<div class="row my-2">

							<div class="col-md-8">
								<div class="row">

									<div class="col-md-2">
										<img style="height: 50px; width: 55px; border-radius: 3px"
											src="img/profile/<%=userPost.getProfile()%>">
									</div>

									<div class="col-md-6">
										<p>
											<a style="text-decoration: none; color: yellow" href="#"><%=userPost.getName()%>
											</a> has Posted:
										</p>
									</div>

								</div>
							</div>

							<div class="col-md-4">
								<p><%=p.getpDate().toLocaleString()%></p>
							</div>

						</div>

						<h4 class="post-title"><%=p.getpTitle()%></h4>
					</div>

					<!-- Post Image start -->
					<%
					if (!(p.getpPic().isBlank()) || !(p.getpPic().isEmpty()) || !(p.getpPic().equals(""))) {
					%>
					<a href="img/posts/<%=p.getpPic()%>" target="_blank"><img
						src="img/posts/<%=p.getpPic()%>" class="card-img-top"
						alt="Post Images"></a>
					<%
					}
					%>
					<!-- Post Image end -->

					<div class="card-body">
						<!-- Post link start -->
						<%
						if (!(p.getpLink().isBlank()) || !(p.getpLink().isEmpty()) || !(p.getpLink().equals(""))) {
						%>
						<a style="text-decoration: none" href="<%=p.getpLink()%>"
							target="_blank">To know more click here.</a>
						<%
						}
						%>
						<br>
						<!-- Post link end -->

						<!-- post content -->
						<p class="post-content"><%=p.getpContent()%></p>

						<!-- post code -->
						<div class="post-code">
							<pre><%=p.getpCode()%></pre>
						</div>
					</div>


					<div class="card-footer primary-bg text-center">


						<%
						LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
						%>

						<a href="#" onClick="doLike( <%=postId%>, <%=userSBP.getId()%>)"
							class="btn btn-outline-light btn-sm"><i
							class="fad fa-thumbs-up"></i> <span class="like-counter"> <%=likeDao.noOfLikes(p.getpId())%>
						</span></a> <a href="#" class="btn btn-outline-light btn-sm"><i
							class="fad fa-comment-smile"></i> <span>20</span></a>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
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