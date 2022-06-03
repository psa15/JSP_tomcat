<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//세션 소멸하는 기능
	session.invalidate();
	response.sendRedirect("loginFrom.jsp");
%>