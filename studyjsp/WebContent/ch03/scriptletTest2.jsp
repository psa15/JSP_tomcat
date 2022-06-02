<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트릿 예제 - 로직 사용</title>
</head>
<body>
	<h2>스크립트릿 예제 - 로직 사용</h2>
	
	<%
		//스크립트릿 -_jspService()메소드 안에 삽입
		int var1 = 6;
	
		if(var1 >5) { //if문이 true였을 때 html 코드를 쓰고 싶다면  % > 를 벗어나야함
	%>
			변수var1의 값은 5보다 크다. <%-- html 태그 --%>
	<% } else { %>
			변수var1의 값은 5보다 작거나 같다. <%-- html 태그 --%>
	<% } %>
	
</body>
</html>