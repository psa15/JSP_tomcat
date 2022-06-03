<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>포워딩 하는 페이지 : forwardParamTo.jsp</h2>

<%
	String name = request.getParameter("name");
	String selectedColor = request.getParameter("color");
	
	//"blue" + ".jsp" -> "blue.jsp"
	String selectedPage = selectedColor + ".jsp";
%>

<jsp:forward page="<%=selectedPage %>">
	<jsp:param name="selectedColor" value="<%=selectedColor %>" />
	<jsp:param name="name" value="<%=name %>"/>
</jsp:forward>