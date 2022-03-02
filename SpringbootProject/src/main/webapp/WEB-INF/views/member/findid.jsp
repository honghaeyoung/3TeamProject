<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
#input {
	width: 10%;
	height: 15%;
	font-family: 'Dongle', sans-serif;
	font-size: 1em;
	margin: auto;
}
</style>
<script>
function id_search() { 
 	var frm = document.idfindscreen;
 	var email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

 	if (frm.name.value.length < 1) {
	  alert("이름을 입력해주세요");
	  return;
	 }

	 if (frm.email.value.match(email) != null) {
		  return;
	 }else{
		 alert("이메일 양식이아닙니다")
		 return;
	 }

 }
</script>
</head>
<body>
<c:import url="/WEB-INF/views/include/top.jsp" />
<form name="idfindscreen" method = "POST">
			<div class = "search-title">
				<h3>이메일 본인확인</h3>
			</div>
		<section class = "form-search">
			<div class = "find-name">
				<label>이름</label>
				<input type="text" name="name" class = "btn-name" id="input" placeholder = "등록한 이름">
			<br>
			</div>
			<div class = "find-phone">
				<label>이메일</label>
				<input type="text" name="email" class = "btn-phone" id="input" placeholder = "이메일을 입력 ex xxx@xxx">
			</div>
			<br>
	</section>
	<div class ="btnSearch">
		<input type="button" name="enter" value="찾기"  onClick="id_search()">
		<input type="button" name="cancle" value="취소" onClick="history.back()">
 	</div>
 </form>
 <c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>