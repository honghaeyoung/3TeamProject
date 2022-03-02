<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>룸쉐어 글쓰기</title>
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
<script type="text/javascript" src="/js/write.js"></script>
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
			<h1>룸쉐어 글쓰기</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="/room/list">
					<button class="btn btn-outline-dark btn-sm" type="button">목록</button>
				</a>
			</div>
			<hr>
			<form action="/room/write" method="post"
				enctype="multipart/form-data" id="writeform">
				<div class="row">
					<div class="col-sm-9">
						<div class="mb-3">
							<label for="roomtitle" class="form-label">제목</label> <input
								class="form-control" id="roomtitle" name="roomtitle"
								placeholder="제목">
						</div>
						<p class="text-danger" id="title_chk"></p>
					</div>
					<div class="col-sm-3">
						<div class="mb-3">
							<label for="roomtitle" class="form-label">아이디</label> <input
								class="form-control" id="memberid" name="memberid"
								value="${user.memberid }" readonly>
						</div>
					</div>
				</div>
				<hr>
				<div class="input-group">
					<input type="file" class="form-control" id="roompic" name="roompic"
						aria-describedby="inputGroupFileAddon04" aria-label="Upload"
						multiple="multiple" accept="image/*">
				</div>
				<div id="preview"></div>
				<script type="text/javascript" src="/js/uploadimg.js"></script>
				<hr>
				<div class="row">
					<div class="col-sm-6">
						<p>주소</p>
						<div class="input-group mb-3">
							<input class="form-control" id="roomaddress" name="roomaddress"
								placeholder="주소찾기를 눌러주세요" readonly>
							<button type="button" onclick="sample6_execDaumPostcode()"
								class="btn btn-outline-secondary" id="adr_search">주소찾기</button>
							<button type="button" id="mapsearch" name="mapsearch"
								class="btn btn-outline-primary">검색</button>
						</div>
						<p class="text-danger" id="address_chk"></p>
						<!-- 지도 -->
						<div id="map" style="width: 100%; height: 350px;"></div>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=902ecfcba032871c0d002e39ee2b0dd2&libraries=services,clusterer,drawing"></script>
							
						<script type="text/javascript" src="/js/map.js"></script>
					</div>
					<div class="col-sm-6">
						<div class="mb-3">
							<label for="roomphone" class="form-label">연락처</label> <input
								class="form-control" id="roomphone" name="roomphone"
								placeholder="ex)000-0000-0000 또는 카카오톡 아이디">
						</div>
						<p class="text-danger" id="phone_chk"></p>
						<hr>
						<div class="mb-3">
							<label for="roomdate" class="form-label"> 입주가능날짜 </label> <input
								type="date" class="form-control" id="roomdate" name="roomdate">
						</div>
						<p class="text-danger" id="date_chk"></p>
						<hr>

						<fieldset>
							<legend class="col-form-label">룸쉐어 기간</legend>
							<div id="selectgroup">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="under3m" value="3개월 미만" checked> <label
										class="form-check-label" for="under3m"> 3개월 미만 </label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="under6m" value="3개월 ~ 6개월"> <label
										class="form-check-label" for="under6m"> 3 ~ 6개월 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="under1y" value="6개월 ~ 1년"> <label
										class="form-check-label" for="under1y"> 6개월 ~ 1년 </label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="under2y" value="1년 ~ 2년"> <label
										class="form-check-label" for="under2y"> 1 ~ 2년 </label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="over2y" value="2년 이상"> <label
										class="form-check-label" for="over2y"> 2년 이상 </label>
								</div>
							</div>
						</fieldset>
					</div>
				</div>
				<hr>
				<div class="mb-3">
					<label for="roomcontent" class="form-label">상세내용</label>
					<textarea class="form-control" id="roomcontent" name="roomcontent"
						rows="15" placeholder="상세내용을 적어주세요"></textarea>
				</div>

				<hr>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<button class="btn btn-primary me-md-2" type="reset">다시쓰기</button>
					<button class="btn btn-primary" type="submit">등록</button>
				</div>
			</form>
		</div>
	</main>

	<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>