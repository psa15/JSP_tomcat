<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String name = request.getParameter("name"); //김지원
	String pageName = request.getParameter("pageName"); //includedParamTest.jsp
%>

파라미터 값을 전달받아 실행되는<br>
포함되는 페이지 <%=pageName%> 입니다. <br>
<b><%=name %></b>님이 오셨습니다.
<hr>