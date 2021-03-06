<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Password</title>
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

h3 {
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
<form method="post" class="form-signin" action="findpw" name="findform">
		<h1>???????????? ??????</h1>
<div class="input_field">
			<label for="memberid" class="input">?????????</label>
			<input type="text" id="memberid" name="memberid" class="input" placeholder="?????????" required="required"/>
			<label for="memberid"></label>
		</div>
		
		<div class="input_field">
			<label for="name" class="input">??????</label>&nbsp;&nbsp;
			<input type="text" id="name" name="name" class="input" placeholder="??????" required="required"/>
			<label for="name"></label>
		</div>
		
		<div class="input_field">
			<label for="email" class="input">?????????</label>
			<input type="email" id="email" name="email" class="input" placeholder="?????????" required="required"><label for="email"></label>
		</div>

		<div class="input_field">
			<input class="btn"
				type="submit" value="check">
		</div>

		<!-- ????????? ???????????? ?????? ???-->
		<c:if test="${check == 1}">
			<script>
			opener.document.findform.memberid.value = "";
				opener.document.findform.name.value = "";
				opener.document.findform.email.value = "";
			</script>
			<label>???????????? ????????? ???????????? ????????????.</label>
		</c:if>

		<!-- ????????? ??????????????? ?????? ??? ??? -->
		<c:if test="${check == 0 }">
		<div class="input_field">
			<h3>??????????????? ??????????????????.</h3>
		</div>
		<div class="input_field">
		<input type="hidden" id="id" name="updateid" value="${updateid}">
			&nbsp;&nbsp;<label for="password" class="input">????????????</label>
			<input type="password" id="password" name="memberpw" class="input" placeholder="????????????"/>
			<label for="password"></label>&nbsp;&nbsp;
		</div>
		
		<div class="input_field">
			&nbsp;<label for="confirmpassword" class="input">??????????????????</label>
			<input type="password" id="confirmpassword" name="confirmpwd" class="input" placeholder="???????????? ??????"/>
			<label for="confirmpassword"></label>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		
		<div class="input_field">
				<input class="btn"
					type="button" value="???????????? ??????" onclick="updatePassword()">
			</div>
		</c:if>

	</form>
	
	<script type="text/javascript">
		function updatePassword(){
			if(document.findform.memberpw.value==""){
				alert("??????????????? ??????????????????.");
				document.findform.memberpw.focus();
			} else if(document.findform.memberpw.value != document.findform.confirmpwd.value){
				alert("??????????????? ???????????? ????????????.");
				document.findform.confirmpwd.focus();
			} else {
				document.findform.action="updatepw";
				document.findform.submit();
			}
		}
	</script>
</body>
</html>