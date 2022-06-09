<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--코어태그라이브러리 라고 읽음 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 태그예제- if, choose, when, otherwise</title>
</head>
<body>
	<h3>JSTL Core 태그예제- if, choose, when, otherwise </h3>
	
	<%--if 문 : else 지원 x -> if문의 반대되는 식으로 사용 --%>
	<c:set var="country" value="${'Korea'}" />
	<c:if test="${country != null }">
		<%--country != null : country에 값이 있다면 / country 변수가 정의가 되어 있으면 --%>
		국가명: <c:out value="${country }" />
	</c:if>
	<c:if test="${country == null }">
		<%--else의 의미 --%>
		국가명: <c:out value="${country }" />
	</c:if> 
	
	<%--다중 if문 --%>
	<c:choose>
		<c:when test="${country == 'Korea'}">
			<p><c:out value="${country}" />의 겨울은 춥다.</p>
		</c:when>
		<c:when test="${country == 'Canada'}">
			<p><c:out value="${country}" />의 겨울은 더 춥다.</p>
		</c:when>
		<c:otherwise>
			<p>그 이외의 나라들의 겨울은 알 수 없다</p>
		</c:otherwise>
	</c:choose>
</body>
</html>