<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>문의게시판</title>
<style>
/* 자주하는질문 */
.title-area {
  text-align: center;
  padding: 5px 0;
}
.s1 {
  background: #f8f8f8;
  border-bottom: 1px solid #ccc;
  padding: 10px 20px;
  position: relative;
}
.s1 ul {
  margin-top: 20px;
}
.s1 ul li {
  border-bottom: 1px solid #e0e0e0;
  padding-bottom: 10px;
  margin-bottom: 20px;
}
.s1 ul li h3 {
  font-size: 16px;
}
.s1 ul li p {
  display: none;
}

.s2 {
  height: 300px;
  background: #ddd;
}

body {
  min-height: 100%;
}

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: "";
  display: block;
  clear: both;
}
.container {
  width: 1000px;
  margin: 0 auto;
  
}
/* 자주질문 끝 */
#center {
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
}

#btn {
	text-align: right;
	margin-right: 3%;
}

h1, p {
	text-align: center;
	margin-top: 40px
}

table {
	border: 1px solid white;
	width: 1000px;
	border-collapse: collapse;
	margin: auto;
	margin-top: 20px;
}

th {
	border: 1px solid white;
	background: grey;
	color: #fff;
	width: 150px;
}

td {
	border: 1px solid white;
}

td, th {
	border: 1px solid #dbdbdb;
	padding: 5px 20px;
	font-size: 12px;
}

a {
	margin: 10px auto;
	color: black;
}

#page {
	text-align: center;
	margin-top: 40px;
}

.searchform {
	text-align: center;
	margin-top: 30px;
}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.easing/1.3/jquery.easing.1.3.js"></script>
<script>
$(function(){
	  // project ui 스크립트
	  project.init();
	})


	var project = {
	  init : function(){
	    project.faq();
	  },
	  
	  // 자주하는질문 
	  faq : function(){
	    $('.s1 ul li').on('click', function(){
	      var self = $(this),
	          speed = 400,
	          easing = 'easeInOutExpo';

	      project.moveScroll(this, -20 );

	      self.find('p').slideToggle(speed, easing);
	    })
	  },
	  
	  // target으로 스크롤 이동
	  moveScroll : function(tg,flex){
	    var speed = 400,
	        easing = 'easeInOutExpo',
	        oft = $(tg).offset().top;
	    $('body').stop().animate({scrollTop:oft + flex}, speed, easing);
	  }
	}
</script>
</head>
<body>

<c:import url="/WEB-INF/views/include/top.jsp" />
	<div id="center">
		<h1>문의게시판</h1>
		<p>서비스 이용 시 불편사항이나 문의사항을 보내주시면 신속하고 친절하게 안내해 드리겠습니다!</p>
		<br><br>
<!-- 자주하는질문 -->
<div class="container">
  <section class="s1">
    <div class="title-area">
      <h1>자주하는 질문 Top5</h1>
    </div>
    <nav>
      <ul>
        <li>
          <h3>Q. 동네인증이 안 돼요!</h3>
          <p>
			동네인증을 하기 전에 현재 내 위치가 인증하려는 동네(접속하려는 동네)에 있는지 확인해 주세요. <br>
			인증하려는 동네(접속하려는 동네)와 현재 내 위치가 다르다면 인증에 실패해요. 해당 동네에 있을 때 인증해 주시길 바라요. :)<br><br>
          </p>
        </li>
        <li>
          <h3>Q. 닉네임을 변경하고 싶어요.</h3>
          <p>
			[프로필 수정] 페이지에서 사진과 닉네임을 자유롭게 변경할 수 있어요. :) <br>
			닉네임은 30일에 1번만 변경할 수 있어요. 신중히 변경해주세요.<br>
			프로필과 닉네임은 상대방에게 보여지는 나의 모습이에요. 건전한 내용으로 상대방에게 나를 표현해보세요!<br><br>
          </p>
        </li>
        <li>
          <h3>.</h3>
          <p>
			.
          </p>
        </li>
         <li>
          <h3>.</h3>
          <p>
			.
          </p>
        </li>
         <li>
          <h3>.</h3>
          <p>
			.
          </p>
        </li>
      </ul>
    </nav>
  </section>
</div>

		<div id="btn">
		<br><br>
			<input type="button" class="btn btn-outline-secondary" value="Main"
				onclick="location.href='/'" /> 
			<input type="button"
				class="btn btn-outline-secondary" value="새글 등록"
				onclick="location.href='write'" />
		</div>
		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>no</th>
					<th>title</th>
					<th>id</th>
					<th>date</th>
				</tr>
				<c:forEach items="${bList}" var="CSBoard">
					<tr>
						<td align="center">${CSBoard.csno }</td>
						<td align="center"><a href="content/${CSBoard.csno}">${CSBoard.cstitle}</a></td>
						<td align="center">${CSBoard.memberid }</td>
						<td align="center"><fmt:formatDate
								value="${CSBoard.csregdate }" dateStyle="short" /></td>
					</tr>
				</c:forEach>
			</table>

			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="list?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
			</div>


		</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>

		<!-- 검색  -->
	</div>

	<div id="search" align="center"
		style="clear: right; width: 100%; margin: auto; display: inline-block; text-align: center;">
		<form action="search">
			<select name="searchn">
				<option value="0">제목</option>
				<option value="1">내용</option>
				<option value="2">작성자</option>
			</select> 
			<input type="text" name="search" size="15" maxlength="50" /> 
			<input type="submit" value="검색" />
			<br><br>
		</form>
	</div>
	<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>
