<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.5.0/css/all.css'
	integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU'
	crossorigin='anonymous'>

<link rel="stylesheet" href="styleFile.css">
<title>QuizWhiz</title>
</head>

<body style="font-family: Gill Sans Extrabold, sans-serif;">
	<nav class="navbar navbar-expand-sm navbar-dark"
		style="font-family: cursive; background-color:#000000; border-style:solid; border-bottom-color:white; border-right-color:black; border-top-color:black; border-left-color:black;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#" style="color: #ff0047;"> <img
				id="logo" alt="Logo"
				src="https://pngimage.net/wp-content/uploads/2018/06/q-logo-png-5.png"
				width="35" height="35"> <span><b>QuizWhiz</b></span>
			</a>
		</div>
	</div>
	</nav>
	<main class="login-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-lg-6 col-md-12 col-sm-6 col-xs-12">
				<div class="card">
					<div class="card-header">
						<strong>Login to Your Account</strong>
					</div>
					<div class="card-body">
						<form:form action="validate" method="post" modelAttribute="admin">
							<div class="form-group row">
								<label for="uName" class="col-md-4 col-form-label text-md-right">Username</label>
								<div class="col-md-6">
									<input type="text" id="uName" class="form-control" name="uName"
										required autofocus>
								</div>
							</div>
							<div class="form-group row">
								<label for="uPassword"
									class="col-md-4 col-form-label text-md-right">Password</label>
								<div class="col-md-6">
									<input type="password" id="uPassword" class="form-control"
										name="uPassword" required>
								</div>
							</div>
							<div class="col-md-6 offset-md-4">
								<button type="submit" class="btn btn-success">Login</button>
								<br><br><h6 style="color:red;">${message}</h6>
							</div>
					</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	</div>
	</main>
</body>

</html>