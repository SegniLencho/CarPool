<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('#search').click(function() {
			var tfdata = $('#city_name').val();
			$.get('weather.jsp', {
				'tfdata' : tfdata
			}).done(ajaxSuccess).fail(ajaxFailure);
		});
	});
	function ajaxSuccess(data) {
		var tfdata = $('#city_name').val();
		var weather = new XMLHttpRequest();
		uri = "http://api.openweathermap.org/data/2.5/weather?q=" + tfdata
				+ "&mode=json&appid=42e9cdc534cc0428abefa02488580d5f";
		weather.open("GET", uri, false);
		weather.send(null);
		var r = JSON.parse(weather.response);
		var m = JSON.stringify(r.main.temp)
		alert("Maximum Temperature in " + tfdata + " is : " + m);
	}

	function ajaxFailure() {
		alert("error");
	}
</script>
</head>

<body>
	<form method="post" action="weather.jsp">
		City Name :<input type="text" name="city_name" id="city_name">
		<br /> <input type="submit" value="search" id="search">
	</form>
</body>

</html>