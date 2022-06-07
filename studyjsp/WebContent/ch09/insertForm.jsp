<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h3>회원가입</h3>
	<form method="post" action="insertPro.jsp">
		<dl>
			<dd>
				<label for="userId">아이디</label>
				<input type="text" name="userId" id="userId" placeholder="user01@abc.com" autofocus required>
			</dd>
			<dd>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" placeholder="비밀번호 입력" required>
			</dd>
			<dd>
				<label for="username">이름</label>
				<input type="text" name="username" id="username" placeholder="이름 입력" required>
			</dd>
			<dd>
				<label for="addr">주소</label>
				<input type="text" name="addr" id="addr" placeholder="주소 입력" required>
			</dd>
			<dd>
				<label for="tel">연락처</label>
				<input type="text" name="tel" id="tel" placeholder="연락처 입력" required>
			</dd>
			<dd>
				<input type="submit" value="전송">
			</dd>
		</dl>
	</form>
</body>
</html>