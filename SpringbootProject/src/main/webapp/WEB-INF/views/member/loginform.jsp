<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>네이버 로그인</title>
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
	margin-top: 21px;
}
.main-container .main-wrap{
	width:768px;
	

}
.main-container .main-wrap .sel-lang-wrap .lang-select
{
	width: 96px;
	height: 100px;
	color: var(--font-color);
	border: solid 1px var(--border-gray-color);
}
.main-container .main-wrap .logo-wrap{
	padding-top:55px;
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
.login-button-wrap button{
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



}
.copyright-wrap{

	display: flex;
	flex-direction: column;
	align-items: center;
	height: 15px;


}
ul li {list-style-type: none; float: left; margin-left: 45px;
}
.errors{
text-align:center;
color: red;
}
.logo1{
text-align: center;
color: black;
}
	</style>
	<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
</head>
<body>
<c:import url="/WEB-INF/views/include/top.jsp" />
	<div class="main-container">
		<div class="main-wrap">
		<h2 class="logo1">혼사모</h2>
		<form:form action = "login" method ="post" modelAttribute ="user">
		<section class="login-input-section-wrap">
			<div class="login-input-wrap">	
				<input placeholder="아이디" type="text" name="memberid"></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input placeholder="비밀번호" type="password" name="memberpw"></input>
			</div>
			<br><div class="errors">
        <form:errors element="div"/>
        </div>
			<div class="login-button-wrap">
				<button type="submit">로그인</button>
			</div>
			<div class="login-stay-sign-in">
				<ul>
				<li><a target="_blank" href="findidform">아이디찾기</a></li>
				<li><a target="_blank" href="findpwform">비밀번호찾기</a></li>
				<li><a target="_blank" href="joinform">회원가입</a></li>
				</ul>
			</div>
		</section>
		
		</form:form>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>