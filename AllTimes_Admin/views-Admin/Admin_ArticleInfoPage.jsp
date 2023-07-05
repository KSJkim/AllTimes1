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
      	.profile-circle{width: 60px;height: 60px; border-radius: 60% !important;}
      	.filebox .file-name{
			display: inline-block;
			height: 40px;
			padding: 0 10px;
			vertical-align: middle;
			border: 1px solid #dddddd;
		    width: 82%;
		    color: #999999;
		    overflow:hidden;
		    text-overflow: ellipsis;
		}
		.filebox label{
		    display: inline-block;
		    padding: 10px 20px;
		    color: #fff;
		    vertical-align: middle;
		    cursor: pointer;
		    height: 40px;
		    margin-left: 10px;
		}
		.filebox input[type="file"]{
		    position: absolute;
		    width: 0;
		    height: 0;
		    padding: 0;
		    overflow: hidden;
		    border: 0;
		}
      </style>
      </head>

 <body>
      <%@ include file="./includes/Admin_Header.jsp" %>
<section>
<div class="container-fluid" style="width:800px;height:600px;margin:0 auto;">
	<div class="card-body">
		<div class="row">
		<div >
		
                       <div class="p-5" style="float: center;">
                           <div style="border-bottom: solid 2px orangered; padding:8px;">
                               <div class="h1 text-dark-900 mb-4"><strong>
                               		${ArticleInfo.ar_title }
                               </strong></div>
                               ${ArticleInfo.ar_name} 기자
                               <div class="pull-right">
                               		<span style="color: #999999; font-size:9px;">${ArticleInfo.ar_date}</span>|
                               		<a class="btn btn-link btn-sm" href="Admin_articleModifyPage?ar_no=${ArticleInfo.ar_no }">수정</a>
                               		<a class="btn btn-link btn-sm" style="color: red;" data-toggle="modal" data-target="#deleteModal">삭제</a>
                               	</div><br>
                           </div>
                           <div class="text-center">
                           	<br>
                                <img class="img-responsive img-thumbnail" src= "${pageContext.request.contextPath }/resources/upLoadedFile/ArticleFile/${ArticleInfo.ar_img }" alt="" >
                            	<br><br>${ArticleInfo.ar_detail}
                            	<br><br><br>
                            	<div>
                            		<h5>댓글</h5>
                            		<hr>
                            		<c:choose>
                            		<c:when test="${Comments!= '[]'}">
	                            		<c:forEach items="${Comments}" var="com" >
	                            			<strong>${com.cm_writer}</strong> <span style="color: #999999; font-size:9px;">
	                            			${com.cm_date }	
	                            			<div class="pull-right">
	                            			
	                               				<a class="btn btn-link btn-sm" data-toggle="modal" data-target="#commentDeleteModal" style="color: red;">삭제</a>
		                               		</div></span><br>
	                            				${com.cm_detail}<hr>
	                            												<!-- Delete Modal -->
								<div class ="modal fade" id="commentDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document" style="max-width: 800px;">
										<div class="modal-content">
											<div class="modal-header">
												<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							                        <span aria-hidden="true">×</span>
							                    </button>
							                    <h4 class="modal-title" id="exampleModalLabel">댓글 삭제</h4>
											</div>
											<div class="modal-body">
											<h6><strong>'${com.cm_detail }'</strong></h6>
											<h3 style="color:#888888">해당 댓글을 삭제하시겠습니까?</h3>
											</div>
											<div class="modal-footer">
							                    <a class="btn btn-danger" type="button" href="Admin_commentDelete?ar_no=${com.cm_ar_no }&cm_no=${com.cm_no}">예</a>
							                    <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
							                </div>
										</div>
									</div>	
								</div>
	                            		</c:forEach>
                            		</c:when>
                            		<c:otherwise>
                            				댓글이 없습니다.
                            			<hr>
                            		</c:otherwise>
                            		</c:choose>
                            	</div>
								
                               <input type="submit" class="btn btn-danger" id="submitBtn" style="float:right;"data-toggle="modal" data-target="#deleteModal" value="삭제">
                       </div>
                          <a href="Admin_ArticleManagement?ar_genre=all" class="btn btn-secondary btn-user">목록으로</a>
                   </div>

         		</div>     
         		          
			</div>
		
		</div>
	</div>
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
                    <a class="btn btn-danger" type="button" href="Admin_ArticleDelete?ar_no=${ArticleInfo.ar_no }">예</a>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
                </div>
			</div>
		</div>	
	</div>
</section>
	<script type="text/javascript">
		var msg ='${CommentDelMsg}';
		if(msg !=''){
			alert(msg)
		}
	</script>
<script type="text/javascript">
	function fileChange(file){
		var fileInfo = $('#inputFile').val();
		var fileName = file.value.substring(fileInfo.lastIndexOf("\\")+1);
		$('#file-name').val(fileName);
	}
</script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js?ver=1"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js?ver=1"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/core.js?ver=1"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/lightbox-plus-jquery.min.js?ver=1"></script>
</body>

</html>