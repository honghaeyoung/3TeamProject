<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	margin-left: 2%;
	margin-bottom : -2px;
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

.rating {
	display: inline-flex;
	margin-top: -10px;
	margin-left: 8%;
	flex-direction: row-reverse
}

.rating>input {
	display: none
}

.rating>label {
	position: relative;
	width: 28px;
	font-size: 35px;
	color: #ff0000;
	cursor: pointer
}

.rating>label::before {
	content: "\2605";
	position: absolute;
	opacity: 0
}

.rating>label:hover:before, .rating>label:hover ~label:before {
	opacity: 1 !important
}

.rating>input:checked ~label:before {
	opacity: 1
}

.rating:hover>input:checked ~label:before {
	opacity: 0.4
}
/*댓글 목록*/
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
	margin-bottom: 10px;
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

.comments-section .comment .avatar img {
	width: 35px;
	height: 20px;
	border-radius: 50%;
}
.comment-user{
	height : 10px;
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

/* 댓글에별점 나오는거 */
#scorecomment {
margin-left: 3%;
color: #FCDE00;
}

</style>
</head>

<body>

	<div class="main">
		
		<h2>배고픈데 뭐먹지?</h2>
		<hr>
		<!-- 음식점 사진. -->
		<div class="row">

			<div class="column1">
				<div class="content">
					<img src="http://placehold.it/500" alt="음식이미지"
						style="width: 100%; , height: 100%;" class="first">
				</div>
			</div>
			<div class="column2">
				<!-- 밥친구 찾기 form action 넣어야함. -->
				<form method="post" action="">
					<div class="Itemcontent">
						<input type="hidden" name="store_id" value="${dto.storeid}">
						<h3>${dto.storecomm}</h3>
						<p>음식점 명 : ${dto.storename}</p>
						<p>주소 : ${dto.storeaddress}</p>
						<p>1인 가격대 : ${dto.storeprice}</p>
						<p>연락처 : ${dto.storephone}</p>
						<p>평점 : ${dto.storephone}</p>
					</div>
					<!-- hover해서 버튼 반전 줄거임. -->
					<button type="submit" class="btn">밥친구 찾기</button>
					<button type="button" class="btn" onclick="location.href='http://localhost:8080/foodstore'">다른거 먹을래</button>

				</form>
			</div>

			<!-- END GRID -->
		</div>

		<hr>

		<!-- 코멘트 입력창 -->

		<div class="comment-content">
			<div class="text-right cross">
				<i class="fa fa-times mr-2"></i>
			</div>
			<div class="card-body text-center">
				<div class="comment-box text-center">
					<h3 style="margin-left: 9%; font-family: 'Gamja Flower', cursive;">리뷰 쓰기</h3>
					<div class="rating" id="fcscore">
						<input name=“rating” id="e5" type="radio" value="5"><label for="e5" >☆</label><input
							name=“rating” id="e4" type="radio" value="4"><label for="e4">☆</label><input
							name=“rating” id="e3" type="radio" value="3"><label for="e3">☆</label><input
							name=“rating” id="e2" type="radio" value="2"><label for="e2">☆</label><input
							name=“rating id="e1" type="radio" value="1"><label for="e1">☆</label>
					</div>
					<div class="comment-area">
						<textarea class="form-control" id="content" placeholder="진실한 리뷰를 적어주세요"
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
		<!-- 남긴 코멘트 나오는 창 -->
		<c:forEach items="${fcomm}" var="comm">
		<div class="comments-section">
			<div class="comments">
				<div id="comments-container">
					<div class="comment">
						<div class="comment-user">
							<span class="user-details"><span class="username">${comm.memberid}
							</span><span>on </span><span>${comm.fcregdate}</span></span>
							<div id = "scorecomment">
							<!-- 남긴코멘트에 별점 나오게 처리 -->
							<c:if test="${comm.fcscore == 1}">
							<p>★</p>
							</c:if>
							<c:if test="${comm.fcscore == 2}">
							<p>★★</p>
							</c:if>
							<c:if test="${comm.fcscore == 3}">
							<p>★★★</p>
							</c:if>
							<c:if test="${comm.fcscore == 4}">
							<p>★★★★</p>
							</c:if>
							<c:if test="${comm.fcscore == 5}">
							<p>★★★★★</p>
							</c:if>
							</div>
						</div>
						<div class="${comm.fcno}" id="comment-text" style="padding-bottom: 30px;">
							${comm.fccontent}<br> 
							<!-- 코멘트 남긴사람이 접속시에 수정, 삭제 버튼 넣을 위치 -->
							<c:if test="${user.memberid == comm.memberid}">
							<input type="button" id="${comm.fcno}" class="deleteComm" value="삭제">
							<input type="button" id="${comm.fcno}" class="updateComm" value="수정">
						</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
</div>

	<!-- END MAIN -->

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//댓글입력

$(function() {
	$("#insertcomment").click(function() {
		let storeid =${dto.storeid};
		let fccontent=$("#content").val();
		let fcscore = $("#fcscore input[type=radio]:checked").val();
		let memberid='${user.memberid}';
		$.ajax({
			url : '/fcommentInsert',
	        data: "storeid=" +storeid +"&fccontent=" +fccontent +"&memberid=" +memberid +"&fcscore=" +fcscore,
			method : "post"
		}).done(function() {
			location.reload();
		})
	})//insertComm
	$(".deleteComm").click(function() {
		let fcno = $(this).attr("id");
		$.post("/fcdelete", {
			"fcno" : fcno
		}, function() {
			location.reload();
		})
	})//deleteComm
	$(".updateComm").click(function(){
		let fcno = $(this).attr("id");
		$.post("/fcommone",{"fcno":fcno},function(data){
			let sel = "."+fcno;
			$(sel).empty();
			$(sel).append('<div class="rating" id="fcscore1" style="margin-left:-1%;"><input name=“ratingappend” id="s5" type="radio" value="5"><label for="s5" >☆</label><input name=“ratingappend” id="s4" type="radio" value="4"><label for="s4">☆</label><input name=“ratingappend” id="s3" type="radio" value="3"><label for="s3">☆</label><input name=“ratingappend” id="s2" type="radio" value="2"><label for="s2">☆</label><input name=“ratingappend” id="s1" type="radio" value="1"><label for="s1">☆</label></div>');
			$(sel).append('<textarea id="nwpccomment" style="width:450px;" rows="4" value="'+data+'">');
			$(sel).append('<input type="button" id="nw" class="'+fcno+'" value="등록">')
		})
	})
	$(document).on("click",'#nw' ,function(){
		let fcscore = $("#fcscore1 input[type=radio]:checked").val();
		alert(fcscore);
		let fcno = $(this).attr("class");
		let fccontent = $("#nwpccomment").val();
		alert(fccontent);
		$.post("/updatefcomm", {"fcno":fcno, "fccontent":fccontent, "fcscore":fcscore}, function() {
			location.reload();
		})
	})
})//ready


//ready
</script>
</body>
</html>