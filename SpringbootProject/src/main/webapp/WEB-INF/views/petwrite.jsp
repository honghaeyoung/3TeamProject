<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
table{
width :750px;
margin-left:auto; 
margin-right:auto;
height : 700px;
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
.ptitle{
width:80%;
}
.pp{
width:80%;
}

table{border-collapse : collapse;}
</style>
</head>
<body>
<form method="post" id="writeform" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td class="orange">제목</td>
			<td><input name="ptitle" class="ptitle"/></td>
		</tr>
		<tr>
			<td class="orange">작성자</td>
			<td><input name="memberid" value="${user.memberid}" readonly></td>
		</tr>
		<tr>
			<td class="orange">지역</td>
			<td><input name="paddress" placeholder="ex)서울 종로구 관철동" class="pp"></td>
		</tr>
		<tr>
			<td class="orange">연락처</td>
			<td><input name="pphone" placeholder="연락처 또는 카카오톡ID를 기재해주세요." class="pp"></td>
		</tr>
		<tr>
			<td class="orange">반려동물 종류</td>
			<td>
			<input type="checkbox" value="개" id="dog" name="pkind" />
			<label for="dog">개</label>
			<input type="checkbox" value="고양이" id="cat" name="pkind" />
			<label for="cat">고양이</label>
			<input type="checkbox" value="토끼" id="rabbit" name="pkind"/>
			<label for="rabbit">토끼</label>
			<input type="checkbox" value="고슴도치" id="hedgehog" name="pkind"/>
			<label for="hedgehog">고슴도치</label>
			<input type="checkbox" value="그외" id="other" name="pkind"/>
			<label for="other">그외</label>
		</td>
		</tr>
		<tr>
			<td class="orange">기간</td>
			<td>
			<input type="radio" value="1주" id="one" name="pperiod"/>
			<label for="one">1주</label>
			<input type="radio" value="2주" id="two" name="pperiod"/>
			<label for="two">2주</label>
			<input type="radio" value="3주" id="three" name="pperiod"/>
			<label for="three">3주</label>
			<input type="radio" value="4주" id="four" name="pperiod"/>
			<label for="four">4주</label>
			<input type="radio" value="5주" id="other" name="pperiod"/>
			<label for="other">그외</label>
			</td>
		</tr>
		<tr>
		<td class="orange">요금</td>
			<td><input name="pprice" placeholder="원하시는 총 요금을 원까지 기재해주세요." class="pp"></td>
		</tr>
		<tr>
			<td class="orange">사진 </td>
			<td><input type = "file" name ="file"></td>
		</tr>
		<tr>
			<td class="orange">내용</td>
			<td><textarea name="pcontent" cols="40" rows="10" placeholder="400자 이내" class="pp"></textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="새글 등록" id="btn"> <input type="reset" value="초기화" id="btn">
			</td>
		</tr>
	</table>

</form>

</body>
</html>