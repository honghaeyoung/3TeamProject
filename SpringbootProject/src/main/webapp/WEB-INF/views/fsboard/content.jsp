<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>글 상세보기</title>
</head>
<body>
<div id="container">
<table border="1">
	<tr><td>제목</td><td>${dto.fstitle}</td>
	<tr><td>작성자</td><td>${dto.memberid}</td>
	<tr><td>등록일</td><td><fmt:formatDate value="${dto.fsregdate }" dateStyle="long"/></td>
	<tr><td>조회수</td><td>${dto.fsreadcount}</td>
	<tr><td>추천수</td><td>${dto.fsrecommend}</td>
	<tr><td>내용</td><td>${dto.fscontent}</td>
	<tr><td><input type="button" id="${dto.fsno}" value="추천"></td>
	<tr><td colspan="2" align="right">
	<c:if test="${ user.memberid == dto.memberid }">
	<a href="/fsboard/update/${dto.fsno}">글 수정 </a> 
	<a id="${dto.fsno}" href="#">글 삭제</a>
	</c:if>
	<a href="../list">목록 이동</a> 
	</td></tr>
</table>
<!--  cList -->
<div>
	<c:forEach items="${cList}" var="comm">
		<div>${comm.memberid} / <fmt:formatDate value="${comm.fsregdate}" dateStyle="short"/></div>
		<div>${comm.fsccontent} 
		<c:if test="${comm.memberid == user.memberid }">
		<button class="ubtn" id="${comm.fscno}">수정</button>
		<button class="dbtn" id="${comm.fscno}">삭제</button>
		</c:if>
		</div>
		<hr>
	</c:forEach>
	<input name="fsccontent" id="fsccontent"><button id="add">등록</button>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function updatebtn(fscno, regdate, fsccontent, memberid){
		console.log("들어옵니까?");
		
		var commentsview = "";
		
		commentsview +='<div id="fscno'+fscno+'">';
		commentsview +='<strong>';
		commentsview +='작성자 : ' + memberid;
		commentsview +='</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
		commentsview +='작성 날짜' + regdate;
		commentsview +='<br/><p>';
		commentsview +='댓글 내용 : &nbsp;&nbsp;&nbsp;';
		commentsview +='<textarea class="form-control" id="reply_edit_content">';
		commentsview +=fsccontent;
		commentsview +='</textarea>';
		commentsview +='<p>';
		commentsview +='<br/>';
		commentsview +='<button type="button" class="btn btn-outline-success"';
		commentsview +='onclick="ubtn('+fscno+',\''+memberid+'\')">댓글작성</button>';
		commentsview +='<button type="button" class="btn btn-outline-success" onclick="getreplylist()">';
		commentsview +='취소';
		commentsview +='</button>';
		commentsview +='</div>';
		commentsview +='<br/>';
		
		$('#fscno'+fscno).replaceWith(commentsview);
		$('#fscno'+fscno+'#fsccontent'+fsccontent).focus();
	};
</script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let fsno = $(this).attr("id");	//id -> memberid 생각
			$.ajax({url:"/fsboard/delete", data:"fsno="+fsno, method:"delete"}
			).done(function(){
				location.href="/fsboard/list";
			})
			return false;
		})//click
	
		$("input[id]").click(function(){
			let no = $(this).attr("id");	
			$.ajax({
				url:"fsboard/content/"+no+"/recommend", data:"fsno="+fsno, method:"post"}
			).done(function(){
                	location.reload();
                });
			})
	    
	    $("#add").click(function(){
			let memberid = '${user.memberid}';
			let fsccontent = $("#fsccontent").val();
			let fsno = ${dto.fsno};
			
			$.ajax({url:"/fscomm/insert",
					data:"fsno="+fsno+"&memberid="+memberid+"&fsccontent="+fsccontent,
					method:"get"
			}).done(function(){
					location.reload();		
				});
			
		})//click
		
		$(".dbtn").click(function(){
			let fscno = $(this).attr("id");	//id -> memberid 생각
			$.ajax({url:"/fscomm/delete/"+fscno,
				method:"get"
		}).done(function(){
				location.reload();		
			});
			
		})//click
		
		$(".ubtn").click(function(){
			let fscno = $(this).attr("id");	//id -> memberid 생각
			let fsccontent = $("#fsccontent").val();
			$.ajax({url:"/fscomm/update/"+fscno+"/"+fsccontent,
				method:"post",
				datatype:'json',
				success: function(result){
					getreplylist();
				}
				, error: function(error){
					console.log("에러 : "+ error);
				}
		})
	})
})
</script>
</body>
</html>