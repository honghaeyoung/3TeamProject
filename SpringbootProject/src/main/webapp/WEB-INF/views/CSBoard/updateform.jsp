<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>글 수정</title>
<style type="text/css">

table{
width :600px;
margin-left:auto; 
margin-right:auto;
height : 450px;
}
th {border: 1px solid white;
	  background: grey;
  color: #fff;
	width: 150px;
}
td{border: 1px solid white;}

textarea{
width : 100%;
height : 90%;
}

td,th{
border: 1px solid #dbdbdb;
  padding: 5px 20px;
  font-size:12px;
}
table{border-collapse : collapse;}
</style>
</head>
<body>
<form method="post" id="updateform" action="/CSBoard/update">
<input type="hidden" name="_method" value="put">
	<table border="1">
		<tr>	
			<td class="orange">제목</td>
			<td>
			<input name="cstitle" value="${dto.cstitle}"/>
			<input name="csno" value="${dto.csno}" type="hidden"> 
			</td>
		</tr>
		<tr>
			<td class="orange">작성자</td>
			<td>
			<input name="memberid" value="${dto.memberid}" readonly>
			</td>
		</tr>
		<tr>
			<td class="orange">내용</td>
			<td><textarea name="cscontent" cols="40" rows="10">${dto.cscontent}</textarea></td>
		</tr>
		<tr> 
			<td colspan="2" align="center">
				<input type="submit" value="수정" onclick="alert('수정되었습니다.');"> 
				<button type="button" onclick="history.back()" class="bd_btn cancle">취소</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>