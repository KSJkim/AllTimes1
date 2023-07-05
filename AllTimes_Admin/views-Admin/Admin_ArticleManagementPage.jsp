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
      	.check{color: white; }
      	.pageInfo{
		    list-style : none;
		    display: inline-block;
		     
		}

		.pageInfo li{
		    float: left;
		    font-size: 20px;
		    padding: 8px 17px;
		    font-weight: 500;
		}
		#pageInfo a:link {color:black; text-decoration: none;}
		#pageInfo a:visited {color:black; text-decoration: none;}
		#pageInfo a:hover {color:black; text-decoration: underline;}
		#pageInfo .active{background-color: #FFAE95; border: solid 1px darkorange;}
		.navbar-nav {color: black;}
		.articleGenre li{background-color: white;font: 12px normal; color:black;}
		.articleGenre a:link{ }
		.articleGenre a:hover{font: 15px bold; color:darkgray;}
      </style>
      </head>

 <body>
 <%@ include file="./includes/Admin_Header.jsp" %>



<section>
	<div class="container">
	<nav class="navbar">
		
	        <ul class="nav navbar-nav articleGenre">
	        	<li class="nav-item"> <a class="nav-link" href="Admin_ArticleManagement?ar_genre=all">전체</a> </li>
	            <li class="nav-item"> <a class="nav-link" href="Admin_ArticleManagement?ar_genre=COVID">COVID-19</a> </li>
		        <li class="nav-item"> <a class="nav-link" href="Admin_ArticleManagement?ar_genre=POLITICS">정치</a> </li>
		        <li class="nav-item"> <a class="nav-link" href="Admin_ArticleManagement?ar_genre=ECONOMY">경제</a> </li>
		        <li class="nav-item"> <a class="nav-link" href="Admin_ArticleManagement?ar_genre=SOCIETY">사회</a> </li>
		        <li class="nav-item"> <a class="nav-link" href="Admin_ArticleManagement?ar_genre=CULTURE">문화</a> </li>
		        <li class="nav-item"> <a class="nav-link" href="Admin_ArticleManagement?ar_genre=SPORT">스포츠</a> </li>
		        <li class="nav-item"> <a class="nav-link" href="Admin_ArticleManagement?ar_genre=INTERNATIONAL">국제</a> </li>
		        <li class="nav-item"> <a class="nav-link" href="Admin_ArticleManagement?ar_genre=SCIENCE">IT</a> </li>
	        </ul>
	     
	     </nav>
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>글 번호</th>
					<th>기사 제목</th>
					<th>관련 항목</th>
					<th>작성자</th>
					<th>작성 날짜</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ArticleList }" var="article">
					<tr>
						<td>${article.ar_no }</td>
						<td>${article.ar_title }</td>
						<c:choose>
							<c:when test="${article.ar_genre == 'POLITICS'}">
								<td>정치</td>
							</c:when>
							<c:when test="${article.ar_genre == 'ECONOMY'}">
								<td>경제</td>
							</c:when>
							<c:when test="${article.ar_genre == 'SOCIETY'}">
								<td>사회</td>
							</c:when>
							<c:when test="${article.ar_genre == 'CULTURE'}">
								<td>문화</td>
							</c:when>
							<c:when test="${article.ar_genre == 'SPORT'}">
								<td>스포츠</td>
							</c:when>
							<c:when test="${article.ar_genre == 'INTERNATIONAL'}">
								<td>국제</td>
							</c:when>
							<c:when test="${article.ar_genre == 'SCIENCE'}">
								<td>IT/과학</td>
							</c:when>
							<c:when test="${article.ar_genre == 'COVID'}">
								<td>COVID-19</td>
							</c:when>
						</c:choose>
						<td>${article.ar_name }</td>
						<td>${article.ar_date }</td>
						<td>
							<a class="btn btn-sm btn-primary text-xs" href="Admin_ArticleInfoPage?ar_no=${article.ar_no }"><i class="check">상세 정보</i></a>
							<a class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal"><i class="check">삭제</i></a>
								<!-- Delete Modal -->
								<div class ="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document" style="max-width: 800px;">
										<div class="modal-content">
											<div class="modal-header">
												<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							                        <span aria-hidden="true">×</span>
							                    </button>
							                    <h4 class="modal-title" id="exampleModalLabel">기사 삭제</h4>
											</div>
											<div class="modal-body">
												<h3>정말로 기사를 삭제하시겠습니까?</h3>
											</div>
											<div class="modal-footer">
							                    <a class="btn btn-danger" type="button" href="Admin_ArticleDelete?ar_no=${article.ar_no }">예</a>
							                    <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
							                </div>
										</div>
									</div>	
								</div>
						</td>
						
					</tr>
				</c:forEach>

			</tbody>
		</table>

	<div class="pageInfo_wrap" style="text-align:center;">
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">
				<!-- 이전페이지 이동 -->
				<c:if test="${paging.prev }">
					<li class="pageInfo_btn previous"><a href="${paging.startPage-1 }">이전으로</a></li>
				</c:if>
				<!-- 페이지 번호 -->
				<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
					<li class="pageInfo_btn ${paging.cri.pageNo == num ? 'active':'' }"><a href="${num }">${num }</a></li>
				</c:forEach>
				<!-- 다음 페이지 이동 -->
				<c:if test="${paging.next }">
					<li class="pageInfo_btn next"><a href="${paging.endPage+1 }">다음으로</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<form id="pageMoveForm" method="get">
		<input type="hidden" name="pageNo" value="${paging.cri.pageNo }">
		<input type="hidden" name="amount" value="${paging.cri.amount }">
	</form>
	<form action="articleSearch" method="get" class="form-group" style="border: 0px; float: right;">
		<div class='input-group'>
			<select name ="searchType">
				<option label="전체" value="tAll"></option>
				<option label="기자 이름" value="tName"></option>
				<option label="제목" value="tTitle"></option>
			</select>
			<input type="text" class="input-group-prepend" name="keyword">
			<button type="submit" class="btn btn-search input-group-append"><i class="fa fa-search"></i></button>
		</div>
	</form>
	</div>


</section>

	<script type="text/javascript">
		var msg = '${deleteMsg}';
		if(msg != ''){
			alert(msg);
		}
	</script>
	<script type="text/javascript">
		var msg = '${ModifyMsg}';
		if(msg != ''){
		alert(msg);
		}
	</script>

	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded",function(){
			$(".pageInfo a").on("click",function(e){
				e.preventDefault();
				$("#pageMoveForm").find("input[name='pageNo']").val($(this).attr("href"));
				$("#pageMoveForm").attr("action", "Admin_ArticleManagement");
				$("#pageMoveForm").submit();
			});
		});
	</script>

	<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/core.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/lightbox-plus-jquery.min.js"></script>
</body>
</html>
