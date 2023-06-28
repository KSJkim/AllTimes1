<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="UTF-8">
		<title>정치 - 올타임즈</title>
		<link href="##" rel="stylesheet" type="text/css">
		<style type="text/css">
			#main{
				overflow:auto;/* 기사 내용이 길어지면  */
			}
		</style>
	</head>
	<body>
		<!-- 메뉴 바 -->
		<main>
			<!-- 기사 내용 출력 -->
			<div class="##"><!-- 제목과 기자명 등이 출력될 기사 상단부 -->
				<div class="##">
					${articleRead.ar_title}<!-- 기사 제목 -->
				</div>
				<div class="##">
					<span class="##">
						${articleRead.ar_name} 기자
					</span>
					<span class="##">
						등록일자 : ${articleRead.ar_date}
					</span>
					<span class="##">
						조회수 : ${articleRead.ar_hits}
					</span>
				</div>
			</div>
			<!-- 기사본문 -->
			<div class="##">
				<div class="##">
					<!-- 기사 대표 사진 -->
					<img src="##">
					<p class="##">
						<!-- 사진의 간략한 설명 -->
					</p>
				</div>
				<p class="##">
					<!-- AR_DETAIL 기사 내용 -->
				</p>
				<div class="##"><!-- 기사 추천 -->
					<span class="##"><!-- 기사 추천 -->
						
					</span>
					<span class="##"><!-- 기사 비추천 -->
						
					</span>
				</div>			
			</div>
			<div class="##"><!-- 댓글 입력 -->
				<div class="##">
					<form action="commentsWrite" method="get" >
						<div class="##">
							<div class=##">
								<textarea class="##" name="cm_detail">
								
								</textarea>
							</div>
							<input type = "hidden" name="cm_writer" value="${sessionScope.loginID}">
							<input type = "hidden" name="ar_no" value="${articleRead.ar_no}">
							<div>
								<input type="submit" class="##" value="등록">
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="##"> <!-- 여백 두기 -->
					
			</div>
			
			<div class="##"><!-- 댓글 목록 -->
				<div class="##"><!-- 댓글 갯수 -->
					댓글 <span class="##">${commentsCount}</span>
				</div>
				<c:if test="${commentsCount != null}">					
					<c:forEach items="${commentsList}" var="comments">
						<div class="comment-list">
							<div class="comment-wrapper">
								<div class="comment-top">
									<span class="comment-writter">
										<em>${comments.cm_writer }</em>
									</span>
									<span class="comment-date">
										<em>${comments.cm_date }</em>
									</span>	
								</div>
								<div class="comment-bottom">
									<div class="comment-text">
										${comments.cm_detail }
									</div>
									<c:if test="${comments.cm_writer == sessionScope.sessionID}">
										<a href="">수정</a></br>
										<a href="">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</main>
		<!-- 하단부 바 -->
	</body>
</html>