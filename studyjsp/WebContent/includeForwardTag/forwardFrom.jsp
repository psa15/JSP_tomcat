<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<%
	//request scope에 메모리 생성
	request.setAttribute("id","user01@abc.com"); 
	request.setAttribute("name", "김지원");
%>

forwardFrom.jsp 페이지입니다.<br>
화면에 내용이 표시되지 않음.<br>

<%--<jsp:forward>액션태그에 의해 위의 코드는 의미가 없어짐 --%>
<jsp:forward page="forwardTo.jsp" />