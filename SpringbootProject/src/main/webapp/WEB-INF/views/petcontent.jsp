<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap')
	;

* {
	box-sizing: border-box;
}
/* Center website */
.main {
	max-width: 1000px;
	padding: 10px;
	margin: auto;
}

.Itemcontent {
	margin-left: 2%;
}

.first {
	border-radius: 50%;
}

h2 {
	font-family: 'Gamja Flower', cursive;
	font-size: 40px;
	word-break: break-all;
}

h3 {
	font-family: 'Gamja Flower', cursive;
}

p {
	font-family: 'Gamja Flower', cursive;
}

.row {
	margin: 8px -16px;
}
/* Add padding BETWEEN each column */
.row, .row>.column1 {
	padding: 8px;
}

.row, .row>.column2 {
	padding: 8px;
}
/* Create four equal columns that floats next to each other */
.column1 {
	float: left;
	width: 25%;
}

.column2 {
	float: left;
	width: 75%;
}
/* Clear floats after rows */
.row:after {
	content: "";
	display: table;
	clear: both;
}
/* Content */
.content {
	background-color: white;
	padding: 10px;
}
/* Responsive layout - makes a two column-layout instead of four columns */
@media screen and (max-width: 900px) {
	.column {
		width: 50%;
	}
}
/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.column {
		width: 100%;
	}
}

a {
	text-decoration: none;
}

.btn:active {
	transform: translateY(3px);
}

.btn.blue {
	background-color: #1f75d9;
	border-bottom: 5px solid #165195;
}

.btn.blue:active {
	border-bottom: 2px solid #165195;
}

.btn.red {
	background-color: #ff521e;
	border-bottom: 5px solid #c1370e;
}

