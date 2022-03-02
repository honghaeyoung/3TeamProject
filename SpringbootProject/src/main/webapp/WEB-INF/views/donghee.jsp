<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>문의게시판</title>
<style>
#center {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
}

#btn {
	text-align: right;
	margin-right: 10%;
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
</head>
<body>
	<div id="center">
		<h1>문의게시판</h1>
		<p>서비스 이용 시 불편사항이나 문의사항을 보내주시면 신속하고 친절하게 안내해 드리겠습니다!</p>

		 <div id="btn">
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
			</select> <input type="text" name="search" size="15" maxlength="50" /> <input
				type="submit" value="검색" />
		</form>
	</div>
</body>
</html>