<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>title</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
#tab{
	
	padding-left: 380px;
	padding-right: 380px;
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
<div id="tab">
<!-- tabs link -->
<ul class="nav nav-tabs" id="rowTab">
    <li class="active"><a href="#info" data-toggle="tab">내정보</a></li>
    <li><a href="#myBoard" data-toggle="tab">내가 쓴 게시글</a></li>
    <li><a href="#myComm" data-toggle="tab">내가 쓴 댓글</a></li>
</ul>
<!-- end: tabs link -->
</div>
<div class="tab-content" id="tab">
    <div class="tab-pane active" id="info">
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
    <div class="tab-pane" id="myBoard">
        tab data here...b
    </div>

    <div class="tab-pane" id="myComm">
        tab data here...c
    </div>

   
</div>

<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
<script>
$('a[data-toggle="tab"]').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
});

$('a[data-toggle="tab"]').on("shown.bs.tab", function (e) {
    var id = $(e.target).attr("href");
    localStorage.setItem('selectedTab', id)
});

var selectedTab = localStorage.getItem('selectedTab');
if (selectedTab != null) {
    $('a[data-toggle="tab"][href="' + selectedTab + '"]').tab('show');
}
</script>
</html>