<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>문의게시판</title>
</head>
<style>
#btn {
	text-align: right;
	margin-right: 250px;
}

h1, p {
	text-align: center;
	margin-top: 40px
}

table {
	border: 1px solid white;
	width: auto;
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
<body>
	<div id="center">
		<h1>문의게시판</h1>
		<p><span style="font-weight:bold; font-size:1.2em;">"${search}"</span>로 검색한 결과입니다.</p>
	</div>
	<div id="btn">
		<input type="button" class="btn btn-outline-secondary" value="Main"
			onclick="location.href='/'" /> 
		<input type="button" class="btn btn-outline-secondary" value="목록 이동"
			onclick="location.href='/CSBoard/list'" />
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
					<td align="center"><fmt:formatDate value="${CSBoard.csregdate }"
							dateStyle="short" /></td>

				</tr>
			</c:forEach>
		</table>
		<div id="page">
			<c:if test="${begin > pageNum }">
				<a href="search?p=${begin-1}&search=${search}&searchn=${searchn}">[이전]</a>
			</c:if>
			<c:forEach begin="${begin }" end="${end}" var="i">
				<a href="search?p=${i}&search=${search}&searchn=${searchn}">${i}</a>
			</c:forEach>
			<c:if test="${end < totalPages }">
				<a href="search?p=${end+1}&search=${search}&searchn=${searchn}">[다음]</a>
			</c:if>
		</div>

	</c:if>
	<div align="center">
	<c:if test="${count == 0 }">
	<br><br>검색 조건에 맞는 글이 없습니다.<br><br><br><br>
		</c:if>
	</div>
	<div id="search" align="center">
		<form action="search">
			<select name="searchn">
				<option value="0">제목</option>
				<option value="1">내용</option>
				<option value="2">작성자</option>
			</select> <input type="text" name="search" size="15" maxlength="50" /> 
			<input type="submit" value="검색" />
		</form>
	</div>
	</div>
</body>
</html>