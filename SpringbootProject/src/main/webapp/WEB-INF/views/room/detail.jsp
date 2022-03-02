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
<script type="text/javascript" src="/js/detail.js"></script>
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
				<a href="/room/list">
					<button class="btn btn-outline-dark btn-sm" type="button">목록</button>
				</a>
				<c:if test="${room.memberid == user.memberid }">

					<c:if test="${room.roomstate == 0 }">
						<a href="/room/quit/${room.roomno}">
							<button class="btn btn-outline-success btn-sm" type="button">룸쉐어종료</button>
						</a>
					</c:if>
					<c:if test="${room.roomstate == 1 }">
						<button class="btn btn-outline-dark btn-sm" type="button" disabled>룸쉐어종료</button>
					</c:if>

					<a href="/room/update/${room.roomno}">
						<button class="btn btn-outline-primary btn-sm" type="button">수정</button>
					</a>
					<a href="/room/delete/${room.roomno}">
						<button class="btn btn-outline-danger btn-sm" type="button">삭제</button>
					</a>

				</c:if>
			</div>
			<hr>
			<div class="row">
				<div class="col-sm-11">
					<div class="mb-3">
						<h5>${room.roomtitle}</h5>
						<span>${room.memberid}</span> <span><small> | </small></span> <span><fmt:formatDate
								value="${room.roomregdate}" pattern="yyyy-MM-dd" /></span>
					</div>
				</div>
				<div class="col-sm-1">
					<div class="mb-3">
						<br> <span>조회 : ${room.roomcno}</span>

					</div>
				</div>
			</div>
			<hr>
			<!-- 이미지 슬라이드 -->
			<div id="carouselControls" class="carousel carousel-dark slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<c:forEach items="${images}" var="image" varStatus="status">
						<c:if test="${image.rimgsize == 0 }">
							<div class="carousel-item active">
								<img src="/upload/noimages.png" class="rounded d-block w-100"
									style="height: 400px; object-fit: contain;">
							</div>
						</c:if>
						<c:if test="${image.rimgsize != 0 }">
							<c:if test="${status.index == 0 }">
								<div class="carousel-item active">
									<img src="/upload/${image.rimgpath }"
										onerror="this.src='/upload/noimages.png'"
										class="rounded d-block w-100"
										style="height: 400px; object-fit: contain;">
								</div>
							</c:if>
							<c:if test="${status.index != 0 }">
								<div class="carousel-item">
									<img src="/upload/${image.rimgpath }"
										onerror="this.src='/upload/noimages.png'"
										class="rounded d-block w-100"
										style="height: 400px; object-fit: contain;">
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>

			<hr>
			<center>
				<div id="map" style="width: 1000px; height: 400px;"
					class="${room.roomaddress}"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=902ecfcba032871c0d002e39ee2b0dd2&libraries=services,clusterer,drawing"></script>
				<script type="text/javascript" src="/js/map2.js"></script>
			</center>
			<hr>
			<div class="row">
				<div class="col-sm-6">
					<div class="mb-3">
						<p class="text-muted">입주가능날짜</p>
						<h5>
							<fmt:formatDate value="${room.roomdate}" pattern="yyyy/MM/dd" />
						</h5>
					</div>
					<hr>
					<div class="mb-3">
						<p class="text-muted">룸쉐어기간</p>
						<h5>${room.roomperiod}</h5>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="mb-3">
						<p class="text-muted">연락처</p>
						<h5>${room.roomphone }</h5>
					</div>
					<hr>
					<div class="mb-3">
						<p class="text-muted">주소</p>
						<h5>${room.roomaddress}</h5>
					</div>
				</div>
			</div>
			<hr>
			<div style="min-height: 500px;">
				<p class="text-muted">상세내용</p>
				<h5>
					<pre>${room.roomcontent }</pre>
				</h5>
			</div>
			<hr>


			<!-- 댓글 -->

			<c:forEach items="${comments}" var="comment">
				<div class="row" id="${comment.rsno}">
					<div class="col-sm-2 position-relative">
						<div class="position-absolute top-50 start-50 translate-middle">
							<p>${comment.memberid}</p>
						</div>
					</div>
					<div class="col-sm-7">
						<p>
						<pre>${comment.rscontent}</pre>
						</p>
					</div>
					<div class="col-sm-1 position-relative">
						<div class="position-absolute top-50 start-50 translate-middle">
							<p>
								<fmt:formatDate value="${comment.rsdate}" pattern="yyyy/MM/dd" />
							</p>
						</div>
					</div>
					<div class="col-sm-2 position-relative">
						<div style="height: auto;">
							<div class="btn-group">
							<p class="d-none" id="rn_${comment.rsno}">${comment.roomno}</p>
								<button type="button" id="${comment.rsno}"
									class="recomment btn btn-outline-secondary">답글</button>
								
								<c:if test="${comment.memberid == user.memberid }">
								<button type="button" id="${comment.rsno}"
									class="rsupdate btn btn-outline-primary">수정</button>
								<button type="button" id="${comment.rsno}" class="rsdelete btn btn-outline-danger">삭제</button>
								</c:if>
							</div>
						</div>
					</div>
					<div>
						<c:forEach items="${recomments}" var="recomment">
							<c:if test="${recomment.rersno == comment.rsno }">
							
								<div class="row">
									<div class="col-sm-1"></div>
									<div class="col-sm-11" id="re_${recomment.rsno}">
									<hr style="border-top:1px dotted #bbb;">
										<div class="row" id="${recomment.rsno}">
											<div class="col-sm-2 position-relative">
												<div
													class="position-absolute top-50 start-50 translate-middle">
													<p>${recomment.memberid}</p>
												</div>
											</div>
											<div class="col-sm-7">
												<p>
												<pre>${recomment.rscontent}</pre>
												</p>
											</div>
											<div class="col-sm-1 position-relative">
												<div
													class="position-absolute top-50 start-50 translate-middle">
													<p>
														<fmt:formatDate value="${recomment.rsdate}"
															pattern="yyyy/MM/dd" />
													</p>
												</div>
											</div>
											<div class="col-sm-2 position-relative">
												<div style="height: auto;">
													<div class="btn-group">
													<c:if test="${recomment.memberid == user.memberid }">
														<button type="button" id="${recomment.rsno}"
															class="rsupdate btn btn-outline-primary">수정</button>
														<button type="button" id="${recomment.rsno}" class="rsdelete btn btn-outline-danger">삭제</button>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<div class="row">
							<div class="col-sm-1"></div>
							<div class="col-sm-11" id="re_${comment.rsno}"></div>
						</div>
					</div>
				</div>
				<hr>
			</c:forEach>
			<p>댓글쓰기</p>
			<form action="/room/list/${room.roomno}/rswrite" method="post"
				name="rs">
				<div class="mb-3">
					<input type="text" class="form-control" id="memberid"
						name="memberid" style="width: 200px;">
				</div>
				<div class="mb-3">
					<textarea class="form-control" id="rscontent" name="rscontent"
						rows="3"></textarea>
				</div>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<button class="btn btn-primary" type="submit">등록</button>
				</div>
			</form>
		</div>
	</main>


	<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>