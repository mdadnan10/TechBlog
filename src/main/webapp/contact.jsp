<%@ page errorPage="errorpage.jsp"%>
<%@page import="entities.*"%>
<%@page import="helper.*"%>

<!-- Add create post modal -->
<div class="modal fade" id="contact" tabindex="-1"
	aria-labelledby="contactModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">

			<div class="modal-header primary-bg text-white">
				<h5 class="modal-title" id="contactModalLabel">Connect with us</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body">

				<div class=" mb-2">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Address</h5>
							<p>
								<i class="fas fa-map-marker-check"></i><a target="_blank"
									href="https://goo.gl/maps/b6VVuqrHzikz7wsp6" class="c"> DLF
									Cyber city, BBSR, 751001</a>
							</p>
							<p>
								<i class="fad fa-phone-alt"></i> Call Us : <a
									href="tel:+919777871971" class="c">9777871971</a>
							</p>
							<p>
								<i class="fad fa-envelope"></i> Email Us: <a
									href="mailto:sendquery@tecgblog.com" class="c">sendquery@tecgblog.com</a>
							</p>
						</div>
					</div>
				</div>

				<form id="contact-form" action="ContactServlet" method="POST"
					enctype="multipart/form-data">


					<div class="form-floating mb-3">
						<input type="email" class="form-control"
							name="c_email" id="floatingEmail" placeholder="Email" required="required"> <label
							for="floatingEmail">Email</label>
					</div>

					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="c_title"
							id="floatingTitle" placeholder="Enter Contact Title"
							required="required"> <label for="floatingTitle">
							Title</label>
					</div>

					<div class="form-group mb-3">
						<input type="file" class="form-control" name="c_file"
							id="floatingFile" placeholder="select an image">
					</div>

					<div class="form-floating mb-3">
						<textarea class="form-control" name="c_desc" id="floatingDesc"
							placeholder="Describe your problem" style="height: 100px"></textarea>
						<label for="floatingDesc">Describe Your Problem</label>
					</div>

					<div class="text-center"
						style="color: #2196f3 !important; display: none" id="loader">
						<i class="far fa-sync-alt fa-spin fa-2x"></i>
						<h5>Please wait...</h5>
					</div>

					<div class="text-center">
						<button class="btn btn-outline-success">Connect</button>
					</div>

				</form>
			</div>

			<div class="modal-footer primary-bg"></div>

		</div>
	</div>
</div>