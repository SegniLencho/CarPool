<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap-social.css" rel="stylesheet">
    <link href="resource/css/myStyles.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" 
type="text/javascript"></script>
    <script src="resource/js/register.js" type="text/javascript"></script>

        <title>Registration Page</title>
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
				<a class="navbar-brand" href="login.jsp"><img
					src="img/logo.png" height=30 width=41></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				
			</div>
		</div>
	</nav>
  <div class="container">
               <div class= "row row-content">
                   <form class="form-horizontal" role= "form" action="registerController" method="POST">
                   <div class= "col-sm-9">
                        <fieldset>
                          <legend> Personal Information</legend>
                      <div class="form-group">
                        <label for="firstname" class="col-sm-2 control-label">First Name</label>                        
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter First Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lastname" class="col-sm-2 control-label">Last Name</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter Last Name" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="gender" class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="gender" name="gender" placeholder="gender" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="bdate" class="col-sm-2 control-label">Birth Year</label>
                        <div class="col-sm-5" id="byear">
                            <input type="text" class="form-control" id="bdate" name="bdate" placeholder="YYYY" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="email" name="email" placeholder="xyz@hotmail.com" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">User name</label>
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="username" name="username"  required>
                        </div>
                    </div>
                     
                     <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-5">
                        <input type="password" class="form-control" id="password" name="password" 
                         title="Password must have at least one capital 
                        one small letter,a number and must have length of atleast 6 characters" required>
                        </div>
                    </div>
                        </fieldset>

                         <fieldset>
                          <legend> Address Information</legend>
                    <div class="form-group">
                        <label for="street" class="col-sm-2 control-label">Street</label>
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="street" name="street"  required>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="city" class="col-sm-2 control-label">City</label>
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="city" name="city"  required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="zipcode" class="col-sm-2 control-label">Zipcode</label>
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="zipcode" name="zipcode"  required>
                        </div>
                    </div>
  
                      <div class="form-group">
                        <label for="state" class="col-sm-2 control-label">State</label>
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="state" name="state"  required>
                        </div>
                    </div>

                       <div class="form-group">
                        <div class="col-sm-offset-4">
                            <button type="submit" class="btn btn-success">Register</button>
                        </div>
                    </div>
                         </fieldset>

                    </div>

                   </form>
                    </div>
                    </div>
          <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>