<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>음식점등록폼</title>
<style type="text/css">
	#FoodStore text-align="center"
</style>
</head>
<body>
<table border="1" id="FoodStore">
	<tr>
	<td><input type="text" id="Storename" name="Storename">음식점 이름</td>
	</tr>
	<tr>
	<td><input type="text" id="Storeaddress" name="Storeaddress">음식점 주소</td>
	</tr>
	<tr>
	<td><input type="text" id="Storephone" name="Storephone">음식점 연락처</td>
	</tr>
	<tr>
	<td><input type="text" id="Storecontent" name="Storecontent">상세설명</td>
	</tr>
	<tr>
	<td><input type="text" id="Storeprice" name="Storeprice">금액대</td>
	</tr>
		<tr>
	<td><input type="text" id="Storecomm" name="Storecomm">1줄소개</td>
	</tr>
	<tr>
	<td><input type="text" id="Storeregdate" name="Storeregdate">음식점 등록일</td>
	</tr>
	<tr>
	<td><input type="submit" id="registerStore">등록</td>
	</tr>
	<tr>
	<td><input type="button" id="cancelStore">취소</td>
	</tr>
	
</table>
</body>
</html>