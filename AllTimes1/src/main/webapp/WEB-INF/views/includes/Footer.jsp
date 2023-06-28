<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <footer>
        <div class="container">
    <div class="row">

            <div class="col-lg-2 col-md-4">
        <h6 class="heading-footer">MENU</h6>
        <ul class="footer-ul">
                <li><a href="COVID_PAGE"> Covid-19</a></li>
                <li><a href="POLITICS_PAGE"> 정치</a></li>
                <li><a href="ECONOMY_PAGE"> 경제</a></li>
                <li><a href="SOCIETY_PAGE"> 사회</a></li>
                <li><a href="CULTURE_PAGE"> 문화</a></li>
                <li><a href="SPORTS_PAGE"> 스포츠</a></li>
                <li><a href="INTERNATIONAL_PAGE"> 국제</a></li>
                <li><a href="SCIENCE_PAGE"> IT</a></li>
              </ul>
      </div>
      
       <div class="col-lg-4 col-md-12">
      	<h6 class="heading-footer">HIT'S TOP5</h6>
	    <div class="post">
            <c:forEach items="${ArticleHits }" var="hits">
           			<p><a href="ArticleInfo?ar_no=${hits.ar_no }" style="color: darkgrey;">${hits.ar_title }<span>${hits.ar_date }</span></a></p>
			</c:forEach>
         </div>
      </div>
      	
      
            <div class="col-lg-4 col-md-12">
        		<h6 class="heading-footer">LATEST NEWS</h6>
        		<div class="post">
        		<c:forEach items="${ArticleLatestFooter }" var="lastest">
           			<p><a href="ArticleInfo?ar_no=${lastest.ar_no }" style="color: darkgrey;">${lastest.ar_title }<span>${lastest.ar_date }</span></a></p>
				</c:forEach>
        		 </div>
      		</div>
            
            <div class="col-lg-2 col-md-4 social-icons">
        <h6 class="heading-footer">Make People</h6>
        <ul class="footer-ul">
                <li><i class="fas fa-user-alt"></i> 김성재</li>
                <li><i class="fas fa-user-alt"></i> 고우석</li>
                <li><i class="fas fa-user-alt"></i> 강대호</li>
                <li><i class="fas fa-user-alt"></i> 백세현</li>
                <li><i class="fas fa-user-alt"></i> 황규성</li>
              </ul>
      </div>
      

      
          </div>
  </div>
      </footer>
<!--footer start from here-->

<div class="copyright">
        <div class="container">
    <!--  <div class="col-lg-6 col-md-4">-->
            <p>
            <strong>Copyright by All Times Co., Ltd. All Rights Reserved</strong>
			</p>
          </div>

  </div>