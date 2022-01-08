<%@ page errorPage="errorpage.jsp"%>
<%@page import="entities.*"%>
<%@page import="dao.PostDao"%>
<%@page import="helper.*"%>
<%@page import="java.util.ArrayList"%>
<%
User userCP = (User) session.getAttribute("currentUser");
if (userCP == null) {
	response.sendRedirect("login.jsp");
}
%>
<!-- Add create post modal -->
	<div class="modal fade" id="addPostModal" tabindex="-1"
		aria-labelledby="addPostModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<div class="modal-header primary-bg text-white">
					<h5 class="modal-title" id="addPostModalLabel">
						Create Your Post
						<%= userCP.getName()%></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<form id="create-post-form" action="AddPostServlet" method="POST">

						<div class="form-group mb-3">
							<select class="form-select" name="p_cid"
								aria-label="Default select" required="required">
								<option selected disabled>Select a category</option>

								<%
								PostDao dao = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = dao.getAllCategories();
								for (Category c : list) {
								%>

								<option value="<%=c.getcId()%>"><%=c.getcName()%></option>

								<%
								}
								%>

							</select>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control" name="p_title"
								id="floatingTitle" placeholder="Enter Post Title"
								required="required"> <label for="floatingTitle">Post
								Title</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control" name="p_link"
								id="floatingLink" placeholder="Create a link"> <label
								for="floatinglink">Do have any reference (link)</label>
						</div>

						<div class="form-group mb-3">
							<input type="file" class="form-control" name="p_file"
								id="floatingFile" placeholder="select an image">
						</div>

						<div class="form-floating mb-3">
							<textarea class="form-control" name="p_content"
								id="floatingContent" placeholder="Leave a comment here"
								style="height: 100px"></textarea>
							<label for="floatingContent">Enter Post Content</label>
						</div>

						<div class="form-floating mb-3">
							<textarea class="form-control" name="p_code" id="floatingCode"
								placeholder="Leave a comment here" style="height: 100px"></textarea>
							<label for="floatingCode">Enter Your Program (if any)</label>
						</div>

						<div class="text-center"
							style="color: #2196f3 !important; display: none" id="loader">
							<i class="far fa-sync-alt fa-spin fa-2x"></i>
							<h5>Please wait...</h5>
						</div>

						<div class="text-center">
							<button class="btn btn-outline-success">Create</button>
						</div>

					</form>
				</div>

				<div class="modal-footer primary-bg"></div>

			</div>
		</div>
	</div>