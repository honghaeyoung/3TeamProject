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
  <li class="nav-item active" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">내정보</button>
  </li>
  <li class="nav-item active" role="presentation">
    <button class="nav-link" id="boardlist-tab" data-bs-toggle="tab" data-bs-target="#boardlist" type="button" role="tab" aria-controls="boardlist" aria-selected="false">내가 쓴 게시글</button>
  </li>
  <li class="nav-item active" role="presentation">
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
 	<div>
 	<!--  
 	<details>
  <summary>같이 살아요 작성글</summary>
  <div>
    같이살아요
 	<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					
				</tr>
				<c:forEach items="${rList}" var="rooms">
					<tr>
						<td>${rooms.roomno}</td>
						<td><a href ="/room/list/${rooms.roomno}">${rooms.roomtitle}</a></td>
						<td>${rooms.memberid }</td>
						<td><fmt:formatDate value="${rooms.roomregdate }" dateStyle="short"/> </td>
						
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="mypage?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="mypage?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="mypage?p=${end+1}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>
</div>

</details>-->
 	같이살아요
 	<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					
				</tr>
				<c:forEach items="${rList}" var="rooms">
				
					<tr>
						<td><a href ="/room/list/${rooms.roomno}"style="color: black; text-decoration: none;">${rooms.roomno}</a></td>
						<td><a href ="/room/list/${rooms.roomno}"style="color: black; text-decoration: none;">${rooms.roomtitle}</a></td>
						<td><a href ="/room/list/${rooms.roomno}"style="color: black; text-decoration: none;">${rooms.memberid }</a></td>
						<td><a href ="/room/list/${rooms.roomno}"style="color: black; text-decoration: none;"><fmt:formatDate value="${rooms.roomregdate }" dateStyle="short"/></a> </td>
						
					</tr>
					
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="mypage?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="mypage?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="mypage?p=${end+1}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>
</div>
<div>
자유게시판
<c:if test="${count1 != 0 }">
			<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					
				</tr>
				<c:forEach items="${bList}" var="blist">
					<tr>
						<td>${blist.no}</td>
						<td><a href ="content/${blist.no}"style="color: black; text-decoration: none;">${blist.title}</a></td>
						<td>${blist.memberid }</td>
						<td><fmt:formatDate value="${blist.regdate }" dateStyle="short"/> </td>
						
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="mypage?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="mypage?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="mypage?p=${end+1}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count1 == 0 }">
	아직 입력한 글이 없습니다.
</c:if>
</div>

<div>
	같이먹어요
	<c:if test="${count2 != 0 }">
			<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					
				</tr>
				<c:forEach items="${fList}" var="flist">
					<tr>
						<td>${flist.fsno}</td>
						<td><a href ="content/${flist.fsno}"style="color: black; text-decoration: none;">${flist.fstitle}</a></td>
						<td>${flist.memberid }</td>
						<td><fmt:formatDate value="${flist.regdate }" dateStyle="short"/> </td>
						
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="mypage?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="mypage?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="mypage?p==${end+1}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count2 == 0 }">
	아직 입력한 글이 없습니다.
</c:if>
</div>
<div>
같이키워요
<c:if test="${count3 != 0 }">
			<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					
				</tr>
				<c:forEach items="${P_list}" var="plist">
					<tr>
						<td>${plist.pno}</td>
						<td><a href ="content/${plist.pno}"style="color: black; text-decoration: none;">${plist.ptitle}</a></td>
						<td>${plist.memberid }</td>
						<td><fmt:formatDate value="${plist.pregdate }" dateStyle="short"/> </td>
						
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="mypage?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="mypage?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="mypage?p=${end+1}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count3 == 0 }">
	아직 입력한 글이 없습니다.
</c:if>
 	</div>
 	<!--  
 	<c:if test="${check == 0}">
 	<table>
 		<thead>
 			<tr><th>글번호</th><th>제목</th><th>작성일</th></tr>
 		</thead>
 		<tbody>
 		
 		<c:forEach var="list" items="${list }">
 			<tr>
 				<td><a href="/list/${list.no}"><c:out value="${list.no }"/></a></td>
 				<td><c:out value="${list.title}"/></td>
 				<td><fmt:formatDate value="${list.regdate }" dateStyle="short"/>
 				</tr>
 				</c:forEach>
 				
 		</tbody>	
 	</table>
 		</c:if>   
 		-->
 	
  </div>
  <div class="tab-pane fade" id="commlist" role="tabpanel" aria-labelledby="commlist-tab">
  			같이살아요<table>
 		<thead>
 			<tr><th>글번호</th><th>댓글내용</th><th>작성일</th></tr>
 		</thead>
 		<tbody>
 		<c:forEach var="rc" items="${rc }">
 			<tr>
 				<td><a href="/room/list/${rc.roomno}">${rc.roomno }</a></td>

 				<td>${rc.rscontent }</td>
 				<td><fmt:formatDate value="${rc.rsdate }" dateStyle="short"/>
 				</tr>
 				</c:forEach>
 				
 		</tbody>	
 	</table>
 		자유게시판
 		<table>
 		<thead>
 			<tr><th>글번호</th><th>댓글내용</th><th>작성일</th></tr>
 		</thead>
 		<tbody>
 		<c:forEach var="bc" items="${bc }">
 			<tr>
 				<td><a href="/content/${bc.no}">${bc.no }</a></td>

 				<td>${bc.content }</td>
 				<td><fmt:formatDate value="${bc.regdate }" dateStyle="short"/>
 				</tr>
 				</c:forEach>
 				
 		</tbody>	
 	</table>
 		같이 먹어요
 		<table>
 		<thead>
 			<tr><th>글번호</th><th>댓글내용</th><th>작성일</th></tr>
 		</thead>
 		<tbody>
 		<c:forEach var="fc" items="${fc }">
 			<tr>
 				<td><a href="/content/${fc.fsno}">${fc.fsno }</a></td>

 				<td>${fc.fsccontent }</td>
 				<td><fmt:formatDate value="${fc.regdate }" dateStyle="short"/>
 				</tr>
 				</c:forEach>
 				
 		</tbody>	
 	</table>
  			같이 키워요
 		<table>
 		<thead>
 			<tr><th>글번호</th><th>댓글내용</th><th>작성일</th></tr>
 		</thead>
 		<tbody>
 		<c:forEach var="pc" items="${pc }">
 			<tr>
 				<td><a href="/content/${pc.pno}">${pc.pno }</a></td>

 				<td>${pc.pccontent }</td>
 				<td><fmt:formatDate value="${pc.pcregdate }" dateStyle="short"/>
 				</tr>
 				</c:forEach>
 				
 		</tbody>	
 	</table>
  			<!--  
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
 	-->
  </div>
</div>



</div>

<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
<script>

var firstTabEl = document.querySelector('#myTab li:last-child button')
var firstTab = new bootstrap.Tab(firstTabEl)

firstTab.show()

 var someTabTriggerEl = document.querySelector('#someTabTrigger')
  var tab = new bootstrap.Tab(someTabTriggerEl)

  tab.show()
</script>

</html>