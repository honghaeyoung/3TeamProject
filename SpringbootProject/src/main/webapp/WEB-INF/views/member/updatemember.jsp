<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style>
	#updatemember {text-align:center;}
</style>
</head>
<body>
<h3>${Member.memberid}님의 회원 정보수정</h3>
<form  action="updatemember" method="post" >
<table border="1">
	<tr>
		<td>id: ${Member.memberid}
		<input type="hidden" name="memberid" value="${Member.memberid}">
		</td>
	</tr>
	<tr>
		<td>pw:<input type="password" id="pw" name="memberpw" value="${Member.memberpw}"></td>
	</tr>
	<tr>
		<td>name:<input type="text" id="name" name="name" value="${Member.name}"></td>
	</tr>
	<tr>
		<td>phone:<input type="text" id="phone" name="phone" value="${Member.phone}"></td>
	</tr>
	<tr>
		<td>address:<input type="text" id="address" name="address" value="${Member.address}"></td>
	</tr>
	<tr>
		<td>gender:<input type="text" id="gender" name="gender" value="${Member.gender}"></td>
	</tr>
	<tr>
		<td>birthday:<input type="date" id="birthday" name="birthday" placeholder="yyyyMMdd" value="${Member.birthday}"></td>
	</tr>
	<tr>
		<td>email:<input type="text" id="email" name="email" value="${Member.email}"></td>
	</tr>
	<tr>
		<td>pet:<input type="text" id="pet" name="pet" value="${Member.pet}"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="수정" id="updateok"></td>
	</tr>
</table>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$("#updateok").click(function(){
		alert("수정되었습니다.")
		location.href="memberAll";
	})
</script>
</body>
</html>