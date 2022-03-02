<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>룸쉐어 리스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- 헤더 -->

	<header>
		<nav class="navbar navbar-expand-md navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="/">혼사모</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
					aria-controls="navbarCollapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="/fsboard/list">같이먹어요</a></li>
						<li class="nav-item"><a class="nav-link" href="/petcare">같이키워요</a></li>
						<li class="nav-item"><a class="nav-link" href="/room/list">같이살아요</a></li>
						<li class="nav-item"><a class="nav-link" href="/board/list">자유게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="/CSBoard/list">고객센터</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/memberAll">관리자페이지</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-bs-toggle="dropdown" aria-expanded="false">그외</a>
							<ul class="dropdown-menu" aria-labelledby="dropdown04">
								<li><a class="dropdown-item" href="/foodstore">음식점</a></li>
								<li><a class="dropdown-item" href="#">넣을</a></li>
								<li><a class="dropdown-item" href="#">까요
										</a></li>
							</ul></li>
					</ul>

					<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
						<input type="search" class="form-control form-control-dark"
							placeholder="Search..." aria-label="Search">
					</form>
						<!--<c:set var="user" value="${user }"/><-->
					<div class="text-end">
						<c:if test="${user.memberid == null && user.memberpw == null }">
						<button type="button" class="btn btn-outline-light me-2" onclick="location.href='loginform'">로그인</button>
						<button type="button" class="btn btn-warning" onclick="location.href='joinform'">회원가입</button>
					
						</c:if>
						
						<c:if test="${user.memberid != null && user.memberpw != null }">
					
						<button type="button" class="btn btn-outline-light me-2" onclick="location.href='mypage'">${user.memberid}님마이페이지</button>
						<button type="button" class="btn btn-warning" onclick="location.href='logout'">로그아웃</button>
						
						</c:if>
					</div>
						
					
					
						

				</div>
			</div>

		</nav>
	</header>

</body>
</html>