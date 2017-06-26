<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head 
         content must come *after* these tags -->
<title>Ride Share</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap-social.css" rel="stylesheet">
<link href="css/mmystyles.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script src="resource/js/givingrides.js" type="text/javascript"></script>


<script src="https://code.jquery.com/jquery-2.1.1.min.js"
	type="text/javascript"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
<script type="text/javascript">
	function GetSelectedTextValue(selected) {
		var selectedText = selected.options[selected.selectedIndex].innerHTML;
		var selectedValue = selected.value;
		var weather = new XMLHttpRequest();
		uri = "http://api.openweathermap.org/data/2.5/forecast?q="
				+ selectedValue
				+ "&mode=json&appid=42e9cdc534cc0428abefa02488580d5f";
		weather.open("GET", uri, false);
		weather.send(null);
		var r = JSON.parse(weather.response);

		//three days forecast
		var temp = r.list[0].main.temp_max;
		var mintemp = r.list[0].main.temp_min;
		var pressure = r.list[0].main.pressure;
		var humidity = r.list[0].main.humidity;
		var dataa = r.list[0].dt_txt;
		var descriptions = r.list[0].weather[0].description;
		//display2aftertommorow
		document.getElementById('display2today').value = "Weather status of "
				+ selectedValue + " \nMaximum Temperature : " + temp
				+ "\n Minumum Temperature : " + mintemp + "\n Pressure : "
				+ pressure + "\n Humidity : " + humidity + "\nDescription : "
				+ descriptions + "\nDates : " + dataa;

		var temp = r.list[1].main.temp_max;
		var mintemp = r.list[1].main.temp_min;
		var pressure = r.list[1].main.pressure;
		var humidity = r.list[1].main.humidity;
		var dataa = r.list[1].dt_txt;
		var descriptions = r.list[1].weather[0].description;

		document.getElementById('display2tommorow').value = "Weather status of "
				+ selectedValue
				+ " \nMaximum Temperature : "
				+ temp
				+ "\n Minumum Temperature : "
				+ mintemp
				+ "\n Pressure : "
				+ pressure
				+ "\n Humidity : "
				+ humidity
				+ "\nDescription : "
				+ descriptions + "\nDates : " + dataa;

		var temp = r.list[3].main.temp_max;
		var mintemp = r.list[3].main.temp_min;
		var pressure = r.list[3].main.pressure;
		var humidity = r.list[3].main.humidity;
		var dataa = r.list[3].dt_txt;
		var descriptions = r.list[3].weather[0].description;
		document.getElementById('display2aftertommorow').value = "Weather status of "
				+ selectedValue
				+ " \nMaximum Temperature : "
				+ temp
				+ "\n Minumum Temperature : "
				+ mintemp
				+ "\n Pressure : "
				+ pressure
				+ "\n Humidity : "
				+ humidity
				+ "\nDescription : "
				+ descriptions + "\nDates : " + dataa;

		$("#displayDiv2").css("visibility", "visible");
		//alert(pressure);

	}
