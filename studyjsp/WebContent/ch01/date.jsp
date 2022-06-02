<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date nowDate = new Date();
	
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년MM월dd일");
		
		String formatDate = dateFormat.format(nowDate);
	%>
	<p>오늘 날짜는 <%= formatDate %> 입니다.</p>
</body>
</html>