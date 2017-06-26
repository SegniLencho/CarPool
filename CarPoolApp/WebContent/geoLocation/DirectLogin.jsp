<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script>
	function displayLocation(latitude, longitude) {
		var request = new XMLHttpRequest();

		var method = 'GET';
		var url = 'http://maps.googleapis.com/maps/api/geocode/json?latlng='
				+ latitude + ',' + longitude + '&sensor=true';
		var async = true;

		request.open(method, url, async);
		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				var data = JSON.parse(request.responseText);
				var address = data.results[1];
				var city = address.address_components[0].short_name;
				
				//document.getElementById("citylabel").value = city;
				var weather = new XMLHttpRequest();
				uri = "http://api.openweathermap.org/data/2.5/weather?q=" + city
						+ "&mode=json&appid=42e9cdc534cc0428abefa02488580d5f";
				weather.open("GET", uri, false);
				weather.send(null);
				var r = JSON.parse(weather.response);
				var m = JSON.stringify(r.main.temp)
				alert("Maximum Temperature in " + city + " is : " + m);
				
				//document.write(city);
			}
		};

		request.send();
	};

	var successCallback = function(position) {
		var x = position.coords.latitude;
		var y = position.coords.longitude;
		displayLocation(x, y);
	};

	var errorCallback = function(error) {
		var errorMessage = 'Unknown error';
		switch (error.code) {
		case 1:
			errorMessage = 'Permission denied';
			break;
		case 2:
			errorMessage = 'Position unavailable';
			break;
		case 3:
			errorMessage = 'Timeout';
			break;
		}
		document.write(errorMessage);
	};

	var options = {
		enableHighAccuracy : true,
		timeout : 1000,
		maximumAge : 0
	};

	navigator.geolocation.getCurrentPosition(successCallback, errorCallback,
			options);
</script>
</head>
<body>
	<form method="post" action="DirectLogin.jsp">
		<input type="hidden" id="citylabel" name="citylabel"> <input
			type="submit" value="Show Me" id="showweather">
	</form>

</body>
</html>