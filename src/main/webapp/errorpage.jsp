<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Got an error</title>

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
	clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 95%, 77% 100%, 50% 95%, 23% 100%, 0 94%, 0% 35%, 0 0);
}
</style>

</head>
<body>

	<div class="container p-3 text-center mt-5">
		<img src="img/error.png" class="img-fluid">
		<h3 class="display-6">Sorry ! You got an Error...</h3>
		<p><%= exception %></p>
		<a href="index.jsp " class="btn btn-outline-primary mt-3">Go to
			home</a>
	</div>

</body>
</html>