<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>title</title>
<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
body{text-align: center;}
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
<!-- Tab을 구성할 영역 설정-->
<div style="margin:10px;">
<!-- Tab 영역 태그는 ul이고 클래스는 nav와 nav-tabs를 설정한다. -->
<ul class="nav nav-tabs">
<!-- Tab 아이템이다. 태그는 li과 li > a이다. li태그에 active는 현재 선택되어 있는 탭 메뉴이다. -->
<li class="active"><a href="#home" data-toggle="tab">내정보</a></li>
<!-- a 태그의 href는 아래의 tab-content 영역의 id를 설정하고 data-toggle 속성을 tab으로 설정한다. -->
<li><a href="#boardliost" data-toggle="tab">내가 쓴 게시글</a></li>
<li><a href="#commlist" data-toggle="tab">내가 쓴 댓글</a></li>

</ul>
<!-- Tab이 선택되면 내용이 보여지는 영역이다. -->
<!-- 태그는 div이고 class는 tab-content로 설정한다. -->
<div class="tab-content">
<!-- 각 탭이 선택되면 보여지는 내용이다. 태그는 div이고 클래스는 tab-pane이다. -->
<!-- active 클래스는 현재 선택되어 있는 탭 영역이다. -->
<div class="tab-pane fade in active" id="home">
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
<button type="button" onclick="location.href='updateform'">회원 정보 수정</button>
<button type="button" onclick="location.href='deleteform'">회원 탈퇴</button>
</div>
</div>
<!-- id는 고유한 이름으로 설정하고 tab의 href와 연결되어야 한다. -->
<div class="tab-pane fade" id="boardliost">게시글 목록</div>
<!-- fade 클래스는 선택적인 사항으로 트랜지션(transition)효과가 있다.
<!-- in 클래스는 fade 클래스를 선언하여 트랜지션효과를 사용할 때 in은 active와 선택되어 있는 탭 영역의 설정이다. -->
<div class="tab-pane fade" id="commlist">댓글 목록</div>



</div>
</div>
</body>
</html>