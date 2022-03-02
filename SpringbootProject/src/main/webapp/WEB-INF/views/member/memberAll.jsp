<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style>
	#mpage{text-align: center;}
</style>
</head>
<body>
<div align="center">
<h2>회원목록</h2>
</div>

<div id="msearch" align="center" >
<form action="membersearch">
<select name="msearchn">
	<option value="0">아이디</option>
	<option value="0">이름</option>
	<option value="0">연락처</option>
</select>
<input type="text" name="msearch" size="15" maxlength="50" />
<input type="submit" value="검색" />
</form>
</div>

<table border="1" align="center">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>연락처</th>
		<th>주소</th>
		<th>성별</th>
		<th>생년월일</th>
		<th>이메일</th>
		<th>pet유무</th>
		<th>수정/삭제</th>
		</tr>
		<c:forEach items="${mList}" var="memberAll">
	<tr>
		<td>${memberAll.memberid}</td>	
		<td>${memberAll.name}</td>
		<td>${memberAll.phone}</td>
		<td>${memberAll.address}</td>
		<td>${memberAll.gender}</td>
		<td><fmt:formatDate value="${memberAll.birthday}" dateStyle="short"/></td>
		<td>${memberAll.email}</td>
		<td>${memberAll.pet}</td>
		<td><input type="button" value="수정" onclick="updatemember('${memberAll.memberid}')">
		<input type="button" value="삭제" onclick="deletemember('${memberAll.memberid}')"></td>
	</tr>
		</c:forEach>
</table>
<div id="mpage">
		<c:if test="${begin > pageNum}">
		<a href="memberAll?p=${begin-1}">[이전]</a>
		</c:if>
		<c:forEach begin="${begin}" end="${end}" var="i">
			<a href="memberAll?p=${i}">${i}</a>
		</c:forEach>
		<c:if test="${end < totalPages }">
		<a href="memberAll?p=${end +1}">[다음]</a>
		</c:if>
	</div>
	
<div align="center">
	<c:if test="${count ==0}">
		회원이 없습니다.
	</c:if>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	function updatemember(id){
		var result =confirm("회원정보를 수정 하시겠습니까?");
		if(result){
			location.href="updatemember?id="+id;
		}else{
		
		}
		
	};
	
	function deletemember(id){
		var result =confirm("회원정보를 삭제 하시겠습니까?");
		if(result){
			location.href="deletemember?id="+id;
		}else{
		
		}
		
	};

</script>
</body>
</html>