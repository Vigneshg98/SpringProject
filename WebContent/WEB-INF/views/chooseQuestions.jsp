<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*,com.quiz.model.Question"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.5.0/css/all.css'
	integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU'
	crossorigin='anonymous'>
<title>QuizWhiz</title>
</head>
<body style="font-family: Gill Sans Extrabold, sans-serif;">
	<nav class="navbar navbar-expand-md navbar-dark"
		style="font-family: cursive; background-color:#000000; border-style:solid; border-bottom-color:white; border-right-color:black; border-top-color:black; border-left-color:black;">
	<a class="navbar-brand" href="#" style="color: #ff0047;"> <img
		id="logo" alt="Logo"
		src="https://pngimage.net/wp-content/uploads/2018/06/q-logo-png-5.png"
		width="35" height="35"> <span> <b>QuizWhiz</b>
	</span>
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav ml-auto">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/home"
					style="color: white;">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/quizSettings"
					style="color: white;">Create Quiz</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/report"
					style="color: white;">Report</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/logout"
					style="color: white;">Logout</a></li>
			</ul>
	</div>
	</nav>
	<main class="login-form">
	<div class="cotainer-fluid">
		<div class="row">
			<div class="col-lg-6 col-sm-6 ">
				<div class="container">
					<br>
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#library">Library</a></li>
					</ul>

					<div class="tab-content">
						<div id="library" class="container tab-pane active">
							<div class="card-body">
								<%
									List<Question> CC = (List<Question>) request.getAttribute("C");
									List<Question> DSDS = (List<Question>) request.getAttribute("DS");
								%>
								<form:form action="finalSet" method="post"
									modelAttribute="select">
									<div id="accordion">
										<div class="card">
											<div class="card-header">
												<a class="card-link" data-toggle="collapse" href="#C"> C
												</a>
											</div>
											<div id="C" class="collapse show" data-parent="#accordion">
												<div class="card-body">
													<%
														for (Question t1 : CC) {
													%>
													<div class="form-group row">
														<div class="col-md-12">
															<input type="checkbox" class="form-check-input"
																name="selectQ" value="<%=t1.getqQuestion()%>">
															<p><%=t1.getqQuestion()%></p>
														</div>
													</div>
													<%
														}
													%>
												</div>
											</div>
										</div>
										<div class="card">
											<div class="card-header">
												<a class="collapsed card-link" data-toggle="collapse"
													href="#DS"> DS </a>
											</div>
											<div id="DS" class="collapse" data-parent="#accordion">
												<div class="card-body">
													<%
														for (Question t2 : DSDS) {
													%>
													<div class="form-group row">
														<div class="col-md-12">
															<input type="checkbox" class="form-check-input"
																name="selectQ" value="<%=t2.getqQuestion()%>">
															<p><%=t2.getqQuestion()%></p>
														</div>
													</div>
													<%
														}
													%>
												</div>
											</div>
										</div>
									</div>
									<br>
									<br>
									<div class="col-md-6 offset-md-4">
										<button type="submit" class="btn btn-primary">
											Confirm</button>
										<a href="${pageContext.request.contextPath}/cancel"
											class="btn btn-primary" role="button">Cancel</a>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-6 col-sm-6">
				<br>
				<form:form action="createQuiz" method="post" modelAttribute="create">
					<nav class="navbar navbar-expand-sm"
						style="background-color: #f5f5ef;">
					<div class="container-fluid">
						<a class="navbar-brand" href="#" style="color: black;">
							Selected Questions</a>
						<div id="navbarSupportedContent">
							<ul class="navbar-nav ml-auto">
								<button type="submit" class="btn btn-dark">Create Quiz</button>
							</ul>
						</div>
					</div>
					</nav>
				</form:form>
				<br>
			</div>
		</div>
	</div>
	</main>
</body>

</html>