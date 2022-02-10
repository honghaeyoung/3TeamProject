<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script>
function check(){
	if(fr.id.value==""){ 
		alert("아이디 입력");
		fr.id.focus();
		return false;
	}
	
	else if(fr.pwd.value==""){
		alert("비밀번호를 입력하세요");
		fr.pwd.focus();
		return false;
	}

}
</script>
<style type="text/css">
h1{
text-align:center;
}
.input_field{
	margin-top: 20px; 
	text-align:center;
	
}
.button{
	margin-top:20px;
	 height: 35px;
  line-height: 35px;
 	margin-left : 40%
}
input{
width : 300px;
}
.errors{
text-align:center;
}
</style>
</head>
<body>
<h1>로그인</h1>
<div class="Login">
        <form:form action = "login" method ="post" modelAttribute ="command">
        <div class="errors">
        <form:errors element="div"/>
        </div>
        <div class="input_field"> 
        <input type="text" name="memberid" id ="id" placeholder="id" />
        </div>
         <div class="input_field"> 
         <input type="password" name="memberpw" id = "pwd" placeholder="password"  />
         </div>
          
          
              <input class="button" type="submit" value="Login" />
                <input class="button" type="button" value="회원가입" onclick="location.href='/JoinForm'"/>
              </form:form>
          </div>
</body>

</html>