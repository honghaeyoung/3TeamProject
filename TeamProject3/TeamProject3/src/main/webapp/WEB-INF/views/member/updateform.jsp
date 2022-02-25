<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보 수정</title>
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

.radio_obj input[type="radio"] {
        display: none;
}
 
.radio_obj input[type="radio"] + span {
    display: inline-block;
    padding: 5px 5px;
    border: 1px solid #dfdfdf;
    background-color: #ffffff;
    text-align: center;
    cursor: pointer;
}
 
.radio_obj input[type="radio"]:checked + span {
    background-color: #113a6b;
    color: #ffffff;
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
<h1>${user.memberid}님의 정보를 수정합니다.</h1>
<form action="update" method="post" id="updateform" class="updateform">
	<div class=input_field>
			<label for="memberid" class="input">아이디</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="memberid" id="memberid" class="input"
				placeholder="${user.memberid }" disabled> 
				
				
			<br>
			<hr>
		</div>
		
		
		<div class=input_field>
			<label for="memberpw" class="input">비밀번호</label>&nbsp;&nbsp;&nbsp;
			<input type="password" name="memberpw" id="memberpw" class="input"
				placeholder="${user.memberpw }" required><br> <br>
			<hr>
			<br> 
				<label for="password1" class="input">비밀번호확인</label>
			<input type="password" name="password1" id="password1" class="input"
				placeholder="${user.memberpw }" required><br> <span id='message'></span><br>
			<hr>
		</div>
		
		
		<div class=input_field>
			<label for="name" class="input">이름 </label>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="name" id="name" class="input"
				placeholder="${user.name }" required><br> 
			<hr>
		</div>
		
		<div class=input_field>
			<label for="phone" class="input">전화번호 </label>&nbsp;
			<input type="tel" name="phone" class="input" oninput="autoHyphen(this)" maxlength="13" placeholder="${user.phone}" required><br>
			<hr>
		</div>
		
		<div class=input_field>
		<label for="gender" class="input">성별</label>&nbsp;&nbsp;
		<label class="radio_obj">
    <input type="radio" name="gender" value="남자" class="input">
    <span>남자</span>
	</label>
 
	<label class="radio_obj">
    <input type="radio" name="gender" value="여자" class="input">
    <span>여자</span>
</label>
	<hr>
	
</div>		
		
		<div class=input_field>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="address" class="input">주소</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="address" id="address" placeholder="${user.address }" class="input">
			<input type="button" value="주소 찾기" class="btn"
				name="addresscheck" id="addresscheck"> 
				<br>
				<label for="address1" class="input">상세주소</label>&nbsp;&nbsp;
				<input type="text" name="address" id="address1" class="input"
				placeholder="나머지 주소입력" required> <br>
			<hr>
			
		</div>
		
		<div class=input_field>
			<label for="email" class="input">이메일</label>&nbsp;&nbsp;&nbsp;
			<input type="email" name="email" id="email" class="input"
				value="${user.email } "disabled>
	
				 
			<hr>
		</div>
		
		
		<div class=input_field>
		<label for="birthday" class="input">생년월일</label>&nbsp;&nbsp;
			<input type="date" name="birthday" id="birthday" placeholder="생년월일" class="input" required>&nbsp;<br>
			<br>
			<hr>
		</div>
		
		<div class=input_field>
		<label for="pet" class="input" style="text-indent:-30px;">반려동물</label>&nbsp;&nbsp;&nbsp;
		<label class="radio_obj">
    <input type="radio" name="pet" value="유" class="input" checked="checked" <c:if test="${user.pet eq '유'}">checked</c:if>>
    <span>유</span>
	</label>
 	&nbsp;
	<label class="radio_obj">
    	<input type="radio" name="pet" value="무" class="input" <c:if test="${user.pet eq '무' }">checked</c:if>>
    	<span>무</span>&nbsp;&nbsp;&nbsp;&nbsp;
	</label>
	<hr>
	<br>
</div>
		
		
		
		<div class="button_class">&nbsp;
			<button type="submit" name="button" class="btn">완료</button>&nbsp;&nbsp;
			<button type="reset" name="button" class="btn" onclick="history.back()">취소</button>
		</div>
		
		
	</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function addPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            	document.querySelector("#address").value = data.address;
            	alert("나머지 주소도 입력하세요.");
        }
    }).open();
}    

$(function(){
	$("#updateform").submit(function(){
		if(!$("#memberpw").val()){
			alert("비밀번호를 입력해야 합니다.");
			return false;
		}
	});
})//ready

const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//주소 api
	$(function() {
		$("#addresscheck").click(function searchaddress() {
			new daum.Postcode({
				oncomplete : function(data) {
					document.querySelector("#address").value = data.address;
					alert("상세주소도 입력하세요.");
				}
			}).open();
		})

	})
</script>
</body>
</html>