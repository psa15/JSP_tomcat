<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//방법1)request.getParameter()메소드 사용
	String id = request.getParameter("id");
%>
입력된 아이디: <%=id%> 입니다/