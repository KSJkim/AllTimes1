<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
      <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>All Times News</title>

      <!--Bootstrap core CSS-->
      <link href="resources/css/bootstrap.min.css" rel="stylesheet">

      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

      <!-- Custom styles for this template -->

      <link href="resources/css/custom.css" rel="stylesheet">
      <link href="resources/css/responsive-style.css" rel="stylesheet">  
      <link href="resources/css/weather-icons.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="resources/css/font-awesome.min.css" />
      <link href="resources/css/lightbox.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="resources/css/loaders.css"/>
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
      <style></style>
      </head>

      <body>
          <div class="loader loader-bg">
        <div class="loader-inner ball-pulse-rise">
       
        </div>
      </div>


	<!-- Header -->
	<%@ include file="../includes/Header.jsp" %>
	
	<!-- Navigation -->
	<%@ include file="../includes/infoPageNavigation.jsp" %>
	
	<!-- Content -->


		<div class="container">
			<table>
			<form action="MemberModify" method="post">
					<div style="margin: 40px;">
						<div class="form-group row">
							<div class="col-sm-4 mb-3">
								<label>아이디</label> <input type="text" name="mid"
									class="form-control form-control-user"
									value="${memberModify.mid }" disabled="disabled">
									<input type="hidden" name="mid" class="form-control form-control-user"
									value="${memberModify.mid }">
							</div>
							<div class="col-sm-4">
								<label>비밀번호</label> <input type="text" name="mpw"
									class="form-control form-control-user "
									value="${memberModify.mpw }">
							</div>
						</div>

						<div class="form-group row">
							<div class="col-sm-4 mb-3">
								<label>이름</label> <input type="text" name="mname"
									class="form-control form-control-user"
									value="${memberModify.mname }">
							</div>
							<div class="col-sm-4 mb-3">
								<label for="viewMmail">전화번호</label> <input type="text"
									name="mcontact" class="form-control form-control-user "
									value="${memberModify.mcontact }">
							</div>					

						</div>
						<div class="form-group row">
							<div class="col-sm-4">
								<label for="viewMmail">이메일</label> <input type="email"
									name="mmail" class="form-control form-control-user "
									value="${memberModify.mmail }">
							</div>
							<div class="col-sm-4">
								<label for="viewMagel">나이</label> <input type="text" name="mage"
									class="form-control form-control-user "
									value="${memberModify.mage }">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-4">
								<input type="submit"
									class="btn-primary form-control form-control-user "
										id="submitBtn" style="float: right;" value="정보수정">
							</div>
						</div>
		
							</div>
				</form>	

			</table>
		</div>


	
	<!--footer start from here-->

	<%@ include file="../includes/Footer.jsp" %>

	
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/core.js?val=1"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/lightbox-plus-jquery.min.js"></script>
	<script type="text/javascript">
		var msg = '${modifyMsg}';
		if (msg != '') {
			alert(msg);
		}
	</script>

</body>
</html>