<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
      </style>
      </head>

 <body>
 	<%@ include file="./includes/Admin_Header.jsp" %>
<section>
	<div class="container">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>나이</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${searchResult }" var="Result">
					<tr>
						<td>${Result.mid }</td>
						<td>${Result.mname }</td>
						<td>${Result.mmail }</td>
						<td>${Result.mage }</td>
						<td><a class="btn btn-sm btn-primary text-xs" href="Admin_MemberModifyPage?mid=${Result.mid }"><i class="check">확인</i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
	<form action="memberSearch" method="post" class="form-group" style="border: 0px; float: right;">
		<div class='input-group'>
			<select name ="searchType">
				<option label="전체" value="tAll"></option>
				<option label="아이디" value="tId"></option>
				<option label="이름" value="tName"></option>
			</select>
			<input type="text" class="input-group-prepend" name="keyword">
			<button type="submit" class="btn btn-search input-group-append"><i class="fa fa-search"></i></button>
		</div>
	</form>
	</div>
</section>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/core.js"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/lightbox-plus-jquery.min.js"></script>
</body>
</html>
