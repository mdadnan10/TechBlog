$(document).ready(function() {
	console.log("Hello loded...");

	// signup form
	$('#reg-form').on('submit', function(event) {
		event.preventDefault();

		let form = new FormData(this);

		$('#loader').show();
		$('#btn').hide();

		// send register servlet
		$.ajax({
			url: "SignUpServlet",
			type: "POST",
			data: form,
			success: function(data, textStatus, jqXHR) {
				$('#loader').hide();
				$('#btn').show();

				if (data.trim() === 'registered') {
					swal({
						title: "Registered",
						text: "You have Registered with us Successfully.",
						icon: "success",
						button: "Login"
					}).then(function() {
						window.location = "login.jsp";
					});

				} else if (data.trim() === 'exist') {
					swal({
						title: "User Exist",
						text: "This Email id is already in use.",
						icon: "warning",
						button: "Ops!!",
					});
				} else {
					swal({
						title: "Failure",
						text: data,
						icon: "error",
						button: "Ops!!",
					});
				}

			},
			error: function(jqXHR, textStatus, errorThrown) {
				$('#loader').hide();
				$('#btn').show();

				swal({
					title: "Failure",
					text: "There is an error while registering you.",
					icon: "error",
					button: "Ok",
				});

			},
			processData: false,
			contentType: false
		});

	});

	// login form
	$('#login-form').on('submit', function(event) {
		event.preventDefault();

		let form = new FormData(this);

		$('#loader').show();
		$('#btn').hide();

		// send register servlet
		$.ajax({
			url: "LoginServlet",
			type: "POST",
			data: form,
			success: function(data, textStatus, jqXHR) {
				$('#loader').hide();
				$('#btn').show();

				if (data.trim() === 'notMatch') {

					swal({
						title: "Does not match",
						text: "Email and password does not match.",
						icon: "warning",
						button: "Ops!!"
					});

				} else if (data.trim() === 'notExist') {

					swal({
						title: "Not Exist",
						text: "You have not registered with us.",
						icon: "info",
						button: "Register"
					}).then(function() {
						window.location = "signup.jsp";
					});

				} else {
					window.location = "dashboard.jsp";
				}

			},
			error: function(jqXHR, textStatus, errorThrown) {
				$('#loader').hide();
				$('#btn').show();

				swal({
					title: "Failure",
					text: "There is an error while logging you in.",
					icon: "error",
					button: "Ok",
				});

			},
			processData: false,
			contentType: false
		});

	});


	// forget password
	$('#recover-form').on('submit', function(event) {
		event.preventDefault();

		let form = new FormData(this);

		$('#loader').show();
		$('#btn').hide();

		// send register servlet
		$.ajax({
			url: "RecoverServlet",
			type: "POST",
			data: form,
			success: function(data, textStatus, jqXHR) {
				$('#loader').hide();
				$('#btn').show();

				if (data.trim() === 'updated') {
					swal({
						title: "Updated",
						text: "Your password has been updated Successfully.",
						icon: "success",
						button: "Login"
					}).then(function() {
						window.location = "login.jsp";
					});

				} else if (data.trim() === 'notExist') {
					swal({
						title: "User not Exist",
						text: "You are not registered with us.",
						icon: "warning",
						button: "Register"
					}).then(function() {
						window.location = "signup.jsp";
					});
				} else if (data.trim() === 'notMatch') {
					swal({
						title: "Not Match",
						text: "Your entered name and password does't match with us.",
						icon: "info",
						button: "Ops!!"
					});
				} else {
					swal({
						title: "Failure",
						text: data,
						icon: "error",
						button: "Ops!!"
					});
				}

			},
			error: function(jqXHR, textStatus, errorThrown) {
				$('#loader').hide();
				$('#btn').show();

				swal({
					title: "Failure",
					text: "There is an error while updatting password." + jqXHR,
					icon: "error",
					button: "Ok",
				});

			},
			processData: false,
			contentType: false
		});

	});


	// profile edit
	$('#edit-btn').click(function() {
		$('#profile-details').hide();
		$('#profile-edit').show();
		$('#edit-btn').hide();
		$('#back-btn').show();
	});

	$('#back-btn').click(function() {
		$('#profile-details').show();
		$('#profile-edit').hide();
		$('#edit-btn').show();
		$('#back-btn').hide();
	});

	// post js
	$('#create-post-form').on("submit", function(event) {
		event.preventDefault();

		let form = new FormData(this);

		$('#loader').show();
		$('#btn').hide();

		$.ajax({
			url: "AddPostServlet",
			type: "POST",
			data: form,
			success: function(data, textStatus, jqXHR) {
				$('#loader').hide();
				$('#btn').show();

				if (data.trim() === 'posted') {

					swal({
						title: "Post Created",
						text: "Your post has been created without pic.",
						icon: "info",
						button: "Check Again"
					});

				} else if (data.trim() === 'complete') {

					swal({
						title: "Post Created",
						text: "Your post has been created successfully.",
						icon: "success",
						button: "Great"
					}).then(function() {
						window.location = "dashboard.jsp";
					});

				} else {

					swal({
						title: "Got an Error",
						text: "There is a problem while creating your post.",
						icon: "warning",
						button: "Ops!!"
					});
				}

			},
			error: function(jqXHR, textStatus, errorThrown) {
				$('#loader').hide();
				$('#btn').show();

				swal({
					title: "Got an Error",
					text: "Unable to create your post at the moment please try after some time",
					icon: "error",
					button: "Ops!!",
				});

			},
			processData: false,
			contentType: false
		});


	});

	// contact js
	$('#contact-form').on('submit', function(event) {
		event.preventDefault();

		let form = new FormData(this);

		$('#loader').show();
		$('#btn').hide();


		$.ajax({
			url: "ContactServlet",
			type: "POST",
			data: form,
			success: function(data, textStatus, jqXHR) {
				$('#loader').hide();
				$('#btn').show();

				if (data.trim() === 'contacted') {

					swal({
						title: "Thanks for Contacting",
						text: "Will get back to you shortly.",
						icon: "success",
						button: "OK"
					});

				} else if (data.trim() === 'unable to save image') {

					swal({
						title: "Imgage not attached",
						text: "Your query has been sent without Image.",
						icon: "info",
						button: "Ok"
					});

				} else {
					swal({
						title: "Got an error",
						text: data,
						icon: "error",
						button: "Ops!!"
					});
				}

			},
			error: function(jqXHR, textStatus, errorThrown) {
				$('#loader').hide();
				$('#btn').show();

				swal({
					title: "Failure",
					text: "There is an error while logging you in.",
					icon: "error",
					button: "Ops!!",
				});

			},
			processData: false,
			contentType: false
		});

	});

});

// do like
function doLike(pId, uId) {
	console.log(pId + ", " + uId);
	const data = {
		pid: pId,
		uid: uId,
		operation: 'like'
	}

	$.ajax({
		url: "LikeServlet",
		data: data,
		success: function(data, textStatus, jqXHR) {
			console.log(data);

			if (data.trim() === 'liked') {
				let c = $(".like-counter").html();
				c++;
				$(".like-counter").html(c);
			}

		}, error: function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
		}
	});
}
