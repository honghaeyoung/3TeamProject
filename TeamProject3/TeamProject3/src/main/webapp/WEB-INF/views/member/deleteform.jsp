<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<style>
body{
text-align: center;
}
</style>
<head>
<title>회원 탈퇴</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap')
	;
</style>
<style>
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
	width: 7%;
	height: 15%;
	font-family: 'Dongle', sans-serif;
	font-size: 1em;
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

#message {
	font-family: 'Dongle', sans-serif;
	font-size: 1em;
}

#id_msg {
	font-family: 'Dongle', sans-serif;
	font-size: 1em;
}


.btn {
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

.btn:hover {
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
}



</style>
</head>
<body>
<h1>회원 탈퇴</h1>
<form:form action="deletemember" method="post" name="deleteform" onsubmit="deleteMember()" modelAttribute="user">
<div>
<form:errors/>
</div>
<input type="password" name="memberpw" id="password" class="input" placeholder="비밀번호"><hr>
<input name="deletecheck" type="text" placeholder="회원탈퇴 작성" class="input"><br>
<input type="submit" value="회원 탈퇴" class="btn">
</form:form> 
<script type="text/javascript">
		function deleteMember(){
			if(document.deleteform.memberpw.value==""){
				alert("비밀번호를 입력해주세요.");
				document.deleteform.memberpw.focus();
			} else if(document.deleteform.deletecheck.value != "회원탈퇴"){
				alert("회원탈퇴 항목이 틀립니다.");
				document.deleteform.deletecheck.focus();
			} else {
				return
			}
		}
	</script>
</body>
</html>