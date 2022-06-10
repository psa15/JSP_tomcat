<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core태그 예제 : forTokens</title>
</head>
<body>
	<h3>JSTL Core태그 예제 : forTokens</h3>
	<c:forTokens var="course" items="자바, 스프링, 오라클, 자바스크립트, HTML5, CSS3" delims=",">
		<%--token: 데이터의 가장 작은 단위
			delims : items(배열) 사이에 있는 구분자 --%>
		<p>skill: <c:out value="${course}" /> </p>
		<%--out태그는 보안적인 이유로 사용(ex. 특수문자가 깨지는 것을 방지(?))  --%>
	</c:forTokens>
</body>
</html>