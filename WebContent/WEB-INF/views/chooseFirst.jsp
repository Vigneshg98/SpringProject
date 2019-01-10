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
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#newQ">Add new question</a></li>

						<a href="${pageContext.request.contextPath}/selectQuestions"
							class="btn" role="button">Choose from library</a>
					</ul>
					<div id="newQ" class="container tab-pane fade">
						<div class="card-body">
							<form:form action="insertQuestion" method="post"
								modelAttribute="insert">
								<div class="form-group row">
									<label for="question"
										class="col-md-4 col-form-label text-md-right">Question</label>
									<div class="col-md-6">
										<textarea class="form-control" rows="3" id="qQuestion"
											name="qQuestion" autofocus></textarea>
									</div>
								</div>
								<div class="form-group row">
									<label for="option1"
										class="col-md-4 col-form-label text-md-right">Option 1</label>
									<div class="col-md-6">
										<input type="text" id="qOption1" class="form-control"
											name="qOption1" required>
									</div>
								</div>
								<div class="form-group row">
									<label for="option2"
										class="col-md-4 col-form-label text-md-right">Option 2</label>
									<div class="col-md-6">
										<input type="text" id="qOption2" class="form-control"
											name="qOption2" required>
									</div>
								</div>
								<div class="form-group row">
									<label for="option3"
										class="col-md-4 col-form-label text-md-right">Option 3</label>
									<div class="col-md-6">
										<input type="text" id="qOption3" class="form-control"
											name="qOption3" required>
									</div>
								</div>
								<div class="form-group row">
									<label for="option4"
										class="col-md-4 col-form-label text-md-right">Option 4</label>
									<div class="col-md-6">
										<input type="text" id="qOption4" class="form-control"
											name="qOption4" required>
									</div>
								</div>
								<div class="form-group row">
									<label for="correct"
										class="col-md-4 col-form-label text-md-right">Correct</label>
									<div class="col-md-6">
										<input type="text" id="qCorrect" class="form-control"
											name="qCorrect" required>
									</div>
								</div>
								<div class="form-group row">
									<label for="syllabus"
										class="col-md-4 col-form-label text-md-right">Syllabus</label>
									<div class="col-md-6">
										<input type="text" id="syllabus" class="form-control"
											name="syllabus" required>
									</div>
								</div>
								<div class="col-md-6 offset-md-4">
									<button type="submit" class="btn btn-primary">Add
										Question</button>
									<a href="${pageContext.request.contextPath}/cancel"
										class="btn btn-primary" role="button">Cancel</a>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</main>
</body>

</html>