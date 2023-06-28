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
		<div class="col-lg-8">
		
                       <div class="p-5" style="float: center;">
                           <div class="text-center">
                               <h1 class="h4 text-gray-900 mb-4" style="margin-left: 13px;">
                               <img class="img-profile profile-circle" src= "${pageContext.request.contextPath }/resources/upLoadedFile/ReporterProfile/${ReporterInfo.rprofile }" alt="" >
                               		${ReporterInfo.rid }님의 정보수정페이지
                               </h1>
                               	<button class="btn btn-sm btn-primary text-xs" data-toggle="modal" data-target="#profileModal">프로필 수정 </button>
                               	<a class="btn btn-sm btn-danger text-xs" style="float:right;" data-toggle="modal" data-target="#deleteModal"><i class="check">계정 삭제</i></a>
                           </div>
                           <form action="Admin_ReporterModify" method="post" onsubmit="return modifyFormCheck();">
                                
                               <div class="form-group row">
                                   <div class="col-sm-6 mb-3 mb-sm-0">
                                   <label for="viewRid">아이디</label>
                                       <input type="text" name="rid" class="form-control form-control-user" value="${ReporterInfo.rid }" disabled="disabled">
                                       <input type="hidden" name="rid" class="form-control form-control-user" value="${ReporterInfo.rid }">
                                   </div>
                                   <div class="col-sm-6">
                                   		<label for="viewRpw">비밀번호</label>
                                   		<input type="text" name="rpw" class="form-control form-control-user " value="">
                                   </div>                                    
                               </div>
                               <div class="form-group row">
                                   <div class="col-sm-6 mb-3 mb-sm-0">
                                   	<label for="viewRname">이름</label>
                                       <input type="text" name="rname" id="inputRname" class="form-control form-control-user " value="${ReporterInfo.rname }">
                                       <span id="nameCheckMsg" style="font-size: 10px;"> </span>
                                   </div>
                                   <div class="col-sm-4">
                                   <label>글 작성 권한</label>
										<input type="hidden" id="hiddenRstate" value="${ReporterInfo.rstate }">
                                       	<input type="text" name="" id="viewRstate" class="form-control form-control-user " value="권한 있음" disabled="disabled">

                                   </div>
                               </div>
                               <div class="form-group">
                               	<label>연락처</label>
                               	<input type="text" id="inputRcontact" name="rcontact" class="form-control form-control-user " value="${ReporterInfo.rcontact }">
                               	<span id="telCheckMsg" style="font-size: 10px;"> </span>
                               </div>
                               <div class="form-group">

                               	<label for="viewMemail">이메일</label>
                                   <input type="email" name="rmail" id="inputRmail" class="form-control form-control-user" value="${ReporterInfo.rmail }">

                               </div>
                               <hr>
                               <input type="submit" class="btn btn-primary" id="submitBtn" style="float:right; " value="정보수정">
                         </form>
                          <a href="Admin_ReporterManagement" class="btn btn-secondary btn-user">목록으로</a>
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
                    <h4 class="modal-title" id="exampleModalLabel">계정 삭제</h4>
				</div>
				<div class="modal-body">
					<h2>정말로 계정을 삭제하시겠습니까?</h2>
				</div>
				<div class="modal-footer">
                    <a class="btn btn-danger" type="button" href="Admin_ReporterDelete?rid=${ReporterInfo.rid }">예</a>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
                </div>
			</div>
		</div>	
	</div>
	<!-- 프로필 Modal -->
	<div class ="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document" style="max-width: 800px;">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="exampleModalLabel">프로필 변경</h4>
				</div>
				<form action="Admin_ReporterProfileChange" method="post" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="form-group filebox">
	                     <input class="form-control form-control-user file-name" id="file-name" value="" placeholder="파일을 선택해 주세요." disabled="disabled">
	                     <label for="inputFile" class="btn btn-primary btn-user" style="float: right;">파일찾기</label>
	                     <input type="file" id="inputFile" onchange="fileChange(this)" name="rfile" class="form-control form-control-ser">
                     </div>   
					<input type="hidden" name="rid" value="${ReporterInfo.rid }">
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
document.addEventListener("DOMContentLoaded", function(){

	
	var rstate= $('#hiddenRstate').val();
	var state ="";
	if(rstate==1){
		state="권한있음";
	}else if(rstate==0){
		state="권한없음";
	}
	console.log(rstate);
	console.log(state);
	$('#viewRstate').val(state);
});
</script>
<script type="text/javascript">
	function fileChange(file){
		var fileInfo = $('#inputFile').val();
		var fileName = file.value.substring(fileInfo.lastIndexOf("\\")+1);
		$('#file-name').val(fileName);
	}
</script>

<script type="text/javascript">
	var checkName = false;
	var checkTel = false;
	
	document.addEventListener("DOMContentLoaded", function(){
		$("#inputRname").keyup(function() {
			var inputName = $("#inputRname").val();
			
			if(inputName.length > 0){
				$("#nameCheckMsg").css("color", "white").text("");
				checkName = true;
			}else{
				$("#nameCheckMsg").css("color", "red").text("이름을 입력해주세요.");
				checkName = false;
			}
		});
		
		$("#inputRcontact").keyup(function() {
			var inputContact = $("#inputRcontact").val();
			
			
			if(inputContact.length > 0){
				$.ajax({
					type : "get",
					url : "reporterTelCheck",
					data : {"inputContact" : inputContact},
					success : function(result){
						if(result == "OK"){
							$("#telCheckMsg").css("color", "green").text("사용 가능합니다.");
							checkTel = true;
						}else{
							$("#telCheckMsg").css("color", "red").text("사용중인 연락처 입니다.");
							checkTel = false;
						}
					}
				});
			}else{
				$("#telCheckMsg").css("color", "red").text("연락처를 입력해주세요.");
				checkTel = false;
			}
		});
	});
</script>

<script type="text/javascript">

function modifyFormCheck() {
	
	var checkRname = $("#inputRname").val();
	
	if (checkRname.length == 0) {
		console.log("이름을 입력해야 합니다. ");
		alert("이름을 입력해주세요!");
		$("#inputRname").focus();
		return false;
	}
	var checkRmail = $('#inputRmail').val();
	
	if(checkRmail.length == 0){
		console.log("이메일을 입력해야 합니다. ");
		alert("이메일을 입력해주세요!");
		$("#inputRmail").focus();
		return false;
	}
	if (!checkTel) {
		console.log("연락처를 입력해야 합니다. ");
		alert("연락처를 입력해주세요!");
		$("#inputRcontact").focus();
		return false;
	}
}
</script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js?ver=1"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js?ver=1"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/core.js?ver=1"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/lightbox-plus-jquery.min.js?ver=1"></script>
</body>

</html>