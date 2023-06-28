<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>All Times News</title>

<!--Bootstrap core CSS-->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Custom styles for this template -->

<link href="resources/css/custom.css" rel="stylesheet">
<link href="resources/css/responsive-style.css" rel="stylesheet">
<link href="resources/css/weather-icons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="resources/css/font-awesome.min.css" />
<link href="resources/css/lightbox.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/loaders.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<style></style>
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


	<!-- Header -->
	<%@ include file="../includes/Header.jsp"%>

	<!-- Navigation -->
	<%@ include file="../includes/Navigation.jsp"%>

	<!-- Content -->

	<section class="section-01">
		<div class="container">
			<form action="ArticleModifyRequest" method="post"
				enctype="multipart/form-data">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">

					<input type="hidden" name="ar_no" value="${ArticleModify.ar_no}">
					<thead>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">
							기사작성하기</th>
					</thead>
					<div class="container-group row">
						<div class="col-sm-8 mb-3 mb-sm-0">
							<label for="classify"></label>
							<div style="padding-top: 13px;"></div>


							<label>기사 분류</label> <input type="text" name="ar_genre"
								id="classify" value="${ArticleModify.ar_genre}">
						</div>

					</div>
					</div>


					<tr>
						<td><input type="text" class="form-control"
							value="${ArticleModify.ar_title}" name="ar_title" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control"
								placeholder="${ArticleModify.ar_detail}"
								value="${ArticleModify.ar_detail}" name="ar_detail"
								maxlength="2048" style="height: 350px;"></textarea></td>
					</tr>


				</table>


				<input type="file" name="ar_file"></input>
				<p>
				</p>
				
						<input type="submit"
							class="btn btn-primary" 
							id="submitBtn"  style= "float: right;" value="기사수정"> 
							&nbsp;&nbsp;
							<input type="button"
							class="btn btn-primary" style= "float: right;" value="삭제"
							onclick="ArticleDelete(${ArticleModify.ar_no},${sessionScope.loginRid })">
				
			</form>

		</div>
	</section>




	<!-- Footer -->
	<%@ include file="../includes/Footer.jsp"%>



	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/core.js"></script>

	<!--  Jquery 사용 스크립트 -->
	<script src="resources/js/lightbox-plus-jquery.min.js"></script>


	<script>
	function ArticleDelete(ar_no, rid){
		location.href="ArticleDelete?ar_no="+ar_no+"&rid="+rid;
	}
	</script>
</body>
</html>

