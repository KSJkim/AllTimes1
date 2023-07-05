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
		<div>
				<form action="Admin_articleModify?ar_no=${ArticleInfo.ar_no }" method="post">
                       <div class="p-5" style="float: center;">
                           <div style="border-bottom: solid 2px orangered; padding:8px;">
                               <div class="h1 text-dark-900 mb-4"><strong>
                               <input type="text" name="ar_title" value="${ArticleInfo.ar_title }">
                               </strong></div>
                               	${ArticleInfo.ar_name} 기자
                               <div class="pull-right">
                               		<span style="color: #999999; font-size:9px;" name="ar_date">${ArticleInfo.ar_date}</span>
                               	</div><br>
                           </div>
                           <div class="text-center">
                           	<br>
                                <img class="img-responsive img-thumbnail" src= "${pageContext.request.contextPath }/resources/upLoadedFile/ArticleFile/${ArticleInfo.ar_img }">
                                <br><a class="btn btn-sm btn-primary text-xs" style="color:white;" data-toggle="modal" data-target="#imgChangeModal">이미지 수정 </a>
                            	<br><br><textarea onkeydown="autoResize(this)" onkeyup="autoResize(this)" style="resize: none; width:80%; height:300px;" name="ar_detail"> ${ArticleInfo.ar_detail}</textarea>
                            	<br><br><br>
                               <input type="submit" class="btn btn-primary" id="submitBtn" style="float:right;" value="수정하기">
                       </div>
                          <a href="Admin_ArticleInfoPage?ar_no=${ArticleInfo.ar_no }" class="btn btn-secondary btn-user">수정 취소</a>
                   </div>
				</form>
         		</div>     
         		          
			</div>
		
		</div>
	</div>

		<!-- 프로필 Modal -->
	<div class ="modal fade" id="imgChangeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document" style="max-width: 800px;">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="exampleModalLabel">파일 변경</h4>
				</div>
				<form action="Admin_articleImgChange" method="post" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="form-group filebox">
	                     <input class="form-control form-control-user file-name" id="file-name" value="" placeholder="파일을 선택해 주세요." disabled="disabled">
	                     <label for="inputFile" class="btn btn-primary btn-user" style="float: right;">파일찾기</label>
	                     <input type="file" id="inputFile" onchange="fileChange(this)" name="ar_file" class="form-control form-control-ser">
                     </div>   
					<input type="hidden" name="ar_no" value="${ArticleInfo.ar_no }">
				</div>
				
				<div class="modal-footer">
                    <input class="btn btn-warning text-xs" type="submit" value="변경">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
                </div>
                </form>
			</div>
		</div>	
	</div>
</section>
<script type="text/javascript">
	function fileChange(file){
		var fileInfo = $('#inputFile').val();
		var fileName = file.value.substring(fileInfo.lastIndexOf("\\")+1);
		$('#file-name').val(fileName);
	}
	function autoResize(obj){
		obj.style.height = "300px";
		obj.style.height = (11+obj.scrollHeight)+"px";
	}
</script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js?ver=1"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js?ver=1"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/core.js?ver=1"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/lightbox-plus-jquery.min.js?ver=1"></script>
</body>

</html>