<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   	<nav class="navbar top-nav">
		<div class="container">
			<button class="navbar-toggler hidden-lg-up " type="button"
				data-toggle="collapse" data-target="#exCollapsingNavbar2"
				aria-controls="exCollapsingNavbar2" aria-expanded="false"
				aria-label="Toggle navigation">&#9776;</button>
			<div class="collapse navbar-toggleable-md" id="exCollapsingNavbar2">
				<a class="navbar-brand" href="#">Responsive navbar</a>
				<ul class="nav navbar-nav ">
					<li class="nav-item active"><a class="nav-link"
						href="MemberModifyForm">회원정보<span class="sr-only"></span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="ReporterWriteForm">기사 작성</a></li>
					<li class="nav-item"><a class="nav-link"
						href="ReporterModifyForm?rid=${sessionScope.loginRid}">내 기사 관리</a></li>
				</ul>
			</div>
			
			


		</div>
	</nav>