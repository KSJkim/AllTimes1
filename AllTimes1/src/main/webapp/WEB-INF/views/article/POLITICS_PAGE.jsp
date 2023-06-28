<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
		<title>AllTimes : 정치 기사 페이지</title>
		<!--Bootstrap core CSS-->
		<link href="resources/css/bootstrap.min.css" rel="stylesheet">
		<link href="resources/css/custom.css" rel="stylesheet">
		<link href="resources/css/responsive-style.css" rel="stylesheet">  
		<link href="resources/css/weather-icons.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="resources/css/font-awesome.min.css" />
		<link href="resources/css/lightbox.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="resources/css/loaders.css"/>
		<script src="resources/js/core.js?ver=1"></script>
	</head>
	<body>
		<!-- 메뉴 바 -->
		
		<!-- 이 페이지로 보내준 메뉴바 링크 뒤에 ?ar_genre=대문자로만 이루어진 컬럼명 입력
		ex) <a href="articleList?ar_genre=POLITICS">경제</a>-->
		
		<!-- 기사 목록 -->		
		<h3>정치 기사 목록</h3>
		<hr>
		<div class="page_info">
			총 ${articleCount} 건의 기사가 있습니다.<!--  -->
		</div>
		<div class="##">
			<!-- AR_GENRE가 POLITICS인 행 -->
			<div class="##" >
				<ul class="##">
					<c:forEach items="${articleList}" var="article">
						<li>
							<div class="##">
								<a href="articleRead?ar_no=${article.ar_no}&ar_genre=${article.ar_genre}">
									<img src="##">	<!-- 기사의 대표 이미지  -->
								</a>	
							</div>
							<div class="##">
								<!-- 기사의 제목. 길면 중간부터 생략하기(css에서 text-overflow) -->
								<a href="articleRead?ar_no=${article.ar_no}&ar_genre=${article.ar_genre}" class="##">${article.ar_title}</a>
								<span class="##" >	<!-- AR_DETAIL-->
									<!-- 기사의 본문. 중간부터 생략하기(css에서 text-overflow) -->
									<a href="articleRead?ar_no=${article.ar_no}&ar_genre=${article.ar_genre}" class="##">${article.ar_detail}</a>
								</span>
							</div>	
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- 하단 바 -->
	</body>
</html>