<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<c:import url="/WEB-INF/views/include/top.jsp" />

	<!-- 메인 -->
	<main>
		<div class="p-4 p-md-5 mb-4 text-white  bg-dark">
			<div class="col-md-6 px-0">
				<a href="/room/list" style="color: white; text-decoration: none;"><h1
						class="display-4 fst-italic">Room Share</h1></a>
			</div>
		</div>

		<div class="container">
			<h1>룸쉐어 구하기</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="/room/write">
					<button class="btn btn-outline-dark btn-sm" type="button">글쓰기</button>
				</a>
			</div>
			<hr>

			<c:if test="${count != 0 }">
				<c:forEach items="${rList}" var="rooms">
					<a href="/room/list/${rooms[0].roomno }"
						style="color: black; text-decoration: none;">
						<div class="card mb-3" style="max-width: 100%; height: 200px;">
							<div class="row g-0">
								<div class="col-md-3">
									<c:if test="${rooms[1].rimgsize == 0 }">
										<img src="/upload/noimages.png"
											class="img-fluid rounded-start"
											onerror="this.src='/upload/noimages.png'"
											style="width: 100%; height: 190px; margin: 5px">
									</c:if>
									<c:if test="${rooms[1].rimgsize != 0 }">
										<img src="/upload/${rooms[1].rimgpath }"
											class="img-fluid rounded-start"
											onerror="this.src='/upload/noimages.png'"
											style="width: 100%; height: 190px; margin: 5px">
									</c:if>
								</div>
								<div class="col-md-9">
									<div class="card-body">
										<h5 class="card-title">${rooms[0].roomtitle}</h5>
										<p class="card-text">${rooms[0].memberid }</p>
										<h5 class="card-text text-primary"><fmt:formatDate
													value="${rooms[0].roomdate}" pattern="yyyy-MM-dd" /> 입주가능</h5>
										<c:if test="${ rooms[0].roomstate == 1}">
											<p class="card-text text-danger">룸쉐어완료</p>
										</c:if>
										<c:if test="${ rooms[0].roomstate == 0}">
											<p class="card-text text-success">룸쉐어가능</p>
										</c:if>
										<p class="card-text">
											<small class="text-muted"><fmt:formatDate
													value="${rooms[0].roomregdate}" pattern="yyyy-MM-dd" /></small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</a>
					<hr>
				</c:forEach>

				<div></div>
				<div class="btn-toolbar d-md-flex justify-content-end" id="page">

					<c:if test="${begin>pageNum}">
						<a href="list?p=${begin-1}" class="btn btn-outline-secondary">이전</a>
					</c:if>
					<c:forEach begin="${begin}" end="${end}" var="i">
						<a href="list?p=${i}" class="btn btn-outline-secondary">${i}</a>
					</c:forEach>
					<c:if test="${end<totalPages}">
						<a href="list?p=${end+1}" class="btn btn-outline-secondary">다음</a>
					</c:if>

				</div>
			</c:if>
			<c:if test="${count == 0 }">
				<p style="text-align: center;">아직 입력한 글이 없습니다.</p>
			</c:if>

			<div class="d-flex justify-content-center">
				<form action="/room/list/search" method="get">
					<div class="input-group mb-3">
						<select class="form-select form-select-sm" name="searchn" id="inputGroupSelect01" style="width:90px;">
							<option value="0" selected>제목</option>
							<option value="1">내용</option>
							<option value="2">아이디</option>
							<option value="3">주소</option>
						</select> <input type="text" class="form-control"
							aria-label="Recipient's username"
							aria-describedby="button-addon2" name="search" style="width:200px;">
						<button class="btn btn-outline-secondary" type="submit"
							id="button-addon2">검색</button>
					</div>
				</form>
			</div>
		</div>
	</main>


	<c:import url="/WEB-INF/views/include/bottom.jsp" />

</body>
</html>