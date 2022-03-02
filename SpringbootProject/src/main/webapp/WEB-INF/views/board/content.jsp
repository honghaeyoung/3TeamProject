<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>글 상세보기</title>
</head>
<body>
<form id="form">
<div id="container">
<table border="1">
	<tr><td>제목</td><td>${dto.title}</td>
	<tr><td>작성자</td><td>${dto.memberid}</td>
	<tr><td>등록일</td><td><fmt:formatDate value="${dto.regdate }" dateStyle="long"/></td>
	<tr><td>조회수</td><td>${dto.readcount}</td>
	<tr><td>추천수</td><td>${dto.recommend}</td>
	<tr><td>내용</td><td>${dto.content}</td>
	
	<c:if test = "${user.memberid != null and user.memberid == dto.memberid}">
		<tr><td><button type = "button" id="btnRecommend">추천</button></td>
	</c:if>
	
	<tr><td colspan="2" align="right">
	<c:if test="${ user.memberid == dto.memberid }">
	<a href="/board/update/${dto.no}">글 수정 </a> 
	<a id="${dto.no}" href="#">글 삭제</a>
	</c:if>
	<a href="../list">목록 이동</a> 
	</td></tr>
</table>
<div>
	<c:forEach items="${cList}" var="comm">
		<div>${comm.memberid} / <fmt:formatDate value="${comm.regdate}" dateStyle="short"/></div>
		<div>${comm.ccontent} 
		<c:if test="${comm.memberid == user.memberid }">
		<button class="ubtn" id="${comm.cno}">수정</button>
		<button class="dbtn" id="${comm.cno}">삭제</button>
		</c:if>
		</div>
		<hr>
	</c:forEach>
	<input name="ccontent" id="ccontent"><button id="add">등록</button>
</div>
</div>

</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let no = $(this).attr("id");	//id -> memberid 생각
			$.ajax({url:"/board/delete", data:"no="+no, method:"delete"}
			).done(function(){
				location.href="/board/list";
			})
			return false;
		})//click
	
		$("#btnRecommend").click(function(){
			let no = ${dto.no};
			$.ajax({url:"/board/content/"+no+"/recommend", 
				    data:"no="+no, 
				    method:"get",
				    success : function(){
				    	location.reload();}
				})
			})
	    
	    $("#add").click(function(){
			let memberid = '${user.memberid}';
			let ccontent = $("#ccontent").val();
			let no = ${dto.no};
			
			$.ajax({url:"/comm/insert",
					data:"no="+no+"&memberid="+memberid+"&ccontent="+ccontent,
					method:"get"
			}).done(function(){
					location.reload();		
				});
			
		})//click
		
		$(".dbtn").click(function(){
			let cno = $(this).attr("id");	//id -> memberid 생각
			$.ajax({url:"/comm/delete/"+cno,
				method:"get"
		}).done(function(){
				location.reload();		
			});
			
		})//click
})
</script>
</body>
</html>