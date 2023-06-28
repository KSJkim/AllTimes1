<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>AllTimes</title>

      <!--Bootstrap core CSS-->
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
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" />
      <link href="${pageContext.request.contextPath }/resources/css/lightbox.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/loaders.css"/>
      <style>
      	.small-top{background: orangered;}
      	.top-head{background: orangered;}
      	.check{color: white; }
      	#logout{color:white;}
      	#logout:hover{color: red;}
      	
      </style>
</head>
<body>
       <div class="loader loader-bg">
        <div class="loader-inner ball-pulse-rise">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
<header>
  <div class="small-top">
    <div class="container">
      <div class="col-lg-4 date-sec hidden-sm-down">
        <div id="Date"></div>
      </div>
      <div class="col-lg-3 offset-lg-5">
        <div class="social-icon admin-bar">
        <a href="MemberLogout" id="logout"><span>로그아웃</span></a>
        </div>
      </div>
          </div>
  </div>
  <div class="top-head left">
    <div class="container">
            <div class="row">
        <div class="col-md-6 col-lg-4">
                <h1><a href="Admin_Home" style="color: white;">AllTimes</a>
                <small>Admin Page</small></h1>
              </div>
        <div class="col-md-6 col-lg-5 offset-lg-3 admin-bar hidden-sm-down"><!-- 관리자 로그인 => 로그인 폼 연결로 변경 해야함 -->
                <nav class="nav nav-inline">
                <a href="Admin_Home" class="nav-link">Admin <img class="img-fluid img-circle" src="${pageContext.request.contextPath }/resources/img/admin-bg.jpg"></a> </nav>
              </div>
      </div>
          </div>
  </div>
</header>
<nav class="navbar top-nav">
        <div class="container">
    <button class="navbar-toggler hidden-lg-up " type="button" data-toggle="collapse" data-target="#exCollapsingNavbar2" aria-controls="exCollapsingNavbar2" aria-expanded="false" aria-label="Toggle navigation"> &#9776; </button>
    <div class="collapse navbar-toggleable-md" id="exCollapsingNavbar2"> <a class="navbar-brand" href="#">Responsive navbar</a>
        <ul class="nav navbar-nav ">
       	<li class="nav-item active" id="adminHome"> <a class="nav-link" href="Admin_Home">홈페이지 </a> </li>
        <li class="nav-item" id="memManegement"> <a class="nav-link" href="Admin_MemberManagement">회원계정 관리<span class="sr-only">(current)</span></a> </li>
      	<li class="nav-item" id="repManegement"> <a class="nav-link" href="Admin_ReporterManagement">기자계정 관리</a> </li>
      	<li class="nav-item" id="artiManegement"> <a class="nav-link" href="Admin_ArticleManagement?ar_genre=all">기사 관리</a> </li>
      </ul>
     </div>
  </div>
</nav>

<script type="text/javascript">
	var session = "<%=(String)session.getAttribute("activeEle")%>";

	document.addEventListener("DOMContentLoaded",function(){
		if(session == "memManegement"){
			$(".nav-item").removeClass("active");
			$("#memManegement").addClass("active");
		}else if(session == "repManagement"){
			$(".nav-item").removeClass("active");
			$("#repManegement").addClass("active");
		}else if(session == "artiManagement"){
			$(".nav-item").removeClass("active");
			$("#artiManegement").addClass("active");
		}else if(session == "adminHome"){
			$(".nav-item").removeClass("active");
			$("#adminHome").addClass("active");
		}
	});
</script>
</body>
</html>