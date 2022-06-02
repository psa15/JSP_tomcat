<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Script 예제</title>
</head>
<body>
	<h2>선언문, 스크립트 릿, 표현식의 사용</h2>
	
	<%!
		String str1 = "전역변수 입니다.";
	%>
	<%--같이 써도 됨 --%>
	<%!
		String getStr() { 
		return str1;
	}
	%>
	
	<%
		String str2 = "지역변수 입니다.";
	%>
	
	스크립트에서 선언한 변수 str2는 <%=str2 %> <br> <%-- <%=str2 %>가 표현식 --%>
	선언문에서 선언한 변수 str1은 <%=getStr() %>
	
	
</body>
</html>