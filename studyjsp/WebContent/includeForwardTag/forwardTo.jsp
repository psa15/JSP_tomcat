<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//forwardFrom.jsp의 request.setAttribute의 값을 불러올 수 있는지
	String id = (String)request.getAttribute("id"); //id는 object타입인데 String으로 해놔서 오류가 남
	String name = (String) request.getAttribute("name");
%>

forwardTo.jsp 페이지입니다.<br>
아이디: <b><%=id %></b><br>
이름: <b><%=name %></b>