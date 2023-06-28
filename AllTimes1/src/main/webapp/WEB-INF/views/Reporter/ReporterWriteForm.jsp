<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>All Times News</title>

<!--Bootstrap core CSS-->
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/custom.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/responsive-style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/weather-icons.min.css"
	rel="stylesheet">
<link rel="${pageContext.request.contextPath}/stylesheet"
	type="text/css" href="resources/css/font-awesome.min.css" />
<link
	href="${pageContext.request.contextPath}/resources/css/lightbox.min.css"
	rel="stylesheet">
<link rel="${pageContext.request.contextPath}/stylesheet"
	type="text/css" href="resources/css/loaders.css" />

</head>
<body>
	<div class="loader loader-bg">
		<div class="loader-inner ball-pulse-rise"></div>
	</div>


	<!-- Header -->
	<%@ include file="../includes/Header.jsp"%>

	<!-- Navigation -->
	<%@ include file="../includes/infoPageNavigation.jsp"%>

	<!-- Content -->



	<!-- 네비게이션 영역 끝 -->

	<!-- 게시판 글쓰기 양식 영역 시작 -->
	<div class="container">
		<div class="row">
			<form action="ReporterWrite" method="post"
				enctype="multipart/form-data">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<input type="hidden" name="ar_name"
						value="${sessionScope.loginRid}">

					<thead>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">
							기사작성하기</th>
					</thead>
					<div class="container-group row">
						<div class="col-sm-8 mb-3 mb-sm-0">
							<label for="classify"></label>
							<div style="padding-top: 13px;"></div>

							<input type="radio" name="ar_genre" id="classify_e" value="경제"
								onclick="clickCheck(this)"> <label for="classify_e"
								class="btn btn-sm text-xs" style="background-color: orangered">경제</label>&nbsp;&nbsp;

							<input type="radio" name="ar_genre" id="classify_p" value="정치"
								onclick="clickCheck(this)"> <label for="classify_p"
								class="btn btn-sm text-xs" style="background-color: lime">정치</label>&nbsp;&nbsp;

							<input type="radio" name="ar_genre" id="classify_s" value="사회"
								onclick="clickCheck(this)"> <label for="classify_s"
								class="btn btn-sm text-xs" style="background-color: orange">사회</label>&nbsp;&nbsp;

							<input type="radio" name="ar_genre" id="classify_c" value="문화"
								onclick="clickCheck(this)"> <label for="classify_c"
								class="btn btn-sm text-xs" style="background-color: skyblue">문화</label>&nbsp;&nbsp;

							<input type="radio" name="ar_genre" id="classify_x" value="스포츠"
								onclick="clickCheck(this)"> <label for="classify_x"
								class="btn btn-sm text-xs " style="background-color: coral";>스포츠</label>&nbsp;&nbsp;

							<input type="radio" name="ar_genre" id="classify_i" value="국제"
								onclick="clickCheck(this)"> <label for="classify_i"
								class="btn btn-sm text-xs" style="background-color: aqua">국제</label>&nbsp;&nbsp;

							<input type="radio" name="ar_genre" id="classify_S" value="IT/과학"
								onclick="clickCheck(this)"> <label for="classify_S"
								class="btn btn-sm text-xs" style="background-color: dodgerblue">IT/과학</label>&nbsp;&nbsp;

							<input type="radio" name="ar_genre" id="classify_C" value="코로나특보"
								onclick="clickCheck(this)"> <label for="classify_C"
								class="btn btn-sm text-xs"
								style="background-color: blanchedalmond">코로나특보</label>&nbsp;&nbsp;

						</div>

					</div>
					</div>

					<tr>
						<td><input type="text" class="form-control" value="기사 제목"
							name="ar_title" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용"
								value="글 내용" name="ar_detail" maxlength="2048"
								style="height: 350px;"></textarea></td>
					</tr>

				</table>

				<input type="file" name="ar_file"></input>


				<!-- 글쓰기 버튼 생성 -->
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
		</div>
	</div>

	<%@ include file="../includes/Footer.jsp"%>



	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/core.js"></script>

	<!--  Jquery 사용 스크립트 -->
	<script src="resources/js/lightbox-plus-jquery.min.js"></script>

</body>
</html>

