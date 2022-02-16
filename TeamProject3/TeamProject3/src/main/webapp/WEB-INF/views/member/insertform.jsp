<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//id 중복검사
	$(function(){
	$("#id_check").click(function(){
		let id = $("#memberid").val();
		//alert(id)
		if(!id){
			$("#id_msg").html("아이디를 입력하세요").css("color",'red');
			return false;
		}
		$.ajax({url:"/idchk", data:"memberid="+id, datatype:"text"}
		).done(function(data){
			if(data == ""){
				$("#id_msg").html("사용할 수 있는 아이디 입니다.").css('color','green');
				$("#id_msg").append("<input type='hidden' id='id_ck' value='1'>");
			}else{
				$("#id_msg").html("이미 사용중인 아이디 입니다.").css('color','red');
			}
		})
	});//아이디 중복 확인 click
})//ready
</script>
<script>
	//패스워드 일치 검사.
	$(function() {
		$("#password1").on('blur', function() { //password1탭에 키보드를 치면 function 수행
			if ($('#password').val() == $('#password1').val()) {//password값과 password1의 값이 같다면,
				$("#message").html('일치합니다.').css('color', 'green'); //일치한다고 나타내기. 
			} else {
				$("#message").html('비밀번호가 일치하지 않습니다.').css('color', 'red'); //그 외의 경우에는 일치하지 않는다고 하며 false값 리턴. 
				return false;
			}
		})//on

	}) //ready

</script>
<script>
let num ="";
$(function(){
	
	 $("#mail_ck").click(function(){
		 let email = $("#email").val();
		if(!email){
				$("#result").css("display","block").html("메일 주소를 입력하세요");
				
				return false;
			} 
	 $.ajax({url:"/send",
		 	data:"emailAddress="+email,
			dataType:"json"}
		).done(function(data){
			if(eval(data[1])){
				num = data[0];
				alert("메일이 전송되었습니다. 인증번호를 입력하세요.")
				$("#input,#result").css("display","block");
			}
		}); 
	})//이메일 인증번호전송 
	$("#ck_b").click(function(){
		let ck_num = $("#ck_num").val();
		if(ck_num == num){
			$("#result").html("인증이 확인되었습니다.")
			$("#result").append("<input type='hidden' id='ck' value='1'>");
		}else{
			$("#result").html("인증 실패했습니다. 다시 확인하세요.");
		}
	})//이메일 인증번호 체크
	$("#id_check").click(function(){
		let id = $("#id").val();
		$.post("/idchk", {"id" : id},function(data){
			$("#id_msg").empty();
			if(eval(data)){
				alert("사용 가능한 아이디");
				$("#id_msg").append("<input type='hidden' id='ck_id' value='1'>")
			}else{
				alert("중복된 아이디입니다.");
			}
		})
	})
})
const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
</script>
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
</head>
<body>
	<h1>회원가입을 환영합니다.</h1>
	<form action="insert" method="post">
		<div class=input_field>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="memberid" class="input">아이디</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="memberid" id="memberid" class="input"
				placeholder="id를 입력해주세요."> <input type="button" class="btn"
				id="id_check" value="중복검사"> <br> <span id="id_msg"></span>
				
			<br>
			<hr>
		</div>
		
		
		<div class=input_field>
			<label for="memberpw" class="input">비밀번호</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="password" name="memberpw" id="password" class="input"
				placeholder="password를 입력해주세요."><br> <br>
			<hr>
			<br> 
				<label for="password1" class="input">비밀번호확인</label>&nbsp;
				<input type="password" name="password1" id="password1" class="input"
				placeholder="password확인"><br> <span id='message'></span><br>
			<hr>
		</div>
		
		
		<div class=input_field>
			&nbsp;<label for="name" class="input">이름 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="name" id="name" class="input"
				placeholder="이름 "><br> <br>
			<hr>
		</div>
		
		<div class=input_field>
			<label for="phone" class="input">전화번호</label>&nbsp;&nbsp;&nbsp;
			<input type="tel" name="phone" class="input" oninput="autoHyphen(this)" maxlength="13" placeholder="전화번호"><br> <br>
			<hr>
		</div>
		
		<div class=input_field>
		<label for="gender" class="input">성별</label>&nbsp;&nbsp;&nbsp;&nbsp;
		<label class="radio_obj">
    <input type="radio" name="gender" value="남자" class="input">
    <span>남자</span>
	</label>
 	&nbsp;
	<label class="radio_obj">
    <input type="radio" name="gender" value="여자" class="input">
    <span>여자</span>
</label>
	<hr>
</div>		
		
		<div class=input_field>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="address" class="input">주소</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="address" id="address" placeholder="주소입력" class="input">
			<input type="button" value="주소 찾기" class="btn"
				name="addresscheck" id="addresscheck"> 
				<br>
				<label for="address1" class="input">상세주소</label>&nbsp;&nbsp;&nbsp;
				<input type="text" name="address" id="address1" class="input"
				placeholder="나머지 주소입력"> <br>
			<hr>
			
		</div>
		
		<div class=input_field>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="email" class="input">이메일</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="email" name="email" id="email" class="input"
				placeholder="이메일 ex xxxxx@xxxxx.com ">
		<input type="button" id="mail_ck" value="메일 인증" class="btn">
		<br>
		<div id="input">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="ck_num" class="input">인증번호</label>&nbsp;&nbsp;&nbsp;
		<input id="ck_num" class="input" placeholder="인증번호"> <input type="button" id="ck_b" value="인증 확인" class="btn"></div>
		<div id="result"></div>
				<br>
			<hr>
		</div>
		
		
		<div class=input_field style="text-indent:-27px;">
			&nbsp;&nbsp;&nbsp;<label for="birthday" class="input" style="text-indent:-40px;">생년월일</label>&nbsp;&nbsp;
			<input type="date" name="birthday" id="birthday" placeholder="생년월일" class="input" ><br>
			<br>
			<hr>
		</div>
		
		<div class=input_field>
		<label for="pet" class="input">반려동물</label>&nbsp;&nbsp;
		<label class="radio_obj">
    <input type="radio" name="pet" value="유" class="input">
    <span>유</span>
	</label>
 	&nbsp;&nbsp;
	<label class="radio_obj">
    	<input type="radio" name="pet" value="무" class="input">
    	<span>무</span>
	</label>&nbsp;&nbsp;&nbsp;&nbsp;
	<hr>
	<br>
</div>
		
		
		
		<div class="button_class">&nbsp;&nbsp;
			<button type="submit" name="button" class="btn">회원가입</button>
			&nbsp;
			<button type="reset" name="button" class="btn">초기화</button>
		</div>
		
		
	</form>
</body>
</html>