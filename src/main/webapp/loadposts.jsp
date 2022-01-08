<%@page import="java.text.DateFormat"%>
<%@ page errorPage="errorpage.jsp"%>
<%@page import="entities.*"%>
<%@page import="dao.*"%>
<%@page import="helper.*"%>
<%@page import="java.util.List"%>
<%
User userLP = (User) session.getAttribute("currentUser");
if (userLP == null) {
	response.sendRedirect("login.jsp");
}
%>

<div class="row">

	<%
	PostDao daoP = new PostDao(ConnectionProvider.getConnection());

	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts = null;
	if (cid == 0) {
		posts = daoP.getAllPost();
	} else {
		posts = daoP.getPostByCatId(cid);
	}

	if (posts.size() == 0) {
		out.println("<h3 class='display-6 text-center'>No Posts in this category.</h3>");
		return;
	}

	for (Post p : posts) {
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		User userPost = userDao.getUserById(p.getUserId());
	%>
	<div class="col-md-12 mb-2">
		<div class="card">

			<div class="card-header primary-bg text-white">

				<div class="row my-2">

					<div class="col-md-10">
						<div class="row">

							<div class="col-md-2">
								<img style="height: 35px; width: 40px; border-radius: 3px"
									src="img/profile/<%=userPost.getProfile()%>">
							</div>

							<div class="col-md-8">
								<span style="font-size: 16px; font-weight: 700"> <a
									style="text-decoration: none; color: yellow" href="#"> <%=userPost.getName()%>
								</a>
								</span>
							</div>

						</div>
					</div>

					<div class="col-md-2">
						<span style="font-size: 14px"><%=DateFormat.getDateInstance().format(p.getpDate())%></span>
					</div>

				</div>

				<!-- Post Title -->
				<span><%=p.getpTitle()%></span>
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
				<p><%=p.getpContent()%></p>

			</div>

			<div class="card-footer primary-bg text-center">

				<%
				LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
				%>

				<a href="#" onClick="doLike(<%=p.getpId()%>, <%=userLP.getId()%> )"
					class="btn btn-outline-light btn-sm"><i
					class="fad fa-thumbs-up"></i> <span class="like-counter"> 
					
					<%= 
					 likeDao.noOfLikes(p.getpId())
					%>

				</span> </a> <a href="showblogpage.jsp?post_id=<%=p.getpId()%>"
					class="btn btn-outline-light btn-sm">Read more...</a> <a href="#"
					class="btn btn-outline-light btn-sm"><i
					class="fad fa-comment-smile"></i> <span>20</span></a>
			</div>

		</div>
	</div>
	<%
	}
	%>

</div>
