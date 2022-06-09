<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 태그예제 - import</title>
</head>
<body>
	<h3>JSTL Core 태그예제 - import</h3>
	<c:import var="url" url="/ch08/registerForm.jsp"></c:import>
	<p>include액션태그와 동일한 기능을 제공, 다른점은 변수 이용 가능</p>
	<%--
	<c:out value="${url}" />
	<c:out> : escape 기능이 적용 ->태그로서 인식하는 것이 아닌 그냥 문자열로 출력
	 --%>
	<c:out value="${url}" escapeXml="false" />
	<%--escape기능 해제 - excapeXml속성의 기본값이 true--%>
	
	<%--브라우저 굵게 출력 --%>
	<h3>테스트</h3>
	<%--<h3>테스트<h3> 태그문법 그대로 출력 escapeXml="true" --%>
	&lt;h3&gt;테스트&lt;/h3&gt;
</body>
</html>