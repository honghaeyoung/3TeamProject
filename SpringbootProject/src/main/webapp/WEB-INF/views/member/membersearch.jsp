<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원조회</title>
<style>
	#mpage {text-align: center;}
	#center {text-align : center;}
</style>
</head>
<body>
<body>

	<div id="center">
		<h1>${msearch}로 검색한 결과입니다.</h1>
		
		<div align="right">
			<a href="/main">main</a><a href="/memberAll">전체목록</a>
		</div>

		<c:if test="${count != 0 }">
			<table border="1" align="center">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>연락처</th>
					<th>주소</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>이메일</th>
					<th>pet여부</th>
					<th>수정/삭제</th>
				</tr>
				<c:forEach items="${mList}" var="msearch">
					<tr>
						<td>${msearch.memberid}</td>	
						<td>${msearch.name}</td>
						<td>${msearch.phone}</td>
						<td>${msearch.address}</td>
						<td>${msearch.gender}</td>
						<td><fmt:formatDate value="${msearch.birthday}" dateStyle="short"/></td>
						<td>${msearch.email}</td>
						<td>${msearch.pet}</td>
						<td><input type="submit" value="수정" id="updatemember">
							<input type="submit" value="삭제" id="deletemember"></td>
					</tr>
				</c:forEach>
			</table>
			<div id="mpage">
				<c:if test="${begin > pageNum }">
					<a href="msearch?p=${begin-1}&msearch=${msearch}&msearchn=${msearchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="msearch?p=${i}&msearch=${msearch}&msearchn=${msearchn}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="msearch?p=${end+1}&msearch=${msearch}&msearchn=${msearchn}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	검색 조건에 맞는 회원이 없습니다.
</c:if>
<div id="msearch" align="center">
<form action="membersearch">
<select name="msearchn">
<option value="0">아이디</option>
<option value="1">이름</option>
<option value="2">연락처</option>
</select>
<input type="text" name="msearch" size="15" maxlength="50" /> 
<input type="submit" value="검색" />
</form>
	</div>
	</div>
</body>
</html>