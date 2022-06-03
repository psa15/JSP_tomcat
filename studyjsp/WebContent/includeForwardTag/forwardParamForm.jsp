<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>포워딩 될 페이지에 파라미터값 전달 예제</h2>
	<form method="post" action="forwardParamTo.jsp">
		<dl>
			<dd>
				<label for="name">이름</label>
				<input type="text" name="name" id="name" placeholder="김지원" autofocus required>
			</dd>
			<dd>
				<label for="color">색 선택</label>
				<select id="color" name="color" required>
					<option value="blue" selected>파란색</option>
					<option value="green">초록색</option>
					<option value="red">빨간색</option>
					<option value="yellow">노란색</option>
				</select>
			</dd>
			<dd>
				<input type ="submit" value="확인">
			</dd>
		</dl>
	</form>
</body>
</html>