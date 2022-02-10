<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
h1{
text-align: center;
}

.button{

	 height: 35px;
  line-height: 35px;
  display:block;
  margin : 20px auto;
 	
 	
#buttoncollection{
margin : auto; 
width : 100%;
}

</style>
</head>
<body>
<h1>${user.memberid}님 로그인이 완료되었습니다.</h1>
<div id = buttoncollection>
 <input class="button" type="button" value="로그아웃" onclick="location.href='/logout'"/> 
 <input class="button" type="button" value="게시글 목록" onclick="location.href='/board/list'"/>
 <a href="mypage">마이페이지</a> 
  </div>

</body>
</html>