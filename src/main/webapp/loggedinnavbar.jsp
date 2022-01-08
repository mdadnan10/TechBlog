<%@ page import="entities.*"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User userNav = (User) session.getAttribute("currentUser");
if (userNav == null) {
	response.sendRedirect("login.jsp");
}
%>

<!-- logged in navbar start -->
<nav class="navbar navbar-expand-lg navbar-dark primary-bg">
	<div class="container-fluid">
		<a class="navbar-brand" href="dashboard.jsp">Tech Blog</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="dashboard.jsp"><i class="fad fa-home"></i> Home</a></li>

				<li class="nav-item"><a href="#" class="nav-link" data-bs-toggle="modal" data-bs-target="#contact"><i
						class="fad fa-user-headset"></i> Contact</a></li>

				<li class="nav-item"><a href="#" class="nav-link"
					data-bs-toggle="modal" data-bs-target="#addPostModal"><i
						class="fad fa-plus-square"></i> Create Post</a></li>
			</ul>

			<div class="d-flex">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fad fa-user-circle"></i> Hello <%=userNav.getName()%>
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
								data-bs-target="#profileModal"><i
									class="fal fa-address-card"></i> Profile</a></li>
							<li><a class="dropdown-item" href="LogoutServlet"><i
									class="fad fa-sign-out-alt"></i> Logout</a></li>
						</ul></li>
				</ul>
			</div>

		</div>

	</div>
</nav>
<!-- logged in navbar end -->