<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <nav class="navbar top-nav">
        <div class="container">
    <button class="navbar-toggler hidden-lg-up " type="button" data-toggle="collapse" data-target="#exCollapsingNavbar2" aria-controls="exCollapsingNavbar2" aria-expanded="false" aria-label="Toggle navigation"> &#9776; </button>
    <div class="collapse navbar-toggleable-md" id="exCollapsingNavbar2"> <a class="navbar-brand" href="#">Responsive navbar</a>
            <ul class="nav navbar-nav ">
        <li class="nav-item active"> <a class="nav-link" href="${pageContext.request.contextPath }/">Home <span class="sr-only">(current)</span></a> </li>
        <li class="nav-item"> <a class="nav-link" href="selectArticleList?ar_genre=COVID">COVID-19</a> </li>
        <li class="nav-item"> <a class="nav-link" href="selectArticleList?ar_genre=POLITICS">정치</a> </li>
        <li class="nav-item"> <a class="nav-link" href="selectArticleList?ar_genre=ECONOMY">경제</a> </li>
        <li class="nav-item"> <a class="nav-link" href="selectArticleList?ar_genre=SOCIETY">사회</a> </li>
        <li class="nav-item"> <a class="nav-link" href="selectArticleList?ar_genre=CULTURE">문화</a> </li>
        <li class="nav-item"> <a class="nav-link" href="selectArticleList?ar_genre=SPORT">스포츠</a> </li>
        <li class="nav-item"> <a class="nav-link" href="selectArticleList?ar_genre=INTERNATIONAL">국제</a> </li>
        <li class="nav-item"> <a class="nav-link" href="selectArticleList?ar_genre=SCIENCE">IT</a> </li>
      </ul><!-- href 링크 변경 -->
              <form action="SearchArticle" method="post" onsubmit="return searchCheck();"  enctype="multipart/form-data" class="pull-xs-right">
        <div class="search">
                <input type="text" id="SearchArticle" name="SearchArticle" class="form-control" maxlength="64" placeholder="기사 제목을 입력해주세요">
                <button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
              </div>
      </form>
      
      
      
      
          </div>
  </div>
  
  	<script type="text/javascript">
  	
      	function searchCheck(){
      		
      		var checkAr_detail = $("SearchArticle").val();
      		//var search = document.getElementById("SearchArticle").value;
      		
      		if(checkAr_detail == ''){
      			alert("검색어를 입력해주세요");
      			$("SearchArticle").focus();
      			return false;
      		}
      	}
      </script>
      
      </nav>