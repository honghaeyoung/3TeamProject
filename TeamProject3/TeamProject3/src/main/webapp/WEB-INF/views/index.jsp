<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#show{
text-align: center;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

</head>
<body>
	<!-- 헤더 -->

	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.html">혼사모</a>
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
						<li class="nav-item"><a class="nav-link" href="#">같이먹어요</a></li>
						<li class="nav-item"><a class="nav-link" href="#">같이키워요</a></li>
						<li class="nav-item"><a class="nav-link" href="#">같이살아요</a></li>
						<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
						<li class="nav-item"><a class="nav-link" href="#">관리자페이지</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-bs-toggle="dropdown" aria-expanded="false">그외</a>
							<ul class="dropdown-menu" aria-labelledby="dropdown04">
								<li><a class="dropdown-item" href="#">뭐를</a></li>
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


	<!-- 메인 -->
	<main>

		<!-- 상단 -->
		<div
			class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
			<div class="col-md-5 p-lg-5 mx-auto my-5">
				<h1 class="display-4 fw-normal">여기다가 이쁜 사진?</h1>
				<p class="lead fw-normal">환영합니다!!
					</p>
				<a class="btn btn-outline-secondary" href="#">추후 공개</a>
			</div>
			<div class="product-device shadow-sm d-none d-md-block"></div>
			<div
				class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
		</div>
		<!-- 본문 -->
			<aside class="foodbar" style="float: right; border: solid;">
<div>오늘 뭐 먹지?
<div id="show"></div>
<button type="button" class="btn btn-primary" id="food" onclick="foodclick()">오늘의 음식은?</button>
</div>
</aside>
		<div class="container px-4 py-5" id="custom-cards">
			<h2 class="pb-2 border-bottom"> 게시판 미리보기?</h2>

			<div
				class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
				<div class="col">
					<div
						class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
						style="background-image: url('unsplash-photo-1.jpg');">
						<div
							class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
							<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Short
								title, long jacket</h2>
							<ul class="d-flex list-unstyled mt-auto">
								<li class="me-auto"><img src="https://github.com/twbs.png"
									alt="Bootstrap" width="32" height="32"
									class="rounded-circle border border-white"></li>
								<li class="d-flex align-items-center me-3"><svg
										class="bi me-2" width="1em" height="1em">
										<use xlink:href="#geo-fill"></use></svg> <small>Earth</small></li>
								<li class="d-flex align-items-center"><svg class="bi me-2"
										width="1em" height="1em">
										<use xlink:href="#calendar3"></use></svg> <small>3d</small></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col">
					<div
						class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
						style="background-image: url('unsplash-photo-2.jpg');">
						<div
							class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
							<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Much
								longer title that wraps to multiple lines</h2>
							<ul class="d-flex list-unstyled mt-auto">
								<li class="me-auto"><img src="https://github.com/twbs.png"
									alt="Bootstrap" width="32" height="32"
									class="rounded-circle border border-white"></li>
								<li class="d-flex align-items-center me-3"><svg
										class="bi me-2" width="1em" height="1em">
										<use xlink:href="#geo-fill"></use></svg> <small>Pakistan</small></li>
								<li class="d-flex align-items-center"><svg class="bi me-2"
										width="1em" height="1em">
										<use xlink:href="#calendar3"></use></svg> <small>4d</small></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col">
					<div
						class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
						style="background-image: url('unsplash-photo-3.jpg');">
						<div class="d-flex flex-column h-100 p-5 pb-3 text-shadow-1">
							<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Another
								longer title belongs here</h2>
							<ul class="d-flex list-unstyled mt-auto">
								<li class="me-auto"><img src="https://github.com/twbs.png"
									alt="Bootstrap" width="32" height="32"
									class="rounded-circle border border-white"></li>
								<li class="d-flex align-items-center me-3"><svg
										class="bi me-2" width="1em" height="1em">
										<use xlink:href="#geo-fill"></use></svg> <small>California</small></li>
								<li class="d-flex align-items-center"><svg class="bi me-2"
										width="1em" height="1em">
										<use xlink:href="#calendar3"></use></svg> <small>5d</small></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>



	</main>

	<!-- 푸터 -->
	<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Home</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Features</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Pricing</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">FAQs</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">About</a></li>
			</ul>
			<p class="text-center text-muted">© 2022 3Team, 김남준,김동희,안찬우,엄혜선,현지은,홍해영</p>
		</footer>
	</div>
</body>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

let food = new Array ();
food[0] = "피자";
food[1] = "치킨";
food[2] = "햄버거";
food[3] = "족발";
food[4] = "곱창";
food[5] = "돈까스";
food[6] = "제육볶음";
food[7] = "비빔밥";
food[8] = "순대국";
food[9] = "찜닭";
food[10] = "덮밥";
food[11] = "김치찜";
food[12] = "닭갈비";
food[13] = "김치찌개";
food[14] = "된장찌개";
food[15] = "짜장면";
food[16] = "짬뽕";
food[17] = "김밥";
food[18] = "회";
food[19] = "육회";
food[20] = "우동";
food[21] = "라면";
food[22] = "초밥";
food[23] = "마라탕";
food[24] = "쌀국수";
food[25] = "스테이크";
food[26] = "파스타";
food[27] = "샐러드";
food[28] = "카레";
food[29] = "보쌈";
food[30] = "닭발";
food[31] = "갈비찜";
food[32] = "아구찜";
food[33] = "해장국";
food[34] = "도시락";
food[35] = "삼겹살";
food[36] = "크로플";
food[37] = "아이스크림";
food[38] = "타코야끼";
food[39] = "샌드위치";
food[40] = "핫도그";
food[41] = "육계장";
food[42] = "설렁탕";
food[43] = "갈비";
food[44] = "낙곱새";
food[45] = "만두";
let i = Math.floor(Math.random() * food.length)
function foodclick(){	
	let taget = document.getElementById("show");
	for(let j=0; j < i; j++){
		
		taget.innerHTML = "<strong>"+food[i]+"!<strong>";
	}
	
	}


</script>
</html>