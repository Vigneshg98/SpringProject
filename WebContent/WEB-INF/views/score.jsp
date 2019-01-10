<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*,com.quiz.model.Student"%>

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
		<a class="navbar-brand" href="#" style="color: #ff0047;"> <img
			id="logo" alt="Logo"
			src="https://pngimage.net/wp-content/uploads/2018/06/q-logo-png-5.png"
			width="35" height="35"> <span><b>QuizWhiz</b></span>
		</a>

		<div id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/logout"
					style="color: white;">Logout</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<br>
	<%
		String stuName = (String) request.getAttribute("user");
		List<Student> data = (List<Student>) request.getAttribute("data");
		int total = (int) request.getAttribute("total");
	%>
	<div class="container">
		<table class="table table-striped" style="width: 70%;">
			<thead>
				<tr>
					<th>Student Name</th>
					<th>Score</th>
				</tr>
				<% for(Student tmp: data) { %>
				<tr>
					<th><%=tmp.getUsername()%></th>
					<th><%=tmp.getScore()%></th>
				</tr>
				<%} %>
			</thead>
		</table>
	</div>
	</div>
</body>
</html>