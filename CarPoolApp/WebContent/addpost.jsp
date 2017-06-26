 <jsp:forward page=""></jsp:forward>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <form action="AddPost" method="post">
 <p>
 <label for="post">Add New Trip</label><br>
 <textarea rows="10" cols="30" name="post" placeholder="Where are you off to ?"></textarea></p>
 <label for="type">Select Type</label>
 <select name="postType" size="1">
  <option>Select Type</option>
  <option value="1">Asking Ride</option>
  <option value="2">Giving Ride</option>
 </select>
 <p>
 <input type="submit" name="addPost" value="Post Trip"></p>
 </form>
</body>
</html>