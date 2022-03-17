<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
:root{
	--body-background-color: #f5f6f7;
	--font-color: #4e4e4e;
	--border-gray-color : #dadada;
	--naver-green-color: #04c75a;
	--naver-green-border-color: #06b350;
}


*{
	margin:0;
	padding:0;
}

body{
	background:var(--body-background-color);
}

.main-container{
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-top: 100px;
}
.main-container .main-wrap{
	width:768px;

}
.main-container .main-wrap .sel-lang-wrap .lang-select
{
	width: 96px;
	height: 30px;
	color: var(--font-color);
	border: solid 1px var(--border-gray-color);
}
.main-container .main-wrap .logo-wrap{
	padding-top:55px;
}
.main-container .main-wrap .logo-wrap img
{
	width: 231px;
	height: 44px;
}

.main-container .main-wrap header .sel-lang-wrap{
	display:flex;
	justify-content:flex-end;
}

.main-container .main-wrap header .logo-wrap{
	display:flex;	
	flex-direction: column;
	align-items: center;
}
.login-input-section-wrap{
	padding-top: 60px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.login-input-wrap{
	width: 465px;
	height :48px;
	border: solid 1px var(	--border-gray-color );
	background: white;
}
.password-wrap{
	margin-top: 13px;
}
.login-input-wrap input{
	border: none;
	width:430px;
	margin-top: 10px;
	font-size: 14px;
	margin-left: 10px;
	height:30px;
}
.login-button-wrap {
	padding-top: 13px;
}
.login-button-wrap button, #btn{
	width: 465px;
	height :48px;
	font-size: 18px;
	background: black;
	color: white;
	border: solid 1px;
}
.login-stay-sign-in{
	width: 465px;
	height: 52px;
	
	display: flex;
	font-size: 15px;
	color: #4e4e4e;
	align-items: center;
	justify-content: flex-start;
	border-bottom: solid 1px var(--border-gray-color);
}
.login-stay-sign-in i{
	font-size: 25px;
	color: #9ba1a3;
}
.login-stay-sign-in span{
	padding-left: 5px;
	line-height: 25px;
}

.Easy-sgin-in-wrap{

	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 40px;

}
.Easy-sgin-in-wrap h2{
	font-size: 20px;
}
.Easy-sgin-in-wrap .sign-button-list
{
	padding-top:25px;
	list-style: none;
	width: 465px;
	display: flex;
	flex-direction: column;
	align-items: center;
}
.Easy-sgin-in-wrap .sign-button-list li{
	padding-bottom: 10px;
}
.Easy-sgin-in-wrap .sign-button-list li button{
	width: 465px;
	height: 56px;
	border: solid 1px var(--border-gray-color);
	text-align: left;
	background: white;
}
.Easy-sgin-in-wrap .sign-button-list li button i{
	padding-left: 15px;
	font-size: 20px;
}
.fa-qrcode
{
	color:var(--naver-green-color);
}
.fa-line{
	color:var(--naver-green-color);
}
.fa-facebook-square
{
	color:#4064ac;
}
.Easy-sgin-in-wrap .sign-button-list li button span{
	padding-left: 20px;
	font-size: 18px;
}
.Easy-sgin-in-wrap .forget-msg{
	color:var(--font-color);
	font-size: 14px;
	padding-top: 10px;

}
footer{
   
	padding-top: 95px;
	padding-bottom: 15px;

	display:flex;
	flex-direction:column;
	align-items:center;
	width:768px;



}
.copyright-wrap{

	display: flex;
	flex-direction: column;
	align-items: center;
	height: 15px;


}
footer .copyright-wrap span img{
	width: 59px;
	
	height: 11px;
}
footer .copyright-wrap span{
	font-size: 13px;
	line-height: 15px;
}
ul li {list-style-type: none; float: left; margin-left: 45px;
}
.errors{
text-align:center;
color: red;
}
a:link { color: red; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: underline;}

</style>
</head>
<body>
<c:import url="/WEB-INF/views/include/top.jsp" />

<div class="main-container">
		<div class="main-wrap">
		<header>
			<div class="sel-lang-wrap">
				
			</div>
			<div class="logo-wrap">
				<h1><a href="/">혼사모</a></h1><br><h5>회원탈퇴</h5>
			</div>
		</header>
		<form:form action="deletemember" method="post" name="deleteform" onsubmit="deleteMember()" modelAttribute="user">
		<section class="login-input-section-wrap">
			<div class="login-input-wrap">	
				<input placeholder="비밀번호" type="password" name="memberpw"></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input placeholder="'회원탈퇴' 작성해주세요" type="text" name="deletecheck"></input>
			</div>
			<br><div class="errors">
        <form:errors element="div"/>
        </div>
			<div class="login-button-wrap">
				<input type="submit" id="btn" value="회원 탈퇴">
			</div>
			
		</section>
		</form:form>
		<footer>
			<div class="copyright-wrap">
			<span> Copyright 2022. Team3 all rights reserved.<br>김남준 김동희 안찬우 엄혜선 홍해영 현지은</span>
			</div>
		</footer>
		</div>
	</div>
<script type="text/javascript">
		function deleteMember(){
			if(document.deleteform.memberpw.value==""){
				alert("비밀번호를 입력해주세요.");
				document.deleteform.memberpw.focus();
			} else if(document.deleteform.deletecheck.value != "회원탈퇴"){
				alert("회원탈퇴 항목이 틀립니다.");
				document.deleteform.deletecheck.focus();
				return false;
			} else {
				return
			}
		}
	</script>
	
</body>
</html>