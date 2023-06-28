<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <header>
        <div class="small-top">
    <div class="container">
            <div class="col-lg-4 date-sec hidden-sm-down">
        <div id="Date"></div>
      </div>
            <div class="col-lg-3 offset-lg-5">
        <div class="social-icon"> 
        
        <c:choose>

        	<c:when test="${sessionScope.loginMid != null }">
        		<a href="MemberInfo" class="#">내정보보기</a>
        		<a href="MemberLogout" class="#">로그아웃</a>
        	</c:when>
        	

        	<c:when test="${sessionScope.loginRid != null }">
        		<a href="ReporterWriteForm" class="#">기사작성</a>
        		<a href="ReporterModifyForm?rid=${sessionScope.loginRid}" class="#">내정보보기</a>
        		<a href="MemberLogout" class="#">로그아웃</a>
        	</c:when>
        	
 
        	<c:otherwise>
        		<a href="MemberJoinForm" class="#">회원가입</a> 
       			<a href="MemberLoginForm" class="#">로그인</a> 
        	</c:otherwise>
        </c:choose>
        	
        	
       		 
        	

       </div>
      </div>
          </div>
  </div>
        <div class="top-head left">
    <div class="container">
            <div class="row">
        <div class="col-md-6 col-lg-4"> 
                <h1> <!-- 메인제목밑에는 슬로거같은 문구를 넣어뒀습니다 -->
                	<a href="${pageContext.request.contextPath }/" style="color: white;">All Times<br>
                		<small>We Make World</small> 
                	</a>
                </h1>
              </div>
        
   <c:choose>
     <c:when test="${sessionScope.loginMid != null }">
    	<div class="col-md-6 col-lg-5 offset-lg-3 admin-bar hidden-sm-down">
                <nav class="nav nav-inline">  <a href="MemberInfo?mid=${sessionScope. loginMid }" class="nav-link">${sessionScope. loginMname }님 환영합니다 !</a> </nav>
              </div>
     </c:when>
     <c:when test="${sessionScope.loginRid != null }">
     	<div class="col-md-6 col-lg-5 offset-lg-3 admin-bar hidden-sm-down">
                <nav class="nav nav-inline"> <a href="ReporterModifyForm?rid=${sessionScope.loginRid}" class="nav-link">${sessionScope. loginRname }기자님 환영합니다 !<img class="resources/img-fluid img-circle" src="resources/img/${sessionScope. loginRprofile }"></a> </nav>
              </div>
     </c:when>
     
   </c:choose>      
           
      </div>
          </div>
  </div>
      </header>