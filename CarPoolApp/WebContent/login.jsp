<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="resource/css/stylee.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<div class="container">
		<section id="content">
			<form action="Login" method="post">
				<h1>Login Form</h1>
				<div>
					<input type="text" placeholder="Username" required id="username"
						name="username" />
				</div>
				<div>
					<input type="password" placeholder="Password" required
						id="password" name="password" />
				</div>
				<div>
					<input type="submit" value="Log in" /> <a href="#">Lost your
						password?</a> <a href="register.jsp">Register</a>
				</div>
			</form>
			<div class="button">
				<p style='color: red; visibility: hidden;'>Your last answer was
					not correct! Please try again</p>
			</div>
		</section>
	</div>
</body>
</html>