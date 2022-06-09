<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--코어태그라이브러리 라고 읽음 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 태그예제- set, out, remove</title>
</head>
<body>
	<h3>JSTL Core 태그예제- set, out, remove </h3>
	<p>browser 변수값 설정</p>
	
	<%--변수 선언 : <c:set var="변수이름" value="값"></c:set>--%>
	<c:set var="browser" value="${header['User-Agent']}"></c:set>
	<%--'User-Agent' : header 정보 중 하나. ch04 requestTest2.jsp 브라우저가 사용하고 있는, 정보를 얻어올 수 있음
			request.getHeader(user-agent) 와 같은 의미 --%>
	
	<%--변수 읽기 --%>
	<c:out value="${browser }"></c:out>
	<%--${browser } 가 header['User-Agent'] 값을 읽어 온건데 그걸 out로 출력--%>
	
	<p>browser 변수 값 제거 후</p>
	
	<%--변수 제거 --%>
	<c:remove var="browser"/>
	<c:out value="${browser }" />
	<%--제거 후 출력해서 아무것도 출력 안됨 --%>
</body>
</html>