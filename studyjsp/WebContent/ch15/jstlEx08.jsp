<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL fmt 태그예제 - formatNumber</title>
</head>
<body>
	<h3>JSTL fmt 태그예제 - formatNumber</h3>
	<p>number : <fmt:formatNumber value="12345.678" type="number" /></p>
	<p>currency : <fmt:formatNumber value="12345.678" type="currency" currencySymbol="￦" /></p>
	<p>percent : <fmt:formatNumber value="12345.678" type="percent" /></p>
	<p>pattern : <fmt:formatNumber value="12345.678" type="pattern" pattern=".000" /></p>
</body>
</html>