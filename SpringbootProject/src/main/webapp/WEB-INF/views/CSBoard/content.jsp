<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>문의게시판</title>
<style>
#container {
	margin-top: 30px
}

table {
	width: 600px;
	margin-left: auto;
	margin-right: auto;
	height: 500px;
}

#comm {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	height: 50px;
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

textarea {
	width: 100%;
	height: 90%;
}

td, th {
	border: 1px solid #dbdbdb;
	padding: 5px 20px;
	font-size: 12px;
}

table {
	border-collapse: collapse;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
				$(function() {
					$("#add").click(function() {
						let masterid = '${cdto.masterid}';
						let csccontent = $("#csccontent").val();
						let csno = '${dto.csno}';
						$.ajax({
							url : "/CSComm/insert",
							data : "csno=" + csno + "&masterid=" + masterid + "&csccontent=" + csccontent,
							method : "get"
						}).done(function() {
							location.reload();
						});
					})//click
					$("a[id]").click(function() {
						/* var count = "${count}";
						if(count > 0) {
							alert("댓글이 있는 게시물은 삭제할 수 없습니다.")
						} */
						let csno = $(this).attr("id");
						$.ajax({
							url : "/CSBoard/delete",
							data : "csno=" + csno,
							method : "delete"
						 }).done(function() {
							location.href = "/CSBoard/list"; 
						})
						return false;
					})//click
					
					$(".dbtn").click(function() {
						let cscno = $(this).attr("id");
						$.ajax({
							url : "/CSComm/delete/" + cscno,
							method : "get"
						}).done(function() {
							location.reload();
						});
					})//click
					$(".updateComm").click(function(){
						let cscno = $(this).attr("id");
						$.post("/CSComm/commentOne",{"cscno":cscno},function(data){
							let sel = "."+cscno;
							$(sel).empty();
							$(sel).append('<input id="nwcomment" style="width:450px;" value="'+data+'">');
							$(sel).append('<input type="button" class="'+cscno+'" id="nw" value="등록">')
						})
					})
					$(document).on("click",'#nw' ,function(){
						let cscno = $(this).attr("class");
						let csccontent = $("#nwcomment").val();
						$.post("/CSComm/update", {
							"cscno" : cscno,
							"csccontent" : csccontent
						}, function() {
							location.reload();
						})
					})
				})//ready
	</script>
</head>
<body>
<!-- 본문 -->
	<div id="container">
		<table border="1">
			<tr>
				<td align="center">title</td>
				<td>${dto.cstitle}</td>
			<tr>
				<td align="center">id</td>
				<td>${dto.memberid}</td>
			<tr>
				<td align="center">content</td>
				<td>${dto.cscontent}</td>
			<tr>
				<td align="center">date</td>
				<td><fmt:formatDate value="${dto.csregdate }" dateStyle="long" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<%-- <c:if test="${ user.memberid == dto.memberid }"> --%>
					<%-- <input type="button" class="btn btn-outline-secondary" value="수정"
							onclick="location.href='/CSBoard/update/${dto.csno}'" /> --%>&nbsp;
							<a href="/CSBoard/update/${dto.csno}" >수정</a>
							<a id="${dto.csno}" href="#" onclick="alert('삭제되었습니다.');" >삭제</a>
					<%-- <input id="${dto.csno}" type="button"
							class="btn btn-outline-secondary" value="삭제" /> --%>&nbsp;
					<input type="button" class="btn btn-outline-secondary" value="목록 이동"
								onclick="location.href='../list'" />
				<%-- </c:if> --%>
			</tr>
		</table>
	</div>
<!-- 댓글 -->
		<h5>댓글(${count})</h5>
	<hr>
	<div>
		<c:choose>
			<c:when test="${fn:length(cList) == 0 }">
				<p>댓글이 존재하지 않습니다.</p>
				<hr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${cList}" var="list">
					<table id="comm">
						<tr>
							<td align="center">${list.masterid}</td>
							<td align="center">${list.csccontent}</td>
							<td align="center"><fmt:formatDate value="${list.cscregdate}"
									dateStyle="long" /></td>
						</tr>
					</table>
					<%-- <c:if test="${user.memberid == list.masterid}"> --%>
						<div class="${list.cscno}" align="center">
						<input type="button" id="${list.cscno}" class="updateComm"
							value="수정">
						<input type="button" id="${list.cscno}" class="dbtn" value="삭제">
						
						</div>
				<%-- 	</c:if> --%>
					<hr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<div>
		<%-- <c:if test="${user != null && cdto.masterid != null}"> --%>
			<h5>댓글 작성</h5>
			<form>
				<input type="hidden" id="csno" value="${dto.csno}">
				<table border="1" class="comm">
					<tr>
						<td class="orange">작성자</td>
						<td><input id="masterid" name="masterid" value="${cdto.masterid}" readonly></td>
					</tr>
					<tr>
						<td class="orange">내용</td>
						<td><textarea id="csccontent" name="csccontent" cols="50" rows="1"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="button" id="add" value="등록">
						<button type="button" onclick="history.back()" class="bd_btn cancle">취소</button>
						</td>
					</tr>
				</table>
			</form>
		<%-- </c:if> --%>
	</div>
</body>
</html>