.btn.red:active {
	border-bottom: 2px solid #c1370e;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
/* 코멘트 입력 */
a {
	text-decoration: none;
}

.btn {
	font-family: 'Gamja Flower', cursive;
	float: right;
	border: none;
	font-size: 1rem;
	padding: 8px 16px 8px 16px;
	margin: 16px;
	display: inline-block;
	border-radius: 12px;
	transition: all 0.1s;
	text-decoration: none;
	cursor: pointer;
	background-color: black;
	color: white;
}

.btn:hover {
	font-family: 'Gamja Flower', cursive;
	background-color: grey;
	color: white;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.comment-box {
	padding: 5px
}

.comment-area textarea {
	border: 1px solid black;
	width: 85%;
	margin-left: 8%;
	font-family: 'Gamja Flower', cursive;
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #ffffff;
	outline: 0;
	box-shadow: 0 0 0 1px rgb(255, 0, 0) !important;
}

.send {
	color: #fff;
	background-color: #ff0000;
	border-color: #ff0000
}

.send:hover {
	color: #fff;
	background-color: #f50202;
	border-color: #f50202
}

/* 코멘트 목록 */
body {
	font-family: "Lato";
}

.comments-section {
	margin-left: 9%;
	margin-top:2%;
	width: 80%;
}

.comments-section .comments {
	color: black;
}

.comments-section .comment {
	background: #F9FBFC;
	padding: 20px;
	font-size: 15px;
	margin-bottom: 20px;
}

.comments-section .comment blockquote {
	color: #eee;
	padding: 1em;
	border-left: 2px solid #76daff;
	background: rgba(0, 0, 0, 0.05);
}

.comments-section .comment code {
	font-family: Menlo, Monaco, monospace;
	background: rgba(0, 0, 0, 0.2);
	padding: 2px 5px;
	margin: 0 2px;
	border-radius: 2px;
}

.comments-section .comment .box {
	background: #1d1f20;
	padding: 20px;
}

.comments-section .comment .box pre {
	overflow: auto;
	margin: 0;
}

.comments-section .comment .box pre code {
	background: transparent;
}

.comments-section .comment .box+.box {
	padding-top: 0px;
}

.comments-section .comment a {
	color: #76daff;
	text-decoration: none;
}

.comments-section .comment .comment-user {
	border-bottom: 1px solid #555;
	padding: 10px 45px 20px;
	display: flex;
	align-items: center;
}

.comments-section .comment .comment-user .avatar img {
	width: 35px;
	height: 35px;
	border-radius: 50%;
}

.comments-section .comment .comment-user .username {
	color: #76daff;
}

.comments-section .comment .comment-user .user-details {
	color: #666;
	margin-left: 10px;
}

.comments-section .comment .comment-user .user-details span:last-child {
	color: #999;
	font-size: 80%;
}

.comments-section .comment #comment-text {
	padding: 10px 45px 20px;
}
/* comment버튼 */
.updateComm{
	float :right;
	margin-right :1%;
	border : solid grey 0.5px;
	background-color : white;
	height : 30px;
	border-radius:10px;
}

.updateComm:hover{
	border : solid red 0.5px;
	background-color : white;
	color:red;
}

.deleteComm{
	float :right;
	margin-right :1%;
	border : solid grey 0.5px;
	background-color : white;
	height : 30px;
	border-radius:10px;
}
.deleteComm:hover{
	border : solid red 0.5px;
	background-color : white;
	color:red;
}
/* EDITOR STYLE */
</style>
</head>

<body>

	<div class="main">
		<hr>
		<h2>${dto.ptitle}</h2>
		<hr>
		<!-- 음식점 사진. -->
		<div class="row">

			<div class="column1">
				<div class="content">
					<img src="http://placehold.it/500" alt="갱얼지이미지"
						style="width: 100%; , height: 100%;" class="first">
				</div>
			</div>
			<div class="column2">
				<!-- 글수정 넣기. -->
				<form>
					<div class="Itemcontent">
						<input type="hidden" name="store_id" value="${dto.pno}">
						<h3>${dto.ptitle}</h3>
						<p>등록인 : ${dto.memberid}</p>
						<p>반려동물 종류 : ${dto.pkind}</p>
						<p>지역 : ${dto.paddress}</p>
						<p>기간 : ${dto.pperiod} </p>
						<p>희망 비용 : ${dto.pprice}</p>
					</div>
					<c:if test="${user.memberid == dto.memberid }">
					<a class="btn" href="/petcare/update/${dto.pno}">글 수정 </a> 
					<input type="button" id="${dto.pno}" class="btn" value="삭제" onclick="deletepet(${dto.pno})">
					</c:if>
				</form>
			</div>
			<hr>
			<div class="petrequest">
				<h3 style="text-align: center;">${dto.pcontent}</h3>
			</div>
			<hr>

			<!-- END GRID -->
		</div>

		<!-- 코멘트 입력창 -->
		<div class="comment-content" style="margin-top:-3%;">
			<div class="text-right cross">
				<i class="fa fa-times mr-2"></i>
			</div>
			<div class="card-body text-center">
				<div class="comment-box text-center">
					<h3 style="margin-left: 9%; font-family: 'Gamja Flower', cursive;">펫
						시터 신청</h3>
					<div class="comment-area">
						<textarea class="form-control" id="pccontent" placeholder="진실한 리뷰를 적어주세요"
							rows="4"></textarea>
					</div>
					<div class="text-center mt-4">
						<button class="btn btn-success send px-5" id="insertcomment">
							Submit<i class="fa fa-long-arrow-right ml-1"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 코멘트 나오는 창 -->
				<c:forEach items="${pcomm}" var="comm">
		<div class="comments-section">
			<div class="comments">
				<div id="comments-container">
					<div class="comment">
						<div class="comment-user">
							<div class="avatar"></div>
							<span class="user-details"><span class="username">${comm.memberid}
							</span><span>on </span><span>${comm.pcregdate}</span></span>
						</div>
						<div class="${comm.pcno}" id="comment-text" style="padding-bottom: 30px;">
							${comm.pccontent}<br>
							
							<!-- 수정, 삭제 버튼 넣을 위치 -->
							<c:if test="${user.memberid == comm.memberid}">
							<input type="button" id="${comm.pcno}" class="deleteComm" value="삭제">
							<input type="button" id="${comm.pcno}" class="updateComm" value="수정">
						</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>


	<!-- END MAIN -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- 펫케어 댓글 추가 -->
	<script>
	$(function() {
		$("#insertcomment").click(function() {
			let pno =${dto.pno};
			let pccontent = $("#pccontent").val();
			let memberid='${user.memberid}';
			$.ajax({
				url : "/pcommentinsert",
				data: "pno=" +pno +"&pccontent=" +pccontent +"&memberid=" +memberid,
				method : "post"
			}).done(function() {
				location.reload();
			})
		})//insertComm
		
		$(".deleteComm").click(function() {
			let pcno = $(this).attr("id");
			alert(pcno);
			$.post("/pcdelete", {
				"pcno" : pcno
			}, function() {
				location.reload();
			})
		})//deleteComm
		$(".updateComm").click(function(){
			let pcno = $(this).attr("id");
			$.post("/pccommentone",{"pcno":pcno},function(data){
				let sel = "."+pcno;
				$(sel).empty();
				$(sel).append('<textarea id="nwpccomment" style="width:450px;" rows="4" value="'+data+'">');
				$(sel).append('<input type="button" id="nw" class="'+pcno+'" value="등록">')
			})
		})
		$(document).on("click",'#nw' ,function(){
			let pcno = $(this).attr("class");
			let pccontent = $("#nwpccomment").val();
			alert(pccontent);
			$.post("/updatepcomm", {"pcno":pcno, "pccontent":pccontent}, function() {
				location.reload();
			})
		})
	})//ready
	
	</script>
</body>
</html>