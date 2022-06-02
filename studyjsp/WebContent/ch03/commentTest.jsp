<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주석 예제</title>
</head>
<body>
	<h2> 주석 </h2>
	
	<%
		//자바주석
		String str1 = "소스보기를 하면 화면에 표시됨";
		String str2 = "소스보기를 해도 화면에 표시되지 않음";
	%>
	<!-- html 주석<%=str1 %> -->
	
	<%--<%=str2 %> --%>
</body>
</html>