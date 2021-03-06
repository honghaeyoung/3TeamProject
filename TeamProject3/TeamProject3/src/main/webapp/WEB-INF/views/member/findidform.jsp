<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID</title>
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
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="input_field">
      <div class="logo"><h1>???????????????</h1></div>
<form method="post" class="form-signin" action="findid" name="findform">
		<div class="input_field">
			<label for="name" class="input">?????? </label>&nbsp;&nbsp;
			<input type="text" id="name" name="name" class="input" placeholder="??????" required="required"/>
			<label for="name"></label>
		</div>
		<hr>
		<div class="input_field">
			<label for="email" class="input">?????????</label>&nbsp;
			<input type="email" id="email" name="email" class="input" placeholder="?????????" required="required"/>
			<label for="email"></label>
		</div>

		<div class="input_field">
			<input class="btn"
				type="submit" value="????????? ??????">
		</div>

		<!-- ????????? ???????????? ???????????? ?????? ???-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.name.value = "";
				opener.document.findform.email.value = "";
			</script>
			<label>???????????? ????????? ???????????? ????????????.</label>
		</c:if>

		<!-- ????????? ???????????? ????????? ??? -->
		<c:if test="${check == 0 }">
		<label class="input1">???????????? ????????????' <strong>${memberid}</strong> ' ?????????.</label>
		<div class="form-label-group">
				<button class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" onclick="location.href='loginform'">????????? ?????? ??????</button>
				<button class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" onclick="location.href='findpwform'">???????????? ??????</button>
			</div>
		</c:if>

	</form>
	</div>
</body>
</html>