<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<%
	String pageName = request.getParameter("pageName"); //includedTest.jsp
%>

포함하는 페이지 includeTest.jsp입니다.<br>

<hr>
<jsp:include page="<%=pageName %>" />
includeTest.jsp의 나머지 내용입니다.