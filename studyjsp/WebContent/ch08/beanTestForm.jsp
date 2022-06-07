<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request.getParameter()메소드 사용</title>
</head>
<body>
	<form method="post" action="beanTestPro.jsp">
		<dl>
			<dd>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" placebolder="아이디 입력" autofocus required>
			</dd>
			<dd>
				<input type="submit" value="입력완료">
			</dd>
		</dl>
	</form>
</body>
</html>