<!-- profile Modal -->
<%@ page errorPage="errorpage.jsp"%>
<%@page import="entities.*"%>
<%@page import="dao.PostDao"%>
<%@page import="helper.*"%>
<%@page import="java.util.ArrayList"%>
<%
User userP = (User) session.getAttribute("currentUser");
if (userP == null) {
	response.sendRedirect("login.jsp");
}
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
<div class="modal fade" id="profileModal" tabindex="-1"
	aria-labelledby="profileModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header primary-bg text-white">
				<h5 class="modal-title text-center" id="profileModalLabel">
					Welcome
					<%=userP.getName()%></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container text-center">
					<img class="img-fluid"
						style="border-radius: 10px; max-width: 150px"
						alt="Profile <%=userP.getName()%>"
						src="img/profile/<%=userP.getProfile()%>"> <br>

					<!-- details -->
					<div id="profile-details">

						<h5 class="mt-3"><%=userP.getName()%></h5>
						<table class="table mt-2">
							<tbody>
								<tr>
									<th scope="row">Email :</th>
									<td><%=userP.getEmail()%></td>
								</tr>
								<tr>
									<th scope="row">Gender :</th>
									<td><%=userP.getGender()%></td>
								</tr>
								<tr>
									<th scope="row">Status :</th>
									<td><%=userP.getAbout()%></td>
								</tr>
								<tr>
									<th scope="row">Registered on :</th>
									<td><%=userP.getrDate().toString()%></td>
								</tr>
							</tbody>
						</table>
					</div>

					<!-- Profile Edit -->
					<div id="profile-edit" style="display: none;">

						<form action="EditServlet" method="POST"
							enctype="multipart/form-data">
							<table class="table mt-2">
								<tbody>
									<tr>
										<th scope="row">New Profile :</th>
										<td><input TYPE="file" name="update_profile"
											class="form-control"
											value="img/profile<%=userP.getProfile()%>"></td>
									</tr>
									<tr>
										<th scope="row">Name :</th>
										<td><input class="form-control"
											value="<%=userP.getName()%>" name="update_name"
											required="required"></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><input type="email" disabled="disabled"
											class="form-control" value="<%=userP.getEmail()%>"></td>
									</tr>
									<tr>
										<th scope="row">Password :</th>
										<td><input type="text" class="form-control"
											value="<%=userP.getPassword()%>" name="update_password"
											required="required"></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><input type="text" class="form-control"
											value="<%=userP.getGender()%>" disabled="disabled"></td>
									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><input type="text" class="form-control"
											value="<%=userP.getAbout()%>" name="update_about"
											required="required"></td>
									</tr>
									<tr>
										<th scope="row">Registered on:</th>
										<td><input type="text" disabled="disabled"
											class="form-control" value="<%=userP.getrDate().toString()%>"></td>
									</tr>
								</tbody>
							</table>

							<div class="container">
								<button class="btn btn-outline-success">Save</button>
							</div>
						</form>

					</div>
					<!-- Profile edit end -->

				</div>
			</div>
			<div class="modal-footer primary-bg">
				<button id="edit-btn" type="button" class="btn btn-outline-light">Edit
					Profile</button>
				<button style="display: none;" id="back-btn" type="button"
					class="btn btn-outline-light">Back</button>
			</div>
		</div>
	</div>
</div>

<!--end Profile modal -->