<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getParameterValues()메소드 사용 예제</title>
</head>
<body>
	<h2>getParameterValues()메소드 사용 예제 : 하나의 파라미터로 여러 값을 전송할 때</h2>
	<form method ="post" action="requestGetParameterTest.jsp">
		<select name="color" multiple size="4">
			<option value="red">빨간색</option>
			<option value="blue">파란색</option>
			<option value="yellow">노란색</option>
			<option value="green">초록색</option>
		</select>	
		<br>
		<input type="checkbox" name="sizes" value="12oz">12oz.<br>
		<input type="checkbox" name="sizes" value="16oz">16oz.<br>
		<input type="checkbox" name="sizes" value="22oz">22oz.<br>
		
		<input type="text" name="name"><br>
		<input type="text" name="name"><br>
		<input type="text" name="name"><br>
		
		<input type="submit" value="전송">
	</form>
</body>
</html>