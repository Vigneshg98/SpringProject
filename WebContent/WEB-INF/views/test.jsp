<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*,com.quiz.model.Quiz,com.quiz.model.Question"%>
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
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.5.0/css/all.css'
	integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU'
	crossorigin='anonymous'>
<link href='https://fonts.googleapis.com/css?family=Nosifer'
	rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Julee'
	rel='stylesheet'>


<link rel="stylesheet" href="styleFile.css">
<title>QuizWhiz</title>
</head>
<% int dur = (int) request.getAttribute("dur"); %>
<script>
window.onload = function() {
	var twentyMinutesLater = new Date();

	var countDownDate = twentyMinutesLater.setMinutes(twentyMinutesLater
			.getMinutes() + <%=dur%>);

	var x = setInterval(function() {

		var now = new Date().getTime();
		var distance = countDownDate - now;

		var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
				/ (1000 * 60 * 60));
		var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var seconds = Math.floor((distance % (1000 * 60)) / 1000);

		document.getElementById("runTimer").innerHTML = minutes + "m " + seconds
				+ "s ";

		if (distance < 0) {
			clearInterval(x);
			document.getElementById("runTimer").innerHTML = "EXPIRED";
			window.setTimeout(document.myForm.submit());
			//window.location = 'feed.jsp';
		}
	}, 1000);
	function sumb() {
		if (window.confirm('Really need to submit exam ?')) {
			alert('Thank you for taking the test!!!');
			window.setTimeout(document.myForm.submit());
			//window.location = 'feed.jsp';
		} else {
			die();
		}
	}
}

</script>

<body style="font-family: Gill Sans Extrabold, sans-serif;">
    <nav class="navbar navbar-expand-sm navbar-dark" style="font-family: Nosifer; background-color:#000000; border-style:solid; border-bottom-color:white; border-right-color:black; border-top-color:black; border-left-color:black;">
        <div class="container-fluid">
            <a class="navbar-brand" href="#" style="color: #ff0047;">
                <img id="logo" alt="Logo" src="https://pngimage.net/wp-content/uploads/2018/06/q-logo-png-5.png" width="35" height="35">
                <span>
                    <b>QuizWhiz</b>
                </span>
            </a>
            <div id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item" style="color: white; font-family: cursive;" id="runTimer"></li>
                </ul>
            </div>
        </div>
    </nav>
	<br>
	<div class="container">
		<br>
		<%
			List<Quiz> exam = (List<Quiz>) request.getAttribute("exam");
			List<Question> ques = (List<Question>) request.getAttribute("ques");
			
			int count = 0;
			String allQ = "";
			for (Quiz t : exam) {
				allQ = t.getQues_Set();
				break;
			}
			List<String> sepQ = Arrays.asList(allQ.split("#"));
		%>
		<%
			int total = 0;
			for (String t : sepQ) {
				for (Question q : ques) {
					if (q.getqQuestion().equals(t)) {
						total = total + 1;
					}
				}
			}
		%>
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#note">Note</a></li>
			<%
				int i, j = 1, k = 1;
			%>
			<%
				for (i = 1; i <= total; i++) {
			%>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#ques<%=i%>">Ques <%=i%></a></li>
			<%
				}
			%>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#end" style="background-color: white; color: red;">End
					Test</a></li>
		</ul>
		<div class="tab-content">
			<div id="note" class="container tab-pane active">
				<br>
				<form action="testAnswers" name="myForm" method=post
					modelAttribute="answers">
					<p>
						Enter your name : <input type="text" name="username" required />
					</p>
					<br>
			</div>
			<%
				for (String t : sepQ) {
					for (Question q : ques) {
						if (q.getqQuestion().equals(t)) {
			%>
			<div id="ques<%=j%>" class="container tab-pane fade">
				<br>
				<p>
				<h5><%=q.getqQuestion()%></h5>
				</p>

				<input type="radio" name="answer<%=j%>" value="<%=q.getqOption1()%>">
				<%=q.getqOption1()%><br> <input type="radio"
					name="answer<%=j%>" value="<%=q.getqOption2()%>">
				<%=q.getqOption2()%><br> <input type="radio"
					name="answer<%=j%>" value="<%=q.getqOption3()%>">
				<%=q.getqOption3()%><br> <input type="radio"
					name="answer<%=j%>" value="<%=q.getqOption4()%>">
				<%=q.getqOption4()%><br> <br>

				<%
					j = j + 1;
				%>
			</div>
			<%
				}
					}
				}
			%>
			<div id="end" class="container tab-pane fade">
				<br>
				<H3>Do you really want to end your test ??</H3>
				<br> <input type="submit" class="btn btn-danger"
					value="End Test" onclick=sumb();> <br>
			</div>
			</form>
		</div>
	</div>
	<div style="position: fixed; bottom: 0; left: 0; width: 100%;">
        <nav class="navbar navbar-expand-sm navbar-dark" style="font-family: Julee; background-color:#f0f0f0ce; ">
            <div class="container-fluid">
                <a class="navbar-brand" href="#" style="color: #070707;">
                    <img id="logo" alt="Logo" src="https://pngimage.net/wp-content/uploads/2018/06/q-logo-png-5.png" width="25" height="25">
                    <span>
                        Powered By QuizWhiz
                    </span>
                </a>
                
                <div id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item" style="color: #070707;">
                            Copyright
                            <span class="fa fa-copyright" style="color:#070707">
                            </span> 2019 - Developed by Vignesh G
                        </li>
                    </ul>
                </div>
                <div id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item" style="color: #070707;">Facing technical difficulties during test ?
                                <span class="fas fa-phone" style="color:#038b25">
                                    <i style="color:#494848"> +91-8870021492</i>
                                    <span class=""></span>
                                </span>
                            </li>
                        </ul>
                    </div>
            </div>
        </nav>
    </div>
</body>

</html>