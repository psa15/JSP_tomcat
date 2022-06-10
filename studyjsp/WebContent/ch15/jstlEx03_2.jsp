<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String[] fruit = {"사과", "배", "딸기", "복숭아"};
	request.setAttribute("menu", fruit); //requestScope영역에 menu 키로 값 저장
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>foreach태그 사용 예제</title>
</head>
<body>
	<h3>foreach태그 사용 예제</h3>
	
	<%--사용법 1 --%>
	<c:forEach var="i" begin="0" end="10" step="2">
		<p><c:out value="${i}" /></p>
	</c:forEach>
	
	<%--사용법 2 --%>
	<c:forEach var="str" items="${menu}"> 
		<%--${requestScope.menu}, 
			items : 배열이나 컬렉션 -> 스프링에서는 자바에서 만든 걸 참조 --%>
		<p><c:out value="${str}" /></p>
	</c:forEach>
	
	<h3>varStatus : count</h3>
	<c:forEach var="str" items="${menu}" varStatus="status"> <%--varStatus:변수의 상태를 체크 --%>
		<c:if test="${status.first}">
			<%--for문이 처음 돌면 --%>
			시작
		</c:if>
		<p> [${status.count}<%--1번부터 --%>] <c:out value="${str}" /></p>
		<c:if test="${status.last }">
			끝
		</c:if>
	</c:forEach>
	
	<h3>varStatus : index</h3>
	<c:forEach var="str" items="${menu}" varStatus="status"> <%--varStatus:변수의 상태 --%>
		<c:if test="${status.first}">
			<%--for문이 처음 돌면 --%>
			시작
		</c:if>
		<p> [${status.index}<%--0번부터 --%>] <c:out value="${str}" /></p>
		<c:if test="${status.last }">
			끝
		</c:if>
	</c:forEach>
</body>
</html>