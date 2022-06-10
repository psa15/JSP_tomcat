<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fmt:setLocale value="en"/><%--로케일 효과를 위해 추가한 데이터 --%>
	<fmt:bundle basename="ch15.bundle.testBundle">
		<%--<fmt:bundle basename="파일명(패키지명 포함, 확장자 미포힘"> --%>
		<fmt:message key="name" />
		<fmt:message key="message" var="msg" />
	</fmt:bundle>
	<p> <c:out value="${msg}" /> </p>
</body>
</html>