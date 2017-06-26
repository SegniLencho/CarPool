<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap-social.css" rel="stylesheet">
<link href="css/mmystyles.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css"	rel="stylesheet" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script src="resource/js/userpostload.js" type="text/javascript"></script>
<title>Ride Share</title>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="homePage.jsp"><img
					src="img/logo.png" height=30 width=41></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li ><a href="homePage.jsp"><span
							class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a></li>
					<li><a href="asking.jsp"><i class="fa fa-car" aria-hidden="true"></i>
							Asking</a></li>
					
					<li class="active"><a href="mypost.jsp"><i class="fa fa-id-card-o" aria-hidden="true"></i> My
							Post</a></li>
					<li>
						<div id="not">
							<!--<button  class="btn btn-default btn-lg btn-link" style="font-size:36px;" >-->
							<a href="homePage.jsp"> <span
								class="glyphicon glyphicon-comment" style="font-size: 30px; padding-top: 10px;"></span></a>
							<span id="eg" style="background-color: #000"
								class="badge badge-notify"></span>
							<!--</button>-->
						</div>
					</li>

				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row row-content">
			<div class="col-sm-2">

				<img src="resource/css/user.png" style="height: 50px; width: 50px"
					class="img-polaroid" />
				<h2>${userData2.firstName}</h2>
				<h4>
					<a href="profile.jsp">Edit profile</a>
				</h4>
				<h4>
					<a href="login.jsp">Logout</a>
				</h4>



			</div>
		<div class="col-sm-6">
<input type="hidden" id="userid" value="${userId}">
	<div class="mypost">
		<p>
			<img style="display: none;" src="resource/images/ajax-loader.gif"
				id="loader" alt="loading image" />
		</p>
		<div class="owner">
			<!-- here we append post owner info name,email date created,posttext -->
		</div>

		<div class="comments">
			<!-- here we append comments , user(name,email,comment) -->
		</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>