<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<meta charset="UTF-8">
<title>Today Weather</title>
  	
      <link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">

      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

      <!-- Custom styles for this template -->

      <link href="${pageContext.request.contextPath }/resources/css/custom.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath }/resources/css/responsive-style.css" rel="stylesheet">  
      <link href="${pageContext.request.contextPath }/resources/css/weather-icons.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
      <link href="${pageContext.request.contextPath }/resources/css/lightbox.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/loaders.css"/>
      <style></style>
</head>
<body>
	<!-- Header -->
	<%@ include file="includes/Header.jsp" %>
	
	<!-- Navigation -->
	<%@ include file="includes/Navigation.jsp" %>
	<div class="header" style="text-align: center;"><h1>날씨</h1></div>
	<div class="container">
	<div class="row" >
		<div>
			<h5><i class="fa fa-map-marker" aria-hidden="true"></i>${location }</h5>
		</div>
		<div class="row" style="text-align: center;">
			<h1><div class="CurrIcon CurrnStat"></div></h1>
			
			<h4>${current }</h4>
			
			${weekly }
		</div>
	</div>


		
	</div>	
	<!-- Footer -->
	<%@ include file="includes/Footer.jsp" %>





<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
 
	$(document).ready(function() {
		let weatherIcon = {
			'01' : 'fas fa-sun',
			'02' : 'fas fa-cloud-sun',
			'03' : 'fas fa-cloud',
			'04' : 'fas fa-cloud-meatball',
			'09' : 'fas fa-cloud-sun-rain',
			'10' : 'fas fa-cloud-showers-heavy',
			'11' : 'fas fa-poo-storm',
			'13' : 'far fa-snowflake',
			'50' : 'fas fa-smog'
			};

		$.ajax({
		url:'http://api.openweathermap.org/data/2.5/weather?q=incheon&APPID=efba65a4d8d8c06fd2d7fd8183c40f27&units=metric&lang=kr',
		dataType:'json',
		type:'GET',
		success:function(result){
			var $Icon = (result.weather[0].icon).substr(0,2);
			var $Temp = Math.floor(result.main.temp) + 'º';
			var $city = result.name;
			var $stat = result.weather[0].description;
			
			$('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
			$('.CurrnStat').append($stat);
			$('.City').append($city);
			}
			});
			});
	/*$.ajax({
		url:'http://api.openweathermap.org/data/2.5/weather?q=incheon&APPID=efba65a4d8d8c06fd2d7fd8183c40f27&units=metric',

				dataType:'json',
				type:'GET',
				success:function(data){
					var $Icon = (data.weather[0].icon).substr(0,2);
					var $Temp = Math.floor(data.main.temp) + 'º';
					var $city = data.name;
					
					$('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
					$('.CurrnText').append('<span>'+weatherText[$Icon]+'</span>');
					$('.CurrTemp').prepend($Temp);
					$('.City').append($city);
					}
					})
					});
*/	
</script>


<!-- Bootstrap core JavaScript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="resources/js/jquery.min.js"></script> 
<script src="resources/js/bootstrap.min.js"></script> 
<script src="resources/js/core.js?ver=1"></script> 

<!--  Jquery 사용 스크립트 -->
<script src="resources/js/lightbox-plus-jquery.min.js"></script> 
</body>
</html>