<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>title</title>
<!-- Bootstrap cdn 설정 -->
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>>
<style type="text/css">
.bt1{
	text-align:center;
	margin: auto;
}

.bt {
  background: #120112;
  background-image: -webkit-linear-gradient(top, #120112, #0a1b26);
  background-image: -moz-linear-gradient(top, #120112, #0a1b26);
  background-image: -ms-linear-gradient(top, #120112, #0a1b26);
  background-image: -o-linear-gradient(top, #120112, #0a1b26);
  background-image: linear-gradient(to bottom, #120112, #0a1b26);
  font-family: Arial;
  color: #ffffff;
  font-size: 10px;
  padding: 5px 7px 8px 7px;
  text-decoration: none;
  text-align: center;
  
}

.bt:hover {
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
}
table.type04 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin : 20px 10px;
  margin-left: auto;
  margin-right: auto;
}
table.type04 th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
table.type04 td {
width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/include/top.jsp" />
<!-- Tab을 구성할 영역 설정-->
<div style="margin:10px;">
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">내정보</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="boardlist-tab" data-bs-toggle="tab" data-bs-target="#boardlist" type="button" role="tab" aria-controls="boardlist" aria-selected="false">내가 쓴 게시글</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="commlist-tab" data-bs-toggle="tab" data-bs-target="#commlist" type="button" role="tab" aria-controls="commlist" aria-selected="false">내가 쓴 댓글</button>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  <div class="body">
<table class="type04">
<tr>
<th scope="row">아이디</th> <td>${user.memberid}</td></tr>
<tr>
<th scope="row">비밀번호</th> <td>${user.memberpw}</td></tr>
<tr>
<th scope="row">이름</th> <td>${user.name }</td></tr>
<tr>
<th scope="row">전화번호 </th><td>${user.phone }</td></tr>
<tr>
<th scope="row">주소     </th><td> ${user.address }</td></tr>
<tr>
<th scope="row">성별 </th><td>${user.gender }</td></tr>
<tr>
<th scope="row">생년월일 </th><td><fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd"/></td></tr>
<tr>
<th scope="row">메일  </th><td>${user.email }</td></tr>
<tr>
<th scope="row">반려동물여부</th><td>${user.pet }</td></tr>
</table>
<div class="bt1">
<button type="button" onclick="location.href='updateform'" class="bt">회원 정보 수정</button>
<button type="button" onclick="location.href='deleteform'" class="bt">회원 탈퇴</button>
</div>
</div>
  </div>
  <div class="tab-pane fade" id="boardlist" role="tabpanel" aria-labelledby="boardlist-tab">
 	<c:if test="${check == 0}">
 	<table>
 		<thead>
 			<tr><th>글번호</th><th>제목</th><th>작성일</th></tr>
 		</thead>
 		<tbody>
 		
 		<c:forEach var="list" items="${list }">
 			<tr>
 				<td><a href="/room/list/${list.no}"><c:out value="${list.no }"/></a></td>
 				<td><c:out value="${list.title}"/></td>
 				<td><fmt:formatDate value="${list.regdate }" dateStyle="short"/>
 				</tr>
 				</c:forEach>
 				
 		</tbody>	
 	</table>
 		</c:if>
 	<c:if test="${check == 1}">
 	<table>
 		<thead>
 			<tr><th>글번호</th><th>제목</th><th>작성일</th></tr>
 		</thead>
 		<tbody>
 		
 		<c:forEach var="list" items="${list }">
 			<tr>
 				<td>작성하신 게시글이없습니다</td>
 				</tr>
 				</c:forEach>
 				
 		</tbody>	
 	</table>
 	</c:if>
  </div>
  <div class="tab-pane fade" id="commlist" role="tabpanel" aria-labelledby="commlist-tab">
  			<table>
 		<thead>
 			<tr><th>글번호</th><th>내용</th><th>작성일</th></tr>
 		</thead>
 		<tbody>
 		<c:forEach var="comm" items="${comm }">
 			<tr>
 				<td><a href=""><c:out value="${comm.no }"/></a></td>
 				<td><c:out value="${comm.ccontent}"/></td>
 				<td><fmt:formatDate value="${comm.regdate }" dateStyle="short"/>
 				</tr>
 				</c:forEach>
 				
 		</tbody>	
 	</table>
  </div>
</div>



</div>

<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>