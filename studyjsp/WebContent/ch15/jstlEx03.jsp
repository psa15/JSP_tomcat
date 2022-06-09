<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header정보</title>
</head>
<body>
	<h3>Header 정보: ch04 folder requestTest2.jsp 파일과 동일한 의미</h3>
	
	<%--
	var: 변수 키워드
	items : 배열 또는 컬렉션 --%>
	<c:forEach var="head" items="${headerValues }">
		<%--headerValues인 header 정보들 중 하나가 head 변수에 들어가는데 키와 값으로 구분 --%>
		<p>param: <c:out value="${head.key}" /></p>
		<p>values:
			<c:forEach var="val" items="${head.value }">
				<c:out value="${val}" />
			</c:forEach>
		</p>
	</c:forEach>
</body>
</html>