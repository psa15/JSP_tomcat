<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request 예제 - 요청 메소드</h2>
	<form method="post" action="requestTest1.jsp">
		<dl>
			<dd>
				<label for="userName">이름</label>
				<input type="text" name="userName" id="userName" autofocus required>
			</dd>
			<dd>
				<label for="age">나이</label>
				<input type="number" name="age" id="age" min="20" max="99" value="20" required>
				<%--value="20" -> 기본값이 20 --%>
			</dd>
			<dd>
				<fieldset>
					<legend>성별</legend>
					<input type="radio" name="gender" id="gender" value="m" checked>
					<label for="gender">남</label>
					<input type="radio" name="gender" id="gender" value="f">
					<label for="gender">여</label>
				</fieldset>
			</dd>
			<dd>
				<label for="hobby">취미</label>
				<select id="hobby" name="hobby" required>
					<option value="탄야">탄야</option>
					<option value="유라헬">유라헬</option>
					<option value="윤명주">윤명주 시청</option>
					<option value="염미정">염미정</option>
				</select>
			</dd>
			<dd>
				<input type="submit" value="전송">
			</dd>
		</dl>
	</form>
</body>
</html>