<%@ page errorPage="errorpage.jsp"%>
<!-- nav bar start -->
<nav class="navbar navbar-expand-lg navbar-dark primary-bg">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp">Tech Blog</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i class="fad fa-home"></i>
						Home</a></li>

				<li class="nav-item"><a href="#" class="nav-link"
					class="nav-link" data-bs-toggle="modal" data-bs-target="#contact"><i
						class="fad fa-user-headset"></i> Contact</a></li>
				<li class="nav-item"><a href="login.jsp" class="nav-link"><i
						class="fad fa-user-circle"></i> Login</a></li>
			</ul>
			<form class="d-flex">
				<input class="form-control me-2" type="search"
					placeholder="Search..." aria-label="Search">
				<button class="btn btn-outline-light" type="submit">Search</button>
			</form>
		</div>
	</div>
</nav>
<!-- navbar end -->