</script>

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
					<li class="active"><a href="homePage.jsp"><span
							class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a></li>
					<li><a href="asking.jsp"><i class="fa fa-car"
							aria-hidden="true"></i> Asking</a></li>

					<li><a href="mypost.jsp"><i class="fa fa-id-card-o"
							aria-hidden="true"></i> My Post</a></li>
					<li>
						<div id="not">
							<!--<button  class="btn btn-default btn-lg btn-link" style="font-size:36px;" >-->
							<a href="homePage.jsp"> <span
								class="glyphicon glyphicon-comment"
								style="font-size: 30px; padding-top: 10px;"></span></a> <span
								id="eg" style="background-color: #000"
								class="badge badge-notify"></span>
							<!--</button>-->
						</div>
					</li>

				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row row-content ">
			<div class="col-sm-2">

				<img src="resource/css/user.png" style="height: 50px; width: 50px"
					class="img-polaroid" />
				<h2>${userData.firstName}</h2>
				<h4>
					<a href="profile.jsp">Edit profile</a>
				</h4>
				<h4>
					<a href="login.jsp">Logout</a>
				</h4>



			</div>
			<div class="col-sm-6">
				<form action="AddPost" method="post">
					<div class="form-group">
						<!--<label for="feedback" class="col-sm-2 control-label">Post</label>-->
						<textarea class="form-control" id="feedback" name="post" rows="4"
							placeholder="Your post here"></textarea>
					</div>
					<div class="form-group">
						<div class="checkbox ">
							<label class="checkbox-inline"> <input type="radio"
								name="postType" value="1" checked> <strong>Asking
									for A ride</strong>
							</label> <label class="checkbox-inline"> <input type="radio"
								name="postType" value="2"> <strong>Giving A
									ride</strong>
							</label>
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-success">Post</button>
					</div>
				</form>
				<div>
					<div class="givingpost">
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
			<div class="col-sm-4">
				<p id="map"></p>
				<script>
					function initMap() {
						var map = new google.maps.Map(document
								.getElementById('map'), {
							center : {
								lat : -34.397,
								lng : 150.644
							},
							zoom : 6
						});
						var infoWindow = new google.maps.InfoWindow({
							map : map
						});

						// Try HTML5 geolocation.
						if (navigator.geolocation) {
							navigator.geolocation
									.getCurrentPosition(
											function(position) {
												var pos = {
													lat : position.coords.latitude,
													lng : position.coords.longitude

												};
												var geocoder;
												geocoder = new google.maps.Geocoder();
												var latlng = new google.maps.LatLng(
														pos.lat, pos.lng);

												geocoder
														.geocode(
																{
																	'latLng' : latlng
																},
																function(
																		results,
																		status) {
																	if (status == google.maps.GeocoderStatus.OK) {
																		if (results[0]) {
																			var add = results[0].formatted_address;
																			var value = add
																					.split(",");

																			count = value.length;
																			country = value[count - 1];
																			state = value[count - 2];
																			city = value[count - 3];

																			var weather = new XMLHttpRequest();
																			uri = "http://api.openweathermap.org/data/2.5/weather?q="
																					+ city
																					+ "&mode=json&appid=42e9cdc534cc0428abefa02488580d5f";
																			weather
																					.open(
																							"GET",
																							uri,
																							false);
																			weather
																					.send(null);
																			var r = JSON
																					.parse(weather.response);
																			var temp = JSON
																					.stringify(r.main.temp_min)
																			var maximumtep = JSON
																					.stringify(r.main.temp_max)
																			var humidity = JSON
																					.stringify(r.main.humidity)
																			var pressure = JSON
																					.stringify(r.main.pressure)
																			var description = r.weather[0].description

																			infoWindow
																					.setPosition(pos);
																			infoWindow
																					.setContent("<strong>Location : </strong>"
																							+ city
																							+ "<strong><br/> Maximum Temperature :</strong> "
																							+ maximumtep
																							+ "<br/><strong> Minimum Temperature : </strong>"
																							+ temp
																							+ "<br/> <strong>Pressure :</strong> "
																							+ pressure
																							+ "<br/> <strong>Humidity :</strong> "
																							+ humidity
																							+ "<br/> <strong>Description :</strong> "
																							+ description);
																			map
																					.setCenter(pos);
																		} else {
																			alert("address not found");
																		}
																	} else {
																		alert("Geocoder failed due to: "
																				+ status);
																	}
																});

											}, function() {
												handleLocationError(true,
														infoWindow, map
																.getCenter());
											});
						} else {
							// Browser doesn't support Geolocation
							handleLocationError(false, infoWindow, map
									.getCenter());
						}
					}

					function handleLocationError(browserHasGeolocation,
							infoWindow, pos) {
						infoWindow.setPosition(pos);
						infoWindow
								.setContent(browserHasGeolocation ? 'Error: The Geolocation service failed.'
										: 'Error: Your browser doesn\'t support geolocation.');
					}
				</script>
				<script async defer
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLjyQb73LjHqjPllBQuIlUoZeFNSUI7Ys&callback=initMap">
					
				</script>

				<p></p>
				<button class="accordion">You Have Travel Plan To Some
					where?</button>
				<div class="panel">
					<form action="testWeather.jsp" method="get">
						<select id="country" class="selectCity"
							onchange="GetSelectedTextValue(this)">
							<option value="Ackley">Ackley</option>
							<option value="Ackworth">Ackworth !</option>
							<option value="Adel">Adel</option>
							<option value="Badger">Badger</option>
							<option value="Baldwin">Baldwin</option>
							<option value="Balltown">Balltown</option>
							<option value="Bancroft">Bancroft</option>
							<option value="Bankston">Bankston</option>
							<option value="Calamus">Calamus</option>
							<option value="Callender">Callender</option>
							<option value="Calumet">Calumet</option>
							<option value="Cantril">Cantril</option>
							<option value="Carbon">Carbon</option>
							<option value="Dakota City">Dakota City</option>
							<option value="Dallas Center">Dallas Center</option>
							<option value="Dana">Dana</option>
							<option value="Danbury">Danbury</option>
							<option value="Danville">Danville</option>
							<option value="Eagle Grove">Eagle Grove</option>
							<option value="Earlham">Earlham</option>
							<option value="Earling">Earling</option>
							<option value="Earlville">Earlville</option>
							<option value="Early">Early</option>
							<option value="Fairbank">Fairbank</option>
							<option value="Fairfax">Fairfax</option>
							<option value="Fairfield">Fairfield</option>
							<option value="Farley">Farley</option>
							<option value="Farmersburg">Farmersburg</option>
						</select>
					</form>
					<div class="displayweather" id="displayDiv2">
						<p>
							Today Weather Status
							<textarea rows=" 8" cols="40" disabled="disabled"
								id="display2today"></textarea>
						</p>
						<p>
							Tomorrow Weather Status
							<textarea rows=" 8" cols="40" disabled="disabled"
								id="display2aftertommorow"></textarea>
						</p>
						<p>
							Tomorrow After Noon Weather Status
							<textarea rows=" 8" cols="40" disabled="disabled"
								id="display2tommorow"></textarea>
						</p>

					</div>
				</div>
				<script>
					var acc = document.getElementsByClassName("accordion");
					var i;
					for (i = 0; i < acc.length; i++) {
						acc[i].onclick = function() {
							this.classList.toggle("active");
							var panel = this.nextElementSibling;
							if (panel.style.display === "block") {
								panel.style.display = "none";
							} else {
								panel.style.display = "block";
							}
						}
					}
				</script>

			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"
		type="text/javascript"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLjyQb73LjHqjPllBQuIlUoZeFNSUI7Ys&callback=initMap">
		
	</script>
</body>
</html>