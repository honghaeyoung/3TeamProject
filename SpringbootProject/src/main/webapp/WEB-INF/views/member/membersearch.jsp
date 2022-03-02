<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����ȸ</title>
<style>
	#mpage {text-align: center;}
	#center {text-align : center;}
</style>
</head>
<body>
<body>

	<div id="center">
		<h1>${msearch}�� �˻��� ����Դϴ�.</h1>
		
		<div align="right">
			<a href="/main">main</a><a href="/memberAll">��ü���</a>
		</div>

		<c:if test="${count != 0 }">
			<table border="1" align="center">
				<tr>
					<th>���̵�</th>
					<th>�̸�</th>
					<th>����ó</th>
					<th>�ּ�</th>
					<th>����</th>
					<th>�������</th>
					<th>�̸���</th>
					<th>pet����</th>
					<th>����/����</th>
				</tr>
				<c:forEach items="${mList}" var="msearch">
					<tr>
						<td>${msearch.memberid}</td>	
						<td>${msearch.name}</td>
						<td>${msearch.phone}</td>
						<td>${msearch.address}</td>
						<td>${msearch.gender}</td>
						<td><fmt:formatDate value="${msearch.birthday}" dateStyle="short"/></td>
						<td>${msearch.email}</td>
						<td>${msearch.pet}</td>
						<td><input type="submit" value="����" id="updatemember">
							<input type="submit" value="����" id="deletemember"></td>
					</tr>
				</c:forEach>
			</table>
			<div id="mpage">
				<c:if test="${begin > pageNum }">
					<a href="msearch?p=${begin-1}&msearch=${msearch}&msearchn=${msearchn}">[����]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="msearch?p=${i}&msearch=${msearch}&msearchn=${msearchn}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="msearch?p=${end+1}&msearch=${msearch}&msearchn=${msearchn}">[����]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	�˻� ���ǿ� �´� ȸ���� �����ϴ�.
</c:if>
<div id="msearch" align="center">
<form action="membersearch">
<select name="msearchn">
<option value="0">���̵�</option>
<option value="1">�̸�</option>
<option value="2">����ó</option>
</select>
<input type="text" name="msearch" size="15" maxlength="50" /> 
<input type="submit" value="�˻�" />
</form>
	</div>
	</div>
</body>
</html>