<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>response 객체 예제 - sendRedirect()메소드의 사용</h2>
	현재 페이지는 <b>responseRedirect.jsp</b>페이지 입니다.
	
	<%
		//페이지 이동 기능으로 앞 10 ~ 11줄의 태그 구문은 화면에 출력되지 않고 
		//"responseReadirected.jsp" 주소로 페이지를 실행결과로 보게 됨
		response.sendRedirect("responseReadirected.jsp");
	%>
</body>
</html>