<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
@import
	url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap')
	;


body {
	margin: 0px;
	padding: 0px;
	font-family: 'Gamja Flower', cursive;
	font-size: 15px;
	background-color: white;
}

#content {
	padding: 20px;
	transition: margin-left 0.6s;
	overflow: hidden;
	width: 90%;
}

.main {
	background-color: black;
	height: 400px;
	width: 400px;
	margin-left: auto;
	margin-right: auto;
	border-radius: 50%;
}

hr {
	width: 85%;
}

.best5 {
	margin-top: 4%;
	text-align: center;
}

.main h1 {
	margin-left: 1%;
	text-align: center;
	font-size: 90px;
	font-family: 'Gamja Flower', cursive;
	font-display: block;
	text-align: center;
	color: white;
}

.row {
	display: flex;
	height: 88%;
	align-items: center;
	margin-left: 6%;
	margin-top: 1%;
	justify-content: center;
}

.column {
	float: right;
	width: 30%;
	height: 30%;
	margin-bottom: 16px;
	flex-basis: 40%;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0.2, 0.2);
	margin: 4px;
	width: 170px;
	height: 180px;
	display: inline-block;
	border-radius: 10px;
	box-sizing: border-box;
	cursor: pointer;
	text-align: center;
	transition: transform 0.5s
}

.img {
	width: 100%;
	height: 120px;
	object-fit: cover;
}

.h5 {
	font-display: block;
}

.card:hover {
	transform: translateY(-10px);
}

#center {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
}

p {
	text-align: center;
}

h1 {
	text-align: center;
	margin-top: 20px;
	padding: 100px 0;
}

table {
	border: 1px solid white;
	width: 87%;
	border-collapse: collapse;
	margin: auto;
	margin-top: 20px;
}

th {
	border: 1px solid white;
	background: grey;
	color: #fff;
	width: 150px;
}

td {
	border: 1px solid white;
}

td, th {
	border: 1px solid #dbdbdb;
	padding: 5px 20px;
	font-size: 12px;
}

a {
	margin: 10px auto;
	color: black;
}

a.top {
	margin-right: 150px;
}

#page {
	text-align: center;
	margin-top: 40px;
}

/*?????????*/
#searchform {
	float: right;
	margin-right: 7%;
	margin-bottom: 0.5%;
	padding: 0px;
}

#searchform fieldset {
	padding: 0px;
	border: none;
	margin: 0px;
}

#searchform select {
	cursor: pointer;
	margin: 0px;
	padding: 0px;
	width: 80px;
	height: 38px;
	line-height: 38px;
	float: left;
	border: none;
}

#searchform input[type="text"] {
	background: #e8e8e8;
	border: none;
	float: left;
	padding: 0px 10px 0px 15px;
	margin: 0px;
	width: 150px;
	height: 38px;
	line-height: 38px;
	transition: all 300ms cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
	-moz-transition: all 300ms cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
	-webkit-transition: all 300ms cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
	-o-transition: all 300ms cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
	color: #585858;
	-moz-transition: all 300ms cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
	-webkit-transition: all 300ms cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
	-o-transition: all 300ms cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
}

#searchform input[type="text"]:hover, #searchform input[type="text"]:focus
	{
	width: 200px;
	outline: none;
}

#searchform input[type="submit"] {
	background-color: black;
	cursor: pointer;
	margin: 0px;
	padding: 0px;
	width: 37px;
	height: 38px;
	line-height: 38px;
}

input[type="submit"] {
	padding: 4px 17px;
	color: black;
	text-transform: uppercase;
	border: none;
	font-size: 20px;
	cursor: pointer;
	margin-top: 10px;
	float: left;
	overflow: visible;
}

#searchform input[type="submit"]:hover {
	background-color: blue;
}

#searchform input[type='submit'] {
	background-color: black;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/include/top.jsp" />
	<div class="main" id="show">
		<h1>
			<b id="food" onclick="foodclick()">????????????<br>??????????
			</b>
		</h1>

	</div>
	<div class="best5">
		<hr>
		<p>???????????? ?????? BEST5</p>
		<hr>
	</div>
	<div class="row">
		<div class="column">
			<div class="card">
				<img
					src="https://windhorsetour.com/sites/default/files/traditional-chinese-food-baiozi.jpg"
					width="100%" height="100px" class="img">
				<h4>??????1</h4>

			</div>

		</div>
		<div class="column">
			<div class="card">
				<img
					src="http://fivediary.com/wp-content/uploads/2018/04/Chinese-Food.jpg"
					width="100%" height="100px" class="img">
				<h4>??????2</h4>

			</div>
		</div>
		<div class="column">
			<div class="card">
				<img
					src="https://dragon-house.ca/wp-content/uploads/2018/05/noodles-625_625x350_41466064269.jpg"
					width="100%" height="100px" class="img">
				<h4>??????3</h4>

			</div>
		</div>
		<div class="column">
			<div class="card">
				<img
					src="https://tse4.mm.bing.net/th?id=OIP.Rrb9n5adB7fwfZsYJ4mxcgHaE9&pid=Api&P=0&w=251&h=169"
					width="100%" height="100px" class="img">
				<h4>??????4</h4>
			</div>
		</div>
		<div class="column">
			<div class="card">
				<img
					src="https://tse2.mm.bing.net/th?id=OIP.djjUqT7s94uM1245lIsz0AHaFN&pid=Api&P=0&w=244&h=173"
					width="100%" height="110px" class="img">
				<h4>??????5</h4>
			</div>
		</div>
	</div>
	<!-- ????????? ????????? + ?????????-->
	<hr>
	<p>???????????? ?????????</p>
	<hr>
	<div id="center">
		<!-- ????????? -->
		<div id="search">
		
			<form id="searchform" action="fsearch">
				<select id="searchoption" name="searchn">
					<option value="2">???????????????</option>
					<option value="0">?????????</option>
					<option value="1">??????</option>
				</select> <input id="search" name="search" type="text" placeholder="???????????????"
					class="text_input" /> <input name="submit" type="submit" value=" "/>
			</form>
		</div>
		<!-- ????????? ????????? -->
		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th colspan="2">????????? ??????</th>
					<th colspan="1">??????</th>
					<th colspan="1">1??? ?????????</th>
					<th colspan="1">??????</th>
				</tr>
				<c:forEach items="${F_list}" var="flist">
				<tr>
						<td colspan="2"><a href="foodstore/content/${flist.storeid}">${flist.storename}</a></td>
						<td colspan="1">${flist.storeaddress}</td>
						<td colspan="1">${flist.storeprice}</td>
						<!-- ??? ????????? ????????? ???????????? ????????????. -->
						<td colspan="1">${flist.storeprice}</td>
					</tr>
					</c:forEach>
				
			</table>
			<div id="page">
				<c:if test="${begin>pageNum }">
					<a href="list?p=${begin-1 }">[??????]</a>
				</c:if>
				<c:forEach begin="${begin}" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end<totalPages }">
					<a href="list?p=${end+1}">[??????]</a>
				</c:if>
			</div>
		</c:if>
		<c:if test="${count == 0}">
			<p>?????? ????????? ?????? ????????????.
			<p>
		</c:if>
	</div>
	<!-- ??????  -->
<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>