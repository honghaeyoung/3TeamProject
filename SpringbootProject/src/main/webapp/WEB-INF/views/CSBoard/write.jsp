<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>문의게시판</title>
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
<form method="post" id="writeform">
	<table border="1">
		<tr>
			<td class="orange" align="center">title</td>
			<td><input name="cstitle"></td>
		</tr>
		<tr>
			<td class="orange" align="center">id</td>
			<td><input name="memberid" value="${user.memberid}" readonly></td>
		</tr>
		<tr>
				<td align="center">pw</td>
				<td><input name="cspw" type="password"></td>
		</tr>
		<tr>
			<td class="orange" align="center">content</td>
			<td><textarea name="cscontent" cols="40" rows="10"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="등록" onclick="alert('등록되었습니다.');">&nbsp;
			<button type="button" onclick="history.back()" class="bd_btn cancle">돌아가기</button>
		</td>
		</tr>
	</table>

</form>

</body>
</html>