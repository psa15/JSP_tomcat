<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>if-else문 예제 - 좋아하는 색 선택</h2>
	
	<!-- 
		1) method속성 : 데이터 전송(요청)방식
			get : 입력정보가 주소표시줄에 노출이 된다.
			   		전송되는 데이터의 용량이 일반적으로 1024바이트 미만만 가능
			post : 일반적인 폼기반으로 정보를 전송 시 사용된다.
					용량은 상관없이 전송 가능
		2) action : 입력한 정보를 처리하는 서버측의 파일이름
	 -->
	 
	<form method="post" action="ifTest.jsp">
		<dl>
			<dd>
				<label for="name">이름</label>
				<input type = "text" name = "name" id="name" placeholder="이름을 입력하세요." autofocus required>
			</dd>
			<dd>
				<label for="color">색 선택</label>
				<select name ="color" id="color" required>
					<option value="blue" selected>파란색</option>
					<option value = "green"> 초록색</option>
					<option value="red"> 빨강색 </option>
					<option value="yellow">노란색</option>
				</select>
			</dd>
			<dd>
				<input type = "submit" value="확인">
			</dd>
		</dl>
	</form>
</body>
</html>