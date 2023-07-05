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
      	.check{color: white;}
      </style>
      </head>

 <body>
      <%@ include file="./includes/Admin_Header.jsp" %>
<section>
<div class="container-fluid" style="width:800px; height:600px; margin:0 auto;">
	<div class="card-body">
		<div class="row">
		<div class="col-lg-8">
                       <div class="p-5" style="float: center;">
                           <div class="text-center">
                               <h1 class="h4 text-gray-900 mb-4">
                               	정보수정페이지
                               </h1>
                           </div>
                           <form action="Admin_MemberModify" method=post onsubmit="return modifyCheck();">
                               <div class="form-group row">
                                   <div class="col-sm-6 mb-3 mb-sm-0">
                                   <label for="viewMid">아이디</label>
                                       <input type="text" id="inputMid" name="mid" class="form-control form-control-user" value="${MemberInfo.mid }" disabled="disabled">
                                       <input type="hidden" name="mid" class="form-control form-control-user" value="${MemberInfo.mid }">
                                   </div>
                                   <div class="col-sm-6">
                                   <label for="viewMpw">비밀번호</label>
                                       <input type="text" id="inputMpw" name="mpw" class="form-control form-control-user " value="">
                                   </div>                                    
                               </div>
                               <div class="form-group row">
                                   <div class="col-sm-6 mb-3 mb-sm-0">
                                   	<label for="viewMname">이름</label>
                                       <input type="text" id="inputMname" name="mname" class="form-control form-control-user " value="${MemberInfo.mname }">
                                       <span id="nameCheckMsg" style="font-size: 10px;"></span>
                                   </div>
                               </div>
                               <div class="form-group">
                               	<label>연락처</label>
                               	<input type="text" id="inputMcontact" name="mcontact" class="form-control form-control-user " value="${MemberInfo.mcontact }">
                               	<span id="telCheckMsg" style="font-size: 10px;"> </span>
                               </div>
                               <div class="form-group">
                               	<label for="viewMemail">이메일</label>
                                   <input type="email" name="mmail" class="form-control form-control-user " value="${MemberInfo.mmail }">
                               </div>
                               <hr>
                               <input type="submit" class="btn btn-danger modifySubmit" id="submitBtn" style="float:right; " value="회원정보수정">
                               <a href="Admin_MemberManagement" class="btn btn-secondary btn-user" style="float:left; ">목록으로</a>
                           </form>
                   </div>
         		</div>     
         		          
			</div>
		
		</div>
	</div>
</section>
<script type="text/javascript">
	var checkName = false;
	var checkTel = false;
	document.addEventListener("DOMContentLoaded", function(){
		$("#inputMname").keyup(function() {
			var inputName = $("#inputMname").val();
			console.log("입력된 이름: " + inputName);
			
			if(inputName.length > 0){
				$("#nameCheckMsg").css("color", "white").text("");
				checkName = true;
			}else{
				$("#nameCheckMsg").css("color", "red").text("이름을 입력해주세요.");
				checkName = false;
			}
		});
		
		$("#inputMcontact").keyup(function() {
			var inputContact = $("#inputMcontact").val();
			
			
			if(inputContact.length > 0){
				$.ajax({
					type : "get",
					url : "memberTelCheck",
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
				checkName = false;
			}
		});
	});
</script>
<script type="text/javascript">
	function modifyCheck() {
		
		if (!checkName) {
			console.log("이름을 입력해야 합니다.");
			alert("이름을 입력해주세요!");
			$("#inputMname").focus();
			return false;
		}

		if (!checkTel) {
			
			alert("연락처를 확인해주세요!");
			$("#inputMcontact").focus();
			return false;
		}
	}
</script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/core.js"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/lightbox-plus-jquery.min.js"></script>
</body>

</html>