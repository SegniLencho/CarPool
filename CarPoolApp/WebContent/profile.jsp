<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "com.model.User" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="resource/css/bootstrap.min.css" rel="stylesheet">
    <link href="resource/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="resource/css/font-awesome.min.css" rel="stylesheet">
    <link href="resource/css/bootstrap-social.css" rel="stylesheet">
    <link href="resource/css/mystyles.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" 
type="text/javascript"></script>
<script src="resource/js/profileEdit.js" type= "text/javascript"></script>
<title>Insert title here</title>
</head>
<body>

<div class="container">
               <div class= "row row-content">
                 <form class="form-horizontal" role= "form" action="ProfileController" method="POST">
                   <div class= "col-sm-9">
                        <fieldset>
                          <legend> Personal Information</legend>
                      <div class="form-group">
                        <label for="firstname" class="col-sm-2 control-label">First Name</label>                        
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="firstname" name="fname" value="${userData.firstName}" required >
                        
                        </div>
                        <div class="col-sm-3">
                            <input type="button" class=" btn btn-primary" value="Edit Profile" id="fnedit">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="lastname" class="col-sm-2 control-label">Last Name</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="lastname" name="lname" value= "${userData.lastName}" required>
                        </div>
                     
                    </div>
                    <div class="form-group">
                        <label for="gender" class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="gender" name="gender" value= "${userData.gender}" required>
                        </div>
                        
                    </div>

                    <div class="form-group">
                        <label for="bdate" class="col-sm-2 control-label">Birth Year</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="bdate" name="bdate" value= "${userData.birthDate}"  required>
                        </div>
                       
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="email" name="email" value= "${userData.email}" required>
                        </div>
                      
                    </div>

                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">User name</label>
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="username" name="username" value= "${userData.username}" required>
                        </div>
                      
                    </div>
                     
                     <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-5">
                        <input type="password" class="form-control" id="password" name="password" 
                        pattern="(?=\d+)(?=[a-z]*)(?=[0-9]*).{6,}" title="Password must have at least one capital 
                        one small letter,a number and must have length of atleast 6 characters" required "${userData.password}">
                        </div>
                     
                    </div>
                        </fieldset>

                         <fieldset>
                          <legend> Address Information</legend>
                    <div class="form-group">
                        <label for="street" class="col-sm-2 control-label">Street</label>
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="street" name="street" value= "${userData.street}" required>
                        </div>
                      
                    </div>
                     <div class="form-group">
                        <label for="city" class="col-sm-2 control-label">City</label>
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="city" name="city" value= "${userData.city}" required>
                        </div>
              
                    </div>

                    <div class="form-group">
                        <label for="zipcode" class="col-sm-2 control-label">Zipcode</label>
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="zipcode" name="zipcode" value= "${userData.zipcode}" required>
                        </div>
                       
                    </div>
  
                      <div class="form-group">
                        <label for="state" class="col-sm-2 control-label">State</label>
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="state" name="state"  value= "${userData.state}" required>
                        </div>
                        
                    </div>

                       <div class="form-group">
                        <div class="col-sm-offset-4">
                            <button type="submit" class="btn btn-success">Update Profile</button>
                        </div>
                    </div>
                         </fieldset>

                    </div>

                   </form>
                    </div>
                    </div>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>