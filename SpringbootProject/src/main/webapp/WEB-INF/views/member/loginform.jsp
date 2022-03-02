<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap')
	;
</style>
<style type="text/css">
hr {
	width: 30%;
}

h1 {
	font-family: 'Dongle', sans-serif;
	text-align: center;
	margin-bottom: 40px;
}

.input {
	width: 10%;
	height: 15%;
	font-family: 'Dongle', sans-serif;
	font-size: 1em;
	margin: auto;
}

.input1 {
	width: 300px;
	
	font-family: 'Dongle', sans-serif;
	font-size: 2em;
	margin: auto;
}

.button_class {
	margin: auto;
	text-align: center;
}

.button_class>button {
	font-family: 'Dongle', sans-serif;
	font-size: 1em;
}

.input_field {
	margin-top: 20px;
	text-align: center;
}


.bt {
  background: #120112;
  background-image: -webkit-linear-gradient(top, #120112, #0a1b26);
  background-image: -moz-linear-gradient(top, #120112, #0a1b26);
  background-image: -ms-linear-gradient(top, #120112, #0a1b26);
  background-image: -o-linear-gradient(top, #120112, #0a1b26);
  background-image: linear-gradient(to bottom, #120112, #0a1b26);
  font-family: Arial;
  color: #ffffff;
  font-size: 10px;
  padding: 5px 7px 8px 7px;
  text-decoration: none;
  text-align: right;
  
}

.bt:hover {
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
}
.errors{
text-align:center;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/include/top.jsp" />
<div class="logo"><h1>로그인</h1></div>
<div class="input_field">
        <form:form action = "login" method ="post" modelAttribute ="user">
        <div class="errors">
        <form:errors element="div"/>
        </div>
        <div class="input_field"> 
        <label for="id" class="input">아이디</label>
        <input type="text" name="memberid" id ="id" placeholder="id" class="input1"/>
        </div>
         <div class="input_field">
         <label for="pwd" class="input">비밀번호</label> 
         <input type="password" name="memberpw" id = "pwd" placeholder="password"  class="input1"/>&nbsp;
         </div>
          
          
              <input class="bt" type="submit" value="로그인" />&nbsp;
                <input class="bt" type="button" value="회원가입" onclick="location.href='joinform'"/>
              </form:form>
              <a href=findidform>아이디 찾기</a>&nbsp;
              <a href=findpwform>비밀번호 찾기</a>
          </div>
          <c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>

</html>