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

<style>
        @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

        fieldset,
        label {
            margin: 0;
            padding: 0;
        }        

        h1 {
            font-size: 1.5em;
            margin: 10px;
        }

        /****** Style Star Rating Widget *****/

        .rating {
            border: none;
            float: left;
        }

        .rating>input {
            display: none;
        }

        .rating>label:before {
            margin: 5px;
            font-size: 1.25em;
            font-family: FontAwesome;
            display: inline-block;
            content: "\f005";
        }

        .rating>.half:before {
            content: "\f089";
            position: absolute;
        }

        .rating>label {
            color: #ddd;
            float: right;
        }

        /***** CSS Magic to Highlight Stars on Hover *****/

        .rating>input:checked~label,
        /* show gold star when clicked */

        .rating:not(:checked)>label:hover,
        /* hover current star */

        .rating:not(:checked)>label:hover~label {
            color: #FFD700;
        }

        /* hover previous stars in list */

        .rating>input:checked+label:hover,
        /* hover current star when changing rating */

        .rating>input:checked~label:hover,
        .rating>label:hover~input:checked~label,
        /* lighten current selection */

        .rating>input:checked~label:hover~label {
            color: #FFED85;
        }
    </style>


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
						<strong>Thank you for taking the test</strong>
					</div>
					<div class="card-body">
						<form:form method="post">
							<div class="form-group row">
								<label for="uName" class="col-md-4 col-form-label text-md-right">Username</label>
								<div class="col-md-6">
									<input type="text" id="uName" class="form-control" name="uName"
										required>
								</div>
							</div>
							<div class="form-group row">
                                    <label for="rating" class="col-md-4 col-form-label text-md-right">Rate the test</label>
                                    <div class="col-md-6">
                                            <fieldset class="rating">
                                                    <input type="radio" id="star5" name="rating" value="5" />
                                                    <label class="full" for="star5" title="Awesome - 5 stars"></label>
                                                    <input type="radio" id="star4half" name="rating" value="4 and a half" />
                                                    <label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
                                                    <input type="radio" id="star4" name="rating" value="4" />
                                                    <label class="full" for="star4" title="Pretty good - 4 stars"></label>
                                                    <input type="radio" id="star3half" name="rating" value="3 and a half" />
                                                    <label class="half" for="star3half" title="Meh - 3.5 stars"></label>
                                                    <input type="radio" id="star3" name="rating" value="3" />
                                                    <label class="full" for="star3" title="Meh - 3 stars"></label>
                                                    <input type="radio" id="star2half" name="rating" value="2 and a half" />
                                                    <label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
                                                    <input type="radio" id="star2" name="rating" value="2" />
                                                    <label class="full" for="star2" title="Kinda bad - 2 stars"></label>
                                                    <input type="radio" id="star1half" name="rating" value="1 and a half" />
                                                    <label class="half" for="star1half" title="Meh - 1.5 stars"></label>
                                                    <input type="radio" id="star1" name="rating" value="1" />
                                                    <label class="full" for="star1" title="Sucks big time - 1 star"></label>
                                                    <input type="radio" id="starhalf" name="rating" value="half" />
                                                    <label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
                                                </fieldset>
                                    </div>
                                </div>
							<div class="col-md-6 offset-md-4">
								<button type="submit" class="btn btn-success">Submit</button>
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